#pragma Once
#include <Arduino.h>

extern void IRAM_ATTR WRISR();
extern void IRAM_ATTR RDISR();
extern void queuebyte(uint8_t b);
extern bool bufferempty();
extern uint8_t popbyte();
extern uint8_t peekbyte();
extern int toInt32(uint8_t b0,uint8_t b1,uint8_t b2,uint8_t b3);
extern int toInt16(uint8_t b0,uint8_t b1);
