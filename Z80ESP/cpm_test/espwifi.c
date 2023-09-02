#include "esplowlevel.h"
#include "espui.h"
#include "testesp.h"


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

get_mac_address_test()
{
    int o1,o2,o3,o4,o5,o6;
    esp1_outbyte(30);    // send opcode '30'
    o1=esp1_inbytewait();   // get byte 1
    o2=esp1_inbytewait();   // get byte 2
    o3=esp1_inbytewait();   // get byte 3
    o4=esp1_inbytewait();   // get byte 4
    o5=esp1_inbytewait();   // get byte 5
    o6=esp1_inbytewait();   // get byte 6
    printmessage("MAC Address=");
    printf("\e[23;20H\e[1m %02x:%02x:%02x:%02x:%02x:%02x",o1,o2,o3,o4,o5,o6);
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
    while (*c != '\0') esp1_outbyte(*c++);
    esp1_outbyte(0);
}
