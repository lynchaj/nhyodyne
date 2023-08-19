#include <Arduino.h>
#include <fabgl.h>
#include "sound.h"
#include "pins.h"
#include "interface.h"
#include "graphics.h"
#include "serial.h"
#include "sound.h"
#include <esp_int_wdt.h>
#include <esp_task_wdt.h>

// fabgl::VGAController DisplayController;
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
// 12 loadFont waiting for value
// 13 copyRect waiting for value
// 14 drawBitmap waiting for value
// 15 drawChar waiting for value
// 16 drawEllipse waiting for value
// 17 drawGlyph waiting for value
// 18 drawLine waiting for value
// 19 drawRectangle waiting for value
// 20 fillEllipse waiting for value
// 21 fillRectangle waiting for value
// 22 getPixel waiting for value
// 23 invertRectangle waiting for value
// 24 lineTo waiting for value
// 25 moveTo waiting for value
// 26 scroll waiting for value
// 27 setBrushColor waiting for value
// 28 setLineEnds waiting for value
// 29 setPenColor waiting for value
// 30 setPenWidth waiting for value
// 31 setPixel waiting for value
// 32 setGlyphOptions waiting for value
// 33 setPaletteItem waiting for value
// 34 setMouseCursor waiting for value
// 35 setMouseCursorPosition waiting for value
// 36 setSpriteMap waiting for value
// 37 setSpriteLocation waiting for value
// 38 setSpriteVisibility waiting for value

void processOpcode(uint8_t b);
void attachInterruptTask(void *pvParameters);
void forcedReset();

void setup()
{
   // disableCore0WDT();
  //  delay(200); // experienced crashes without this delay!
  //  disableCore1WDT();

    initialize();
    PS2Controller.begin(PS2Preset::KeyboardPort0);

    graphics.initialize(&Terminal);
    serial.initialize();
    sound.initialize(&soundGenerator);

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

    xTaskCreatePinnedToCore(attachInterruptTask, "Attach Interrupt Task", 1000, NULL, 6, NULL, 0);
    popByte();
    popByte();
    popByte();
    popByte();
}

