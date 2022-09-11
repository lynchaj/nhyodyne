;__FLOPPY DRIVERS________________________________________________________________________________________________________________
;
; 	; 	Nhyodyne 6809 flex floppy drivers
;
;	Entry points:
;		FL_SETUP        - called during OS init
;		FL_READ_SECTOR	- read a sector from drive
;		FL_WRITE_SECTOR	- write a sector to drive
;
;________________________________________________________________________________________________________________________________
;
;*
;* HARDWARE I/O ADDRESSES
;*
FDC_MSR		=	$FE30		; ADDRESS OF MAIN STATUS REGISTER
FDC_DATA	=	$FE31		; FLOPPY DATA REGISTER
FDC_RESET	=	$FE33		; FLOPPY RESET
FDC_DCR		=	$FE35		; LOAD CONTROL REGISTER
FDC_DOR		=   $FE36		; CONFIGURATION CONTROL REGISTER
FDC_TC		=	$FE37		; TERMINAL COUNT

;
; FDC COMMANDS
;
CFD_READ	=	%00000110	; CMD,HDS/DS,C,H,R,N,EOT,GPL,DTL --> ST0,ST1,ST2,C,H,R,N
CFD_READDEL	=	%00001100	; CMD,HDS/DS,C,H,R,N,EOT,GPL,DTL --> ST0,ST1,ST2,C,H,R,N
CFD_WRITE	=	%00000101	; CMD,HDS/DS,C,H,R,N,EOT,GPL,DTL --> ST0,ST1,ST2,C,H,R,N
CFD_WRITEDEL	=	%00001001	; CMD,HDS/DS,C,H,R,N,EOT,GPL,DTL --> ST0,ST1,ST2,C,H,R,N
CFD_READTRK	=	%00000010	; CMD,HDS/DS,C,H,R,N,EOT,GPL,DTL --> ST0,ST1,ST2,C,H,R,N
CFD_READID	=	%00001010	; CMD,HDS/DS --> ST0,ST1,ST2,C,H,R,N
CFD_FMTTRK	=	%00001101	; CMD,HDS/DS,N,SC,GPL,D --> ST0,ST1,ST2,C,H,R,N
CFD_SCANEQ	=	%00010001	; CMD,HDS/DS,C,H,R,N,EOT,GPL,STP --> ST0,ST1,ST2,C,H,R,N
CFD_SCANLOEQ	=	%00011001	; CMD,HDS/DS,C,H,R,N,EOT,GPL,STP --> ST0,ST1,ST2,C,H,R,N
CFD_SCANHIEQ	=	%00011101	; CMD,HDS/DS,C,H,R,N,EOT,GPL,STP --> ST0,ST1,ST2,C,H,R,N
CFD_RECAL	=	%00000111	; CMD,DS --> <EMPTY>
CFD_SENSEINT	=	%00001000	; CMD --> ST0,PCN
CFD_SPECIFY	=	%00000011	; CMD,SRT/HUT,HLT/ND --> <EMPTY>
CFD_DRVSTAT	=	%00000100	; CMD,HDS/DS --> ST3
CFD_SEEK	=	%00001111	; CMD,HDS/DS --> <EMPTY>
CFD_VERSION	=	%00010000	; CMD --> ST0

CFD_MFM	        =	%01000000	;

;
;
; Specify Command:
; +-----+-----+-----+-----+-----+-----+-----+-----+-----+
; |Byte |  7  |	 6  |  5  |  4	|  3  |	 2  |  1  |  0	|
; +-----+-----+-----+-----+-----+-----+-----+-----+-----+
; |  0	|  0  |	 0  |  0  |  0	|  0  |	 0  |  1  |  1	|
; |  1	| ----- STEP RATE ----- | -- HEAD UNLOAD TIME - |
; |  2	| ------------ HEAD LOAD TIME ----------- | NDM |
; +-----+-----+-----+-----+-----+-----+-----+-----+-----+
;
;
; Step Rate (milliseconds):		 Head Unload Time (milliseconds):	Head Load Time (milliseconds):
; +------+------+------+------+------+	 +------+------+------+------+------+	+------+------+------+------+------+
; |	 |	   BITRATE	     |	 |	|	  BITRATE	    |	|      |	 BITRATE	   |
; |  VAL | 1.0M | 500K | 300K | 250K |	 |  VAL | 1.0M | 500K | 300K | 250K |	|  VAL | 1.0M | 500K | 300K | 250K |
; +------+------+------+------+------+	 +------+------+------+------+------+	+------+------+------+------+------+
; |    0 |  8.0 | 16.0 | 26.7 | 32.0 |	 |    0 |  128 |  256 |	 426 |	512 |	|    0 |  128 |	 256 |	426 |  512 |
; |    1 |  7.5 | 15.0 | 25.0 | 30.0 |	 |    1 |    8 |   16 | 26.7 |	 32 |	|    1 |    1 |	   2 |	3.3 |	 4 |
; |    2 |  7.0 | 14.0 | 23.3 | 28.0 |	 |    2 |   16 |   32 | 53.3 |	 64 |	|    2 |    2 |	   4 |	6.7 |	 8 |
; |  ... |  ... |  ... |  ... |	 ... |	 |  ... |  ... |  ... |	 ... |	... |	|  ... |  ... |	 ... |	... |  ... |
; |   14 |  1.0 |  2.0 |  3.3 |	 4.0 |	 |   14 |  112 |  224 |	 373 |	448 |	|  126 |  126 |	 252 |	420 |  504 |
; |   15 |  0.5 |  1.0 |  1.7 |	 2.0 |	 |   15 |  120 |  240 |	 400 |	480 |	|  127 |  127 |	 254 |	423 |  508 |
; +------+------+------+------+------+	 +------+------+------+------+------+	+------+------+------+------+------+
;
; IBM PS/2 CALLS FOR:
;   STEP RATE: 3ms (6ms FOR ALL 41mm OR 720K DRIVES)
;   HEAD LOAD TIME: 15ms



