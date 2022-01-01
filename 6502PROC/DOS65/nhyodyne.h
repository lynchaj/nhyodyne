
#ifndef __nhyodyne_H
#define __nhyodyne_H

#define DISKCFG (*(unsigned int *)0x002e)
#define CMDLINE (*(unsigned int *)0x0030)

extern void __fastcall__ cputc(char c);

#endif