#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <ctype.h>
#include <cpm.h>


extern int esp0_outbyte(char c);
extern int esp0_inbytewait();
extern void esp0_outstruct(char *data,int len);
extern void esp0_outlong(long value);
extern void esp0_outint(int value);
extern int esp1_outbyte(char c);
extern int esp1_inbytewait();
extern void esp1_outstruct(char *data,int len);
extern void esp1_outlong(long value);
extern void esp1_outint(int value);
