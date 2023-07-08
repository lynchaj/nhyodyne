#pragma once
#include <Arduino.h>

class serialHelper
{
public:
    void initialize();
    void setBaud(int b);
    void setSerialMode(uint8_t b);
    void serialIn();

private:
    int serialBaud = 115200;
    int serialMode = SERIAL_8N1;
};