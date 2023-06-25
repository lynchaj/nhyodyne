#include <fabgl.h>
#include "graphics.h"


void retroGraphics::initialize(fabgl::VGAController *DisplayController,fabgl::Terminal *Terminal)
{
    m_DisplayController=DisplayController;
    m_Terminal=Terminal;
}


void retroGraphics::set_graphics_mode(uint8_t b)
{
    switch (b)
    {
    case 0:
        m_DisplayController->setResolution(VGA_320x200_70Hz);
        break;
    case 1:
        m_DisplayController->setResolution(VGA_320x200_75Hz);
        break;
    case 2:
        m_DisplayController->setResolution(VGA_320x200_75HzRetro);
        break;
    case 3:
        m_DisplayController->setResolution(QVGA_320x240_60Hz);
        break;
    case 4:
        m_DisplayController->setResolution(VGA_400x300_60Hz);
        break;
    case 5:
        m_DisplayController->setResolution(VGA_480x300_75Hz);
        break;
    case 6:
        m_DisplayController->setResolution(VGA_512x192_60Hz);
        break;
    case 7:
        m_DisplayController->setResolution(VGA_512x384_60Hz);
        break;
    case 8:
        m_DisplayController->setResolution(VGA_512x448_60Hz);
        break;
    case 9:
        m_DisplayController->setResolution(VGA_512x512_58Hz);
        break;
    case 10:
        m_DisplayController->setResolution(VGA_640x200_60HzD);
        break;
    case 11:
        m_DisplayController->setResolution(VGA_640x200_70Hz);
        break;
    case 12:
        m_DisplayController->setResolution(VGA_640x200_70HzRetro);
        break;
    case 13:
        m_DisplayController->setResolution(VGA_640x240_60Hz);
        break;
    case 14:
        m_DisplayController->setResolution(VGA_640x350_70Hz);
        break;
    case 15:
        m_DisplayController->setResolution(VGA_640x350_70HzAlt1);
        break;
    case 16:
        m_DisplayController->setResolution(VESA_640x350_85Hz);
        break;
    case 17:
        m_DisplayController->setResolution(VGA_640x382_60Hz);
        break;
    case 18:
        m_DisplayController->setResolution(VGA_640x384_60Hz);
        break;
    case 19:
        m_DisplayController->setResolution(VGA_640x400_70Hz);
        break;
    case 20:
        m_DisplayController->setResolution(VGA_640x400_60Hz);
        break;
    case 21:
        m_DisplayController->setResolution(VGA_640x480_60Hz);
        break;
    case 22:
        m_DisplayController->setResolution(VGA_640x480_60HzAlt1);
        break;
    case 23:
        m_DisplayController->setResolution(VGA_640x480_60HzD);
        break;
    case 24:
        m_DisplayController->setResolution(VGA_640x480_73Hz);
        break;
    case 25:
        m_DisplayController->setResolution(VESA_640x480_75Hz);
        break;
    case 26:
        m_DisplayController->setResolution(VGA_720x348_50HzD);
        break;
    case 27:
        m_DisplayController->setResolution(VGA_720x348_59HzD);
        break;
    case 28:
        m_DisplayController->setResolution(VGA_720x348_73Hz);
        break;
    case 29:
        m_DisplayController->setResolution(VGA_720x350_70Hz);
        break;
    case 30:
        m_DisplayController->setResolution(VGA_720x400_70Hz);
        break;
    case 31:
        m_DisplayController->setResolution(VESA_720x400_85Hz);
        break;
    case 32:
        m_DisplayController->setResolution(PAL_720x576_50Hz);
        break;
    case 33:
        m_DisplayController->setResolution(VESA_768x576_60Hz);
        break;
    case 34:
        m_DisplayController->setResolution(SVGA_800x300_60Hz);
        break;
    case 35:
        m_DisplayController->setResolution(SVGA_800x600_56Hz);
        break;
    case 36:
        m_DisplayController->setResolution(SVGA_800x600_60Hz);
        break;
    case 37:
        m_DisplayController->setResolution(SVGA_960x540_60Hz);
        break;
    case 38:
        m_DisplayController->setResolution(SVGA_1024x768_60Hz);
        break;
    case 39:
        m_DisplayController->setResolution(SVGA_1024x768_70Hz);
        break;
    case 40:
        m_DisplayController->setResolution(SVGA_1024x768_75Hz);
        break;
    case 41:
        m_DisplayController->setResolution(SVGA_1280x600_60Hz);
        break;
    case 42:
        m_DisplayController->setResolution(SVGA_1280x720_60Hz);
        break;
    case 43:
        m_DisplayController->setResolution(SVGA_1280x720_60HzAlt1);
        break;
    case 44:
        m_DisplayController->setResolution(SVGA_1280x768_50Hz);
        break;
    default:
        m_DisplayController->setResolution(VGA_640x480_60Hz);
    }
}

void retroGraphics::load_font(uint8_t b)
{
    m_Terminal->loadFont(FONTS_INFO[b]);
}

void retroGraphics::process_setcursor(uint8_t b)
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

void retroGraphics::cleardisplay()
{
    m_Terminal->canvas()->clear();
}