; DOR BITS (3AH)
;
;	DISKIO			    250KBPS		500KBPS
;	-------			    -------		-------
;D7	/DC/RDY			    1 (N/A)		1 (N/A)
;D6	/REDWC (DENSITY)	0 (DD)		1 (HD)
;D5	P0* (PRECOMP BIT 0)	1 \		    0 \
;D4	P1* (PRECOMP BIT 1)	0 (125NS)	1 (125NS)
;D3	P2* (PRECOMP BIT 2)	0 /		    0 /
;D2	MINI (BITRATE)		1 (250KBPS)	0 (500KBPS)
;D1	/MOTOR (ACTIVE LO)	1 (OFF)		1 (OFF)
;D0	TC (TERMINAL COUNT)	0 (OFF)		0 (OFF)
;
FDREADY		=	%10000000	; BIT PATTERN IN LATCH TO FLOPPY READY (P-34):
FDDENSITY	=	%01000000	; BIT PATTERN IN LATCH TO FLOPPY LOW DENSITY (HIGH IS 1)
FDPRECOMP	=	%00100000	; BIT PATTERN IN LATCH TO SET WRITE PRECOMP
FDPRECOMP1	=	%00010000	; BIT PATTERN IN LATCH TO SET WRITE PRECOMP
FDPRECOMP2	=	%00001000	; BIT PATTERN IN LATCH TO SET WRITE PRECOMP
FDMINI		=	%00000100	; BIT PATTERN IN LATCH TO SET MINI MODE FDC9229 LOW DENS=1, HIGH DENS=0
FDMOTOR_ON	=	%00000010	; BIT PATTERN IN LATCH FOR MOTOR CONTROL (ON)
FDTERMCN	=	%00000001	; BIT PATTERN IN LATCH TO WRITE A TC STROBE
FDRESETL	=	%00000000	; BIT PATTERN IN LATCH TO RESET ALL BITS

FDMOTOR_OFF	=	%11111101	; BIT PATTERN IN LATCH FOR MOTOR CONTROL (OFF)

DOR_BR250	=	FDREADY|FDPRECOMP|FDMINI
DOR_BR500	=	FDREADY|FDDENSITY|FDPRECOMP1
DOR_INIT        =       DOR_BR250

FLOPPY_RETRIES  =       6               ; HOW ABOUT SIX RETIRES?
FLOPPY_RETRIES1 =       2               ; TWO ITERATIONS OF RECAL?

;__FL_SETUP______________________________________________________________________________________________________________________
;
;	SETUP FLOPPY DRIVE SETTINGS
;________________________________________________________________________________________________________________________________
;
FL_SETUP:
	    LDA	    #$00            ; RESET TRACK/CYL/SEC STORAGE
	    STA	    debhead         ;
	    STA	    debcyl          ;
	    STA	    debsec          ;
	    LDA	    #$FF			; SET CACHE TO INVALID
	    STA	    Cdebhead		;
	    STA	    Cdebcyl			;
	    STA	    Cdebsec			;


        LDX     #FLOPPYMESSAGE1
        JSR     >PDATA1         ; DO PROMPT
        JSR     >PCRLF          ; AND CRLF
