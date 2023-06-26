#include <fabgl.h>
#include "interface.h"



extern fabgl::Terminal Terminal;

void do_keyboard_in()
{
    if (Terminal.available())
    {
        queueByte(Terminal.read());
    }
    else
    {
        queueByte(0);
    }
}
