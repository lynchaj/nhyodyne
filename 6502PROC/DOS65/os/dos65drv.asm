;________________________________________________________________________________________________________________________________
;
;	Nhyodyne dos/65 banked driver code
;       Intended for RAM BANK $0D
;
;  DWERNER 04/24/2022 	Initial
;________________________________________________________________________________________________________________________________
		.PC02
                .segment "DRIVERS"
		.ORG $8800
.include "dosdefn.asm" 		; base addresses and definitions

; for Nhyodyne:
; RAM BANK $0C is RAM area for Drivers
; RAM BANK $0E is operating bank for DOS/65 $8000-$FFFF
; RAM BANK $0F is fixed bank $0000-$7FFF
; ROM BANKS $00 and $0C-$0F are reserved for ROMWBW code

;       Area from $0D:8000 to $0D:8800 reserved for work RAM for drivers
;

;__DISPATCHER________________________________________________________________________________________
;
;  Function dispatcher
;  function to call is located in "farfunct"
;____________________________________________________________________________________________________
;
		PHA
		PHX
		LDA     farfunct
		ASL	A			; DOUBLE NUMBER FOR TABLE LOOKUP
		TAX
		LDA 	DISPATCHTABLE,X
		STA	farpointer
		LDA 	DISPATCHTABLE+1,X
		STA	farpointer+1

		PLX
		PLA
		JMP (farpointer)


DISPATCHTABLE:
		.WORD 	WRSER1			; FUNCTION 00 - WRITE SERIAL PORT
		.WORD 	RDSER1			; FUNCTION 01 - READ SERIAL PORT
		.WORD 	RDSER1W			; FUNCTION 02 - READ SERIAL PORT (BLOCKING)
		.WORD 	SERIALSTATUS		; FUNCTION 03 - GET SERIAL STATUS

		.WORD 	PPIDE_INIT   		; FUNCTION 04 - called during OS init
		.WORD 	IDE_READ_SECTOR 	; FUNCTION 05 - read a sector from drive
		.WORD 	IDE_WRITE_SECTOR	; FUNCTION 06 - write a sector to drive

		.WORD 	DSKY_INIT		; FUNCTION 07 -
		.WORD 	DSKY_SHOW		; FUNCTION 08 -
		.WORD 	DSKY_BIN2SEG		; FUNCTION 09 -
		.WORD 	DSKY_RESET		; FUNCTION 10 -
		.WORD 	DSKY_STAT		; FUNCTION 11 -
		.WORD 	DSKY_GETKEY		; FUNCTION 12 -
		.WORD 	DSKY_BEEP		; FUNCTION 13 -
		.WORD 	DSKY_L1ON		; FUNCTION 14 -
		.WORD 	DSKY_L2ON		; FUNCTION 15 -
		.WORD 	DSKY_L1OFF		; FUNCTION 16 -
		.WORD 	DSKY_L2OFF		; FUNCTION 17 -
		.WORD 	DSKY_PUTLED		; FUNCTION 18 -
		.WORD 	DSKY_BLANK		; FUNCTION 19 -

		.WORD 	MD_READ_SECTOR 		; FUNCTION 20 - read a sector from memory device
		.WORD 	MD_WRITE_SECTOR		; FUNCTION 21 - write a sector to memory device
		.WORD 	MD_SHOW			; FUNCTION 22 - md show information

;		.WORD 	FL_READ_SECTOR 		; FUNCTION 23 - read a sector from floppy device
;		.WORD 	FL_WRITE_SECTOR		; FUNCTION 24 - write a sector to floppy device
;		.WORD 	FL_SETUP		; FUNCTION 25 - init floppy device


;__DRIVERS___________________________________________________________________________________________
;
		.include "drvmacro.asm"
		.INCLUDE "dosser.asm"
		.INCLUDE "doside.asm"
		.INCLUDE "dosdskyn.asm"
		.INCLUDE "dosmd.asm"
		.INCLUDE "dosdblk.asm"
	;	.INCLUDE "dosflp.asm"

;// TODO: this should be dependent on "active console. . ." and should be a driver call
CONSOLE_OUT:
		JSR WRSER1
		RTS

;// TODO: CONSOLE_IN


	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP

	.end
