#include <Arduino.h>
#include "pins.h"

// Setup Brain-dead simple ring buffers.  This should probably include mutexes, but I am going to skip for now.
static uint8_t tx_ring[256];
static uint8_t rx_ring[256];
static uint8_t tx_wpointer = 0;
static uint8_t rx_wpointer = 0;
static uint8_t tx_rpointer = 0;
static uint8_t rx_rpointer = 0;
static uint8_t byte_waiting = 0;


uint8_t popbyte()
{
    return rx_ring[rx_rpointer++];
}

uint8_t peekbyte()
{
    return rx_ring[rx_rpointer];
}


bool bufferempty()
{
     if (rx_wpointer == rx_rpointer) return true;
     return false;
}

void sendbyte(uint8_t b)
{
    for (int x = 0; x < 8; x++)
    {
        digitalWrite(OUTDATA, (b & 128));
        digitalWrite(OUTCLK, LOW);
        b = b << 1;
        digitalWrite(OUTCLK, HIGH);
    }
    digitalWrite(OUTCLK, LOW);
    digitalWrite(OUTCLK, HIGH);
}

void queuebyte(uint8_t b)
{
    // if !bytewaiting send, otherwise queue
    if (byte_waiting == 0)
    {
        sendbyte(b);
        byte_waiting = 1;
        digitalWrite(READY, HIGH);
    }
    else
    {
        tx_ring[tx_wpointer++] = b;
    }
}

void IRAM_ATTR WRISR()
{
    uint8_t result;
    digitalWrite(BUSY, HIGH);
    for (int x = 0; x < 8; x++)
    {
        digitalWrite(INCLK, LOW);
        result = result << 1;
        result += digitalRead(INDATA);
        digitalWrite(INCLK, HIGH);
    }
    rx_ring[rx_wpointer] = result;
    rx_wpointer++;
    digitalWrite(INCLK, LOW);
    digitalWrite(BUSY, LOW);
}

void IRAM_ATTR RDISR()
{

    if (tx_wpointer != tx_rpointer)
    {
        sendbyte(tx_ring[tx_rpointer++]);
    }
    else
    {
        digitalWrite(READY, LOW);
        byte_waiting = 0;
        sendbyte(0);
    }
}

int toInt32(uint8_t b0,uint8_t b1,uint8_t b2,uint8_t b3)
{
    return b0+((int)b1*256)+((int)b2*65535)+((int)b3*16776960);
}
int toInt16(uint8_t b0,uint8_t b1)
{
    return b0+((int)b1*256);
}
