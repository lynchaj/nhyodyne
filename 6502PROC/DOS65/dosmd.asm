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
        PLA
        ORA     #%10000000
        STA     MPCL_RAM
        BNE     MD_PAGE_COPYFRM
MD_PAGE_ROREAD:
        LDA     #$00000000
        STA     MPCL_RAM
        PLA
        AND     #%01111111
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
        STA     MPCL_RAM
        STA     MPCL_ROM
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
        STA     MPCL_RAM
        STA     MPCL_ROM
        RTS
md_pagecodeend:


;*__MD_READ_SECTOR____________________________________________________________________________________
;*
;*  READ MD SECTOR INTO BUFFER
;*
;*____________________________________________________________________________________________________
MD_READ_SECTOR:
		PRTDBG "MD Read Sector$"
                JSR     GET_DRIVE_DEVICE
		and 	#$01			; only want drive cfg
		LSR	a			; SHIFT 6
		LSR	a			;
		LSR	a			;
   		LSR	a			;
		LSR	a			;
		LSR	a			;
		AND 	#%01111111              ; TOGGLE READ
                TAX                             ; STASH CONTROL WORD

  	        LDA    	debcyll			; GET BANK
		LDY    	debsehd			; GET PAGE
                INC     A                       ; FIRST 8 RAM BANKS RESERVED
                INC     A
                INC     A
                INC     A
                INC     A
                INC     A
                INC     A
                INC     A
                JSR     MD_PAGERA
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
		LDA 	#$80                    ; TOGGLE WRITE RAM
                TAX                             ; STASH CONTROL WORD
 	        LDA    	debcyll			; GET BANK
		LDY    	debsehd			; GET PAGE
                INC     A                       ; FIRST 4 ROM BANKS RESERVED
                INC     A
                INC     A
                INC     A
                JSR     MD_PAGERA
		RTS
