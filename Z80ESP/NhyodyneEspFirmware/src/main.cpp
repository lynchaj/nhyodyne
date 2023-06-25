#include <Arduino.h>
#include <fabgl.h>
#include <HardwareSerial.h>
#include "sound.h"

#define RD 13
#define WR 36
#define OUTCLK 26
#define INCLK 27
#define OUTDATA 16
#define INDATA 17
#define BUSY 14
#define READY 12
#define SPARE 2

fabgl::VGATextController DisplayController;
fabgl::Terminal Terminal;
fabgl::PS2Controller PS2Controller;
extern SoundGenerator soundGenerator;
extern SquareWaveformGenerator swg;

// Setup Brain-dead simple ring buffers.  This should probably include mutexes, but I am going to skip for now.
static volatile uint8_t tx_ring[256];
static volatile uint8_t rx_ring[256];
static volatile uint8_t tx_wpointer = 0;
static volatile uint8_t rx_wpointer = 0;
static volatile uint8_t tx_rpointer = 0;
static volatile uint8_t rx_rpointer = 0;

static char song_buffer[256];
static volatile uint8_t song_pointer = 0;

static volatile uint8_t byte_waiting = 0;
static volatile uint8_t state_machine = 0;

static int serial_baud = 115200;
static int serial_mode = SERIAL_8N1;

// states
// 0 waiting for command
// 1 vga term out single char, waiting for char
// 2 vga term out multi, waiting for char
// 3 Set cursor, wait for parameter
// 4 Serial Port Baud Rate wait for byte 1 of baud
// 5 Serial Port Baud Rate wait for byte 2 of baud
// 6 Serial Port Baud Rate wait for byte 3 of baud
// 7 Serial Port Baud Rate wait for byte of mode
// 8 Serial Port out single char, waiting for char
// 9 Serial Port out multi, waiting for char
// 10 play audio waiting for char
// 11 play sound waiting for value
// 12 set volume waiting for value

void IRAM_ATTR WRISR();
void IRAM_ATTR RDISR();
void sendbyte(uint8_t b);
void queuebyte(uint8_t b);
void process_opcode(uint8_t b);
void do_keyboard_in();
void process_setcursor(uint8_t b);
void process_serial_mode(uint8_t b);
void do_serial_in();
void play_audio_string(uint8_t b);
void play_sound_string(uint8_t b);
int toInt32(uint8_t b0,uint8_t b1,uint8_t b2,uint8_t b3);
int toInt16(uint8_t b0,uint8_t b1);
extern void playSound( playsounddata ps );
extern void play_song(char *m);

void setup()
{
    disableCore0WDT();
    delay(200); // experienced crashes without this delay!
    disableCore1WDT();

    PS2Controller.begin(PS2Preset::KeyboardPort0);

    DisplayController.begin();
    DisplayController.setResolution();

    Terminal.begin(&DisplayController);
    Terminal.connectLocally();
    Terminal.enableCursor(true);

    Terminal.write("\e[40;92m"); // background: black, foreground: green
    Terminal.write("\e[2J");     // clear screen
    Terminal.write("\e[1;1H");   // move cursor to 1,1

    Serial.begin(serial_baud, serial_mode);

    soundGenerator.setVolume(126);
    soundGenerator.play(true);
    soundGenerator.attach(&swg);

    pinMode(WR, INPUT);
    pinMode(RD, INPUT);
    pinMode(OUTCLK, OUTPUT);
    pinMode(INCLK, OUTPUT);
    pinMode(OUTDATA, OUTPUT);
    pinMode(INDATA, INPUT);

    pinMode(BUSY, OUTPUT);
    pinMode(READY, OUTPUT);
    pinMode(SPARE, OUTPUT);

    digitalWrite(INCLK, LOW);

    digitalWrite(OUTCLK, HIGH);
    digitalWrite(OUTDATA, LOW);

    digitalWrite(BUSY, LOW);
    digitalWrite(READY, LOW);
    digitalWrite(SPARE, LOW);

    attachInterrupt(WR, WRISR, FALLING);
    attachInterrupt(RD, RDISR, FALLING);
}

