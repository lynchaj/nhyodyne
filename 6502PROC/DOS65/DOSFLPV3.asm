;__FLOPPY DRIVERS________________________________________________________________________________________________________________
;
; 	DOS/65 floppy drivers for direct attached disk-io V3 card
;
;	Entry points:
;		SETUPDRIVE  - called during OS init
;		FORMFL	    - format floppy disk ('U' POINTS TO DCB)
;		READFL	    - read a sector from drive ('U' POINTS TO DCB, X TO MEMORY)
;		WRITEFL	    - write a sector to drive   ('U' POINTS TO DCB, X TO MEMORY)
;
;________________________________________________________________________________________________________________________________
;
	  
	 
	
;*
;* HARDWARE I/O ADDRESSES
;*

	.IF ORIGINAL6X0X=1
FMSR		.EQU	$F130		; ADDRESS OF MAIN STATUS REGISTER
FDATA		.EQU	$F131		; FLOPPY DATA REGISTER
FLATCH		.EQU	$F138		; FLOPPY CONFIGURATION LATCH
	.ENDIF
	
	.IF COLOSSUS6X0X=1
FMSR		.EQU	M6X0X_IOSPACE+$30		; ADDRESS OF MAIN STATUS REGISTER
FDATA		.EQU	M6X0X_IOSPACE+$31		; FLOPPY DATA REGISTER
FLATCH		.EQU	M6X0X_IOSPACE+$38		; FLOPPY CONFIGURATION LATCH
	.ENDIF

;
; FDC CONFIGURATION LATCH OUTPUT BIT PATTERNS
MOTOR		.EQU	%00000010	; BIT PATTERN IN LATCH FOR MOTOR CONTROL (ON)
TERMCN		.EQU	%00000001	; BIT PATTERN IN LATCH TO WRITE A TC STROBE
RESETL		.EQU	%00000000	; BIT PATTERN IN LATCH TO RESET ALL BITS
MINI		.EQU	%00000100	; BIT PATTERN IN LATCH TO SET MINI MODE FDC9229 LOW DENS=1, HIGH DENS=0
PRECOMP		.EQU	%00100000	; BIT PATTERN IN LATCH TO SET WRITE PRECOMP 125 NS:
FDDENSITY	.EQU	%01000000	; BIT PATTERN IN LATCH TO FLOPPY LOW DENSITY (HIGH IS 1)
FDREADY		.EQU	%10000000	; BIT PATTERN IN LATCH TO FLOPPY READY (P-34):




;__SETUPDRIVE__________________________________________________________________________________________________________________________ 
;
;	SETUP FLOPPY DRIVE SETTINGS 
;________________________________________________________________________________________________________________________________
;
;
;
SETUPDRIVE:
	LDA	#$00
	STA	debhead
	STA	debcyl
	STA	debsec
	LDA	#$FF			; 
	STA	Cdebhead		;
	STA	Cdebcyl			;
	STA	Cdebsec			;
	LDA	#$00
	STA	FLATCH
	LDA	#RESETL			; RESET SETTINGS
	ORA	#MINI			; SELECT MINI FLOPPY (low dens=1, high dens=0)
	ORA	#PRECOMP		; SELECT PRECOMP 
	ORA	#FDDENSITY		; SELECT HIGH DENSITY 
	ORA	#FDREADY		;
	STA	FLATCH_STORE		; SAVE SETTINGS
	STA	FLATCH
	JSR	CHECKINT		;
	LDA	#$03			; SPECIFY COMMAND
	JSR	PFDATA			; OUTPUT TO FDC
	LDA	#$7F			; 6 MS STEP, 480 MS HEAD UNLOAD
	JSR	PFDATA			; OUTPUT TO FDC
	LDA	#$05			; 508 MS HEAD LOAD, NON-DMA MODE
	JSR	PFDATA			; OUTPUT TO FDC
	JSR	CHECKINT		;
	JSR	CHECKINT		;
	JSR	CHECKINT		;
	JSR	CHECKINT		;
	JSR	CHECKINT		;
	JSR	CHECKINT		;
	JSR	RECAL			;
	LDA	#39			;
	STA	debcyl			;
	JSR	SETTRACK
	JMP	RECAL			;

;__MOTOROFF______________________________________________________________________________________________________________________ 
;
;	TURN OFF FLOPPY MOTORS
;________________________________________________________________________________________________________________________________
;
MOTOROFF:	
	PHA
	LDA	FLATCH_STORE		; POINT TO FLATCH
	AND	#%11111101		; SET MOTOR OFF
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER
	PLA
	RTS


