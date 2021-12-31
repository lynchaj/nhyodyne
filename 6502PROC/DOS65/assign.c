#include<conio.h>

#define DISKCFG     (*(unsigned int *) 0x002e)
extern void __fastcall__ cputc(char c);
void prtdevice(char);
void prttable(char *);


int main () {
    unsigned int  **pptr = DISKCFG;

   prttable((unsigned char *) pptr);
  return (0);
}

void prttable(char *bytes)
{
int i;
        cputs("\n\r DOS/65 Drive assignment:\n\r");
        for(i=0;i<16;i++)
        {
            cprintf("  %c:=",i%2+'A');
            prtdevice(*(bytes+i++));
            cprintf(":%i\n\r",*(bytes+i));
        }
}

void prtdevice(char dev)
{
    switch(dev & 0xf0)
    {
        case 0x00:
          cputs("RAM");
          break;
        case 0x10:
          cputs("ROM");
          break;
        case 0x30:
          cputs("PPIDE");
          break;
        default:
          cputs("UNKNOWN");
          break;
    }
    cprintf("%i",dev & 0x0f);
}