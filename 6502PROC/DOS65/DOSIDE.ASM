;__IDE DRIVERS___________________________________________________________________________________________________________________
;
; 	Nhyodyne IDE disk drivers for Z80PPIDE card
;
;	Entry points:
;		IDE_SOFT_RESET   - called during OS init
;		IDE_READ_SECTOR  - read a sector from drive  ('U' POINTS TO DCB, X TO MEMORY)
;		IDE_WRITE_SECTOR - write a sector to drive   ('U' POINTS TO DCB, X TO MEMORY)
;________________________________________________________________________________________________________________________________
;
PPI		=	$0360		; PORT A
;
IDELO		=	PPI+0		; LSB
IDEHI		=	PPI+1		; MSB
IDECNTRL	=	PPI+2		; Control Signals
IDEPPIC		=	PPI+3		; CONTROL BYTE PPI 82C55

IDE_A0_LINE	=	$01		;DIRECT FROM 8255 TO IDE INTERFACE
IDE_A1_LINE	=	$02		;DIRECT FROM 8255 TO IDE INTERFACE
IDE_A2_LINE	=	$04		;DIRECT FROM 8255 TO IDE INTERFACE
IDE_CS0_LINE	=	$08		;INVERTER BETWEEN 8255 AND IDE INTERFACE
IDE_CS1_LINE	=	$10		;INVERTER BETWEEN 8255 AND IDE INTERFACE
IDE_WR_LINE	=	$20		;INVERTER BETWEEN 8255 AND IDE INTERFACE
IDE_RD_LINE	=	$40		;INVERTER BETWEEN 8255 AND IDE INTERFACE
IDE_RST_LINE	=	$80		;INVERTER BETWEEN 8255 AND IDE INTERFACE

IDE_DATA	=	IDE_CS0_LINE
IDE_ERR		=	IDE_CS0_LINE + IDE_A0_LINE
IDE_SEC_CNT	=	IDE_CS0_LINE + IDE_A1_LINE
IDE_SECTOR	=	IDE_CS0_LINE + IDE_A1_LINE + IDE_A0_LINE
IDE_CYL_LSB	=	IDE_CS0_LINE + IDE_A2_LINE
IDE_CYL_MSB	=	IDE_CS0_LINE + IDE_A2_LINE + IDE_A0_LINE
IDE_HEAD	=	IDE_CS0_LINE + IDE_A2_LINE + IDE_A1_LINE
IDE_COMMAND	=	IDE_CS0_LINE + IDE_A2_LINE + IDE_A1_LINE + IDE_A0_LINE
IDE_STATUS	=	IDE_CS0_LINE + IDE_A2_LINE + IDE_A1_LINE + IDE_A0_LINE
IDE_CONTROL	=	IDE_CS1_LINE + IDE_A2_LINE + IDE_A1_LINE
IDE_ASTATUS	=	IDE_CS1_LINE + IDE_A2_LINE + IDE_A1_LINE + IDE_A0_LINE
IDE_RESET	=	IDE_RST_LINE

;IDE COMMAND CONSTANTS.  THESE SHOULD NEVER CHANGE.
IDE_CMD_RECAL	=	$10
IDE_CMD_READ	=	$20
IDE_CMD_WRITE	=	$30
IDE_CMD_INIT	=	$91
IDE_CMD_ID	=	$EC
IDE_CMD_SPINDOWN=	$E0
IDE_CMD_SPINUP	=	$E1


RD_IDE_8255	=	%10010010	;IDE_8255_CTL OUT, IDE_8255_LSB/MSB INPUT
WR_IDE_8255	=	%10000000	;ALL THREE PORTS OUTPUT

IDEINDEX:	.byte	$00

;*__IDE_READ_SECTOR___________________________________________________________________________________
;*
;*  READ IDE SECTOR (IN LBA) INTO BUFFER
;*
;*____________________________________________________________________________________________________
IDE_READ_SECTOR:
		PRTDBG "IDE Read Sector$"
		LDA	debhead			; STORE CURRENT PARMS
		CMP	Cdebhead		;
		BNE	IDE_READ_SECTOR_DIRTY
		LDA	debcyl			;
		CMP	Cdebcyl			;
		BNE	IDE_READ_SECTOR_DIRTY
		LDA	debsec			;
		CMP	Cdebsec			;
		BNE	IDE_READ_SECTOR_DIRTY
		LDA	#$00			; ZERO = 1 ON RETURN = OPERATION OK
		RTS

IDE_READ_SECTOR_DIRTY:
		PRTDBG "IDE Read Sector Buffer Dirty$"
		JSR	IDE_WAIT_NOT_BUSY	;MAKE SURE DRIVE IS READY
		JSR	IDE_SETUP_LBA		;TELL IT WHICH SECTOR WE WANT
		LDA	#IDE_COMMAND		;SELECT IDE REGISTER
		LDX	#IDE_CMD_READ
		JSR	IDE_WRITE		;ASK THE DRIVE TO READ IT
		JSR	IDE_WAIT_DRQ		;WAIT UNTIL IT'S GOT THE DATA
		JSR	IDE_READ_BUFFER		; GRAB THE 256 WORDS FROM THE BUFFER

		LDA	debhead			; STORE CURRENT PARMS
		STA	Cdebhead		;
		LDA	debcyl			;
		STA	Cdebcyl			;
		LDA	debsec			;
		STA	Cdebsec			;

		LDA	#$00			; ZERO = 1 ON RETURN = OPERATION OK
		RTS