;__OUTFLATCH__________________________________________________________________________________________________________________________ 
;
;	SEND SETTINGS TO FLOPPY CONTROLLER
;________________________________________________________________________________________________________________________________
;
OUTFLATCH:
	LDA	FLATCH_STORE		; SET A TO SETTINGS
	STA	FLATCH			; OUTPUT TO CONTROLLER
	RTS

	
;__READFL________________________________________________________________________________________________________________________ 
;
; 	READ A FLOPPY SECTOR 	
;________________________________________________________________________________________________________________________________
;	
READFL:
	LDA	FLATCH_STORE		; POINT TO FLATCH			
	ORA	#%00000010		; SET MOTOR ON
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER

	LDA	debhead			; 
	CMP	Cdebhead		;
	BNE	READFL_DIRTY
	LDA	debcyl			;
	CMP	Cdebcyl			;
	BNE	READFL_DIRTY
	LDA	debsec			;
	CMP	Cdebsec			;			
	BNE	READFL_DIRTY
	
	LDA	#$00
	RTS


READFL_DIRTY:

	LDA	debhead			; STORE CURRENT PARMS
	STA	Cdebhead		;
	LDA	debcyl			;
	STA	Cdebcyl			;
	LDA	debsec			;
	STA	Cdebsec			;			


	LDA	#$00
	STA	FLRETRY
	STA	FLRETRY1
READFL1:	
	LDA	#$46			; BIT 6 SETS MFM, 06H IS READ COMMAND
	STA	FCMD
	JSR	DSKOP
	CMP	#$00
	BEQ	READFLDONE
	INC	FLRETRY
	LDA	FLRETRY
	CMP	#$06
	BNE	READFL1
	JSR 	RECAL
	JSR	SETTRACK
	LDA	#$00
	STA	FLRETRY
	INC	FLRETRY1
	LDA	FLRETRY1
	CMP	#$02
	BNE	READFL1
	
	LDA	#$FF	
	STA	Cdebhead		;
	STA	Cdebcyl			;
	STA	Cdebsec			;	
	RTS				; A = $FF ON RETURN = OPERATION ERROR		
READFLDONE:
	LDA	#$00			; A = 0 ON RETURN = OPERATION OK
	RTS	

;__WRITEFL________________________________________________________________________________________________________________________ 
;
; 	WRITE A FLOPPY SECTOR 	
;________________________________________________________________________________________________________________________________
;	
WRITEFL:
	LDA	FLATCH_STORE		; POINT TO FLATCH			
	ORA	#%00000010		; SET MOTOR ON
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER

	LDA	#$FF	
	STA	Cdebhead		;
	STA	Cdebcyl			;
	STA	Cdebsec			;			
	LDA	#$00
	STA	FLRETRY
	STA	FLRETRY1
WRITEFL1:	
	LDA	#$45			; BIT 6 SETS MFM, 05H IS WRITE COMMAND
	STA	FCMD
	JSR	DSKOP
	CMP	#$00
	BEQ	READFLDONE
	INC	FLRETRY
	LDA	FLRETRY
	CMP	#$06
	BNE	WRITEFL1
	JSR 	RECAL
	JSR	SETTRACK
	LDA	#$00
	STA	FLRETRY
	INC	FLRETRY1
	LDA	FLRETRY1
	CMP	#$02
	BNE	WRITEFL1
	LDA	#$FF			;
	STA	Cdebhead		;
	STA	Cdebcyl			;
	STA	Cdebsec			;
	RTS				; A = $FF ON RETURN = OPERATION ERROR			
WRITEFLDONE:				
	LDA	#$00			; A = 0 ON RETURN = OPERATION OK
	RTS	
	

;__DSKOP__________________________________________________________________________________________________________________________ 
;
; 	PERFORM A DISK OPERATION 	
;________________________________________________________________________________________________________________________________
;		

DSKOP:
	SEI
	JSR	CHECKINT		; CHECK INTERRUPT STATUS, MAKE SURE IT IS CLEAR
	CMP	#$FF			; DID IT RETURN WITH ERROR CODE?
	BEQ	DSKEXIT			; IF YES, EXIT WITH ERROR CODE
					;
 					;
	LDA	FLATCH_STORE		; POINT TO FLATCH
	ORA	#%00000010		; SET MOTOR ON
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER
					;	
	JSR	SETTRACK		; PERFORM SEEK TO TRACK
					;
	LDA	FCMD			; WHAT COMMAND IS PENDING?
	CMP	#$46			; IS IT A READ COMMAND?
	BNE	GWRR_POLL		;
	JMP	RDD_POLL		;