;
        LDX     #FLOPPYMESSAGE2
        JSR     >PDATA1         ; DO PROMPT

	    LDD	    #FDC_MSR        ; GET BASE PORT
		STD 	FLOPPYWORKVAR
		LDX 	#FLOPPYWORKVAR
	    JSR	    OUTADR		    ; PRINT BASE PORT

    	JSR	    FD_DETECT		; CHECK FOR FDC
        CMPA     #$00
        BEQ     >               ; CONTINUE IF FOUND

        LDX     #FLOPPYMESSAGE3
        JSR     >PDATA1         ; DO PROMPT
        JSR     >PCRLF          ; AND CRLF
        LDA     #$FF
    	RTS				        ; BAIL OUT
!
        LDX     #FLOPPYMESSAGE4
        JSR     >PDATA1         ; DO PROMPT
        JSR     >PCRLF          ; AND CRLF
    	LDA	    #DOR_BR250	    ; RESET SETTINGS
	    STA	    FDC_DOR_STORE	; SAVE SETTINGS
	    STA	    FDC_DOR

	    JSR	    CHECKINT	    ;
	    LDA	    #CFD_SPECIFY	; SPECIFY COMMAND
	    JSR	    PFDATA		    ; OUTPUT TO FDC
	    LDA	    #$7F		    ; 6 MS STEP, 480 MS HEAD UNLOAD
	    JSR	    PFDATA			; OUTPUT TO FDC
	    LDA	    #$05			; 508 MS HEAD LOAD, NON-DMA MODE
	    JSR     PFDATA			; OUTPUT TO FDC

	    JSR	    CHECKINT		; SEND SEVERAL INTERRUPTS TO ENSURE PROPER STATE
	    JSR	    CHECKINT		;
	    JSR	    CHECKINT		;
	    JSR	    CHECKINT		;
	    JSR	    CHECKINT		;
	    JSR	    CHECKINT		;

	    JSR	    RECAL			;

	    LDA	    #39			    ;
	    STA	    debcyl			;
	    JSR	    SETTRACK
	    JMP	    RECAL			;


;__FL_READ_SECTOR________________________________________________________________________________________________________________
;
; 	READ A FLOPPY SECTOR
;
;           ENTRY - (X) = Address in memory where sector is to be placed.
;                   (A) = Track Number
;                   (B) = Sector Number
;
;           EXIT -  (X) May be destroyed
;                   (A) May be destroyed
;                   (B) = Error condition
;                   (Z) = 1 if no error
;                       = 0 if an error
;________________________________________________________________________________________________________________________________
;
;
FL_READ_SECTOR:
        PSHS    A
        LDA     HARDWARE_DETCT
        CMPA    #$00
        BEQ     >
        PULS    A
FL_READ_SECTOR_ERROR:
        LDB     #$1F
        ASRB
        RTS
!
        STA     FLRETRY         ; BLANK RETRIES
        STA     FLRETRY1

        PULS    A
        PSHS    X
		STB 	FLOPPYWORKVAR   ; KEEP SECTOR NUMBER HERE FOR DEBLOCKING
        JSR     FL_READ_SECTOR_RAW
        PULS    X
        BNE     FL_READ_SECTOR_ERROR

        LDA 	FLOPPYWORKVAR
        ANDA    #$01
        LDB     #$00
        TFR     D,Y             ; Y NOW HAS HSTBUF OFFSET
        LDB     #$00            ; DEBLOCK TO ADDRESS IN "X"
!
        LDA     HSTBUF,Y
        STA     ,X+
        INY
        INCB
        CMPB    #$00
        BNE <
        RTS

FL_READ_SECTOR_RAW:
        JSR     SETUP_FD_CHS
      ;  DBGFLAG 'A'
	    LDA	    FDC_DOR_STORE		; POINT TO FDC_DOR
	    ORA	    #FDMOTOR_ON		    ; SET MOTOR ON
	    STA	    FDC_DOR_STORE		; POINT TO FDC_DOR
	    STA	    FDC_DOR			    ; OUTPUT TO CONTROLLER
     ;   DBGFLAG 'B'
    ;    DBGFLAG 'C'
	    LDA	    debhead			    ;
	    CMPA    Cdebhead		    ;
	    BNE	    READFL_DIRTY
	    LDA	    debcyl			    ;
	    CMPA    Cdebcyl			    ;
	    BNE	    READFL_DIRTY
	    LDA	    debsec			    ;
	    CMPA    Cdebsec			    ;
	    BNE	    READFL_DIRTY
                                    ; SECTOR ALREADY IN CACHE, DEBLOCK
     ;   DBGFLAG 'D'
	    LDA	    #$00
	    RTS
READFL_DIRTY:
     ;   DBGFLAG 'E'
	    LDA	    debhead	            ; STORE CURRENT PARMS
	    STA	    Cdebhead		    ;
	    LDA	    debcyl			    ;
	    STA	    Cdebcyl			    ;
	    LDA	    debsec			    ;
	    STA	    Cdebsec			    ;

