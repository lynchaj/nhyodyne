#include <Arduino.h>
#include <fabgl.h>
#include "sound.h"
#include "pins.h"
#include "interface.h"
#include "ps2.h"
#include "graphics.h"
#include "serial.h"

fabgl::VGAController DisplayController;
fabgl::Terminal Terminal;
fabgl::PS2Controller PS2Controller;

static uint8_t state_machine = 0;
// states
// 0 waiting for command
// 1 vga term out single char, waiting for char
// 2 vga term out multi, waiting for char
// 3 Set cursor, wait for parameter
// 4 Serial Port Baud Rate wait for bytes
// 5 Serial Port Baud Rate wait for byte of mode
// 6 Serial Port out single char, waiting for char
// 7 Serial Port out multi, waiting for char
// 8 play audio waiting for char
// 9 play sound waiting for value
// 10 set volume waiting for value
// 11 set resolution waiting for value
// 12 LOAD FONT  waiting for value

void process_opcode(uint8_t b);

void setup()
{
    disableCore0WDT();
    delay(200); // experienced crashes without this delay!
    disableCore1WDT();

    PS2Controller.begin(PS2Preset::KeyboardPort0);
    DisplayController.begin(GPIO_NUM_22, GPIO_NUM_21, GPIO_NUM_19, GPIO_NUM_18, GPIO_NUM_5, GPIO_NUM_4, GPIO_NUM_23, GPIO_NUM_15);
    DisplayController.setResolution(VGA_640x480_60Hz);
    Terminal.begin(&DisplayController);
    Terminal.connectLocally();
    Terminal.enableCursor(true);

    Terminal.write("\e[40;92m"); // background: black, foreground: green
    Terminal.write("\e[2J");     // clear screen
    Terminal.write("\e[1;1H");   // move cursor to 1,1

    initserial();
    soundgeneratorinit();

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

    if (!bufferempty())
    {
        switch (state_machine)
        {
        case 0: // 0 waiting for command
            process_opcode(popbyte());
            break;
        case 1: // 1 vga term out single char, waiting for char
            Terminal.write(popbyte());
            state_machine = 0;
            break;
        case 2: // 2 vga term out multi, waiting for char
            tb = popbyte();
            if (tb == 0)
            {
                state_machine = 0;
            }
            else
            {
                Terminal.write(tb);
            }
            break;
        case 3: // 3 Set cursor, wait for parameter
            process_setcursor(popbyte());
            state_machine = 0;
            break;
        case 4: // 4 Serial Port Baud Rate wait for bytes
            if (setbaud(popbyte()) == 0)
                state_machine = 0;
            break;
        case 5: // 5 Serial Port Baud Rate wait for byte of mode
            process_serial_mode(popbyte());
            state_machine = 0;
            break;
        case 6: // 6 Serial Port out single char, waiting for char
            Serial.write(popbyte());
            state_machine = 0;
            break;
        case 7: // 7 Serial Port out multi, waiting for char
            tb = popbyte();
            if (tb == 0)
            {
                state_machine = 0;
            }
            else
            {
                Serial.write(tb);
            }
            break;
        case 8: // 8 play audio waiting for char
            tb = popbyte();
            play_audio_string(tb);
            if (tb == 0)
            {
                state_machine = 0;
            }
            break;
        case 9: // 9 play sound waiting for value
            if (play_sound_string(popbyte()) == 0)
                state_machine = 0;
            ;
            break;
        case 10: // 10 set volume waiting for value
            setVolume(popbyte());
            state_machine = 0;
            break;
        case 11: // 11 set resolution waiting for value
            set_graphics_mode(popbyte());
            state_machine = 0;
            break;
        case 12: // 12 LOAD FONT  waiting for value
            load_font(popbyte());
            state_machine = 0;
            break;
        }
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
        clearbaud();
        state_machine = 4;
        break;
    case 7: // GET SERIAL MODE
        state_machine = 5;
        break;
    case 8: // OUT SERIAL CHAR
        state_machine = 6;
        break;
    case 9: // OUT SERIAL NULL TERM STRING
        state_machine = 7;
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
        newsong();
        state_machine = 8;
        break;
    case 13: // PLAY SOUND
        newsong();
        state_machine = 9;
        break;
    case 14: // SET VOLUME
        state_machine = 10;
        break;
    case 15: // SET GRAPHICS MODE
        state_machine = 11;
        break;
    case 16: // LOAD FONT
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
