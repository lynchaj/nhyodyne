;__IDE DRIVERS___________________________________________________________________________________________________________________
;
; 	NHYODYNE FLEX09 IDE DISK DRIVERS FOR Z80PPIDE CARD
;
;	ENTRY POINTS:
;		PPIDE_INIT   	- CALLED DURING OS INIT
;		IDE_READ_SECTOR - READ A SECTOR FROM DRIVE
;		IDE_WRITE_SECTOR- WRITE A SECTOR TO DRIVE
;________________________________________________________________________________________________________________________________
;
PPIDE_PPI	=	$FE60		; PORT A
;
PPIDELO		=	PPIDE_PPI+0	; LSB
PPIDEHI		=	PPIDE_PPI+1	; MSB
PPIDECNTRL	=	PPIDE_PPI+2	; CONTROL SIGNALS
PPIDEPPIC	=	PPIDE_PPI+3	; CONTROL BYTE PPI 82C55

PPIDE_A0_LINE	=	$01		;DIRECT FROM 8255 TO IDE INTERFACE
PPIDE_A1_LINE	=	$02		;DIRECT FROM 8255 TO IDE INTERFACE
PPIDE_A2_LINE	=	$04		;DIRECT FROM 8255 TO IDE INTERFACE
PPIDE_CS0_LINE	=	$08		;INVERTER BETWEEN 8255 AND IDE INTERFACE
PPIDE_CS1_LINE	=	$10		;INVERTER BETWEEN 8255 AND IDE INTERFACE
PPIDE_WR_LINE	=	$20		;INVERTER BETWEEN 8255 AND IDE INTERFACE
PPIDE_RD_LINE	=	$40		;INVERTER BETWEEN 8255 AND IDE INTERFACE
PPIDE_RST_LINE	=	$80		;INVERTER BETWEEN 8255 AND IDE INTERFACE

PPIDE_DATA		=	PPIDE_CS0_LINE
PPIDE_ERR		=	PPIDE_CS0_LINE+PPIDE_A0_LINE
PPIDE_SEC_CNT	=	PPIDE_CS0_LINE+PPIDE_A1_LINE
PPIDE_LBALOW	=	PPIDE_CS0_LINE+PPIDE_A1_LINE+PPIDE_A0_LINE
PPIDE_LBAMID	=	PPIDE_CS0_LINE+PPIDE_A2_LINE
PPIDE_LBAHI		=	PPIDE_CS0_LINE+PPIDE_A2_LINE+PPIDE_A0_LINE
PPIDE_DEVICE	=	PPIDE_CS0_LINE+PPIDE_A2_LINE+PPIDE_A1_LINE
PPIDE_COMMAND	=	PPIDE_CS0_LINE+PPIDE_A2_LINE+PPIDE_A1_LINE+PPIDE_A0_LINE
PPIDE_STATUS	=	PPIDE_CS0_LINE+PPIDE_A2_LINE+PPIDE_A1_LINE+PPIDE_A0_LINE
PPIDE_CONTROL	=	PPIDE_CS1_LINE+PPIDE_A2_LINE+PPIDE_A1_LINE
PPIDE_ASTATUS	=	PPIDE_CS1_LINE+PPIDE_A2_LINE+PPIDE_A1_LINE+PPIDE_A0_LINE


;IDE COMMAND CONSTANTS.  THESE SHOULD NEVER CHANGE.
PPIDE_CMD_RECAL	=	$10
PPIDE_CMD_READ	=	$20
PPIDE_CMD_WRITE	=	$30
PPIDE_CMD_INIT	=	$91
PPIDE_CMD_ID	=	$EC
PPIDE_CMD_SPINDOWN=	$E0
PPIDE_CMD_SPINUP=	$E1


PPRD_IDE_8255	=	%10010010	;IDE_8255_CTL OUT, IDE_8255_LSB/MSB INPUT
PPWR_IDE_8255	=	%10000000	;ALL THREE PORTS OUTPUT


