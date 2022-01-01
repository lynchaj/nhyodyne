#include <conio.h>
#include <string.h>
#include <stdlib.h>
#include "nhyodyne.h"

char floppy35720dcb[9]={0x5e,0x01,0x24,0x00,0x04,0x00,0x01,0x7f,0x00};
char floppy35144dcb[9]={0x5e,0x01,0x24,0x00,0x04,0x00,0x01,0x7f,0x00};
char floppy525360dcb[9]={0x5e,0x01,0x24,0x00,0x04,0x00,0x01,0x7f,0x00};
char floppy52512dcb[9]={0x5e,0x01,0x24,0x00,0x04,0x00,0x01,0x7f,0x00};
char hdddcb[9]={0xff,0x07,0x40,0x00,0x82,0x00,0x02,0xff,0x01};
char ramdcb[9]={0x7f,0x00,0x40,0x00,0x00,0x00,0x01,0xff,0x00};
char romdcb[9]={0xbf,0x00,0x40,0x00,0x00,0x00,0x01,0xff,0x00};

void prtusage();
void prtdevice(char);
void prttable(char *);
int parsecmd(char *, char *, char *);
void mapdrive(char *, char *, char *);
void updatedosmap(char , char[]);
void toupper(char *);

int main()
{
  unsigned int **dskcfgptr = DISKCFG;
  char **cmdlineptr = CMDLINE;
  int result;
  char token1[30], token2[30];

  result = parsecmd((unsigned char *)CMDLINE, token1, token2);

  switch (result)
  {
  case 0:
    prttable((unsigned char *)dskcfgptr);
    break;
  case 1:
    prtusage();
    break;
  case 2:
    mapdrive((unsigned char *)dskcfgptr, token1, token2);
    break;
  }

  return (0);
}

int parsecmd(char *cmdline, char *token1, char *token2)
{
  int r = 0;
  unsigned char Mx = *(cmdline - 1);
  char *token;
  *(token1) = 0; // null terminate tokens
  *(token2) = 0;
  if (Mx > 127)
    Mx = 127;
  *(cmdline + Mx) = 0; // let's null terminate the string
  token = strtok(cmdline, " ");
  token = strtok(NULL, " "); // discard the "Assign" token
  if (token != NULL)
  {
    token = strtok(token, "=");
    if (token != NULL)
    {
      strncpy(token1, token, 29);
      r = 1;
      token = strtok(NULL, "=");
      if (token != NULL)
      {
        strncpy(token2, token, 29);
        r = 2;
      }
    }
  }
  return r;
}

void prttable(char *bytes)
{
  int i;
  cputs("\n\r DOS/65 Drive assignment:\n\r");
  for (i = 0; i < 16; i++)
  {
    cprintf("  %c:=", i / 2 + 'A');
    prtdevice(*(bytes + i++));
    cprintf(":%i\n\r", *(bytes + i));
  }
}

void prtdevice(char dev)
{
  switch (dev & 0xf0)
  {
  case 0x00:
    cputs("RAM");
    return;
  case 0x10:
    cputs("ROM");
    return;
  case 0x30:
    cputs("PPIDE");
    break;
  default:
    cputs("UNKNOWN");
    return;
  }
  cprintf("%i", dev & 0x0f);
}

void prtusage()
{
  cputs(" Usage: \n\r");
  cputs("    ASSIGN D:=[{D:|<device>[<unitnum>]:[<slicenum>]}] \n\r");
  cputs("      ex: ASSIGN		(display all active drive assignments) \n\r");
  cputs("          ASSIGN /?		(display version and usage) \n\r");
  cputs("          ASSIGN C:=FD0:	(assign C: to floppy unit 0) \n\r");
  cputs("          ASSIGN C:=IDE0:1	(assign C: to IDE unit0, slice 1) \n\r");
  cputs("\n\r POSSIBLE DEVICES:\n\r");
  cputs("          RAM    RAM DISK\n\r");
  cputs("          ROM    ROM DISK\n\r");
  cputs("          PPIDE  PPIDE FIXED DISK\n\r");
}

void toupper(char *name)
{
  while (*name)
  {
    if ((*name > 96) && (*name < 123))
      *name = *name & 0x5F;
    name++;
  }
}

void mapdrive(char *bytes, char *token1, char *token2)
{
  char drive = (token1[0] & 0x5F) - 65;
  char newdevice = 0xff;
  char *token, *rtoken;
  unsigned long lslice = 0x00;
  unsigned char slice;

  if ((drive < 0) || (drive > 7))
  {
    cputs("Assigned drive must be in the range of A-H.\n\r");
    return;
  }
  cprintf("Currently:   %c:=", drive + 65);
  prtdevice(*(bytes + (drive * 2)));
  cprintf(":%u \n\r", *(bytes + (drive * 2) + 1));

  toupper(token2);
  if (!strncmp(token2, "RAM:", 4))
    {
    newdevice = 0x00;
    updatedosmap(drive,ramdcb);
    }
  if (!strncmp(token2, "ROM:", 4))
  {
    newdevice = 0x10;
    updatedosmap(drive,romdcb);
  }
  if (!strncmp(token2, "PPIDE0:", 7))
   {
    newdevice = 0x30;
    updatedosmap(drive,hdddcb);
   }
  if (!strncmp(token2, "PPIDE1:", 7))
  {
    newdevice = 0x31;
    updatedosmap(drive,ramdcb);
  }
  if (newdevice == 0xFF)
  {
    cprintf("Unkown device assignment. \n\r");
    return;
  }
  token = strtok(token2, ":");
  token = strtok(NULL, ":");
  if (token != NULL)
  {
    slice = (int)strtoul(token, &rtoken, 10);
  }

  *(bytes + (drive * 2))= newdevice;
  *(bytes + (drive * 2)+1)= slice;

  cprintf("Changed to:  %c:=", drive + 65);
  prtdevice(*(bytes + (drive * 2)));
  cprintf(":%u \n\r", *(bytes + (drive * 2) + 1));
  return;
}


void updatedosmap(char drive,char dcb[])
{
  unsigned int **dcbtable = DISKCFG;
  char *table = (unsigned char *)*(dcbtable+drive-8);
  int i;

    for(i=0;i<9;i++)
    {
        *(table+i)=dcb[i];
    }
}
