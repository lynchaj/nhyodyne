#pragma once
#include <Arduino.h>
#include <fabgl.h>

class retroMouse
{
public:
    void getMouse();
    void initialize();

private:
    fabgl::PS2Controller PS2Controller;

    int8_t getLowByte(int16_t value);
    int8_t getHighByte(int16_t value);
};