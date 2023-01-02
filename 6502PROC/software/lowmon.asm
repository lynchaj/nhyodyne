
;__LOWMON__________________________________________________________________________________________
; This is a simple monitor program that can loaded into low ram
; for debugging.
;
; It assumes that the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
;
;__________________________________________________________________________________________________
;
; DATA CONSTANTS
;__________________________________________________________________________________________________
;REGISTER		IO PORT		; FUNCTION
IRQVECTOR   =  	$35   		; VECTOR FOR USER IRQ RTN
NMIVECTOR   =  	$37   		; VECTOR FOR USER IRQ RTN
WORKPTR		=  	$39			; WORK POINTER FOR COMMAND PROCESSOR
JUMPPTR		=	$3B			; JUMP VECTOR FOR LOOKUP TABLE
TEMPWORD	=	$3D			;
TEMPWORD1	=  	$3F			;
TEMPWORD2	=  	$40			;

TEMPBYTE	=	$42			;
ACC      	=  	$43			; ACC STORAGE
XREG     	=  	$44 		; X REG STORAGE
YREG     	=  	$45 		; Y REG STORAGE
PREG     	=  	$46 		; CURRENT STACK POINTER
PCL      	=  	$47 		; PROGRAM COUNTER LOW
PCH      	=  	$48 		; PROGRAM COUNTER HIGH
SPTR     	=  	$49 		; CPU STATUS REGISTER
CKSM		=	$4A			; CHECKSUM
BYTECT		=	$4B			; BYTE COUNT
STRPTR	 	=	$4C			;
COUNTER	 	=	$4E			;
SRC	 		=	$50			;
DEST	 	=	$52			;
INBUFFER	=	$0200		;

; UART 16C550 SERIAL -- Assumes IO is in page $03 -- DIP Switch settings $83
UART0       =  	$0368       ; DATA IN/OUT
UART1       =  	$0369       ; CHECK RX
UART2       =  	$036A       ; INTERRUPTS
UART3       =  	$036B       ; LINE CONTROL
UART4       =  	$036C       ; MODEM CONTROL
UART5       =  	$036D       ; LINE STATUS
UART6       =  	$036E       ; MODEM STATUS
UART7	    =  	$036F       ; SCRATCH REG.



                .org $1000


	  	LDA #<STARTUP		; OUTPUT STARTUP STRING
        STA STRPTR			;
        LDA #>STARTUP		;
        STA STRPTR+1		;
        JSR OUTSTR			;

		LDA #$00			;
		STA INBUFFER		; MAKE SURE INPUT BUFFER IS EMPTY
							;
        JMP   COMMAND_PROCESSOR 	; START THE MONITOR


Z80:
		rts

	.include"moncode.asm"

;__________________________________________________________________________________________________________
;
;  AT SOME POINT, REPLACE THIS WITH 6502HBIOS CALLS
;

INIT_SERIAL:
		LDA	#$80			;
		STA	UART3			; SET DLAB FLAG
		LDA	#12				; SET TO 12 = 9600 BAUD
		STA	UART0			; save baud rate
		LDA	#00				;
		STA	UART1			;
		LDA	#03				;
		STA	UART3			; SET 8 BIT DATA, 1 STOPBIT
		STA	UART4			;
		RTS


IOF_CONINW:					;
SERIAL_INCHW1:
		LDA	UART5				; READ LINE STATUS REGISTER
		AND	#$01				; TEST IF DATA IN RECEIVE BUFFER
		CMP 	#$00
		BEQ	SERIAL_INCHW1		; LOOP UNTIL DATA IS READY
		LDA	UART0				; THEN READ THE CHAR FROM THE UART

		RTS

IOF_CONIN:						;
		LDA	UART5				; READ LINE STATUS REGISTER
		AND	#$01				; TEST IF DATA IN RECEIVE BUFFER
		BEQ	SERIAL_INCH1		; NO CHAR FOUND
		LDA	UART0				; THEN READ THE CHAR FROM THE UART
		RTS
SERIAL_INCH1:					;
		LDA	#$00
		RTS						;

OUTCH:							;
		PHA						; STORE A
TX_BUSYLP:
		LDA	UART5				; READ LINE STATUS REGISTER
		AND	#$20				; TEST IF UART IS READY TO SEND (BIT 5)
		CMP 	#$00
		BEQ	TX_BUSYLP			; IF NOT REPEAT
		PLA						; RESTORE ACC
		STA	UART0				; THEN WRITE THE CHAR TO UART
		RTS


; START BANNER
STARTUP: 	.BYTE   $0D,$0A

		.BYTE   "  Nhyodyne",$0D,$0A
		.BYTE   "   __ _____  _____ ___ ___ ",$0D,$0A
   		.BYTE   "  / /| ____|/ ____/ _ \__ \ ",$0D,$0A
  		.BYTE   " / /_| |__ | |   | | | | ) | ",$0D,$0A
 		.BYTE   "| '_ \___ \| |   | | | |/ / ",$0D,$0A
 		.BYTE   "| (_) |__) | |___| |_| / /_ ",$0D,$0A
  		.BYTE   " \___/____/ \_____\___/____| ",$0D,$0A
		.BYTE   "* Low Memory ($1000-$2000) 65c02 MONITOR ",$0D,$0A,$00

	.END
