#include <fabgl.h>
#include "pins.h"
#include "graphics.h"
#include "interface.h"

void retroGraphics::initialize(fabgl::Terminal *Terminal)
{
    m_Terminal = Terminal;
    preferences.begin("retroESP32", false);
    unsigned int gMode = preferences.getUInt("gMode", 21);
    m_setGraphicsMode(gMode);

    buffer = new uint8_t[32768];
    currentPointer = buffer;
}

void retroGraphics::setGraphicsMode(uint8_t b)
{
    preferences.putUInt("gMode", b);
    delay(500); // should be enough time to ensure stable write
}

void retroGraphics::m_setGraphicsMode(uint8_t b)
{
    switch (b)
    {
    case 0:
        initVGAController();
        m_Display->setResolution(VGA_320x200_70Hz);
        break;
    case 1:
        initVGAController();
        m_Display->setResolution(VGA_320x200_75Hz);
        break;
    case 2:
        initVGAController();
        m_Display->setResolution(VGA_320x200_75HzRetro);
        break;
    case 3:
        initVGAController();
        m_Display->setResolution(QVGA_320x240_60Hz);
        break;
    case 4:
        initVGAController();
        m_Display->setResolution(VGA_400x300_60Hz);
        break;
    case 5:
        initVGA16Controller();
        m_Display->setResolution(VGA_480x300_75Hz);
        break;
    case 6:
        initVGA16Controller();
        m_Display->setResolution(VGA_512x192_60Hz);
        break;
    case 7:
        initVGA16Controller();
        m_Display->setResolution(VGA_512x384_60Hz);
        break;
    case 8:
        initVGA16Controller();
        m_Display->setResolution(VGA_512x448_60Hz);
        break;
    case 9:
        initVGA16Controller();
        m_Display->setResolution(VGA_512x512_58Hz);
        break;
    case 10:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x200_60HzD);
        break;
    case 11:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x200_70Hz);
        break;
    case 12:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x200_70HzRetro);
        break;
    case 13:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x240_60Hz);
        break;
    case 14:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x350_70Hz);
        break;
    case 15:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x350_70HzAlt1);
        break;
    case 16:
        initVGA16Controller();
        m_Display->setResolution(VESA_640x350_85Hz);
        break;
    case 17:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x382_60Hz);
        break;
    case 18:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x384_60Hz);
        break;
    case 19:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x400_70Hz);
        break;
    case 20:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x400_60Hz);
        break;
    case 21:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x480_60Hz);
        break;
    case 22:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x480_60HzAlt1);
        break;
    case 23:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x480_60HzD);
        break;
    case 24:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x480_73Hz);
        break;
    case 25:
        initVGA16Controller();
        m_Display->setResolution(VESA_640x480_75Hz);
        break;
    case 26:
        initVGA16Controller();
        m_Display->setResolution(VGA_720x348_50HzD);
        break;
    case 27:
        initVGA16Controller();
        m_Display->setResolution(VGA_720x348_59HzD);
        break;
    case 28:
        initVGA16Controller();
        m_Display->setResolution(VGA_720x348_73Hz);
        break;
    case 29:
        initVGA16Controller();
        m_Display->setResolution(VGA_720x350_70Hz);
        break;
    case 30:
        initVGA16Controller();
        m_Display->setResolution(VGA_720x400_70Hz);
        break;
    case 31:
        initVGA16Controller();
        m_Display->setResolution(VESA_720x400_85Hz);
        break;
    case 32:
        initVGA8Controller();
        m_Display->setResolution(PAL_720x576_50Hz);
        break;
    case 33:
        initVGA8Controller();
        m_Display->setResolution(VESA_768x576_60Hz);
        break;
    case 34:
        initVGA8Controller();
        m_Display->setResolution(SVGA_800x300_60Hz);
        break;
    case 35:
        initVGA4Controller();
        m_Display->setResolution(SVGA_800x600_56Hz);
        break;
    case 36:
        initVGA4Controller();
        m_Display->setResolution(SVGA_800x600_60Hz);
        break;
    case 37:
        initVGA4Controller();
        m_Display->setResolution(SVGA_960x540_60Hz);
        break;
    case 38:
        initVGA2Controller();
        m_Display->setResolution(SVGA_1024x768_60Hz);
        break;
    case 39:
        initVGA2Controller();
        m_Display->setResolution(SVGA_1024x768_70Hz);
        break;
    case 40:
        initVGA2Controller();
        m_Display->setResolution(SVGA_1024x768_75Hz);
        break;
    case 41:
        initVGA2Controller();
        m_Display->setResolution(SVGA_1280x600_60Hz);
        break;
    case 42:
        initVGA2Controller();
        m_Display->setResolution(SVGA_1280x720_60Hz);
        break;
    case 43:
        initVGA2Controller();
        m_Display->setResolution(SVGA_1280x720_60HzAlt1);
        break;
    case 44:
        initVGA2Controller();
        m_Display->setResolution(SVGA_1280x768_50Hz);
        break;
    default:
        initVGA16Controller();
        m_Display->setResolution(VGA_640x480_60Hz);
    }
    m_Terminal->begin(m_Display);
    m_Terminal->connectLocally();
    m_Terminal->enableCursor(true);
    m_Terminal->write("\e[40;32m"); // background: black, foreground: green
    m_Terminal->write("\e[2J");     // clear screen
    m_Terminal->write("\e[1;1H");   // move cursor to 1,1
}

