;__MD DRIVERS____________________________________________________________________________________________________________________
;
; 	Nhyodyne Memory disk drivers
;
;	Entry points:
;		MD_INIT          - called during OS init
;		MD_READ_SECTOR  - read a sector from drive
;		MD_WRITE_SECTOR - write a sector to drive
;________________________________________________________________________________________________________________________________
;
MPCL_ROM	=	$037C		; ROM MAPPER
MPCL_RAM	=	$0378		; RAM MAPPER
MD_PAGERA       =       $0200           ; PAGE DRIVER ADDRESS
MD_PAGEBU       =       $0400           ; PAGE BUFFER ADDRESS
MD_PAGESE       =       pointr          ; PAGE SECTOR STORAGE

; RAM BANK $0C is RAM area for Drivers
; RAM BANK $0D is RAM area for Drivers
; RAM BANK $0E is operating bank for DOS/65 $8000-$FFFF
; RAM BANK $0F is fixed bank $0000-$7FFF
;
; ROM BANKS $00 and $0C-$0F are reserved for ROMWBW code
;
; ROM MEMORY PAGE CONFIGURATION LATCH CONTROL PORT
;       A15 IS INVERTED FOR THE NYHODYNE 65C02 CPU . . .
;	7 6 5 4  3 2 1 0      APPLICABLE TO THE UPPER MEMORY PAGE $8000-$FFFF
;	^ ^ ^ ^  ^ ^ ^ ^
;	: : : :  : : : :--0 = A15 ROM ONLY ADDRESS LINE DEFAULT IS 0
;	: : : :  : : :----0 = A16 ROM ONLY ADDRESS LINE DEFAULT IS 0
;	: : : :  : :------0 = A17 ROM ONLY ADDRESS LINE DEFAULT IS 0
;	: : : :  :--------0 = A18 ROM ONLY ADDRESS LINE DEFAULT IS 0
;	: : : :-----------0 = A19 ROM ONLY ADDRESS LINE DEFAULT IS 0
;	: : :-------------0 = A20 ROM ONLY ADDRESS LINE DEFAULT IS 0
;	: :---------------0 = ROM BOOT OVERRIDE DEFAULT IS 0
;	:-----------------0 = LOWER PAGE ROM SELECT (0=ROM, 1=NOTHING) DEFAULT IS 0
;
; RAM PAGE CONFIGURATION LATCH CONTROL PORT
;
;	7 6 5 4  3 2 1 0      APPLICABLE TO THE UPPER MEMORY PAGE $8000-$FFFF
;	^ ^ ^ ^  ^ ^ ^ ^
;	: : : :  : : : :--0 = A15 RAM ONLY ADDRESS LINE DEFAULT IS 0
;	: : : :  : : :----0 = A16 RAM ONLY ADDRESS LINE DEFAULT IS 0
;	: : : :  : :------0 = A17 RAM ONLY ADDRESS LINE DEFAULT IS 0
;	: : : :  :--------0 = A18 RAM ONLY ADDRESS LINE DEFAULT IS 0
;	: : : :-----------0 = A19 RAM ONLY ADDRESS LINE DEFAULT IS 0
;	: : :-------------0 = UNDEFINED DEFAULT IS 0
;	: :---------------0 = RAM BOOT OVERRIDE DEFAULT IS 0
;	:-----------------0 = LOWER PAGE RAM SELECT (0=NOTHING, 1=RAM) DEFAULT IS 0;


;__MD_INIT___________________________________________________________________________________________
;
;  INIT -- Copy code into $0200-$02FF for controling banking and copying
;____________________________________________________________________________________________________
;
MD_INIT:
        PRTDBG "MD INIT:$"
        PRTS "MD: UNITS=2 RAMDISK=256KB ROMDISK=384KB$"
       	JSR	NEWLINE
MD_REINIT:
        LDX     #$00
:
        LDA     md_pagecode,X
        STA     MD_PAGERA,X
        INX
        CPX     #$00
        BNE     :-
        RTS

