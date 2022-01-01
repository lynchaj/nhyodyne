
all:  	dos65.s19 dos65.hex dos65.com cpm.co6 assign.co6


dos65.out: dos65.asm ccmnhy.asm pem215.asm simnhy.asm macro.asm dosmd.asm doside.asm dosdskyn.asm
	ca65 dos65.asm -l dos65.lst
	ld65 dos65.o -m dos65.map -C dos65.cfg -o dos65.out

cpm.out: cpm.asm
	ca65 cpm.asm -l cpm.lst
	ld65 cpm.o -m cpm.map -C dos65.cfg -o cpm.out

assign.co6: assign.c
	cc65  -t none -O --cpu 65sc02  assign.c
	ca65 --cpu 65sc02  assign.s
	ld65 assign.o  ./nhyodyne/nhyodyne.lib -m assign.map -C dos65c.cfg -o assign.co6
	cp assign.co6 bin/


dos65.s19: dos65.out
	srec_cat  dos65.out -binary -offset 0x0100 -exclude 0x0000 0xB7F3 -exclude 0xE500 0xFFFF -o  dos65.s19  -data-only
	cp dos65.s19 bin/

dos65.hex: dos65.out
	srec_cat  DOS65.out -binary -offset 0x0100 -exclude 0x0000 0xB800 -o  dos65.s -data-only
	srec_cat  dos65.s  -offset -0x8000  -o  dos651.s  -data-only
	srec_cat  dos651.s -exclude 0x6000 0x7EE0  -o dos65.hex  -intel -address-length=2
	@rm -f dos65.s
	@rm -f dos651.s
	cp dos65.hex bin/

dos65.com: dos65.out
	srec_cat  dos65.out -binary -offset 0x0100 -exclude 0x0000 0xB7E0 -o  dos65A.s  -data-only
	srec_cat  dos65A.s  -offset -0xB7E0  -o  dos652.s  -data-only
	srec_cat  dos652.s -o dos65.com  -BINARY
	@rm -f dos65A.s
	@rm -f dos652.s
	cp dos65.com bin/


cpm.co6: cpm.out
	srec_cat  cpm.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  cpm.s19  -data-only
	srec_cat  cpm.s19  -offset -0x0800  -o  cpmA.s  -data-only
	srec_cat  cpmA.s -o cpm.co6  -BINARY
	@rm -f cpmA.s
	cp cpm.co6 bin/


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
