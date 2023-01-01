;__SCREEN EDITOR_________________________________________________________________________________________________________________
;
; 	DOS/65 SCREEN EDITOR (ANSI TERMINAL/CONSOLE)
;	DAN WERNER 5/31/2014
;
;
;________________________________________________________________________________________________________________________________
;

DFLFCB	=	$107		;DEFAULT FCB
PEM		=	$103		;PEM ENTRY
BOOT	=	$100		;WARM BOOT
TEA		=	$800		;EXECUTION ORG
CCMLNG	=	2048		;CCM LENGTH
CRSYM	=	32			;CR SYMBOL
LASTROW =	20
MAXCOL  =	80

;ZERO PAGE
NAMED	=$02			;"TO" FILE NAMED IF <128
TOIND	=$03			;"TO" FILE INDEX
FRMIND	=$05			;"FROM" FILE INDEX
TEMP	=$08			;
FCBPTR 	=$09			; POINTER TO FCB FOR FILE OPS
CSRPOSX =$0B			;
CSRPOSY =$0C			;
EDTPOS  =$0D			;
TMPPOS  =$0F			;
TEMP1   =$11			;
CURRENTLEN =$12			;
MODE	= $14			; 0= OVERWRITE MODE, 1= INSERT MODE

;MAIN PROGRAM
 		.segment "TEA"
		.ORG $0800

	JSR	CLEARBUFFER
	JSR	DOS65LOAD
	JSR	PAINTSCREEN

	LDA	#$00
	STA	MODE
	STA	CSRPOSX
	STA 	CSRPOSY
	JSR	GOCSR
	LDA	#<BUFFER		; SETUP BUFFER
	STA	EDTPOS			; STORE DEST BUFFER
	LDA	#>BUFFER	;
	STA	EDTPOS+1		; STORE DEST BUFFER



EDITLOOP:
	JSR	READKB			; GET USER INPUT
					;

	CPY	#$01			; IF IT IS A NORMAL KEYSTROKE
	BNE	EDIT			; GOTO EDIT

	CPY	#$FF			; IF IT IS AN ERROR
	BEQ	EDITLOOP		;  LOOP

	STA	TEMP			; STORE COMMAND IN TEMP
	LDY	#$00			;
EDITLOOP1A:
	LDA	COMMANDTABLE,Y		; CHECK TOKEN
	CMP	TEMP			; COMPARE
	BNE	EDITLOOP2A		;
	INY
	LDA	COMMANDTABLE,Y		; CHECK TOKEN
	STA	JMPTMP+1		;
	INY
	LDA	COMMANDTABLE,Y		; CHECK TOKEN
	STA	JMPTMP+2		;
JMPTMP:
	JSR	$0000
	JMP	EDITLOOP
EDITLOOP2A:
	CMP	#$FF
	BEQ	EDITLOOP3A
	INY
	INY
	INY
	JMP	EDITLOOP1A

EDITLOOP3A:
	JMP	EDITLOOP

COMMANDTABLE:	.byte 	$00,<CRSRUP,>CRSRUP
		.byte 	$01,<CRSRDN,>CRSRDN
		.byte 	$02,<CRSRLEFT,>CRSRLEFT
		.byte 	$03,<CRSRRIGHT,>CRSRRIGHT
		.byte 	$05,<PAGEUP,>PAGEUP
		.byte 	$06,<PAGEDOWN,>PAGEDOWN
		.byte 	$08,<BACKSPACE,>BACKSPACE
		.byte 	$13,<RETURN_TO_OS,>RETURN_TO_OS
		.byte 	$14,<TOGGLEMODE,>TOGGLEMODE
		.byte 	$30,<INSERTCR,>INSERTCR
		.byte 	127,<DELETECHAR,>DELETECHAR
		.byte 	$18,<DOS65SAVE,>DOS65SAVE
		.byte 	$19,<DOS65SAVEAS,>DOS65SAVEAS
		.byte 	$24,<TRUNCATE,>TRUNCATE
		.byte 	$FF



RETURN_TO_OS:
	JSR 	CLEARSCREEN
	JSR	READKB_XON
	JMP 	$0100


;__EDIT__________________________________________________________________________________________________________________________
;
; 	EDIT THE FILE
;
;________________________________________________________________________________________________________________________________
;
EDIT:
	PHA				; STORE KEYSTROKE
	LDA	MODE			; OVERWRITE OR INSERT?
	CMP	#$00			;
	BEQ     EDIT_OM			; OVERWRITE MODE
	JSR	INSERTCHAR		; INSERT CHAR SPACE
EDIT_OM:
	LDY	#$00			;
	LDA	(EDTPOS),Y		; IS CRSR OVER A CR?
	CMP	#13			;
	BNE	EDIT_OMB		; NO, CONTINUE
	INY				;
	LDA	(EDTPOS),Y		; IS NEXT POS A NULL?
	CMP	#$00			;
	BNE	EDIT_OMC		;
EDIT_OMA:
	PLA				;
	LDY	#$00			;
	STA	(EDTPOS),Y		; PUT CHAR IN EDIT BUFFER
	JSR	TOCONSOLE		; PLACE CHAR ON SCREEN
	JSR	INCEDTPOS		; MOVE EDTPOS 1 TO THE RIGHT
	LDA	#13			;
	STA	(EDTPOS),Y		; PUT CHAR IN EDIT BUFFER
	JSR	TOCONSOLE		; PLACE CHAR ON SCREEN
	JSR	INCEDTPOS		; MOVE EDTPOS 1 TO THE RIGHT
	JSR	CRSRLEFT		; MOVE CSR BACK 1
	JSR	EDITCHECK		;
	JMP	EDITLOOP		;

EDIT_OMB:
	PLA
	LDY	#$00
	STA	(EDTPOS),Y		; PUT CHAR IN EDIT BUFFER
	JSR	TOCONSOLE		; PLACE CHAR ON SCREEN
	JSR	INCEDTPOS		; MOVE EDTPOS 1 TO THE RIGHT
	JSR	EDITCHECK		;
	JMP	EDITLOOP

EDIT_OMC:

	LDA	CSRPOSY			; HAVE WE REACHED THE END OF THE SCREEN?
	CMP	#LASTROW-1		;
	BNE	*+5			; NO
	JSR	SCROLLDOWN		; SCROLL

	JSR	INSERTLINE
	JMP	EDIT_OMA

;__EDITCHECK_____________________________________________________________________________________________________________________
;
; 	IF EDTPOS > CURRENTLEN CHANGE CURRENTLEN
;
;________________________________________________________________________________________________________________________________
;
EDITCHECK:
	PHA
	LDA	EDTPOS+1
	CMP	CURRENTLEN+1
	BCC	EDITCHECK_1
	LDA	EDTPOS
	CMP	CURRENTLEN
	BCC	EDITCHECK_1

	LDA	EDTPOS+1
	STA	CURRENTLEN+1
	LDA	EDTPOS
	STA	CURRENTLEN
	INC 	CURRENTLEN
EDITCHECK_1:
	PLA
	RTS

;__INSERTCR______________________________________________________________________________________________________________________
;
; 	INSERT CR AT THE CURRENT POSITION
;
;________________________________________________________________________________________________________________________________
;
INSERTCR:
	LDA	CSRPOSX			; Store current cursor and edit position into stack
	PHA				;
	LDA	CSRPOSY			;
	PHA				;
	LDA	EDTPOS			;
	PHA				;
	LDA	EDTPOS+1		;
	PHA				;


	LDY	#$00			; move editpos to the end of the screen and store count into INSERTCHTEMP
	STY	INSERTCHTEMP		; INSERTCHTEMP=0
	LDX	CSRPOSX			; x=current x pos
INSERTCR1:
	INX				; x++
	INC	INSERTCHTEMP		; INSERTCHTEMP++
	JSR	INCEDTPOS		; MOVE EDTPOS 1 TO THE RIGHT
	CPX	#MAXCOL			; are we at the end of the line?
	BNE	INSERTCR1		; no, loop

INSERTCR2:
	LDA	#$00			; INSERT A LINE
	STA	CSRPOSX			;
	INC	CSRPOSY			;
	JSR	GOCSR			;
	JSR	INSERTLINE		; INSERT A LINE


	TSX				;
	PLA				;
	STA	EDTPOS+1		;
	PLA				;
	STA	EDTPOS			;
	PLA				;
	STA	CSRPOSY			;
	PLA				;
	STA	CSRPOSX			;
	TXS				;

	LDX	INSERTCHTEMP		;

