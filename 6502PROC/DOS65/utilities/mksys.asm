;__Make System___________________________________________________________________________________________________________________
;
; 	DOS/65 System generator for Nhyodyne
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
MPCL_RAM	    =	$0378		; RAM MAPPER
OUTMSG_W=	$F0
BANKED_DRIVER_DISPATCHER=$8800  ; LOCATION OF DRIVER DISPATCHER
farfunct=   $32         ;function to call in driver area


;MAIN PROGRAM
 	.segment "TEA"
	.ORG $0800



	LDA	#STR_BANNER &$FF
	LDY	#STR_BANNER>>8 & $FF
	JSR	WRITESTR

INLOOP:
	JSR	CIN
	CMP	#'1'
	BEQ	PPIDE
	CMP	#'2'
	BEQ	FLOPPY
	JMP	INLOOP

PPIDE:
	LDA	#28
	STA	FUNCTION
	JMP	CONT

FLOPPY:
	LDA	#26
	STA	FUNCTION


CONT:
	LDA	#STR_DRIVE &$FF
	LDY	#STR_DRIVE>>8 & $FF
	JSR	WRITESTR

INLOOP1:
	JSR	CIN
	CMP	#'1'
	BEQ	CONT1
	CMP	#'2'
	BEQ	CONT2
	JMP	INLOOP1

CONT1:
	LDA #$00
    BRA :+
CONT2:
	LDA #$01

:
    STA UNIT

	LDA	#STR_INTRO &$FF
	LDY	#STR_INTRO>>8 & $FF
	JSR	WRITESTR

	LDA	#STR_CONFIRM &$FF
	LDY	#STR_CONFIRM>>8 & $FF
	JSR	WRITESTR

	JSR	CONF

    LDA FUNCTION
	STA farfunct
    LDA #<PARAMETERS
    LDY #>PARAMETERS

    PHA
    LDA     #$8C
    STA     MPCL_RAM
    nop
    nop
    PLA
    JSR     BANKED_DRIVER_DISPATCHER
    LDA     #$8E
    STA     MPCL_RAM

    JMP EXIT



;
; OUTPUT A '$' TERMINATED STRING
;
WRITESTR:
		STA OUTMSG_W
		STY OUTMSG_W+1
		LDY #$00
WRITESTR1:
       	LDA (OUTMSG_W),Y 	; LOAD NEXT CHAR FROM STRING INTO ACC
       	CMP #'$'			; IS END?
       	BEQ ENDOUTSTR		; YES, END PRINT OUT
       	JSR OUT	  		; PRINT CHAR IN ACC
       	INY 	     		; Y=Y+1 (BUMP INDEX)
       	JMP WRITESTR1		; DO NEXT CHAR
ENDOUTSTR:
       	RTS					; RETURN





CIN:
	PHX
	PHY
	LDX	#1			;
	JSR	PEM			;
	PLY
	PLX
	rts

NEWLINE:
		LDA #$0D
		JSR OUT	  		; PRINT CHAR IN ACC
		LDA	#$0A
		JSR OUT	  		; PRINT CHAR IN ACC
		RTS

OUT:
conwrt:
	PHX
	PHY
	LDX	#2			;
	JSR	PEM			;
	PLY
	PLX
	rts

CONF:
	JSR	CIN
	CMP	#$1B
	BEQ 	EXIT
	CMP	#$0D
	BNE 	CONF

	RTS

EXIT:
; CLEAN UP AND RETURN TO OS
	JSR	NEWLINE
	JSR	NEWLINE
	JMP $0100


PARAMETERS:
UNIT:       .BYTE 00
            .BYTE $8E
            .BYTE $00,$D0
            .BYTE $2F

FUNCTION:	.BYTE 0

STR_BANNER:
		.byte	$0D,$0A,"Nhyodyne Boot System Generator v1.0"
		.byte	$0D,$0A,"Choose Drive type:",$0D,$0A
		.byte	"1> PPIDE",$0D,$0A
		.byte	"2> floppy",$0D,$0A,"$"
STR_DRIVE:
		.byte	$0D,$0A,"Choose Unit Id:",$0D,$0A
		.byte	"1> DRIVE 0",$0D,$0A
		.byte	"2> DRIVE 1",$0D,$0A,"$"
STR_INTRO:
		.byte	$0D,$0A,$0D,$0A,"System track will be overwritten with DOS/65 in RAM!!!",$0D,$0A,"$"
STR_CONFIRM:
		.byte	"Press <Enter> to continue, <Esc> to abort",$0D,$0A,"$"

STR_ERR1:	.byte	$0D,$0A,"DISK ERROR.",$0D,$0A,"$"

 .END
