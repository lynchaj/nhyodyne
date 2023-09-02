
all:  	esptest.com testesp.com espconf.com

esptest.com: esptest.asm
	z80asm -b -l -m esptest.asm  2> esptest.err
	@cp esptest.bin esptest.com
	@rm esptest.bin
	@rm esptest.o

testesp.com: testesp.c espui.c esplowlevel.c espconsole.c espserial.c espsound.c espgraphics.c espwifi.c
	zcc +cpm testesp.c espui.c esplowlevel.c espconsole.c espserial.c espsound.c espgraphics.c espwifi.c -create-app -o testesp --list

espconf.com: espconf.c espui.c esplowlevel.c espconsole.c espserial.c espsound.c espgraphics.c espwifi.c
	zcc +cpm espconf.c espui.c esplowlevel.c espconsole.c espserial.c espsound.c espgraphics.c espwifi.c -create-app -o espconf --list


pretty:
	cp *.asm ./backup
	pretty6502 -p2 -a0 -du -mu -l ./backup/esptest.asm esptest.asm

clean:
	@rm -f *.o
	@rm -f *.bin
	@rm -f *.lis
	@rm -f *.err
	@rm -f *.out
	@rm -f *.com
	@rm -f *.COM
	@rm -f *.map
	@rm -f *.lst
	@rm -f *.hex
	@rm -f *.s19
	@rm -f *.sys
	@rm -f *.s
	@rm -f *.rom

cleandust:
	@rm -f *.o
	@rm -f *.out
	@rm -f *.map
	@rm -f *.lst
	@rm -f *.lis
