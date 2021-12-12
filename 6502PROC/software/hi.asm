;__HI___________________________________________________________
;
; This is a quick program that can be uploaded to the MBC from
; Z80 mode.  It will print a "Hi" to the UART then return control
; to the Z80.  It does not require the stack to be available and
; is pretty much the simplest code imaginable. :)
;
; It assumes that the 65C02 board is set for port $FF and IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
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
; The '02 should reset run this program and return to the Z80 monitor
;
;_______________________________________________________________

; UART 16C550 SERIAL -- Assumes IO is in page $03 -- DIP Switch settings $83
UART0       	=    	$0368           ; DATA IN/OUT
UART1       	=    	$0369           ; CHECK RX
UART2       	=    	$036A           ; INTERRUPTS
UART3       	=    	$036B           ; LINE CONTROL
UART4       	=    	$036C           ; MODEM CONTROL
UART5          	=    	$036D           ; LINE STATUS
UART6          	=    	$036E           ; MODEM STATUS
UART7	       	=    	$036F           ; SCRATCH REG.

                .segment "TROM"

;__COLD_START___________________________________________________
;
; PERFORM SYSTEM COLD INIT
;
;_______________________________________________________________
COLD_START:

TX_BUSYLP2a:
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$20			; TEST IF UART IS READY TO SEND (BIT 5)
		CMP     #$00
		BEQ	TX_BUSYLP2a		; IF NOT REPEAT
		LDA     #10
		STA	UART0			; THEN WRITE THE CHAR TO UART

TX_BUSYLP3a:
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$20			; TEST IF UART IS READY TO SEND (BIT 5)
		CMP     #$00
		BEQ	TX_BUSYLP3a		; IF NOT REPEAT
		LDA     #13
		STA	UART0			; THEN WRITE THE CHAR TO UART

TX_BUSYLP:
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$20			; TEST IF UART IS READY TO SEND (BIT 5)
		CMP     #$00
		BEQ	TX_BUSYLP		; IF NOT REPEAT
		LDA     #'H'
		STA	UART0			; THEN WRITE THE CHAR TO UART
TX_BUSYLP1:
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$20			; TEST IF UART IS READY TO SEND (BIT 5)
		CMP     #$00
		BEQ	TX_BUSYLP1		; IF NOT REPEAT
		LDA     #'i'
		STA	UART0			; THEN WRITE THE CHAR TO UART

TX_BUSYLP2:
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$20			; TEST IF UART IS READY TO SEND (BIT 5)
		CMP     #$00
		BEQ	TX_BUSYLP2		; IF NOT REPEAT
		LDA     #10
		STA	UART0			; THEN WRITE THE CHAR TO UART

TX_BUSYLP3:
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$20			; TEST IF UART IS READY TO SEND (BIT 5)
		CMP     #$00
		BEQ	TX_BUSYLP3		; IF NOT REPEAT
		LDA     #13
		STA	UART0			; THEN WRITE THE CHAR TO UART


		LDA 	$03FF			; Ping the register to go back to Z80


                 .segment "VECTORS"
	; $FFFA
NMIVECTOR:      .WORD   COLD_START		;
RSTVECTOR:      .WORD   COLD_START		;
INTVECTOR: 	.WORD   COLD_START		;

	.END