void loop()
{
    int tb = 0;

    if (rx_wpointer != rx_rpointer)
    {
        switch (state_machine)
        {
        case 0:
            process_opcode(rx_ring[rx_rpointer++]);
            break;
        case 1:
            Terminal.write(rx_ring[rx_rpointer++]);
            state_machine = 0;
            break;
        case 2:
            tb = rx_ring[rx_rpointer++];
            if (tb == 0)
            {
                state_machine = 0;
            }
            else
            {
                Terminal.write(tb);
            }
            break;
        case 3:
            process_setcursor(rx_ring[rx_rpointer++]);
            state_machine = 0;
            break;
        case 4:
            serial_baud = (int)rx_ring[rx_rpointer++];
            state_machine = 5;
            break;
        case 5:
            serial_baud += ((int)rx_ring[rx_rpointer++] * 256);
            state_machine = 6;
            break;
        case 6:
            serial_baud += ((int)rx_ring[rx_rpointer++] * 65536);
            Serial.begin(serial_baud, serial_mode);
            state_machine = 0;
            break;
        case 7:
            process_serial_mode(rx_ring[rx_rpointer++]);
            state_machine = 0;
            break;
        case 8:
            Serial.write(rx_ring[rx_rpointer++]);
            state_machine = 0;
            break;
        case 9:
            tb = rx_ring[rx_rpointer++];
            if (tb == 0)
            {
                state_machine = 0;
            }
            else
            {
                Serial.write(tb);
            }
            break;
        case 10:
            play_audio_string(rx_ring[rx_rpointer++]);
            break;
        case 11:
            play_sound_string(rx_ring[rx_rpointer++]);
            break;
        case 12:
            soundGenerator.setVolume(rx_ring[rx_rpointer++]);
            state_machine = 0;
            break;
        }
    }
}

void IRAM_ATTR WRISR()
{
    uint8_t result;
    digitalWrite(BUSY, HIGH);
    for (int x = 0; x < 8; x++)
    {
        digitalWrite(INCLK, LOW);
        result = result << 1;
        result += digitalRead(INDATA);
        digitalWrite(INCLK, HIGH);
    }
    rx_ring[rx_wpointer] = result;
    rx_wpointer++;
    digitalWrite(INCLK, LOW);
    digitalWrite(BUSY, LOW);
}

void IRAM_ATTR RDISR()
{

    if (tx_wpointer != tx_rpointer)
    {
        sendbyte(tx_ring[tx_rpointer++]);
    }
    else
    {
        digitalWrite(READY, LOW);
        byte_waiting = 0;
        sendbyte(0);
    }
}

void sendbyte(uint8_t b)
{
    for (int x = 0; x < 8; x++)
    {
        digitalWrite(OUTDATA, (b & 128));
        digitalWrite(OUTCLK, LOW);
        b = b << 1;
        digitalWrite(OUTCLK, HIGH);
    }
    digitalWrite(OUTCLK, LOW);
    digitalWrite(OUTCLK, HIGH);
}

void queuebyte(uint8_t b)
{
    // if !bytewaiting send, otherwise queue
    if (byte_waiting == 0)
    {
        sendbyte(b);
        byte_waiting = 1;
        digitalWrite(READY, HIGH);
    }
    else
    {
        tx_ring[tx_wpointer++] = b;
    }
}

