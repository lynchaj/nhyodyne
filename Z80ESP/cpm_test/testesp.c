#define CONIO_VT100
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <ctype.h>
#include <cpm.h>
#include "testesp.h"

#define ESP0 $9C       // ESP0 IO PORT
#define ESP1 $9D       // ESP1 IO PORT
#define ESP_STATUS $9E // ESP status IO PORT

int cpm_ver;

printcentered(char *string)
{
    int l=40-(strlen(string)/2);
    while(l>0)
    {
        putch(' ');
        l--;
    }
    puts(string);
}
printcenteredbold(char *string)
{
    int l=40-(strlen(string)/2);
    while(l>0)
    {
        putch(' ');
        l--;
    }
    printf("\e[1m%s\e[0m\n\r",string);
}
printmenu(char opt,char *string,char opt1,char *string1)
{
    if(opt==NULL)
    {
        printf("%41s \e[1m%c\e[0m. %s \n\r"," ",opt1,string1);
        return;
    }
    if(opt1!=NULL)
        printf("    \e[1m%c\e[0m. %-34s \e[1m%c\e[0m. %s \n\r",opt,string,opt1,string1);
    else
        printf("    \e[1m%c\e[0m. %s\n\r",opt,string);
}
printmessage(char *string)
{
    printf("\e[23;2H\e[1m%-60s \e[0m",string);
}

int esp0_outbyte(char c) __naked
{
    // SEND BYTE TO ESP0
    __asm
    pop bc      //return address
    pop hl      //character to print in l
    push hl
    push bc
    ld a,l      // char to send is now in a
    PUSH AF
    LD C,0
OUTESP0_1:
    INC C
    JP Z,OUTESP0_TIMEOUT
    IN A,(ESP_STATUS)  //GET STATUS
    AND 2               // Is ESP0 BUSY ?
    JP NZ, OUTESP0_1    // IF BUSY WAIT
    POP AF
    OUT(ESP0),A         //SEND BYTE
    LD C,$E0
OUTESP0_2:
    INC C
    JP Z,OUTESP0_3
    IN A,(ESP_STATUS)   // GET STATUS
    AND 2               // Is ESP0 BUSY ?
    JP Z, OUTESP0_2     // IF NOT BUSY WAIT
OUTESP0_3:
    RET
OUTESP0_TIMEOUT:
    POP AF
    RET
    __endasm;
}
int esp0_inbytewait() __naked
{
    // GET BYTE FROM ESP0 (BLOCKING)
    __asm
INESP0_WAIT:
        LD      C,0
INESP0_WAIT_1:
        INC     C
        JP      Z,INESP0_TIMEOUT
        IN      A,(ESP_STATUS)   // GET STATUS
        AND     2                // Is ESP0 BUSY?
        JP      NZ,INESP0_WAIT_1 // IF BUSY, WAIT
        IN      A,(ESP_STATUS)   // GET STATUS
        AND     1                // Is there data?
        JP      Z,INESP0_WAIT_1  // IF NO, BUSY WAIT
        IN      A,(ESP0)         // GET BYTE
        PUSH    AF
        LD      C,$E0
INESP0_WAIT_2:
        INC     C
        JP      Z,INESP0_3
        IN      A,(ESP_STATUS)  // GET STATUS
        AND     2               // Is ESP0 BUSY?
        JP      Z,INESP0_WAIT_2 // IF NOT BUSY WAIT (SHOULD HAVE TIMEOUT HERE)
INESP0_3:
        POP     AF
        LD      L,A
        LD      H,0
        RET
INESP0_TIMEOUT:
        LD      HL,0
        RET
    __endasm;
}
esp0_outstruct(char *data,int len)
{
    for(int x=0;x<len;x++)
        esp0_outbyte(*data++);
}
esp0_outlong(long value)
{
    esp0_outbyte(((unsigned char *)(&value))[0]);  //LSB
    esp0_outbyte(((unsigned char *)(&value))[1]);
    esp0_outbyte(((unsigned char *)(&value))[2]);
    esp0_outbyte(((unsigned char *)(&value))[3]);  //MSB
}
esp0_outint(int value)
{
    esp0_outbyte(((unsigned char *)(&value))[0]);  //LSB
    esp0_outbyte(((unsigned char *)(&value))[1]);  //MSB
}

