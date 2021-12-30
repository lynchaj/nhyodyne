#define FIFO_DATA     (*(unsigned char *) 0x1000)
#define FIFO_STATUS   (*(unsigned char *) 0x1001)

#define TX_FIFO_FULL  (FIFO_STATUS & 0x01)
#define RX_FIFO_EMPTY (FIFO_STATUS & 0x02)

extern void __fastcall__ cputc(char c);
extern void __fastcall__ cputs(char *s);

int main () {

        cputc('h');
        cputs("\n\rI mean, Hello World! \n\r");

  return (0);                                     //  We should never get here!
}