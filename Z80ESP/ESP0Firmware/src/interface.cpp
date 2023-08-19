#include <Arduino.h>
#include "pins.h"

// when I grow up, I should be a class . . . .


// Setup Brain-dead simple ring buffers.  This should probably include mutexes, but I am going to skip for now.
static uint8_t txRing[256];
static uint8_t rxRing[256];
static uint8_t txWPointer = 0;
static uint8_t rxWPointer = 0;
static uint8_t txRPointer = 0;
static uint8_t rxRPointer = 0;
static uint8_t byteWaiting = 0;

int initialize()
{
            txWPointer = 0;
            rxWPointer = 0;
            txRPointer = 0;
            rxRPointer = 0;
            byteWaiting = 0;
}

int bufferLength()
{
    if (rxWPointer == rxRPointer)
        return 0;
    if (rxWPointer > rxRPointer)
        return rxWPointer - rxRPointer;
    return ((int)rxWPointer + 256) - rxRPointer;
}

uint8_t popByte()
{
    return rxRing[rxRPointer++];
}

int popDoubleWord()
{
    if (bufferLength() > 3)
    {
        return popByte() + ((int)popByte() * 256) + ((int)popByte() * 65536) + ((int)popByte() * 16777216);
    }
    return 0;
}

int popWord()
{
    if (bufferLength() > 1)
    {
        return popByte() + ((int)popByte() * 256);
    }
    return 0;
}

uint8_t peekByte()
{
    return rxRing[rxRPointer];
}

bool bufferEmpty()
{
    if (rxWPointer == rxRPointer)
        return true;
    return false;
}

void sendByte(uint8_t b)
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

void queueByte(uint8_t b)
{
    // if !bytewaiting send, otherwise queue
    if (byteWaiting == 0)
    {
        sendByte(b);
        byteWaiting = 1;
        digitalWrite(READY, HIGH);
    }
    else
    {
        txRing[txWPointer++] = b;
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
    rxRing[rxWPointer] = result;
    rxWPointer++;
    digitalWrite(INCLK, LOW);
    digitalWrite(BUSY, LOW);
}

void IRAM_ATTR RDISR()
{
    digitalWrite(BUSY, HIGH);

    if (txWPointer != txRPointer)
    {
        sendByte(txRing[txRPointer++]);
    }
    else
    {
        digitalWrite(READY, LOW);
        sendByte(0);
    }

    if (txWPointer == txRPointer)
    {
        byteWaiting = 0;
    }
    digitalWrite(BUSY, LOW);
}