int esp1_outbyte(char c) __naked
{
    // SEND BYTE TO ESP1
    __asm
    pop bc      //return address
    pop hl      //character to print in l
    push hl
    push bc
    ld a,l      // char to send is now in a
    PUSH AF
    LD C,0
OUTESP1_1:
    INC C
    JP Z,OUTESP1_TIMEOUT
    IN A,(ESP_STATUS)  //GET STATUS
    AND $10               // Is ESP1 BUSY ?
    JP NZ, OUTESP1_1    // IF BUSY WAIT
    POP AF
    OUT(ESP1),A         //SEND BYTE
    LD C,$E0
OUTESP1_2:
    INC C
    JP Z,OUTESP1_3
    IN A,(ESP_STATUS)   // GET STATUS
    AND $10               // Is ESP1 BUSY ?
    JP Z, OUTESP1_2     // IF NOT BUSY WAIT
OUTESP1_3:
    RET
OUTESP1_TIMEOUT:
    POP AF
    RET
    __endasm;
}
int esp1_inbytewait() __naked
{
    // GET BYTE FROM ESP1 (BLOCKING)
    __asm
INESP1_WAIT:
        LD      C,0
INESP1_WAIT_1:
        INC     C
        JP      Z,INESP1_TIMEOUT
        IN      A,(ESP_STATUS)   // GET STATUS
        AND     $10                // Is ESP1 BUSY?
        JP      NZ,INESP1_WAIT_1 // IF BUSY, WAIT
        IN      A,(ESP_STATUS)   // GET STATUS
        AND     8                // Is there data?
        JP      Z,INESP1_WAIT_1  // IF NO, BUSY WAIT
        IN      A,(ESP1)         // GET BYTE
        PUSH    AF
        LD      C,$E0
INESP1_WAIT_2:
        INC     C
        JP      Z,INESP1_3
        IN      A,(ESP_STATUS)  // GET STATUS
        AND     $10               // Is ESP1 BUSY?
        JP      Z,INESP1_WAIT_2 // IF NOT BUSY WAIT (SHOULD HAVE TIMEOUT HERE)
INESP1_3:
        POP     AF
        LD      L,A
        LD      H,0
        RET
INESP1_TIMEOUT:
        LD      HL,0
        RET
    __endasm;
}
esp1_outstruct(char *data,int len)
{
    for(int x=0;x<len;x++)
        esp1_outbyte(*data++);
}
esp1_outlong(long value)
{
    esp1_outbyte(((unsigned char *)(&value))[0]);  //LSB
    esp1_outbyte(((unsigned char *)(&value))[1]);
    esp1_outbyte(((unsigned char *)(&value))[2]);
    esp1_outbyte(((unsigned char *)(&value))[3]);  //MSB
}
esp1_outint(int value)
{
    esp1_outbyte(((unsigned char *)(&value))[0]);  //LSB
    esp1_outbyte(((unsigned char *)(&value))[1]);  //MSB
}


getstring(char *buffer)
{
    char ch;
    int len=0;

    for(;;)
    {
        ch=getchar();

        if((ch=='\n')||(ch=='\r'))
        {
            buffer[len]=0;
            return;
        }

        if((ch=='\b') && (len>0))
        {
            len--;
            putch(' ');
            putch('\b');
        }
        if(isprint(ch))
        {
            buffer[len]=ch;
            len++;
        }
    }
}
long getlong()
{
    long result;
    char buffer[20];
    getstring(buffer);
    sscanf(buffer,"%ld",&result);
    return result;
}
int getint()
{
    int result;
    result=getlong();
    return result;
}
int getbyte()
{
    char result;
    result=getlong();
    return result;
}


// Allows user to send some characters to the display
send_char_test()
{
    char ch=' ';
    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Output single char to VGA");
    puts("\e[0m");
    printcentered("Type characters to be echoed to the ESP display.  Press 'ESC' to return to menu");
    while(ch!='\e')
    {
        printf("\e[15;10HKey->\e[1m");
        ch = getchar();
        printf("\e[0m");

        if(ch!='\e')
        {
            if(isprint(ch))
            {
                esp0_outbyte(1);    // send opcode '1'
                esp0_outbyte(ch);   // send char
            }
        }
    }
}

// Sends 100 chars, very quickly
send_100_char_test()
{
    for(int x=0;x<100;x++)
    {
        esp0_outbyte(1);    // send opcode '1'
        esp0_outbyte('*');   // send char
    }

}

// Sends a string (fancy, eh?)
send_string_test()
{

    char *test = "\n\r\e[40;31mH\e[40;32mI \e[40;33mF\e[40;34mR\e[40;35mOM \e[40;36mD\e[40;37mU\e[40;92mO\e[40;93mD\e[40;94mY\e[40;95mN\e[40;96mE\e[40;97m.\n\r\0";
    char *c =test;
    esp0_outbyte(2);    // send opcode '2'
    while (*c != '\0') esp0_outbyte(*++c);
    esp0_outbyte(0);
}

get_key_test()
{
    char ch=' ';
    char ch1=' ';

    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Get Keystroke from PS/2 Keyboard");
    puts("\e[0m");
    printcentered("Type characters on the ESP keyboard.");
    puts(" ");
    printcentered("Press any key on terminal keyboard to return to menu");
    while(!getk())
    {
        esp0_outbyte(3);        // send opcode '3'
        ch=esp0_inbytewait();   // get char
        if(ch!=0)
        {
            printf("\e[15;10HKey->\e[1m                     ");
            if(isprint(ch))
                printf("\e[15;17H %d (%c)",ch,ch);
            else
                printf("\e[15;17H %d",ch);
            printf("\e[0m");
        }
    }

}

get_key_buffer_len_test()
{
    char ch;
    esp0_outbyte(4);    // send opcode '4'
    ch=esp0_inbytewait();   // get length
    printmessage("Length fetched");
    printf("\e[23;16H\e[1m %d",ch);
    printf("\e[0m");
}

cursor_visibility_test()
{
    char ch=' ';
    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts(" ");
    printcenteredbold("Modify Cursor Visibility");
    puts(" ");
    printcentered("Press '1' to turn on cursor");
    printcentered("Press '2' to turn off cursor");
    puts(" ");
    printcenteredbold("Press 'ESC' to return to menu");
    while(ch!='\e')
    {
        printf("\e[15;10Hinput ->\e[1m");
        ch = getchar();
        printf("\e[0m");

        if(ch!='\e')
        {
            esp0_outbyte(5);    // send opcode '5'
            if(ch=='1')
                esp0_outbyte(1);   // send "on"
            else
                esp0_outbyte(0);   // send "off"
        }
    }
}