READFL1:
      ;  DBGFLAG 'F'
	    LDA	    #CFD_READ|CFD_MFM	; BIT 6 SETS MFM, 06H IS READ COMMAND
	    STA	    FCMD                ; SET COMMAND
	    JSR	    DSKOP               ; DO DISK OPERATION

	    CMPA	#$00
	    BEQ	    READFLDONE          ; OPERATION SUCCESSFUL
	    INC	    FLRETRY             ; LET'S RETRY
	    LDA	    FLRETRY
	    CMPA    #FLOPPY_RETRIES
	    BNE	    READFL1
	    JSR 	RECAL               ; AFTER X RETRIES, LET'S RECAL THE HEAD
	    JSR	    SETTRACK            ;
	    LDA	    #$00                ;
	    STA	    FLRETRY             ; MORE RETRIES!
	    INC	    FLRETRY1
	    LDA	    FLRETRY1
	    CMPA	#FLOPPY_RETRIES1
	    BNE	    READFL1

	    LDA	    #$FF                ; RETRIES FAILED, INVALIDATE CACHE AND REPORT ERROR
	    STA	    Cdebhead		    ;
	    STA	    Cdebcyl			    ;
	    STA	    Cdebsec			    ;
      ;  DBGFLAG 'G'
	    RTS				            ; A = $FF ON RETURN = OPERATION ERROR
READFLDONE:
     ;   DBGFLAG 'H'
	    LDA	    #$00			    ; A = 0 ON RETURN = OPERATION OK
	    RTS

;__FL_WRITE_SECTOR_______________________________________________________________________________________________________________
;
; 	WRITE A FLOPPY SECTOR
;
;           ENTRY - (X) = Address in memory where sector is to be placed.
;                   (A) = Track Number
;                   (B) = Sector Number
;
;           EXIT -  (X) May be destroyed
;                   (A) May be destroyed
;                   (B) = Error condition
;                   (Z) = 1 if no error
;                       = 0 if an error
;________________________________________________________________________________________________________________________________
;
FL_WRITE_SECTOR:
        PSHS    A
        LDA     HARDWARE_DETCT
        CMPA    #$00
        BEQ     >
        PULS    A
FL_WRITE_SECTOR_ERROR:
        LDB     #$1F
        ASRB
        RTS
!
        PSHS    X
		STB 	FLOPPYWORKVAR                ; KEEP SECTOR NUMBER HERE FOR DEBLOCKING
		JSR 	FL_READ_SECTOR_RAW
        PULS    X
        BNE    FL_WRITE_SECTOR_ERROR

        LDA		FLOPPYWORKVAR
        ANDA    #$01
        LDB     #$00
        TFR     D,Y                    ; Y NOW HAS HSTBUF OFFSET
        LDB     #$00                   ; BLOCK TO ADDRESS IN "X"
!
        LDA     ,X+
        STA     HSTBUF,Y
        INY
        INCB
        CMPB    #$00
        BNE <

        STB     FLRETRY         ; BLANK RETRIES
        STB     FLRETRY1

	    LDA	    #$FF
	    STA	    Cdebhead		; INVALIDATE CACHE
	    STA	    Cdebcyl			;
	    STA	    Cdebsec			;

WRITEFL1:
	    LDA	    #CFD_WRITE|CFD_MFM	; BIT 6 SETS MFM, 05H IS WRITE COMMAND
	    STA	    FCMD
	    JSR	    DSKOP

	    CMPA	#$00
	    BEQ	    WRITEFLDONE
	    INC	    FLRETRY
	    LDA	    FLRETRY
	    CMPA	#FLOPPY_RETRIES
	    BNE	    WRITEFL1
	    JSR 	RECAL
	    JSR	    SETTRACK
	    LDA	    #$00
	    STA	    FLRETRY
	    INC	    FLRETRY1
	    LDA	    FLRETRY1
	    CMPA	#FLOPPY_RETRIES1
	    BNE	    WRITEFL1
	    LDA	    #$FF			; INVALIDATE CACHE
	    STA	    Cdebhead		;
	    STA	    Cdebcyl			;
	    STA	    Cdebsec			;
	    RTS	        			; A = $FF ON RETURN = OPERATION ERROR
WRITEFLDONE:
	    LDA	    #$00			; A = 0 ON RETURN = OPERATION OK
	    RTS


