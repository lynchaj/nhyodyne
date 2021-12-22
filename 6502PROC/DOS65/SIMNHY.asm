;--------------------------------
;dos/65 system interface module (sim)
;--------------------------------

		.include "MACRO.ASM"

USESERIAL 	= 	1	; SET TO ONE SERIAL CONSOLE IO
USEFLOPPYA 	= 	0	; SET TO ONE FOR FLOPPY = "A"
USEFLOPPYB 	= 	0	; SET TO ONE FOR FLOPPY = "B"
USEIDEC 	= 	1	; SET TO ONE FOR IDE HDD="C"
USEDSKY 	= 	0	; SEND INFO TO DSKY
DEFDRV  	=	2	; SET TO DEFAULT DRIVE LETTER
USEDISKIOV1     = 	0	; Floppy and IDE card is  DISK IO V1
USEDISKIOV3     = 	0	; Floppy and IDE card is  DISK IO V3

FLPA35		=	0	; set to 1 if floppy a is A 3.5" 80 track drive (0= 5.25" 40 track drive)
FLPB35		=	0	; set to 1 if floppy a is B 3.5" 80 track drive (0= 5.25" 40 track drive)


;dos/65 system interface module (sim)
;version 3.00
;this version is designed to work with the N8VEM Host Processor

;fixed parameters
simstart:

;my system i/o routines in rom

;pem constants on entry to write
wrall	=	0		;write to allocated
wrdir	=	1		;write to directory
wrual	=	2		;write to unallocated
;page zero and system ram assignments
dmaadr	=	$f4		;pointer for r/w
mvepnt	=	$f2		;host buffer location
OUTMSG_W =	$F0		;pointer for OutMsg
SRC	 =	$EE		;pointer for OutMsg
DEST	 =	$EC		;pointer for OutMsg

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
    	.BYTE "     ____  ____  _____    _______ ______",cr,lf
   	.BYTE "   / __ \/ __ \/ ___/  _/_/ ___// ____/",cr,lf
  	.BYTE "  / / / / / / /\__ \ _/_// __ \/___ \",cr,lf
 	.BYTE " / /_/ / /_/ /___/ //_/ / /_/ /___/ /",cr,lf
	.BYTE "/_____/\____//____/_/   \____/_____/",cr,lf
	.byte 17,"DOS/65 ON THE NHYODYNE 3.00",cr,lf,0


;cold entry from loader
boot:
	ldx	#$ff		;set stack
	txs			;pointer
	cld			;set binary mode

	PRTDBG "OS Starting$"

 	lda	#<opnmsg	;point to message
	ldy	#>opnmsg
	jsr	outmsg		;send it
				;set up jumps into dos/65 in page one
setup:	ldx	#0		;clear index
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


  .IF USEFLOPPYA=1
  	PRTDBG "Init floppy A$"
  	lda	#0			;set zero
	jsr	seldsk		;and select drive zero
	JSR	SETUPDRIVE
  .ENDIF

  .IF USEFLOPPYB=1
  	PRTDBG "Init floppy B$"
  	lda	#1		;set 1
	jsr	seldsk		;and select drive zero
	JSR	SETUPDRIVE
  .ENDIF

    .IF USEIDEC=1
    	PRTDBG "Init IDE$"
    	JSR	IDE_SOFT_RESET
  .ENDIF

  .IF USEDSKY=1
  	PRTDBG "Init DSKY$"
  	JSR	DSKYINIT
  	JSR	SEGDISPLAY
  .ENDIF

	lda	#DEFDRV		;set zero
	jsr	seldsk		;and select drive zero
	jsr	home		;home that drive

	BRK

	PRTDBG "Start CCM$"
	jmp	ccm		;and go to ccm
;initialization table
inttbl:	.byte	$4c,<wboote,>wboote,$4c,<pem,>pem
;warm boot-read dos/65 back except sim and then
; jump to ccm.


