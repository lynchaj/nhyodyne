;________________________________________________________________________________________________________________________________
;
;	Nhyodyne dos/65 system interface module (sim)
;
;  DWERNER 12/20/2021 	ported to Nhyodyne
;________________________________________________________________________________________________________________________________

		.include "macro.asm"
DO_FARCALL =    farcall-md_pagecode+$0200

;dos/65 system interface module (sim)
;version 3.00
;this version is designed to work with the N8VEM Host Processor

;fixed parameters
simstart:

;my system i/o routines in rom
nsects	=	(simstart-ccm)/128	;number sectors

;main program
;jump vector used by pem
sim:	jmp	boot		;from cold start
wboote:	jmp	wboot		;from warm boot
	jmp	consts		;check for input
	jmp	conrde		;get input
	jmp	conwrt		;send to terminal
	jmp	prnwrt		;printer output
	jmp	punwrt		;punch output
	jmp	rdrinp		;reader input
	jmp	home		;home drive
	jmp	seldsk		;select disk
	jmp	seltrk		;set track
	jmp	selsec		;set sector
	jmp	setdma		;set buffer address
	jmp	read		;read sector
	jmp	write		;write sector
	lda	#1		;printer always ready
	rts
	jmp	rdtime		;clock entry
	jmp	xlate		;translate

;console definition block
sysdef:
	.byte	8		;backspace
	.byte	1		;clear to end of line
	.byte	$c		;forward space
	.byte	0		;normal video
	.byte	'^'		;invert video
	.byte	24		;lines per screen
	.byte	80		;char per line
	.byte	$c		;formfeed
	.byte	$1e		;home
	.byte	2		;clear to end of screen

;opening id message
opnmsg:	.byte	cr,lf

    	.BYTE "d8888b.  .d88b.  .d8888.    dD     ooooo",cr,lf
    	.BYTE "88  `8D .8P  Y8. 88   YP   d8     8P~~~~",cr,lf
    	.BYTE "88   88 88    88 `8bo.    d8     dP",cr,lf
    	.BYTE "88   88 88    88   `Y8b. d8888b. V8888b.",cr,lf,0
opnmsg1:
    	.BYTE "88  .8D `8b  d8' db   8D 88  `8D     `8D",cr,lf
    	.BYTE "Y8888D   `Y88P   `8888Y  `8888P  88oobY",cr,lf
	.byte 17,"DOS/65 ON THE NHYODYNE 3.00",cr,lf,0


;cold entry from loader
boot:
	SEI 			; DISABLE INTERRUPTS
	ldx	#$ff		;set stack
	txs			;pointer
	cld			;set binary mode

	JSR	PAGER_INIT		;setup paging for device drivers

	PRTDBG "OS Starting$"

 	lda	#<opnmsg	;point to message
	ldy	#>opnmsg
	jsr	outmsg		;send it
 	lda	#<opnmsg1
	ldy	#>opnmsg1
	jsr	outmsg		;send it

	JSR 	NEWLINE

; 	setup diskconfig table
	ldx 	#0
@2:
	lda 	dftdskcfg,x
	sta 	dskcfg,x
	inx
	cpx 	#$10
	bne 	@2

	PRTDBG "DISK CFG TABLE COPIED$"

  	lda	#0		;set zero
	jsr	seldsk		;and select drive zero

	lda 	#22            ;MD_SHOW
	sta 	farfunct
	JSR 	DO_FARCALL

  ;  	lda 	#25            ;FD_INIT
;	sta 	farfunct
;	JSR 	DO_FARCALL

    	lda 	#04            ;PPIDE_INIT
	sta 	farfunct
	JSR 	DO_FARCALL

   .IF USEDSKYNG=1 || USEDSKY=1
	lda 	#08            ;DSKY_INIT
	sta 	farfunct
	JSR 	DO_FARCALL

	LDX 	#$00
@1:
	LDA 	DOS65DSKYINIT,X
	STA	DSKY_BUF,X
	INX
	CPX 	#8
	BNE	@1
	lda 	#18            ;DSKY_PUTLED
	sta 	farfunct
	JSR 	DO_FARCALL

	lda 	#13            ;DSKY_BEEP
	sta 	farfunct
	JSR 	DO_FARCALL
  .ENDIF

	LDA 	#<cnstxt	; STORE POINTER TO COMMAND LINE
	STA 	cmdlnp
	LDA 	#>cnstxt
	STA 	cmdlnp+1

	LDA 	#<dskcfg	; STORE POINTER TO DISK CONFIG TABLE FOR APPS
	STA 	dskcfpc
	LDA 	#>dskcfg
	STA 	dskcfpc+1
	JSR 	DSPL_DSK_CFG	; DISPLAY DISK CONFIG TO USERS


				;set up jumps into dos/65 in page one
