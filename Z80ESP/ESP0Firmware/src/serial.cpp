#include <Arduino.h>
#include "interface.h"
#include "serial.h"



void serialHelper::setBaud(int b)
{
    serialBaud =b;
    Serial.begin(serialBaud, serialMode);
}

void serialHelper::initialize()
{
    Serial.begin(serialBaud, serialMode);
}

void serialHelper::setSerialMode(uint8_t b)
{
    switch (b)
    {
    case 0:
        serialMode = SERIAL_8N1;
        break;
    case 1:
        serialMode = SERIAL_8E1;
        break;
    case 2:
        serialMode = SERIAL_8O1;
        break;
    case 3:
        serialMode = SERIAL_7N1;
        break;
    case 4:
        serialMode = SERIAL_7E1;
        break;
    case 5:
        serialMode = SERIAL_7O1;
        break;
    default:
        serialMode = SERIAL_8N1;
        break;
    }
     Serial.begin(serialBaud, serialMode);
}

void serialHelper::serialIn()
{
    if (Serial.available())
    {
        queueByte(Serial.read());
    }
    else
    {
        queueByte(0);
    }
}
