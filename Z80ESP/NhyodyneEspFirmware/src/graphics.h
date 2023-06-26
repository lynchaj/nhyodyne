#pragma once

#include <Arduino.h>

class retroGraphics
{
public:
    void set_graphics_mode(uint8_t b);
    void load_font(uint8_t b);
    void process_setcursor(uint8_t b);
    void cleardisplay();
    void initialize(fabgl::VGAController *DisplayController, fabgl::Terminal *Terminal);

private:
    fabgl::VGAController *m_DisplayController;
    fabgl::Terminal *m_Terminal;

    const fabgl::FontInfo *FONTS_INFO[31] = {&fabgl::FONT_4x6, &fabgl::FONT_5x7, &fabgl::FONT_5x8, &fabgl::FONT_6x8, &fabgl::FONT_6x9,
                                             &fabgl::FONT_6x10, &fabgl::FONT_6x12, &fabgl::FONT_6x13, &fabgl::FONT_7x13, &fabgl::FONT_7x14, &fabgl::FONT_8x8,
                                             &fabgl::FONT_8x9, &fabgl::FONT_8x13, &fabgl::FONT_8x14, &fabgl::FONT_8x16, &fabgl::FONT_8x19, &fabgl::FONT_9x15,
                                             &fabgl::FONT_9x18, &fabgl::FONT_10x20, &fabgl::FONT_BIGSERIF_8x14, &fabgl::FONT_BIGSERIF_8x16, &fabgl::FONT_BLOCK_8x14,
                                             &fabgl::FONT_BROADWAY_8x14, &fabgl::FONT_COMPUTER_8x14, &fabgl::FONT_COURIER_8x14,
                                             &fabgl::FONT_LCD_8x14, &fabgl::FONT_OLDENGL_8x16, &fabgl::FONT_SANSERIF_8x14, &fabgl::FONT_SANSERIF_8x16,
                                             &fabgl::FONT_SLANT_8x14, &fabgl::FONT_WIGGLY_8x16};
};