PPIDEINDEX:		.BYTE	$00
PPIDETIMEOUT:	.BYTE	$00,$00
PPIDEWORKVAR:	.BYTE	$00,$00

;__PPIDE_INIT_________________________________________________________________________________________
;
;  INIT AND DISPLAY IDE INFO
;____________________________________________________________________________________________________
;
PPIDE_INIT:
	    JSR     >PCRLF         ; AND CRLF
	    JSR     >PCRLF         ; AND CRLF
        LDX     #MESSAGE1
        JSR     >PDATA1         ; DO PROMPT
       	JSR     >PCRLF         ; AND CRLF
	    JSR	    IDE_PPIDETECT	; TEST FOR PPI HARDWARE
        BNE     IDE_ABORT      	; BAIL OUT IF NOT THERE
;
        LDX     #MESSAGE2
        JSR     >PDATA1         ; DO PROMPT
	    LDD	    #PPIDE_PPI	    ; GET BASE PORT
		STD 	PPIDEWORKVAR
		LDX 	#PPIDEWORKVAR
	    JSR	    OUTADR			; PRINT BASE PORT
;
	    JSR	    PPIDE_RESET		; RESET THE BUS
	    JSR	    PPIDE_PROBE		; DETECT AN ATA DEVICE, ABORT IF NOT FOUND
	    BCS 	IDE_ABORT
	    JMP 	IDE_PRINT_INFO
IDE_ABORT:
        LDX     #MESSAGE3
        JSR     >PDATA1         ; DO PROMPT
	    JMP 	IDE_INITA
IDE_PRINT_INFO:
	    JSR     >PCRLF         ; AND CRLF
        LDX     #MESSAGE4
        JSR     >PDATA1         ; DO PROMPT
	    LDA	    #$00
	    JSR	    IDE_READ_INFO	; GET DRIVE INFO, ABORT IF ERROR
        LDX     #MESSAGE5
        JSR     >PDATA1         ; DO PROMPT
	    LDA	    #$01
	    JSR	    IDE_READ_INFO	; GET DRIVE INFO, ABORT IF ERROR
IDE_INITA:
	    JSR     >PCRLF         ; AND CRLF
	    RTS				        ; DONE
;
;__PPIDE_PROBE_______________________________________________________________________________________
;
;  PROBE FOR IDE HARDWARE
;____________________________________________________________________________________________________
;
PPIDE_PROBE:
;
	; BELOW TESTS FOR EXISTENCE OF AN IDE CONTROLLER ON THE
	; PPIDE INTERFACE.  WE WRITE A VALUE OF ZERO FIRST SO THAT
	; THE PPI BUS HOLD WILL RETURN A VALUE OF ZERO IF THERE IS
	; NOTHING CONNECTED TO PPI PORT A.  THEN WE READ THE STATUS
	; REGISTER.  IF AN IDE CONTROLLER IS THERE, IT SHOULD ALWAYS
	; RETURN SOMETHING OTHER THAN ZERO.  IF AN IDE CONTROLLER IS
	; THERE, THEN THE VALUE WRITTEN TO PPI PORT A IS IGNORED
	; BECAUSE THE WRITE SIGNAL IS NEVER PULSED.

	LDA 	#$00
	STA 	PPIDELO 		; PPI PORT A, DATALO

	JSR	    IDE_WAIT_NOT_BUSY	; WAIT FOR BUSY TO CLEAR
	BCS 	PPIDE_PROBE_FAIL	; IF TIMEOUT, REPORT NO IDE PRESENT
	LDA	    #PPIDE_STATUS		; GET STATUS
	JSR	    IDE_READ
    TFR     X,A
	ANDA 	#%01000000
	CMPA 	#$00
	BEQ 	PPIDE_PROBE_FAIL	; IF NOT RDY BIT (BIT 6) THEN REPORT NO IDE PRESENT

	; CHECK SIGNATURE
	LDA	    #PPIDE_SEC_CNT
	JSR	    IDE_READ
    TFR     X,A
	CMPA 	#$01
	BNE 	PPIDE_PROBE_FAIL	; IF NOT '01' THEN REPORT NO IDE PRESENT
	LDA	    #PPIDE_LBALOW
	JSR	    IDE_READ
    TFR     X,A
	CMPA 	#$01
	BNE 	PPIDE_PROBE_FAIL	; IF NOT '01' THEN REPORT NO IDE PRESENT
	LDA	    #PPIDE_LBAMID
	JSR	    IDE_READ
    TFR     X,A
	CMPA 	#$00
	BNE 	PPIDE_PROBE_FAIL	; IF NOT '00' THEN REPORT NO IDE PRESENT
	LDA	    #PPIDE_LBAHI
	JSR	    IDE_READ
    TFR     X,A
	CMPA 	#$00
	BNE 	PPIDE_PROBE_FAIL	; IF NOT '00' THEN REPORT NO IDE PRESENT
	CLC
	JMP 	PPIDE_PROBE_SUCCESS