void attachInterruptTask(void *pvParameters)
{

    pinMode(WR, INPUT);
    pinMode(RD, INPUT);
    attachInterrupt(WR, WRISR, FALLING);
    attachInterrupt(RD, RDISR, FALLING);

    while (true)
    {
        delay(500);
    }
    vTaskDelete(NULL);
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
            ESP.restart();
            break;
        case 12: // 12 LOAD FONT  waiting for value
            graphics.loadFont(popByte());
            stateMachine = 0;
            break;
        case 13: // 13 copyRect waiting for value
            if (graphics.copyRect(popByte()))
                stateMachine = 0;
            break;
        case 14: // 14 drawBitmap waiting for value
            if (graphics.drawBitmap(popByte()))
                stateMachine = 0;
            break;
        case 15: // 15 drawChar waiting for value
            if (graphics.drawChar(popByte()))
                stateMachine = 0;
            break;
        case 16: // 16 drawEllipse waiting for value
            if (graphics.drawEllipse(popByte()))
                stateMachine = 0;
            break;
        case 17: // 17 drawGlyph waiting for value
            if (graphics.drawGlyph(popByte()))
                stateMachine = 0;
            break;
        case 18: // 18 drawLine waiting for value
            if (graphics.drawLine(popByte()))
                stateMachine = 0;
            break;
        case 19: // 19 drawRectangle waiting for value
            if (graphics.drawRectangle(popByte()))
                stateMachine = 0;
            break;
        case 20: // 20 fillEllipse waiting for value
            if (graphics.fillEllipse(popByte()))
                stateMachine = 0;
            break;
        case 21: // 21 fillRectangle waiting for value
            if (graphics.fillRectangle(popByte()))
                stateMachine = 0;
            break;
        case 22: // 22 getPixel waiting for value
            if (graphics.getPixel(popByte()))
                stateMachine = 0;
            break;
        case 23: // 23 invertRectangle waiting for value
            if (graphics.invertRectangle(popByte()))
                stateMachine = 0;
            break;
        case 24: // 24 lineTo waiting for value
            if (graphics.lineTo(popByte()))
                stateMachine = 0;
            break;
        case 25: // 25 moveTo waiting for value
            if (graphics.moveTo(popByte()))
                stateMachine = 0;
            break;
        case 26: // 26 scroll waiting for value
            if (graphics.scroll(popByte()))
                stateMachine = 0;
            break;
        case 27: // 27 setBrushColor waiting for value
            graphics.setBrushColor(popByte());
            stateMachine = 0;
            break;
        case 28: // 28 setLineEnds waiting for value
            graphics.setLineEnds(popByte());
            stateMachine = 0;
            break;
        case 29: // 29 setPenColor waiting for value
            graphics.setPenColor(popByte());
            stateMachine = 0;
            break;
        case 30: // 30 setPenWidth waiting for value
            graphics.setPenWidth(popByte());
            stateMachine = 0;
            break;
        case 31: // 31 setPixel waiting for value
            if (graphics.setPixel(popByte()))
                stateMachine = 0;
            break;
        case 32: // setGlyphOptions waiting for value
            if (graphics.setGlyphOptions(popByte()))
                stateMachine = 0;
            break;
        case 33: // setPaletteItem waiting for value
            if (graphics.setPaletteItem(popByte()))
                stateMachine = 0;
            break;
        case 34: // setMouseCursor waiting for value
            graphics.setMouseCursor(popByte());
            stateMachine = 0;
            break;
        case 35: // setMouseCursorPosition waiting for value
            if (graphics.setMouseCursorPosition(popByte()))
                stateMachine = 0;
            break;
        case 36: // setSpriteMap waiting for value
            if (graphics.setSpriteMap(popByte()))
                stateMachine = 0;
            break;
        case 37: // setSpriteLocation waiting for value
            if (graphics.setSpriteLocation(popByte()))
                stateMachine = 0;
            break;
        case 38: // setSpriteVisibility waiting for value
            if (graphics.setSpriteVisibility(popByte()))
                stateMachine = 0;
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
        stateMachine = 13;
        break;
    case 19: // drawBitmap
        graphics.resetPointer();
        stateMachine = 14;
        break;
    case 20: // drawChar
        graphics.resetPointer();
        stateMachine = 15;
        break;
    case 21: // drawEllipse
        graphics.resetPointer();
        stateMachine = 16;
        break;
    case 22: // drawGlyph
        graphics.resetPointer();
        stateMachine = 17;
        break;
    case 23: // drawLine
        graphics.resetPointer();
        stateMachine = 18;
        break;
    case 24: // drawRectangle
        graphics.resetPointer();
        stateMachine = 19;
        break;
    case 25: // fillEllipse
        graphics.resetPointer();
        stateMachine = 20;
        break;
    case 26: // fillRectangle
        graphics.resetPointer();
        stateMachine = 21;
        break;
    case 27: // getPixel
        graphics.resetPointer();
        stateMachine = 22;
        break;
    case 28: // invertRectangle
        graphics.resetPointer();
        stateMachine = 23;
        break;
    case 29: // lineTo
        graphics.resetPointer();
        stateMachine = 24;
        break;
    case 30: // moveTo
        graphics.resetPointer();
        stateMachine = 25;
        break;
    case 31: // scroll
        graphics.resetPointer();
        stateMachine = 26;
        break;
    case 32: // setBrushColor
        stateMachine = 27;
        break;
    case 33: // setLineEnds
        graphics.resetPointer();
        stateMachine = 28;
        break;
    case 34: // setPenColor
        stateMachine = 29;
        break;
    case 35: // setPenWidth
        graphics.resetPointer();
        stateMachine = 30;
        break;
    case 36: // setPixel
        graphics.resetPointer();
        stateMachine = 31;
        break;
    case 37: // setPixelsetGlyphOptions
        graphics.resetPointer();
        stateMachine = 32;
        break;
    case 38: // setPixelsetPaletteItem
        graphics.resetPointer();
        stateMachine = 33;
        break;
    case 39: // setPixelsetMouseCursor
        stateMachine = 34;
        break;
    case 40: // setPixelsetMouseCursorPosition
        graphics.resetPointer();
        stateMachine = 35;
        break;
    case 41: // removeSprites()
        graphics.removeSprites();
        stateMachine = 0;
        break;
    case 42: // setPixelsetSpriteMap
        graphics.resetPointer();
        stateMachine = 36;
        break;
    case 43: // setPixelsetSpriteLocation
        graphics.resetPointer();
        stateMachine = 37;
        break;
    case 44: // setPixelsetSpriteVisibility
        graphics.resetPointer();
        stateMachine = 38;
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
