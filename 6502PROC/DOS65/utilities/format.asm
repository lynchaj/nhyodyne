;__FLOPPY FORMAT_________________________________________________________________________________________________________________
;
; 	DOS/65 floppy FORMATTER for Nhyodyne FDC card
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

USEDSKYNG=	0
USEDSKY	=	0

OUTMSG_W=	$F0

DENS	= 	2	; DENSITY
EOTSEC	=	09	; LAST SECTOR OF TRACK


;MAIN PROGRAM
 	.segment "TEA"
	.ORG $0800



	LDA	#STR_BANNER &$FF
	LDY	#STR_BANNER>>8 & $FF
	JSR	WRITESTR

INLOOP:
	JSR	CIN
	CMP	#'1'
	BEQ	TRACK40
	CMP	#'2'
	BEQ	TRACK80
	JMP	INLOOP

TRACK40:
	LDA	#40
	STA	MAXTRACK
	LDA #$50
	STA FMTGAP		; GAP FOR FORMAT 5.25=$50, 3.5=$54
	JMP	FMTCONT

TRACK80:
	LDA	#80
	STA	MAXTRACK
	LDA #$54
	STA FMTGAP		; GAP FOR FORMAT 5.25=$50, 3.5=$54
	JMP	FMTCONT


FMTCONT:
	LDA	#STR_DRIVE &$FF
	LDY	#STR_DRIVE>>8 & $FF
	JSR	WRITESTR

INLOOP1:
	JSR	CIN
	CMP	#'1'
	BEQ	FMTCONT1
	CMP	#'2'
	BEQ	FMTCONT2
	JMP	INLOOP1

FMTCONT1:
	LDA #$00
	STA sekdsk
	LDA #%00010001
	STA	DSKUNIT
	JMP FMTCONT3

FMTCONT2:
	LDA #$01
	STA sekdsk
	LDA #%00100001
	STA	DSKUNIT
	JMP FMTCONT3


FMTCONT3:
	LDA	#STR_INTRO &$FF
	LDY	#STR_INTRO>>8 & $FF
	JSR	WRITESTR

	LDA	#STR_CONFIRM &$FF
	LDY	#STR_CONFIRM>>8 & $FF
	JSR	WRITESTR

	JSR	CONF

	jsr	PC_CR
	JSR	PC_LF
	LDA	#$00
	sta	debcyl

FMTLOOP:
	lda	#$00
	STA	debhead
	jsr	FMTCYL

	lda	#$01
	STA	debhead
	jsr	FMTCYL

	INC	debcyl
	LDA	debcyl
	CMP	MAXTRACK
	BNE	FMTLOOP

DONE:
	JSR	PC_CR
	JSR	PC_LF
	LDX	#$00
	JMP	PEM


;__FMTCYL________________________________________________________________________________________________________________________
;
; 	FORMAT A FLOPPY TRACK
;________________________________________________________________________________________________________________________________
;
FMTCYL:
	JSR	SETTRACK		; PERFORM SEEK TO TRACK
	SEI
	JSR	CHECKINT		; CHECK INTERRUPT STATUS, MAKE SURE IT IS CLEAR
	CMP	#$FF			; DID IT RETURN WITH ERROR CODE?
	BNE	FMTGO			; IF YES, EXIT WITH ERROR CODE
	LDA	#STR_ERR1 &$FF
	LDY #STR_ERR1>>8 & $FF
	JSR	WRITESTR
	JMP	DSKEXIT
