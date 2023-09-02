#define CONIO_VT100
#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <ctype.h>
#include <cpm.h>

#include "esplowlevel.h"
#include "espui.h"
#include "espconsole.h"
#include "espserial.h"
#include "espsound.h"
#include "espgraphics.h"
#include "espwifi.h"

int cpm_ver;

menu_page0()
{
    char ch;

    printf("\e[2J\e[0m\e[H");
    printcentered("ESP32 IO board Configuration");
    puts(" ");
    printmenu('1', "Set Display parameters", NULL, NULL);
    printmenu('2', "Set Serial parameters", NULL, NULL);
    printmenu('3', "Set Wifi parameters", NULL, NULL);
    printmenu('4', "Set Audio parameters", NULL, NULL);
    puts(" ");
    puts(" ");
    puts(" ");
    printmenu('Z', "\e[1mExit Program\e[0m", NULL, NULL);

    for (;;)
    {
        printf("\e[22;1HSelection->\e[1m");
        ch = getchar();
        printf("\e[0m");
        ch = toupper(ch);

        switch (ch)
        {
        case '1':
            return 1;
        case '2':
            return 2;
        case '3':
            return 3;
        case '4':
            return 4;
        case 'Z':
            printf("\e[2J\e[0m\e[H\e[0m\n\r\n\r");
            exit(0);
        }
    }
}

menu_page1()
{
    char ch;

    printf("\e[2J\e[0m\e[H");
    printcentered("ESP32 IO board Configuration");
    puts(" ");

    printmenu('1', "Set Display Resolution", NULL, NULL);
    printmenu('2', "Set Terminal Font", NULL, NULL);
    puts(" ");
    puts(" ");
    puts(" ");
    printmenu('Z', "\e[1mReturn to Main Menu\e[0m", NULL, NULL);

    for (;;)
    {
        printf("\e[22;1HSelection->\e[1m");
        ch = getchar();
        printf("\e[0m");
        ch = toupper(ch);

        switch (ch)
        {
        case '1':
            set_resolution_test();
            return 1;
        case '2':
            set_font_test();
            return 1;
        case 'Z':
            return 0;
        }
    }
}

menu_page2()
{
    char ch;

    printf("\e[2J\e[0m\e[H");
    printcentered("ESP32 IO board Configuration");
    puts(" ");

    printmenu('1', "Set serial 0 baud rate", NULL, NULL);
    printmenu('2', "Set serial 0 mode", NULL, NULL);
    puts(" ");
    printmenu('3', "Set Serial 1 baud rate", NULL, NULL);
    printmenu('4', "Set Serial 1 mode", NULL, NULL);
    puts(" ");
    puts(" ");
    puts(" ");
    printmenu('Z', "\e[1mReturn to Main Menu\e[0m", NULL, NULL);

    for (;;)
    {
        printf("\e[22;1HSelection->\e[1m");
        ch = getchar();
        printf("\e[0m");
        ch = toupper(ch);

        switch (ch)
        {
        case '1':
            serial_baud_rate_test();
            return 2;
        case '2':
            serial_mode_test();
            return 2;
        case '3':
            serial2_baud_rate_test();
            return 2;
        case '4':
            serial2_mode_test();
            return 2;

        case 'Z':
            return 0;
        }
    }
}

menu_page3()
{
    char ch;

    printf("\e[2J\e[0m\e[H");
    printcentered("ESP32 IO board Configuration");
    puts(" ");
    printmenu('1', "Set Wifi SSID", NULL, NULL);
    printmenu('2', "Set WiFi Password", NULL, NULL);
    printmenu('3', "Connect To WiFi", NULL, NULL);
    printmenu('4', "Get WiFi Status", NULL, NULL);
    printmenu('5', "Get WiFi Signal Strength", NULL, NULL);
    printmenu('6', "Get IP Address", NULL, NULL);
    printmenu('7', "Get Subnet Mask", NULL, NULL);
    printmenu('8', "Get Gateway", NULL, NULL);
    printmenu('9', "Get Primary DNS", NULL, NULL);
    printmenu('A', "Get Secondary DNS", NULL, NULL);
    printmenu('B', "Set IP Address", NULL, NULL);
    printmenu('C', "Set Subnet Mask", NULL, NULL);
    printmenu('D', "Set Gateway", NULL, NULL);
    printmenu('E', "Set Primary DNS", NULL, NULL);
    printmenu('F', "Set Secondary DNS", NULL, NULL);
    printmenu('G', "Get MAC Address", NULL, NULL);
    puts(" ");
    printmenu('Z', "\e[1mReturn to Main Menu\e[0m", NULL, NULL);

    for (;;)
    {
        printf("\e[22;1HSelection->\e[1m");
        ch = getchar();
        printf("\e[0m");
        ch = toupper(ch);

        switch (ch)
        {
        case '1':
            set_wifi_ssid_test();
            return 3;
        case '2':
            set_wifi_password_test();
            return 3;
        case '3':
            connect_to_wifi_test();
            printmessage("Connecting to WiFi.");
            break;
        case '4':
            get_wifi_status_test();
            break;
        case '5':
            get_wifi_signal_strength_test();
            break;
        case '6':
            get_ip_address_test();
            break;
        case '7':
            get_subnet_mask_test();
            break;
        case '8':
            get_gateway_test();
            break;
        case '9':
            get_primary_dns_test();
            break;
        case 'A':
            get_secondary_dns_test();
            break;
        case 'B':
            set_ip_address_test();
            return 3;
        case 'C':
            set_subnet_mask_test();
            return 3;
        case 'D':
            set_gateway_test();
            return 3;
        case 'E':
            set_primary_dns_test();
            return 3;
        case 'F':
            set_secondary_dns_test();
            return 3;
        case 'G':
            get_mac_address_test();
            break;
        case 'Z':
            return 0;
        }
    }
}

menu_page4()
{
    char ch;

    printf("\e[2J\e[0m\e[H");
    printcentered("ESP32 IO board Configuration");
    puts(" ");
    printmenu('1', "Set Audio Master Volume", NULL, NULL);
    puts(" ");
    puts(" ");
    puts(" ");
    printmenu('Z', "\e[1mReturn to Main Menu\e[0m", NULL, NULL);

    for (;;)
    {
        printf("\e[22;1HSelection->\e[1m");
        ch = getchar();
        printf("\e[0m");
        ch = toupper(ch);

        switch (ch)
        {
        case '1':
            set_volume_test();
            return 4;
        case 'Z':
            return 0;
        }
    }
}

main()
{
    int menu = 0;
    cpm_ver = bdos(CPM_VERS, 0);

    if ((cpm_ver == 0) || (cpm_ver > 0x2F))
        printf("\nWARNING: unsupported CP/M version detected: %x.%x\n\n", cpm_ver >> 4, cpm_ver & 0xf);

    for (;;)
    {
        switch (menu)
        {
        case 0:
            menu = menu_page0();
            break;
        case 1:
            menu = menu_page1();
            break;
        case 2:
            menu = menu_page2();
            break;
        case 3:
            menu = menu_page3();
            break;
        case 4:
            menu = menu_page4();
            break;

        default:
            menu = menu_page0();
            break;
        }
    }

    return 0;
}
