#pragma once
#include <Arduino.h>


extern void IRAM_ATTR WRISR();
extern void IRAM_ATTR RDISR();
extern void queueByte(uint8_t b);
extern bool bufferEmpty();
extern uint8_t popByte();
extern uint8_t peekByte();
extern int popDoubleWord();
extern int popWord();
extern int bufferLength();
extern int initialize();