PPIDE_PROBE_FAIL:
	SEC
PPIDE_PROBE_SUCCESS:
	RTS		            		; DONE, NOTE THAT A=0 AND Z IS SET

;*__IDE_READ_INFO___________________________________________________________________________________
;*
;*  READ IDE INFORMATION
;*	CARRY SET ON ERROR
;* 	A=MST/SLV
;*____________________________________________________________________________________________________
IDE_READ_INFO:
		; SET DRIVE BIT
		ANDA 	#$01			; ONLY WANT THE 1 BIT (MST/SLV)
		ASLA	     			; SHIFT 4
		ASLA	     			;
		ASLA	     			;
		ASLA	     			;
		ORA 	#$E0			; E0=MST  F0=SLV
		TFR 	A,B
        LDA     #$00
        TFR     D,X
		LDA	    #PPIDE_DEVICE
		JSR	    IDE_WRITE
		JSR	    IDE_WAIT_NOT_BUSY	;MAKE SURE DRIVE IS READY
		BCS	    IDE_READ_INFO_ABORT
		LDA	    #PPIDE_COMMAND		;SELECT IDE REGISTER
		LDX	    #PPIDE_CMD_ID
		JSR	    IDE_WRITE		;ASK THE DRIVE TO READ IT
		JSR	    IDE_WAIT_DRQ		;WAIT UNTIL IT'S GOT THE DATA
		BCS	    IDE_READ_INFO_ABORT
		JSR	    IDE_READ_BUFFER		; GRAB THE 256 WORDS FROM THE BUFFER
        LDX     #MESSAGE6
        JSR     >PDATA1
		LDA 	HSTBUF+123
		JSR 	OUTHEXA
		LDA 	HSTBUF+122
		JSR 	OUTHEXA
		LDA 	HSTBUF+121
		JSR 	OUTHEXA
		LDA 	HSTBUF+120
		JSR 	OUTHEXA
		JMP 	IDE_READ_INFO_OK
IDE_READ_INFO_ABORT:
        LDX     #MESSAGE3
        JSR     >PDATA1         DO PROMPT
		JSR     >PCRLF         AND CRLF
		SEC
		RTS				;
IDE_READ_INFO_OK:
		JSR     >PCRLF         AND CRLF
		CLC
		RTS


;__IDE_PPIDETECT____________________________________________________________________________________
;
;  PROBE FOR PPI HARDWARE
;____________________________________________________________________________________________________
;
IDE_PPIDETECT:
;
	; TEST FOR PPI EXISTENCE
	; WE SETUP THE PPI TO WRITE, THEN WRITE A VALUE OF ZERO
	; TO PORT A (DATALO), THEN READ IT BACK.  IF THE PPI IS THERE
	; THEN THE BUS HOLD CIRCUITRY WILL READ BACK THE ZERO. SINCE
	; WE ARE IN WRITE MODE, AN IDE CONTROLLER WILL NOT BE ABLE TO
	; INTERFERE WITH THE VALUE BEING READ.
	JSR	    SET_PPI_WR
;
	LDA     #$00			; VALUE ZERO
	STA	    PPIDELO			; PUSH VALUE TO PORT
	LDA	    PPIDELO			; GET PORT VALUE
    CMPA    #$00
	RTS				; AND RETURN
