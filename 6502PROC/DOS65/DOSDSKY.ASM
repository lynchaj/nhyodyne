

;__DSKY DRIVERS___________________________________________________________________________________________________________________
;
; 	DOS DSKY drivers for DSKY attached to the 6502 io card
;
;	Entry points:
;		SEGDISPLAY   - called to display disk control block
;________________________________________________________________________________________________________________________________
;
;*
;* HARDWARE I/O ADDRESSES
;*

PPI		=	$0360		; PORT A
PORTA		=	PPI+0		;
PORTB		=	PPI+1		;
PORTC		=	PPI+2		;
PPIX		=	PPI+3		; CONTROL BYTE PPI 82C55





;__DSKYINIT__________________________________________________________________________________________
;
;  SETUP DSKY
;
;____________________________________________________________________________________________________
DSKYINIT:
	LDA	#$80			;
	STA	PPIX			; PA OUT, PB OUT, PC OUT
	LDA	#$70			;
	STA	PORTC			;
	RTS


;__HEXDISPLAY________________________________________________________________________________________
;
;  Display contents of DISPLAYBUF in decoded Hex bits 0-3 are displayed dig, bit 7 is DP
;
;____________________________________________________________________________________________________
HEXDISPLAY:
	STA	DBGA
	STY	DBGY
	STX	DBGX

	JSR	DSKYTRANSDISPLAY

	LDX	#$08			; SET DIGIT COUNT
	LDA	#$40			; set Control port 7218 to off
	STA	PORTC			; output
	JSR 	PAUSE			; wait
	LDA	#$F0			; set control to 1111 (Data Coming, Hex Decode,NO Decode, Normal)
	STA	PORTA			; output to port
	LDA	#$80			; Strobe write pulse with Control=1
	STA	PORTC			; output to port
	JSR 	PAUSE			; wait
	LDA	#$40			; set Control port 7218 to off
	STA	PORTC			; output
HEXDISPLAY_LP:
	LDA	DISPLAYBUF-1,X		; GET DISPLAY DIGIT
	JSR	DECODEDISPLAY		; DECODE DISPLAY
	STA	PORTA			; OUT TO PORTA
	LDA	#$00			; SET WRITE STROBE
	STA	PORTC			; OUT TO PORTC
	JSR	PAUSE			; DELAY
	LDA	#$40			; SET CONTROL PORT OFF
	STA	PORTC			; OUT TO PORTC
	JSR	PAUSE			; WAIT
	DEX				; INC POINTER
	BNE	HEXDISPLAY_LP		; LOOP FOR NEXT DIGIT
	LDA	DBGA
	LDY	DBGY
	LDX	DBGX
	RTS				;

;__DECODEDISPLAY_____________________________________________________________________________________
;
;  Display contents of DISPLAYBUF in decoded Hex bits 0-3 are displayed dig, bit 7 is DP
;
;____________________________________________________________________________________________________
DECODEDISPLAY:
	PHA
	TXA
	STA	XREG			;
	PLA
	TAX				;
	LDA	SEGDECODE,X		; GET VALUE
	STA	ACC			;
	LDA	XREG			;
	TAX				;
	LDA	ACC			;
	RTS				;


;__SEGDISPLAY________________________________________________________________________________________
;
;  Display contents of DISPLAYBUF in RAW dig, bit 7 is DP
;
;____________________________________________________________________________________________________
SEGDISPLAY:
	STA	DBGA
	STY	DBGY
	STX	DBGX
	LDX	#$08			; SET DIGIT COUNT
	LDA	#$40			; set Control port 7218 to off
	STA	PORTC			; output
	JSR 	PAUSE			; wait
	LDA	#$F0			; set control to 1111 (Data Coming, Hex Decode,NO Decode, Normal)
	STA	PORTA			; output to port
	LDA	#$80			; Strobe write pulse with Control=1
	STA	PORTC			; output to port
	JSR 	PAUSE			; wait
	LDA	#$40			; set Control port 7218 to off
	STA	PORTC			; output
SEGDISPLAY_LP:
	LDA	DISPLAYBUF-1,X		; GET DISPLAY DIGIT
	STA	PORTA			; OUT TO PORTA
	LDA	#$00			; SET WRITE STROBE
	STA	PORTC			; OUT TO PORTC
	JSR	PAUSE			; DELAY
	LDA	#$40			; SET CONTROL PORT OFF
	STA	PORTC			; OUT TO PORTC
	JSR	PAUSE			; WAIT
	DEX				; INC POINTER
	BNE	SEGDISPLAY_LP		; LOOP FOR NEXT DIGIT
	LDA	DBGA
	LDY	DBGY
	LDX	DBGX
	RTS				; RESTORE



;__DSKYTRANSDISPLAY__________________________________________________________________________________
;
;  TRANSLATE DSKYDISPLAY TO DISPLAYBUF
;
;____________________________________________________________________________________________________
DSKYTRANSDISPLAY:
	LDY	#$07			; SET DIGIT COUNT
    	LDX	#$00			; SET DIGIT COUNT
DSKYTRANSDISPLAY_LOOP:
	LDA	DSKYDISPLAY,X
    	LSR	A
   	LSR	A
    	LSR	A
	LSR	A
 	STA	DISPLAYBUF,Y
    	DEY
	LDA	DSKYDISPLAY,X
	AND	#$0F
 	STA	DISPLAYBUF,Y
   	DEY
     	INX
  	TXA
 	CMP	#$04
  	BNE	DSKYTRANSDISPLAY_LOOP
    	RTS

PAUSE:
	PHA
	PLA
	RTS

DBGX		.DB 0
DBGY		.DB 0
DBGA		.DB 0
XREG		.DB 0
ACC		.DB 0


DISPLAYBUF:	.DB 	$84,$EE,$BB,$80,$BB,$EE,$CB,$84
DSKYDISPLAY:	.DB	$23,$45,$67,$89

;_HEX 7_SEG_DECODE_TABLE__________________________________________________________________________________________________
;
; 0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F, ,-
; AND WITH 7FH TO TURN ON DP
;_________________________________________________________________________________________________________________________
SEGDECODE:
	.BYTE	$FB,$B0,$ED,$F5,$B6,$D7,$DF,$F0,$FF,$F7,$FE,$9F,$CB,$BD,$CF,$CE,$80,$84,$00,$EE,$9D
