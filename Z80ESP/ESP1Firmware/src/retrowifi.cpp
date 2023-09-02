#include <Arduino.h>
#include <Preferences.h>
#include <WiFi.h>
#include "interface.h"
#include "retrowifi.h"
#include "pins.h"

void retroWifi::initialize()
{
    preferences.begin("retroESP32", false);
    WiFi.mode(WIFI_STA);
    String ssid = preferences.getString("ssid", "");
    String password = preferences.getString("password", "");
    String hostname = preferences.getString("hostname", "nhyodyne");
    strncpy(m_ssid, ssid.c_str(), 64);
    strncpy(m_password, password.c_str(), 64);
    strncpy(m_hostname, ssid.c_str(), 64);
    buffer = new uint8_t[256];
    currentPointer = buffer;
    staticIP = getStoredIP("static");
    gateway = getStoredIP("gateway");
    subnet = getStoredIP("subnet");
    primaryDNS = getStoredIP("primaryDNS");
    secondaryDNS = getStoredIP("secondaryDNS");
}

bool retroWifi::setSSID(uint8_t b)
{
    *currentPointer++ = b;
    if (b == 0)
    {
        strncpy(m_ssid,(char *)&buffer[0], 64);
        preferences.putString("ssid", m_ssid);
        return true;
    }
    return false;
}

bool retroWifi::setPassword(uint8_t b)
{
    *currentPointer++ = b;
    if (b == 0)
    {
        strncpy(m_password,(char *)&buffer[0], 64);
        preferences.putString("password", m_password);
        return true;
    }
    return false;
}

void retroWifi::resetPointer()
{
    currentPointer = buffer;
}

void retroWifi::Connect()
{
    if (staticIP[0] != 0)
    {
        WiFi.config(staticIP, gateway, subnet, primaryDNS, secondaryDNS);
    }
    WiFi.setHostname(m_hostname);
    WiFi.begin(m_ssid, m_password);
}

uint8_t retroWifi::status()
{
    return WiFi.status();
}

uint8_t retroWifi::strength()
{
    return WiFi.RSSI();
}

void retroWifi::getIpAddress()
{
    IPAddress add = WiFi.localIP();
    queueByte(add[0]);
    queueByte(add[1]);
    queueByte(add[2]);
    queueByte(add[3]);
}

void retroWifi::getSubnet()
{
    IPAddress add = WiFi.subnetMask();
    queueByte(add[0]);
    queueByte(add[1]);
    queueByte(add[2]);
    queueByte(add[3]);
}

void retroWifi::getGateway()
{
    IPAddress add = WiFi.gatewayIP();
    queueByte(add[0]);
    queueByte(add[1]);
    queueByte(add[2]);
    queueByte(add[3]);
}

void retroWifi::getPrimaryDns()
{
    IPAddress add = WiFi.dnsIP(0);
    queueByte(add[0]);
    queueByte(add[1]);
    queueByte(add[2]);
    queueByte(add[3]);
}

void retroWifi::getSecondaryDns()
{
    IPAddress add = WiFi.dnsIP(1);
    queueByte(add[0]);
    queueByte(add[1]);
    queueByte(add[2]);
    queueByte(add[3]);
}

bool retroWifi::setIpAddress(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == 4)
    {
        IPAddress i;
        i[0] = buffer[0];
        i[1] = buffer[1];
        i[2] = buffer[2];
        i[3] = buffer[3];
        setStoredIP("static", i);
        staticIP = getStoredIP("static");
        return true;
    }
    return false;
}

bool retroWifi::setSubnet(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == 4)
    {
        IPAddress i;
        i[0] = buffer[0];
        i[1] = buffer[1];
        i[2] = buffer[2];
        i[3] = buffer[3];
        setStoredIP("subnet", i);
        subnet = getStoredIP("subnet");
        return true;
    }
    return false;
}