;


;*__IDE_READ_SECTOR___________________________________________________________________________________
;*
;*  READ IDE SECTOR (IN LBA) INTO BUFFER
;*
;           ENTRY - (X) = Address in memory where sector is to be placed.
;                   (A) = Track Number
;                   (B) = Sector Number
;
;           EXIT -  (X) May be destroyed
;                   (A) May be destroyed
;                   (B) = Error condition
;                   (Z) = 1 if no error
;                       = 0 if an error
;*____________________________________________________________________________________________________
IDE_READ_SECTOR:
	;	PRTDBG "IDE READ SECTOR$"
		DECB							; WE LOSE ONE SECTOR PER TRACK BASED ON FLEX
		STA 	PPIDETMP				; USING 1 BASED SECTOR COUNTING
		SUBB 	PPIDETMP				;
		BCC 	>						;
		DECA							;
!										;
        PSHS    X
		STB 	PPIDETMP                ; KEEP SECTOR NUMBER HERE FOR DEBLOCKING
		JSR 	IDE_READ_RAW_SECTOR
        PULS    X
        BNE     IDE_READ_SECTOR_ERROR
        LDA 	PPIDETMP
        ANDA    #$01
        LDB     #$00
        TFR     D,Y                    ; Y NOW HAS HSTBUF OFFSET

        LDB     #$00                   ; DEBLOCK TO ADDRESS IN "X"
!
        LDA     HSTBUF,Y
        STA     ,X+
        INY
        INCB
        CMPB    #$00
        BNE <
		RTS
IDE_READ_SECTOR_ERROR:
 		LDB     #$1F
        ASRB
        RTS

IDE_READ_RAW_SECTOR:
	;	PRTDBG "IDE READ RAW SECTOR$"
	  	JSR	    IDE_CONVERT_SECTOR	;
		LDA	    DEBSEHD			; STORE CURRENT PARMS
		CMPA	CDEBSEHD		;
		BNE 	IDE_READ_SECTOR_DIRTY
		LDA	    DEBCYLM			;
		CMPA	CDEBCYLM		;
		BNE	    IDE_READ_SECTOR_DIRTY
		LDA	    DEBCYLL			;
		CMPA	CDEBCYLL		;
		BNE 	IDE_READ_SECTOR_DIRTY
		LDB	    #$00			; RETURN = OPERATION OK
		RTS

IDE_READ_SECTOR_DIRTY:
	;	PRTDBG "IDE READ SECTOR BUFFER DIRTY$"
		JSR	    IDE_WAIT_NOT_BUSY	;MAKE SURE DRIVE IS READY
		BCS 	IDE_READ_SECTOR_DIRTY_ERROR	; IF TIMEOUT, REPORT NO IDE PRESENT
IDE_READ_SECTOR_DIRTY1:
		JSR	    IDE_SETUP_LBA		;TELL IT WHICH SECTOR WE WANT
		LDA	    #PPIDE_COMMAND		;SELECT IDE REGISTER
		LDX	    #PPIDE_CMD_READ
		JSR	    IDE_WRITE   		;ASK THE DRIVE TO READ IT
		JSR	    IDE_WAIT_DRQ		;WAIT UNTIL IT'S GOT THE DATA
		BCS 	IDE_READ_SECTOR_DIRTY_ERROR	; IF TIMEOUT, REPORT NO IDE PRESENT
		JSR	    IDE_READ_BUFFER		; GRAB THE 256 WORDS FROM THE BUFFER
		LDA	    DEBSEHD			; STORE CURRENT PARMS
		STA	    CDEBSEHD		;
		LDA	    DEBCYLL			;
		STA	    CDEBCYLL		;
		LDA	    DEBCYLM			;
		STA	    CDEBCYLM		;

		LDB	    #$00			; RETURN = OPERATION OK
		RTS
IDE_READ_SECTOR_DIRTY_ERROR:
		LDB	    #$0F			; SET ERROR CONDITION
		RTS

