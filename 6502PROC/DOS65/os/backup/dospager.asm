;__pager_________________________________________________________________________________________________________________________
;
; 	Nhyodyne Memory page management code
;
;	Entry points:
;		PAGER_INIT          - called during OS init
;________________________________________________________________________________________________________________________________
;
; RAM BANK $0C is RAM area for Drivers
; RAM BANK $0E is operating bank for DOS/65 $8000-$FFFF
; RAM BANK $0F is fixed bank $0000-$7FFF
;
; ROM BANKS $00 and $0C-$0F are reserved for ROMWBW code
;
; ROM MEMORY PAGE CONFIGURATION LATCH CONTROL PORT
;       A15 IS INVERTED FOR THE NYHODYNE 65C02 CPU . . .
;	7 6 5 4  3 2 1 0      APPLICABLE TO THE UPPER MEMORY PAGE $8000-$FFFF
;	^ ^ ^ ^  ^ ^ ^ ^
;	: : : :  : : : :--0 = A15 ROM ONLY ADDRESS LINE DEFAULT IS 0 x
;	: : : :  : : :----0 = A16 ROM ONLY ADDRESS LINE DEFAULT IS 0
;	: : : :  : :------0 = A17 ROM ONLY ADDRESS LINE DEFAULT IS 0
;	: : : :  :--------0 = A18 ROM ONLY ADDRESS LINE DEFAULT IS 0 X
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


;__PAGER_INIT___________________________________________________________________________________________
;
;  INIT -- Copy code into $0200-$02FF for controling banking and copying
;____________________________________________________________________________________________________
PAGER_INIT:
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
;       : : : X  X X X X    = UNUSED
;	: : :-------------0 = Read=0, Write=1
;	: :---------------0 = RAM=0, ROM=1
;	:-----------------0 = LOW=0, HIGH=1
;       A= bank
;       Y= page
;
md_pagecode:
        PHA
        STY     MD_PAGESE+1     ; setup copy from pointer
        TXA
        AND     #$80
        TAY
        STY     MD_PAGESE
        TXA
        AND     #%00100000
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
        BRA     MD_PAGE_COPYFRM
MD_PAGE_ROREAD:
        LDA     #$00
        STA     MPCL_RAM
        PLA
        AND     #$7F
        STA     MPCL_ROM
MD_PAGE_COPYFRM:
; DO THE COPY
        LDX     #$00
        LDY     #$00
:
        LDA     (MD_PAGESE),Y
        STA     MD_PAGEBU,X
        INX
        INY
        CPX     #$80
        BNE     :-
        LDA     #$80
        STA     MPCL_ROM
        NOP
        NOP
        LDA     #$8C
        STA     MPCL_RAM
        NOP
        NOP
        RTS
MD_PAGE_WRITE:
        PLA
        ORA     #%10000000
        STA     MPCL_RAM
; DO THE COPY
        LDX     #$00
        LDY     #$00
:
        LDA     MD_PAGEBU,X
        STA     (MD_PAGESE),Y
        INX
        INY
        CPX     #$80
        BNE     :-
        LDA     #$8C
        STA     MPCL_RAM
        NOP
        NOP
        RTS
md_pagecodeend:
farcall:
        .IF     USEROM=1
            PHA
            LDA     #$80
            STA     MPCL_ROM
            NOP
            NOP
            LDA     #$8C
            STA     MPCL_RAM
            NOP
            NOP
            PLA
            JSR     BANKED_DRIVER_DISPATCHER
            PHA
            LDA     #$00
            STA     MPCL_RAM
            NOP
            NOP
            STA     MPCL_ROM
            NOP
            NOP
            PLA
            RTS
        .ELSE
            PHA
            LDA     #$8C
            STA     MPCL_RAM
            NOP
            NOP
            PLA
            JSR     BANKED_DRIVER_DISPATCHER
            PHA
            LDA     #$8E
            STA     MPCL_RAM
            PLA
            RTS
        .ENDIF