GWRR_POLL:
	JMP	WRR_POLL		;	
DSKEXIT:	
	LDA	FLATCH_STORE		; POINT TO FLATCH
	AND	#%11111101		; SET MOTOR OFF
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER
	LDA	#$FF			; SET -1 IF ERROR
	CLI
	RTS

SNDFDWR:

	LDY	#$00			; BYTES/SECTOR COUNT
	CLC
	LDA	sekdsk			; GET DISK UNIT NUMBER
	AND	#$03			; MASK FOR FOUR DRIVES.
	STA	UNIT			; PARK IT IN TEMP
	LDA	debhead			; GET HEAD SELECTION
	AND	#$01			; INSURE SINGLE BIT
	ASL	A			;
	ASL	A			; MOVE HEAD TO BIT 2 POSITION
	ORA	UNIT			; OR HEAD TO UNIT BYTE IN COMMAND BLOCK
	STA	UNIT			; STORE IN UNIT
	LDA	FCMD			;
	JSR	PFDATA			; PUSH COMMAND TO I8272
	LDA	UNIT			;
	JSR	PFDATA			; 
	LDA	debcyl			;
	JSR	PFDATA			; 
	LDA	debhead			;
	JSR	PFDATA			; 
	CLC				;
	LDA	debsec			;
	ADC	#$01			;
	JSR	PFDATA			; 
	LDA	#$02			;
	JSR	PFDATA			; WHAT DENSITY
	LDA	#$09			;
	JSR	PFDATA			; ASSUME SC (SECTOR COUNT)  EOT
	LDA	#$1B			;
	JSR	PFDATA			; WHAT GAP IS NEEDED
	LDA	#$FF			; DTL, IS THE LAST COMMAND BYTE TO I8272
	JSR	PFDATAS
	RTS
; PERFORM READ
; FROM READ TO READ MUST NOT EXCEED 25US WORST CASE MIN.
;	
RDD_POLL:
	JSR	SNDFDWR			; 
RDS1:	LDA	FMSR			; GET STATUS  
	BPL	RDS1
	AND	#%00100000		; EXECUTION MODE? 
	BEQ	DSKOPEND		; NO, ERROR 
	LDA	FDATA			; GET DATA 
	STA	hstbuf,Y		; WRITE IT 
	INY                                        
	BNE	RDS1			; KEEP GOING 
RDS2	LDA	FMSR			; GET STATUS
	BPL	RDS2
	AND	#%00100000		; EXECUTION MODE?
	BEQ	DSKOPEND		; NO, ERROR
	LDA	FDATA			; GET DATA
	STA	hstbuf+256,Y		; WRITE IT
	INY
	BNE	RDS2			; KEEP GOING	

DSKOPEND:
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
	JSR	GFDATA			;GET ERROR TYPE
	STA	FLERR

;* CLEAR OUT ANY REMAINING DATA
RESUL3:	
	JSR	GFDATA			;READ BYTE FROM FDC
	CMP	#$00
	BNE	RESUL3			;CLEAR THEM ALL
	LDA	FLERR			;
	AND	#%11000000		;
	RTS
	
;;; This code is to assist with debugging.
#IFNDEF ROM
PRINTVEC		.EQU	$FFF0

CRLF:
;		PHA
;		LDA #13
;		JSR COUT	  		; PRINT CHAR IN ACC
;		LDA #10
;		JSR COUT	  		; PRINT CHAR IN ACC
;		PLA
;		RTS
COUT:
	;	JMP (PRINTVEC)
HEXOUT:;		PHA
;		JSR	$F51E		
;		PLA
;		RTS	
#ENDIF	
WRR_POLL:
	JSR	SNDFDWR			;
WRS1:					;
	LDA	FMSR			; GET STATUS
	BPL	WRS1			; NOT READY
	AND	#%00100000		; EXECUTION MODE?
	BEQ	WRS3			; NO, ERROR
	LDA	hstbuf,Y		; WRITE IT
	STA	FDATA			; WRITE TO FDC
	INY
	BNE	WRS1			; DO NEXT
