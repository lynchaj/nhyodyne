
all:  	cpm.co6 assign.co6 alloc.co6 asm.co6 \
	bcompile.co6 compare.co6 copy.co6 debug.co6 edit.co6 run.co6 sedit.co6 \
	dbasic.co6 format.co6 writeos.co6 s19.co6


cpm.out: cpm.asm
	ca65 cpm.asm -l cpm.lst
	ld65 cpm.o -m cpm.map -C dos65.cfg -o cpm.out

assign.co6: assign.c
	cc65  -t none -O --cpu 65sc02  assign.c
	ca65 --cpu 65sc02  assign.s
	ld65 assign.o  ./nhyodyne/nhyodyne.lib -m assign.map -C dos65c.cfg -o assign.co6
	cp assign.co6 ../bin/

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
	ca65 --cpu 65sc02 copy201.asm -l copy.lst
	ld65 copy201.o  -m copy.map -C dos65.cfg -o copy.out

dbasic.out: dbasic.asm
	ca65 --cpu 65sc02 dbasic.asm -l dbasic.lst
	ld65 dbasic.o  -m dbasic.map -C dos65.cfg -o dbasic.out

debug.out: debug202.asm
	ca65 --cpu 65sc02 debug202.asm -l debug.lst
	ld65 debug202.o  -m debug.map -C dos65.cfg -o debug.out

edit.out: edit203.asm
	ca65 --cpu 65sc02 edit203.asm -l edit.lst
	ld65 edit203.o  -m edit.map -C dos65.cfg -o edit.out

run.out: run205.asm
	ca65 --cpu 65sc02 run205.asm -l run.lst
	ld65 run205.o  -m run.map -C dos65.cfg -o run.out

sedit.out: sedit.asm
	ca65 --cpu 65sc02 sedit.asm -lsedit.lst
	ld65 sedit.o  -m sedit.map -C dos65.cfg -o sedit.out

format.out: format.asm
	ca65 --cpu 65sc02 format.asm -lformat.lst
	ld65 format.o  -m format.map -C dos65.cfg -o format.out

writeos.out: writeos.asm
	ca65 --cpu 65sc02 writeos.asm -lwriteos.lst
	ld65 writeos.o  -m writeos.map -C dos65.cfg -o writeos.out

s19.out: s19.asm
	ca65 --cpu 65sc02 s19.asm -ls19.lst
	ld65 s19.o  -m s19.map -C dos65.cfg -o s19.out

alloc.co6: alloc.out
	srec_cat  alloc.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  alloc.s19  -data-only
	srec_cat  alloc.s19  -offset -0x0800  -o  allocA.s  -data-only
	srec_cat  allocA.s -o alloc.co6  -BINARY
	@rm -f allocA.s
	cp alloc.co6 ../bin/
	cp alloc.s19 ../bin/

bcompile.co6: bcompile.out
	srec_cat  bcompile.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  bcompile.s19  -data-only
	srec_cat  bcompile.s19  -offset -0x0800  -o  bcompileA.s  -data-only
	srec_cat  bcompileA.s -o bcompile.co6  -BINARY
	@rm -f bcompileA.s
	cp bcompile.co6 ../bin/
	cp bcompile.s19 ../bin/

asm.co6: asm.out
	srec_cat  asm.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  asm.s19  -data-only
	srec_cat  asm.s19  -offset -0x0800  -o  asmA.s  -data-only
	srec_cat  asmA.s -o asm.co6  -BINARY
	@rm -f asmA.s
	cp asm.co6 ../bin/
	cp asm.s19 ../bin/

compare.co6: compare.out
	srec_cat  compare.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  compare.s19  -data-only
	srec_cat  compare.s19  -offset -0x0800  -o  compareA.s  -data-only
	srec_cat  compareA.s -o compare.co6  -BINARY
	@rm -f compareA.s
	cp compare.co6 ../bin/
	cp compare.s19 ../bin/

