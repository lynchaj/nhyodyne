;__MD DRIVERS____________________________________________________________________________________________________________________
;
; 	Nhyodyne Memory disk drivers
;
;	Entry points:
;		MD_SHOW         - called during OS init
;		MD_READ_SECTOR  - read a sector from drive
;		MD_WRITE_SECTOR - write a sector to drive
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


;__MD_SHOW___________________________________________________________________________________________
;
;  Display info on MD devices
;____________________________________________________________________________________________________
;
MD_SHOW:
        PRTDBG  "MD INIT:$"
        PRTS    "MD: UNITS=2 RAMDISK=256KB ROMDISK=384KB$"
        JSR     NEWLINE
        RTS

;*__MD_READ_SECTOR____________________________________________________________________________________
;*
;*  READ MD SECTOR INTO BUFFER
;*
;*____________________________________________________________________________________________________
MD_READ_SECTOR:
        PRTDBG  "MD Read Sector$"
        JSR     GET_DRIVE_DEVICE
        AND     #$01            ; only want drive cfg
        ASL     a               ; SHIFT 6
        ASL     a               ;
        ASL     a               ;
        ASL     a               ;
        ASL     a               ;
        ASL     a               ;
        AND     #%01011111      ; TOGGLE READ
        TAX                     ; STASH CONTROL WORD
        LDA     seksec          ;
        AND     #$01            ; GET SECTOR INDEX
        CMP     #$00
        BEQ     @1
        TXA
        ORA     #%10000000      ; TOGGLE TOP HALF OF PAGE
        TAX
@1:
        JSR     MD_CONVERT_SECTOR
        TXA
        AND     #%01000000
        CMP     #$00            ; read if ram
        BEQ     :+
        INC     debcyll         ; if rom, inc bank by 4 ()
        INC     debcyll
        INC     debcyll
        INC     debcyll
:
        LDA     debcyll         ; GET BANK
        LDY     debsehd         ; GET PAGE
        PRTDBG  "DO PAGER RD$"
        JSR     MD_PAGERA
        PRTDBG  "PAGER RETURN$"
        LDA     #$00
        RTS


;*__MD_WRITE_SECTOR___________________________________________________________________________________
;*
;*  WRITE MD SECTOR FROM BUFFER
;*
;*____________________________________________________________________________________________________
MD_WRITE_SECTOR:
        PRTDBG  "MD Write Sector$"
        JSR     GET_DRIVE_DEVICE
        AND     #$01            ; only want drive cfg
        CMP     #$00            ; NO WRITE FOR ROM
        BEQ     MD_WRITE_SECTOR_RAM
        LDA     #$FF
        RTS
MD_WRITE_SECTOR_RAM:
        JSR     MD_CONVERT_SECTOR
        LDX     #%00100000      ; TOGGLE WRITE RAM (LO)
        LDA     seksec          ;
        AND     #$01            ; GET SECTOR INDEX
        CMP     #$00
        BEQ     @1
        LDX     #%10100000      ; TOGGLE WRITE RAM (HI)
@1:
        LDA     debcyll         ; GET BANK
        LDY     debsehd         ; GET PAGE
        PRTDBG  "DO PAGER WR$"
        JSR     MD_PAGERA
        PRTDBG  "PAGER RETURN$"
        LDA     #$00
        RTS

;___MD_CONVERT_SECTOR___________________________________________________________________________________
;
; 	TRANSLATE SECTORS INTO MD FORMAT
;________________________________________________________________________________________________________
MD_CONVERT_SECTOR:
        PRTDBG  "CONVERT SECTOR$"
        PHA
        TXA
        PHA
        LDA     seksec          ; LOAD SECTOR # (LOW BYTE)
        LSR     A               ; DIVIDE BY 2 (FOR BLOCKING)
        AND     #$1F            ; CLEAR UPPER 3 BITS (JUST 'CAUSE)
        STA     debsehd         ; STORE IN SECTOR/HEAD
        LDA     sektrk          ; LOAD TRACK # (LOW BYTE)
        AND     #$03            ; BOTTOM 2 BITS ARE PART OF PAGE (PAGES ARE 32k)
        ASL     a               ; MOVE TO HIGH BITS
        ASL     a
        ASL     a
        ASL     a
        ASL     a
        ORA     #$80            ; PAGES ARE ALWAYS IN UPPER BANK
        ORA     debsehd         ; STORE IN SECTOR/HEAD
        STA     debsehd         ; STORE IN SECTOR/HEAD
                                ; AT THIS POINT PAGE REGISTER SHOULD BE
                                ; SET
        LDA     sektrk          ; LOAD TRACK #
        LSR     a               ; LOSE BOTTOM TWO BITS
        LSR     a
        STA     debcyll         ; THIS SHOULD BE BANK#


        .IF     USEDSKY=1 || USEDSKYNG=1
            PRTDBG  "DSKY OUTPUT 1$"
            LDA     sekdsk
            STA     DSKY_HEXBUF
            LDA     #$00
            STA     DSKY_HEXBUF+1
            LDA     debcyll
            STA     DSKY_HEXBUF+2
            LDA     debsehd
            STA     DSKY_HEXBUF+3
            JSR     DSKY_BIN2SEG
            JSR     DSKY_SHOW
        .ENDIF
        PLA
        TAX
        PLA
        RTS