INSERTCR3:
	LDY    	#$00
	LDA	(EDTPOS),Y		;
	LDY	INSERTCHTEMP		;
	STA	(EDTPOS),Y		;

	JSR	TOCONSOLE		; PLACE CHAR ON SCREEN
	LDA	#$00			;
	TAY				;
	STA	(EDTPOS),Y		;

	JSR	INCEDTPOS		; MOVE EDTPOS 1 TO THE RIGHT
	DEX				;
	CPX	#$00			;
	BNE	INSERTCR3		;

	PLA				;
	STA	EDTPOS+1		;
	PLA				;
	STA	EDTPOS			;
	PLA				;
	STA	CSRPOSY			;
	PLA				;
	STA	CSRPOSX			;
	JSR	GOCSR

	LDY	#$00			;
	LDA	#13			;
	STA	(EDTPOS),Y		; PUT CHAR IN EDIT BUFFER
	JSR	TOCONSOLE		; PLACE CHAR ON SCREEN
	JSR	INCEDTPOS		; MOVE EDTPOS 1 TO THE RIGHT


	LDX	INSERTCHTEMP		;
	DEX				;
INSERTCR4:
	TXA
	PHA
	LDA	(EDTPOS),Y		; PUT CHAR IN EDIT BUFFER
	JSR	TOCONSOLE		; PLACE CHAR ON SCREEN
	JSR	INCEDTPOS		; MOVE EDTPOS 1 TO THE RIGHT
	PLA				;
	TAX				;
	DEX				;
	CPX	#$00			;
	BNE	INSERTCR4		;

	JSR	GOCSR
	RTS

INSERTCHTEMP:	.byte	0		;

;__TRUNCATE______________________________________________________________________________________________________________________
;
; 	TRUNCATE FILE AT THE CURRENT POSITION
;
;________________________________________________________________________________________________________________________________
;
TRUNCATE:
	LDA	CSRPOSX			; Store current cursor and edit position into stack
	PHA				;
	LDA	CSRPOSY			;
	PHA				;
	LDA	EDTPOS			;
	PHA				;
	LDA	EDTPOS+1		;
	PHA				;

	LDY	#$00			;
	LDA	#13			;
	STA	(EDTPOS),Y		; PUT CHAR IN EDIT BUFFER
	JSR	TOCONSOLE		; PLACE CHAR ON SCREEN

TRUNCATE_LOOP:
	JSR	INCEDTPOS
	LDA	#$00			;
	TAY				;
	STA	(EDTPOS),Y		; PUT CHAR IN EDIT BUFFER

	LDA 	EDTPOS+1		;
	CMP 	CURRENTLEN+1		;
	BNE 	TRUNCATE_LOOP		;
	LDA 	EDTPOS			;
	CMP 	CURRENTLEN		;
	BNE	TRUNCATE_LOOP		;

	PLA				;
	STA	EDTPOS+1		;
	STA 	CURRENTLEN+1		;
	PLA				;
	STA	EDTPOS			;
	STA 	CURRENTLEN		;
	PLA				;
	STA	CSRPOSY			;
	PLA				;
	STA	CSRPOSX			;

	JSR	CHKPOS			;
	JSR	PAGEUP			;

	RTS


;__INSERTLINE____________________________________________________________________________________________________________________
;
; 	INSERT ONE LINE AT THE CURRENT POSITION
;
;________________________________________________________________________________________________________________________________
;
INSERTLINE:
	JSR	EDITCHECK		; VERIFY WE ARE NOT PAST EOF
	LDA	CURRENTLEN		;
	STA	TMPPOS			;
	LDA	CURRENTLEN+1		;
	STA	TMPPOS+1		; TMPPOS SHOULD BE BOTTOM OF COPY

	LDA	CURRENTLEN		; SET CURRENTLEN TO NEW TOP
	CLC				; (+80)
	ADC	#$50			;
	STA	CURRENTLEN		;
	LDA	CURRENTLEN+1		;
	ADC	#$00			;
	STA	CURRENTLEN+1		;
	CMP	#>(Ram_top-1)		; are we at the end of RAM?
	BCS	INSERTLINE_ABORT	; IF SO, ABORT
					;
INSERTLINE1:
	LDY	#$00			;
	LDA	(TMPPOS),Y		;
	LDY	#$50        		;
	STA	(TMPPOS),Y		;
	DEC	TMPPOS			;
	LDA	TMPPOS			;
	CMP	#$FF			;
	BNE	INSERTLINE1A		;
	DEC	TMPPOS+1		;
INSERTLINE1A:
	LDA 	TMPPOS+1		;
	CMP 	EDTPOS+1		;
	BNE 	INSERTLINE1		;
	LDA 	TMPPOS			;
	CMP 	EDTPOS			;
	BNE	INSERTLINE1		;
	LDX	#80			;
	LDY	#$00			;
	LDA	#$00			;
INSERTLINE2:
	STA	(TMPPOS),Y		;
	INY				;
	DEX				;
	CPX	#$00			;
	BNE	INSERTLINE2		;

	LDA	CSRPOSX			;
	PHA				;
	LDA	CSRPOSY			;
	PHA				;
	LDA	EDTPOS			;
	PHA				;
	LDA	EDTPOS+1		;
	PHA				;
	LDY	#$00			;

INSERTLINE3:
	LDA	(EDTPOS),Y		;
	JSR	TOCONSOLE		;
	JSR	INCEDTPOS		;
	LDA	CSRPOSY			; HAVE WE REACHED THE END OF THE SCREEN?
	CMP	#LASTROW		;
	BNE	INSERTLINE3		; NO
	PLA				;
	STA	EDTPOS+1		;
	PLA				;
	STA	EDTPOS			;
	PLA				;
	STA	CSRPOSY			;
	PLA				;
	STA	CSRPOSX			;
	JMP	GOCSR			;

INSERTLINE_ABORT:
	RTS



;__DELETELINE____________________________________________________________________________________________________________________
;
; 	DELETE ONE LINE AT THE CURRENT POSITION
;
;________________________________________________________________________________________________________________________________
;
DELETELINE:
	LDA	EDTPOS			;
	STA	TMPPOS			;
	LDA	EDTPOS+1		;
	STA	TMPPOS+1		; TMPPOS SHOULD BE TOP OF COPY

	LDA	CURRENTLEN		; SET CURRENTLEN TO NEW TOP
	SEC				; (+80)
	SBC	#$50			;
	STA	CURRENTLEN		;
	LDA	CURRENTLEN+1		;
	SBC	#$00			;
	STA	CURRENTLEN+1		;
					;
DELETELINE1:
	LDY	#$50			;
	LDA	(TMPPOS),Y		;
	LDY	#$00        		;
	STA	(TMPPOS),Y		;
	INC	TMPPOS			;
	LDA	TMPPOS			;
	CMP	#$00			;
	BNE	DELETELINE1A		;
	INC	TMPPOS+1		;
DELETELINE1A:
	LDA 	TMPPOS+1		;
	CMP 	CURRENTLEN+1		;
	BNE 	DELETELINE1		;
	LDA 	TMPPOS			;
	CMP 	CURRENTLEN		;
	BNE	DELETELINE1		;

	LDA	CSRPOSX			;
	PHA				;
	LDA	CSRPOSY			;
	PHA				;
	LDA	EDTPOS			;
	PHA				;
	LDA	EDTPOS+1		;
	PHA				;
	LDA	#$00			;
	STA	CSRPOSX			;
	JSR	GOCSR			;
	LDY	#$00			;
DELETELINE3:
	LDA	(EDTPOS),Y		;
	JSR	TOCONSOLE		;
	JSR	INCEDTPOS		;
	LDA	CSRPOSY			; HAVE WE REACHED THE END OF THE SCREEN?
	CMP	#LASTROW		;
	BNE	DELETELINE3		; NO
	PLA				;
	STA	EDTPOS+1		;
	PLA				;
	STA	EDTPOS			;
	PLA				;
	STA	CSRPOSY			;
	PLA				;
	STA	CSRPOSX			;
	JMP	GOCSR			;


;__INSERTCHAR____________________________________________________________________________________________________________________
;
; 	INSERT ONE CHAR AT THE CURRENT POSITION
;
;________________________________________________________________________________________________________________________________
;
INSERTCHAR:
	LDA	EDTPOS			; STORE CURRENT POSITION
	STA	TMPPOS			;
	LDA	EDTPOS+1		;
	STA	TMPPOS+1		;

					; FIND END OF LINE
	LDY	#$00			;
