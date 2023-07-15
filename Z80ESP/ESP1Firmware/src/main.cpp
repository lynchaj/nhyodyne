#include <Arduino.h>
#include <fabgl.h>
#include <WiFi.h>
#include "pins.h"
#include "interface.h"
#include "serial.h"
#include "retrowifi.h"

fabgl::PS2Controller PS2Controller;

serialHelper serial;
retroWifi espWifi;

static uint8_t stateMachine = 0;
// states
// 0 waiting for command
// 1 WIFI Set SSID, waiting for char
// 2 WIFI Set SSID Password, waiting for char
// 4 Serial Port Baud Rate wait for bytes
// 5 Serial Port Baud Rate wait for byte of mode
// 6 Serial Port out single char, waiting for char
// 7 Serial Port out multi, waiting for char
// 8 Set IP Address, waiting for char
// 9 Set Subnet Mask, waiting for char
// 10 Set Gateway,waiting for char
// 11 Set Primary DNS, waiting for char
// 12 Set Secondary DNS, waiting for char
void processOpcode(uint8_t b);
void attachInterruptTask(void *pvParameters);

void setup()
{
    pinMode(OUTCLK, OUTPUT);
    pinMode(INCLK, OUTPUT);
    pinMode(OUTDATA, OUTPUT);
    pinMode(INDATA, INPUT);

    pinMode(BUSY, OUTPUT);
    pinMode(READY, OUTPUT);

    digitalWrite(INCLK, LOW);

    digitalWrite(OUTCLK, HIGH);
    digitalWrite(OUTDATA, LOW);

    digitalWrite(BUSY, LOW);
    digitalWrite(READY, LOW);

    pinMode(WR, INPUT);
    pinMode(RD, INPUT);
    attachInterrupt(WR, WRISR, FALLING);
    attachInterrupt(RD, RDISR, FALLING);

    PS2Controller.begin(PS2Preset::MousePort0);
    espWifi.initialize();
}

void loop()
{
    int tb = 0;

    if (!bufferEmpty())
    {
        switch (stateMachine)
        {
        case 0: // 0 waiting for command
            processOpcode(popByte());
            break;
        case 1: // 1 WIFI Set SSID, waiting for char
            if (espWifi.setSSID(popByte()))
                stateMachine = 0;
            break;
        case 2: // 2 WIFI Set SSID Password, waiting for char
            if (espWifi.setPassword(popByte()))
                stateMachine = 0;
            break;
        case 4: // 4 Serial Port Baud Rate wait for bytes
            if (bufferLength() > 3)
            {
                serial.setBaud(popDoubleWord());
                stateMachine = 0;
            }
            break;
        case 5: // 5 Serial Port Baud Rate wait for byte of mode
            serial.setSerialMode(popByte());
            stateMachine = 0;
            break;
        case 6: // 6 Serial Port out single char, waiting for char
            Serial.write(popByte());
            stateMachine = 0;
            break;
        case 7: // 7 Serial Port out multi, waiting for char
            tb = popByte();
            if (tb == 0)
            {
                stateMachine = 0;
            }
            else
            {
                Serial.write(tb);
            }
            break;
        case 8: // 8 Set IP Address, waiting for char
            if (espWifi.SetIpAddress(popByte()))
                stateMachine = 0;
            break;
        case 9: // 9 Set Subnet Mask, waiting for char
            if (espWifi.SetSubnet(popByte()))
                stateMachine = 0;
            break;
        case 10: // 10 Set Gateway,waiting for char
            if (espWifi.SetGateway(popByte()))
                stateMachine = 0;
            break;
        case 11: // 11 Set Primary DNS, waiting for char
            if (espWifi.SetPrimaryDns(popByte()))
                stateMachine = 0;
            break;
        case 12: // 12 Set Secondary DNS, waiting for char
            if (espWifi.SetSecondaryDns(popByte()))
                stateMachine = 0;
            break;
        }
    }
}

void processOpcode(uint8_t b)
{
    switch (b)
    {
    case 0: // NOP
        stateMachine = 0;
        break;
    case 1: // Get SSID
        espWifi.resetPointer();
        stateMachine = 1;
        break;
    case 2: // Get Password
        espWifi.resetPointer();
        stateMachine = 2;
        break;
    case 3: // WiFi Connect
        espWifi.Connect();
        stateMachine = 0;
        break;
    case 4: // Get Wifi Status
        queueByte(espWifi.status());
        stateMachine = 0;
        break;
    case 5: // Get Wifi Signal Strength
        queueByte(espWifi.strength());
        stateMachine = 0;
        break;
    case 6: // GET SERIAL BAUD
        stateMachine = 4;
        break;
    case 7: // GET SERIAL MODE
        stateMachine = 5;
        break;
    case 8: // OUT SERIAL CHAR
        stateMachine = 6;
        break;
    case 9: // OUT SERIAL NULL TERM STRING
        stateMachine = 7;
        break;
    case 10: // GET SERIAL CHAR
        serial.serialIn();
        stateMachine = 0;
        break;
    case 11: // GET SERIAL WAITING
        queueByte(Serial.available());
        stateMachine = 0;
        break;
    case 12: // GET IP ADDRESS
        espWifi.GetIpAddress();
        stateMachine = 0;
        break;
    case 13: // GET SUBNET MASK
        espWifi.GetSubnet();
        stateMachine = 0;
        break;
    case 14: // GET GATEWAY
        espWifi.GetGateway();
        stateMachine = 0;
        break;
    case 15: // GET PRIMARY DNS
        espWifi.GetPrimaryDns();
        stateMachine = 0;
        break;
    case 16: // GET SECONDARY DNS
        espWifi.GetSecondaryDns();
        stateMachine = 0;
        break;
    case 17: // SET IP ADDRESS
        espWifi.resetPointer();
        stateMachine = 8;
        break;
    case 18: // SET SUBNET
        espWifi.resetPointer();
        stateMachine = 9;
        break;
    case 19: // SET GATEWAY
        espWifi.resetPointer();
        stateMachine = 10;
        break;
    case 20: // SET PRIMARY DNS
        espWifi.resetPointer();
        stateMachine = 11;
        break;
    case 21: // SET SECONDARY DNS
        espWifi.resetPointer();
        stateMachine = 12;
        break;

    case 255: // HARDWARE DISCOVERY
        stateMachine = 0;
        queueByte('E');
        queueByte('S');
        queueByte('P');
        queueByte('3');
        queueByte('2');
        queueByte('V');
        queueByte('1');
        break;
    }
}
