
all:  	dos65.s19 dos65.hex dos65.com cpm.co6 assign.co6


dos65.out: dos65.asm ccmnhy.asm pem215.asm simnhy.asm macro.asm
	ca65 dos65.asm -l dos65.lst
	ld65 dos65.o -m dos65.map -C dos65.cfg -o dos65.out

cpm.out: cpm.asm
	ca65 cpm.asm -l cpm.lst
	ld65 cpm.o -m cpm.map -C dos65.cfg -o cpm.out

assign.co6: assign.c
	cc65  -t none -O --cpu 65sc02  assign.c
	ca65 --cpu 65sc02  assign.s
	ld65 assign.o  ./nhyodyne/nhyodyne.lib -m assign.map -C dos65c.cfg -o assign.co6


dos65.s19: dos65.out
	srec_cat  DOS65.out -binary -offset 0x0100 -exclude 0x0000 0xB7F3 -exclude 0xE500 0xFFFF -o  DOS65.s19  -data-only

dos65.hex: dos65.out
	srec_cat  DOS65.out -binary -offset 0x0100 -exclude 0x0000 0xB800 -o  DOS65.s -data-only
	srec_cat  DOS65.s  -offset -0x8000  -o  DOS651.s  -data-only
	srec_cat  DOS651.s -exclude 0x6000 0x7EE0  -o DOS65.hex  -intel -address-length=2
	@rm -f DOS65.s
	@rm -f DOS651.s

dos65.com: dos65.out
	srec_cat  DOS65.out -binary -offset 0x0100 -exclude 0x0000 0xB7E0 -o  DOS65A.s  -data-only
	srec_cat  DOS65A.s  -offset -0xB7E0  -o  DOS652.s  -data-only
	srec_cat  DOS652.s -o DOS65.com  -BINARY
	@rm -f DOS65A.s
	@rm -f DOS652.s


cpm.co6: cpm.out
	srec_cat  cpm.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  cpm.s19  -data-only
	srec_cat  cpm.s19  -offset -0x0800  -o  cpmA.s  -data-only
	srec_cat  cpmA.s -o cpm.co6  -BINARY
	@rm -f cpmA.s


clean:
	@rm -f *.o
	@rm -f *.out
	@rm -f *.com
	@rm -f *.co6
	@rm -f *.map
	@rm -f *.lst
	@rm -f *.hex
	@rm -f *.s19

cleandust:
	@rm -f *.o
	@rm -f *.out
	@rm -f *.map
	@rm -f *.lst
