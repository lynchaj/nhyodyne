;__FLOPPY FORMAT_________________________________________________________________________________________________________________
;
; 	DOS/65 floppy FORMATTER for direct attached disk-io V3 card
;
;________________________________________________________________________________________________________________________________
;
	  



COLOSSUS6X0X		.EQU	1	; USE COLOSSUS 6X0X HARDWARE
ORIGINAL6X0X		.EQU	0	; USE ORIGINAL 6X0X HARDWARE

M6X0X_IOSPACE		.EQU	$E000
M6X0X_SHADOW_ROM 	.EQU	$F000

OUTMSG_W		.EQU	$30

INPVEC			.EQU	$FFF2
INPWVEC			.EQU	$FFF4

DSKYDEBUG		.EQU	1
 
DENS:			.EQU	2	; DENSITY
EOTSEC:			.EQU	09	; LAST SECTOR OF TRACK
FMTGAP:			.EQU	$50	; GAP FOR FORMAT 5.25=$50, 3.5=$54
 
 

	.org $800
	

	
	
	LDA	#STR_BANNER &$FF
	LDY 	#STR_BANNER>>8 & $FF
	JSR	WRITESTR

INLOOP:
	JSR	CIN
	CMP	#'1'
	BEQ 	TRACK40
	CMP	#'2'
	BEQ 	TRACK80
	JMP 	INLOOP

TRACK40:
	LDA	#40	
	JMP	FMTCONT

TRACK80:
	LDA	#80	
	JMP	FMTCONT


FMTCONT:
	STA	MAXTRACK
	
	LDA	#STR_DRIVE &$FF
	LDY 	#STR_DRIVE>>8 & $FF
	JSR	WRITESTR

INLOOP1:
	JSR	CIN
	CMP	#'1'
	BEQ 	FMTCONT1
	CMP	#'2'
	BEQ 	FMTCONT1
	CMP	#'3'
	BEQ 	FMTCONT1	
	CMP	#'4'
	BEQ 	FMTCONT1
	JMP 	INLOOP1

FMTCONT1:	
	SEC
	SBC	#'1'
	STA	sekdsk
	JSR	SETUPDRIVE
		
	LDA	#STR_INTRO &$FF
	LDY 	#STR_INTRO>>8 & $FF
	JSR	WRITESTR

	LDA	#STR_CONFIRM &$FF
	LDY 	#STR_CONFIRM>>8 & $FF
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
		
	JSR	PC_CR
	JSR	PC_LF
	JMP 	$0100
	

;__FMTCYL________________________________________________________________________________________________________________________ 
;
; 	FORMAT A FLOPPY TRACK 	
;________________________________________________________________________________________________________________________________
;	
FMTCYL:
	LDA	FLATCH_STORE		; POINT TO FLATCH
	ORA	#%00000010		; SET MOTOR ON
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER
					;	
	JSR	SETTRACK		; PERFORM SEEK TO TRACK
	SEI
	JSR	CHECKINT		; CHECK INTERRUPT STATUS, MAKE SURE IT IS CLEAR
	CMP	#$FF			; DID IT RETURN WITH ERROR CODE?
	BNE	FMTGO			; IF YES, EXIT WITH ERROR CODE
	LDA	#STR_ERR1 &$FF
	LDY 	#STR_ERR1>>8 & $FF
	JSR	WRITESTR
	JMP	DSKEXIT
FMTGO:					; 					;	
	LDY	#$01			; SET SECTOR#
