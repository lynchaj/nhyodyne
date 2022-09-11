        NAM     flex9.asm
        OPT     pag
        PAG
        PRAGMA CD


		include "init.asm"
		include "spooler.asm"
		include "flx29ccp.asm"
		include "flx29fms.asm"
		include "drivers.asm"
		include "../software/monitor.asm"

			ORG	$FFF2		    ; SET RESET VECTOR TO MAIN PROGRAM
		FDB	    SWIVEC
SW2VECP	FDB	    COLDS
FRQVECP	FDB	    COLDS
		FDB	    IRQVEC
SW1VECP	FDB	    COLDS
NMIVECP	FDB	    COLDS
RESETV	FDB	    COLDS
