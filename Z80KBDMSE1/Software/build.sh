~/RomWBW-dev/Tools/unix/uz80as/uz80as -t z80 kbdtest.asm kbdtest.bin
#srec_cat kbdtest.bin -binary -offset 0x0100 --address-length=2 -o kbdtest.hex -Intel
cat kbdtest.bin > kbdtest.com

~/RomWBW-dev/Tools/unix/uz80as/uz80as -t z80 ps2info.asm ps2info.bin
#srec_cat kbdinfo.bin -binary -offset 0x0100 --address-length=2 -o kbdinfo.hex -Intel
cat ps2info.bin > ps2info.com

~/RomWBW-dev/Tools/unix/uz80as/uz80as -t z80 mseinfo.asm mseinfo.bin
#srec_cat mseinfo.bin -binary -offset 0x0100 --address-length=2 -o mseinfo.hex -Intel
cat mseinfo.bin > mseinfo.com
