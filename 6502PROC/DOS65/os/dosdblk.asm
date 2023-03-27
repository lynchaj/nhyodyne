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
        LDA     seksec          ;
        AND     #$03            ; GET SECTOR INDEX
        CLC                     ;
        ROL     A               ;
        TAX                     ;
        LDA     DEBTAB,X        ;
        STA     SRC
        INX
        LDA     DEBTAB,X        ;
        STA     SRC+1           ;
        LDA     #<MD_PAGEBU     ;
        STA     DEST            ;
        LDA     #>MD_PAGEBU     ;
        STA     DEST+1          ;
        JSR     COPY_DOS_SECTOR ;
        PLA
        RTS

DEBTAB:
        .WORD   hstbuf          ;
        .WORD   hstbuf+128      ;
        .WORD   hstbuf+256      ;
        .WORD   hstbuf+384      ;


;___BLKSECR512___________________________________________________________________________________________
;
;	BLOCK 512 SECTOR FOR DOS/65
;
;________________________________________________________________________________________________________
BLKSECR512:
        PHA
        LDA     seksec          ;
        AND     #$03            ; GET SECTOR INDEX
        CLC                     ;
        ROL     A               ;
        TAX                     ;
        LDA     DEBTAB,X        ;
        STA     DEST
        INX
        LDA     DEBTAB,X        ;
        STA     DEST+1          ;
        LDA     #<MD_PAGEBU     ;
        STA     SRC             ;
        LDA     #>MD_PAGEBU     ;
        STA     SRC+1           ;
        JSR     COPY_DOS_SECTOR ;
        PLA
        RTS

;___GET_DRIVE_DEVICE_____________________________________________________________________________________
;
;	GET SELECTED DEVICE TYPE AND UNIT, RETURN IN "A"
;
;________________________________________________________________________________________________________
GET_DRIVE_DEVICE:
        TXA
        PHA
        LDA     sekdsk          ; GET DRIVE
        AND     #7              ; ONLY FIRST 8 DEVICES SUPPORTED
        ASL     a               ; DOUBLE NUMBER FOR TABLE LOOKUP
        TAX                     ; MOVE TO X REGISTER
        LDA     dskcfg,X        ; GET device
        STA     STACKA
        PLA
        TAX
        LDA     STACKA
        RTS


;___COPY_DOS_SECTOR______________________________________________________________________________________
;
;	COPY 128 BYTE SECTOR FOR DOS/65
;
;________________________________________________________________________________________________________
COPY_DOS_SECTOR:
        PHA
        TYA
        PHA
        LDY     #$00            ;
COPY_DOS_SECTOR1:
        LDA     (SRC),Y         ;
        STA     (DEST),Y        ;
        INY                     ;
        TYA                     ;
        CMP     #$80            ;
        BNE     COPY_DOS_SECTOR1;
        PLA
        TYA
        PLA
        RTS

;___INIT_PAGE_COPY_______________________________________________________________________________________
;
;	COPY PAGE COPY CODE TO LORAM AT "MD_PAGEBU"
;
;________________________________________________________________________________________________________
INIT_PAGE_COPY:

        LDY     #$00
:
        LDA     INIT_PAGE_COPY_1,Y
        STA     MD_PAGEBU,Y
        INY
        CPY     #$00
        BNE     :-
        RTS
INIT_PAGE_COPY_1:
; COPY_PAGE_TO_HSTBUF
        STA     zptemp
        LDA     #<hstbuf
        STA     point
        LDA     #>hstbuf
        STA     point+1
        LDX     #$02
        LDY     #$00
:
        LDA     zptemp
        STA     MPCL_RAM        ; SET PAGE TO SOURCE
        LDA     (pointr),Y
        PHA
        LDA     #$8C            ; SET PAGE TO DRIVERSPACE
        STA     MPCL_RAM
        PLA
        STA     (point),Y
        INY
        CPY     #$00
        BNE     :-
        INC     pointr+1
        INC     point+1
        DEX
        CPX     #$00
        BNE     :-
        RTS
INIT_PAGE_COPY_2:
; COPY_HSTBUF_TO_PAGE
        STA     zptemp
        LDA     #<hstbuf
        STA     point
        LDA     #>hstbuf
        STA     point+1

        LDX     #$02
        LDY     #$00
:
        LDA     (point),Y
        PHA
        LDA     zptemp
        STA     MPCL_RAM        ; SET PAGE TO DESTINATION
        PLA
        STA     (pointr),Y
        LDA     #$8C            ; SET PAGE TO DRIVERSPACE
        STA     MPCL_RAM
        INY
        CPY     #$00
        BNE     :-
        INC     pointr+1
        INC     point+1
        DEX
        CPX     #$00
        BNE     :-
        RTS

COPY_PAGE_TO_HSTBUF = MD_PAGEBU
COPY_HSTBUF_TOPAGE = MD_PAGEBU+INIT_PAGE_COPY_2-INIT_PAGE_COPY_1
;deblocking buffer for dba
hstbuf:
        .RES    512             ;256 or 512 byte sectors
