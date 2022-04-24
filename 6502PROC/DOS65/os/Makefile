
all:  	dos65.s19 dos65.hex dos65.com

dos65.out: dos65.asm ccmnhy.asm pemnhy.asm simnhy.asm macro.asm dosmd.asm doside.asm dosdskyn.asm
	ca65 dos65.asm -l dos65.lst
	ld65 dos65.o -m dos65.map -C dos65.cfg -o dos65.out


dos65.s19: dos65.out
	srec_cat  dos65.out -binary -offset 0x0100 -exclude 0x0000 0xB7F3 -exclude 0xE500 0xFFFF -o  dos65.s19  -data-only
	cp dos65.s19 ../bin/

dos65.hex: dos65.out
	srec_cat  DOS65.out -binary -offset 0x0100 -exclude 0x0000 0xB800 -o  dos65.s -data-only
	srec_cat  dos65.s  -offset -0x8000  -o  dos651.s  -data-only
	srec_cat  dos651.s -exclude 0x6000 0x7EE0  -o dos65.hex  -intel -address-length=2
	@rm -f dos65.s
	@rm -f dos651.s
	cp dos65.hex ../bin/

dos65.com: dos65.out
	srec_cat  dos65.out -binary -offset 0x0100 -exclude 0x0000 0xB7E0 -o  dos65A.s  -data-only
	srec_cat  dos65A.s  -offset -0xB7E0  -o  dos652.s  -data-only
	srec_cat  dos652.s -o dos65.com  -BINARY
	@rm -f dos65A.s
	@rm -f dos652.s
	cp dos65.com ../bin/



clean:
	@rm -f *.o
	@rm -f *.out
	@rm -f *.com
	@rm -f *.co6
	@rm -f *.map
	@rm -f *.lst
	@rm -f *.hex
	@rm -f *.s19
	@rm -f assign.s

cleandust:
	@rm -f *.o
	@rm -f *.out
	@rm -f *.map
	@rm -f *.lst