setup:
	JSR	PAGER_INIT
	ldx	#0		;clear index
				;first clear key dba variables
	stx	hstact		;host buffer inactive
	stx	unacnt		;clear unalloc count
setupl:	lda	inttbl,x	;get byte
	sta	$100,x		;insert at start
	inx
	cpx	#6
	bne	setupl		;loop until done
	lda	#<dflbuf	;get low buffer
	ldy	#>dflbuf	;and high
	jsr	setdma		;and set
	lda	sekdsk		;get disk

	lda	#DEFDRV		;set zero
	jsr	seldsk		;and select drive zero
	jsr	home		;home that drive

	PRTDBG "Start CCM$"
	lda	#DEFDRV		;set zero
	jmp	ccm		;and go to ccm
;initialization table
inttbl:	.byte	$4c,<wboote,>wboote,$4c,<pem,>pem
;warm boot-read dos/65 back except sim and then
; jump to ccm.


wboot:
	SEI 			; DISABLE INTERRUPTS
	ldx	#$ff		;set stack
	txs			;pointer
	cld			;set binary mode

	jmp	setup		;go setup



;__SELDSK_________________________________________________________________________________________________
;
; 	PERFORM DOS/65 DISK DRIVE SELECT
;________________________________________________________________________________________________________
;select disk
seldsk:
	and	#7		;three lsbs only
	sta	sekdsk		;save for later
 	LDA	sekdsk		;save for later
	asl	a		;multiply by two
	tax			;make an Index
	lda	dcbtbl,x	;get address
	ldy	dcbtbl+1,x
	rts

;table of dcb addresses
dcbtbl:	.word	dcba		; A
	.word	dcbb		; B
	.word	dcbc		; C
	.word	dcbd		; D
	.word	dcbe		; E
	.word	dcbf		; F
	.word	dcbg		; G
	.word	dcbh		; H

;__HOME__________________________________________________________________________________________________
;
; 	PERFORM DOS/65 HEAD HOME
;________________________________________________________________________________________________________
home:
	lda	#$00
	ldy	#$00

;__SELTRK________________________________________________________________________________________________
;
; 	PERFORM DOS/65 SELECT TRACK
;
;	A=TRACK LOW BYTE
;	Y=TRACK HIGH BYTE
;________________________________________________________________________________________________________
seltrk:
	CLC
	sta	sektrk		;save number
	sty	sektrk+1
	rts

;__SELSEC________________________________________________________________________________________________
;
; 	PERFORM DOS/65 SECTOR SELECT
;
;	A=SECTOR LOW BYTE
;	Y=SECTOR HIGH BYTE
;________________________________________________________________________________________________________
selsec:
	sta	seksec		;save low and high
	sty	seksec+1
	rts

;__READ__________________________________________________________________________________________________
;
; 	PERFORM DOS/65 SECTOR READ
;________________________________________________________________________________________________________
read:
	JSR 	GET_DRIVE_DEVICE	;
	and 	#$F0			; only want first nybble
	CMP 	#$00
	BNE 	:+			; not MD drive
	;RAM
	lda 	#20            		;MD_READ_SECTOR
	sta 	farfunct
	JSR 	DO_FARCALL
	JMP 	MOVEBUFTODMA
:
	CMP 	#$20
	BNE 	:+			; not floppy drive
	;FD
	lda 	#23            		;FD_READ_SECTOR
	sta 	farfunct
	JSR 	DO_FARCALL
	JMP 	MOVEBUFTODMA
	RTS				;
:
	CMP 	#$30
	BNE 	:+			; invalid drive
	;PPIDE
	lda 	#05            		;IDE_READ_SECTOR
	sta 	farfunct
	JSR 	DO_FARCALL
	JMP 	MOVEBUFTODMA
:
	LDA	#$FF			; signal error
	RTS				;


;__WRITE_________________________________________________________________________________________________
;
; 	PERFORM DOS/65 SECTOR WRITE
;________________________________________________________________________________________________________
write:
	JSR 	GET_DRIVE_DEVICE	;
	JSR 	MOVEDMATOBUF

	and 	#$F0			; only want first nybble

	CMP 	#$00
	BNE 	:+			; not MD Drive
	;MD
	lda 	#21            		;MD_WRITE_SECTOR
	sta 	farfunct
	jmp 	DO_FARCALL
:
	CMP 	#$20
	BNE 	:+			; not floppy drive
	;FD
	lda 	#24            		;FD_WRITE_SECTOR
	sta 	farfunct
	JMP 	DO_FARCALL