serial_baud_rate_test()
{
    long baud=0;

    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts(" ");
    printcenteredbold("Set Serial Baud Rate");
    puts(" ");
    printf("\e[15;10HBaud Rate->\e[1m");
    baud=getlong();

    esp0_outbyte(6);    // send opcode '6'
    esp0_outlong(baud);
}

serial_mode_test()
{
    char mode=0;

    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts(" ");
    printcenteredbold("Set Serial mode");
    puts(" ");
    printcentered("0 = 8 data bits, no parity, 1 stop bit");
    printcentered("1 = 8 data bits, even parity, 1 stop bit");
    printcentered("2 = 8 data bits, odd parity, 1 stop bit");
    printcentered("3 = 8 data bits, no parity, 1 stop bit");
    printcentered("4 = 8 data bits, even parity, 1 stop bit");
    printcentered("5 = 8 data bits, odd parity, 1 stop bit");

    printf("\e[17;10HSerial Mode->\e[1m");
    mode=getbyte();
    esp0_outbyte(7);    // send opcode '6'
    esp0_outbyte(mode);
}

serial_tx_single_char_test()
{
    char ch=' ';
    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Output single char to Serial 0");
    puts("\e[0m");
    printcentered("Type characters to be echoed to Serial 0.  Press 'ESC' to return to menu");
    while(ch!='\e')
    {
        printf("\e[15;10HKey->\e[1m");
        ch = getchar();
        printf("\e[0m");

        if(ch!='\e')
        {
            if(isprint(ch))
            {
                esp0_outbyte(8);    // send opcode '8'
                esp0_outbyte(ch);   // send char
            }
        }
    }
}

serial_tx_string_test()
{
    char *test = "\n\r\e[40;31mH\e[40;32mI \e[40;33mF\e[40;34mR\e[40;35mOM \e[40;36mD\e[40;37mU\e[40;92mO\e[40;93mD\e[40;94mY\e[40;95mN\e[40;96mE\e[40;97m.\n\r\0";
    char *c =test;
    esp0_outbyte(9);    // send opcode '9'
    while (*c != '\0') esp0_outbyte(*++c);
    esp0_outbyte(0);
}

serial_rx_test()
{
    char ch=' ';
    char ch1=' ';

    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Get Keystroke from Serial 0");
    puts("\e[0m");
    printcentered("send characters to Serial 0.");
    puts(" ");
    printcentered("Press any key on terminal keyboard to return to menu");
    while(!getk())
    {
        esp0_outbyte(10);        // send opcode '10'
        ch=esp0_inbytewait();   // get char
        if(ch!=0)
        {
            printf("\e[15;10HCharacter->\e[1m                     ");
            if(isprint(ch))
                printf("\e[15;23H %d (%c)",ch,ch);
            else
                printf("\e[15;23H %d",ch);
            printf("\e[0m");
        }
    }

}

serial_length_test()
{
    char ch;
    esp0_outbyte(11);    // send opcode '11'
    ch=esp0_inbytewait();   // get length
    printmessage("Serial Buffer Length fetched");
    printf("\e[23;30H\e[1m %d",ch);
    printf("\e[0m");
}

play_string_test()
{
    char *test = "A4 4 2 A4 4 2 A#4 4 2 C5 4 2 C5 4 2 A#4 4 2 A4 4 2 G4 4 2 F4 4 2 F4 4 2 G4 4 2 A4 4 2 A4 2 2 G4 16 2 G4 2 2 P 8 2";
    char *c =test;
    esp0_outbyte(12);    // send opcode '12'
    while (*c != '\0') esp0_outbyte(*++c);
    esp0_outbyte(0);
    printmessage("Test String Played.");
}

play_sound_test()
{
    struct playsounddata data;
    int tmp;
    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Play Sound on PSG");
    puts("\e[0m");

    printf("\e[11;3HAttack     ->");
    printf("\e[12;3HDecay      ->");
    printf("\e[13;3HSustain    ->");
    printf("\e[14;3HRelease    ->");
    printf("\e[15;3HWave Type  ->           0=Square, 1=Sine, 2=Triangle, 3=Sawtooth, 4=Noise");
    printf("\e[16;3HVolume     ->");
    printf("\e[17;3HDuration   ->");
    printf("\e[18;3HStart Freq.->");
    printf("\e[19;3HEnd Freq.  ->");
    printf("\e[20;3HModifier   ->           0=None, 1=To End, 2=To Relese, 3=To Sustain");

    printf("\e[11;18H\e[1m"); data.attack=getlong();
    printf("\e[12;18H\e[1m"); data.decay=getlong();
    printf("\e[13;18H\e[1m"); data.sustain=getint();
    printf("\e[14;18H\e[1m"); data.release=getlong();
    printf("\e[15;18H\e[1m"); data.wave=getbyte();
    printf("\e[16;18H\e[1m"); data.volume=getint();
    printf("\e[17;18H\e[1m"); data.durationms=getint();
    printf("\e[18;18H\e[1m"); data.freq_start=getint();
    printf("\e[19;18H\e[1m"); data.freq_end=getint();
    printf("\e[20;18H\e[1m");data.modfreq=getbyte();

    esp0_outbyte(13);        // send opcode '13'
    esp0_outstruct(data,sizeof(data));
}

