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
    void getIpAddress();
    void getSubnet();
    void getGateway();
    void getPrimaryDns();
    void getSecondaryDns();
    bool setIpAddress(uint8_t b);
    bool setSubnet(uint8_t b);
    bool setGateway(uint8_t b);
    bool setPrimaryDns(uint8_t b);
    bool setSecondaryDns(uint8_t b);
    bool setHostname(uint8_t b);
    bool createOutgoingConnection(uint8_t b);
    void setIncomingPort(uint16_t b);
    bool outByteToConnection(uint8_t b);
    bool outStringToConnection(uint8_t b);
    void inByteFromConnection(uint8_t b);
    void queuedBytesFromConnection(uint8_t b);
    void listenForIncomingConnection();
    void getMacAddress();

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
    IPAddress primaryDNS;
    IPAddress secondaryDNS;
    WiFiClient client[64];
    WiFiServer server;

    struct OutgoingConnectionParameter
    {
        uint8_t connectionNumber;
        uint16_t portNumber;
    } __attribute__((packed));

};