FMT:					; FORMAT TRACK COMMAND
			
					;					;
	LDA	#$4D			; BIT 6 SETS MFM, 0DH IS FORMAT COMMAND
	JSR	PFDATA			; PUSH FORMAT COMMAND TO I8272
	LDA	sekdsk			; GET DISK UNIT NUMBER
	AND	#$03			; MASK FOR FOUR DRIVES.
	STA	UNIT			; PARK IT IN TEMP
	LDA	debhead			; GET HEAD SELECTION
	AND	#$01			; INSURE SINGLE BIT
	ASL	A			;
	ASL	A			; MOVE HEAD TO BIT 2 POSITION
	ORA	UNIT			; OR HEAD TO UNIT BYTE IN COMMAND BLOCK
	STA	UNIT			; STORE IN UNIT
	JSR	PFDATA			; WHICH DRIVE UNIT TO FORMAT
	LDA	#DENS			;
	JSR	PFDATA			; WHAT DENSITY
	LDA	#EOTSEC			;
	JSR	PFDATA			; ASSUME SC (SECTOR COUNT)  EOT
	LDA	#FMTGAP			;
	JSR	PFDATA			; WHAT GAP IS NEEDED
	LDA  	#$E5			;
	JSR	PFDATAS			; FILLER BYTE FOR SECTORS


FMT1:	LDA	FMSR			; GET STATUS  
	BPL	FMT1
	sta	temp			;
	AND	#%00100000		; EXECUTION MODE? 
	BEQ	DSKFMEND1		; NO, ERROR
	LDA	debcyl			; UPDATE I8272 DURING FORMAT				
	STA	FDATA			; SEND CYLINDER NUMBER
  					;
					;
FMT1A:	LDA	FMSR			; GET STATUS  
	BPL	FMT1A
	sta	temp			;
	AND	#%00100000		; EXECUTION MODE? 
	BEQ	DSKFMEND1A		; NO, ERROR
	LDA	debhead			; UPDATE I8272 DURING FORMAT				
	STA	FDATA			; SEND HEAD NUMBER

FMT1B:	LDA	FMSR			; GET STATUS  
	BPL	FMT1B
	sta	temp			;
	AND	#%00100000		; EXECUTION MODE? 
	BEQ	DSKFMEND1B		; NO, ERROR
					;
	TYA				; physical sector is 1-9	
	STA	FDATA			; WHAT SECTOR NUMBER


FMT1C:	LDA	FMSR			; GET STATUS  
	BPL	FMT1C
	sta	temp			;
	AND	#%00100000		; EXECUTION MODE? 
	BEQ	DSKFMEND1C		; NO, ERROR
					;
	LDA	#DENS			;
	STA	FDATA			; NUMBER OF BYTES PER SECTOR (N2)
					;
	INY				; INCREASE SECTOR COUNT
					;
	CPY	#$0A			; IS THIS PAST THE LAST SECTOR OF TRACK?
	BNE	FMT1			; IF NO, SEND ANOTHER SECTOR
	JSR	PC_PERIOD
	JMP	FMTEND


	
DSKFMEND1:
	LDA	#STR_ERR2 &$FF
	LDY 	#STR_ERR2>>8 & $FF
	JSR	WRITESTR
	JSR	GETERR
	JMP	FMTEND		;
DSKFMEND1A:
	LDA	#STR_ERR3 &$FF
	LDY 	#STR_ERR3>>8 & $FF
	JSR	WRITESTR
	JSR	GETERR
	JMP	FMTEND		;
DSKFMEND1B:
	LDA	#STR_ERR4 &$FF
	LDY 	#STR_ERR4>>8 & $FF
	JSR	WRITESTR
	JSR	GETERR
	JMP	FMTEND		;
DSKFMEND1C:
	LDA	#STR_ERR5 &$FF
	LDY 	#STR_ERR5>>8 & $FF
	JSR	WRITESTR
	JSR	GETERR	
	JMP	FMTEND		;

FMTEND:
	LDA	FLATCH_STORE		; POINT TO FLATCH
	ORA	#%00000001		;
	STA	FLATCH_STORE		; SET TC
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER
	NOP				;
	NOP				; 2 MICROSECOND DELAY
	NOP				;
	NOP				; 
	LDA	FLATCH_STORE		; POINT TO FLATCH
	AND	#%11111110		;
	STA	FLATCH_STORE		; CLEAR TC
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER
	PHA				;
	PLA				;
	PHA				;
	PLA				; 2 MICROSECOND DELAY
	LDA	FLATCH_STORE		; POINT TO FLATCH
	AND	#%11111101		; SET MOTOR OFF
	STA	FLATCH_STORE		; POINT TO FLATCH
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER					;
					;
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


	.INCLUDE "DOS65\\DOSFLPV3.ASM"	
	
	
	