bool retroWifi::setGateway(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == 4)
    {
        IPAddress i;
        i[0] = buffer[0];
        i[1] = buffer[1];
        i[2] = buffer[2];
        i[3] = buffer[3];
        setStoredIP("gateway", i);
        gateway = getStoredIP("gateway");
        return true;
    }
    return false;
}
bool retroWifi::setPrimaryDns(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == 4)
    {
        IPAddress i;
        i[0] = buffer[0];
        i[1] = buffer[1];
        i[2] = buffer[2];
        i[3] = buffer[3];
        setStoredIP("primaryDNS", i);
        primaryDNS = getStoredIP("primaryDNS");

        return true;
    }
    return false;
}
bool retroWifi::setSecondaryDns(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) == 4)
    {
        IPAddress i;
        i[0] = buffer[0];
        i[1] = buffer[1];
        i[2] = buffer[2];
        i[3] = buffer[3];
        setStoredIP("secondaryDNS", i);
        secondaryDNS = getStoredIP("secondaryDNS");
        return true;
    }
    return false;
}

void retroWifi::setStoredIP(const char *Parameter, IPAddress i)
{
    uint8_t ip[4];
    ip[0] = i[0];
    ip[1] = i[1];
    ip[2] = i[2];
    ip[3] = i[3];
    preferences.putBytes(Parameter, &ip, 4);
}
IPAddress retroWifi::getStoredIP(const char *Parameter)
{
    uint8_t ip[4] = {0, 0, 0, 0};
    IPAddress result;
    preferences.getBytes(Parameter, &ip, 4);
    result[0] = ip[0];
    result[1] = ip[1];
    result[2] = ip[2];
    result[3] = ip[3];

    return result;
}

bool retroWifi::setHostname(uint8_t b)
{
    *currentPointer++ = b;
    if (b == 0)
    {
        strncpy(m_hostname,(char *)&buffer[0], 64);
        preferences.putString("hostname", m_hostname);
        return true;
    }
    return false;
}

bool retroWifi::createOutgoingConnection(uint8_t b)
{
    *currentPointer++ = b;
    if ((currentPointer - buffer) > sizeof(OutgoingConnectionParameter))
    {
        OutgoingConnectionParameter *p;
        p = (OutgoingConnectionParameter *)buffer;
        if (b == 0)
        {
            if (p->connectionNumber > 0)
            {
                client[p->connectionNumber].stop();
                client[p->connectionNumber].connect((char *)&buffer[sizeof(OutgoingConnectionParameter)], p->portNumber);
            }
            return true;
        }
    }
    return false;
}

void retroWifi::setIncomingPort(uint16_t b)
{
    server.stopAll();
    server.begin(b);
}

bool retroWifi::outByteToConnection(uint8_t b)
{
    *currentPointer++ = b;
    int len = (currentPointer - buffer);
    if (len == 2)
    {
        client[buffer[0]].write(buffer[1]);
        return true;
    }
    return false;
}

bool retroWifi::outStringToConnection(uint8_t b)
{
    *currentPointer++ = b;
    int len = (currentPointer - buffer);
    if (len > 1)
    {
        if (b == 0)
        {

            client[buffer[0]].write((char *)&buffer[1]);
            return true;
        }
    }
    return false;
}

void retroWifi::inByteFromConnection(uint8_t b)
{
    queueByte(client[b].read());
}

void retroWifi::queuedBytesFromConnection(uint8_t b)
{
    queueByte(client[b].available());
}

void retroWifi::listenForIncomingConnection()
{
    if (!client[0].connected())
    {
        client[0] = server.available();
    }
}

void retroWifi::getMacAddress()
{
    uint8_t MAC_Address[6];
    WiFi.macAddress(MAC_Address);
    queueByte(MAC_Address[0]);
    queueByte(MAC_Address[1]);
    queueByte(MAC_Address[2]);
    queueByte(MAC_Address[3]);
    queueByte(MAC_Address[4]);
    queueByte(MAC_Address[5]);
}
