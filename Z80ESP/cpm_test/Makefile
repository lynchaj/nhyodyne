
all:  	esptest.com testesp.com

esptest.com: esptest.asm
	z80asm -b -l -m esptest.asm  2> esptest.err
	@cp esptest.bin esptest.com
	@rm esptest.bin
	@rm esptest.o

testesp.com: testesp.c
	zcc +cpm testesp.c -create-app -o testesp

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