;*__IDE_WRITE_SECTOR__________________________________________________________________________________
;*
;*  WRITE IDE SECTOR (IN LBA) FROM BUFFER
;*
;           ENTRY - (X) = Address in memory where data to be written lives.
;                   (A) = Track Number
;                   (B) = Sector Number
;
;           EXIT -  (X) May be destroyed
;                   (A) May be destroyed
;                   (B) = Error condition
;                   (Z) = 1 if no error
;                       = 0 if an error
;*____________________________________________________________________________________________________
IDE_WRITE_SECTOR:
		PSHS 	Y
		DECB							; WE LOSE ONE SECTOR PER TRACK BASED ON FLEX
		STA 	PPIDETMP				; USING 1 BASED SECTOR COUNTING
		SUBB 	PPIDETMP				;
		BCC 	>						;
		DECA							;
!										;
        PSHS    X
		STB 	PPIDETMP                ; KEEP SECTOR NUMBER HERE FOR DEBLOCKING

		JSR 	IDE_READ_RAW_SECTOR
        LBNE     IDE_WRITE_SECTOR_ERROR1
        PULS    X

        LDA		PPIDETMP
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

		JSR	    IDE_WAIT_NOT_BUSY	;MAKE SURE DRIVE IS READY
		BCS 	IDE_WRITE_SECTOR_ERROR	; IF TIMEOUT, REPORT NO IDE PRESENT
		LDA	    #PPIDE_COMMAND
		LDX	    #PPIDE_CMD_WRITE
		JSR	    IDE_WRITE		;TELL DRIVE TO WRITE A SECTOR
		JSR	    IDE_WAIT_DRQ		;WAIT UNIT IT WANTS THE DATA
		BCS 	IDE_WRITE_SECTOR_ERROR	; IF TIMEOUT, REPORT NO IDE PRESENT
		JSR	    IDE_WRITE_BUFFER	;GIVE THE DATA TO THE DRIVE
		JSR	    IDE_WAIT_NOT_BUSY	;WAIT UNTIL THE WRITE IS COMPLETE
		BCS 	IDE_WRITE_SECTOR_ERROR	; IF TIMEOUT, REPORT NO IDE PRESENT
		LDA	    #$FF			; STORE CURRENT PARMS
		STA	    CDEBSEHD		;
		STA	    CDEBCYLL		;
		STA	    CDEBCYLM		;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		PSHS 	A,B,X,Y
		JSR 	IDE_READ_SECTOR_DIRTY		; NOT 100% SURE WHY THIS IS NECESSARY FOR A SUCCESSFUL WRITE  . .
		PULS 	A,B,X,Y						; BUT I AM OUT OF TIME FOR TODAY
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		LDB	    #$00			; ZERO ON RETURN = OPERATION OK
		PULS 	Y,PC
IDE_WRITE_SECTOR_ERROR1:
        PULS    X
IDE_WRITE_SECTOR_ERROR:
		LDB	    #$FF			; 1 ON RETURN = OPERATION FAIL
        STB	    CDEBSEHD		;
		STB	    CDEBCYLL		;
		STB	    CDEBCYLM		;
		LDB     #$1F
        ASRB
		PULS 	Y,PC

;*__PPIDE_RESET____________________________________________________________________________________
;*
;*  SOFT RESET IDE CHANNEL
;*
;*____________________________________________________________________________________________________
PPIDE_RESET:
  ;	PRTDBG "IDE RESET$"
		LDA	    #$00
		STA	    DEBSEHD
		STA	    DEBCYLL
		STA	    DEBCYLM
		LDA	    #$FF			;
		STA	    CDEBSEHD		;
		STA	    CDEBCYLL		;
		STA	    CDEBCYLM		;

		LDA	    #PPIDE_RST_LINE
		STA	    PPIDECNTRL			; ASSERT RST LINE ON IDE INTERFACE

		LDX	    #$0100
;	PRTDBG "IDE RESET DELAY$"
RST_DLY:
		DEX
		CPX	    #$0000
		BNE	    RST_DLY
		LDA	    #$00
		STA	    PPIDECNTRL			; DEASSERT RST LINE ON IDE INTERFACE