FMTGO:					; 					;
FMT:					; FORMAT TRACK COMMAND
						;
	CLC
	LDA	sekdsk			; GET DISK UNIT NUMBER
	AND	#$01			; MASK FOR TWO DRIVES.
	STA	UNIT			; PARK IT IN TEMP
	LDA	debhead			; GET HEAD SELECTION
	AND	#$01			; INSURE SINGLE BIT
	ASL	A				;
	ASL	A				; MOVE HEAD TO BIT 2 POSITION
	ORA	UNIT			; OR HEAD TO UNIT BYTE IN COMMAND BLOCK
	STA	UNIT			; STORE IN UNIT
						;
	LDA	#$4D			; BIT 6 SETS MFM, 0DH IS FORMAT COMMAND
	JSR	PFDATA			; PUSH FORMAT COMMAND TO I8272
	LDA UNIT			;
	JSR	PFDATA			; WHICH DRIVE UNIT TO FORMAT
	LDA	#DENS			;
	JSR	PFDATA			; WHAT DENSITY
	LDA	#EOTSEC			;
	JSR	PFDATA			; SECTOR COUNT
	LDA	FMTGAP			;
	JSR	PFDATA			; WHAT GAP IS NEEDED
	LDA #$E5			;
	JSR	PFDATAS			; FILLER BYTE FOR SECTORS
	LDY	#$01			; SET SECTOR#

FMT1:
	LDA	FDC_MSR			; GET STATUS
	BPL	FMT1
	sta	temp			;
	AND	#%00100000		; EXECUTION MODE?
	BEQ	DSKFMEND1		; NO, ERROR

	LDA	debcyl			; UPDATE I8272 DURING FORMAT
	STA	FDC_DATA		; SEND CYLINDER NUMBER
  						;
						;
FMT1A:
	LDA	FDC_MSR			; GET STATUS
	BPL	FMT1A
	sta	temp			;
	AND	#%00100000		; EXECUTION MODE?
	BEQ	DSKFMEND1A		; NO, ERROR
	LDA	debhead			; UPDATE I8272 DURING FORMAT
	STA	FDC_DATA		; SEND HEAD NUMBER

FMT1B:
	LDA	FDC_MSR			; GET STATUS
	BPL	FMT1B
	sta	temp			;
	AND	#%00100000		; EXECUTION MODE?
	BEQ	DSKFMEND1B		; NO, ERROR
						;
	TYA
	STA	FDC_DATA		; WHAT SECTOR NUMBER


FMT1C:
	LDA	FDC_MSR			; GET STATUS
	BPL	FMT1C
	sta	temp			;
	AND	#%00100000		; EXECUTION MODE?
	BEQ	DSKFMEND1C		; NO, ERROR
						;
	LDA	#DENS			;
	STA	FDC_DATA		; NUMBER OF BYTES PER SECTOR (N2)

FMT1D:
	LDA	FDC_MSR			; GET STATUS
	BPL	FMT1D			;
						;
	INY 				; INCREASE SECTOR COUNT
						;
	CPY	#$0A			; IS THIS PAST THE LAST SECTOR OF TRACK?
	BNE	FMT1			; IF NO, SEND ANOTHER SECTOR
	JSR	PC_PERIOD
	JMP	FMTEND



DSKFMEND1:
	LDA	#STR_ERR2 &$FF
	LDY #STR_ERR2>>8 & $FF
	JSR	WRITESTR
	JSR	GETERR
	JMP DONE
DSKFMEND1A:
	LDA	#STR_ERR3 &$FF
	LDY	#STR_ERR3>>8 & $FF
	JSR	WRITESTR
	JSR	GETERR
	JMP DONE
DSKFMEND1B:
	LDA	#STR_ERR4 &$FF
	LDY	#STR_ERR4>>8 & $FF
	JSR	WRITESTR
	JSR	GETERR
	JMP DONE
DSKFMEND1C:
	LDA	#STR_ERR5 &$FF
	LDY	#STR_ERR5>>8 & $FF
	JSR	WRITESTR
	JSR	GETERR
	JMP DONE

FMTEND:
;* CLEAR OUT ANY REMAINING DATA
	LDY #$10
FMTEND_1:
	JSR	GFDATA			;GET ERROR TYPE
	DEY
	BNE FMTEND_1
	RTS

