
all:  	zloader.bin dos65.s19 dos65.hex dos65.com dos65drv.sys dos65rr.s19

zloader.bin: zloader.asm
	z80asm -b -l -m zloader.asm  2> zloader.err
	cat zloader_addr0100.bin zloader_addr8000.bin > zloader.bin
	@rm zloader_addr0100.bin
	@rm zloader_addr8000.bin
	@rm zloader.o

dos65.out: dos65.asm ccmnhy.asm pemnhy.asm simnhy.asm macro.asm dosdefn.asm dospager.asm
	ca65 dos65.asm -l dos65.lst -D ROMDRIVERS=0 -D RAMDRIVERS=1 -D ROMRAMDRIVERS=0
	ld65 dos65.o -m dos65.map -C dos65.cfg -o dos65.out

dos65rr.out: dos65.asm ccmnhy.asm pemnhy.asm simnhy.asm macro.asm dosdefn.asm dospager.asm
	ca65 dos65.asm -o dos65rr.o -l dos65rr.lst -D ROMDRIVERS=0 -D RAMDRIVERS=0 -D ROMRAMDRIVERS=1
	ld65 dos65rr.o -m dos65rr.map -C dos65.cfg -o dos65rr.out

dos65drv.out: dos65drv.asm dosser.asm dosdefn.asm doside.asm dosmd.asm dosdskyn.asm drvmacro.asm dosflp.asm
	ca65 dos65drv.asm -l dos65drv.lst
	ld65 dos65drv.o -m dos65drv.map -C dos65.cfg -o dos65drv.out


dos65.s19: dos65.out
	srec_cat  dos65.out -binary -offset 0x0100 -exclude 0x0000 0xCFF3 -o  dos65.s19  -data-only
	cp dos65.s19 ../bin/

dos65rr.s19: dos65rr.out
	srec_cat  dos65rr.out -binary -offset 0x0100 -exclude 0x0000 0xCFF3 -o  dos65rr.s19  -data-only
	cp dos65rr.s19 ../bin/

dos65.hex: dos65.out
	srec_cat  DOS65.out -binary -offset 0x0100 -exclude 0x0000 0xD000 -o  dos65.s -data-only
	srec_cat  dos65.s  -offset -0x8000  -o  dos651.s  -data-only
	srec_cat  dos651.s -exclude 0x6000 0x7EE0  -o dos65.hex  -intel -address-length=2
	@rm -f dos65.s
	@rm -f dos651.s
	cp dos65.hex ../bin/

dos65.com: dos65.out zloader.bin
	srec_cat  DOS65.out -binary -offset 0x0100 -exclude 0x0000 0xD000 -o  dos65.s -data-only
	srec_cat  dos65.s  -offset -0xD000  -o  dos651.s  -data-only
	srec_cat  dos651.s -o dos65.bin  -BINARY
	cat 	zloader.bin dos65.bin> dos65.com
	@rm -f dos651.s
	@rm -f dos65.bin
	cp dos65.com ../bin/

dos65drv.sys: dos65drv.out
	srec_cat  dos65drv.out -binary -offset 0x0100 -exclude 0x0000 0x8800 -o  dos65drv.s19  -data-only
	srec_cat  dos65drv.s19  -offset -0x8800  -o  dos65drvA.s  -data-only
	srec_cat  dos65drv.s19   -offset 0x060000 -o dos65drv.rom   -data-only
	srec_cat  dos65drvA.s -o dos65drv.sys  -BINARY
	@rm -f dos65drvA.s
	cp dos65drv.sys ../bin/

clean:
	@rm -f *.o
	@rm -f *.bin
	@rm -f *.lis
	@rm -f *.err
	@rm -f *.out
	@rm -f *.com
	@rm -f *.co6
	@rm -f *.map
	@rm -f *.lst
	@rm -f *.hex
	@rm -f *.s19
	@rm -f *.sys
	@rm -f *.s

cleandust:
	@rm -f *.o
	@rm -f *.out
	@rm -f *.map
	@rm -f *.lst
