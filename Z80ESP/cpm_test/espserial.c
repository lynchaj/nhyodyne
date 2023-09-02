
#include "esplowlevel.h"
#include "espui.h"

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
