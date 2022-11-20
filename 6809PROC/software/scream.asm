    PRAGMA CD

;__SCREAM_______________________________________________________
;
; This is a quick program that can be put on a ROM to test the
; 6809 board.
;
; It assumes that the 6809 board is set for IOPage 03.
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
; Finally transfer control to the 6809 by reading the toggle register
; >I FF
;
; The '09 should reset and run this program
;
;_______________________________________________________________

; UART 16C550 SERIAL
UART0       	equ    	$FE68           ; DATA IN/OUT
UART1       	equ    	$FE69           ; CHECK RX
UART2       	equ    	$FE6A           ; INTERRUPTS
UART3       	equ    	$FE6B           ; LINE CONTROL
UART4       	equ    	$FE6C           ; MODEM CONTROL
UART5          	equ    	$FE6D           ; LINE STATUS
UART6          	equ    	$FE6E           ; MODEM STATUS
UART7	       	equ    	$FE6F           ; SCRATCH REG.

; this is Z80 code that is used to be able to run this as a .COM file.  It is truncated
; when the various .HEX files are generated
;
              ORG	$EFE0
		FCB		$F3 				;DI - DISABLE INTERRUPTS
		FCB		$01,$00,$10    		;LD	BC,$1000 -BYTES TO MOVE
		FCB		$11,$00,$70    		;LD	DE,$7000 -DESTINATION ADDRESS (6809 IS !A15)
		FCB		$21,$20,$01	    	;LD	HL,$0120 -SOURCE ADDRESS
		FCB		$ED,$B0       		;LDIR  		 -COPY RAM
		FCB		$DB,$F0       		;IN 	A,$F0    -ENABLE 6809
		FCB		$0E,$00       		;LD	C,00H    -CP/M SYSTEM RESET CALL
		FCB		$CD,$05,$00			;CALL	0005H	 -RETURN TO PROMPT
;
;
;
				ORG	$F000

;__COLD_START___________________________________________________
;
; PERFORM SYSTEM COLD INIT
;
;_______________________________________________________________
COLD_START:
MAIN:	LDS		$007F		; RESET STACK POINTER
	;	LDA		#$80		;
	;	STA		UART3		; SET DLAB FLAG
	;	LDA		#12			; SET TO 12 = 9600 BAUD
	;	STA		UART0		; save baud rate
	;	LDA		#00			;
	;	STA		UART1		;
	;	LDA		#03			;
	;	STA		UART3		; SET 8 BIT DATA, 1 STOPBIT
	;	STA		UART4		;

SERIAL_OUTCH:
TX_BUSYLP:
		LDA		UART5			; READ LINE STATUS REGISTER
		ANDA	#$20			; TEST IF UART IS READY TO SEND (BIT 5)
		CMPA 	#$00
		BEQ		TX_BUSYLP		; IF NOT REPEAT
		LDA 	#'A
		STA		UART0			; THEN WRITE THE CHAR TO UART
        JMP     SERIAL_OUTCH

        ORG     $FFFE           ; SET RESET VECTOR TO


RESETV:
		FDB		$F000

		END
