;*** 6551 CIA ************************
ACIA1dat       =     $03a0
ACIA1sta       =     $03a1
ACIA1cmd       =     $03a2
ACIA1ctl       =     $03a3
STRPTR	 	=	$48

; UART 16C550 SERIAL -- Assumes IO is in page $03 -- DIP Switch settings $83
UART0	=    	$0368           ; DATA IN/OUT
UART1	=    	$0369           ; CHECK RX
UART2	=    	$036A           ; INTERRUPTS
UART3	=    	$036B           ; LINE CONTROL
UART4	=    	$036C           ; MODEM CONTROL
UART5	=    	$036D           ; LINE STATUS
UART6	=    	$036E           ; MODEM STATUS
UART7	=    	$036F           ; SCRATCH REG.

;
; this is Z80 code that is used to be able to run this as a .COM file.  It is truncated
; when the various .HEX files are generated
;
                .segment "LOADER"
		.BYTE 		$F3 			;DI - DISABLE INTERRUPTS
		.BYTE 		$01,$00,$10    	;LD	BC,$1000 -BYTES TO MOVE
		.BYTE 		$11,$00,$70    	;LD	DE,$7000 -DESTINATION ADDRESS (6502 IS !A15)
		.BYTE 		$21,$20,$01	    	;LD	HL,$0120 -SOURCE ADDRESS
		.BYTE 		$ED,$B0       		;LDIR  		 -COPY RAM
		.BYTE		$DB,$FF       		;IN 	A,$FF    -ENABLE 6502
		.BYTE		$0E,$00       		;LD	C,00H    -CP/M SYSTEM RESET CALL
		.BYTE		$CD,$05,$00		;CALL	0005H	 -RETURN TO PROMPT


	.segment "TROM"
 COLD_START:
	SEI 				; DISABLE INTERRUPTS
	CLD				;  VERIFY DECIMAL MODE IS OFF
	LDX   #$FF              	;
	TXS                     	; CLEAR STACK

	LDA #<STARTUP			; OUTPUT STARTUP STRING
	STA STRPTR			;
	LDA #>STARTUP		       ;
	STA STRPTR+1			;
	JSR OUTSTR			;
		
		lda   #$00
		sta   ACIA1sta		  ; soft reset
   		lda   #$0B               ; N parity/echo off/rx int off/ dtr active low
		sta   ACIA1cmd           ; command reg 
		lda   #$1E               ; 9600,8N1
        	sta   ACIA1ctl           ; control reg 

; let's loop
toploop:
		jsr     IOF_CONIN       ; any chars to send to PERI
		CMP     #$00
		beq     getchars        ; no, check for recevied chars
		CMP	#'z'		 ; exit character
		beq 	Z80
		jsr     ACIA1_Output    ; yes, go send it to PERI
getchars:
		jsr     ACIA1_Input	 ; wait for char from PERI (block)
;		bcc     toploop         ; no chars from PERI (non-blocking)
		jsr     OUTCH           ; yes chars, so print
		jmp     toploop         ; do it again


;---------------------------------------------------------------------
; Input char from UART (blocking)
; Exit: character in A
ACIA1_Input:
		lda   ACIA1sta           ; Serial port status             
		and   #$08               ; is recvr full
		beq   ACIA1_Input        ; no char to get
		Lda   ACIA1dat           ; get chr
		RTS                      ;
	
;---------------------------------------------------------------------
; Non-waiting get character routine 
; Scan for input (no wait), C=1 char, C=0 no character	
ACIA1_Scan:	clc			  ; clear carry
		lda   ACIA1sta           ; Serial port status
		and   #$08               ; mask rcvr full bit
		beq   ACIA1_scan2
		Lda   ACIA1dat           ; get chr
		sec
ACIA1_scan2:	rts

;
; output to OutPut Port
;
ACIA1_Output:	PHA                      ; save registers
ACIA1_Out1:	lda   ACIA1sta           ; serial port status
		and   #$10               ; is tx buffer empty
		beq   ACIA1_Out1         ; no
		PLA                      ; get chr
		sta   ACIA1dat           ; put character to Port
		RTS                      ; done

;
; non-blocking console input
;
IOF_CONIN:					;
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$01			; TEST IF DATA IN RECEIVE BUFFER
		BEQ	SERIAL_INCH1		; NO CHAR FOUND
		LDA	UART0			; THEN READ THE CHAR FROM THE UART
		RTS
SERIAL_INCH1:					;
		LDA	#$00
		RTS				;

;__OUTSTR______________________________________________________
;
; OUTPUT THE STRING POINTED TO BU OUTSTR TO THE SCREEN
;
;______________________________________________________________
OUTSTR:
	        LDY   #$00			; LOAD $00 INTO Y
OUTSTRLP:
        	LDA (STRPTR),Y     		; LOAD NEXT CHAR FROM STRING INTO ACC
        	CMP #$00			; IS NULL?
        	BEQ ENDOUTSTR			; YES, END PRINT OUT
        	JSR OUTCH  			; PRINT CHAR IN ACC
        	INY      			; Y=Y+1 (BUMP INDEX)
        	JMP OUTSTRLP			; DO NEXT CHAR
ENDOUTSTR:
        	RTS				; RETURN
        	
;
; console output
;
OUTCH:						;
		PHA				; STORE A
TX_BUSYLP:
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$20			; TEST IF UART IS READY TO SEND (BIT 5)
		CMP 	#$00
		BEQ	TX_BUSYLP		; IF NOT REPEAT
		PLA				; RESTORE ACC
		STA	UART0			; THEN WRITE THE CHAR TO UART
		RTS

STARTUP: 	.BYTE   $0D,$0A
		.BYTE   "ACIA Test Program",$0D,$0A,$00
		
;
; exit to CP/M (hopefully)
;
Z80:
        LDA 	$03FF
	BRK
	.BYTE 00,00,00

                 .segment "VECTORS"
	; $FFFA
NMIVECTOR:      .WORD   COLD_START		;
RSTVECTOR:      .WORD   COLD_START		;
INTVECTOR: 	.WORD   COLD_START		;

	.END