GETERR:
	LDA	temp			;GET ERROR TYPE
	JSR	PRINT_BYTE
	JSR	PC_SPACE
	JSR	GFDATA			;GET ERROR TYPE
	JSR	PRINT_BYTE
	JSR	PC_SPACE
	JSR	GFDATA			;GET ERROR TYPE
	JSR	PRINT_BYTE
	JSR	PC_SPACE
	JSR	GFDATA			;GET ERROR TYPE
	JSR	PRINT_BYTE
	JSR	PC_SPACE
	JSR	GFDATA			;GET ERROR TYPE
	JSR	PRINT_BYTE
	JSR	PC_SPACE
	JSR	GFDATA			;GET ERROR TYPE
	JSR	PRINT_BYTE
	JSR	PC_SPACE
	JSR	GFDATA			;GET ERROR TYPE
	JSR	PRINT_BYTE
	JSR	PC_SPACE
	JSR	GFDATA			;GET ERROR TYPE
	JSR	PRINT_BYTE
	RTS


	.INCLUDE "../os/macro.asm"
	.INCLUDE "../os/dosflp.asm"



;
;==================================================================================================
; UTILITY FUNCTIONS
;==================================================================================================
;
;
CHR_CR	=		$0D
CHR_LF	=		$0A
CHR_BS	=		$08
CHR_ESC	=		$1B
;
;__________________________________________________________________________________________________
;
; UTILITY PROCS TO PRINT SINGLE CHARACTERS WITHOUT TRASHING ANY REGISTERS
;

PC_SPACE:
		PHA
		LDA #' '
		JSR OUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

PC_PERIOD:
		PHA
		LDA #'.'
		JSR OUT	  		; PRINT CHAR IN ACC
		PLA
		RTS


PC_CR:
		PHA
		LDA #CHR_CR
		JSR OUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

PC_LF:
		PHA
		LDA	#CHR_LF
		JSR OUT	  		; PRINT CHAR IN ACC
		PLA
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

BLKSECR512:
DEBSECR512:
		rts

;__PRINT_BYTE__________________________________________________
;
; PRINT OUT ACCUMULATOR AS HEX NUMBER
;
;______________________________________________________________
PRINT_BYTE:
               TAX					; SAVE A REGISTER
               LSR A				; SHIFT HIGH NIBBLE TO LOW NIBBLE
               LSR A				;
               LSR A				;
               LSR A				;
               CLC               	; CLEAR CARRY
               JSR PRINT_DIGIT		; PRINT LOW NIBBLE
               TXA					; RESTORE ACCUMULATOR
               JMP PRINT_DIGIT		; PRINT LOW NIBBLE


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


FMTGAP:		.BYTE 0			; GAP FOR FORMAT 5.25=$50, 3.5=$54
CURSEC:		.BYTE 0

sektrk:		.byte 0,0		;seek track number
seksec:		.byte 0,0		;seek sector number
sekdsk:		.byte 0
DSKUNIT:	.byte 0
hstbuf:		.res 1024
temp:		.byte 0
MAXTRACK:	.byte 40

STR_BANNER:
		.byte	$0D,$0A,"Nhyodyne Floppy Disk Format v1.0"
		.byte	$0D,$0A,"Choose Floppy type:",$0D,$0A
		.byte	"1> 5.25 inch floppy  360K 40 tracks",$0D,$0A
		.byte	"2> 3.5 inch floppy   720K 80 tracks",$0D,$0A,"$"
STR_DRIVE:
		.byte	$0D,$0A,"Choose Floppy drive:",$0D,$0A
		.byte	"1> DRIVE 0",$0D,$0A
		.byte	"2> DRIVE 1",$0D,$0A,"$"
STR_INTRO:
		.byte	$0D,$0A,$0D,$0A,"Insert FLOPPY, NOTE EXISTING DATA WILL BE DESTROYED!!!",$0D,$0A,"$"
STR_CONFIRM:
		.byte	"Press <Enter> to continue, <Esc> to abort",$0D,$0A,"$"





STR_ERR1:	.byte	$0D,$0A,"DISK ERROR 1",$0D,$0A,"$"
STR_ERR2:	.byte	$0D,$0A,"DISK ERROR 2",$0D,$0A,"$"
STR_ERR3:	.byte	$0D,$0A,"DISK ERROR 3",$0D,$0A,"$"
STR_ERR4:	.byte	$0D,$0A,"DISK ERROR 4",$0D,$0A,"$"
STR_ERR5:	.byte	$0D,$0A,"DISK ERROR 5",$0D,$0A,"$"

 .END