; IF A DSKYNG IS ACTIVE AND IS ON THE SAME PPI PORT AS THE PPISD BEING
; RESET, THEN THE DSKYNG WILL ALSO BE RESET.  SO, THE DSKY IS ALSO INITIALIZED.
	IF USEDSKYNG = 1
		JSR 	DSKY_REINIT
	ENDC

		RTS


;*__IDE_WAIT_NOT_BUSY_______________________________________________________________________________
;*
;*  WAIT FOR IDE CHANNEL TO BECOME READY
;*
;*____________________________________________________________________________________________________
IDE_WAIT_NOT_BUSY:
		PSHS    X,A
		LDA     #$00
		STA     PPIDETIMEOUT
		STA     PPIDETIMEOUT+1
IDE_WAIT_NOT_BUSY1:
		LDA	    #PPIDE_STATUS		;WAIT FOR RDY BIT TO BE SET
		JSR	    IDE_READ
        TFR     X,A
		ANDA    #$80
		BEQ	    IDE_WAIT_NOT_BUSY2
		INC 	PPIDETIMEOUT
		BNE 	IDE_WAIT_NOT_BUSY1
		INC 	PPIDETIMEOUT+1
		BNE 	IDE_WAIT_NOT_BUSY1
		SEC
		JMP	    IDE_WAIT_NOT_BUSY3
IDE_WAIT_NOT_BUSY2:
		CLC
IDE_WAIT_NOT_BUSY3:
        PULS    PC,X,A
		RTS

;*__IDE_WAIT_DRQ______________________________________________________________________________________
;*
;*	WAIT FOR THE DRIVE TO BE READY TO TRANSFER DATA.
;*
;*____________________________________________________________________________________________________
IDE_WAIT_DRQ:
        PSHS    A,X,Y
		LDA     #$00
		STA     PPIDETIMEOUT
		STA     PPIDETIMEOUT+1
IDE_WAIT_DRQ1:
		LDA	    #PPIDE_STATUS		;WAIT FOR DRQ BIT TO BE SET
		JSR	    IDE_READ
		TFR     X,A
		ANDA	#%10001000		; MASK OFF BUSY(7) AND DRQ(3)
		CMPA	#%00001000		; WE WANT BUSY(7) TO BE 0 AND DRQ (3) TO BE 1
		BEQ	    IDE_WAIT_DRQ2
		ANDA	#%00000001		; IS ERROR?
		CMPA	#%00000001		;
		BEQ 	IDE_WAIT_DRQE
		INC 	PPIDETIMEOUT
		BNE 	IDE_WAIT_DRQ1
		INC 	PPIDETIMEOUT+1
		BNE 	IDE_WAIT_DRQ1
IDE_WAIT_DRQE:
		SEC
		JMP	IDE_WAIT_DRQ3
IDE_WAIT_DRQ2:
		CLC
IDE_WAIT_DRQ3:
        PULS    PC,A,X,Y



;*__IDE_READ_BUFFER___________________________________________________________________________________
;*
;*  READ IDE BUFFER LITTLE ENDIAN
;*
;*____________________________________________________________________________________________________
IDE_READ_BUFFER:
		LDY    	#$0000			; INDEX
IDEBUFRD:
		LDA	    #PPIDE_DATA
		JSR	    IDE_READ_NO_SETUP
		TFR 	X,D
		STB	    HSTBUF,Y		;
        INY
		STA	    HSTBUF,Y		;
        INY
		CMPY   	#$0200			;
		BNE	    IDEBUFRD		;
		RTS				;

;*__IDE_WRITE_BUFFER___________________________________________________________________________________
;*
;*  WRITE IDE BUFFER LITTLE ENDIAN
;*
;*____________________________________________________________________________________________________
IDE_WRITE_BUFFER:
		LDY    	#$0000			; INDEX