;*__IDE_WRITE_SECTOR__________________________________________________________________________________
;*
;*  WRITE IDE SECTOR (IN LBA) FROM BUFFER
;*
;*____________________________________________________________________________________________________
IDE_WRITE_SECTOR:
		PRTDBG "IDE Write Sector$"
		JSR	IDE_WAIT_NOT_BUSY	;MAKE SURE DRIVE IS READY
		JSR	IDE_SETUP_LBA		;TELL IT WHICH SECTOR WE WANT
		LDA	#IDE_COMMAND
		LDX	#IDE_CMD_WRITE
		JSR	IDE_WRITE		;TELL DRIVE TO WRITE A SECTOR
		JSR	IDE_WAIT_DRQ		;WAIT UNIT IT WANTS THE DATA
		JSR	IDE_WRITE_BUFFER	;GIVE THE DATA TO THE DRIVE
		JSR	IDE_WAIT_NOT_BUSY	;WAIT UNTIL THE WRITE IS COMPLETE

		LDA	#$FF			; STORE CURRENT PARMS
		STA	Cdebhead		;
		STA	Cdebcyl			;
		STA	Cdebsec			;

		LDA	#$00			; ZERO = 1 ON RETURN = OPERATION OK
		RTS

;*__IDE_SOFT_RESET____________________________________________________________________________________
;*
;*  SOFT RESET IDE CHANNEL
;*
;*____________________________________________________________________________________________________
IDE_SOFT_RESET:
  	PRTDBG "IDE Reset$"
		LDA	#$00
		STA	debhead
		STA	debcyl
		STA	debsec
		LDA	#$FF			;
		STA	Cdebhead		;
		STA	Cdebcyl			;
		STA	Cdebsec			;
		LDA	#IDE_RESET
		STA	IDECNTRL			; ASSERT RST LINE ON IDE INTERFACE
		LDX	#$00
	PRTDBG "IDE Reset Delay$"
RST_DLY:
		DEX
		CPX	#$00
		BNE	RST_DLY
		LDA	#$00
		STA	IDECNTRL			; DEASSERT RST LINE ON IDE INTERFACE
		RTS


;*__IDE_WAIT_NOT_BUSY_______________________________________________________________________________
;*
;*  WAIT FOR IDE CHANNEL TO BECOME READY
;*
;*____________________________________________________________________________________________________
IDE_WAIT_NOT_BUSY:
		LDA	#IDE_STATUS		;WAIT FOR RDY BIT TO BE SET
		JSR	IDE_READ
		TXA
		AND	#$80
		BNE	IDE_WAIT_NOT_BUSY
		RTS



IDE_WAIT_READY:
		LDA	#IDE_STATUS		;WAIT FOR RDY BIT TO BE SET
		JSR	IDE_READ
		TXA
		AND	#%11000000		;MASK OFF BUSY AND READY BITS
		CMP	#%01000000		;WE WANT BUSY(7) TO BE 0 AND READY(6) TO BE 1
		BNE	IDE_WAIT_READY
		RTS

	;WAIT FOR THE DRIVE TO BE READY TO TRANSFER DATA.
	;RETURNS THE DRIVE'S STATUS IN ACC
IDE_WAIT_DRQ:
		LDA	#IDE_STATUS		;WAIT FOR DRQ BIT TO BE SET
		JSR	IDE_READ
		TXA
		AND	#%10001000		; MASK OFF BUSY(7) AND DRQ(3)
		CMP	#%00001000		; WE WANT BUSY(7) TO BE 0 AND DRQ (3) TO BE 1
		BNE	IDE_WAIT_DRQ
		RTS



;*__IDE_READ_BUFFER___________________________________________________________________________________
;*
;*  READ IDE BUFFER LITTLE ENDIAN
;*
;*____________________________________________________________________________________________________
IDE_READ_BUFFER:
		LDX    	#$00			; INDEX
IDEBUFRD:
		STX	IDEINDEX
		LDA	#IDE_DATA
		JSR	IDE_READ
		TXA
		LDX	IDEINDEX
		STA	hstbuf,X		;
		INX				;
		TYA				; THEN HIGH BYTE OF WORD
		STA	hstbuf,X		;
		INX
		CPX    	#$00			;
		BNE	IDEBUFRD		;
IDEBUFRD1:
		STX	IDEINDEX
		LDA	#IDE_DATA
		JSR	IDE_READ
		TXA
		LDX	IDEINDEX
		STA	hstbuf+256,X		;
		INX				;
		TYA				; THEN HIGH BYTE OF WORD
		STA	hstbuf+256,X		;
		INX				;
		CPX    	#$00			;
		BNE	IDEBUFRD1		;
		RTS				;

