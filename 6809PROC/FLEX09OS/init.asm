        NAM     INIT.TXT
        OPT     pag
        PAG
        PRAGMA CD
*************************************************
*                                               *
*       flex 2.9:1 initialization code          *
*                                               *
*************************************************
STARTOFFLEX	equ	$C000
ENDOFFLEX	equ	$DEFF

;LNBUFF  equ     $C080
;STARTR  equ     $C100

;SMONTH  equ     $CC0E
;LNBUFP  equ     $CC14
;ESCRTN  equ     $CC16
;PROMPT  equ     $CC4E

;COLDST  equ     $CD00
;WARMST  equ     $CD03
;RENTER  equ     $CD06
;INCH    equ     $CD09
;INCH2   equ     $CD0C
;OUTCH   equ     $CD0F
;OUTCH2  equ     $CD12
;INBUFF  equ     $CD1B
;PSTRNG  equ     $CD1E
;PRCRLF  equ     $CD24
;INDECM  equ     $CD48
;STAT    equ     $CD4E

;ZD0F0   equ     $D0F0
;ZD0F1   equ     $D0F1

STIME   equ     $D370

;IHNDLR  equ     $D3E7
;TIMOFF  equ     $D3ED
;TIMON   equ     $D3EF
;TMINIT  equ     $D3F1
;TRMINT  equ     $D3F5
;TRMCHK  equ     $D3F7
;TIMOUT  equ     $D3F9
;TIMINE  equ     $D3FB
;ZD3FD   equ     $D3FD

;FMSCAL  equ     $D406

;ZDFD0   equ     $DFD0
;ZDFDC   equ     $DFDC
;ZDFDD   equ     $DFDD

;ZE005   equ     $E005
;ZE045   equ     $E045
;ZE085   equ     $E085
;ZE090   equ     $E090
;ZE0C5   equ     $E0C5

;ZF810   equ     $F810
;ZFFF0   equ     $FFF0
;ZFFFC   equ     $FFFC
;ZFFFD   equ     $FFFD

        page

****************************************************


*
* STARTUp rouTINE
* THIS RoutinE INITIALIZES CERTAIN PARAMETERS, GETS
* DATE From uSER, AND EXECUTES A STARTUP.TXT FILE.

        org     $C400

LOADADDR
STAR    bra     STAR0
Vers    fcb     $82,$2E,$89,$3A,$81

STAR0   lda     #$39            ;SET UP RTS
        sta     >TSTSTR          ;disable re-entry to this code
        ldd     #$CD03          ;setup 'escape routine' address
        std     >RETRNR         ;ESCRTN

        LDD     #$BFFF
        STD     MEMEND
;
;        ldd     >TRMCHK         ;get address of terminal status check routine
;        std     >DSTAT+1         ;set in FLEX status check jump
;                                ;
;        ldd     >TIMOUT         ;get address of terminal output routine
;        std     >OUTCH+1        ;set in FLEX out char jump
;        std     >OUTCH2+1       ;set in FLEX alternate out char jump
;                                ;
;        ldd     >TIMINE         ;get address of terminal input routine
;        std     >INCH+1         ;set in FLEX in char jump
;        std     >INCH2+1        ;set in FLEX alt in char jump
;

        jsr     [TINITP]         ;do terminal init

        ldx     #ZC810          ;point to Flex version signon
        jsr     >PSTRNG         ;print to terminal
        jsr     >DPCRLF         ;and CRLF
                                ;

