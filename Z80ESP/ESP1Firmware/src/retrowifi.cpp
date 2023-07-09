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
    strncpy(m_ssid, ssid.c_str(), 64);
    strncpy(m_password, password.c_str(), 64);
    printf("ssid->%s\n\r", m_ssid);
    printf("password->%s\n\r", m_password);
    buffer = new uint8_t[256];
    currentPointer = buffer;
}

bool retroWifi::setSSID(uint8_t b)
{
    *currentPointer++ = b;
    if (b == 0)
    {
        strncpy(m_ssid, reinterpret_cast<const char *>(buffer), 64);
        preferences.putString("ssid", m_ssid);
        printf("ssid->%s\n\r", buffer);
        return true;
    }
    return false;
}

bool retroWifi::setPassword(uint8_t b)
{
    *currentPointer++ = b;
    if (b == 0)
    {
        strncpy(m_password, reinterpret_cast<const char *>(buffer), 64);
        preferences.putString("password", m_password);
        printf("password->%s\n\r", buffer);
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
    printf("ssid->%s\n\r", m_ssid);
    printf("password->%s\n\r", m_password);
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
