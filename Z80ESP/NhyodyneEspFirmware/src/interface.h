#pragma once
#include <Arduino.h>


extern void IRAM_ATTR WRISR();
extern void IRAM_ATTR RDISR();
extern void queuebyte(uint8_t b);
extern bool bufferempty();
extern uint8_t popbyte();
extern uint8_t peekbyte();
extern int popdoubleword();
extern int popword();
extern int bufferlength();