;__SETUP_FD_CHS__________________________________________________________________________________________________________________
;
; 	TRANSFORM FLEX CHS TO FLOPPY
;
;                   (A) = Track Number
;                   (B) = Sector Number
;
;________________________________________________________________________________________________________________________________
;
SETUP_FD_CHS:
	    PSHS    A   			; STORE TRACK #
	    ANDA	#$01			; FILTER OUT HEAD
	    STA	    debhead			; STORE HEAD
	    PULS    A   			; TRACK# BACK IN A
	    LSRA	        		; REMOVE HEAD BIT
	    STA	    debcyl			; STORE IN TRACK
	    LSRB		    	    ; SECTOR DIVIDE BY 2 (FOR BLOCKING)
	    STB	    debsec			; STORE IN SECTOR

	IF USEDSKYNG = 1
  	;PRTDBG "DSKY OUTPUT 1$"
  	    LDA	    CURDRV
  	    STA	    DSKY_HEXBUF
 	    LDA	    DEBCYLM
  	    STA	    DSKY_HEXBUF+1
 	    LDA	    DEBCYLL
  	    STA	    DSKY_HEXBUF+2
   	    LDA	    DEBSEHD
  	    STA	    DSKY_HEXBUF+3
  	    JSR	    DSKY_BIN2SEG
    	JSR	    DSKY_SHOW
    ENDC
        RTS

;__DSKOP__________________________________________________________________________________________________________________________
;
; 	PERFORM A DISK OPERATION
;________________________________________________________________________________________________________________________________
;
DSKOP:
        ;DBGFLAG 'I'
	    SEI
	    JSR	    CHECKINT		; CHECK INTERRUPT STATUS, MAKE SURE IT IS CLEAR
	    CMPA	#$FF			; DID IT RETURN WITH ERROR CODE?
	    BEQ	    DSKEXIT			; IF YES, EXIT WITH ERROR CODE
					            ;
        ;DBGFLAG 'J'
	    LDA	    FDC_DOR_STORE	; POINT TO FLATCH
	    ORA	    #FDMOTOR_ON		; SET MOTOR ON
	    STA	    FDC_DOR_STORE	; POINT TO FLATCH
	    STA	    FDC_DOR			; OUTPUT TO CONTROLLER
					            ;
	    JSR	    SETTRACK		; PERFORM SEEK TO TRACK
        ;DBGFLAG 'K'
					            ;
	    LDA	    FCMD			; WHAT COMMAND IS PENDING?
	    CMPA	#CFD_READ|CFD_MFM	; IS IT A READ COMMAND?
	    BNE	    GWRR_POLL		;
	    JMP	    RDD_POLL		;
GWRR_POLL:
	    JMP	    WRR_POLL		;
DSKEXIT:
	    LDA	    FDC_DOR_STORE	; POINT TO FLATCH
	    ANDA	#FDMOTOR_OFF	; SET MOTOR OFF
	    STA	    FDC_DOR_STORE	; POINT TO FLATCH
	    STA	    FDC_DOR			; OUTPUT TO CONTROLLER
	    LDA	    #$FF			; SET IF ERROR
	    CLI
	    RTS

SNDFDWR:
        ;DBGFLAG 'L'
	    CLC
	    LDA	    CURDRVADDRESS	; GET DISK UNIT NUMBER
	    ANDA	#$03			; MASK FOR FOUR DRIVES.
	    STA	    UNIT			; PARK IT IN TEMP
	    LDA	    debhead			; GET HEAD SELECTION
	    ANDA	#$01			; INSURE SINGLE BIT
	    ASLA	        		;
	    ASLA	        		; MOVE HEAD TO BIT 2 POSITION
	    ORA	    UNIT			; OR HEAD TO UNIT BYTE IN COMMAND BLOCK
	    STA	    UNIT			; STORE IN UNIT
	    LDA	    FCMD			;
	    JSR	    PFDATA			; PUSH COMMAND TO I8272
                ;DBGFLAG 'm'
	    LDA	    UNIT			;
	    JSR	    PFDATA			;
                ;DBGFLAG 'n'
	    LDA	    debcyl			;
	    JSR	    PFDATA			;
                ;DBGFLAG 'o'
	    LDA	    debhead			;
	    JSR	    PFDATA			;
                ;DBGFLAG 'p'
	    LDA	    debsec			;
	    INCA
	    JSR	    PFDATA			;
                ;DBGFLAG 'q'
	    LDA	    #$02			;
	    JSR	    PFDATA			; WHAT DENSITY
                ;DBGFLAG 'r'
	    LDA	    #$09			;
	    JSR	    PFDATA			; ASSUME SC (SECTOR COUNT)  EOT
                ;DBGFLAG 's'
	    LDA	    #$1B			;
	    JSR	    PFDATA			; WHAT GAP IS NEEDED
                ;DBGFLAG 't'
	    LDA	    #$FF			; DTL, IS THE LAST COMMAND BYTE TO I8272
	    JSR	    PFDATAS
	    RTS
