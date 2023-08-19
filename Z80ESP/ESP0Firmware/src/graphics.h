#pragma once

#include <Arduino.h>
#include <Preferences.h>

#define NumberOfSprites 32

class retroGraphics
{
public:
    void setGraphicsMode(uint8_t b);
    void loadFont(uint8_t b);
    void setCursor(uint8_t b);
    void clearDisplay();
    void initialize(fabgl::Terminal *Terminal);
    bool copyRect(uint8_t b);
    bool drawBitmap(uint8_t b);
    void resetPointer();
    void setBrushColor(uint8_t b);
    void setPenColor(uint8_t b);
    bool setPixel(uint8_t b);
    void setLineEnds(uint8_t b);
    void setPenWidth(uint8_t b);
    bool drawChar(uint8_t b);
    bool drawEllipse(uint8_t b);
    bool drawGlyph(uint8_t b);
    bool drawLine(uint8_t b);
    bool drawRectangle(uint8_t b);
    bool fillEllipse(uint8_t b);
    bool fillRectangle(uint8_t b);
    bool getPixel(uint8_t b);
    bool invertRectangle(uint8_t b);
    bool lineTo(uint8_t b);
    bool moveTo(uint8_t b);
    bool scroll(uint8_t b);
    bool setGlyphOptions(uint8_t b);
    bool setPaletteItem(uint8_t b);
    void setMouseCursor(uint8_t b);
    bool setMouseCursorPosition(uint8_t b);
    void removeSprites();
    bool setSpriteMap(uint8_t b);
    bool setSpriteLocation(uint8_t b);
    bool setSpriteVisibility(uint8_t b);
    void end();

private:
    fabgl::VGABaseController *m_Display;
    fabgl::VGA16Controller *m_Display16;
    fabgl::VGA8Controller *m_Display8;
    fabgl::VGA4Controller *m_Display4;
    fabgl::VGA2Controller *m_Display2;

    fabgl::Terminal *m_Terminal;
    uint8_t *buffer;
    uint8_t *currentPointer;
    fabgl::Sprite m_sprite[NumberOfSprites];
    fabgl::Bitmap m_spriteBitmap[NumberOfSprites];
    Preferences preferences;



    void setupDisplay();
    void m_setGraphicsMode(uint8_t b);
    void initVGAController();
    void initVGA16Controller();
    void initVGA8Controller();
    void initVGA4Controller();
    void initVGA2Controller();

    struct drawBitmapParameter
    {
        uint16_t X;
        uint16_t Y;
        int16_t         width;           /**< Bitmap horizontal size */
        int16_t         height;          /**< Bitmap vertical size */
        PixelFormat     format;          /**< Bitmap pixel format */
        uint16_t length;
    } __attribute__((packed));

    struct drawGlyphParameter
    {
        uint16_t X;
        uint16_t Y;
        uint16_t width;
        uint16_t height;
        uint16_t index;
        uint16_t length;
    } __attribute__((packed));

    struct copyRectParameter
    {
        uint16_t sourceX;
        uint16_t sourceY;
        uint16_t destX;
        uint16_t destY;
        uint16_t width;
        uint16_t height;
    } __attribute__((packed));

    struct xyParameter
    {
        uint16_t X;
        uint16_t Y;
    } __attribute__((packed));

    struct xyXyParameter
    {
        uint16_t X;
        uint16_t Y;
        uint16_t X2;
        uint16_t Y2;
    } __attribute__((packed));

    struct xyCharFontParameter
    {
        uint16_t X;
        uint16_t Y;
        uint8_t ch;
        uint8_t font;
    } __attribute__((packed));

    struct xyIndexParameter
    {
        uint16_t X;
        uint16_t Y;
        uint8_t index;
    } __attribute__((packed));

    struct glyphParameter
    {
        uint8_t blank;
        uint8_t bold;
        uint8_t doubleWidth;
        uint8_t FillBackground;
        uint8_t Invert;
        uint8_t Italic;
        uint8_t Underline;
    } __attribute__((packed));

    struct paletteParameter
    {
        uint8_t index;
        uint8_t B;
        uint8_t G;
        uint8_t R;
    } __attribute__((packed));

    struct spriteBitmapParameter
    {
        uint8_t index;
        int16_t         width;           /**< Bitmap horizontal size */
        int16_t         height;          /**< Bitmap vertical size */
        PixelFormat     format;          /**< Bitmap pixel format */
        uint16_t length;
    } __attribute__((packed));

    struct spriteVisibilityParameter
    {
        uint8_t index;
        uint8_t visible;
    } __attribute__((packed));

    const fabgl::FontInfo *FONTS_INFO[31] = {&fabgl::FONT_4x6, &fabgl::FONT_5x7, &fabgl::FONT_5x8, &fabgl::FONT_6x8, &fabgl::FONT_6x9,
                                             &fabgl::FONT_6x10, &fabgl::FONT_6x12, &fabgl::FONT_6x13, &fabgl::FONT_7x13, &fabgl::FONT_7x14, &fabgl::FONT_8x8,
                                             &fabgl::FONT_8x9, &fabgl::FONT_8x13, &fabgl::FONT_8x14, &fabgl::FONT_8x16, &fabgl::FONT_8x19, &fabgl::FONT_9x15,
                                             &fabgl::FONT_9x18, &fabgl::FONT_10x20, &fabgl::FONT_BIGSERIF_8x14, &fabgl::FONT_BIGSERIF_8x16, &fabgl::FONT_BLOCK_8x14,
                                             &fabgl::FONT_BROADWAY_8x14, &fabgl::FONT_COMPUTER_8x14, &fabgl::FONT_COURIER_8x14,
                                             &fabgl::FONT_LCD_8x14, &fabgl::FONT_OLDENGL_8x16, &fabgl::FONT_SANSERIF_8x14, &fabgl::FONT_SANSERIF_8x16,
                                             &fabgl::FONT_SLANT_8x14, &fabgl::FONT_WIGGLY_8x16};

};