wboot:
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
	and	#3		;three lsbs only
	sta	sekdsk		;save for later
 .IF (USEFLOPPYA=1 | USEFLOPPYB=1)
	jsr	MOTOROFF	; TURN OFF ALL FLOPPY MOTORS
 .ENDIF
	LDA	sekdsk		;save for later
	asl	a		;multiply by two
	tax			;make an Index
	lda	dcbtbl,x	;get address
	ldy	dcbtbl+1,x
	rts

;table of dcb addresses
dcbtbl:	.word	dcba
	.word	dcbb
	.word	dcbc



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

	JSR	CONVERT_SECTOR_DOS	;
	JSR	READlow			;
	CMP	#$00			;
	BNE	RDABEND			;
	JSR	DEBSECR			;
	LDA	#$00			;
	RTS				;
RDABEND:				;
	LDA	#$FF			;
	RTS				;

;__READlow_______________________________________________________________________________________________
;
; 	PERFORM LOW LEVEL SECTOR READ
;________________________________________________________________________________________________________
READlow:
	LDA	sekdsk			; GET DRIVE
	CMP	#$00			;
	BNE	RDNOTA			;
     					;
  .IF USEFLOPPYA=1			;
  	JSR	READFL			;
  	JMP	RDlowEND		;
  .ENDIF

  	JMP	RDlowABEND		;
  					;
RDNOTA:					;
	CMP	#$01			;
	BNE	RDNOTB			;
					;
  .IF USEFLOPPYB=1			;
  	JSR	READFL			;
  	JMP	RDlowEND		;
  .ELSE					;
  	JMP	RDlowABEND		;
  .ENDIF				;
  					;
RDNOTB:					;
  	CMP	#$02			;
	BNE	RDNOTC			;
					;
  .IF USEIDEC=1				;
	JSR	IDE_READ_SECTOR		;
	JMP	RDlowEND		;
  .ELSE					;
  	JMP	RDlowABEND		;
  .ENDIF				;
  					;
RDNOTC:    				;
   	JMP	RDlowABEND		;
  					;
RDlowEND:
	RTS				;
RDlowABEND:				;
	LDA	#$FF			;
	RTS				;



;__WRITE_________________________________________________________________________________________________
;
; 	PERFORM DOS/65 SECTOR WRITE
;________________________________________________________________________________________________________
write:
	JSR	CONVERT_SECTOR_DOS	;
	JSR	READlow			;
	CMP	#$00			;
	BNE	WRABEND			;
	JSR	BLKSECR			;
					;
	LDA	sekdsk			; GET DRIVE
	CMP	#$00			;
	BNE	WRNOTA			;
					;
  .IF USEFLOPPYA=1			;
	JSR	WRITEFL			;
	JMP	WREND			;
  .ENDIF
 						;
  	JMP	WRABEND			;
  					;
WRNOTA:					;
	CMP	#$01			;
	BNE	WRNOTB			;
					;
  .IF USEFLOPPYB=1			;
  	JSR	WRITEFL			;
	JMP	WREND			;
  .ELSE					;
  	JMP	WRABEND			;
  .ENDIF				;
  					;
WRNOTB:					;
  	CMP	#$02			;
	BNE	WRNOTC			;
					;
  .IF USEIDEC=1				;
	JSR	IDE_WRITE_SECTOR	;
	JMP	WREND			;
  .ELSE					;
  	JMP	WRABEND			;
  .ENDIF				;
  					;
WRNOTC:    				;
   	JMP	WRABEND			;
					;
					;
WREND:  				;
	CMP	#$00			;
	BNE	WRABEND			;
	JSR	DEBSECR			;
	LDA	#$00			;
	RTS				;
WRABEND:				;
	LDA	#$FF			;
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
	jmp	SERIALSTATUS

;__CONRDE________________________________________________________________________________________________
;
; 	PERFORM DOS/65 CONSOLE READ
;________________________________________________________________________________________________________
conrde:
	jmp 	RDSER1W

;__CONWRT________________________________________________________________________________________________
;
; 	PERFORM DOS/65 CONSOLE WRITE
;________________________________________________________________________________________________________
conwrt:
	jmp 	WRSER1

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