set_volume_test()
{
    int volume;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set Master Volume on PSG");
    puts("\e[0m");

    printf("\e[16;3HVolume     ->");

    volume=getint();

    esp0_outbyte(14);        // send opcode '14'
    esp0_outbyte(((unsigned char *)(&volume))[0]);
}

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

serial2_baud_rate_test()
{
    long baud=0;

    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts(" ");
    printcenteredbold("Set Serial 2 Baud Rate");
    puts(" ");
    printf("\e[15;10HBaud Rate->\e[1m");
    baud=getlong();

    esp1_outbyte(6);    // send opcode '6'
    esp1_outlong(baud);
}
serial2_mode_test()
{
    char mode=0;

    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts(" ");
    printcenteredbold("Set Serial 2 mode");
    puts(" ");
    printcentered("0 = 8 data bits, no parity, 1 stop bit");
    printcentered("1 = 8 data bits, even parity, 1 stop bit");
    printcentered("2 = 8 data bits, odd parity, 1 stop bit");
    printcentered("3 = 8 data bits, no parity, 1 stop bit");
    printcentered("4 = 8 data bits, even parity, 1 stop bit");
    printcentered("5 = 8 data bits, odd parity, 1 stop bit");

    printf("\e[17;10HSerial Mode->\e[1m");
    mode=getbyte();
    esp1_outbyte(7);    // send opcode '7'
    esp1_outbyte(mode);
}
serial2_tx_single_char_test()
{
    char ch=' ';
    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Output single char to Serial 2");
    puts("\e[0m");
    printcentered("Type characters to be echoed to Serial 2.  Press 'ESC' to return to menu");
    while(ch!='\e')
    {
        printf("\e[15;10HKey->\e[1m");
        ch = getchar();
        printf("\e[0m");

        if(ch!='\e')
        {
            if(isprint(ch))
            {
                esp1_outbyte(8);    // send opcode '8'
                esp1_outbyte(ch);   // send char
            }
        }
    }
}
serial2_tx_string_test()
{
    char *test = "\n\r\e[40;31mH\e[40;32mI \e[40;33mF\e[40;34mR\e[40;35mOM \e[40;36mD\e[40;37mU\e[40;92mO\e[40;93mD\e[40;94mY\e[40;95mN\e[40;96mE\e[40;97m.\n\r\0";
    char *c =test;
    esp1_outbyte(9);    // send opcode '9'
    while (*c != '\0') esp1_outbyte(*++c);
    esp1_outbyte(0);
}
serial2_rx_test()
{
    char ch=' ';
    char ch1=' ';

    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Get Keystroke from Serial 2");
    puts("\e[0m");
    printcentered("send characters to Serial 2.");
    puts(" ");
    printcentered("Press any key on terminal keyboard to return to menu");
    while(!getk())
    {
        esp1_outbyte(10);        // send opcode '10'
        ch=esp1_inbytewait();   // get char
        if(ch!=0)
        {
            printf("\e[15;10HCharacter->\e[1m                     ");
            if(isprint(ch))
                printf("\e[15;23H %d (%c)",ch,ch);
            else
                printf("\e[15;23H %d",ch);
            printf("\e[0m");
        }
    }

}
serial2_length_test()
{
    char ch;
    esp1_outbyte(11);    // send opcode '11'
    ch=esp1_inbytewait();   // get length
    printmessage("Serial 2 Buffer Length fetched");
    printf("\e[23;30H\e[1m %d",ch);
    printf("\e[0m");
}