;*__IDE_WRITE_BUFFER___________________________________________________________________________________
;*
;*  WRITE IDE BUFFER LITTLE ENDIAN
;*
;*____________________________________________________________________________________________________
IDE_WRITE_BUFFER:
		LDX    	#$00			; INDEX
IDEBUFWT:
		STX	IDEINDEX
		LDA     hstbuf+1,X		; SECTORS ARE BIG ENDIAN
		TAY				;
		LDA     hstbuf,X		; SECTORS ARE BIG ENDIAN
		TAX
		LDA	#IDE_DATA
		JSR	IDE_WRITE
		LDX	IDEINDEX
		INX				;
		INX				;
		CPX    	#$00			;
		BNE	IDEBUFWT		;
		LDX    	#$00			; INDEX
IDEBUFWT1:
		STX	IDEINDEX
		LDA     hstbuf+257,X		; SECTORS ARE BIG ENDIAN
		TAY
		LDA     hstbuf+256,X		; SECTORS ARE BIG ENDIAN
		TAX
		LDA	#IDE_DATA
		JSR	IDE_WRITE
		LDX	IDEINDEX
		INX				;
		INX				;
		CPX    	#$00			;
		BNE	IDEBUFWT1		;
		RTS				;

;*__IDE_SETUP_LBA_____________________________________________________________________________________
;*
;*  SETUP LBA DATA
;*
;*____________________________________________________________________________________________________
IDE_SETUP_LBA:

		LDY	#$00
		LDX	#$E0			; MSB
		LDA	#IDE_HEAD
		JSR	IDE_WRITE

		LDX    	debhead
		LDA	#IDE_CYL_MSB
		JSR	IDE_WRITE

		LDX    	debcyl			;
		LDA	#IDE_CYL_LSB
		JSR	IDE_WRITE

		LDX    	debsec			;
		LDA	#IDE_SECTOR
		JSR	IDE_WRITE

		LDX	#$01
		LDA	#IDE_SEC_CNT
		JSR	IDE_WRITE

		RTS


;-------------------------------------------------------------------------------

; LOW LEVEL I/O TO THE DRIVE.  THESE ARE THE ROUTINES THAT TALK
; DIRECTLY TO THE DRIVE, VIA THE 8255 CHIP.  NORMALLY A MAIN
; PROGRAM WOULD NOT CALL TO THESE.

	;DO A READ BUS CYCLE TO THE DRIVE, USING THE 8255.
	;INPUT A = IDE REGSITER ADDRESS
	;OUTPUT X = LOWER BYTE READ FROM IDE DRIVE
	;OUTPUT Y = UPPER BYTE READ FROM IDE DRIVE

IDE_READ:
	JSR	SET_PPI_RD		; SETUP FOR A READ CYCLE

	STA	IDECNTRL		;DRIVE ADDRESS ONTO CONTROL LINES
	ORA	#IDE_RD_LINE		; ASSERT RD PIN
	STA	IDECNTRL
	PHA

	LDX	IDELO			; READ LOWER BYTE
	LDY	IDEHI			; READ UPPER BYTE

	PLA				; RESTORE REGISTER VALUE
	EOR	#IDE_RD_LINE		; DE-ASSERT RD SIGNAL
	STA	IDECNTRL
	LDA	#$00
	STA	IDECNTRL		;DEASSERT ALL CONTROL PINS
	RTS




	;DO A WRITE BUS CYCLE TO THE DRIVE, VIA THE 8255
	;INPUT A = IDE REGISTER ADDRESS
	;INPUT REGISTER X = LSB TO WRITE
	;INPUT REGISTER Y = MSB TO WRITE
	;


IDE_WRITE:
	JSR	SET_PPI_WR		; SETUP FOR A WRITE CYCLE

	STX	IDELO			; WRITE LOWER BYTE
	STY	IDEHI			; WRITE UPPER BYTE

	STA	IDECNTRL		;DRIVE ADDRESS ONTO CONTROL LINES

	ORA	#IDE_WR_LINE		; ASSERT WRITE PIN
	STA	IDECNTRL

	EOR	#IDE_WR_LINE		; DE ASSERT WR PIN
	STA	IDECNTRL

	LDA	#$00
	STA	IDECNTRL		;DEASSERT ALL CONTROL PINS
	RTS


;-----------------------------------------------------------------------------------
; PPI SETUP ROUTINE TO CONFIGURE THE APPROPRIATE PPI MODE
;
;------------------------------------------------------------------------------------

SET_PPI_RD:
	PHA
	LDA	#RD_IDE_8255
	STA	IDEPPIC				;CONFIG 8255 CHIP, READ MODE
	PLA
	RTS

SET_PPI_WR:
	PHA
	LDA	#WR_IDE_8255
	STA	IDEPPIC				;CONFIG 8255 CHIP, WRITE MODE
	PLA
	RTS