WRS2:					;
	LDA	FMSR			; GET STATUS
	BPL	WRS2			; NOT READY
	AND	#%00100000		; EXECUTION MODE?
	BEQ	WRS3			; NO, ERROR
	LDA	hstbuf+256,Y		; WRITE IT
	STA	FDATA			; WRITE TO FDC
	INY
	BNE	WRS2			; DO NEXT	
WRS3:	
	JMP	DSKOPEND		; 

			
;__SETTRACK__________________________________________________________________________________________________________________________ 
;
; 	SEEK TO A TRACK ON GIVEN UNIT
; 	A: TRACK #
;________________________________________________________________________________________________________________________________
;
SETTRACK:
	LDA	FLATCH_STORE		; POINT TO FLATCH			
	ORA	#%00000010		; SET MOTOR ON
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER

					; ANY INTERUPT PENDING
					; IF YES FIND OUT WHY/CLEAR
	JSR	CHECKINT		; CHECK INTERRUPT STATUS, MAKE SURE IT IS CLEAR
	CMP	#$FF			; DID IT RTSURN WITH ERROR CODE?
	BNE	SETTRK1
	JMP	SETTRKEXIT		;

					;
SETTRK1:		
	LDA	debcyl			; GET TRACK
	CMP	#$00			;
	BEQ	RECAL			; IF 0 PERFORM RECAL INSTEAD OF SEEK
	LDA	#$0F			; SEEK COMMAND
	JSR	PFDATA			; PUSH COMMAND
	LDA	sekdsk			; SAY WHICH UNIT
	JSR	PFDATA			; SEND THAT
	LDA	debcyl			; TO WHAT TRACK
	JSR	PFDATA			; SEND THAT TOO
	JMP	WAINT			; WAIT FOR INTERRUPT SAYING DONE
RECAL:
	LDA	FLATCH_STORE		; POINT TO FLATCH			
	ORA	#%00000010		; SET MOTOR ON
	STA	FLATCH_STORE		; POINT TO FLATCH	
	JSR	OUTFLATCH		; OUTPUT TO CONTROLLER

	LDA	#$07			; RECAL TO TRACK 0
	JSR	PFDATA			; SEND IT
	LDA	sekdsk			; WHICH UNIT
	JSR	PFDATA			; SEND THAT TOO
;
WAINT:
	PHA
	TXA
	PHA
	LDX	#$00
WAINT1:
	INX
	CPX	#$FF
	BNE	WAINT1
	PLA
	TAX
	PLA	
;
SETTRK2:	
	JSR	CHECKINT			
	LDA	FMSR			; READ SEEK STATUS
	AND	#%00001111		; ANY DRIVES SEEKING?
	BNE	SETTRK2			; YES, WAIT FOR THEM
;
SETTRKEXIT:
	RTS

;__PFDATA__________________________________________________________________________________________________________________________ 
;
; WRITE A COMMAND OR PARAMETER SEQUENCE
;
; TRANSFERS ARE SYNCHONIZED BY MSR D7 <RQM> AND D6 <DIO>
;	RQM  DIO
;	0	0	BUSY
;	1	0	WRITE TO DATA REGISTER PERMITTED
;	1	1	BYTE FOR READ BY HOST PENDING
;	0	1	BUSY
;
;________________________________________________________________________________________________________________________________
;
PFDATA:
	PHA				; SAVE DATA BYTE
WRF1:
	LDA	FMSR			; READ FDC STATUS	
	TAX
	AND	#$80			;	
	BEQ	WRF1			; FDC IS NOT READY, WAIT FOR IT
	TXA
	AND	#$40			; TEST DIO BIT
	BNE	WRF2			; FDC IS OUT OF SYNC
	PLA				; RESTORE DATA
	STA	FDATA			; WRITE TO FDC	

	PHA
	PLA
	PHA
	PLA
	PHA
	PLA
	PHA
	PLA
	PHA
	PLA
	PHA
	PLA
	PHA
	PLA
	PHA
	PLA
	
	RTS
; FDC IS OUT OF SYNC CLEAR IT OUT AND RE-TRY
WRF2:
	LDA	FDATA			; READ DATA REGISTER	
	JMP	WRF1			; AND CONTINUE

;__PFDATAS_________________________________________________________________________________________________________________________ 
;
; WRITE A COMMAND OR PARAMETER SEQUENCE (NO PAUSE)
;
; TRANSFERS ARE SYNCHONIZED BY MSR D7 <RQM> AND D6 <DIO>
;	RQM  DIO
;	0	0	BUSY
;	1	0	WRITE TO DATA REGISTER PERMITTED
;	1	1	BYTE FOR READ BY HOST PENDING
;	0	1	BUSY
;
;________________________________________________________________________________________________________________________________
;
PFDATAS:
	PHA				; SAVE DATA BYTE
