#include "esplowlevel.h"
#include "espui.h"

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
