#include <Arduino.h>
#include <fabgl.h>
#include "sound.h"
#include "pins.h"
#include "interface.h"
#include "graphics.h"
#include "serial.h"
#include "sound.h"

//fabgl::VGAController DisplayController;
fabgl::Terminal Terminal;
fabgl::PS2Controller PS2Controller;
fabgl::SoundGenerator soundGenerator;

retroGraphics graphics;
retroSound sound;
serialHelper serial;

static uint8_t stateMachine = 0;
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
// 12 loadFont  waiting for value
// 13 copyRect  waiting for value

void processOpcode(uint8_t b);

void setup()
{
    disableCore0WDT();
    delay(200); // experienced crashes without this delay!
    disableCore1WDT();


    PS2Controller.begin(PS2Preset::KeyboardPort0);
  //  DisplayController.begin(GPIO_NUM_22, GPIO_NUM_21, GPIO_NUM_19, GPIO_NUM_18, GPIO_NUM_5, GPIO_NUM_4, GPIO_NUM_23, GPIO_NUM_15);
  //  DisplayController.setResolution(VGA_640x480_60Hz);
  //  Terminal.begin(&DisplayController);
  //  Terminal.connectLocally();
  //  Terminal.enableCursor(true);

 //   Terminal.write("\e[40;92m"); // background: black, foreground: green
 //   Terminal.write("\e[2J");     // clear screen
  //  Terminal.write("\e[1;1H");   // move cursor to 1,1

    graphics.initialize( &Terminal);
    serial.initialize();
    sound.initialize(&soundGenerator);

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

    if (!bufferEmpty())
    {
        switch (stateMachine)
        {
        case 0: // 0 waiting for command
            processOpcode(popByte());
            break;
        case 1: // 1 vga term out single char, waiting for char
            Terminal.write(popByte());
            stateMachine = 0;
            break;
        case 2: // 2 vga term out multi, waiting for char
            tb = popByte();
            if (tb == 0)
            {
                stateMachine = 0;
            }
            else
            {
                Terminal.write(tb);
            }
            break;
        case 3: // 3 Set cursor, wait for parameter
            graphics.setCursor(popByte());
            stateMachine = 0;
            break;
        case 4: // 4 Serial Port Baud Rate wait for bytes
            if (bufferLength() > 3)
            {
                serial.setBaud(popDoubleWord());
                stateMachine = 0;
            }
            break;
        case 5: // 5 Serial Port Baud Rate wait for byte of mode
            serial.setSerialMode(popByte());
            stateMachine = 0;
            break;
        case 6: // 6 Serial Port out single char, waiting for char
            Serial.write(popByte());
            stateMachine = 0;
            break;
        case 7: // 7 Serial Port out multi, waiting for char
            tb = popByte();
            if (tb == 0)
            {
                stateMachine = 0;
            }
            else
            {
                Serial.write(tb);
            }
            break;
        case 8: // 8 play audio waiting for char
            tb = popByte();
            sound.play_audio_string(tb);
            if (tb == 0)
            {
                stateMachine = 0;
            }
            break;
        case 9: // 9 play sound waiting for value
            if (sound.play_sound_string(popByte()) == 0)
                stateMachine = 0;
            ;
            break;
        case 10: // 10 set volume waiting for value
            sound.setVolume(popByte());
            stateMachine = 0;
            break;
        case 11: // 11 set resolution waiting for value
            graphics.setGraphicsMode(popByte());
            stateMachine = 0;
            break;
        case 12: // 12 LOAD FONT  waiting for value
            graphics.loadFont(popByte());
            stateMachine = 0;
            break;
        case 13: // 13 copyRect waiting for value
            if(graphics.copyRect(popByte())) stateMachine = 0;
            break;

        }
    }
}

void processOpcode(uint8_t b)
{
    switch (b)
    {
    case 0: // NOP
        stateMachine = 0;
        break;
    case 1: // OUT SINGLE CHAR
        stateMachine = 1;
        break;
    case 2: // OUT NULL TERM STRING
        stateMachine = 2;
        break;
    case 3: // GET KEYBOARD CHAR
        if (Terminal.available())
        {
            queueByte(Terminal.read());
        }
        else
        {
            queueByte(0);
        }
        stateMachine = 0;
        break;
    case 4: // GET KEYBOARD WAITING
        queueByte(Terminal.available());
        stateMachine = 0;
        break;
    case 5: // SET DISPLAY CURSOR
        stateMachine = 3;
        break;
    case 6: // GET SERIAL BAUD
        stateMachine = 4;
        break;
    case 7: // GET SERIAL MODE
        stateMachine = 5;
        break;
    case 8: // OUT SERIAL CHAR
        stateMachine = 6;
        break;
    case 9: // OUT SERIAL NULL TERM STRING
        stateMachine = 7;
        break;
    case 10: // GET SERIAL CHAR
        serial.serialIn();
        stateMachine = 0;
        break;
    case 11: // GET SERIAL WAITING
        queueByte(Serial.available());
        stateMachine = 0;
        break;
    case 12: // GET AUDIO PLAY STRING
        sound.newsong();
        stateMachine = 8;
        break;
    case 13: // PLAY SOUND
        sound.newsong();
        stateMachine = 9;
        break;
    case 14: // SET VOLUME
        stateMachine = 10;
        break;
    case 15: // SET GRAPHICS MODE
        stateMachine = 11;
        break;
    case 16: // LOAD FONT
        stateMachine = 12;
        break;
    case 17: // CLEAR SCREEN
        graphics.clearDisplay();
        break;
    case 18: // copyRect
        graphics.resetPointer();
        stateMachine = 12;
        break;
    case 255: // HARDWARE DISCOVERY
        stateMachine = 0;
        queueByte('E');
        queueByte('S');
        queueByte('P');
        queueByte('3');
        queueByte('2');
        queueByte('V');
        queueByte('1');
        break;
    }
}
