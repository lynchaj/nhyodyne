;__SCREAM_______________________________________________________
;
; This is a quick program that can be put on a ROM to test the
; 65C02 board in "stand alone" mode.  This mode assumes it is the
; only CPU board in the MBC system and will a continuous stream of "A"
; to the UART. It does not require the stack to be available and
; is pretty much the simplest code imaginable. :)
;
; It assumes that the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
;
; If the SBC is the only CPU in the system, ensure that jumpers
; J1 and J2 are set for 1&2.   Then burn scrmrom.hex into EPROM.
;
; If the SBC is secondary to a Z80, the scrm.com file can be run from CP/M or the
; scream.hex file can be loaded from the monitor. Ensure that jumpers J1 and J4
; are set for 2&3, the 6502 toggle IO address is set for $FF and
; the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
; ** Note that this program will change the baud rate to 9600.
;
;
; to run from the MBC Z80 monitor
;
; first set the MPCL to allow RAM in the low bank
; >O 7C 80
; >O 78 80
;
; then load the .HEX file.
; >L
;
;
; Finally transfer control to the 65C02 by reading the toggle register
; >I FF
;
; The '02 should reset and run this program
;
;_______________________________________________________________

; UART 16C550 SERIAL
UART0       	=    	$0368           ; DATA IN/OUT
UART1       	=    	$0369           ; CHECK RX
UART2       	=    	$036A           ; INTERRUPTS
UART3       	=    	$036B           ; LINE CONTROL
UART4       	=    	$036C           ; MODEM CONTROL
UART5          	=    	$036D           ; LINE STATUS
UART6          	=    	$036E           ; MODEM STATUS
UART7	       	=    	$036F           ; SCRATCH REG.

; this is Z80 code that is used to be able to run this as a .COM file.  It is truncated
; when the various .HEX files are generated
;
                .segment "LOADER"
		.BYTE 		$F3 			;DI - DISABLE INTERRUPTS
		.BYTE 		$01,$00,$10    		;LD	BC,$1000 -BYTES TO MOVE
		.BYTE 		$11,$00,$70    		;LD	DE,$7000 -DESTINATION ADDRESS (6502 IS !A15)
		.BYTE 		$21,$20,$01	    	;LD	HL,$0120 -SOURCE ADDRESS
		.BYTE 		$ED,$B0       		;LDIR  		 -COPY RAM
		.BYTE		$DB,$FF       		;IN 	A,$FF    -ENABLE 6502
		.BYTE		$0E,$00       		;LD	C,00H    -CP/M SYSTEM RESET CALL
		.BYTE		$CD,$05,$00		;CALL	0005H	 -RETURN TO PROMPT
;
;
;



                .segment "TROM"

;__COLD_START___________________________________________________
;
; PERFORM SYSTEM COLD INIT
;
;_______________________________________________________________
COLD_START:

		LDA	#$80			;
		STA	UART3			; SET DLAB FLAG
		LDA	#12			; SET TO 12 = 9600 BAUD
		STA	UART0			; save baud rate
		LDA	#00				;
		STA	UART1			;
		LDA	#03				;
		STA	UART3			; SET 8 BIT DATA, 1 STOPBIT
		STA	UART4			;

SERIAL_OUTCH:
TX_BUSYLP:
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$20			; TEST IF UART IS READY TO SEND (BIT 5)
		CMP     #$00
		BEQ	TX_BUSYLP		; IF NOT REPEAT
		LDA     #'A'
		STA	UART0			; THEN WRITE THE CHAR TO UART
                JMP     SERIAL_OUTCH


                 .segment "VECTORS"
	; $FFFA
NMIVECTOR:      .WORD   COLD_START		;
RSTVECTOR:      .WORD   COLD_START		;
INTVECTOR: 	.WORD   COLD_START		;

	.END