INSERTCHAR1:
	LDA	(TMPPOS),Y		;

	INC	TMPPOS			; INC POINTER
	BNE	*+4			;
	INC	TMPPOS+1		;
	CMP	#13			; AT END?
	BEQ	INSERTCHAR2		; FOUND END

	LDA	TMPPOS+1
	CMP	#>(Ram_top-1)	; are we at the end of RAM?
	BCS	INSERTCHAR_ABORT	; IF SO, ABORT
	JMP	INSERTCHAR1		;

INSERTCHAR2:
	LDA	(TMPPOS),Y		; FREE SPACE AT END OF LINE?
	CMP	#$00			;
	BEQ	INSERTCHAR3		;
	JSR	INSERTCHAR5		; NO, INSERT A LINE

INSERTCHAR3:
	DEC	TMPPOS			; DEC TMPPOS
	LDA	TMPPOS			;
	CMP	#$FF			;
	BNE	*+4			;
	DEC	TMPPOS+1		;

	LDY	#$00			; MOVE EVERYTHING UP ONE POS
	LDA	(TMPPOS),Y		;
	INY				;
	STA	(TMPPOS),Y		;
	LDA	TMPPOS+1		; AT CURRENT POSITION?
	CMP	EDTPOS+1		;
	BNE	INSERTCHAR3		; NO, LOOP
	LDA	TMPPOS			;
	CMP	EDTPOS			;
	BNE	INSERTCHAR3		; NO, LOOP

	LDA	CSRPOSX			;
	PHA				;
	LDA	CSRPOSY			;
	PHA				;
	LDA	EDTPOS			;
	PHA				;
	LDA	EDTPOS+1		;
	PHA				;
	LDY	#$00			;
INSERTCHAR4:
	LDA	(EDTPOS),Y		;
	PHA				;
	JSR	TOCONSOLE		;
	JSR	INCEDTPOS		;
	PLA 				;
	CMP	#13			; HAVE WE REACHED THE END OF THE ROW?
	BNE	INSERTCHAR4		; NO
	PLA				;
	STA	EDTPOS+1		;
	PLA				;
	STA	EDTPOS			;
	PLA				;
	STA	CSRPOSY			;
	PLA				;
	STA	CSRPOSX			;
	JMP	GOCSR			;
INSERTCHAR_ABORT:
	RTS				;
INSERTCHAR5:
	LDA	CSRPOSY			; HAVE WE REACHED THE END OF THE SCREEN?
	CMP	#LASTROW-1		;
	BNE	*+5			; NO
	JSR	SCROLLDOWN		; SCROLL

	LDA	EDTPOS			;
	PHA				;
	LDA	EDTPOS+1		;
	PHA				;
	LDA	CSRPOSX			;
	PHA				;
	LDA	CSRPOSY			;
	PHA				;
	LDA	#$00			;
	STA	CSRPOSX			;
	INC	CSRPOSY			;
	JSR	GOCSR			;

	LDA	TMPPOS			;
	STA	EDTPOS			;
	LDA	TMPPOS+1		;
	STA	EDTPOS+1		;

	JSR	INSERTLINE		;
	PLA				;
	STA	CSRPOSY			;
	PLA				;
	STA	CSRPOSX			;
	PLA				;
	STA	EDTPOS+1		;
	PLA				;
	STA	EDTPOS			;
	JMP	GOCSR			;




;__BACKSPACE_____________________________________________________________________________________________________________________
;
; 	PERFORM BACKSPACE FUNCTION AT THE CURRENT POSITION
;
;________________________________________________________________________________________________________________________________
;
BACKSPACE:
	JSR	CRSRLEFT
	JMP	DELETECHAR


;__DELETECHAR____________________________________________________________________________________________________________________
;
; 	DELETE ONE CHAR AT THE CURRENT POSITION
;
;________________________________________________________________________________________________________________________________
;
DELETECHAR:
	LDA	EDTPOS			; STORE CURRENT POSITION
	STA	TMPPOS			;
	LDA	EDTPOS+1		;
	STA	TMPPOS+1		;

					; FIND MOVE CHARS BACK ONE SPACE UNTIL THE END OF LINE
DELETECHAR1:
	LDY	#$01			;
	LDA	(TMPPOS),Y		;
	CMP	#$00			;
	BNE	DELETECHAR1A		;
	LDA	#32			; REPLACE NULLS WITH SPACES
DELETECHAR1A:
	LDY	#$00			;
	STA	(TMPPOS),Y		;

	INC	TMPPOS			; INC POINTER
	BNE	*+4			;
	INC	TMPPOS+1		;
	CMP	#13			; AT END?
	BEQ	DELETECHAR2		; FOUND END

	LDA	TMPPOS+1
	CMP	#>(Ram_top-1)		; are we at the end of RAM?
	BCS	DELETECHAR_ABORT	; IF SO, ABORT
	JMP	DELETECHAR1		;




DELETECHAR2:
	LDA	#$00
	STA	(TMPPOS),Y		;

	LDA	CSRPOSX			;
	PHA				;
	LDA	CSRPOSY			;
	PHA				;
	LDA	EDTPOS			;
	PHA				;
	LDA	EDTPOS+1		;
	PHA				;
	LDY	#$00			;
DELETECHAR4:
	LDA	(EDTPOS),Y		;
	PHA				;
	JSR	TOCONSOLE		;
	JSR	INCEDTPOS		;
	PLA 				;
	CMP	#13			; HAVE WE REACHED THE END OF THE ROW?
	BNE	DELETECHAR4		; NO

	LDA	#$00			; BLOT OUT THE OLD END OF LINE CHAR
	JSR	TOCONSOLE		;
	LDA	CSRPOSX			;
	CMP	#01			; IF WE STAYED ON THE SAME LINE, DO NOTHING
	BNE	DELETECHAR5		;
	JSR	DELETELINE		;
DELETECHAR5:
	PLA				;
	STA	EDTPOS+1		;
	PLA				;
	STA	EDTPOS			;
	PLA				;
	STA	CSRPOSY			;
	PLA				;
	STA	CSRPOSX			;
	JMP	GOCSR			;
DELETECHAR_ABORT:
	RTS				;

DELETECHARTMP:	.byte	0


;__TOGGLEMODE_____________________________________________________________________________________________________________________
;
; 	TOGGLE INSERT/OVERWRITE MODE
;
;________________________________________________________________________________________________________________________________
;
TOGGLEMODE:

	LDA	MODE			;
	CMP	#$00			;
	BNE	TOGGLEMODEOW		;

TOGGLEMODEIM:
	LDA	#$01			;
	STA	MODE			;
	LDA	#<IMMODE	     	;
	LDY	#>IMMODE	;
	LDX	#9			;
	JSR	PEM			;
	JMP	GOCSR			;
IMMODE:
	.byte	$1B,'[','2','3',';','6','2','H'
	.byte	$1B,'[','7','m'
	.byte	"IM"
	.byte	$1B,'[','0','m','$'
TOGGLEMODEOW:
	LDA	#$00			;
	STA	MODE			;
	LDA	#<OWMODE		;
	LDY	#>OWMODE		;
	LDX	#9			;
	JSR	PEM			;
	JMP	GOCSR			;

OWMODE:
	.byte	$1B,'[','2','3',';','6','2','H'
	.byte	$1B,'[','7','m'
	.byte	"OM"
	.byte	$1B,'[','0','m','$'



;__CRSRUP________________________________________________________________________________________________________________________
;
; 	MOVE THE CURSOR UP ONE POSITION, DEC THE BUFFER POINTER AND SCROLL UP IF NECESSARY
;
;________________________________________________________________________________________________________________________________
;
CRSRUP:
	LDA	EDTPOS			;
	BNE	CRSRUP1			; CHECK TO SEE IF POINTER IS AT THE VERY TOP OF THE
	LDA	EDTPOS+1		; BUFFER.  IF IT IS, DO NOTHING.
	CMP	#>BUFFER	;
	BNE	CRSRUP1			;
	RTS				;
CRSRUP1:
	LDX	#$00			;
	LDA	CSRPOSY			; FIRST LINE?
	CMP	#$00			; THEN SCROLL UP
	BNE	CRSRUP2			;
	JSR	SCROLLUP		;
	RTS

