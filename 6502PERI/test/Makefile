all:  	monitor.com scream.com hi.com aciatest.com sidtest.com

monitor.com: monitor.asm
	ca65 monitor.asm -l monitor.lst
	ld65 monitor.o -m monitor.map -C mbc.cfg -o monitor.out
	srec_cat  monitor.out -binary -offset 0x8000 -exclude 0xEFE0 0xEFFF -o  monrom.hex -intel -address-length=2
	srec_cat  monitor.out -binary -offset 0x0000  -o  monitor.s  -data-only
	srec_cat  monitor.s -exclude 0x0000 0x6fff -o  monitor.hex  -intel -address-length=2
	srec_cat  monitor.s -offset -0x6fe0 -o monitor.com -binary
	truncate monitor.com -s 4130
	@rm monitor.s
	@rm monitor.out
	@rm monitor.o

scream.com: scream.asm
	ca65 scream.asm -l scream.lst
	ld65 scream.o -m scream.map -C mbc.cfg -o scream.out
	srec_cat  scream.out -binary -offset 0x8000 -exclude 0xEFE0 0xEFFF -o  scrmrom.hex -intel -address-length=2
	srec_cat  scream.out -binary -offset 0x0000  -o  scream.s  -data-only
	srec_cat  scream.s -exclude 0x0000 0x6fff -exclude 0x7040 0x7ff0   -o  scream.hex  -intel -address-length=2
	srec_cat  scream.s -offset -0x6fe0 -o scream.com -binary
	truncate scream.com -s 4130
	@rm scream.s
	@rm scream.out
	@rm scream.o

hi.com: hi.asm
	ca65 hi.asm -l hi.lst
	ld65 hi.o -m hi.map -C mbc.cfg -o hi.out
	srec_cat  hi.out -binary -offset 0x0000  -o  hi.s  -data-only
	srec_cat  hi.s -exclude 0x0000 0x6fff -exclude 0x7060 0x7ff0   -o  hi.hex  -intel -address-length=2
	srec_cat  hi.s -offset -0x6fe0 -o hi.com -binary
	truncate hi.com -s 4130
	@rm hi.s
	@rm hi.out
	@rm hi.o

aciatest: aciatest.asm
	ca65 aciatest.asm -l aciatest.lst
	ld65 aciatest.o -m aciatest.map -C mbc.cfg -o aciatest.out
	srec_cat  aciatest.out -binary -offset 0x8000 -exclude 0xEFE0 0xEFFF -o  aciatest.hex -intel -address-length=2
	srec_cat  aciatest.out -binary -offset 0x0000  -o  aciatest.s  -data-only
	srec_cat  aciatest.s -exclude 0x0000 0x6fff -o  aciatest.hex  -intel -address-length=2
	srec_cat  aciatest.s -offset -0x6fe0 -o aciatest.com -binary
	truncate aciatest.com -s 4130
	@rm aciatest.s
	@rm aciatest.out
	@rm aciatest.o

sidtest: sidtest.asm
	ca65 sidtest.asm -l sidtest.lst
	ld65 sidtest.o -m sidtest.map -C mbc.cfg -o sidtest.out
	srec_cat  sidtest.out -binary -offset 0x8000 -exclude 0xEFE0 0xEFFF -o  sidtest.hex -intel -address-length=2
	srec_cat  sidtest.out -binary -offset 0x0000  -o  sidtest.s  -data-only
	srec_cat  sidtest.s -exclude 0x0000 0x6fff -o  sidtest.hex  -intel -address-length=2
	srec_cat  sidtest.s -offset -0x6fe0 -o sidtest.com -binary
	truncate sidtest.com -s 4130
	@rm sidtest.s
	@rm sidtest.out
	@rm sidtest.o
	
clean:
	@rm -f *.o
	@rm -f *.out
	@rm -f *.com
	@rm -f *.co6
	@rm -f *.map
	@rm -f *.lst
	@rm -f *.hex
	@rm -f *.s19
	@rm -f *.s

cleandust:
	@rm -f *.o
	@rm -f *.out
	@rm -f *.map
	@rm -f *.lst
