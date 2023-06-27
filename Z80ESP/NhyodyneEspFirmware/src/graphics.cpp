#include <fabgl.h>
#include "pins.h"
#include "graphics.h"

void retroGraphics::initialize(fabgl::Terminal *Terminal)
{
    m_Terminal = Terminal;
    static fabgl::VGA16Controller Display16Controller;
    m_Display = &Display16Controller;
    Display16Controller.begin(RED1, RED0, GREEN1, GREEN0, BLUE1, BLUE0, HSYNC, VSYNC);
    Display16Controller.setResolution(VGA_640x480_60Hz);
    m_Terminal->begin(&Display16Controller);
    m_Terminal->connectLocally();
    m_Terminal->enableCursor(true);
    m_Terminal->write("\e[40;32m"); // background: black, foreground: green
    m_Terminal->write("\e[2J");     // clear screen
    m_Terminal->write("\e[1;1H");   // move cursor to 1,1
    buffer = new uint8_t [32768];
    currentPointer=buffer;
}

void retroGraphics::setGraphicsMode(uint8_t b)
{
    switch (b)
    {
    case 0:
        m_Display->setResolution(VGA_320x200_70Hz);
        break;
    case 1:
        m_Display->setResolution(VGA_320x200_75Hz);
        break;
    case 2:
        m_Display->setResolution(VGA_320x200_75HzRetro);
        break;
    case 3:
        m_Display->setResolution(QVGA_320x240_60Hz);
        break;
    case 4:
        m_Display->setResolution(VGA_400x300_60Hz);
        break;
    case 5:
        m_Display->setResolution(VGA_480x300_75Hz);
        break;
    case 6:
        m_Display->setResolution(VGA_512x192_60Hz);
        break;
    case 7:
        m_Display->setResolution(VGA_512x384_60Hz);
        break;
    case 8:
        m_Display->setResolution(VGA_512x448_60Hz);
        break;
    case 9:
        m_Display->setResolution(VGA_512x512_58Hz);
        break;
    case 10:
        m_Display->setResolution(VGA_640x200_60HzD);
        break;
    case 11:
        m_Display->setResolution(VGA_640x200_70Hz);
        break;
    case 12:
        m_Display->setResolution(VGA_640x200_70HzRetro);
        break;
    case 13:
        m_Display->setResolution(VGA_640x240_60Hz);
        break;
    case 14:
        m_Display->setResolution(VGA_640x350_70Hz);
        break;
    case 15:
        m_Display->setResolution(VGA_640x350_70HzAlt1);
        break;
    case 16:
        m_Display->setResolution(VESA_640x350_85Hz);
        break;
    case 17:
        m_Display->setResolution(VGA_640x382_60Hz);
        break;
    case 18:
        m_Display->setResolution(VGA_640x384_60Hz);
        break;
    case 19:
        m_Display->setResolution(VGA_640x400_70Hz);
        break;
    case 20:
        m_Display->setResolution(VGA_640x400_60Hz);
        break;
    case 21:
        m_Display->setResolution(VGA_640x480_60Hz);
        break;
    case 22:
        m_Display->setResolution(VGA_640x480_60HzAlt1);
        break;
    case 23:
        m_Display->setResolution(VGA_640x480_60HzD);
        break;
    case 24:
        m_Display->setResolution(VGA_640x480_73Hz);
        break;
    case 25:
        m_Display->setResolution(VESA_640x480_75Hz);
        break;
    case 26:
        m_Display->setResolution(VGA_720x348_50HzD);
        break;
    case 27:
        m_Display->setResolution(VGA_720x348_59HzD);
        break;
    case 28:
        m_Display->setResolution(VGA_720x348_73Hz);
        break;
    case 29:
        m_Display->setResolution(VGA_720x350_70Hz);
        break;
    case 30:
        m_Display->setResolution(VGA_720x400_70Hz);
        break;
    case 31:
        m_Display->setResolution(VESA_720x400_85Hz);
        break;
    case 32:
        m_Display->setResolution(PAL_720x576_50Hz);
        break;
    case 33:
        m_Display->setResolution(VESA_768x576_60Hz);
        break;
    case 34:
        m_Display->setResolution(SVGA_800x300_60Hz);
        break;
    case 35:
        m_Display->setResolution(SVGA_800x600_56Hz);
        break;
    case 36:
        m_Display->setResolution(SVGA_800x600_60Hz);
        break;
    case 37:
        m_Display->setResolution(SVGA_960x540_60Hz);
        break;
    case 38:
        m_Display->setResolution(SVGA_1024x768_60Hz);
        break;
    case 39:
        m_Display->setResolution(SVGA_1024x768_70Hz);
        break;
    case 40:
        m_Display->setResolution(SVGA_1024x768_75Hz);
        break;
    case 41:
        m_Display->setResolution(SVGA_1280x600_60Hz);
        break;
    case 42:
        m_Display->setResolution(SVGA_1280x720_60Hz);
        break;
    case 43:
        m_Display->setResolution(SVGA_1280x720_60HzAlt1);
        break;
    case 44:
        m_Display->setResolution(SVGA_1280x768_50Hz);
        break;
    default:
        m_Display->setResolution(VGA_640x480_60Hz);
    }
}

void retroGraphics::loadFont(uint8_t b)
{
    m_Terminal->loadFont(FONTS_INFO[b]);
}

void retroGraphics::setCursor(uint8_t b)
{
    if (b == 0)
    {
        m_Terminal->enableCursor(false);
    }
    else
    {
        m_Terminal->enableCursor(true);
    }
}

void retroGraphics::clearDisplay()
{
    m_Terminal->canvas()->clear();
}

void retroGraphics::resetPointer()
{
    currentPointer=buffer;
}

bool retroGraphics::copyRect(uint8_t b)
{
    *currentPointer++=b;
    printf("dbg->%u\n\r",(currentPointer-buffer));
    if((currentPointer-buffer)==sizeof(copyRectParameter))
    {
        copyRectParameter  * p;
        p=(copyRectParameter *)buffer;
        printf("dbg1->%u %u %u %u %u %u\n\r",p->sourceX,p->sourceY,p->destX,p->destY,p->width,p->height);
        m_Terminal->canvas()->copyRect(p->sourceX,p->sourceY,p->destX,p->destY,p->width,p->height);
        return true;
    }
    return false;
}