IDEBUFWT:
		LDB     HSTBUF,Y		; SECTORS ARE LITTLE ENDIAN
		INY			        	;
		LDA     HSTBUF,Y		; SECTORS ARE LITTLE ENDIAN
		INY
		TFR 	D,X
		LDA	    #PPIDE_DATA
		JSR	    IDE_WRITE
		CMPY   	#$0200			;
		BNE	    IDEBUFWT		;
		RTS				        ;

;*__IDE_SETUP_LBA_____________________________________________________________________________________
;*
;*  SETUP LBA DATA
;*  A= DRIVE DEVICE
;*____________________________________________________________________________________________________
IDE_SETUP_LBA:
;		PRTDBG "PPIDE SETUP LBA$"
        LDA     CURDRVADDRESS
		ANDA 	#$01			; ONLY WANT DRIVE CFG
		ASLA 				    ; SHIFT 4
		ASLA				    ;
		ASLA				    ;
		ASLA				    ;
		ORA 	#$E0			; E0=MST  F0=SLV
		TFR 	A,B
        LDA     #$00
		TFR     D,X
		LDA	    #PPIDE_DEVICE
		JSR	    IDE_WRITE
        LDA     #$00
		LDB    	DEBCYLM
   		TFR     D,X
		LDA	    #PPIDE_LBAHI
		JSR	    IDE_WRITE
        LDA     #$00
		LDB    	DEBCYLL			;
   		TFR     D,X
		LDA	    #PPIDE_LBAMID
		JSR	    IDE_WRITE
        LDA     #$00
		LDB    	DEBSEHD			;
   		TFR     D,X
		LDA	    #PPIDE_LBALOW
		JSR	    IDE_WRITE
		LDX	    #$0001
		LDA	    #PPIDE_SEC_CNT
		JSR	    IDE_WRITE

		RTS

;___IDE_CONVERT_SECTOR___________________________________________________________________________________
;
; 	TRANSLATE SECTORS INTO IDE FORMAT
;
;                   (A) = Track Number
;                   (B) = Sector Number
;________________________________________________________________________________________________________
IDE_CONVERT_SECTOR:
	    LSRB			        ; DIVIDE BY 2 (FOR BLOCKING)
        LSRA                    ;
        BCC     >
        ORB     #$80
!
	    STB	    DEBSEHD			; STORE IN SECTOR/HEAD
	    STA	    DEBCYLL			; STORE IN TRACK (LSB)

;	ADD SLICE OFFSET
	    LDD     CURDRVSLICE
	    LSRB			        ; DIVIDE BY 2 (FOR BLOCKING)
        LSRA                    ;
        BCC     >
        ORB     #$80
!
        STB	    DEBCYLM			; STORE IN TRACK (LSB)
        BCC     >
	    LDA	    DEBCYLL			; STORE IN TRACK (LSB)
        ORA     #$80
        STA	    DEBCYLL			; STORE IN TRACK (LSB)
!

  IF USEDSKYNG = 1
;  	PRTDBG "DSKY OUTPUT 1$"
  	LDA	CURDRV
  	STA	DSKY_HEXBUF
 	LDA	DEBCYLM
  	STA	DSKY_HEXBUF+1
 	LDA	DEBCYLL
  	STA	DSKY_HEXBUF+2
   	LDA	DEBSEHD
  	STA	DSKY_HEXBUF+3
  	JSR	DSKY_BIN2SEG
	JSR	DSKY_SHOW
  ENDC
	RTS


;-------------------------------------------------------------------------------

; LOW LEVEL I/O TO THE DRIVE.  THESE ARE THE ROUTINES THAT TALK
; DIRECTLY TO THE DRIVE, VIA THE 8255 CHIP.  NORMALLY A MAIN
; PROGRAM WOULD NOT CALL TO THESE.

	;DO A READ BUS CYCLE TO THE DRIVE, USING THE 8255.
	;INPUT A = IDE REGSITER ADDRESS
	;OUTPUT X = WORD READ FROM IDE DRIVE
IDE_READ:
	JSR	    SET_PPI_RD		; SETUP FOR A READ CYCLE
