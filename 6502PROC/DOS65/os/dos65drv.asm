;________________________________________________________________________________________________________________________________
;
;	Nhyodyne dos/65 banked driver code
;       Intended for RAM BANK $0D
;
;  DWERNER 04/24/2022 	Initial
;________________________________________________________________________________________________________________________________

.include "dosdefn.asm" 		; base addresses and definitions


; for Nhyodyne:
; RAM BANK $0C is RAM area for Drivers
; RAM BANK $0E is operating bank for DOS/65 $8000-$FFFF
; RAM BANK $0F is fixed bank $0000-$7FFF
; ROM BANKS $00 and $0C-$0F are reserved for ROMWBW code

;       Area from $0D:8000 to $0D:8800 reserved for work RAM for drivers
;


		.PC02
                .segment "DRIVERS"
		.ORG $8800


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

;__DRIVERS___________________________________________________________________________________________
;
		.INCLUDE "dosser.asm"

	.end
