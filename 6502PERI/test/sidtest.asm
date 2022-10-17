;*** 6581 SID ************************
SIDbase	= $03B0
SIDv1frq	= SIDbase+1
SIDv1cr	= SIDbase+4
SIDeg1ad	= SIDbase+5
SIDeg1sr	= SIDbase+6
SIDvol		= SIDbase+$18

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
	LDA #>STARTUP		       	;
	STA STRPTR+1			;
	JSR OUTSTR			;


;clear all sid registers to 0
 	ldx #$00
	lda #$00
  
clearsidloop:
	sta SIDbase,x
	inx
	cpx #$29
	bne clearsidloop

;set master volume and turn filter off
	lda #%00001111 
	sta SIDvol

;let's play a sound
	ldx #$00
	
mainloop:
	lda snddata,x
	cmp #$ff
	beq Z80		;-1 then exit
	sta SIDv1frq
	lda snddata+1,x
	sta SIDbase
	lda #$21
	sta SIDv1cr
	lda snddata+2
	tay
loop1:
	beq goon
	dey
	bne loop1

goon:
	lda #$20
	sta SIDv1cr
	ldy #$33
loop2:
	dey
	bne loop2

	inx
	inx
	inx
	jmp mainloop

;
; exit to CP/M (hopefully)
;
Z80:
;set master volume and turn filter off
	lda #$00 
	sta SIDvol
	LDA 	$03FF
	BRK
	.BYTE 00,00,00

snddata:
; hf, lf, dr
.byte	25,177,250,28,214,250
.byte	25,177,250,25,177,250
.byte	25,177,125,28,214,125
.byte	32, 94,250,25,177,250
.byte	28,214,250,19, 63,250
.byte	19, 63,250,19, 63,250
.byte	21,154, 63,24, 63, 63
.byte	25,177,250,24, 63,125
.byte	19, 63,250,255,255,255

STARTUP: 	.BYTE   $0D,$0A
		.BYTE   "SID Test Program",$0D,$0A,$00


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


                 .segment "VECTORS"
	; $FFFA
NMIVECTOR:      .WORD   COLD_START		;
RSTVECTOR:      .WORD   COLD_START		;
INTVECTOR: 	.WORD   COLD_START		;

	.END
	