IDE_READ_NO_SETUP:
	STA	    PPIDECNTRL		;DRIVE ADDRESS ONTO CONTROL LINES
	ORA	    #PPIDE_RD_LINE	; ASSERT RD PIN
	STA	    PPIDECNTRL
    PSHS    A
	LDB	    PPIDELO			; READ LOWER BYTE
	LDA	    PPIDEHI			; READ UPPER BYTE
    TFR     D,X
	PULS    A				; RESTORE REGISTER VALUE
	STA	    PPIDECNTRL		;DRIVE ADDRESS ONTO CONTROL LINES
	EORA    #PPIDE_RD_LINE	; ASSERT RD PIN
	STA	    PPIDECNTRL
	LDA	    #$00
	STA	    PPIDECNTRL		;DEASSERT ALL CONTROL PINS
	RTS

	;DO A WRITE BUS CYCLE TO THE DRIVE, VIA THE 8255
	;INPUT A = IDE REGISTER ADDRESS
	;INPUT REGISTER X = WORD TO WRITE
	;

IDE_WRITE:
	JSR	    SET_PPI_WR		; SETUP FOR A WRITE CYCLE
    PSHS    A
    TFR     X,D
	STB	    PPIDELO			; WRITE LOWER BYTE
	STA	    PPIDEHI			; WRITE UPPER BYTE
	PULS    A				; RESTORE REGISTER VALUE
	STA	    PPIDECNTRL		;DRIVE ADDRESS ONTO CONTROL LINES
	ORA	    #PPIDE_WR_LINE		; ASSERT WRITE PIN
	STA	    PPIDECNTRL
	EORA	#PPIDE_WR_LINE		; DE ASSERT WR PIN
	STA		PPIDECNTRL
	LDA	    #$00
	STA	    PPIDECNTRL		;DEASSERT ALL CONTROL PINS
	RTS


;-----------------------------------------------------------------------------------
; PPI SETUP ROUTINE TO CONFIGURE THE APPROPRIATE PPI MODE
;
;------------------------------------------------------------------------------------

SET_PPI_RD:
	PSHS    A
	LDA	    #$00
	STA	    PPIDECNTRL		;DEASSERT ALL CONTROL PINS
	LDA	#PPRD_IDE_8255
	STA	PPIDEPPIC				;CONFIG 8255 CHIP, READ MODE
	PULS    A,PC

SET_PPI_WR:
	PSHS    A
	LDA	    #$00
	STA	    PPIDECNTRL		;DEASSERT ALL CONTROL PINS
	LDA	#PPWR_IDE_8255
	STA	PPIDEPPIC				;CONFIG 8255 CHIP, WRITE MODE
	PULS    A,PC

OUTHEXA:
	PSHS 	A
	PSHS 	A
	JSR 	OUTHL
	PULS 	A
	JSR 	OUTHR
	PULS 	A,PC

MESSAGE1    FCC     "PPIDE :"
            FCB     EOT
MESSAGE2    FCC     " IO=0x"
            FCB     EOT
MESSAGE3    FCC     " NOT PRESENT"
            FCB     EOT
MESSAGE4    FCC     " PPIDE0: BLOCKS="
            FCB     EOT
MESSAGE5    FCC     " PPIDE1: BLOCKS="
            FCB     EOT
MESSAGE6    FCC     "0x"
            FCB     EOT


;ALLOCATE THE FOLLOWING DATA AREAS TO UNUSED RAM SPACE
CDEBCYLL:	.BYTE 0		; DEBLOCKED CYLINDER LSB
CDEBCYLM:	.BYTE 0		; DEBLOCKED CYLINDER MSB
CDEBSEHD:	.BYTE 0		; DEBLOCKED SECTOR AND HEAD (HS)
DEBCYLL:	.BYTE 0		; DEBLOCKED CYLINDER LSB
DEBCYLM:	.BYTE 0		; DEBLOCKED CYLINDER MSB
DEBSEHD:	.BYTE 0		; DEBLOCKED SECTOR AND HEAD (HS)
PPIDETMP:	.BYTE 0		; TEMP