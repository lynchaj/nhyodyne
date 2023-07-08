#pragma once
#include <Arduino.h>
#include <Preferences.h>

class retroWifi
{

public:
    void initialize();
    bool setSSID(uint8_t b);
    bool setPassword(uint8_t b);
    void resetPointer();
    void Connect();
    uint8_t status();
    uint8_t strength();

private:
    uint8_t *buffer;
    uint8_t *currentPointer;
    Preferences preferences;
    String m_ssid;
    String m_password;
    String m_hostname;
};