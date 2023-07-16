#pragma once
#include <Arduino.h>
#include <Preferences.h>

class retroWifi
{

public:
    void initialize();
    void resetPointer();
    bool setSSID(uint8_t b);
    bool setPassword(uint8_t b);
    void Connect();
    uint8_t status();
    uint8_t strength();
    void GetIpAddress();
    void GetSubnet();
    void GetGateway();
    void GetPrimaryDns();
    void GetSecondaryDns();
    bool SetIpAddress(uint8_t b);
    bool SetSubnet(uint8_t b);
    bool SetGateway(uint8_t b);
    bool SetPrimaryDns(uint8_t b);
    bool SetSecondaryDns(uint8_t b);
    bool setHostname(uint8_t b);
    bool CreateOutgoingConnection(uint8_t b);
    void SetIncomingPort(uint16_t b);
    bool OutByteToConnection(uint8_t b);
    bool OutStringToConnection(uint8_t b);
    void InByteFromConnection(uint8_t b);
    void QueuedBytesFromConnection(uint8_t b);
    void listenForIncomingConnection();

private:
    IPAddress getStoredIP(const char *Parameter);
    void setStoredIP(const char* Parameter,IPAddress i);
    uint8_t *buffer;
    uint8_t *currentPointer;
    Preferences preferences;
    char *m_ssid = new char[64];
    char *m_password = new char[64];
    char *m_hostname = new char[64];
    IPAddress staticIP;
    IPAddress subnet;
    IPAddress gateway;
    IPAddress PrimaryDNS;
    IPAddress SecondaryDNS;
    WiFiClient client[64];
    WiFiServer server;

    struct OutgoingConnectionParameter
    {
        uint8_t connectionNumber;
        uint16_t portNumber;
    } __attribute__((packed));

};