set_wifi_ssid_test()
{
    char buffer[64];
    char *c =buffer;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set WiFi SSID");
    puts("\e[0m");

    printf("\e[11;3HWiFi SSID  ->");

    printf("\e[11;18H\e[1m"); getstring(buffer);
    esp1_outbyte(1);        // send opcode '1'
    while (*c != '\0')  esp1_outbyte(*c++);
    esp1_outbyte(0);
}
set_wifi_password_test()
{
    char buffer[64];
    char *c =buffer;
    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set WiFi Password");
    puts("\e[0m");

    printf("\e[11;3HWiFi Password  ->");

    printf("\e[11;24H\e[1m"); getstring(buffer);
    esp1_outbyte(2);        // send opcode '1'
   while (*c != '\0') esp1_outbyte(*c++);
   esp1_outbyte(0);
}
connect_to_wifi_test()
{
    esp1_outbyte(3);    // send opcode '3'
}
get_wifi_status_test()
{
    char ch;
    esp1_outbyte(4);    // send opcode '4'
    ch=esp1_inbytewait();   // get status
    printmessage("Wifi Status=");
    printf("\e[23;30H\e[1m %d",ch);
    printf("\e[0m");
}
get_wifi_signal_strength_test()
{
    int ch;
    esp1_outbyte(5);    // send opcode '5'
    ch=esp1_inbytewait();   // get status
    printmessage("Wifi Signal Strength=");
    printf("\e[23;30H\e[1m %d",ch);
    printf("\e[0m");
}
get_ip_address_test()
{
    int o1,o2,o3,o4;
    esp1_outbyte(12);    // send opcode '12'
    o1=esp1_inbytewait();   // get octet 1
    o2=esp1_inbytewait();   // get octet 2
    o3=esp1_inbytewait();   // get octet 3
    o4=esp1_inbytewait();   // get octet 4
    printmessage("IP Address=");
    printf("\e[23;20H\e[1m %d.%d.%d.%d",o1,o2,o3,o4);
    printf("\e[0m");
}
get_subnet_mask_test()
{
    int o1,o2,o3,o4;
    esp1_outbyte(13);    // send opcode '13'
    o1=esp1_inbytewait();   // get octet 1
    o2=esp1_inbytewait();   // get octet 2
    o3=esp1_inbytewait();   // get octet 3
    o4=esp1_inbytewait();   // get octet 4
    printmessage("Subnet Mask=");
    printf("\e[23;20H\e[1m %d.%d.%d.%d",o1,o2,o3,o4);
    printf("\e[0m");
}
get_gateway_test()
{
    int o1,o2,o3,o4;
    esp1_outbyte(14);    // send opcode '14'
    o1=esp1_inbytewait();   // get octet 1
    o2=esp1_inbytewait();   // get octet 2
    o3=esp1_inbytewait();   // get octet 3
    o4=esp1_inbytewait();   // get octet 4
    printmessage("IP Gateway=");
    printf("\e[23;20H\e[1m %d.%d.%d.%d",o1,o2,o3,o4);
    printf("\e[0m");
}
get_primary_dns_test()
{
    int o1,o2,o3,o4;
    esp1_outbyte(15);    // send opcode '15'
    o1=esp1_inbytewait();   // get octet 1
    o2=esp1_inbytewait();   // get octet 2
    o3=esp1_inbytewait();   // get octet 3
    o4=esp1_inbytewait();   // get octet 4
    printmessage("Primary DNS Address=");
    printf("\e[23;25H\e[1m %d.%d.%d.%d",o1,o2,o3,o4);
    printf("\e[0m");
}
get_secondary_dns_test()
{
    int o1,o2,o3,o4;
    esp1_outbyte(16);    // send opcode '16'
    o1=esp1_inbytewait();   // get octet 1
    o2=esp1_inbytewait();   // get octet 2
    o3=esp1_inbytewait();   // get octet 3
    o4=esp1_inbytewait();   // get octet 4
    printmessage("Secondary DNS Address=");
    printf("\e[23;25H\e[1m %d.%d.%d.%d",o1,o2,o3,o4);
    printf("\e[0m");
}
set_ip_address_test()
{
    char o1,o2,o3,o4;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set WiFi IP Address");
    puts("\e[0m");

    printf("\e[11;3HIP Octet 1     ->");
    printf("\e[12;3HIP Octet 2     ->");
    printf("\e[13;3HIP Octet 3     ->");
    printf("\e[14;3HIP Octet 4     ->");

    printf("\e[11;25H\e[1m"); o1=getbyte();
    printf("\e[12;25H\e[1m"); o2=getbyte();
    printf("\e[13;25H\e[1m"); o3=getbyte();
    printf("\e[14;25H\e[1m"); o4=getbyte();

    esp1_outbyte(17);        // send opcode '17'
    esp1_outbyte(o1);
    esp1_outbyte(o2);
    esp1_outbyte(o3);
    esp1_outbyte(o4);
}
set_subnet_mask_test()
{
    char o1,o2,o3,o4;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set WiFi Subnet Address");
    puts("\e[0m");

    printf("\e[11;3HSubnet Octet 1 ->");
    printf("\e[12;3HSubnet Octet 2 ->");
    printf("\e[13;3HSubnet Octet 3 ->");
    printf("\e[14;3HSubnet Octet 4 ->");

    printf("\e[11;25H\e[1m"); o1=getbyte();
    printf("\e[12;25H\e[1m"); o2=getbyte();
    printf("\e[13;25H\e[1m"); o3=getbyte();
    printf("\e[14;25H\e[1m"); o4=getbyte();

    esp1_outbyte(18);        // send opcode '18'
    esp1_outbyte(o1);
    esp1_outbyte(o2);
    esp1_outbyte(o3);
    esp1_outbyte(o4);
}
set_gateway_test()
{
    char o1,o2,o3,o4;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set WiFi Gateway Address");
    puts("\e[0m");

    printf("\e[11;3HGateway Octet 1 ->");
    printf("\e[12;3HGateway Octet 2 ->");
    printf("\e[13;3HGateway Octet 3 ->");
    printf("\e[14;3HGateway Octet 4 ->");

    printf("\e[11;25H\e[1m"); o1=getbyte();
    printf("\e[12;25H\e[1m"); o2=getbyte();
    printf("\e[13;25H\e[1m"); o3=getbyte();
    printf("\e[14;25H\e[1m"); o4=getbyte();

    esp1_outbyte(19);        // send opcode '19'
    esp1_outbyte(o1);
    esp1_outbyte(o2);
    esp1_outbyte(o3);
    esp1_outbyte(o4);
}
set_primary_dns_test()
{
    char o1,o2,o3,o4;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set WiFi Primary DNS Address");
    puts("\e[0m");

    printf("\e[11;3HDNS Octet 1     ->");
    printf("\e[12;3HDNS Octet 2     ->");
    printf("\e[13;3HDNS Octet 3     ->");
    printf("\e[14;3HDNS Octet 4     ->");

    printf("\e[11;25H\e[1m"); o1=getbyte();
    printf("\e[12;25H\e[1m"); o2=getbyte();
    printf("\e[13;25H\e[1m"); o3=getbyte();
    printf("\e[14;25H\e[1m"); o4=getbyte();

    esp1_outbyte(20);        // send opcode '20'
    esp1_outbyte(o1);
    esp1_outbyte(o2);
    esp1_outbyte(o3);
    esp1_outbyte(o4);
}
set_secondary_dns_test()
{
    char o1,o2,o3,o4;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set WiFi Primary DNS Address");
    puts("\e[0m");

    printf("\e[11;3HDNS Octet 1     ->");
    printf("\e[12;3HDNS Octet 2     ->");
    printf("\e[13;3HDNS Octet 3     ->");
    printf("\e[14;3HDNS Octet 4     ->");

    printf("\e[11;25H\e[1m"); o1=getbyte();
    printf("\e[12;25H\e[1m"); o2=getbyte();
    printf("\e[13;25H\e[1m"); o3=getbyte();
    printf("\e[14;25H\e[1m"); o4=getbyte();

    esp1_outbyte(21);        // send opcode '21'
    esp1_outbyte(o1);
    esp1_outbyte(o2);
    esp1_outbyte(o3);
    esp1_outbyte(o4);
}