copy.co6: copy.out
	srec_cat  copy.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  copy.s19  -data-only
	srec_cat  copy.s19  -offset -0x0800  -o  copyA.s  -data-only
	srec_cat  copyA.s -o copy.co6  -BINARY
	@rm -f copyA.s
	cp copy.co6 ../bin/
	cp copy.s19 ../bin/

debug.co6: debug.out
	srec_cat  debug.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  debug.s19  -data-only
	srec_cat  debug.s19  -offset -0x0800  -o  debugA.s  -data-only
	srec_cat  debugA.s -o debug.co6  -BINARY
	@rm -f debugA.s
	cp debug.co6 ../bin/
	cp debug.s19 ../bin/

dbasic.co6: dbasic.out
	srec_cat  dbasic.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  dbasic.s19  -data-only
	srec_cat  dbasic.s19  -offset -0x0800  -o  dbasicA.s  -data-only
	srec_cat  dbasicA.s -o dbasic.co6  -BINARY
	@rm -f dbasicA.s
	cp dbasic.co6 ../bin/
	cp dbasic.s19 ../bin/

edit.co6: edit.out
	srec_cat  edit.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  edit.s19  -data-only
	srec_cat  edit.s19  -offset -0x0800  -o  editA.s  -data-only
	srec_cat  editA.s -o edit.co6  -BINARY
	@rm -f editA.s
	cp edit.co6 ../bin/
	cp edit.s19 ../bin/

run.co6: run.out
	srec_cat  run.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  run.s19  -data-only
	srec_cat  run.s19  -offset -0x0800  -o  runA.s  -data-only
	srec_cat  runA.s -o run.co6  -BINARY
	@rm -f runA.s
	cp run.co6 ../bin/
	cp run.s19 ../bin/

sedit.co6: sedit.out
	srec_cat  sedit.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  sedit.s19  -data-only
	srec_cat  sedit.s19  -offset -0x0800  -o  seditA.s  -data-only
	srec_cat  seditA.s -o sedit.co6  -BINARY
	@rm -f seditA.s
	cp sedit.co6 ../bin/
	cp sedit.s19 ../bin/

format.co6: format.out
	srec_cat  format.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  format.s19  -data-only
	srec_cat  format.s19  -offset -0x0800  -o  formatA.s  -data-only
	srec_cat  formatA.s -o format.co6  -BINARY
	@rm -f formatA.s
	cp format.co6 ../bin/
	cp format.s19 ../bin/

writeos.co6: writeos.out
	srec_cat  writeos.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  writeos.s19  -data-only
	srec_cat  writeos.s19  -offset -0x0800  -o  writeosA.s  -data-only
	srec_cat  writeosA.s -o writeos.co6  -BINARY
	@rm -f writeosA.s
	cp writeos.co6 ../bin/
	cp writeos.s19 ../bin/

cpm.co6: cpm.out
	srec_cat  cpm.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  cpm.s19  -data-only
	srec_cat  cpm.s19  -offset -0x0800  -o  cpmA.s  -data-only
	srec_cat  cpmA.s -o cpm.co6  -BINARY
	@rm -f cpmA.s
	cp cpm.co6 ../bin/

s19.co6: s19.out
	srec_cat  s19.out -binary -offset 0x0100 -exclude 0x0000 0x0800 -o  s19.s19  -data-only
	srec_cat  s19.s19  -offset -0x0800  -o  s19A.s  -data-only
	srec_cat  s19A.s -o s19.co6  -BINARY
	@rm -f s19A.s
	cp s19.co6 ../bin/
	cp s19.s19 ../bin/

pretty:
	cp *.asm ./backup
	pretty6502 -p1 -a0 -du -mu -l ./backup/cpm.asm cpm.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/alloc203.asm alloc203.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/compl203.asm compl203.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/asm211.asm asm211.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/compr202.asm compr202.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/copy201.asm copy201.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/dbasic.asm dbasic.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/debug202.asm debug202.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/edit203.asm edit203.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/run205.asm run205.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/sedit.asm sedit.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/format.asm format.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/writeos.asm writeos.asm
	pretty6502 -p1 -a0 -du -mu -l ./backup/s19.asm s19.asm

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
