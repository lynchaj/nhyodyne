#include <Arduino.h>
#include "interface.h"


static int serial_baud = 115200;
static int serial_mode = SERIAL_8N1;

void setbaud(int b)
{
    serial_baud =b;
    Serial.begin(serial_baud, serial_mode);
}

void initserial()
{
    Serial.begin(serial_baud, serial_mode);
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
        queueByte(Serial.read());
    }
    else
    {
        queueByte(0);
    }
}
