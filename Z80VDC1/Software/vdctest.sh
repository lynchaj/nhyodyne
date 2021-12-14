~/RomWBW-dev/Tools/unix/uz80as/uz80as -t z80 vdctest.asm vdctest.bin
#srec_cat vdctest.bin -binary -offset 0x0100 --address-length=2 -o vdctest.hex -Intel
cat vdctest.bin > vdctest.com

~/RomWBW-dev/Tools/unix/uz80as/uz80as -t z80 vdconly.asm vdconly.bin
#srec_cat vdconly.bin -binary -offset 0x0100 --address-length=2 -o vdconly.hex -Intel
cat vdconly.bin > vdconly.com
