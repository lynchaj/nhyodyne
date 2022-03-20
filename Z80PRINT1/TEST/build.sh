uz80as -t z80 testprt.asm testprt.bin
#srec_cat vdctest.bin -binary -offset 0x0100 --address-length=2 -o vdctest.hex -Intel
cp testprt.bin testprt.com
