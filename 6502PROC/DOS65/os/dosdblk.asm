;__DOS DEBLOCK DRIVERS___________________________________________________________________________________________________________
;
; 	Nhyodyne DOS/65 Blocking and Deblocking code
;
;________________________________________________________________________________________________________________________________
;

;___DEBSECR512________________________________________________________________________________________
;
;	DEBLOCK 512 BYTE SECTOR FOR DOS/65
;
;________________________________________________________________________________________________________
DEBSECR512:
	PHA
	LDA	seksec			;
	AND	#$03			; GET SECTOR INDEX
	CLC				;
	ROL	A			;
	TAX				;
	LDA	DEBTAB,X		;
	STA     SRC
	INX
	LDA	DEBTAB,X		;
	STA	SRC+1			;
	LDA	#<MD_PAGEBU		;
	STA	DEST			;
	LDA	#>MD_PAGEBU           	;
	STA	DEST+1			;
	JSR	COPY_DOS_SECTOR		;
	PLA
	RTS

DEBTAB:
	.word	hstbuf			;
	.word	hstbuf+128		;
	.word	hstbuf+256		;
	.word	hstbuf+384		;


;___BLKSECR512___________________________________________________________________________________________
;
;	BLOCK 512 SECTOR FOR DOS/65
;
;________________________________________________________________________________________________________
BLKSECR512:
	PHA
	LDA	seksec			;
	AND	#$03			; GET SECTOR INDEX
	CLC				;
	ROL	A			;
	TAX				;
	LDA	DEBTAB,X		;
	STA     DEST
	INX
	LDA	DEBTAB,X		;
	STA	DEST+1			;
	LDA	#<MD_PAGEBU		;
	STA	SRC			;
	LDA	#>MD_PAGEBU		;
	STA	SRC+1			;
	JSR	COPY_DOS_SECTOR		;
	PLA
	RTS

;___GET_DRIVE_DEVICE_____________________________________________________________________________________
;
;	GET SELECTED DEVICE TYPE AND UNIT, RETURN IN "A"
;
;________________________________________________________________________________________________________
GET_DRIVE_DEVICE:
	PHX
	LDA	sekdsk			; GET DRIVE
	AND 	#7			; ONLY FIRST 8 DEVICES SUPPORTED
	asl	a			; DOUBLE NUMBER FOR TABLE LOOKUP
	TAX 				; MOVE TO X REGISTER
	LDA 	dskcfg,X 		; GET device
	PLX
	RTS


;___COPY_DOS_SECTOR______________________________________________________________________________________
;
;	COPY 128 BYTE SECTOR FOR DOS/65
;
;________________________________________________________________________________________________________
COPY_DOS_SECTOR:
	PHY
	LDY	#$00			;
COPY_DOS_SECTOR1:
	LDA	(SRC),Y			;
	STA	(DEST),Y		;
	INY				;
	TYA				;
	CMP	#$80			;
	BNE	COPY_DOS_SECTOR1	;
	PLY
	RTS


;deblocking buffer for dba
hstbuf:		.res	512		;256 or 512 byte sectors