void retroGraphics::initVGA16Controller()
{
    static fabgl::VGA16Controller Display16Controller;
    Display16Controller.begin(RED1, RED0, GREEN1, GREEN0, BLUE1, BLUE0, HSYNC, VSYNC);
    m_Display = &Display16Controller;
    m_Display16 = &Display16Controller;
    m_Display8 = NULL;
    m_Display4 = NULL;
    m_Display2 = NULL;
}
void retroGraphics::initVGA8Controller()
{
    static fabgl::VGA8Controller Display8Controller;
    m_Display = &Display8Controller;
    m_Display16 = NULL;
    m_Display8 = &Display8Controller;
    m_Display4 = NULL;
    m_Display2 = NULL;

    Display8Controller.begin(RED1, RED0, GREEN1, GREEN0, BLUE1, BLUE0, HSYNC, VSYNC);
}
void retroGraphics::initVGA4Controller()
{
    static fabgl::VGA4Controller Display4Controller;
    m_Display = &Display4Controller;
    m_Display16 = NULL;
    m_Display8 = NULL;
    m_Display4 = &Display4Controller;
    m_Display2 = NULL;

    Display4Controller.begin(RED1, RED0, GREEN1, GREEN0, BLUE1, BLUE0, HSYNC, VSYNC);
}
void retroGraphics::initVGA2Controller()
{
    static fabgl::VGA2Controller Display2Controller;
    m_Display = &Display2Controller;
    m_Display16 = NULL;
    m_Display8 = NULL;
    m_Display4 = NULL;
    m_Display2 = &Display2Controller;

    Display2Controller.begin(RED1, RED0, GREEN1, GREEN0, BLUE1, BLUE0, HSYNC, VSYNC);
}
void retroGraphics::initVGAController()
{
    static fabgl::VGAController DisplayController;
    m_Display = &DisplayController;
    m_Display16 = NULL;
    m_Display8 = NULL;
    m_Display4 = NULL;
    m_Display2 = NULL;

    DisplayController.begin(RED1, RED0, GREEN1, GREEN0, BLUE1, BLUE0, HSYNC, VSYNC);
}