CRSRUP2:
	JSR	DECEDTPOS		; MOVE POINTER BACK ONE
	INX				; INC COUNTER
	CPX	#MAXCOL			; HAVE WE GONE BACK MAXCOL POSITIONS?
	BNE	CRSRUP2			; YES, EXIT

	DEC	CSRPOSY			;
	JSR	CHKPOS			; WE ARE DONE! POSITION THE CURSOR AND EXIT
	RTS				;


;__CRSRDN________________________________________________________________________________________________________________________
;
; 	MOVE THE CURSOR DOWN ONE POSITION, INC THE BUFFER POINTER AND SCROLL IF NECESSARY
;
;________________________________________________________________________________________________________________________________
;
CRSRDN:

	LDA	CSRPOSY			; HAVE WE REACHED THE END OF THE SCREEN?
	CMP	#LASTROW-1		;
	BNE	CRSRDN1			; NO, JUST MOVE DOWN
	JSR	SCROLLDOWN		; SCROLL

CRSRDN1:
	LDX	#$00
CRSRDN2:
	JSR	INCEDTPOS		; MOVE EDTPOS 1 TO THE RIGHT
	INX
	CPX	#MAXCOL
	BEQ 	CRSRDN3			; YES, DONE
	LDA 	EDTPOS+1		; WILL NEXT MOVE SEND US PAST THE END OF RAM?
	CMP 	#>Ram_top	; are we at the end of RAM?
	BEQ 	CRSRDN4			; YES, DONE THEN
	LDA	EDTPOS+1		;

CRSRDN2A:
	JMP 	CRSRDN2			; NO, KEEP GOING
CRSRDN3:
	INC 	CSRPOSY			;
	JSR	CHKPOS			; WE ARE DONE! POSITION THE CURSOR AND EXIT
	RTS				;
CRSRDN4:
	JMP	PAINTSCREEN0		;



;__CRSRLEFT______________________________________________________________________________________________________________________
;
; 	MOVE THE CURSOR LEFT ONE POSITION, DEC THE BUFFER POINTER AND SCROLL UP IF NECESSARY
;
;________________________________________________________________________________________________________________________________
;
CRSRLEFT:
	LDA	EDTPOS			;
	BNE	CRSRLEFT1		; CHECK TO SEE IF POINTER IS AT THE VERY TOP OF THE
	LDA	EDTPOS+1		; BUFFER.  IF IT IS, DO NOTHING.
	CMP	#>BUFFER	;
	BNE	CRSRLEFT1		;
	RTS				;
CRSRLEFT1:
	DEC	CSRPOSX			; DEC THE CURSOR POSITION
	LDA	CSRPOSX			; CHECK TO SEE IF WE WERE AT THE LEFT MOST POSITION
	CMP	#$FF			;
	BEQ	CRSRLEFT2		; IF WE WERE, DO SOME SPECIAL STUFF
	JSR	DECEDTPOS		; MOVE EDTPOS 1 TO THE LEFT
	JMP	CHKPOS			; POSITION THE CURSOR
CRSRLEFT2:				; CURSOR IS AT THE LEFT MOST LINE
	LDA	#MAXCOL-1		;
	STA	CSRPOSX			;
	TAX				;
CRSRLEFT2A:
	JSR	INCEDTPOS		;
	DEX				;
	BNE	CRSRLEFT2A		;
	JMP	CRSRUP			; MOVE UP ONE LINE


;__CRSRRIGHT_____________________________________________________________________________________________________________________
;
; 	MOVE THE CURSOR RIGHT ONE POSITION, INC THE BUFFER POINTER AND SCROLL IF NECESSARY
;
;________________________________________________________________________________________________________________________________
;
CRSRRIGHT:
	LDA	CSRPOSY			; IS CURSOR ON LAST POSITION OF SCREEN?
	CMP	#LASTROW-1		; IF NOT, BRANCH TO CSRRIGHT1, OTHERWISE
	BNE	CRSRRIGHT1		; SCROLL SCREEN
	LDA	CSRPOSX			;
	CMP	#MAXCOL-1		;
	BNE	CRSRRIGHT1		;
					;
	JSR	SCROLLDOWN		;
					;
CRSRRIGHT1:				;
	JSR	GOCSR			; POSITION CURSOR
	LDY	#$00			;
	LDA	(EDTPOS),Y		; GET CHAR FROM EDIT BUFFER
	JSR	TOCONSOLE		; PLACE CHAR ON SCREEN
					;
	JSR	INCEDTPOS		; MOVE EDTPOS 1 TO THE RIGHT
					;
	LDA	EDTPOS+1		;
	CMP	#>Ram_top	; are we at the end of RAM?
	BNE	CRSRRIGHT2		; NO, EXIT
	JSR	DECEDTPOS		; OTHERWISE BACK POINTER OFF ONE
					; AND PLACE CURSOR BACK ONE POSITION
	DEC	CSRPOSX			;
	LDA	CSRPOSX			;
	CMP	#$FF			;
	BNE	CRSRRIGHT2		;
	DEC	CSRPOSY			;
	LDA	#MAXCOL			;
	STA	CSRPOSX			; DDW 11/29/2014 (FROM Y)
CRSRRIGHT2:
	JSR	CHKPOS
	RTS				;



;__SCROLLUP_____________________________________________________________________________________________________________________
;
; 	SCROLL UP ONE LINE
;
;
;
;
;________________________________________________________________________________________________________________________________
;
SCROLLUP:
	LDA	EDTPOS+1		; CHECK HIGH BYTE, IF NOT EQUAL
	CMP	#>BUFFER	; NO WAY WE ARE AT START OF BUFFER
	BNE	SCROLLUPSTART		; SO SCROLL
	LDA	EDTPOS			; CHECK LOW BYTE
	CMP	#MAXCOL+1		; IF WE ARE NOT ON TOP LINE
	BCS	SCROLLUPSTART		; SCROLL
	RTS        			; IF NOT, DO NOTHING

SCROLLUPSTART:
	LDA	#<SCROLLUPT		;
	LDY	#>SCROLLUPT
	LDX	#9			;
	JSR	PEM			;

	LDA	CSRPOSY
	PHA
	LDA	CSRPOSX
	PHA

	LDA	#MAXCOL
	CLC
	ADC	CSRPOSX
	TAX
SCROLLUP1:
	JSR	DECEDTPOS
	DEX
	CPX	#$00
	BNE	SCROLLUP1

	LDX	#$00
	STX	CSRPOSX
	STX	CSRPOSY
	JSR	GOCSR

	LDA	EDTPOS
	PHA
	LDA	EDTPOS+1
	PHA

	JSR	DECEDTPOS
	LDY	#$00
	LDX	#MAXCOL
SCROLLUP2:
	JSR	INCEDTPOS
	LDA	(EDTPOS),Y
	JSR	TOCONSOLE
	DEX
	CPX	#$00
	BNE	SCROLLUP2

	PLA
	STA	EDTPOS+1
	PLA
	STA	EDTPOS

	PLA
	STA	CSRPOSX			;
	TAX
	PLA
	STA	CSRPOSY			;
	JSR	GOCSR			;

SCROLLUP3:
	CPX	#$00
	BEQ	SCROLLUP4
	JSR	INCEDTPOS
	DEX
	JMP	SCROLLUP3

SCROLLUP4:
	JSR	CHKPOS
	RTS

SCROLLUPT:
	.byte	$1B,'[','3',';','2','2','r',$1B,'[','3',';','1','H',$1B,'M',$1B,'[','r','$'

;__SCROLLDOWN___________________________________________________________________________________________________________________
;
; 	SCROLL DOWN ONE LINE
;
;
;
;________________________________________________________________________________________________________________________________
;
SCROLLDOWN:
	LDA	#<SCROLLDOWNT
	LDY	#>SCROLLDOWNT
	LDX	#9			;
	JSR	PEM			;


	LDA	CSRPOSX
	PHA
	LDA	CSRPOSY
	PHA
	LDA	EDTPOS
	PHA
	LDA	EDTPOS+1
	PHA


       	LDA	#MAXCOL
       	SEC
       	SBC	CSRPOSX
	TAX
	DEX
	BEQ	SCROLLDOWN1A
SCROLLDOWN1:
	JSR	INCEDTPOS
	DEX
	CPX	#$00
	BNE	SCROLLDOWN1
SCROLLDOWN1A:
	LDX	#$00
	STX	CSRPOSX
	JSR	GOCSR

	LDY	#$00
	LDX	#MAXCOL
