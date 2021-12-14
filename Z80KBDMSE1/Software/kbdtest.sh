~/RomWBW-dev/Tools/unix/uz80as/uz80as -t z80 kbdtest.asm kbdtest.bin
#srec_cat kbdtest.bin -binary -offset 0x0100 --address-length=2 -o kbdtest.hex -Intel
cat kbdtest.bin > kbdtest.com