; PERFORM READ
; FROM READ TO READ MUST NOT EXCEED 25US WORST CASE MIN. (AT 2MHZ IS 2,000,000 CYCLES PER SECOND == 50 CYCLE BUDGET.)
;
RDD_POLL:
   	    LDY	    #HSTBUF         ; SET DESTINATION BUFFER
        LDX     #$0200          ; TIMEOUT
   	    JSR	    SNDFDWR			;
RDS1:	LDA	    FDC_MSR			; GET STATUS
	    ;BPL	RDS1            ; FDC IS NOT READY, WAIT FOR IT
        ;ANDA	#%00100000	    ; EXECUTION MODE?
        ;BEQ	DSKOPEND	    ; NO, ERROR
        CMPA    #$F0            ;
	    BEQ	    RDS1A			; READY TO GO
        DEX
        BNE     RDS1            ; NOT READY TO GO
       	JMP	    DSKOPEND		; ERROR
RDS1A:
	    LDA	    FDC_DATA		; GET DATA
	    STA	    ,Y		        ; WRITE IT
	    INY                     ;
        CMPY    #HSTBUF+$0200   ;
	    BNE	    RDS1			; KEEP GOING
DSKOPEND:
                    ;DBGFLAG 'Y'
	    LDA	    FDC_DOR_STORE	; POINT TO FLATCH
	    ORA	    #%00000001		;
	    STA	    FDC_DOR_STORE	; SET TC
	    STA	    FDC_DOR			; OUTPUT TO CONTROLLER
        JSR     FDDELAY
	    LDA	    FDC_DOR_STORE	; POINT TO FLATCH
	    ANDA	#%11111110		;
	    STA	    FDC_DOR_STORE	; CLEAR TC
	    STA	    FDC_DOR			; OUTPUT TO CONTROLLER
        JSR     FDDELAY
	    LDA	    FDC_DOR_STORE	; POINT TO FLATCH
	    ANDA	#%11111101		; SET MOTOR OFF
	    STA	    FDC_DOR_STORE	; POINT TO FLATCH
	    STA	    FDC_DOR			; OUTPUT TO CONTROLLER					;
		            			;
	    JSR	    GFDATA			;GET ERROR TYPE
	    STA	    FLERR
                ;DBGFLAG '('
;* CLEAR OUT ANY REMAINING DATA
RESUL3:
	    JSR	    GFDATA			;READ BYTE FROM FDC
	    CMPA    #$00
	    BNE	    RESUL3			;CLEAR THEM ALL
                ;DBGFLAG ')'
	    LDA	    FLERR			;
	    ANDA	#%11000000		;
	    RTS

WRR_POLL:
   	    LDY	    #HSTBUF         ; SET DESTINATION BUFFER
	    JSR	    SNDFDWR			;
WRS1:		        			;
	    LDA	    FDC_MSR			; GET STATUS
	    BPL	    WRS1			; NOT READY
	    ANDA	#%00100000		; EXECUTION MODE?
	    BEQ	    WRS3			; NO, ERROR
	    LDA     ,Y	    	    ; WRITE IT
	    STA	    FDC_DATA		; WRITE TO FDC
	    INY
        CMPY    #HSTBUF+$0200   ;
	    BNE	    WRS1			; DO NEXT
WRS3:
	    JMP	    DSKOPEND		;


;__SETTRACK__________________________________________________________________________________________________________________________
;
; 	SEEK TO A TRACK ON GIVEN UNIT
; 	A: TRACK #
;________________________________________________________________________________________________________________________________
;
SETTRACK:
	    LDA 	FDC_DOR_STORE	; POINT TO FLATCH
	    ORA	    #FDMOTOR_ON		; SET MOTOR ON
	    STA	    FDC_DOR_STORE	; POINT TO FLATCH
	    STA	    FDC_DOR			; OUTPUT TO CONTROLLER

					; ANY INTERUPT PENDING
					; IF YES FIND OUT WHY/CLEAR
	    JSR	    CHECKINT		; CHECK INTERRUPT STATUS, MAKE SURE IT IS CLEAR
	    CMPA    #$FF			; DID IT RTSURN WITH ERROR CODE?
	    BNE	    SETTRK1
	    JMP	    SETTRKEXIT		;

					;
SETTRK1:
	    LDA	    debcyl			; GET TRACK
	    CMPA	#$00			;
	    BEQ	    RECAL			; IF 0 PERFORM RECAL INSTEAD OF SEEK
	    LDA	    #CFD_SEEK		; SEEK COMMAND
	    JSR	    PFDATA			; PUSH COMMAND
	    LDA	    CURDRVADDRESS	; SAY WHICH UNIT
	    JSR	    PFDATA			; SEND THAT
	    LDA	    debcyl			; TO WHAT TRACK
	    JSR	    PFDATA			; SEND THAT TOO
	    JMP	    WAINT			; WAIT FOR INTERRUPT SAYING DONE