SCROLLDOWN2:
	JSR	INCEDTPOS
	LDA	(EDTPOS),Y
	JSR	TOCONSOLE
	DEX
	CPX	#$00
	BNE	SCROLLDOWN2

	PLA
	STA	EDTPOS+1
	PLA
	STA	EDTPOS
	PLA
	STA	CSRPOSY
	PLA
	STA	CSRPOSX
	DEC	CSRPOSY

	JMP	CHKPOS

SCROLLDOWNT:
	.byte	$1B,'[','3',';','2','2','r',$1B,'[','2','2',';','1','H',$1B,'D',$1B,'[','r','$'



;__CHKPOS________________________________________________________________________________________________________________________
;
; 	ENSURE THAT THE CURSOR IS ON A VALID EDITING POSITION
;	IF NOT, FIND ONE!
;
;________________________________________________________________________________________________________________________________
;
CHKPOS:
	LDY	#$00
	LDA	(EDTPOS),Y
	CMP	#$00
	BNE	CHKPOS2

	LDA	EDTPOS+1		; CHECK HIGH BYTE, IF NOT EQUAL
	CMP	#>BUFFER	; NO WAY WE ARE AT START OF BUFFER
	BNE	CHKPOS1			; SO GO ON
	LDA	EDTPOS			; CHECK LOW BYTE
	CMP	#$00			; IF WE ARE NOT AT TOP
	BCS	CHKPOS1			; SCROLL
	RTS        			; IF NOT, DO NOTHING
CHKPOS1:
	JSR	DECEDTPOS		; DEC THE EDIT POSITION
	DEC	CSRPOSX			; DEC THE CURSOR POSITION
	LDA	CSRPOSX			; ARE WE PAST THE START OF THE ROW?
	CMP	#$FF
	BEQ	CHKPOS1A		; YES, GO UP ONE LINE
	JMP	CHKPOS			; NO, LOOP

CHKPOS1A:
	LDA	#MAXCOL-1		; LOAD X AT MAXCOL
	STA	CSRPOSX
	DEC	CSRPOSY
	LDA	CSRPOSY
	CMP	#$FF
	BNE	CHKPOS1B
	LDA	#$00
	STA	CSRPOSY
	JMP	SCROLLUP

CHKPOS1B:
	JMP	CHKPOS
CHKPOS2:
	JMP	GOCSR



;__INCEDTPOS_____________________________________________________________________________________________________________________
;
; 	INCREMENT THE EDTPOS POINTER
;
;________________________________________________________________________________________________________________________________
;

INCEDTPOS:
	INC	EDTPOS
	BNE	INCEDTPOS1
	INC	EDTPOS+1
INCEDTPOS1:
	RTS

;__DECEDTPOS_____________________________________________________________________________________________________________________
;
; 	DECREMENT THE EDTPOS POINTER
;
;________________________________________________________________________________________________________________________________
;
DECEDTPOS:
	DEC	EDTPOS
	LDA	EDTPOS
	CMP	#$FF
	BNE	DECEDTPOS1
	DEC	EDTPOS+1
DECEDTPOS1:
	RTS




;__PAGEDOWN_______________________________________________________________________________________________________________________
;
; 	PERFORM PAGE DOWN FUNCTION
;
;
;________________________________________________________________________________________________________________________________
;
PAGEDOWN:
	LDA	EDTPOS			;
	BNE	PAGEDOWNA		; CHECK TO SEE IF POINTER IS AT THE VERY TOP OF THE
	LDA	EDTPOS+1		; BUFFER.
	CMP	#>BUFFER	;
	BNE	PAGEDOWNA		;
	JMP 	PAGEDOWN1		;
PAGEDOWNA:
	LDA	CSRPOSX
	CMP	#$00
	BEQ	PAGEDOWN1
	JSR	DECEDTPOS
	DEC	CSRPOSX
	JMP	PAGEDOWN

PAGEDOWN1:
	LDX	#$64
PAGEDOWN2:
	LDY	#$10
PAGEDOWN2A:
	JSR	INCEDTPOS

	LDA 	EDTPOS+1		; WILL NEXT MOVE SEND US PAST THE END OF RAM?
	CMP 	#>Ram_top	; are we at the end of RAM?
	BNE	PAGEDOWN2B		;
	JMP	PAGEDOWN2C		;
PAGEDOWN2B:
	DEY
	CPY	#$00
	BNE	PAGEDOWN2A
	DEX
	CPX	#$00
	BNE	PAGEDOWN2
PAGEDOWN2C:
	LDA	EDTPOS
	PHA
	LDA	EDTPOS+1
	PHA
	JSR 	PAINTSCREEN1
	PLA
	STA	EDTPOS+1
	PLA
	STA	EDTPOS
	LDA	#$00
	STA	CSRPOSX
	STA	CSRPOSY
	JMP	GOCSR





;__PAGEUP________________________________________________________________________________________________________________________
;
; 	PERFORM PAGE UP FUNCTION
;
;
;________________________________________________________________________________________________________________________________
;
PAGEUP:
	LDA	EDTPOS		;
	BNE	PAGEUPA		; CHECK TO SEE IF POINTER IS AT THE VERY TOP OF THE
	LDA	EDTPOS+1	; BUFFER.
	CMP	#>BUFFER	;
	BNE	PAGEUPA		;
	RTS
PAGEUPA:
	LDA	CSRPOSX
	CMP	#$00
	BEQ	PAGEUP1
	JSR	DECEDTPOS
	DEC	CSRPOSX
	JMP	PAGEUP

PAGEUP1:
	LDX	#$64
PAGEUP2:
	LDY	#$10
PAGEUP2A:
	JSR	DECEDTPOS

	LDA	EDTPOS			;
	BNE	PAGEUP2B		; CHECK TO SEE IF POINTER IS AT THE VERY TOP OF THE
	LDA	EDTPOS+1		; BUFFER.
	CMP	#>BUFFER	;
	BNE	PAGEUP2B		;
	JMP	PAGEUP2C		;
PAGEUP2B:
	DEY
	CPY	#$00
	BNE	PAGEUP2A
	DEX
	CPX	#$00
	BNE	PAGEUP2
PAGEUP2C:
	LDA	EDTPOS
	PHA
	LDA	EDTPOS+1
	PHA
	JSR 	PAINTSCREEN1
	PLA
	STA	EDTPOS+1
	PLA
	STA	EDTPOS
	LDA	#$00
	STA	CSRPOSX
	STA	CSRPOSY
	JMP	GOCSR


;__PAINTSCREEN___________________________________________________________________________________________________________________
;
; 	PAINT THE INITIAL EDIT SCREEN
;
;
;
;________________________________________________________________________________________________________________________________
;
PAINTSCREEN:
	JSR	CLEARSCREEN

PAINTSCREEN0:
	LDA	#<BUFFER		; SETUP BUFFER
	STA	EDTPOS			; STORE DEST BUFFER
	LDA	#>BUFFER	;
	STA	EDTPOS+1		; STORE DEST BUFFER

PAINTSCREEN1:
	LDA	#$00
	STA	CSRPOSX
	STA 	CSRPOSY
	JSR	GOCSR


PAINTSCREEN_LOOP:
	LDY	#$00
	LDA	(EDTPOS),Y
	JSR	TOCONSOLE

	INC	EDTPOS
	BNE	PAINTSCREEN_LOOPA
	INC	EDTPOS+1

PAINTSCREEN_LOOPA:
	LDA	CSRPOSY
	CMP	#LASTROW
	BNE	PAINTSCREEN_LOOP

	LDA	#$00
	STA	CSRPOSX
	STA 	CSRPOSY
	JSR	GOCSR

	LDY	#$00

PAINTSCREEN_LOOPB:
	LDA	DFLFCB,Y
	STA	SCREENFORMAT1,Y
	INY
	CPY	#8
	BNE	PAINTSCREEN_LOOPB
	LDA	#'.'
	INY
	STA	SCREENFORMAT1,Y
	LDA	DFLFCB,Y
	INY
	STA	SCREENFORMAT1,Y
	LDA	DFLFCB,Y
	INY
	STA	SCREENFORMAT1,Y
	LDA	DFLFCB,Y
	INY
	STA	SCREENFORMAT1,Y




	LDA	#<SCREENFORMAT
	LDY	#>SCREENFORMAT
	LDX	#9			;
	JSR	PEM			;
	LDA	#<SCREENFORMAT1
	LDY	#>SCREENFORMAT1
	LDX	#9			;
	JMP	PEM			;


SCREENFORMAT:
	.byte	$1B,'[','0','0',';','0','0','H'
	.byte	$1B,'[','7','m'
	.byte	"DOS/65 SCREEN EDITOR"
	.byte	"                    "
	.byte	"                    ",'$'