set_hostname_test()
{
    char buffer[64];
    char *c =buffer;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set WiFi Hostname");
    puts("\e[0m");

    printf("\e[11;3HWiFi Hostname  ->");

    printf("\e[11;25H\e[1m"); getstring(buffer);
    esp1_outbyte(22);        // send opcode '22'
    while (*c != '\0')  esp1_outbyte(*c++);
    esp1_outbyte(0);
}
set_incoming_port_test()
{
    int port;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Set incoming TCP Port");
    puts("\e[0m");

    printf("\e[11;3HTCP Port      ->");

    printf("\e[11;20H\e[1m"); port=getint();
    puts("\e[0m");
    esp1_outbyte(24);        // send opcode '24'
    esp1_outint(port);
}
out_byte_to_connection_test()
{
    char ch=' ';
    char connection;
    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Output single char to TCP Connection");
    puts("\e[0m");
    printcentered("Type characters to be echoed to TCP Connection.  Press 'ESC' to return to menu");

    printf("\e[11;3HTCP Connection      ->");

    printf("\e[11;27H\e[1m"); connection=getbyte();

    while(ch!='\e')
    {
        printf("\e[20;10HKey->\e[1m");
        ch = getchar();
        printf("\e[0m");

        if(ch!='\e')
        {
            if(isprint(ch))
            {
                esp1_outbyte(25);    // send opcode '25'
                esp1_outbyte(connection);   // send connection
                esp1_outbyte(ch);   // send char
            }
        }
    }
}
out_string_to_connection_test()
{
    char *test = "\n\r\e[40;31mH\e[40;32mI \e[40;33mF\e[40;34mR\e[40;35mOM \e[40;36mD\e[40;37mU\e[40;92mO\e[40;93mD\e[40;94mY\e[40;95mN\e[40;96mE\e[40;97m.\n\r\0";
    char *c =test;
    char connection;
    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Output String to TCP Connection");
    puts("\e[0m");

    printf("\e[11;3HTCP Connection      ->");
    printf("\e[11;27H\e[1m"); connection=getbyte();
    puts("\e[0m");
    esp1_outbyte(26);    // send opcode '26'
    esp1_outbyte(connection);   // send connection
    while (*c != '\0') esp1_outbyte(*++c);
    esp1_outbyte(0);
}
in_byte_from_connection_test()
{
    char ch=' ';
    char ch1=' ';
    char connection;
    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Get Characters from TCP Connection");
    puts("\e[0m");
    puts(" ");
    printcentered("Press any key on terminal keyboard to return to menu");

    printf("\e[11;3HTCP Connection      ->");

    printf("\e[11;27H\e[1m"); connection=getbyte();
    puts("\e[0m");
    while(!getk())
    {
        esp1_outbyte(28);        // send opcode '28'
        ch=esp1_inbytewait();   // get length
        if(ch>0)
        {
            esp1_outbyte(27);        // send opcode '27'
            esp1_outbyte(connection);
            ch=esp1_inbytewait();   // get char
            printf("\e[15;10HCharacter->\e[1m                     ");
            if(isprint(ch))
                printf("\e[15;23H %d (%c)",ch,ch);
            else
                printf("\e[15;23H %d",ch);
            printf("\e[0m");
        }
    }
}
queue_length_from_connection_test()
{
    int ch;
    char connection;
    printf("\e[2J\e[0m\e[H");

    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Get TCP Connection Queue Length");
    puts("\e[0m");
    printf("\e[11;3HTCP Connection      ->");
    printf("\e[11;27H\e[1m"); connection=getbyte();
    puts("\e[0m");
    esp1_outbyte(28);        // send opcode '28'
    ch=esp1_inbytewait();   // get char

    printf("\e[18;3HQueue Length= \e[1m %d \e[0m",ch);
     printf("\n\r\n\r Press Any Key . . .");

    getchar();
}
set_byte_mode_test()
{
    char TELNET_CHAR_MODE[]={255,251,1,255,251,3,255,252,34,0,0};
    char *c=TELNET_CHAR_MODE;
    esp1_outbyte(26);    // send opcode '26'
    esp1_outbyte(0);   // send connection
    while (*c != '\0') esp1_outbyte(*++c);
    esp1_outbyte(0);
}
create_tcp_connection_test()
{
    char hostname[64];
    char *c=hostname;
    int port;
    char connection;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts("\e[1m");
    printcentered("Create TCP Connection");
    puts("\e[0m");
    printf("\e[11;3HTCP Connection      ->");
    printf("\e[12;3HTCP Port            ->");
    printf("\e[13;3HHost Name           ->");

    printf("\e[11;27H\e[1m"); connection=getbyte();
    printf("\e[12;27H\e[1m"); port=getint();
    printf("\e[13;27H\e[1m"); getstring(hostname);
    puts("\e[0m");

    esp1_outbyte(23);        // send opcode '23'
    esp1_outbyte(connection);
    esp1_outint(port);
    while (*c != '\0') esp1_outbyte(*++c);
    esp1_outbyte(0);
}