RECAL:
	    LDA	    FDC_DOR_STORE	; POINT TO DOR
	    ORA	    #FDMOTOR_ON		; SET MOTOR ON
	    STA	    FDC_DOR_STORE	; POINT TO DOR
        STA	    FDC_DOR			; OUTPUT TO CONTROLLER
	    LDA	    #CFD_RECAL		; RECAL TO TRACK 0
	    JSR	    PFDATA			; SEND IT
	    LDA	    CURDRVADDRESS   ; WHICH UNIT
	    JSR	    PFDATA			; SEND THAT TOO
;
WAINT:
        PSHS    X
	    LDX	    #$0100
        JSR     FDVDELAY
        PULS    X
!
	    JSR	    CHECKINT
	    LDA	    FDC_MSR			; READ SEEK STATUS
	    ANDA	#%00001111		; ANY DRIVES SEEKING?
	    BNE	    <		    	; YES, WAIT FOR THEM
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
	    PSHS    A				; SAVE DATA BYTE
        LDY     #$0100          ; SET RETRIES
WRF1:
	    LDA	    FDC_MSR			; READ FDC STATUS
        TFR     A,B
	    ANDA	#$80			;
	    BNE     >
        DEY
        BNE     WRF1			; FDC IS NOT READY, WAIT FOR IT
        PULS    A
        LDA     #$FF
        RTS
!
	    ANDB	#$40			; TEST DIO BIT
	    BNE	    WRF2			; FDC IS OUT OF SYNC
	    PULS    A				; RESTORE DATA
	    STA	    FDC_DATA		; WRITE TO FDC
        JSR     FDDELAY
        JSR     FDDELAY
        JSR     FDDELAY
	    RTS
; FDC IS OUT OF SYNC CLEAR IT OUT AND RE-TRY
WRF2:
	    LDA	    FDC_DATA		; READ DATA REGISTER
	    JMP	    WRF1			; AND CONTINUE

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
	    PSHS    A				; SAVE DATA BYTE
WRF1S:
	    LDA	    FDC_MSR			; READ FDC STATUS
        TFR     A,B
	    ANDA	#$80			;
	    BEQ	    WRF1S			; FDC IS NOT READY, WAIT FOR IT
	    ANDB	#$40			; TEST DIO BIT
	    BNE	    WRF2S			; FDC IS OUT OF SYNC
	    PULS    A				; RESTORE DATA
	    STA	    FDC_DATA		; WRITE TO FDC
	    RTS
; FDC IS OUT OF SYNC CLEAR IT OUT AND RE-TRY
WRF2S:
	    LDA	    FDC_DATA		; READ DATA REGISTER
	    JMP	    WRF1S			; AND CONTINUE



;__CHECKINT__________________________________________________________________________________________________________________________
;
; CHECK FOR ACTIVE FDC INTERRUPTS BEFORE GIVING I8272 COMMANDS
; POLL RQM FOR WHEN NOT BUSY AND THEN SEND FDC
; SENSE INTERRUPT COMMAND.  IF IT RTSURNS WITH NON ZERO
; ERROR CODE, PASS BACK TO JSRING ROUTINE FOR HANDLING
;________________________________________________________________________________________________________________________________
;
CHECKINT:
        LDY     #$0200
!
	    LDA	    FDC_MSR			; READING OR WRITING IS KEYS TO D7 RQM
	    ANDA	#$80
	    BNE	    >         		; WAIT FOR RQM TO BE TRUE. WAIT UNTIL DONE
        JSR     FDDELAY
        DEY
        BNE     <
        JMP     ERRCLR

!
	    LDA	    FDC_MSR			; READING OR WRITING IS KEYS TO D7 RQM
	    ANDA	#$40			; WAITING FOR INPUT?
	    BEQ	    SENDINT
	    RTS

ERRCLR:
        LDY     #$0200
!
	    LDA	    FDC_DATA		; CLEAR THE JUNK OUT OF DATA REGISTER
	    LDA	    FDC_MSR			; CHECK WITH RQM
	    ANDA	#$80			; IF STILL NOT READY, READ OUT MORE JUNK
	    BNE	    >   			;
        JSR     FDDELAY
        DEY
        BNE     <
!
	    LDA	    #$FF			; RETURN ERROR CODE -1
					;
	    RTS