;       X=Control Word
;	7 6 5 4  3 2 1 0
;	^ ^ ^ ^  ^ ^ ^ ^
;       : : X X  X X X X    = UNUSED
;	: :---------------0 = RAM=0, ROM=1
;	:-----------------0 = Read=0, Write=1
;       A= bank
;       Y= page
;
md_pagecode:
        PHA
        STY     MD_PAGESE+1     ; setup copy from pointer
        LDY     #$00
        STY     MD_PAGESE
        TXA
        AND     #%10000000
        CMP     #$00
        BNE     MD_PAGE_WRITE
; PERFORM READ HERE
        TXA
        AND     #%01000000
        CMP     #$00
        BNE     MD_PAGE_ROREAD
; DO RAM READ
        LDA     #$80
        STA     MPCL_ROM
        PLA
        ORA     #$80
        STA     MPCL_RAM
        BNE     MD_PAGE_COPYFRM
MD_PAGE_ROREAD:
        LDA     #$00
        STA     MPCL_RAM
        PLA
        AND     #$7F
        STA     MPCL_ROM
MD_PAGE_COPYFRM:
; DO THE COPY
        LDX     #$00
:
        PHX
        PLY
        LDA     (MD_PAGESE),Y
        STA     MD_PAGEBU,X
        INX
        CPX     #$00
        BNE     :-
        LDA     #$80
        STA     MPCL_ROM
        LDA     #$8E
        STA     MPCL_RAM
        RTS
MD_PAGE_WRITE:
        PLA
        ORA     #%10000000
        STA     MPCL_RAM
; DO THE COPY
        LDX     #$00
:
        PHX
        PLY
        LDA     MD_PAGEBU,X
        STA     (MD_PAGESE),Y
        INX
        CPX     #$00
        BNE     :-
        LDA     #$80
        STA     MPCL_ROM
        LDA     #$8E
        STA     MPCL_RAM
        RTS
md_pagecodeend:


;*__MD_READ_SECTOR____________________________________________________________________________________
;*
;*  READ MD SECTOR INTO BUFFER
;*
;*____________________________________________________________________________________________________
MD_READ_SECTOR:
                JSR MD_READ_RAW_SECTOR
                JSR DEBSECR256
                LDA #$00                        ; SHOULD ALWAYS SUCCEED
                RTS

MD_READ_RAW_SECTOR:
		PRTDBG "MD Read Sector$"
                JSR     GET_DRIVE_DEVICE
		and 	#$01			; only want drive cfg
		asl	a			; SHIFT 6
		asl	a			;
		asl	a			;
   		asl	a			;
		asl	a			;
		asl	a			;
		AND 	#%01111111              ; TOGGLE READ
                TAX                             ; STASH CONTROL WORD
                JSR     MD_CONVERT_SECTOR
                cpx     #$00                    ; read if ram
                BEQ     :+
                inc     debcyll                 ; if rom, inc bank by 4 ()
                inc     debcyll
                inc     debcyll
                inc     debcyll
:
  	        LDA    	debcyll			; GET BANK
		LDY    	debsehd			; GET PAGE
                PRTDBG "DO PAGER$"
                JSR     MD_PAGERA
                PRTDBG "PAGER RETURN$"
		RTS


;*__MD_WRITE_SECTOR___________________________________________________________________________________
;*
;*  WRITE MD SECTOR FROM BUFFER
;*
;*____________________________________________________________________________________________________
MD_WRITE_SECTOR:
		PRTDBG "MD Write Sector$"
                JSR     GET_DRIVE_DEVICE
		and 	#$01			; only want drive cfg
                CMP     #$00                    ; NO WRITE FOR ROM
                BEQ     MD_WRITE_SECTOR_RAM
                LDA     #$FF
                RTS
