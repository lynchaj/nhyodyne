;__FLOPPY TEST________________________________________________________________________________________________________________
;
; 	DOS/65 floppy HARDWARE TEST for direct attached disk-io V3 card
;
;________________________________________________________________________________________________________________________________
;
	  



COLOSSUS6X0X		.EQU	1	; USE COLOSSUS 6X0X HARDWARE
ORIGINAL6X0X		.EQU	0	; USE ORIGINAL 6X0X HARDWARE

M6X0X_IOSPACE		.EQU	$E000
M6X0X_SHADOW_ROM 	.EQU	$F000

OUTMSG_W		.EQU	$30

PRINTVEC		.EQU	$FFF0
INPVEC			.EQU	$FFF2
INPWVEC			.EQU	$FFF4

DSKYDEBUG		.EQU	1
 

	.org $1000
	
  	JSR	DSKYINIT
  	JSR	SEGDISPLAY

	LDA	#$01
	STA	sekdsk	
	JSR	SETUPDRIVE
	
	;LDA	#$00
	;STA	FLATCH
	;LDA	#RESETL			; RESET SETTINGS
	;ORA	#MINI			; SELECT MINI FLOPPY (low dens=1, high dens=0)
	;ORA	#PRECOMP		; SELECT PRECOMP 
	;ORA	#FDDENSITY		; SELECT DENSITY
	;ORA	#FDREADY		;
	;STA	FLATCH_STORE		; SAVE SETTINGS
	;STA	FLATCH
	;JSR	CHECKINT		;
	;LDA	#$03			; SPECIFY COMMAND
	;JSR	PFDATA			; OUTPUT TO FDC
	;LDA	#$7F			; 6 MS STEP, 480 MS HEAD UNLOAD
	;JSR	PFDATA			; OUTPUT TO FDC
	;LDA	#$05			; 508 MS HEAD LOAD, NON-DMA MODE
	;JSR	PFDATA			; OUTPUT TO FDC
	;JSR	CHECKINT		;
	;JSR	CHECKINT		;
	;JSR	CHECKINT		;
	;JSR	CHECKINT		;
	;JSR	CHECKINT		;
	;JSR	CHECKINT		;

	
	LDA	#STR_BANNER &$FF
	LDY 	#STR_BANNER>>8 & $FF
	JSR	WRITESTR

	LDA	#STR_INTRO &$FF
	LDY 	#STR_INTRO>>8 & $FF
	JSR	WRITESTR

	LDA	#STR_CONFIRM &$FF
	LDY 	#STR_CONFIRM>>8 & $FF
	JSR	WRITESTR
	
	JSR	CONF


	LDA	#STR_MOTORON &$FF
	LDY 	#STR_MOTORON>>8 & $FF
	JSR	WRITESTR
	JSR	CONF
	
	
	LDA	FLATCH_STORE		; POINT TO FLATCH			
	ORA	#%00000010		; SET MOTOR ON
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER

	LDA	#STR_MOTOROFF &$FF
	LDY 	#STR_MOTOROFF>>8 & $FF
	JSR	WRITESTR
	JSR	CONF
	

	LDA	FLATCH_STORE		; POINT TO FLATCH
	AND	#%11111101		; SET MOTOR OFF
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER
	
	LDA	#STR_SEEKTEST & $FF
	LDY 	#STR_SEEKTEST>>8 & $FF
	JSR	WRITESTR
	JSR	CONF	

	
	LDA	FLATCH_STORE		; POINT TO FLATCH			
	ORA	#%00000010		; SET MOTOR ON
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER
	
	jsr	PC_PERIOD		
	LDA	#$00
	STA	$50
