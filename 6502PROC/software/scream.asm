;__SCREAM_______________________________________________________
;
; This is a quick program that can be put on a ROM to test the
; 65C02 board in "stand alone" mode.  This mode assumes it is the
; only CPU board in the MBC system and will a continuous stream of "A"
; to the UART. It does not require the stack to be available and
; is pretty much the simplest code imaginable. :)
;
; It assumes that the 65C02 board is set for Stand alone mode and IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
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

                .segment "SROM"

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

	.END