ZC43A   ldd     >PPRMPT         ;PROMPT get  current prompt pointer
        pshs    b,a             ;save it
        ldx     #ZC82E          ;request for date - PROMPT FOR IT
        stx     >PPRMPT         ;set new prompt pointer
        jsr     >PSTRNG         ;do prompt
        jsr     >DINBUF         ;get date
        puls    b,a             ;restore prompt pointer
        std     >PPRMPT         ;
        ldy     #SYSMTH         ;SMONTH point Y reg to date regs
        bsr     ZC4A0           ;convert month from ascii
        bcs     ZC43A           ;no good - retry
                                ;
        bsr     ZC4A0           ;convert day from ascii
        bcs     ZC43A           ;no good - retry
                                ;
        bsr     ZC4A0           ;convert year from ascii
        bcs     ZC43A           ;no good - retry
                                ;
        ldy     #STIME          ;point Y reg to system time regs
        bsr     ZC4A0           ;
        bcs     ZC43A           ;no good - retry
                                ;
        bsr     ZC4A0           ;
        bcs     ZC43A           ;no good - retry
                                ;
        bsr     ZC4A0           ;
        bcs     ZC43A           ;no good - retry
        clr     STIME+3         ;clear tick counter

        jsr     >DPCRLF         ;do CRLF

        jsr     >WARM          ;init the disk drivers
        ldx     #SYSFCB         ;point to STARTUP.TXT FCB
        jsr     >CHKRDY         ;do disk check
        lda     #$01            ;set for read operation
        sta     ,x              ;
        jsr     >FMS         	;D406
        beq     ZC47E           ;no error
                                ;
        lda     $01,x           ;
        cmpa    #$04            ;file not found error?
        bne     ZC4B2           ;no -
                                ;
        jmp     >WARMS         ;yes - ignore file
                                ;
ZC47E   ldy     #LINBUF         ;init line buffer pointer
        sty     >BUFPNT         ;LNBUFP
        ldb     #$80            ;set byte count to move
                                ;
ZC488   jsr     >FMS            ;get byte from startup.txt

        bne     ZC4B2           ;error
        decb                    ;decrement count
        beq     ZC4B2           ;done
                                ;
        sta     ,y+             ;put character in line buffer
        cmpa    #$0D            ;see if EOL character
        bne     ZC488           ;no - loop
                                ;
        lda     #$04            ;yes - close file
        sta     ,x              ;
        jsr     >FMS            ;

        jmp     >RENTER         ;re-enter FLEX with command in line buffer
                                ;
*       convert ascii to decimal;
                                ;
ZC4A0   jsr     >DINDEC         ;
        pshs    x               ;
        bcs     ZC4B0           ;
        lda     ,y              ;
        tstb                    ;see if any valid decimal digits entered
        orcc    #$01            ;set carry flag for error
        beq     ZC4AE           ;no - return error
                                ;
        lda     $01,s           ;yes - get returned byte
        andcc   #$FE            ;set carry flag = 0 if no error
ZC4AE   sta     ,y+             ;put in callers buffer
ZC4B0   puls    pc,b,a          ;return

*       error in startup file - report it

ZC4B2   ldx     #ZC555          ;can't run startup message

        jsr     >PSTRNG

        jmp     >WARMS

*       fix up number of K of memory available message

ZC4BB   pshs    x,b
        ldx     #ZC82B          ;'K' message
        lda     #$04
        bra     ZC4CA

*

ZC4C4   suba    #$0A
        sta     ,x
        lda     #$01

*

ZC4CA   adda    ,-x
        ora     #$30
        sta     ,x
        cmpa    #$39
        bhi     ZC4C4
        puls    pc,x,b

*       return status that no no RTC is available
*       but mPT does exist

ZC4D6   jsr     TMINT           ;init timer
        lda     #$02            ;set flag for MPT
        rts

*       startup file error message

ZC555   fcc     "Can't run STARTUP."
        fcb     $04

*       flex startup signon message

ZC810   ;fcb     $1A               ; purpose?
        fcc     "FLEX for NHYODYNE 6809 Version 2.9:2 "
        fcb     $04,$34,$38   ; purpose?

ZC82B   fcc     "48K ram"
        fcb     $04        ; purpose?
        fcb     $04

*       date prompt

ZC82E   fcc     "Date and TIME (MM/DD/YY HH/MM/SS)? "
        fcb     $04

;        org     SYSFCB		; same data in FLX29CPP