:
	CMP 	#$30
	BNE 	writex			; not ppide
	;PPIDE
	lda 	#06            		;IDE_WRITE_SECTOR
	sta 	farfunct
	jmp 	DO_FARCALL
writex:
	LDA	#$FF			; signal error
	RTS				;


;__SETDMA________________________________________________________________________________________________
;
; 	PERFORM DOS/65 BUFFER ADDRESS SELECTION
;
;	A=BUFFER LOW BYTE
;	Y=BUFFER HIGH BYTE
;________________________________________________________________________________________________________
setdma:
	sta	dmaadr		;store low
	sty	dmaadr+1	;and high
	rts


;__CONSTS________________________________________________________________________________________________
;
; 	GET DOS/65 CONSOLE STATUS
;________________________________________________________________________________________________________
consts:
	lda 	#03
	sta 	farfunct
	jmp 	DO_FARCALL

;__CONRDE________________________________________________________________________________________________
;
; 	PERFORM DOS/65 CONSOLE READ
;________________________________________________________________________________________________________
conrde:
	lda 	#02
	sta 	farfunct
	jmp 	DO_FARCALL


;__CONWRT________________________________________________________________________________________________
;
; 	PERFORM DOS/65 CONSOLE WRITE
;________________________________________________________________________________________________________
conwrt:
	pha
	lda 	#00
	sta 	farfunct
	pla
	jmp 	DO_FARCALL

prnwrt:
	rts			;printer
punwrt:
	rts			;punch output
rdrinp:
	rts			;reader input
rdtime:
	rts			;read clock
xlate:
	rts			;sector translate


;__OUTMSG________________________________________________________________________________________________
;
; 	WRITE A NULL TERMINATED STRING TO THE CONSOLE
;
;	A=POINTER LOW BYTE
;	Y=POINTER HIGH BYTE
;________________________________________________________________________________________________________
outmsg:				;output message
	STA OUTMSG_W
	STY OUTMSG_W+1
	LDY #$00
OUTSTRLP:
       	LDA (OUTMSG_W),Y 	; LOAD NEXT CHAR FROM STRING INTO ACC
       	CMP #$00		; IS NULL?
       	BEQ ENDOUTSTR		; YES, END PRINT OUT
       	JSR conwrt  		; PRINT CHAR IN ACC
       	INY      		; Y=Y+1 (BUMP INDEX)
       	JMP OUTSTRLP		; DO NEXT CHAR
ENDOUTSTR:
       	RTS			; RETURN

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

;___DSPL_DSK_CFG_________________________________________________________________________________________
;
;	DISPLAY THE DISK CONFIGURATION FOR THE USER
;
;________________________________________________________________________________________________________
DSPL_DSK_CFG:
	JSR 	NEWLINE
	PRTS "Disk Configuration:$"
	JSR 	NEWLINE
	ldx 	#0
DSPL_DSK_CFG_1:
	PRTS "    $"		; MAKE IT PRETTY :)
	TXA
	LSR	A
	CLC
	ADC 	#'A'
	JSR 	conwrt
	LDA 	#':'
	JSR 	conwrt
	LDA 	#'='
	JSR 	conwrt
	JSR 	prtdevice	; PRINT DEVICE NAME FROM TABLE (X)
	LDA 	#':'
	JSR 	conwrt
	INX				; WANT SECOND BYTE OF ENTRY
	LDA 	dskcfg,x 		; GET SLICE
	JSR 	PRTDEC 			; PRINT SLICE IN DECIMAL (A)
	INX
	JSR 	NEWLINE
	CPX 	#16
	BNE 	DSPL_DSK_CFG_1
	RTS

; 	DEVICE TABLE:
;	$00	MD
;	$2x	FLOPPY
;	$3x	IDE
prtdevice:
	LDA 	dskcfg,X 		; GET DEVICE TYPE
	PHA
	AND 	#$F0 			; FILTER OUT UNIT
	CMP 	#$00
	BNE 	prtdevice1
	PRTS "MD$"
	jmp 	prtdevice_done
prtdevice1:
	CMP 	#$10
	BNE 	prtdevice2
	PRTS "UNK$"
	jmp 	prtdevice_done
prtdevice2:
	CMP 	#$20
	BNE 	prtdevice3
	PRTS "FD$"
	jmp 	prtdevice_done
prtdevice3:
	CMP 	#$30
	BNE 	prtdevicex
	PRTS "PPIDE$"
	jmp 	prtdevice_done
prtdevicex:
	PRTS "UNK$"
prtdevice_done:
	PLA
	AND 	#$0F 			; FILTER OUT DEVICE
	JSR 	PRTDEC
	RTS

	.INCLUDE "dospager.asm"
