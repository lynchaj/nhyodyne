ASM=lwasm

ALL:    flex.com        \
        flex.sys        \
        flx29ccp.s19    \
        flx29fms.s19    \
        init.s19        \
        drivers.s19     \
        spooler.s19     \
        monitor.s19     \
        loader.s19

drivers.s19:    drivers.asm
	$(ASM)  --6809 --6800compat drivers.asm -s --list=drivers.lst --map=drivers.map --output=drivers.s --format=srec
	srec_cat  drivers.s -o drivers.s19 -Motorola -Data_Only

flx29ccp.s19:	flx29ccp.asm
	$(ASM)   --6809 --6800compat flx29ccp.asm -s --list=flx29ccp.lst --map=flx29ccp.map --output=flx29ccp.s --format=srec
	srec_cat  flx29ccp.s -o flx29ccp.s19 -Motorola -Data_Only

flx29fms.s19:	flx29fms.asm
	$(ASM) --6809 --6800compat flx29fms.asm -s --list=flx29fms.lst --map=flx29fms.map --output=flx29fms.s --format=srec
	srec_cat  flx29fms.s -o flx29fms.s19 -Motorola -Data_Only

init.s19:		init.asm
	$(ASM) --6809 --6800compat init.asm -s --list=init.lst --map=init.map --output=init.s --format=srec
	srec_cat  init.s -o init.s19 -Motorola -Data_Only

spooler.s19:	spooler.asm
	$(ASM)  --6809 --6800compat spooler.asm -s --list=spooler.lst --map=spooler.map --output=spooler.s --format=srec
	srec_cat  spooler.s -o spooler.s19 -Motorola -Data_Only

monitor.s19:	../software/monitor.asm
	$(ASM)  --6809 --6800compat ../software/monitor.asm -s --list=monitor.lst --map=monitor.map --output=monitor.s --format=srec
	srec_cat  monitor.s -o monitor.s19 -Motorola -Data_Only

loader.s19:	    loader.asm
	$(ASM)  --6809 --6800compat loader.asm -s --list=loader.lst --map=loader.map --output=loader.s --format=srec
	srec_cat  loader.s -o loader.s19 -Motorola -Data_Only

flex.sys:   init.s19 spooler.s19 flx29ccp.s19 flx29fms.s19 drivers.s19 monitor.s19
	cat init.s19 spooler.s19 flx29ccp.s19 flx29fms.s19 drivers.s19 monitor.s19 >flex.s19
	cat init.s19 spooler.s19 flx29ccp.s19 flx29fms.s19 drivers.s19 >flxdbg.s19
	srec_cat  flex.s19 -offset -0xC400 -o flex.sys -binary
	truncate flex.sys -s 15360

flex.com:   loader.s19 init.s19 spooler.s19 flx29ccp.s19 flx29fms.s19 drivers.s19 monitor.s19
	cat loader.s19 init.s19 spooler.s19 flx29ccp.s19 flx29fms.s19 drivers.s19 monitor.s19 >flex.s
	srec_cat  flex.s -offset -0xC3E0 -o flex09.com -binary
	truncate flex09.com -s 15392

clean:
	@rm -f *.bin
	@rm -f *.o
	@rm -f *.out
	@rm -f *.com
	@rm -f *.co6
	@rm -f *.map
	@rm -f *.lst
	@rm -f *.hex
	@rm -f *.s
	@rm -f *.sys
	@rm -f *.s19

cleandust:
	@rm -f *.o
	@rm -f *.s
	@rm -f *.out
	@rm -f *.map
	@rm -f *.lst