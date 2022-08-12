;________________________________________________________________________________________________________________________________
;
;	Nhyodyne dos/65 CP/M loader program
;
;  DWERNER 04/24/2022 	Initial
;  PSUMMERS 8/7/2022    Accept a command line argument for CPU to switch to (0-9)
;________________________________________________________________________________________________________________________________

BDOS:		        EQU	$0005		; BDOS invocation vector
DEFFCB:				EQU	$5C			; Location of default FCB

MPCL_RAM:			EQU	78H			; CONTROL PORT, SHOULD ONLY BE CHANGED WHILE
;									  IN UPPER MEMORY PAGE 08000h-$FFFF OR LIKELY
;									  LOSS OF CPU MEMORY CONTEXT
; for Nhyodyne:
; RAM BANK $0C is RAM area for Drivers
; RAM BANK $0E is operating bank for DOS/65 $8000-$FFFF
; RAM BANK $0F is fixed bank $0000-$7FFF
; ROM BANKS $00 and $0C-$0F are reserved for ROMWBW code
;
;
section addr0100
ORG	0100H
;
		; Check for cpu unit
		LD	A,(DEFFCB+1)				; Get first char of filename
;
		CP	'9' + 1						; > '9'
		JR	NC,CopyLoader				; YES, NOT 0-9, Invalid argument
;
		SUB	'0'							; < '0'?
		JR	C,CopyLoader				; YES, NOT 0-9, Invalid argument
;
;		SUB	'0'							; Convert CPU unit '0' - '9'
		CPL								; to port and save
		LD	(CPUunit),A					; Unit 0 = FFH, 1 = FEH etc
;
CopyLoader:

	DI              		        	; DISABLE INTERRUPTS
					        	        ; copy LOADER code to $8100
		LD	BC,LoaderCodeEnd-LoaderCode1	; BYTES TO MOVE
		LD	DE,8100H					; DESTINATION ADDRESS
		LD	HL,LoaderCode				; SOURCE ADDRESS
		LDIR							; COPY RAM
        JP     8100H
;
BootDOS65:
        LD	C,9
	    LD	DE,SMSGFIL
       	CALL	BDOS		; Do it
		DI					; DISABLE INTERRUPTS
		LD	BC,2F00H		; BYTES TO MOVE
		LD	DE,5000H		; DESTINATION ADDRESS (6502 IS !A15)
		LD	HL,LoaderCodeEnd-LoaderCode1+loaderEnd   ; SOURCE ADDRESS
		LDIR				; COPY RAM
		LD	HL,07FFCH		; VECTOR
		LD 	A,00H
		LD 	(HL),A
		LD	HL,07FFDH		; VECTOR
		LD 	A,0D0H
		LD 	(HL),A
		LD	A,(CPUunit)		; GET CPU PORT
		LD	C,A
		IN 	A,(C)			; ENABLE 6502
                ; should never get here
                nop
                nop
                nop
                nop
                nop
                nop
		HALT
;
CPUunit:	DB	0FFh			; Default CPU unit port
;
loaderEnd:
LoaderCode:
section addr8000
ORG    8100H
LoaderCode1:
                ; load .SYS file
_LD0:	        LD	C,15			; CPM Open File function
	        LD	DE,FCB			; FCB
	        CALL	BDOS			; Do it
	        INC	A			; Test for error $FF
	        JP	Z,ERRFIL		; Handle file error

	        LD	HL,0800H		; load address
	        LD	(DMA),HL		;

_LD:            LD	DE,BUFFER		;
	        LD	C,26			; CPM Set DMA function
	        CALL	BDOS			; Read next 128 bytes
;
	        LD	C,20			; CPM Read Sequential function
	        LD	DE,FCB			; FCB
	        CALL	BDOS			; Read next 128 bytes
	        OR	A			; Set flags to check EOF
	        JR	NZ,_LDX			; Non-zero is EOF


                ; flip BANKS
               	LD	A,8CH		; LOAD VALUE TO SWITCH OUT BANK TO DRIVERS
               	OUT	(MPCL_RAM),A	;
                nop
                nop
                nop
		LD	BC,128          ; BYTES TO MOVE
		LD	DE,(DMA)        ; DESTINATION ADDRESS
		LD	HL,BUFFER       ; SOURCE ADDRESS
		LDIR  	                ; COPY RAM
                ; flip BANKS
              	LD	A,8EH		; LOAD VALUE TO SWITCH BANK BACK TO PRIMARY
        	OUT	(MPCL_RAM),A	;
                nop
                nop
                nop
;
	        LD	HL,(DMA)		; Save for next loop
	        LD	DE,128			; Bump by size of
	        ADD	HL,DE			; ... one record
	        LD	(DMA),HL		; Save for next loop
	        JR	_LD			; Load loop
;
_LDX:	        LD	C,16			; CPM Close File function
	        LD	DE,FCB			; FCB
	        CALL	BDOS			; Do it
                JP	BootDOS65

ERRFIL:	; Error opening driver file
                LD	C,9
	        LD	DE,MSGFIL
        	CALL	BDOS		; Do it
                LD	A,8EH		; LOAD VALUE TO SWITCH BANK BACK TO PRIMARY
        	OUT	(MPCL_RAM),A	;
                LD	C,0
        	jp	BDOS		; Do it
;
MSGFIL:         DB      0AH,0DH
                DM     "DOS65DRV.SYS NOT FOUND, EXITING."
                DB      0AH,0DH
                DM      "$"

SMSGFIL:        DB      0AH,0DH
                DM     "DOS65DRV.SYS LOADED, STARTING DOS/65"
                DB      0AH,0DH
                DM      "$"


DMA:            DB      00,00
FCB:
DRIVE:          DB     00d
                DM     "DOS65DRV"
                DM     "SYS"
                DB     00
                DB     00
                DB     00
                DB     00
                DB     00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
                DB     00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
                DB     00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
BUFFER:
LoaderCodeEnd:

	.end
