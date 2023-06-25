#include <fabgl.h>
#include "interface.h"



extern fabgl::Terminal Terminal;

void do_keyboard_in()
{
    if (Terminal.available())
    {
        queuebyte(Terminal.read());
    }
    else
    {
        queuebyte(0);
    }
}