menu_page1()
{
    char ch;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts(" ");
    printmenu('1',"Output single char to VGA",'H',"Set Resolution");

    printmenu('2',"Output 100 single chars to VGA",'I',"Load Font");
    printmenu('3',"Output string to VGA",'J',"Copy Rectangle");
    printmenu('4',"Get Keystroke",'K',"Draw Bitmap");
    printmenu('5',"Get Key Buffer Length",'L',"Draw Char");
    printmenu('6',"Set Cursor visibility",'M',"Draw Ellipse");
    printmenu(NULL,NULL,'N',"Draw Glyph");
    printmenu('7',"Set serial baud rate",'O',"Draw Line");
    printmenu('8',"Set serial mode",'P',"Draw Rectangle");
    printmenu('9',"Serial TX single char",'Q',"Fill Ellipse");
    printmenu('A',"Serial TX string",'R',"Fill Rectangle");
    printmenu('B',"Serial RX",'S',"Get Pixel");
    printmenu('C',"Serial Buffer Length",'T',"Invert Rectangle");
    printmenu(NULL,NULL,'U',"Draw Line To");
    printmenu('D',"Play String",'V',"Move Cursor To");
    printmenu('E',"Play Sound",'W',"Scroll");
    printmenu('F',"Set Volume",'X',"Set Brush Color");
    printmenu('G',"Clear Screen",'Y',"\e[1mMenu Page TWO\e[0m");
    printmenu('Z',"\e[1mExit Program\e[0m",NULL,NULL);

    for(;;)
    {
        printf("\e[22;1HSelection->\e[1m");
        ch = getchar();
        printf("\e[0m");
        ch = toupper(ch);

        switch (ch)
        {
            case '1':
                send_char_test();
                return 1;
            case '2':
                send_100_char_test();
                printmessage("100 characters sent.");
                break;
            case '3':
                send_string_test();
                printmessage("string sent.");
                break;
            case '4':
                get_key_test();
                return 1;
            case '5':
                get_key_buffer_len_test();
                break;
            case '6':
                cursor_visibility_test();
                return 1;
            case '7':
                serial_baud_rate_test();
                return 1;
            case '8':
                serial_mode_test();
                return 1;
            case '9':
                serial_tx_single_char_test();
                return 1;
            case 'A':
                serial_tx_string_test();
                break;
            case 'B':
                serial_rx_test();
                return 1;
            case 'C':
                serial_length_test();
                break;
            case 'D':
                play_string_test();
                break;
            case 'E':
                play_sound_test();
                return 1;
            case 'F':
                set_volume_test();
                return 1;
            case 'G':
                clear_screen_test();
                break;
            case 'H':
                set_resolution_test();
                return 1;
            case 'I':
                set_font_test();
                return 1;
            case 'J':
                copy_rectangle_test();
                return 1;
            case 'K':
                draw_bitmap_test();
                return 1;
            case 'L':
                draw_char_test();
                return 1;
            case 'M':
                draw_ellipse_test();
                return 1;
            case 'N':
                draw_glyph_test();
                return 1;
            case 'O':
                draw_line_test();
                return 1;
            case 'P':
                draw_rectangle_test();
                return 1;
            case 'Q':
                fill_ellipse_test();
                return 1;
            case 'R':
                fill_rectangle_test();
                return 1;
            case 'S':
                get_pixel_test();
                return 1;
            case 'T':
                invert_rectangle_test();
                return 1;
            case 'U':
                draw_line_to_test();
                return 1;
            case 'V':
                move_cursor_to_test();
                return 1;
            case 'W':
                scroll_test();
                return 1;
            case 'X':
                set_brush_color_test();
                return 1;
            case 'Y':
                return 2;
            case 'Z':
                printf("\e[2J\e[0m\e[H\e[0m\n\r\n\r");
                exit(0);
        }
    }
}

