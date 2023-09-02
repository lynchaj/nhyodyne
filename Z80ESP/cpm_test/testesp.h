
struct playsounddata
{
    long attack;  // time in millis
    long decay;   // time in millis
    int sustain;  // 0-127 range (over volume)
    long release; // time in millis
    char wave;    // square, sine, triangle, saw, noise
    int volume;
    int durationms;
    int freq_start;
    int freq_end;
    char modfreq;
};

struct drawBitmapParameter
{
    int X;
    int Y;
    int width;      /**< Bitmap horizontal size */
    int height;     /**< Bitmap vertical size */
    char format; /**< Bitmap pixel format */
    int length;
};

struct drawGlyphParameter
{
    int X;
    int Y;
    int width;
    int height;
    int index;
    int length;
};

struct copyRectParameter
{
    int sourceX;
    int sourceY;
    int destX;
    int destY;
    int width;
    int height;
};

struct xyParameter
{
    int X;
    int Y;
};

struct xyXyParameter
{
    int X;
    int Y;
    int X2;
    int Y2;
};

struct xyCharFontParameter
{
    int X;
    int Y;
    char ch;
    char font;
};

struct xyIndexParameter
{
    int X;
    int Y;
    char index;
};

struct glyphParameter
{
    char blank;
    char bold;
    char doubleWidth;
    char FillBackground;
    char Invert;
    char Italic;
    char Underline;
};

struct paletteParameter
{
    char index;
    char B;
    char G;
    char R;
};

struct spriteBitmapParameter
{
    char index;
    int width;      /**< Bitmap horizontal size */
    int height;     /**< Bitmap vertical size */
    char format; /**< Bitmap pixel format */
    int length;
};