;
;==================================================================================================
; UTILITY FUNCTIONS
;==================================================================================================
;
;
CHR_CR		.EQU	0DH
CHR_LF		.EQU	0AH
CHR_BS		.EQU	08H
CHR_ESC		.EQU	1BH
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

PC_COLON:
		PHA
		LDA #':'
		JSR OUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

PC_LBKT:
		PHA
		LDA #'['
		JSR OUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

PC_RBKT:
		PHA
		LDA #']'
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

PC_STROBELOW:
		PHA
		LDA	#'S'
		JSR OUT	  		; PRINT CHAR IN ACC
		LDA	#'v'
		JSR OUT	  		; PRINT CHAR IN ACC
		PLA
		RTS


PC_STROBEHIGH:
		PHA
		LDA	#'S'
		JSR OUT	  		; PRINT CHAR IN ACC
		LDA	#'^'
		JSR OUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

NEWLINE:
	JSR	PC_CR
	JSR	PC_LF
	RTS

OUT:
	JMP (PRINTVEC)
	

	
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

;__PRINT_DIGIT_________________________________________________
;
; PRINT OUT LOW NIBBLE OF ACCUMULATOR IN HEX  
;
;______________________________________________________________
PRINT_DIGIT:
               AND #$0F				; STRIP OFF HIGH NIBBLE				
               ORA #$30				; ADD $30 TO PRODUCE ASCII
               CMP #$3A             ; IS GREATER THAN 9
               BMI PRINT_DIGIT_OUT	; NO, SKIP ADD
               CLC					; CLEAR CARRY
               ADC #$07				; ADD ON FOR LETTER VALUES
PRINT_DIGIT_OUT:					;	
               JMP OUT	            ; PRINT OUT CHAR

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
		JMP (INPVEC)

		
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
				
	
sektrk		.DW 0		;seek track number
seksec		.DW 0		;seek sector number
debhead		.DB 0		; DEBLOCKED HEAD
debcyl		.DB 0		; DEBLOCKED CYLINDER ID
debsec		.DB 0		; DEBLOCKED SECTOR
Cdebhead 	.DB $FF		; DEBLOCKED HEAD
Cdebcyl		.DB $FF		; DEBLOCKED CYLINDER ID
Cdebsec		.DB $FF		; DEB4LOCKED SECTOR
sekdsk		.DB 0
hstbuf		.DS 1024	
temp		.db 0		
MAXTRACK	.DB 40
		
STR_BANNER	.TEXT	"\r\nDISK IO V3 Floppy Disk Format v0.1\r\n"
		.TEXT	"\r\nChoose Floppy type:\r\n"	
		.TEXT	"1> 5.25 inch floppy  360K 40 tracks\r\n"
		.TEXT	"2> 3.5 inch floppy   720K 80 tracks\r\n\r\n$"
STR_DRIVE	.TEXT	"\r\nChoose Floppy drive:\r\n"	
		.TEXT	"1> DRIVE A\r\n"
		.TEXT	"2> DRIVE B\r\n"
		.TEXT	"3> DRIVE C\r\n"
		.TEXT	"4> DRIVE D\r\n\r\n$"		
STR_INTRO	.TEXT	"Insert FLOPPY, NOTE EXISTING DATA WILL BE DESTROYED!!!\r\n$"
STR_CONFIRM	.TEXT	"Press <Enter> to continue, <Esc> to abort\r\n$"





STR_ERR1	.TEXT	"\r\nDISK ERROR 1\r\n\r\n$"
STR_ERR2	.TEXT	"\r\nDISK ERROR 2\r\n\r\n$"
STR_ERR3	.TEXT	"\r\nDISK ERROR 3\r\n\r\n$"
STR_ERR4	.TEXT	"\r\nDISK ERROR 4\r\n\r\n$"
STR_ERR5	.TEXT	"\r\nDISK ERROR 5\r\n\r\n$"
		
 .END