;------------------------------------------------------------------------------------
;___MOVEBUFTODMA_________________________________________________________________________________________
;
;	MOVE BUFFER TO DMA
;
;________________________________________________________________________________________________________
MOVEBUFTODMA:
	PHA
	LDA	#$00                    ;
	STA     SRC
	LDA	#>MD_PAGEBU             ;
	STA	SRC+1			;
	LDA	dmaadr			;
	STA	DEST			;
	LDA	dmaadr+1		;
	STA	DEST+1			;
	JSR	COPY_DOS_SECTOR		;
	PLA
        RTS

;___MOVEDMATOBUF_________________________________________________________________________________________
;
;	MOVE DMA TO BUFFER
;
;________________________________________________________________________________________________________
MOVEDMATOBUF:
	PHA
	LDA	#$00                     ;
	STA     DEST
	LDA	#>MD_PAGEBU             ;
	STA	DEST+1			;
	LDA	dmaadr			;
	STA	SRC			;
	LDA	dmaadr+1		;
	STA	SRC+1			;
	JSR	COPY_DOS_SECTOR		;
	PLA
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

DOS65DSKYINIT:
	.BYTE 	$54,$6E,$5C,$5E,$6E,$54,$79,$40

;disk control blocks
dcba:	.word	127		;max block number
	.word	64		;sectors per track
	.word	0		;number system tracks
	.byte	1		;block size = 2048
	.word	255		;max directory number
	.word	almpa		;address of map for a
	.byte	00		;do checksums
	.word	ckmp		;checksum map
dcbb:	.word	191		;max block number
	.word	64		;sectors per track
	.word	0		;number system tracks
	.byte	1		;block size = 2048
	.word	155		;max directory number
	.word	almpb		;address of map for b
	.byte	00		;do checksums
	.word	ckmp		;checksum map
dcbc:	.word	2047		;max block number
	.word	64		;sectors per track
	.word	16		;number system tracks
	.byte	2		;block size = 4096
	.word	511		;max directory number
	.word	almpc		;address of map for C
	.byte	0		;do checksums
	.word	ckmp		;checksum map
dcbd:	.word	2047		;max block number
	.word	64		;sectors per track
	.word	16		;number system tracks
	.byte	2		;block size = 4096
	.word	511		;max directory number
	.word	almpd		;address of map for d
	.byte	0		;do checksums
	.word	ckmp		;checksum map
dcbe:	.word	2047		;max block number
	.word	64		;sectors per track
	.word	16		;number system tracks
	.byte	2		;block size = 4096
	.word	511		;max directory number
	.word	almpe		;address of map for e
	.byte	0		;do checksums
	.word	ckmp		;checksum map
dcbf:	.word	2047		;max block number
	.word	64		;sectors per track
	.word	16		;number system tracks
	.byte	2		;block size = 4096
	.word	511		;max directory number
	.word	almpf		;address of map for f
	.byte	0		;do checksums
	.word	ckmp		;checksum map
dcbg:	.word	2047		;max block number
	.word	64		;sectors per track
	.word	16		;number system tracks
	.byte	2		;block size = 4096
	.word	511		;max directory number
	.word	almpg		;address of map for g
	.byte	0		;do checksums
	.word	ckmp		;checksum map
dcbh:	.word	2047		;max block number
	.word	64		;sectors per track
	.word	16		;number system tracks
	.byte	2		;block size = 4096
	.word	511		;max directory number
	.word	almph		;address of map for h
	.byte	0		;do checksums
	.word	ckmp		;checksum map

;data area

hstwrt:		.byte	0	;0=written,1=pending host write
debtmp:		.word 0		; DEBLOCK TEMP VAR
hstact:		.byte 0		;host active flag
unacnt:		.byte 0		;unalloc rec cnt


;allocation maps
almpa:		.res	254
almpb:		.res	254
almpc:		.res	254
almpd:		.res	254
almpe:		.res	254
almpf:		.res	254
almpg:		.res	254
almph:		.res	254
;checksum maps - not used
ckmp:		.res	128

dftdskcfg:
	.byte $00,$00		;  disk A: unit,slice  (invalid for floppy and RAM disks)
	.byte $01,$00		;  disk B: unit,slice  (invalid for floppy and RAM disks)
	.byte $30,$00		;  disk C: unit,slice
	.byte $30,$01		;  disk D: unit,slice
	.byte $30,$02		;  disk E: unit,slice
	.byte $30,$03		;  disk F: unit,slice
	.byte $30,$04		;  disk G: unit,slice
	.byte $30,$06		;  disk H: unit,slice