;__SENDINT__________________________________________________________________________________________________________________________
;
; SENSE INTERRUPT COMMAND
;________________________________________________________________________________________________________________________________
;
SENDINT:
	    LDA	    #CFD_SENSEINT	; SENSE INTERRUPT COMMAND
	    JSR	    PFDATA			; SEND IT
	    JSR	    GFDATA			; GET RESULTS
	    STA	    ST0	    		; STORE THAT
	    ANDA	#$C0			; MASK OFF INTERRUPT STATUS BITS
	    CMPA	#$80			; CHECK IF INVALID COMMAND
	    BEQ	    ENDSENDINT		; YES, EXIT
	    JSR	    GFDATA			; GET ANOTHER (STATUS CODE 1)
	    LDA	    ST0 			; GET FIRST ONE
	    ANDA	#$C0			; MASK OFF ALL BUT INTERRUPT CODE 00 IS NORMAL
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
        LDY     #$0200
!
	    LDA	    FDC_MSR			; GET STATUS
	    TFR     A,B				;
	    ANDA	#%10000000		; NOT READY, WAIT
	    BNE	    >   			;
        DEY
        BNE     <
        LDA     #$00
        RTS
!
	    ANDB	#%01000000		; ANY DATA FOR US?
	    BEQ	    GFDATA1			; NO, SKIP IT
	    LDA	    FDC_DATA		; GET FDC DATA
GFDATA1:
    	RTS

;__FD_DETECT______________________________________________________________________________________________________________________
;
; 	DETECT FLOPPY HARDWARE
;________________________________________________________________________________________________________________________________
FD_DETECT:
	; BLINDLY RESET FDC (WHICH MAY OR MAY NOT EXIST)
	    LDA     #DOR_INIT	    ; MAKE SURE INITIAL DOR VALUE IS SETUP
        STA	    FDC_DOR_STORE	; AND PUT IN SHADOW REGISTER

	    JSR	    FC_RESETFDC	    ; RESET FDC

	    LDA 	FDC_MSR	        ; READ MSR
	    CMPA	#$80
	    BEQ 	FD_DETECT1  	; $80 IS OK
	    CMPA	#$D0
	    BEQ	    FD_DETECT1  	; $D0 IS OK
        LDA     #$FF            ; NOT OK
        STA     HARDWARE_DETCT
        RTS
;
FD_DETECT1:
	    LDX     #100
        JSR     FDVDELAY	    ; WAIT A BIT FOR FDC
	    LDA	    FDC_MSR 	    ; READ MSR AGAIN
	    CMPA	#$80
	    BEQ 	>             	; $80 IS OK
	    CMPA	#$D0
        LDA     #$FF            ; NOT OK
        STA     HARDWARE_DETCT
        RTS
!
        LDA     #$00            ; OK
        STA     HARDWARE_DETCT
        RTS

FC_RESETFDC:
        LDA     FDC_RESET
        LDA     FDC_RESET
	    LDX     #150
        JSR     FDVDELAY	; WAIT A BIT FOR FDC

	    LDA     #FDRESETL
       	STA     FDC_DOR
	    JSR	    FDDELAY
	    LDA     FDC_DOR_STORE
       	STA     FDC_DOR
	    LDX	    #150			;
	    JSR	    FDVDELAY
	    RTS


FDDELAY:
        PSHS    A
        PULS    A
        PSHS    A
        PULS    A
        RTS
FDVDELAY:
        PSHS    A
        PULS    A
        PSHS    A
        PULS    A
        DEX
        CMPX    #$00
        BNE     FDVDELAY
        RTS



HARDWARE_DETCT: .byte 0		; HARDWARE DETECTED
debhead:        .byte 0		; DEBLOCKED HEAD
debcyl:	        .byte 0		; DEBLOCKED CYLINDER
debsec:	        .byte 0		; DEBLOCKED SECTOR
Cdebhead:	    .byte 0		; DEBLOCKED HEAD (cache)
Cdebcyl:	    .byte 0		; DEBLOCKED CYLINDER (cache)
Cdebsec:	    .byte 0		; DEBLOCKED SECTOR (cache)
FLERR:	        .BYTE	$00	;
UNIT:	        .BYTE	$00	;
FCMD:	        .BYTE	0	; COMMAND READ OR WRITE,
ST0:	        .BYTE	0	; COMMAND READ OR WRITE,
FDC_DOR_STORE:  .BYTE	00
FLRETRY:        .BYTE	00
FLRETRY1:       .BYTE	00
FLOPPYMESSAGE1:	FCC     "FD: MODE=MBC"
                FCB     EOT
FLOPPYMESSAGE2:	FCC     " IO=0x"
                FCB     EOT
FLOPPYMESSAGE3:	FCC     " NOT PRESENT"
                FCB     EOT
FLOPPYMESSAGE4: FCC     " PRESENT"
                FCB     EOT
FLOPPYWORKVAR:  .BYTE   $00,$00