;___CONVERT_SECTOR_DOS________________________________________________________________________________
;
; 	TRANSLATE SECTORS INTO ECB SERVER FORMAT
;________________________________________________________________________________________________________
CONVERT_SECTOR_DOS:
	LDA	sekdsk			; GET DISK #
	CMP	#$02
	BEQ	CONVERT_SECTOR_DOS1	; NOT ZERO, DO FULL TRANSLATE
	LDA	sektrk			; LOAD TRACK # (LOW BYTE)
	AND	#$01			; FILTER OUT HEAD
	STA	debhead			; STORE HEAD
	LDA	sektrk			; SAVE TRACK IN A
	LSR	A			; REMOVE HEAD BIT
	STA	debcyl			; STORE IN TRACK
	LDA	seksec			; LOAD SECTOR # (LOW BYTE)
	LSR	A			;
	LSR	A			; DIVIDE BY 4 (FOR BLOCKING)
	STA	debsec			; STORE IN SECTOR

  .IF USEDSKY=1
  	lda	sekdsk
  	sta	DSKYDISPLAY
  	lda	debhead
  	sta	DSKYDISPLAY+1
 	lda	debcyl
  	sta	DSKYDISPLAY+2
 	lda	debsec
  	sta	DSKYDISPLAY+3
  	JSR	HEXDISPLAY
  .ENDIF

	RTS

CONVERT_SECTOR_DOS1:
	LDA	sektrk			; LOAD TRACK # (LOW BYTE)
	STA	debtmp+1		;
	LDA	seksec			; LOAD SECTOR# (LOW BYTE)
	STA	debtmp			;
	JSR	RRA16			; ROTATE DEBTMP RIGHT (DIVIDE BY 2)
	JSR	RRA16			; ROTATE DEBTMP RIGHT (DIVIDE BY 2)
	LDA	sektrk+1		; GET HIGH BYTE OF TRACK INTO A
	ASL	A			;
	ASL	A
	ASL	A
	ASL	A
	ASL	A			;
	ASL	A			;
	CLC
	ORA	debtmp+1		;
	STA	debtmp+1		;
	LDA	sektrk+1		; GET HIGH BYTE OF TRACK INTO A
	LSR	A
	LSR	A
	STA	debhead			;
	LDA	debtmp			;
	STA	debsec			; LBA REGISTER IS 00TTTTSS / 4
	LDA	debtmp+1		;
	STA	debcyl		 	;
  .IF USEDSKY=1
  	lda	sekdsk
  	sta	DSKYDISPLAY
  	lda	debhead
  	sta	DSKYDISPLAY+1
 	lda	debcyl
  	sta	DSKYDISPLAY+2
 	lda	debsec
  	sta	DSKYDISPLAY+3
  	JSR	HEXDISPLAY
  .ENDIF
	RTS
RRA16:
	CLC				; CLEAR CARRY FLAG
	LDA	debtmp+1		; 16 BIT ROTATE HL WITH CARRY
	ROR	A			;
	STA	debtmp+1		; ROTATE HL RIGHT 1 BIT (DIVIDE BY 2)
	LDA	debtmp			;
	ROR	A			;
	STA	debtmp			;
	RTS

;___DEBSECR______________________________________________________________________________________________
;
;	DEBLOCK 512 BYTE SECTOR FOR DOS/65
;
;________________________________________________________________________________________________________
DEBSECR:
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
	LDA	dmaadr			;
	STA	DEST			;
	LDA	dmaadr+1		;
	STA	DEST+1			;
	JSR	COPY_DOS_SECTOR		;
	RTS

DEBTAB:
	.word	hstbuf			;
	.word	hstbuf+128		;
	.word	hstbuf+256		;
	.word	hstbuf+384		;


;___BLKSECR______________________________________________________________________________________________
;
;	BLOCK 512 BYTE SECTOR FOR DOS/65
;
;________________________________________________________________________________________________________
BLKSECR:
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
	LDA	dmaadr			;
	STA	SRC			;
	LDA	dmaadr+1		;
	STA	SRC+1			;
	JSR	COPY_DOS_SECTOR		;
	RTS