void retroGraphics::loadFont(uint8_t b)
{
    m_Terminal->loadFont(FONTS_INFO[b]);
    m_Terminal->canvas()->waitCompletion(false);
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
    currentPointer = buffer;
}
bool retroGraphics::copyRect(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(copyRectParameter))
    {
        copyRectParameter *p;
        p = (copyRectParameter *)buffer;
        m_Terminal->canvas()->copyRect(p->sourceX, p->sourceY, p->destX, p->destY, p->width, p->height);
        m_Terminal->canvas()->waitCompletion(false);
        return true;
    }
    return false;
}
bool retroGraphics::drawBitmap(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) > sizeof(drawBitmapParameter))
    {
        drawBitmapParameter *p;
        p = (drawBitmapParameter *)buffer;

        if ((currentPointer - buffer) == (sizeof(drawBitmapParameter) + p->length))
        {
            fabgl::Bitmap map = Bitmap(p->width, p->height, &buffer[sizeof(drawBitmapParameter)], p->format);
            m_Terminal->canvas()->drawBitmap(p->X, p->Y, &map);
            m_Terminal->canvas()->waitCompletion(false);
            return true;
        }
    }
    return false;
}
void retroGraphics::setBrushColor(uint8_t b)
{
    fabgl::Color c = (fabgl::Color)b;
    m_Terminal->canvas()->setBrushColor(c);
}
void retroGraphics::setPenColor(uint8_t b)
{
    fabgl::Color c = (fabgl::Color)b;
    m_Terminal->canvas()->setPenColor(c);
}
void retroGraphics::setLineEnds(uint8_t b)
{
    fabgl::LineEnds e = (fabgl::LineEnds)b;
    m_Terminal->canvas()->setLineEnds(e);
}
void retroGraphics::setPenWidth(uint8_t b)
{
    int w = b;
    m_Terminal->canvas()->setPenWidth(w);
}
bool retroGraphics::setPixel(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyParameter))
    {
        xyParameter *p;
        p = (xyParameter *)buffer;
        m_Terminal->canvas()->setPixel(p->X, p->Y);
        return true;
    }
    return false;
}
bool retroGraphics::drawChar(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyCharFontParameter))
    {
        xyCharFontParameter *p;
        p = (xyCharFontParameter *)buffer;
        m_Terminal->canvas()->selectFont(FONTS_INFO[p->font]);
        m_Terminal->canvas()->drawChar(p->X, p->Y, p->ch);
        return true;
    }
    return false;
}
bool retroGraphics::drawEllipse(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyXyParameter))
    {
        xyXyParameter *p;
        p = (xyXyParameter *)buffer;
        m_Terminal->canvas()->drawEllipse(p->X, p->Y, p->X2, p->Y2);
        m_Terminal->canvas()->waitCompletion(false);
        return true;
    }
    return false;
}
bool retroGraphics::drawGlyph(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) > sizeof(drawGlyphParameter))
    {
        drawGlyphParameter *p;
        p = (drawGlyphParameter *)buffer;

        if ((currentPointer - buffer) == (sizeof(drawGlyphParameter) + p->length))
        {
            m_Terminal->canvas()->drawGlyph(p->X, p->Y, p->width, p->height, &buffer[sizeof(drawGlyphParameter)], p->index);
            m_Terminal->canvas()->waitCompletion(false);
            return true;
        }
    }
    return false;
}
bool retroGraphics::drawLine(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyXyParameter))
    {
        xyXyParameter *p;
        p = (xyXyParameter *)buffer;
        m_Terminal->canvas()->drawLine(p->X, p->Y, p->X2, p->Y2);
        return true;
    }
    return false;
}
bool retroGraphics::drawRectangle(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyXyParameter))
    {
        xyXyParameter *p;
        p = (xyXyParameter *)buffer;
        m_Terminal->canvas()->drawRectangle(p->X, p->Y, p->X2, p->Y2);
        m_Terminal->canvas()->waitCompletion(false);
        return true;
    }
    return false;
}
bool retroGraphics::fillEllipse(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyXyParameter))
    {
        xyXyParameter *p;
        p = (xyXyParameter *)buffer;
        m_Terminal->canvas()->fillEllipse(p->X, p->Y, p->X2, p->Y2);
        m_Terminal->canvas()->waitCompletion(false);
        return true;
    }
    return false;
}
bool retroGraphics::fillRectangle(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyXyParameter))
    {
        xyXyParameter *p;
        p = (xyXyParameter *)buffer;
        m_Terminal->canvas()->fillRectangle(p->X, p->Y, p->X2, p->Y2);
        m_Terminal->canvas()->waitCompletion(false);
        return true;
    }
    return false;
}
bool retroGraphics::getPixel(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyParameter))
    {
        xyParameter *p;
        p = (xyParameter *)buffer;
        m_Terminal->canvas()->waitCompletion(false);
        fabgl::RGB888 ret = m_Terminal->canvas()->getPixel(p->X, p->Y);
        queueByte(ret.B);
        queueByte(ret.G);
        queueByte(ret.R);
        return true;
    }
    return false;
}
bool retroGraphics::invertRectangle(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyXyParameter))
    {
        xyXyParameter *p;
        p = (xyXyParameter *)buffer;
        m_Terminal->canvas()->invertRectangle(p->X, p->Y, p->X2, p->Y2);
        m_Terminal->canvas()->waitCompletion(false);
        return true;
    }
    return false;
}
bool retroGraphics::lineTo(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyParameter))
    {
        xyParameter *p;
        p = (xyParameter *)buffer;
        m_Terminal->canvas()->lineTo(p->X, p->Y);
        return true;
    }
    return false;
}
bool retroGraphics::moveTo(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyParameter))
    {
        xyParameter *p;
        p = (xyParameter *)buffer;
        m_Terminal->canvas()->moveTo(p->X, p->Y);
        return true;
    }
    return false;
}
bool retroGraphics::scroll(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyParameter))
    {
        xyParameter *p;
        p = (xyParameter *)buffer;
        m_Terminal->canvas()->scroll(p->X, p->Y);
        return true;
    }
    return false;
}
bool retroGraphics::setGlyphOptions(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(glyphParameter))
    {
        glyphParameter *p;
        p = (glyphParameter *)buffer;
        fabgl::GlyphOptions o;
        o.blank = p->blank;
        o.Bold(p->bold);
        o.DoubleWidth(p->doubleWidth);
        o.FillBackground(p->FillBackground);
        o.invert = p->Invert;
        o.italic = p->Italic;
        o.underline = p->Underline;
        m_Terminal->canvas()->setGlyphOptions(o);
        return true;
    }
    return false;
}
bool retroGraphics::setPaletteItem(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(paletteParameter))
    {
        paletteParameter *p;
        p = (paletteParameter *)buffer;
        fabgl::RGB888 c;
        c.B = p->B;
        c.R = p->R;
        c.G = p->G;
        if (m_Display16 != NULL)
            m_Display16->setPaletteItem(p->index, c);
        if (m_Display8 != NULL)
            m_Display8->setPaletteItem(p->index, c);
        if (m_Display4 != NULL)
            m_Display4->setPaletteItem(p->index, c);
        if (m_Display2 != NULL)
            m_Display2->setPaletteItem(p->index, c);

        return true;
    }

    return false;
}
void retroGraphics::setMouseCursor(uint8_t b)
{
    m_Display->setMouseCursor((fabgl::CursorName)b);
}
bool retroGraphics::setMouseCursorPosition(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyParameter))
    {
        xyParameter *p;
        p = (xyParameter *)buffer;
        m_Display->setMouseCursorPos(p->X, p->Y);
        return true;
    }
    return false;
}
void retroGraphics::removeSprites()
{

    for (int x = 0; x < NumberOfSprites; x++)
    {
        m_sprite->clearBitmaps();
    }
    m_Display->removeSprites();
}
bool retroGraphics::setSpriteMap(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) > sizeof(spriteBitmapParameter))
    {
        spriteBitmapParameter *p;
        p = (spriteBitmapParameter *)buffer;

        if ((currentPointer - buffer) == (sizeof(spriteBitmapParameter) + p->length))
        {
            if (p->index < NumberOfSprites)
            {
                m_spriteBitmap[p->index] = Bitmap(p->width, p->height, &buffer[sizeof(spriteBitmapParameter)], p->format);
                m_sprite[p->index].addBitmap(&m_spriteBitmap[p->index]);
                m_Terminal->canvas()->waitCompletion(false);
                m_Display->setSprites(m_sprite, 1);
            }
            return true;
        }
    }
    return false;
}
bool retroGraphics::setSpriteLocation(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(xyIndexParameter))
    {
        xyIndexParameter *p;
        p = (xyIndexParameter *)buffer;
        if (p->index < NumberOfSprites)
        {
            m_sprite[p->index].moveTo(p->X, p->Y);
            m_Terminal->canvas()->waitCompletion(false);
        }
        return true;
    }
    return false;
}
bool retroGraphics::setSpriteVisibility(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == sizeof(spriteVisibilityParameter))
    {
        spriteVisibilityParameter *p;
        p = (spriteVisibilityParameter *)buffer;
        if (p->index < NumberOfSprites)
        {
            if (p->visible == 0)
            {
                m_sprite[p->index].visible = false;
            }
            else
            {
                m_sprite[p->index].visible = true;
            }
        }
        return true;
    }
    return false;
}

void retroGraphics::end()
{
    m_Display->end();
}
