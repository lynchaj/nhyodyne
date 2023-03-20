all:  	tstflop.s19 monitor.com scream.com hi.com rom.bin lowmon.s19

lowmon.s19: lowmon.asm supermon.asm assmb.asm
	ca65 lowmon.asm -l lowmon.lst
	ld65 lowmon.o -m lowmon.map -C mbc.cfg -o lowmon.out
	srec_cat  lowmon.out -binary -offset 0x1000 -exclude 0x2000 0xffff -o  lowmon.s19  -data-only
	@rm lowmon.out
	@rm lowmon.o
	cp lowmon.s19 ../DOS65/bin/

monitor.com: monitor.asm moncode.asm assmb.asm
	ca65 monitor.asm -l monitor.lst
	ld65 monitor.o -m monitor.map -C mbc.cfg -o monitor.out
	srec_cat  monitor.out -binary -offset 0x0000  -o  monitor.s  -data-only
	srec_cat  monitor.s -exclude 0x0000 0x6fff -o  monitor.hex  -intel -address-length=2
	srec_cat  monitor.s -offset -0x6fe0 -o monitor.com -binary
	truncate monitor.com -s 4130
	@rm monitor.s
	@rm monitor.out
	@rm monitor.o
	cp monitor.com ../DOS65/bin/

tstflop.s19: tstflop.asm
	ca65 tstflop.asm -l tstflop.lst
	ld65 tstflop.o -m tstflop.map -C mbc.cfg -o tstflop.out
	srec_cat  tstflop.out -binary -offset 0x1000 -exclude 0x1700 0xFFFF  -o  tstflop.s19  -data-only
	@rm tstflop.out
	@rm tstflop.o

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
	cp scream.com ../DOS65/bin

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
	cp hi.com ../DOS65/bin

rom.bin: rom.asm ../DOS65/os/dos65drv.rom  moncode.asm assmb.asm ../DOS65/os/dospager.asm
	ca65 rom.asm -l rom.lst
	ld65 rom.o -m rom.map -C mbc.cfg -o rom.out
	srec_cat  rom.out -binary -offset 0x0000  -o  rom.s  -data-only
	@cat rom.s ../DOS65/os/dos65drv.rom > romB.s
	srec_cat  romB.s -o rom.bin -binary
	@rm rom.s
	@rm rom.o
	@rm romB.s
	cp rom.bin ../DOS65/bin

pretty:
	cp *.asm ./backup
	pretty6502 -p1 -a0 -du -mu -l ./backup/rom.asm rom.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/moncode.asm moncode.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/assmb.asm assmb.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/hi.asm hi.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/scream.asm scream.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/tstflop.asm tstflop.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/monitor.asm monitor.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/lowmon.asm lowmon.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/supermon.asm supermon.asm

clean:
	@rm -f *.bin
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