WRF1S:
	LDA	FMSR			; READ FDC STATUS
	TAX	
	AND	#$80			;	
	BEQ	WRF1S			; FDC IS NOT READY, WAIT FOR IT
	TXA
	AND	#$40			; TEST DIO BIT
	BNE	WRF2S			; FDC IS OUT OF SYNC
	PLA				; RESTORE DATA
	STA	FDATA			; WRITE TO FDC	
	RTS
; FDC IS OUT OF SYNC CLEAR IT OUT AND RE-TRY
WRF2S:
	LDA	FDATA			; READ DATA REGISTER
	JMP	WRF1S			; AND CONTINUE
	
	
	
;__CHECKINT__________________________________________________________________________________________________________________________ 
;
; CHECK FOR ACTIVE FDC INTERRUPTS BEFORE GIVING I8272 COMMANDS
; POLL RQM FOR WHEN NOT BUSY AND THEN SEND FDC
; SENSE INTERRUPT COMMAND.  IF IT RTSURNS WITH NON ZERO
; ERROR CODE, PASS BACK TO JSRING ROUTINE FOR HANDLING
;________________________________________________________________________________________________________________________________
;
CHECKINT:
	LDA	FMSR			; READING OR WRITING IS KEYS TO D7 RQM
	AND	#$80
	BEQ	CHECKINT		; WAIT FOR RQM TO BE TRUE. WAIT UNTIL DONE
	LDA	FMSR			; READING OR WRITING IS KEYS TO D7 RQM
	AND	#$40			; WAITING FOR INPUT?
	BEQ	SENDINT
	RTS
	
ERRCLR:	
	LDA	FDATA			; CLEAR THE JUNK OUT OF DATA REGISTER
	LDA	FMSR			; CHECK WITH RQM
	AND	#$80			; IF STILL NOT READY, READ OUT MORE JUNK
	BEQ	ERRCLR			;
	LDA	#$FF			; RETURN ERROR CODE -1
					;
	RTS

;__SENDINT__________________________________________________________________________________________________________________________ 
;
; SENSE INTERRUPT COMMAND
;________________________________________________________________________________________________________________________________
;			
SENDINT:
	LDA	#$08			; SENSE INTERRUPT COMMAND
	JSR	PFDATA			; SEND IT
	JSR	GFDATA			; GET RESULTS
	STA	ST0			; STORE THAT
	AND	#$C0			; MASK OFF INTERRUPT STATUS BITS
	CMP	#$80			; CHECK IF INVALID COMMAND
	BEQ	ENDSENDINT		; YES, EXIT
	JSR	GFDATA			; GET ANOTHER (STATUS CODE 1)
	LDA	ST0			; GET FIRST ONE
	AND	#$C0			; MASK OFF ALL BUT INTERRUPT CODE 00 IS NORMAL
ENDSENDINT:
	RTS				; ANYTHING ELSE IS AN ERROR

	
;__GFDATA__________________________________________________________________________________________________________________________ 
;
; GET DATA FROM FLOPPY CONTROLLER
;
; TRANSFERS ARE SYNCHONIZED BYT MSR D7 <RQM> AND D6 <DIO>
;	RQM  DIO
;	0	0	BUSY
;	1	0	WRITE TO DATA REGISTER PERMITTED
;	1	1	BYTE FOR READ BY HOST PENDING
;	0	1	BUSY
;
;________________________________________________________________________________________________________________________________
;		
GFDATA:
	LDA	FMSR			; GET STATUS
	TAX				;
	AND	#%10000000		; NOT READY, WAIT
	BEQ	GFDATA			;
	TXA
	AND	#%01000000		; ANY DATA FOR US?
	BEQ	GFDATA1			; NO, SKIP IT
	LDA	FDATA			; GET FDC DATA
GFDATA1:
	RTS			

#IFNDEF ROM
FLERR:	.DB	$00			;	
UNIT:	.DB	$00			;		
TCYL:	.DB	00			
THEAD:	.DB	00				
FCMD:	.DB	0			; COMMAND READ OR WRITE,
ST0:	.DB	0			; COMMAND READ OR WRITE,
FLATCH_STORE:
	.DB	00
FLRETRY:
	.DB	00
FLRETRY1:
	.DB	00
#ENDIF

	
	
	