void process_opcode(uint8_t b)
{
    switch (b)
    {
    case 0: // NOP
        state_machine = 0;
        break;
    case 1: // OUT SINGLE CHAR
        state_machine = 1;
        break;
    case 2: // OUT NULL TERM STRING
        state_machine = 2;
        break;
    case 3: // GET KEYBOARD CHAR
        do_keyboard_in();
        state_machine = 0;
        break;
    case 4: // GET KEYBOARD WAITING
        queuebyte(Terminal.available());
        state_machine = 0;
        break;
    case 5: // SET DISPLAY CURSOR
        state_machine = 3;
        break;
    case 6: // GET SERIAL BAUD
        state_machine = 4;
        break;
    case 7: // GET SERIAL MODE
        state_machine = 7;
        break;
    case 8: // OUT SERIAL CHAR
        state_machine = 8;
        break;
    case 9: // OUT SERIAL NULL TERM STRING
        state_machine = 9;
        break;
    case 10: // GET SERIAL CHAR
        do_serial_in();
        state_machine = 0;
        break;
    case 11: // GET SERIAL WAITING
        queuebyte(Serial.available());
        state_machine = 0;
        break;
    case 12: // GET AUDIO PLAY STRING
        song_pointer = 0;
        state_machine = 10;
        break;
    case 13: // PLAY SOUND
        song_pointer = 0;
        state_machine = 11;
        break;
    case 14: // SET VOLUME
        state_machine = 12;
        break;

    case 255: // HARDWARE DISCOVERY
        state_machine = 0;
        queuebyte('E');
        queuebyte('S');
        queuebyte('P');
        queuebyte('3');
        queuebyte('2');
        break;
    }
}

void do_keyboard_in()
{
    if (Terminal.available())
    {
        queuebyte(Terminal.read());
    }
    else
    {
        queuebyte(0);
    }
}

void process_setcursor(uint8_t b)
{
    if (b == 0)
    {
        Terminal.enableCursor(false);
    }
    else
    {
        Terminal.enableCursor(true);
    }
}

void process_serial_mode(uint8_t b)
{
    switch (b)
    {
    case 0:
        serial_mode = SERIAL_8N1;
        break;
    case 1:
        serial_mode = SERIAL_8E1;
        break;
    case 2:
        serial_mode = SERIAL_8O1;
        break;
    case 3:
        serial_mode = SERIAL_7N1;
        break;
    case 4:
        serial_mode = SERIAL_7E1;
        break;
    case 5:
        serial_mode = SERIAL_7O1;
        break;
    default:
        serial_mode = SERIAL_8N1;
        break;
    }
}

void do_serial_in()
{
    if (Serial.available())
    {
        queuebyte(Serial.read());
    }
    else
    {
        queuebyte(0);
    }
}

void play_audio_string(uint8_t b)
{

    if (b == 0)
    {
        song_buffer[song_pointer++] = b;
        play_song((char *)&song_buffer);
        state_machine = 0;
    }
    else
    {
        song_buffer[song_pointer++] = b;
    }
}

void play_sound_string(uint8_t b)
{
    if (song_pointer < 23)
    {
        song_buffer[song_pointer++] = b;
    }
    else
    {
        song_buffer[song_pointer++] = b;

        playsounddata sd;
        sd.attack=toInt32(song_buffer[0],song_buffer[1],song_buffer[2],song_buffer[3]);  // time in millis
        sd.decay=toInt32(song_buffer[4],song_buffer[5],song_buffer[6],song_buffer[7]);   // time in millis
        sd.sustain=toInt16(song_buffer[8],song_buffer[9]); // 0-127 range (over volume)
        sd.release=toInt32(song_buffer[10],song_buffer[11],song_buffer[12],song_buffer[13]);; // time in millis
        sd.wave=(wavetype)song_buffer[14];    // square, sine, triangle, saw, noise
        sd.volume=toInt16(song_buffer[15],song_buffer[16]);;
        sd.durationms=toInt16(song_buffer[17],song_buffer[18]);;
        sd.freq_start=toInt16(song_buffer[19],song_buffer[20]);;
        sd.freq_end=toInt16(song_buffer[21],song_buffer[22]);;
        sd.modfreq=(modfreqmode)song_buffer[23];
        playSound(sd);
        state_machine = 0;
    }
}

int toInt32(uint8_t b0,uint8_t b1,uint8_t b2,uint8_t b3)
{
    return b0+((int)b1*256)+((int)b2*65535)+((int)b3*16776960);
}
int toInt16(uint8_t b0,uint8_t b1)
{
    return b0+((int)b1*256);
}