SCREENFORMAT1:
	.byte	"                     "
	.byte	"____________________"
	.byte	"____________________"
	.byte	"____________________"
	.byte	"____________________"
	.byte	$1B,'[','2','3',';','0','0','H'
	.byte	"  F3=QUIT  F4=MODE  F7=SAVE "
	.byte	" F8=SAVE AS  F12=TRUNC.     "
	.byte	"     OM                "
	.byte	$1B,'[','0','m','$'



;__CLEARSCREEN___________________________________________________________________________________________________________________
;
; 	CLEAR THE SCREEN
;
;
;
;________________________________________________________________________________________________________________________________
;
CLEARSCREEN:
	LDA	#<CLEARSCREENT
	LDY	#>CLEARSCREENT
	LDX	#9			;
	JMP	PEM			;
CLEARSCREENT:
	.byte	$1B,'[','2','J','$'


;__GOCSR_________________________________________________________________________________________________________________________
;
; 	PLACE THE PHYSICAL CURSOR ON TO CSRPOSY AND CSRPOSX
;
;
;
;________________________________________________________________________________________________________________________________
;
GOCSR:
	PHA
	TYA
	PHA
	TXA
	PHA
	LDY	CSRPOSY
	LDA	DECIMAL1+3,Y
	AND	#$0F
	CLC
	ADC	#'0'
	STA	GOCSRT+3
	LDA	DECIMAL1+3,Y
	ROR	A
	ROR	A
	ROR	A
	ROR	A
	AND	#$0F
	CLC
	ADC	#'0'
	STA	GOCSRT+2

	LDY	CSRPOSX
	LDA	DECIMAL1+1,Y
	AND	#$0F
	CLC
	ADC	#'0'
	STA	GOCSRT+6
	LDA	DECIMAL1+1,Y
	ROR	A
	ROR	A
	ROR	A
	ROR	A
	AND	#$0F
	CLC
	ADC	#'0'
	STA	GOCSRT+5
	LDA	#<GOCSRT
	LDY	#>GOCSRT
	LDX	#9			;
	JSR	PEM			;
	PLA
	TAX
	PLA
	TAY
	PLA
	RTS
GOCSRT:
	.byte	$1B,'[','0','0',';','0','0','H','$'

;__TOCONSOLE_____________________________________________________________________________________________________________________
;
; 	TRANSLATE BUFFER TO CONSOLE
;	A: CHAR TO OUTPUT
;
;
;________________________________________________________________________________________________________________________________
;
TOCONSOLE:
	STA	TEMP
	TXA
	PHA
	TYA
	PHA
	LDA	TEMP
	CMP	#$0D			;  IS CHAR A <CR>?
	BNE	TOCONSOLE1		;  NO, CONTINUE
	LDA	#<PRINTCR
	LDY	#>PRINTCR
	LDX	#9			;
	JSR	PEM			;
	JMP	TOCONSOLE1B		;
TOCONSOLE1:
	CMP	#$00			; IS NULL?
	BNE	TOCONSOLE1A		;  NO, CONTINUE
	LDA	#32			; CHANGE NULL TO SPACE
TOCONSOLE1A:
	LDX	#2			;  OUTPUT THE CHAR TO THE CONSOLE
	JSR	PEM			;
TOCONSOLE1B:
	INC	CSRPOSX			;  MOVE THE CURSOR
	LDA	CSRPOSX			;  ARE WE AT THE END OF THE LINE?
	CMP	#MAXCOL			;
	BNE	TOCONSOLE2		;  NO, EXIT

	LDA	#$00			; MOVE CRSR TO START OF LINE
	STA	CSRPOSX			;
	INC	CSRPOSY			; ADVANCE TO NEXT ROW
	JSR	GOCSR			; MOVE CRSR
TOCONSOLE2:
	PLA
	TAY
	PLA
	TAX
	RTS				; DONE

PRINTCR:
	.byte	$1B,'[','7','m','<',$1B,'[','0','m','$'


;__READKB________________________________________________________________________________________________________________________
;
; 	READ THE KEYBOARD
;	A: DATA
;	Y: COMMAND
;		0 IS REGULAR CHAR
;		1 IS FUNCTION KEY
;			00=CRSR UP
;			01=CRSR DN
;			02=CRSR LEFT
;			03=CRSR RIGHT
;			04=PG DN
;			05=PG UP
;			08=BACKSPACE
;			$30=CR
;			$11-$24= FUNCTION KEYS
;		$FF IS NULL OP
;________________________________________________________________________________________________________________________________
;
READKB:
	JSR	READKB_XON

	LDA 	#$00		;
	LDY 	#$FF		;

	LDX	#6		;
	JSR	PEM		;

	CMP	#127		;
	BEQ	READKB_DEL	;

	CMP	#32		;
	BCS	READKB_CHAR	;

	CMP	#$1B		;
	BEQ	READKB_ESC	;

	CMP	#$0D		;
	BEQ	READKB_CR	;

	CMP	#$08		;
	BEQ	READKB_BS	;

	JMP	READKB_ERR	;

READKB_CR:
	JSR 	READKB_XOFF
	LDY	#01
	LDA	#$30
	RTS

READKB_CHAR:
	JSR 	READKB_XOFF
	LDY	#00
	RTS

READKB_BS:
	JSR 	READKB_XOFF
	LDY	#01
	LDA	#08
	RTS

READKB_DEL:
	JSR 	READKB_XOFF
	LDY	#01
	LDA	#127
	RTS

READKB_ERR:
	JSR 	READKB_XOFF
	LDY	#$FF
	LDA	#$00
	RTS

READKB_ESC:
	LDX	#6		;
	JSR	PEM		;

	CMP	#'['
	BNE	READKB_ERR

	LDX	#6		;
	JSR	PEM		;

	PHA
	AND	#$F0
	TAX
	PLA
	CPX	#$30
	BNE	READKB_NOTFKEY
	AND	#$0F
	STA 	TEMP
	LDX	#6		;
	JSR	PEM		;
	CMP	#'~'
	BNE	READKB_FKEY1
	LDA	#$00
	JMP	READKB_FKEY2
READKB_FKEY1:
	PHA

	LDX	#6		;
	JSR	PEM		;
	ASL	TEMP
	ASL	TEMP
	ASL	TEMP
	ASL	TEMP

	PLA
	AND	#$0F
READKB_FKEY2:
	CLC
	ADC	TEMP
	LDY	#01
	JSR 	READKB_XOFF

	RTS


READKB_NOTFKEY:
	CMP	#'A'
	BNE	READKB_NOTUP
	LDY	#01
	LDA	#00
	JSR 	READKB_XOFF
	RTS

READKB_NOTUP:
	CMP	#'B'
	BNE	READKB_NOTDN
	LDY	#01
	LDA	#01
	JSR 	READKB_XOFF
	RTS
READKB_NOTDN:
	CMP	#'D'
	BNE	READKB_NOTLEFT
	LDY	#01
	LDA	#02
	JSR 	READKB_XOFF
	RTS
READKB_NOTLEFT:
	CMP	#'C'
	BNE	READKB_NOTRIGHT
	LDY	#01
	LDA	#03
	JSR 	READKB_XOFF
	RTS
READKB_NOTRIGHT:
	JSR 	READKB_XOFF
	JMP	READKB_ERR

READKB_XON:
	PHA
	LDA	#17
	JMP	READKB_XOFF1
READKB_XOFF:
	PHA
	LDA	#19
READKB_XOFF1:
	LDX	#2			;  OUTPUT THE CHAR TO THE CONSOLE
	JSR	PEM			;
	PLA
	RTS

;__CLEARBUFFER___________________________________________________________________________________________________________________
;
; 	CLEAR THE EDIT BUFFER
;
;
;
;________________________________________________________________________________________________________________________________
;
CLEARBUFFER:
	LDA	#<BUFFER		; SETUP BUFFER
	STA	EDTPOS			;
	LDA	#>BUFFER	;
	STA	EDTPOS+1		;
	LDY	#$00			;

CLEARBUFFER1:
	LDA	#00
	STA	(EDTPOS),Y
	INY
	BNE	CLEARBUFFER1
	INC	EDTPOS+1
	LDA	EDTPOS+1
	CMP	#>Ram_top	; are we at the end of RAM?
	BNE	CLEARBUFFER1

	RTS


