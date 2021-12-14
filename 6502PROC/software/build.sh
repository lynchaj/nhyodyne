ca65 monitor.asm -l monitor.lst
ld65 monitor.o -m monitor.map -C mbc.cfg -o monitor.out
srec_cat  monitor.out -binary -offset 0x0000  -o  monitor.s  -data-only
srec_cat  monitor.s -exclude 0x0000 0x6fff -o  monitor.hex  -intel -address-length=2

ca65 scream.asm -l scream.lst
ld65 scream.o -m scream.map -C mbc.cfg -o scream.out
srec_cat  scream.out -binary -offset 0x0000 -o  scream.hex -intel -address-length=2

ca65 hi.asm -l hi.lst
ld65 hi.o -m hi.map -C mbc.cfg -o hi.out
srec_cat  hi.out -binary -offset 0x0000  -o  hi.s  -data-only
srec_cat  hi.s -exclude 0x0000 0x6fff -exclude 0x7060 0x7ff0   -o  hi.hex  -intel -address-length=2

