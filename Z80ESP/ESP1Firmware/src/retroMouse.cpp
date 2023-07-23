#include <Arduino.h>
#include <fabgl.h>
#include "interface.h"
#include "retroMouse.h"

void retroMouse::initialize()
{
    PS2Controller.begin(PS2Preset::MousePort0);
}

void retroMouse::getMouse()
{
    MouseStatus status = PS2Controller.mouse()->getNextStatus(10);
    queueByte(status.buttons.left);
    queueByte(status.buttons.middle);
    queueByte(status.buttons.right);
    queueByte(status.wheelDelta);
    queueByte(getLowByte(status.X));
    queueByte(getHighByte(status.X));
    queueByte(getLowByte(status.Y));
    queueByte(getHighByte(status.Y));
}

int8_t retroMouse::getLowByte(int16_t value)
{
    return value & 255;
}
int8_t retroMouse::getHighByte(int16_t value)
{
    return value >> 8;
}