#include <Arduino.h>
#include "interface.h"


static int serial_baud = 115200;
static int serial_mode = SERIAL_8N1;

static int baud_state = 1;

void clearbaud()
{
    baud_state = 1;
    serial_baud =0;
}

int setbaud(uint8_t b)
{
    serial_baud += ((int)popbyte() * baud_state);

    if(baud_state==65536)
    {
        baud_state = 1;
        return 0;
    }
    else
    {
        baud_state=baud_state*256;
    }
    return 1;
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
        queuebyte(Serial.read());
    }
    else
    {
        queuebyte(0);
    }
}
