ca65 monitor.asm -l monitor.lst
ld65 monitor.o -m monitor.map -C mbc.cfg -o monitor.out
srec_cat  monitor.out -binary -offset 0x8000 -exclude 0xEFE0 0xEFFF -o  monrom.hex -intel -address-length=2
srec_cat  monitor.out -binary -offset 0x0000  -o  monitor.s  -data-only
srec_cat  monitor.s -exclude 0x0000 0x6fff -o  monitor.hex  -intel -address-length=2
srec_cat  monitor.s -offset -0x6fe0 -o monitor.com -binary
truncate monitor.com -s 4130
rm monitor.s
rm monitor.out
rm monitor.o


ca65 scream.asm -l scream.lst
ld65 scream.o -m scream.map -C mbc.cfg -o scream.out
srec_cat  scream.out -binary -offset 0x8000 -exclude 0xEFE0 0xEFFF -o  scrmrom.hex -intel -address-length=2
srec_cat  scream.out -binary -offset 0x0000  -o  scream.s  -data-only
srec_cat  scream.s -exclude 0x0000 0x6fff -exclude 0x7040 0x7ff0   -o  scream.hex  -intel -address-length=2
srec_cat  scream.s -offset -0x6fe0 -o scream.com -binary
truncate scream.com -s 4130
rm scream.s
rm scream.out
rm scream.o

ca65 hi.asm -l hi.lst
ld65 hi.o -m hi.map -C mbc.cfg -o hi.out
srec_cat  hi.out -binary -offset 0x0000  -o  hi.s  -data-only
srec_cat  hi.s -exclude 0x0000 0x6fff -exclude 0x7060 0x7ff0   -o  hi.hex  -intel -address-length=2
srec_cat  hi.s -offset -0x6fe0 -o hi.com -binary
truncate hi.com -s 4130
rm hi.s
rm hi.out
rm hi.o
