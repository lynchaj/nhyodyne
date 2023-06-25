#include <fabgl.h>

extern fabgl::VGAController DisplayController;
extern fabgl::Terminal Terminal;

static const fabgl::FontInfo * FONTS_INFO[] = {  &fabgl::FONT_4x6, &fabgl::FONT_5x7, &fabgl::FONT_5x8, &fabgl::FONT_6x8, &fabgl::FONT_6x9,
                                               &fabgl::FONT_6x10, &fabgl::FONT_6x12, &fabgl::FONT_6x13, &fabgl::FONT_7x13, &fabgl::FONT_7x14, &fabgl::FONT_8x8,
                                               &fabgl::FONT_8x9, &fabgl::FONT_8x13, &fabgl::FONT_8x14, &fabgl::FONT_8x16, &fabgl::FONT_8x19, &fabgl::FONT_9x15,
                                               &fabgl::FONT_9x18, &fabgl::FONT_10x20, &fabgl::FONT_BIGSERIF_8x14, &fabgl::FONT_BIGSERIF_8x16, &fabgl::FONT_BLOCK_8x14,
                                               &fabgl::FONT_BROADWAY_8x14, &fabgl::FONT_COMPUTER_8x14, &fabgl::FONT_COURIER_8x14,
                                               &fabgl::FONT_LCD_8x14, &fabgl::FONT_OLDENGL_8x16, &fabgl::FONT_SANSERIF_8x14, &fabgl::FONT_SANSERIF_8x16,
                                               &fabgl::FONT_SLANT_8x14, &fabgl::FONT_WIGGLY_8x16};

void set_graphics_mode(uint8_t b)
{
    switch (b)
    {
    case 0:
        DisplayController.setResolution(VGA_320x200_70Hz);
        break;
    case 1:
        DisplayController.setResolution(VGA_320x200_75Hz);
        break;
    case 2:
        DisplayController.setResolution(VGA_320x200_75HzRetro);
        break;
    case 3:
        DisplayController.setResolution(QVGA_320x240_60Hz);
        break;
    case 4:
        DisplayController.setResolution(VGA_400x300_60Hz);
        break;
    case 5:
        DisplayController.setResolution(VGA_480x300_75Hz);
        break;
    case 6:
        DisplayController.setResolution(VGA_512x192_60Hz);
        break;
    case 7:
        DisplayController.setResolution(VGA_512x384_60Hz);
        break;
    case 8:
        DisplayController.setResolution(VGA_512x448_60Hz);
        break;
    case 9:
        DisplayController.setResolution(VGA_512x512_58Hz);
        break;
    case 10:
        DisplayController.setResolution(VGA_640x200_60HzD);
        break;
    case 11:
        DisplayController.setResolution(VGA_640x200_70Hz);
        break;
    case 12:
        DisplayController.setResolution(VGA_640x200_70HzRetro);
        break;
    case 13:
        DisplayController.setResolution(VGA_640x240_60Hz);
        break;
    case 14:
        DisplayController.setResolution(VGA_640x350_70Hz);
        break;
    case 15:
        DisplayController.setResolution(VGA_640x350_70HzAlt1);
        break;
    case 16:
        DisplayController.setResolution(VESA_640x350_85Hz);
        break;
    case 17:
        DisplayController.setResolution(VGA_640x382_60Hz);
        break;
    case 18:
        DisplayController.setResolution(VGA_640x384_60Hz);
        break;
    case 19:
        DisplayController.setResolution(VGA_640x400_70Hz);
        break;
    case 20:
        DisplayController.setResolution(VGA_640x400_60Hz);
        break;
    case 21:
        DisplayController.setResolution(VGA_640x480_60Hz);
        break;
    case 22:
        DisplayController.setResolution(VGA_640x480_60HzAlt1);
        break;
    case 23:
        DisplayController.setResolution(VGA_640x480_60HzD);
        break;
    case 24:
        DisplayController.setResolution(VGA_640x480_73Hz);
        break;
    case 25:
        DisplayController.setResolution(VESA_640x480_75Hz);
        break;
    case 26:
        DisplayController.setResolution(VGA_720x348_50HzD);
        break;
    case 27:
        DisplayController.setResolution(VGA_720x348_59HzD);
        break;
    case 28:
        DisplayController.setResolution(VGA_720x348_73Hz);
        break;
    case 29:
        DisplayController.setResolution(VGA_720x350_70Hz);
        break;
    case 30:
        DisplayController.setResolution(VGA_720x400_70Hz);
        break;
    case 31:
        DisplayController.setResolution(VESA_720x400_85Hz);
        break;
    case 32:
        DisplayController.setResolution(PAL_720x576_50Hz);
        break;
    case 33:
        DisplayController.setResolution(VESA_768x576_60Hz);
        break;
    case 34:
        DisplayController.setResolution(SVGA_800x300_60Hz);
        break;
    case 35:
        DisplayController.setResolution(SVGA_800x600_56Hz);
        break;
    case 36:
        DisplayController.setResolution(SVGA_800x600_60Hz);
        break;
    case 37:
        DisplayController.setResolution(SVGA_960x540_60Hz);
        break;
    case 38:
        DisplayController.setResolution(SVGA_1024x768_60Hz);
        break;
    case 39:
        DisplayController.setResolution(SVGA_1024x768_70Hz);
        break;
    case 40:
        DisplayController.setResolution(SVGA_1024x768_75Hz);
        break;
    case 41:
        DisplayController.setResolution(SVGA_1280x600_60Hz);
        break;
    case 42:
        DisplayController.setResolution(SVGA_1280x720_60Hz);
        break;
    case 43:
        DisplayController.setResolution(SVGA_1280x720_60HzAlt1);
        break;
    case 44:
        DisplayController.setResolution(SVGA_1280x768_50Hz);
        break;
    default:
        DisplayController.setResolution(VGA_640x480_60Hz);
    }
}

void load_font(uint8_t b)
{
    Terminal.loadFont(FONTS_INFO[b]);
}