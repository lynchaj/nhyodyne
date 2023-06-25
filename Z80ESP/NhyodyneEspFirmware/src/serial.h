#pragma Once
#include <Arduino.h>

extern void initserial();
extern void clearbaud();
extern int setbaud(uint8_t b);
extern void process_serial_mode(uint8_t b);
extern void do_serial_in();