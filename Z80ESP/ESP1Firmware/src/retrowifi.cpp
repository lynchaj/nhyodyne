#include <Arduino.h>
#include <Preferences.h>
#include <WiFi.h>
#include "interface.h"
#include "retrowifi.h"

void retroWifi::initialize()
{
    preferences.begin("retroESP32", false);
    m_ssid = preferences.getString("ssid", "");
    m_password = preferences.getString("password", "");
    buffer = new uint8_t[256];
    currentPointer = buffer;
}

bool retroWifi::setSSID(uint8_t b)
{
    *currentPointer++ = b;
    if (b == 0)
    {
        String s(*buffer);
        m_ssid = s;
        preferences.putString("ssid", m_ssid);
        printf("ssid->%s\n\r", m_ssid);
        return true;
    }
    return false;
}

bool retroWifi::setPassword(uint8_t b)
{
    *currentPointer++ = b;
    if (b == 0)
    {
        String s(*buffer);
        m_password = s;
        preferences.putString("password", m_password);
        printf("password->%s\n\r", m_password);
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
    WiFi.mode(WIFI_STA);
    WiFi.begin(m_ssid, m_password);

    Serial.println("\nConnecting");

    while (WiFi.status() != WL_CONNECTED)
    {
        printf(".");
        delay(100);
    }

    printf("\r\nConnected to the WiFi network \n\r");
    printf("Local ESP32 IP: %s\n\r", WiFi.localIP());
}

uint8_t retroWifi::status()
{
    return WiFi.status();
}

uint8_t retroWifi::strength()
{
    return WiFi.RSSI();
}
