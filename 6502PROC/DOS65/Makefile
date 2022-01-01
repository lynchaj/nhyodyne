
all:  	dos65.s19 dos65.hex dos65.com cpm.co6 assign.co6 alloc.co6 asm.co6 bcompile.co6 compare.co6 copy.co6


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

alloc.out: alloc203.asm
	ca65 --cpu 65sc02 alloc203.asm -l alloc.lst
	ld65 alloc203.o  -m alloc.map -C dos65.cfg -o alloc.out

bcompile.out: compl203.asm
	ca65 --cpu 65sc02 compl203.asm -l bcompile.lst
	ld65 compl203.o  -m bcompile.map -C dos65.cfg -o bcompile.out

asm.out: asm211.asm
	ca65 --cpu 65sc02 asm211.asm -l asm.lst
	ld65 asm211.o  -m asm.map -C dos65.cfg -o asm.out

compare.out: compr202.asm
	ca65 --cpu 65sc02 compr202.asm -l compare.lst
	ld65 compr202.o  -m compare.map -C dos65.cfg -o compare.out

copy.out: copy201.asm
	ca65 --cpu 65sc02 copy201.asm -l compare.lst
	ld65 copy201.o  -m copy.map -C dos65.cfg -o copy.out

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

alloc.co6: alloc.out
	srec_cat  alloc.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  alloc.s19  -data-only
	srec_cat  alloc.s19  -offset -0x0800  -o  allocA.s  -data-only
	srec_cat  allocA.s -o alloc.co6  -BINARY
	@rm -f allocA.s
	cp alloc.co6 bin/

bcompile.co6: bcompile.out
	srec_cat  bcompile.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  bcompile.s19  -data-only
	srec_cat  bcompile.s19  -offset -0x0800  -o  bcompileA.s  -data-only
	srec_cat  bcompileA.s -o bcompile.co6  -BINARY
	@rm -f bcompileA.s
	cp bcompile.co6 bin/

asm.co6: asm.out
	srec_cat  asm.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  asm.s19  -data-only
	srec_cat  asm.s19  -offset -0x0800  -o  asmA.s  -data-only
	srec_cat  asmA.s -o asm.co6  -BINARY
	@rm -f asmA.s
	cp asm.co6 bin/

compare.co6: compare.out
	srec_cat  compare.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  compare.s19  -data-only
	srec_cat  compare.s19  -offset -0x0800  -o  compareA.s  -data-only
	srec_cat  compareA.s -o compare.co6  -BINARY
	@rm -f compareA.s
	cp compare.co6 bin/

copy.co6: copy.out
	srec_cat  copy.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  copy.s19  -data-only
	srec_cat  copy.s19  -offset -0x0800  -o  copyA.s  -data-only
	srec_cat  copyA.s -o copy.co6  -BINARY
	@rm -f copyA.s
	cp copy.co6 bin/

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