;__DOS65LOAD_____________________________________________________________________________________________________________________
;
; 	LOAD A DOS/65 FILE INTO THE EDIT BUFFER
;		FILE IS LOADED INTO 80 COLUMN LINES TO SIMPLIFY SCROLLING
;
;
;________________________________________________________________________________________________________________________________
;
DOS65LOAD:
	LDA	#0			; clear
	STA	DFLFCB+32		; record number
	LDA	#<DFLFCB		; Open File
	LDY	#>DFLFCB	;
	LDX	#15			;
	JSR	PEM			;
	CMP	#$FF			; error?, if NOT, continue
	BNE	DOS65LOAD_1		;

	LDA	#<BUFFER		; SETUP BUFFER
	STA	FCBPTR			; STORE DEST BUFFER IN FCBPTR
	LDA	#>BUFFER	;
	STA	FCBPTR+1		; STORE DEST BUFFER IN FCBPTR
	LDA	FCBPTR			;
	STA	CURRENTLEN		;
	LDA	FCBPTR+1		;
	STA	CURRENTLEN+1		;
	LDA	#13
	JSR 	DOS65LOAD_STOREBT
	RTS				; OPEN EDITOR, BLANK FILE

DOS65LOAD_ERR:
	LDA	#<FILEERROR2		; NO, ERROR OUT
	LDY	#>FILEERROR2
	LDX	#9			; Print error message
	JSR	PEM			;
	JMP	BOOT			; WARM BOOT DOS/65
DOS65LOAD_1:
	LDA	#0			; clear
	STA	DFLFCB+32		; record number
	STA	CURRENTLEN		; LENGTH COUNTER
	LDA	#<BUFFER		; SETUP BUFFER
	STA	FCBPTR			; STORE DEST BUFFER IN FCBPTR
	LDA	#>BUFFER	;
	STA	FCBPTR+1		; STORE DEST BUFFER IN FCBPTR

	LDA	#<FCBBUFFER		; SETUP BUFFER
	STA	TMPPOS			;
	LDY	#>FCBBUFFER
	STY	TMPPOS+1		;
	LDX	#26			; Setup Buffer
	JSR	PEM

DOS65LOAD_2:
	LDA	#<DFLFCB		; READ record buffer from disk file
	LDY	#>DFLFCB	;
	LDX	#20			;
	JSR	PEM			;
	CMP	#$00			; is error or EOF
	BEQ	DOS65LOAD_3		;
	CMP	#$01			; EOF?
	BEQ	DOS65LOAD_EOF		; YES, END
	JMP	DOS65LOAD_ERR		; ERROR, do error handling
DOS65LOAD_3:
	LDX	#$00			; CLEAR COUNTERS
	LDY	#$00			;
DOS65LOAD_3A:
	LDA	(TMPPOS),Y		; LOAD BYTE FROM BUFFER
	INY				; INC BUFFER COUNTER
	CMP	#$1A			; IF EOF, SIGNAL END
	BEQ	DOS65LOAD_4		;
	CMP	#$0D			; IF CR PLACE IT IN BUFFER AND PAD WITH SPACES TO MAXCOL
	BEQ	DOS65LOAD_3D		;
	CMP	#32			; IF UNPRINTABLE, DO NOT PLACE IN BUFFER
	BCC	DOS65LOAD_3C		;
	CMP	#127			;
	BCS	DOS65LOAD_3C		;
	JSR	DOS65LOAD_STOREBT	; STORE THE BYTE IN THE BUFFER
DOS65LOAD_3C:
	CPY	#$80			; ARE WE AT THE END OF THE SOURCE BUFFER?
	BNE	DOS65LOAD_3A		; NO, LOOP

	JMP	DOS65LOAD_2		; KEEP GOING!

DOS65LOAD_3D:				; IN ORDER TO MAKE SCROLLING EASIER <CR> LINES NEED PADDED TO MAXCOL
	JSR	DOS65LOAD_STOREBT	; STORE THE <CR> BYTE
DOS65LOAD_3D1:
	LDA	CURRENTLEN		;
	CMP	#MAXCOL			;
	BEQ	DOS65LOAD_3D2		;
	LDA	#$00			;
	STA	(FCBPTR,X)		; PLACE CHAR IN BUFFER
	INC	CURRENTLEN		; INC THE LENGTH COUNTER
	JSR	DOS65LOAD_STOREBT1	; INC THE BUFFER POINTER
	JMP	DOS65LOAD_3D1		;
DOS65LOAD_3D2:
	LDA	#$00			;
	STA	CURRENTLEN		;
	JMP	DOS65LOAD_3C		;
DOS65LOAD_EOF:
	LDA	#13
	JSR DOS65LOAD_STOREBT

DOS65LOAD_4:
	LDA	#<DFLFCB		; CLOSE FILE
	LDY	#>DFLFCB	;
	LDX	#16			;
	JSR	PEM			;
	LDA	FCBPTR			;
	STA	CURRENTLEN		;
	LDA	FCBPTR+1		;
	STA	CURRENTLEN+1		;
	RTS


DOS65LOAD_STOREBT:
	STA	(FCBPTR,X)		; PLACE CHAR IN BUFFER
	INC	CURRENTLEN		; INC THE LENGTH COUNTER
	LDA	CURRENTLEN		;
	CMP	#MAXCOL			; WRAP THE COUNTER ON MAXCOL
	BNE	DOS65LOAD_STOREBT1	;
	LDA	#$00			;
	STA	CURRENTLEN		;
DOS65LOAD_STOREBT1:
	INC	FCBPTR			; add to base counter
	BNE	DOS65LOAD_STOREBT2
	INC	FCBPTR+1		; yes, carry, inc high byte
	LDA	FCBPTR+1		;
	CMP	#>Ram_top	; are we at the end of RAM?
	BEQ	DOS65LOAD_STOREBTE	; YES, STOP.
DOS65LOAD_STOREBT2:
	RTS
DOS65LOAD_STOREBTE:
	JSR	DOS65LOAD_4		; CLOSE FILE
	LDA	#<FILEERROR3 		; NO, ERROR OUT
	LDY	#>FILEERROR3
	LDX	#9			; Print error message
	JSR	PEM			;
	JMP	BOOT			; WARM BOOT DOS/65


;__DOS65SAVEAS_____________________________________________________________________________________________________________________
;
; 	SAVE A DOS/65 FILE FROM THE EDIT BUFFER TO A NEW FILE NAME
;
;
;
;________________________________________________________________________________________________________________________________
;
DOS65SAVEAS:
	JSR	CLEARSCREEN

	LDA	#<SAVESCREENFORMAT
	LDY	#>SAVESCREENFORMAT
	LDX	#9			;
	JSR	PEM			;
	LDA	#<SAVESCREENFORMAT1
	LDY	#>SAVESCREENFORMAT1
	LDX	#9			;
	JSR	PEM			;
DOS65SAVEAS1:
	LDA	#<SAVESCREENFORMAT2
	LDY	#>SAVESCREENFORMAT2
	LDX	#9			;
	JSR	PEM			;

	LDX	#13
	LDA	#' '
DOS65SAVEAS2:
	STA	FNBUFFER
	DEX
	CPX	#$00
	BNE	DOS65SAVEAS2
	LDA	#<FNBUFFER
	LDY	#>FNBUFFER
	LDX	#10			;
	JSR	PEM			;

	JSR	DOS65FCBPREP
	CMP	#$FF
	BEQ	DOS65SAVEAS1

	JSR	DOS65SAVE
	JMP	PAINTSCREEN

SAVESCREENFORMAT:
	.byte	$1B,'[','0','0',';','0','0','H'
	.byte	$1B,'[','7','m'
	.byte	"DOS/65 SCREEN EDITOR"
	.byte	"                    "
	.byte	"                    ",'$'

SAVESCREENFORMAT1:
	.byte	"                    "
	.byte	"____________________"
	.byte	"____________________"
	.byte	"____________________"
	.byte	"____________________"
	.byte	$1B,'[','2','3',';','0','0','H'
	.byte	"                            "
	.byte	"                            "
	.byte	"     OM                "
	.byte	$1B,'[','0','m','$'
SAVESCREENFORMAT2:
	.byte	$1B,'[','1','1',';','1','0','H'
	.byte	"                                   "
	.byte	$1B,'[','1','0',';','0','0','H'
	.byte	"  NEW FILE NAME: $"

FNBUFFER:
	.byte	15,"                  "


