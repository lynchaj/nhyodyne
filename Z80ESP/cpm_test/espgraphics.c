#include "esplowlevel.h"
#include "espui.h"
#include "testesp.h"
#include "espsampledata.h"

clear_screen_test()
{
    esp0_outbyte(17);    // send opcode '17'
    printmessage("ESP VGA Screen cleared.");
}
set_resolution_test()
{
    char mode=0;

    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts(" ");
    printcenteredbold("Set VGA Resolution");
    puts(" ");
    printcentered("See VGA resolution identifiers in documentation");

    printf("\e[17;10HVGA Resolution->\e[1m");
    mode=getbyte();

    esp0_outbyte(15);    // send opcode '15'
    esp0_outbyte(mode);
}
set_font_test()
{
    char mode=0;

    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts(" ");
    printcenteredbold("Set VGA Font");
    puts(" ");
    printcentered("See VGA font identifiers in documentation");

    printf("\e[17;10HVGA Font->\e[1m");
    mode=getbyte();

    esp0_outbyte(16);    // send opcode '16'
    esp0_outbyte(mode);  //LSB
}
copy_rectangle_test()
{
    struct copyRectParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Copy Rectangle on VGA to new location");
    puts("\e[0m");

    printf("\e[11;3HSource X   ->");
    printf("\e[12;3HSource Y   ->");
    printf("\e[13;3HDest X     ->");
    printf("\e[14;3HDest Y     ->");
    printf("\e[15;3HWidth      ->");
    printf("\e[16;3HHeight     ->");

    printf("\e[11;18H\e[1m"); data.sourceX=getint();
    printf("\e[12;18H\e[1m"); data.sourceY=getint();
    printf("\e[13;18H\e[1m"); data.destX=getint();
    printf("\e[14;18H\e[1m"); data.destY=getint();
    printf("\e[15;18H\e[1m"); data.width=getint();
    printf("\e[16;18H\e[1m"); data.height=getint();

    esp0_outbyte(18);        // send opcode '18'
    esp0_outstruct(data,sizeof(data));
}
draw_bitmap_test()
{
    struct drawBitmapParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Draw Bitmap on VGA");
    puts("\e[0m");

    printf("\e[11;3HX          ->");
    printf("\e[12;3HY          ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();

    data.width=16;
    data.height=15;
    data.format=4;
    data.length= sizeof(BITMAP_TEST);

    esp0_outbyte(19);        // send opcode '19'
    esp0_outstruct(data,sizeof(data));
    esp0_outstruct(BITMAP_TEST,sizeof(BITMAP_TEST));
}
draw_char_test()
{
    struct xyCharFontParameter data;
    int tmp;
    char inputchar[20];

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Draw Character on VGA");
    puts("\e[0m");

    printf("\e[11;3HX          ->");
    printf("\e[12;3HY          ->");
    printf("\e[13;3HChar       ->");
    printf("\e[14;3HFont       ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();
    printf("\e[13;18H\e[1m"); getstring(inputchar); data.ch=inputchar[0];
    printf("\e[14;18H\e[1m"); data.font=getbyte();

    esp0_outbyte(20);        // send opcode '20'
    esp0_outstruct(data,sizeof(data));
}
draw_ellipse_test()
{
    struct xyXyParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Draw Ellipse on VGA");
    puts("\e[0m");

    printf("\e[11;3HSource X   ->");
    printf("\e[12;3HSource Y   ->");
    printf("\e[13;3HWidth      ->");
    printf("\e[14;3HHeight     ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();
    printf("\e[13;18H\e[1m"); data.X2=getint();
    printf("\e[14;18H\e[1m"); data.Y2=getint();

    esp0_outbyte(21);        // send opcode '21'
    esp0_outstruct(data,sizeof(data));
}
draw_glyph_test()
{
    struct drawGlyphParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Draw Glyph on VGA");
    puts("\e[0m");

    printf("\e[11;3HX          ->");
    printf("\e[12;3HY          ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();

    data.width=16;
    data.height=7;
    data.index=0;
    data.length= sizeof(GLYPH_TEST);

    esp0_outbyte(22);        // send opcode '22'
    esp0_outstruct(data,sizeof(data));
    esp0_outstruct(GLYPH_TEST,sizeof(GLYPH_TEST));
}
draw_line_test()
{
    struct xyXyParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Draw line on VGA");
    puts("\e[0m");

    printf("\e[11;3HStart  X   ->");
    printf("\e[12;3HStart  Y   ->");
    printf("\e[13;3HEnd    X   ->");
    printf("\e[14;3HEnd    Y   ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();
    printf("\e[13;18H\e[1m"); data.X2=getint();
    printf("\e[14;18H\e[1m"); data.Y2=getint();

    esp0_outbyte(23);        // send opcode '23'
    esp0_outstruct(data,sizeof(data));
}
draw_rectangle_test()
{
    struct xyXyParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Draw Rectangle on VGA");
    puts("\e[0m");

    printf("\e[11;3HSource X   ->");
    printf("\e[12;3HSource Y   ->");
    printf("\e[13;3HDest X     ->");
    printf("\e[14;3HDest Y     ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();
    printf("\e[13;18H\e[1m"); data.X2=getint();
    printf("\e[14;18H\e[1m"); data.Y2=getint();

    esp0_outbyte(24);        // send opcode '24'
    esp0_outstruct(data,sizeof(data));
}
fill_ellipse_test()
{
    struct xyXyParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Fill Ellipse on VGA");
    puts("\e[0m");

    printf("\e[11;3HSource X   ->");
    printf("\e[12;3HSource Y   ->");
    printf("\e[13;3HWidth      ->");
    printf("\e[14;3HHeight     ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();
    printf("\e[13;18H\e[1m"); data.X2=getint();
    printf("\e[14;18H\e[1m"); data.Y2=getint();

    esp0_outbyte(25);        // send opcode '25'
    esp0_outstruct(data,sizeof(data));
}
fill_rectangle_test()
{
    struct xyXyParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Fill Rectangle on VGA");
    puts("\e[0m");

    printf("\e[11;3HSource X   ->");
    printf("\e[12;3HSource Y   ->");
    printf("\e[13;3HDest X     ->");
    printf("\e[14;3HDest Y     ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();
    printf("\e[13;18H\e[1m"); data.X2=getint();
    printf("\e[14;18H\e[1m"); data.Y2=getint();

    esp0_outbyte(26);        // send opcode '24'
    esp0_outstruct(data,sizeof(data));
}
get_pixel_test()
{
    struct xyParameter data;
    int b=0,g=0,r=0;
    int cont=1;
    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Get Pixel from VGA");
    puts("\e[0m");
    printcentered("Enter X=0,Y=0 to exit");

    while(cont)
    {
        printf("\e[11;3HX          ->           ");
        printf("\e[12;3HY          ->           ");

        printf("\e[11;18H\e[1m"); data.X=getint();
        printf("\e[12;18H\e[1m"); data.Y=getint();

        if((data.X==0) && (data.Y==0)) cont=0;

        esp0_outbyte(27);        // send opcode '27'
        esp0_outstruct(data,sizeof(data));
        b=esp0_inbytewait();
        g=esp0_inbytewait();
        r=esp0_inbytewait();

        printf("\e[15;18H\e[1m B=%u G=%u R=%u           \e[0m",b,g,r);
    }

}
invert_rectangle_test()
{
    struct xyXyParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Invert Rectangle on VGA");
    puts("\e[0m");

    printf("\e[11;3HSource X   ->");
    printf("\e[12;3HSource Y   ->");
    printf("\e[13;3HDest X     ->");
    printf("\e[14;3HDest Y     ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();
    printf("\e[13;18H\e[1m"); data.X2=getint();
    printf("\e[14;18H\e[1m"); data.Y2=getint();

    esp0_outbyte(28);        // send opcode '28'
    esp0_outstruct(data,sizeof(data));
}
draw_line_to_test()
{
    struct xyParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Draw Line from graphics cursor on VGA");
    puts("\e[0m");

    printf("\e[11;3HX          ->");
    printf("\e[12;3HY          ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();

    esp0_outbyte(29);        // send opcode '29'
    esp0_outstruct(data,sizeof(data));
}
move_cursor_to_test()
{
    struct xyParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Move graphics cursor to");
    puts("\e[0m");

    printf("\e[11;3HX          ->");
    printf("\e[12;3HY          ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();

    esp0_outbyte(30);        // send opcode '30'
    esp0_outstruct(data,sizeof(data));
}
scroll_test()
{
    struct xyParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Scroll Screen (Neg=Left/Up, Pos=Right/Down)");
    puts("\e[0m");

    printf("\e[11;3HX Offset   ->");
    printf("\e[12;3HY Offset   ->");

    printf("\e[11;18H\e[1m"); data.X=getint();
    printf("\e[12;18H\e[1m"); data.Y=getint();

    esp0_outbyte(31);        // send opcode '31'
    esp0_outstruct(data,sizeof(data));
}
set_brush_color_test()
{
    char color;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Brush Color");
    puts("\e[0m");

    printf("\e[11;3HColor      ->");
    printf("\e[11;18H\e[1m"); color=getbyte();

    esp0_outbyte(32);        // send opcode '32'
    esp0_outbyte(color);
}
set_line_end_test()
{
    char color;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Line End Type (0=Square, 1=Rounded)");
    puts("\e[0m");

    printf("\e[11;3HType      ->");
    printf("\e[11;18H\e[1m"); color=getbyte();

    esp0_outbyte(33);        // send opcode '33'
    esp0_outbyte(color);
}
set_pen_color_test()
{
    char color;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Pen Color");
    puts("\e[0m");

    printf("\e[11;3HColor      ->");
    printf("\e[11;18H\e[1m"); color=getbyte();

    esp0_outbyte(34);        // send opcode '34'
    esp0_outbyte(color);
}
set_pen_width_test()
{
    char color;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Pen Width");
    puts("\e[0m");

    printf("\e[11;3HWidth      ->");
    printf("\e[11;18H\e[1m"); color=getbyte();

    esp0_outbyte(35);        // send opcode '35'
    esp0_outbyte(color);
}
set_pixel_test()
{
    struct xyParameter data;
    int b=0,g=0,r=0;
    int cont=1;
    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Pixel on VGA");
    puts("\e[0m");
    printcentered("Enter X=0,Y=0 to exit");

    while(cont)
    {
        printf("\e[11;3HX          ->           ");
        printf("\e[12;3HY          ->           ");

        printf("\e[11;18H\e[1m"); data.X=getint();
        printf("\e[12;18H\e[1m"); data.Y=getint();

        if((data.X==0) && (data.Y==0)) cont=0;
        esp0_outbyte(36);        // send opcode '36'
        esp0_outstruct(data,sizeof(data));
    }
}
set_glyph_options_test()
{
   struct glyphParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Glyph Drawing Options");
    puts("\e[0m");

    printf("\e[11;3HBlank (1/0)            ->");
    printf("\e[12;3HBold (1/0)             ->");
    printf("\e[13;3HDouble Width (1/0)     ->");
    printf("\e[14;3HFill Background (1/0)  ->");
    printf("\e[15;3HInvert (1/0)           ->");
    printf("\e[16;3HItalic (1/0)           ->");
    printf("\e[17;3HUnderline (1/0)        ->");

    printf("\e[11;30H\e[1m"); data.blank=getbyte();
    printf("\e[12;30H\e[1m"); data.bold=getbyte();
    printf("\e[13;30H\e[1m"); data.doubleWidth=getbyte();
    printf("\e[14;30H\e[1m"); data.FillBackground=getbyte();
    printf("\e[15;30H\e[1m"); data.Invert=getbyte();
    printf("\e[16;30H\e[1m"); data.Italic=getbyte();
    printf("\e[17;30H\e[1m"); data.Underline=getbyte();

    esp0_outbyte(37);        // send opcode '37'
    esp0_outstruct(data,sizeof(data));
}
set_palette_item_test()
{
   struct paletteParameter data;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Palette Item");
    puts("\e[0m");

    printf("\e[11;3HPalette Index          ->");
    printf("\e[12;3HBlue Value             ->");
    printf("\e[13;3HGreen Value            ->");
    printf("\e[14;3HRed Value              ->");

    printf("\e[11;30H\e[1m"); data.index=getbyte();
    printf("\e[12;30H\e[1m"); data.B=getbyte();
    printf("\e[13;30H\e[1m"); data.G=getbyte();
    printf("\e[14;30H\e[1m"); data.R=getbyte();

    esp0_outbyte(38);        // send opcode '38'
    esp0_outstruct(data,sizeof(data));
}
set_mouse_cursor_test()
{
    char type;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Mouse Cursor Type");
    puts("\e[0m");

    printf("\e[11;3HMouse Cursor Type      ->");

    printf("\e[11;30H\e[1m"); type=getbyte();
    esp0_outbyte(39);        // send opcode '39'
    esp0_outbyte(type);
}
set_mouse_cursor_position_test()
{
    struct xyParameter data;
    int b=0,g=0,r=0;
    int cont=1;
    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Mouse Cursor Position on VGA");
    puts("\e[0m");
    printcentered("Enter X=0,Y=0 to exit");

    while(cont)
    {
        printf("\e[11;3HX          ->           ");
        printf("\e[12;3HY          ->           ");

        printf("\e[11;18H\e[1m"); data.X=getint();
        printf("\e[12;18H\e[1m"); data.Y=getint();

        if((data.X==0) && (data.Y==0)) cont=0;
        esp0_outbyte(40);        // send opcode '40'
        esp0_outstruct(data,sizeof(data));
    }
}
remove_sprites_test()
{
        esp0_outbyte(41);        // send opcode '41'
}
set_sprite_map_test()
{
    struct spriteBitmapParameter data;
    data.index=0;
    data.width=16;
    data.height=15;
    data.format=4;
    data.length= sizeof(BITMAP_TEST);
    esp0_outbyte(42);        // send opcode '42'
    esp0_outstruct(data,sizeof(data));
    esp0_outstruct(BITMAP_TEST,sizeof(BITMAP_TEST));
}
set_sprite_location_test()
{
    struct xyIndexParameter data;
    int cont=1;
    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Mouse Cursor Position on VGA");
    puts("\e[0m");
    printcentered("Enter X=0,Y=0 to exit");

    while(cont)
    {
        printf("\e[11;3HX          ->           ");
        printf("\e[12;3HY          ->           ");

        data.index=0;
        printf("\e[11;18H\e[1m"); data.X=getint();
        printf("\e[12;18H\e[1m"); data.Y=getint();

        if((data.X==0) && (data.Y==0)) cont=0;
        esp0_outbyte(43);        // send opcode '43'
        esp0_outstruct(data,sizeof(data));
    }
}
set_sprite_visibility_test()
{
    char index,visible;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Sprite Visibility on VGA");
    puts("\e[0m");

    printf("\e[11;3HIndex        ->");
    printf("\e[12;3HVisible(0/1) ->");

    printf("\e[11;25H\e[1m"); index=getbyte();
    printf("\e[12;25H\e[1m"); visible=getbyte();

    esp0_outbyte(44);        // send opcode '44'
    esp0_outbyte(index);
    esp0_outbyte(visible);
}