MD_WRITE_SECTOR_RAM:
                JSR     MD_READ_RAW_SECTOR
                JSR     MD_CONVERT_SECTOR
                JSR     BLKSECR256
 	        LDA    	debcyll			; GET BANK
		LDY    	debsehd			; GET PAGE
		LDX 	#$80                    ; TOGGLE WRITE RAM
                PRTDBG "DO PAGER$"
                JSR     MD_PAGERA
                PRTDBG "PAGER RETURN$"
                LDA     #$00
		RTS

;___MD_CONVERT_SECTOR___________________________________________________________________________________
;
; 	TRANSLATE SECTORS INTO MD FORMAT
;________________________________________________________________________________________________________
MD_CONVERT_SECTOR:
        PRTDBG "CONVERT SECTOR$"
        phx
	LDA	seksec			; LOAD SECTOR # (LOW BYTE)
	LSR	A			; DIVIDE BY 2 (FOR BLOCKING)
	AND 	#$1F 			; CLEAR UPPER 3 BITS (JUST 'CAUSE)
	STA	debsehd			; STORE IN SECTOR/HEAD
	LDA	sektrk			; LOAD TRACK # (LOW BYTE)
	AND 	#$03			; BOTTOM 2 BITS ARE PART OF PAGE (PAGES ARE 32k)
	asl	a			; MOVE TO HIGH BITS
	asl	a
	asl	a
	asl	a
       	asl	a
        ORA     #$80                    ; PAGES ARE ALWAYS IN UPPER BANK
	ORA	debsehd			; STORE IN SECTOR/HEAD
        STA     debsehd                 ; STORE IN SECTOR/HEAD
                                        ; AT THIS POINT PAGE REGISTER SHOULD BE
                                        ; SET
	LDA	sektrk			; LOAD TRACK #
       	LSR	a			; LOSE BOTTOM TWO BITS
	LSR	a
	STA	debcyll			; THIS SHOULD BE BANK#


  .IF USEDSKY=1 || USEDSKYNG=1
  	PRTDBG "DSKY OUTPUT 1$"
  	lda	sekdsk
  	sta	DSKY_HEXBUF
 	lda	#$00
  	sta	DSKY_HEXBUF+1
 	lda	debcyll
  	sta	DSKY_HEXBUF+2
    	lda	debsehd
  	sta	DSKY_HEXBUF+3
  	JSR	DSKY_BIN2SEG
	JSR	DSKY_SHOW
  .ENDIF
        plx
	RTS

;___DEBSECR256________________________________________________________________________________________
;
;	DEBLOCK 256 BYTE SECTOR FOR DOS/65
;
;________________________________________________________________________________________________________
DEBSECR256:
	PHA
	LDA	seksec			;
	AND	#$01			; GET SECTOR INDEX
        CMP     #$00
        BNE     DEBSECR256_H
	LDA	#$00                     ;
	STA     SRC
        JMP     DEBSECR256_GO
DEBSECR256_H:
	LDA	#$80                     ;
	STA     SRC
DEBSECR256_GO:
	LDA	#>MD_PAGEBU             ;
	STA	SRC+1			;
	LDA	dmaadr			;
	STA	DEST			;
	LDA	dmaadr+1		;
	STA	DEST+1			;
	JSR	COPY_DOS_SECTOR		;
	PLA
        RTS

;___BLKSECR256________________________________________________________________________________________
;
;	BLOCK 256 BYTE SECTOR FOR DOS/65
;
;________________________________________________________________________________________________________
BLKSECR256:
	PHA
	LDA	seksec			;
	AND	#$01			; GET SECTOR INDEX
        CMP     #$00
        BNE     BLKSECR256_H
	LDA	#$00                     ;
	STA     DEST
        JMP     BLKSECR256_GO
BLKSECR256_H:
	LDA	#$80                     ;
	STA     DEST
BLKSECR256_GO:
	LDA	#>MD_PAGEBU             ;
	STA	DEST+1			;
	LDA	dmaadr			;
	STA	SRC			;
	LDA	dmaadr+1		;
	STA	SRC+1			;
	JSR	COPY_DOS_SECTOR		;
	PLA
        RTS