;__DOS65SAVE_____________________________________________________________________________________________________________________
;
; 	SAVE A DOS/65 FILE FROM THE EDIT BUFFER
;
;
;
;________________________________________________________________________________________________________________________________
;
DOS65SAVE:
	LDA	#0			; clear
	STA	DFLFCB+32		; record number
	LDA	#<DFLFCB		; Open File
	LDY	#>DFLFCB	;
	LDX	#19			;
	JSR	PEM			;

	LDA	#0			; clear
	STA	DFLFCB+32		; record number
	LDA	#<DFLFCB		; ATTEMPT TO CREATE File
	LDY	#>DFLFCB	;
	LDX	#22			;
	JSR	PEM			;
	CMP	#$FF			; error?, if NOT, continue
	BNE	DOS65SAVE_1		;

DOS65SAVE_ERR:
	LDA	#<FILEERROR2A		; NO, ERROR OUT
	LDY	#>FILEERROR2A
	LDX	#9			; Print error message
	JSR	PEM			;
	RTS				; RETURN
DOS65SAVE_1:
	LDA	#0			; clear
	STA	DFLFCB+32		; record number
	LDA	#<BUFFER		; SETUP BUFFER
	STA	FCBPTR			; STORE SRC BUFFER IN FCBPTR
	LDA	#>BUFFER	;
	STA	FCBPTR+1		; STORE SRC BUFFER IN FCBPTR

	LDA	#<FCBBUFFER		; SETUP BUFFER
	STA	TMPPOS			;
	LDY	#>FCBBUFFER
	STY	TMPPOS+1		;
	LDX	#26			; Setup Buffer
	JSR	PEM

	LDX	#$00			;
	STX	TEMP1			;
DOS65SAVE_2:
	LDA	CURRENTLEN+1		; AT END PAGE?
	CMP	FCBPTR+1		;
	BNE	DOS65SAVE_2B		;
	LDA	FCBPTR			;
	CMP	CURRENTLEN		;
	BCC	DOS65SAVE_2B		; IF WE ARE NOT PAST THE END, PROCEED AS USUAL
	BEQ	DOS65SAVE_2B		;
	LDA	#$1A			; WE ARE AT END SO PAD WITH EOF
	JMP	DOS65SAVE_2C		;

DOS65SAVE_2B:
	LDY	#$00
	LDA 	(FCBPTR),Y		; GET NEXT BUFFER BYTE
	INC	FCBPTR			; INC 16 BIT BUFFER POINTER
	BNE	*+4			;
	INC 	FCBPTR+1		;
	CMP	#$00			; IS NULL?
	BEQ	DOS65SAVE_2		; YES SKIP
	CMP	#10			; IS LF?
	BEQ	DOS65SAVE_2		; YES SKIP

DOS65SAVE_2C:
	LDY	TEMP1			;
	STA	(TMPPOS),Y		; NO STORE IN BUFFER
	INC	TEMP1			; INC BUFFER POINTER
	CMP	#13			; IF NOT CR
	BNE	*+5			; CONTINUE
	JSR	DOS65SAVE_LF		; OTHERWISE INSERT LF

	LDX	TEMP1			;
	CPX	#$80			; PAST END?
	BNE	DOS65SAVE_2		; NO LOOP TILL BUFFER IS FULL

DOS65SAVE_2D:
	LDA	#<DFLFCB		; WRITE record buffer from disk file
	LDY	#>DFLFCB	;
	LDX	#21			;
	JSR	PEM			;
	CMP	#$00			; is SUCCESSFUL?
	BEQ	*+5			;
	JMP	DOS65SAVE_ERR		; ERROR, do error handling


	LDA	FCBPTR+1		;
	CMP	CURRENTLEN+1		; AT END?
	BCC	DOS65SAVE_3		;
	JMP	DOS65SAVE_4		; CLOSE FILE

DOS65SAVE_3:
	LDX	#$00			;
	STX	TEMP1			;
	JMP	DOS65SAVE_2		; SAVE NEXT SECTOR

DOS65SAVE_4:
	LDA	#<DFLFCB		; CLOSE FILE
	LDY	#>DFLFCB	;
	LDX	#16			;
	JSR	PEM			;
	RTS


DOS65SAVE_LF:

	LDX	TEMP1			;
	CPX	#$80			; PAST END?
	BNE	*+5			; NO
	JSR	DOS65SAVE_LF1		;

	LDY	TEMP1			; WRITE LF
	LDA	#10			;
	STA	(TMPPOS),Y		; NO STORE IN BUFFER
	INC	TEMP1			; INC BUFFER POINTER
	RTS

DOS65SAVE_LF1:
	LDA	#<DFLFCB		; WRITE record buffer from disk file
	LDY	#>DFLFCB	;
	LDX	#21			;
	JSR	PEM			;
	CMP	#$00			; is SUCCESSFUL?
	BEQ	*+5			;
	JMP	DOS65SAVE_ERR		; ERROR, do error handling
	LDX	#$00			;
	STX	TEMP1			;
	RTS

DOS65FCBPREP:
	LDA	FNBUFFER+3		; GET ":"
	CMP	#':'			;
	BEQ	DOS65FCBPREP_1		; YES, IT WAS A DRIVE, CONTINUE
	LDA	#<FILEERROR1		; NO, ERROR OUT
	LDY	#>FILEERROR1
	LDX	#9
	JSR	PEM
	LDA	#$FF
	RTS
DOS65FCBPREP_1:
	LDA	FNBUFFER+2		; GET DRIVE LETTER
	SEC				;
	SBC	#64			; PARSE DRIVE NUMBER
	STA	DFLFCB+0		; STORE IT IN FCB

	LDY	#$01			; POINT Y TO FCB FILE NAME
	LDA	#$20			; LOAD SPACE CHAR INTO A
DOS65FCBPREP_1A:			; BLANK OUT FCB
	STA	DFLFCB,Y		;
	INY				;
	CPY	#$09			; IS DONE
	BNE	DOS65FCBPREP_1A		; NO, LOOP
	LDY	#$01			; POINT Y TO FCB FILE NAME
	LDX	#$00			;
DOS65FCBPREP_2:				; COPY FILE NAME PARAMETER INTO FCB
 	LDA	FNBUFFER+4,X		;
 	INX				;
	CMP	#'.'			;
	BEQ	DOS65FCBPREP_3		;
	STA	DFLFCB,Y		;
	INY				;
	CPY	#$09			;
	BEQ	DOS65FCBPREP_3		;
	JMP	DOS65FCBPREP_2		;
DOS65FCBPREP_3:				;
 	LDA	FNBUFFER+4,X		;
	STA	DFLFCB+9		;
 	LDA	FNBUFFER+5,X		;
	STA	DFLFCB+10		;
 	LDA	FNBUFFER+6,X		;
	STA	DFLFCB+11		;
	LDA	#$00			;
	RTS				;


FILEERROR1:
		.byte	$1B,'[','1','1',';','1','0','H'
		.byte	"** NO DRIVE SPECIFIED, TRY AGAIN"
		.byte	$0D,$0A,'$'
FILEERROR2A:
		.byte	$1B,'[','0','1',';','1','0','H'
		.byte	$1B,'[','7','m'
FILEERROR2:	.byte	"** DOS/65 ERROR, OPERATION ABORTED"
		.byte	$1B,'[','0','m'
		.byte	$0D,$0A,'$'
FILEERROR3:	.byte	"** FILE TOO LARGE, OPERATION ABORTED"
		.byte	$0D,$0A,'$'
DECIMAL1:	.byte     $00,$01,$02,$03,$04,$05,$06,$07,$08,$09
		.byte     $10,$11,$12,$13,$14,$15,$16,$17,$18,$19
		.byte     $20,$21,$22,$23,$24,$25,$26,$27,$28,$29
		.byte     $30,$31,$32,$33,$34,$35,$36,$37,$38,$39
		.byte     $40,$41,$42,$43,$44,$45,$46,$47,$48,$49
		.byte     $50,$51,$52,$53,$54,$55,$56,$57,$58,$59
		.byte     $60,$61,$62,$63,$64,$65,$66,$67,$68,$69
		.byte     $70,$71,$72,$73,$74,$75,$76,$77,$78,$79
		.byte     $80,$81,$82,$83,$84,$85,$86,$87,$88,$89
		.byte     $90,$91,$92,$93,$94,$95,$96,$97,$98,$99
FCBBUFFER:
		.res 	$80
		.align 256
BUFFER:		.byte 00			; start of user RAM (set as needed, should be page aligned)
Ram_top		= $D000				; end of user RAM+1 (set as needed, should be page aligned)

	.END