menu_page2()
{
    char ch;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts(" ");
    printmenu('1',"Set Line End Type",'H',"Serial 2 RX ");
    printmenu('2',"Set Pen Color",'I',"Serial 2 Buffer Length");
    printmenu('3',"Set Pen Width",'J',"Set Wifi SSID");
    printmenu('4',"Set Pixel",'K',"Set WiFi Password");
    printmenu('5',"Set Glyph Options",'L',"Connect To WiFi");
    printmenu('6',"Set Palette Item",'M',"Get WiFi Status");
    printmenu('7',"Set Mouse Cursor",'N',"Get WiFi Signal Strength");
    printmenu('8',"Set Mouse Cursor Position",'O',"Get IP Address");
    printmenu(NULL,NULL,'P',"Get Subnet Mask");
    printmenu('9',"Remove Sprites",'Q',"Get Gateway");
    printmenu('A',"Set Sprite Map",'R',"Get Primary DNS");
    printmenu('B',"Set Sprite Location",'S',"Get Secondary DNS");
    printmenu('C',"Set Sprite Visibility",'T',"Set IP Address");
    printmenu(NULL,NULL,'U',"Set Subnet Mask");
    printmenu('D',"Set Serial 2 baud rate",'V',"Set Gateway");
    printmenu('E',"Set Serial 2 mode",'W',"Set Primary DNS");
    printmenu('F',"Serial 2 TX single char",'X',"Set Secondary DNS");
    printmenu('G',"Serial 2 TX String",'Y',"\e[1mMenu Page THREE\e[0m");
    printmenu('Z',"\e[1mMenu Page ONE\e[0m",NULL,NULL);


    for(;;)
    {
        printf("\e[22;1HSelection->\e[1m");
        ch = getchar();
        printf("\e[0m");
        ch = toupper(ch);

        switch (ch)
        {
            case '1':
                set_line_end_test();
                return 2;
            case '2':
                set_pen_color_test();
                return 2;
            case '3':
                set_pen_width_test();
                return 2;
            case '4':
                set_pixel_test();
                return 2;
            case '5':
                set_glyph_options_test();
                return 2;
            case '6':
                set_palette_item_test();
                return 2;
            case '7':
                set_mouse_cursor_test();
                return 2;
            case '8':
                set_mouse_cursor_position_test();
                return 2;
            case '9':
                remove_sprites_test();
                printmessage("Sprites Removed.");
                break;
            case 'A':
                set_sprite_map_test();
                printmessage("Sprite Map Defined.");
                break;
            case 'B':
                set_sprite_location_test();
                return 2;
            case 'C':
                set_sprite_visibility_test();
                return 2;
            case 'D':
                serial2_baud_rate_test();
                return 2;
            case 'E':
                serial2_mode_test();
                return 2;
            case 'F':
                serial2_tx_single_char_test();
                return 2;
            case 'G':
                serial2_tx_string_test();
                break;
            case 'H':
                serial2_rx_test();
                return 2;
            case 'I':
                serial2_length_test();
                break;
            case 'J':
                set_wifi_ssid_test();
                return 2;
            case 'K':
                set_wifi_password_test();
                return 2;
            case 'L':
                connect_to_wifi_test();
                printmessage("Connecting to WiFi.");
                break;
            case 'M':
                get_wifi_status_test();
                break;
            case 'N':
                get_wifi_signal_strength_test();
                break;
            case 'O':
                get_ip_address_test();
                break;
            case 'P':
                get_subnet_mask_test();
                break;
            case 'Q':
                get_gateway_test();
                break;
            case 'R':
                get_primary_dns_test();
                break;
            case 'S':
                get_secondary_dns_test();
                break;
            case 'T':
                set_ip_address_test();
                return 2;
            case 'U':
                set_subnet_mask_test();
                return 2;
            case 'V':
                set_gateway_test();
                return 2;
            case 'W':
                set_primary_dns_test();
                return 2;
            case 'X':
                set_secondary_dns_test();
                return 2;
            case 'Y':
                return 3;
            case 'Z':
                return 1;
        }
    }
}

menu_page3()
{
    char ch;

    printf("\e[2J\e[0m\e[H");
    printcentered("Nhyodyne ESP32 IO board test");
    puts(" ");
    printmenu('1',"Set Hostname",NULL,NULL);
    printmenu('2',"Set Incoming Port",NULL,NULL);
    puts(" ");
    printmenu('3',"Out Byte To Connection",NULL,NULL);
    printmenu('4',"Out String To Connection",NULL,NULL);
    printmenu('5',"In Byte From Connection",NULL,NULL);
    printmenu('6',"Queue Length for Connection",NULL,NULL);
    puts(" ");
    printmenu('7',"Place Connection 0 in byte mode (for telent clients)",NULL,NULL);
    puts(" ");
    printmenu('8',"Create Outgoing TCP Connection",NULL,NULL);
    puts(" ");
    printmenu('Z',"\e[1mMenu Page TWO\e[0m",NULL,NULL);

    for(;;)
    {
        printf("\e[22;1HSelection->\e[1m");
        ch = getchar();
        printf("\e[0m");
        ch = toupper(ch);

        switch (ch)
        {
            case '1':
                set_hostname_test();
                return 3;
            case '2':
                set_incoming_port_test();
                return 3;
            case '3':
                out_byte_to_connection_test();
                return 3;
            case '4':
                out_string_to_connection_test();
                return 3;
            case '5':
                in_byte_from_connection_test();
                return 3;
            case '6':
                queue_length_from_connection_test();
                return 3;
            case '7':
                set_byte_mode_test();
                printmessage("Byte Mode Selected.");
                break;
            case '8':
                create_tcp_connection_test();
                return 3;
            case 'Z':
                return 2;
        }
    }
}


main()
{
    int menu=1;
    cpm_ver = bdos(CPM_VERS, 0);

    if ((cpm_ver == 0) || (cpm_ver > 0x2F))
        printf("\nWARNING: unsupported CP/M version detected: %x.%x\n\n", cpm_ver >> 4, cpm_ver & 0xf);

    for(;;)
    {
        switch(menu)
        {
            case 1:
                menu=menu_page1();
                break;
            case 2:
                menu=menu_page2();
                break;
            case 3:
                menu=menu_page3();
                break;
            default:
                menu=menu_page1();
                break;
        }
    }

    return 0;
}