;        fcb     $FF
;        fcb     $00
;        fcb     $00
;        fcb     $00
;        fcc     "startup"
;        fcb     $00
;        fcc     "txt"
;        fcb     $00

*************************************************
*                                               *
*       flex entry point after boot             *
*                                               *
*         this must start at $C850              *
*       N8VEM doesn't use this!                 *
*************************************************
;		org $c850
;COLDSTART
;SFRES1  orcc    #$50
        ;lds     #LNBUF
        ;ldd     >ZDFDC
        ;ldx     >ZD0F0
        ;pshs    x,b,a
        ;ldx     #$99AA
        ;ldy     #STARTR+256
        ;ldb     #$FF

;ZC867   lbsr    ZC91A
        ;stx     >ZD0F0
        ;cmpx    >ZD0F0
        ;bne     ZC888
        ;pshs    b

;ZC874   lbsr    ZC91A
        ;stb     >ZD0F1
        ;subb    #$01
        ;bcc     ZC874

        ;puls    b
        ;lbsr    ZC91A
        ;cmpb    >ZD0F1
        ;beq     ZC889
;ZC888   clra

;ZC889   sta     ,-y
        ;beq     ZC890
        ;lbsr    ZC4BB

;ZC890   subb    #$01
        ;bcc     ZC867

        ;puls    x,b,a
        ;std     >ZFFFC
        ;stx     >ZD0F0
        ;clra
        ;ldx     #STARTR
        ;ldb     >ZDFDC
        ;eorb    #$0F
        ;clr     d,x
        ;ldb     >ZDFDD
        ;eorb    #$0F
        ;clr     d,x
        ;bsr     ZC922
        ;tstb
        ;beq     ZC8B8

;ZC8B3   clr     ,y+
        ;decb
        ;bne     ZC8B3

;ZC8B8   leay    -$0C,y
        ;ldx     #ZFFF0
        ;ldb     #$10

;ZC8BF   lda     ,y+
        ;sta     ,x+
        ;decb
        ;bne     ZC8BF
        ;lda     >MEMEND
        ;asla
        ;asla
        ;asla
        ;asla
        ;clrb
        ;subd    #$0001
        ;std     >MEMEND
        ;lbsr    ZC4D6
        ;ora     >CPUTYP
        ;ldb     >ZDFD0
        ;bitb    #$F0
        ;beq     ZC8E3
        ;ora     #$01

;ZC8E3   ldb     >ZE005
        ;beq     ZC8FD
        ;cmpb    #$FF
        ;beq     ZC8FD
        ;cmpb    >ZE0C5
        ;bne     ZC8FD
        ;cmpb    >ZE045
        ;bne     ZC8FD
        ;cmpb    >ZE085
        ;bne     ZC8FD
        ;ora     #$04

;ZC8FD   ldx     >$E800
        ;pshs    x
        ;ldx     #$99AA
        ;stx     >$E800
        ;cmpx    >$E800
        ;puls    x
        ;bne     ZC911
        ;ora     #$10

;ZC911   stx     >$E800
        ;sta     >CPUTYP
        jmp     >STAR

*

;ZC91A   tfr     b,a
        ;eora    #$0F
        ;sta     >ZFFFD
        ;rts

;*

;ZC922   ldb     #$0C
        ;ldy     #ZDFD0
;*       ldx     #STARTR+16
        ;ldx     #STARTR

;ZC92B   cmpx    #STARTR+256
        ;beq     ZC93D
        ;lda     ,x+
        ;beq     ZC92B
        ;sta     ,y+
        ;inc     >MEMEND
        ;decb
        ;bne     ZC92B
        ;rts

;ZC93D   ldx     #STARTR

;ZC940   cmpx    #STARTR+16
        ;beq     ZC951
        ;lda     ,x+
        ;beq     ZC940
        ;sta     ,y+
        ;inc     >MEMEND
        ;decb
        ;bne     ZC940

ZC951   rts