HEADSEEK:
	JSR	RECAL			;
	LDA	#39			;
	STA	debcyl			;
	JSR	SETTRACK
	INC	$50
	LDA	$50
	CMP	#$10
	BNE	HEADSEEK

	LDA	FLATCH_STORE		; POINT TO FLATCH
	AND	#%11111101		; SET MOTOR OFF
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER
	
	
	
	LDA	#STR_READTEST & $FF
	LDY 	#STR_READTEST>>8 & $FF
	JSR	WRITESTR
	JSR	CONF	
	
	lda 	#$01
	STA	debhead			; STORE CURRENT PARMS
	STA	Cdebhead		;
	STA	debcyl			;
	STA	Cdebcyl			;
	STA	debsec			;
	STA	Cdebsec			;			
	JSR	READFL_DIRTY
	
	LDA	#STR_WRITETEST & $FF
	LDY 	#STR_WRITETEST>>8 & $FF
	JSR	WRITESTR
	JSR	CONF	
	
	lda 	#$00
	STA	debhead			; STORE CURRENT PARMS
	STA	Cdebhead		;
	STA	debcyl			;
	STA	Cdebcyl			;
	STA	debsec			;
	STA	Cdebsec			;			
	JSR	WRITEFL
	
	
	LDA	#STR_READBTEST & $FF
	LDY 	#STR_READBTEST>>8 & $FF
	JSR	WRITESTR
	JSR	CONF	
	
	lda 	#$00
	STA	debhead			; STORE CURRENT PARMS
	STA	Cdebhead		;
	STA	debcyl			;
	STA	Cdebcyl			;
	STA	debsec			;
	STA	Cdebsec			;			
	JSR	READFL_DIRTY	
	BRK
	


	.INCLUDE "DOS65\\DOSFLPV3.ASM"	
	.INCLUDE "DOS65\\DOSDSKY.ASM"
	
	
	
	
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
		JSR COUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

PC_PERIOD:
		PHA
		LDA #'.'
		JSR COUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

PC_COLON:
		PHA
		LDA #':'
		JSR COUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

PC_LBKT:
		PHA
		LDA #'['
		JSR COUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

PC_RBKT:
		PHA
		LDA #']'
		JSR COUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

PC_CR:
		PHA
		LDA #CHR_CR
		JSR COUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

PC_LF:
		PHA
		LDA	#CHR_LF
		JSR COUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

PC_STROBELOW:
		PHA
		LDA	#'S'
		JSR COUT	  		; PRINT CHAR IN ACC
		LDA	#'v'
		JSR COUT	  		; PRINT CHAR IN ACC
		PLA
		RTS


PC_STROBEHIGH:
		PHA
		LDA	#'S'
		JSR COUT	  		; PRINT CHAR IN ACC
		LDA	#'^'
		JSR COUT	  		; PRINT CHAR IN ACC
		PLA
		RTS

NEWLINE:
	JSR	PC_CR
	JSR	PC_LF
	RTS

	
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
               JMP COUT	            ; PRINT OUT CHAR

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
       	JSR COUT	  		; PRINT CHAR IN ACC
       	INY 	     		; Y=Y+1 (BUMP INDEX)
       	JMP WRITESTR1		; DO NEXT CHAR
ENDOUTSTR:
       	RTS					; RETURN
       	

       	       	
COUT:
		JMP (PRINTVEC)
		
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
	
	BRK
				
	
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
		
		
STR_BANNER	.TEXT	"\r\nDISK IO V3 Hardware Validation v0.9\r\n\r\n$"
STR_INTRO	.TEXT	"  Insert FLOPPY, NOTE EXISTING DATA WILL BE DESTROYED!!!\r\n$"
STR_CONFIRM	.TEXT	"\r\nPress <Enter> to continue, <Esc> to abort$"
STR_MOTORON	.TEXT	"\r\nTest MOTOR ON signal\r\n\r\n"
		.TEXT	"\r\nPress <Enter> to continue, <Esc> to abort$"
STR_MOTOROFF	.TEXT	"\r\nTest MOTOR OFF signal\r\n\r\n"
		.TEXT	"\r\nPress <Enter> to continue, <Esc> to abort$"
STR_SEEKTEST	.TEXT	"\r\nTest HEAD SEEK COMMAND\r\n\r\n"
		.TEXT	"\r\nPress <Enter> to continue, <Esc> to abort$"
STR_READTEST	.TEXT	"\r\nTest READ SECTOR COMMAND\r\n\r\n"
		.TEXT	"\r\nPress <Enter> to continue, <Esc> to abort$"	
STR_WRITETEST	.TEXT	"\r\nTest WRITE SECTOR COMMAND\r\n\r\n"
		.TEXT	"\r\nPress <Enter> to continue, <Esc> to abort$"
STR_READBTEST	.TEXT	"\r\nTest READ BACK SECTOR COMMAND\r\n\r\n"
		.TEXT	"\r\nPress <Enter> to continue, <Esc> to abort$"					
		
 .END