;___COPY_DOS_SECTOR______________________________________________________________________________________
;
;	COPY 128 BYTE SECTOR FOR DOS/65
;
;________________________________________________________________________________________________________
COPY_DOS_SECTOR:
	LDY	#$00			;
COPY_DOS_SECTOR1:
	LDA	(SRC),Y			;
	STA	(DEST),Y		;
	INY				;
	TYA				;
	CMP	#$80			;
	BNE	COPY_DOS_SECTOR1	;
	RTS

  .IF USESERIAL=1
	.INCLUDE "DOSSER.ASM"
  .ENDIF


    .IF USEIDEC=1
	.INCLUDE "DOSIDE.ASM"
    .ENDIF

    .IF USEFLOPPYA=1 | USEFLOPPYB=1
	.INCLUDE "DOS65\\DOSFLPV3.ASM"
    .ENDIF

    .IF USEDSKY=1
     .INCLUDE "DOS65\\DOSDSKY.ASM"
    .ENDIF

;------------------------------------------------------------------------------------


;disk control blocks
;drive a (3.5" FDD)
	.IF FLPA35=1
dcba:	.word	350		;max block number
	.word	36		;sectors per track
	.word	4		;number system tracks
	.byte	1		;block size = 2048
	.word	127		;max directory number
	.word	almpa		;address of map for a
	.byte	80		;do checksums
	.word	ckmpa		;checksum map
	.ELSE
dcba:	.word	175		;max block number
	.word	36		;sectors per track
	.word	4		;number system tracks
	.byte	1		;block size = 2048
	.word	127		;max directory number
	.word	almpa		;address of map for a
	.byte	80		;do checksums
	.word	ckmpa		;checksum map
	.endif

	.IF FLPB35=1
dcbb:	.word	350		;max block number
	.word	36		;sectors per track
	.word	4		;number system tracks
	.byte	1		;block size = 2048
	.word	127		;max directory number
	.word	almpa		;address of map for a
	.byte	80		;do checksums
	.word	ckmpa		;checksum map
	.ELSE
dcbb:	.word	175		;max block number
	.word	36		;sectors per track
	.word	4		;number system tracks
	.byte	1		;block size = 2048
	.word	127		;max directory number
	.word	almpa		;address of map for a
	.byte	80		;do checksums
	.word	ckmpa		;checksum map
	.endif

;drive c (IDE)
dcbc:	.word	2017		;max block number
	.word	256		;sectors per track
	.word	$0001		;number system tracks
	.byte	2		;block size = 4096
	.word	511		;max directory number
	.word	almpc		;address of map for C
	.byte	80		;do checksums
	.word	ckmpc		;checksum map
;data area


sekdsk:	.byte	2		;seek disk number
hstwrt:	.byte	0		;0=written,1=pending host write

;allocate the following data areas to unused ram space
LASTCHAR: 	.byte 0		;save sector for warm boot
savsec:		.byte 0		;save sector for warm boot
count:		.byte 0		;counter in warm boot
temp:		.byte 0		;save hstdsk for warm boot
hstact:		.byte 0		;host active flag
unacnt:		.byte 0		;unalloc rec cnt
sektrk:		.word 0		;seek track number
seksec:		.word 0		;seek sector number
debhead:	.byte 0		; DEBLOCKED HEAD
debcyl:		.byte 0		; DEBLOCKED CYLINDER ID
debsec:		.byte 0		; DEBLOCKED SECTOR
debtmp:		.word 0		; DEBLOCK TEMP VAR
Cdebhead: 	.byte $FF		; DEBLOCKED HEAD
Cdebcyl:	.byte $FF		; DEBLOCKED CYLINDER ID
Cdebsec:	.byte $FF		; DEBLOCKED SECTOR
DEBDIRTY:	.byte 0		; DIRTY FLAG

;allocation maps
;drive a
almpa:		.res	45
;drive b
almpb:		.res	254
;drive c
almpc:		.res	254
;checksum maps


;drive a
ckmpa:		.res	32
;drive b
ckmpb:		.res	128
;drive c
ckmpc:		.res	128
;deblocking buffer for dba
hstbuf:		.res	512		;256 or 512 byte sectors
