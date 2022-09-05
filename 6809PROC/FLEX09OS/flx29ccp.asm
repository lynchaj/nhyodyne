        OPT PAG
        TTL 6809 FILE MANAGEMENT SYSTEM
        PAG
        PRAGMA CD
*
* TSC 6809 DISK OPERATING SYSTEM
*
* COPYRIGHT (C) 1979 BY
*
* TECHNICAL SYSTEMS CONSULTANTS, INC.
* PO BOX 2570
* WEST LAFAYETTE, INDIANA  47906
*

*
* GLOBAL VARIABLE STARAGE
*

LINBUF  equ     $C080
CURFCB  equ     $D40B

* ASCII CODE EQUATES

NUL     equ     $00
EOT     equ     $04

* EXTERNAL LABEL EQUATES

STACK   equ     $C07F
LC400   equ     $C400
CHPR    equ     $C700



        org     $C840

SYSFCB
		fcb     $FF,0,0,0
                fcc     "startup"	; SYSTEM HANGS WHEN TRYING TO EXECUTE STARTUP.TXT
		fcb		0
		fcc		"txt"
		fcb		0

*************************************************
*                                               *
*       flex entry point after boot             *
*                                               *
*         this must start at $C850              *
*       N8VEM doesn't use this!                 *
*************************************************
		org $c850
                jmp         STAR0

LBL     equ     128         ;LINE BUFFER LENGTH

        org     $CC00

TTYBS   fcb     $08         ;$CC00   ;BACK SPACE (^H)
TTYDEL  fcb     $18         ;$CC01   ;DELETE CHARACTER (^X)
TTYEOL  fcb     $3A         ;$CC02   ;END OF LINE CHAR (:)
TTYDP   fcb     24         ;$CC03   ;LINES PER SCREEN
COLCNT  fcb     80         ;$CC04   ;COLUMNS PER LINE
TTYNL   fcb     $00         ;$CC05   ;LINE PADDING NULLS
TTYTB   fcb     $00         ;$CC06   ;TAB CHARACTER
TTYBE   fcb     $08         ;$CC07   ;BACK SPACE ECHO
TTYEJ   fcb     $00         ;$CC08   ;EJECT LENGTH
TTYPS   fcb     $00         ;$CC09   ;PAUSE CONTROL
TTYESC  fcb     $1B         ;$CC0A   ;ESCAPE CHARACTER
SYSDRV  fcb     $00         ;$CC0B   ;SYSTEM DRIVE
WRKDRV  fcb     $01         ;$CC0C   ;WORKING DRIVE
SYSFLG  fcb     $00         ;$CC0D   ;SYSTEM FLAG
SYSMTH  fcb     $00         ;$CC0E   ;SYSTEM DATE
SYSDAY  fcb     $00         ;$CC0F   ;
SYSYR   fcb     $00         ;$CC10   ;
LSTTRM  fcb     $00         ;$CC11   ;LAST TERMINATOR
USRTBL  fdb     $0000       ;$CC12   ;USER COMMAND TABLE
BUFPNT  fdb     $0000       ;$CC14   ;LINE BUFFER POINTER
RETRNR  fdb     $0000       ;$CC16   ;ESCAPE RETURN REG
CHAR    fcb     $00         ;$CC18   ;CHARACTER
PRVCHR  fcb     $00         ;$CC19   ;PREVIOUS CHARACTER
LINE    fcb     $00         ;$CC1A   ;CURRENT LINE NUMBER
OFFSET  fdb     $0000       ;$CC1B   ;LOADER ADR OFFSET
XFR     fcb     $00         ;$CC1D   ;TRANSFER FLAG
TADR    fdb     $0000       ;$CC1E   ;TRANSFER ADDRESS
ERRTYP  fcb     $00         ;$CC20   ;ERROR TYPE
SPCLS   fcb     $00         ;$CC21   ;SPECIAL IO FLAG
OUTCHN  fcb     $00         ;$CC22   ;OUTPUT CHANNEL BYTE
INCHNL  fcb     $00         ;$CC23   ;INPUT CHANNEL BYTE
FILOUT  fdb     $0000       ;$CC24   ;OUTPUT FILE ADDRESS
FILIN   fdb     $0000       ;$CC26   ;INPUT FILE ADDRESS
CMFLG   fcb     $00         ;$CC28   ;COMMAND FLAG
COLMN   fcb     $00         ;$CC29   ;CURRENT OUTPUT COL.
TMRFLG  fcb     $00         ;$CC2A   ;TIMER FLAG UNUSED NOW
MEMEND  FDB      $0000      ;$CC2B   MEMORY END
ERRVEC  fdb     $0000       ;$CC2D   ;ERROR NAME VECTOR
FILEKO  fcb     $01         ;$CC2F   ;FILE INPUT ECHO
FMSBSY  fcb     $00         ;$CC30   ;FMS IS BUSY FLAG
CP      fdb     $0000       ;$CC31   ;
CPUTYP  fcb     $00         ;$CC33   ;
PRCNT   fcb     $00         ;$CC34   ;UNUSED NOW
SPARES  fdb     0,0,0       ;$CC35   ;SPARE BYTES
XTEMP   rmb     2           ;$CC3B   ;INDEX TEMP
INDEX   rmb     2           ;$CC3D   ;INDEX TEMP STORAGE
CRSAVE  rmb     2           ;$CC3F   ;INDEX SAVE
DATPNT  rmb     2           ;$CC41   ;DATA POINTER
RETADR  rmb     2           ;$CC43   ;RETURN ADDRESS
STKSTR  rmb     2           ;$CC45   ;STACK STORAGE
IOTEMP  rmb     2           ;$CC47   ;IO TEMP STORE

* SET MAPUP TO $FF TO DISABLE MAPPING

MAPUP   fcb     $60         ;$CC49   ;MAP FILENAMES TO UPPER
OUTNUM  rmb     1           ;$CC4A   ;0 SUPPRESSION FLAG
COUNT   rmb     1           ;$CC4B   ;SPARE COUNT REGISTER
GOTFIL  rmb     1           ;$CC4C   ;FILE INDICATOR
Temp    rmb     1           ;$CC4D   ;TEMPORARY REGISTER

PPRMPT  fdb     PRMPT

WHATST  fcc     "WHAT?"
		fcb		EOT
NOTRST  fcc     "CAN'T TRANSFER"
		fcb		EOT
NONMST  fcc     "NOT FOUND"
		fcb		EOT
DSKERS  fcc     "DISK ERROR #"
		fcb		EOT
NTRST   fcc     "DRIVE NOT READY"
		fcb		EOT
COMTBL  fcc     "GET"
		fcb		0
        fdb     GET
        fcc     "MON"
        fcb		0
        fdb     MEXIT
        fcb     $00

CONTBL  fdb     10000
        fdb     1000
        fdb     100
        fdb     10

ERNM    fcc     "errors"
		fcb     0,0
		fcc		"sys"

PRMPT   fcc     "+++"
		fcb		EOT

        org     $CCC0

PINIT   rts

        org     $CCD8

PCHK    rts

        org     $CCE4

POUT    rts

        org     $CCF8

PR0     fcb     $01,$00,$00,$00
PR1     fcb     $00,$00,$00,$00

COLDS   jmp     INITI       ;GO INITIALIZE
WARMS   jmp     ENTRY       ;WARM ENTRY POINT
RENTER  jmp     DOS3        ;RE-ENTER DOS
INCH    jmp     VINCH       ;INPUT ROUTINE
INCH2   jmp     VINCH       ;TERMINAL INPUT
OUTCH   jmp     VOUTCH      ;OUTPUT CHARACTER
OUTCH2  jmp     VOUTCH      ;TERMINAL OUTPUT
DGETCH  jmp     GETCHR      ;GET CHARACTER
DPUTCH  jmp     PUTCHR      ;PUT CHARACTER
DINBUF  jmp     INBUF       ;INPUT TO BUFFER
DPSTRN  jmp     PSTRNG      ;PRINT STRING
DCLASS  jmp     CLASS       ;CLASSIFY CHARACTER
DPCRLF  jmp     PCRLF       ;PRINT CR AND LF
DNEXTC  jmp     NXTCH       ;NEXT BUFFER CHAR
RSTRIO  jmp     RESTIO      ;RESTORE IO VECTORS
DFILSP  jmp     GETFIL      ;GET FILE SPEC
DLOAD   jmp     LOAD        ;FILE LOADER
DSETEX  jmp     SETEXT      ;SET NAME EXTENSION
DADDBX  jmp     ADDBX       ;ADD B TO X
DOUTDE  jmp     OUTDEC      ;OUTPUT DECIMAL
DOUTHE  jmp     OUTHEX      ;OUT HEX CHARACTER
DRPTER  jmp     RPTERR      ;REPORT ERROR
DGETHX  jmp     GETHEX      ;GET HEX NUMBER
DOUTAD  jmp     OUTADR      ;OUT HEX ADDRESS
DINDEC  jmp     INDEC       ;GET DECIMAL NUMBER
DDOCMD  jmp     DOCMD       ;DO COMMAND LINE
DSTAT   jmp     STAT        ;TERMINAL INPUT STATUS
DSPR2   jmp     RTS
DSPR3   jmp     RTS

* INIT
*
* INIT IS THE INITIALIZATION ROUTINE.
* ALL SYSTEM VARIABLES ARE SET HERE.

INITI    lds     #STACK      ;SET STACK
INIT1   clr     LSTTRM      ;CLEAR TERM BYTE
        jsr     FMSINT      ;INIT SYSTEM

        clr     CMFLG       ;CLEAR FLAG
        jsr     TSTSTR      ;CHECK FOR STARTUP


* ENTRY
*
* ENTRY IS THE WARM START ENTRY POINT.
* THE STACK IS RESET HERE.

ENTRY   lds     #STACK      ;SET STACK
        jsr     WARM        ;DO USER WARMSTART ROUTINE
        ldx     #WARMS      ;POINT TO WARM START
        stx     RETRNR      ;SET RETURN REG
        ldx     #CHPR       ;SET SWI3 VECTOR
        stx     [SWIVECP]    ;
        ldx     IHNDLRP      ;SET IRQ VECTOR
        stx     [IRQVECP]    ;
        ldx     #PR0        ;SET PR # 0
        stx     CP          ;
        clr     PRCNT       ;SET STATUS
ENTRY2  clr     GOTFIL      ;CLEAR FILE DESIG.
        bsr     RESTIO      ;RESTORE IO

* DOS
*
* DOS IS THE MAIN DOS LOOP

DOS     lda     LSTTRM      ;CHECK TERMINATOR
        cmpa    TTYEOL      ;WAS IT EOL?

        bne     DOS2        ;
        inc     BUFPNT+1    ;RESET BUFPNT
        bra     DOS3        ;
                            ;
DOS2    tst     CMFLG       ;TEST FLAG

        lbne    RETRN       ;DO CMD RETURN
        jsr     FMSCLS      ;CLOSE ALL

        bne     INIT1       ;ERRORS?
        bsr     PRMTUSR     ;POINT TO PROMPT
                            ;
DOS3    jsr     SKPSPC      ;SKIP SPACES
        cmpa    #$0D        ;LONE CARRIAGE RET?
        beq     DOS2        ;
                            ;
DOS4    ldx     #SYSFCB     ;POINT TO SYSTEM FCB
        inc     SYSFLG      ;SET SYSTEM DRIVE
        jsr     GETFIL      ;GET FILE NAME
        bcs     NFERR       ;ERROR?
        ldx     #COMTBL     ;POINT TO TABLE
        bsr     LKNAM       ;LOOK FOR NAME
        beq     DOS6        ;FIND?

        ldx     USRTBL      ;CHECK USER TABLE
        beq     DOS8        ;IS THERE ONE?

        bsr     LKNAM       ;LOOK FOR NAME
        bne     DOS8        ;FIND?
                            ;
DOS6    jmp     [1,x]       ;JUMP TO COM ADDRESS
                            ;
DOS8    jsr     LGO         ;DO LOAD & GO
                            ;
* NFERR                     ;
                            ;
NFERR   ldx     #WHATST     ;POINT TO STRING
        lda     #$15        ;SET ERROR TYPE
NFERR1  sta     ERRTYP      ;
NFERR2  jsr     PSTRNG      ;OUTPUT IT
NFERR4  clr     LSTTRM      ;CLEAR TERM
        jmp     ENTRY       ;RESTART

* RESTIO
*
* RESTIO RESTORES THE SYSTEM IO JUMP
* VECTORS FOR INPUT, OUTPUT, & INIT.

RESTIO  ldx     OUTCH2+1    ;SET OUTPUT
        stx     OUTCH+1     ;
        ldx     INCH2+1     ;SET INPUT
        stx     INCH+1      ;
        clr     INCHNL      ;
        clr     OUTCHN      ;CLEAR OUT CHAN
        clr     SPCLS       ;SET SPECIALS
        clr     FILIN       ;CLEAR FILES
        clr     FILOUT
RTS     rts

* LKNAM
*
* LKNAM looks FOR A COMMAND
* NAME In a tABLE
*
*   ENTRy: x POINTS TO TABLE
*   EXIT:  eq IF FOUND
*          x+1 POINTS TO ADR

LKNAM   ldy     #SYSFCB+4   ;SET POINTER
LKNAM3  lda     ,y+        ;GET A NAME CHAR
        cmpa    #$5F        ;CHECK IF UPPER CASE
        bls     LKNAM4      ;SKIP IF NOT
        suba    #$20        ;MAKE UPPER
                            ;
LKNAM4  cmpa    ,x+        ;CHECK AGAINST TABLE
        bne     LKNAM6      ;BRANCH IF NO MATCH
        tst     ,x         ;CHECK IF END
        bne     LKNAM3      ;LOOP IF NOT
                            ;
        tst     ,y         ;AT END OF NAME
        beq     LKNAM8      ;GOT COMMAND IF SO
                            ;
LKNAM6  tst     ,x+        ;END OF WORD?
        bne     LKNAM6      ;LOOP TIL SO
        leax    2,x         ;BUMP PAST ADDRESS
        tst     ,x         ;END OF TABLE?
        bne     LKNAM       ;REPEAT IF NOT
        andcc   #$FB        ;CLZ SET NOT EQUAL
LKNAM8  rts

PRMTUSR ldx     PPRMPT
        bsr     PSTRNG

* INBUF
*
* INBUF inputS A LINE INTO THE LINE
* BUFFER. delETE AND BACK SPACE
* CHARACters ARE CHECKED HERE.
*
*   ENTRy: noNE
*   EXIT:  alL REGISTERS CHANGED

INBUF   ldx     #LINBUF     ;POINT TO BUFFER
        stx     BUFPNT      ;SET POINTER
INBUF2  jsr     GETCHR      ;GO GET A CHARACTER
        cmpa    TTYDEL      ;IS IT DELETE?
        beq     PRMTUSR     ;
        cmpa    TTYBS       ;IS IT BACK SPACE?
        beq     INBUF6      ;
        cmpa    #$0D        ;IS IT CARRIAGE RET?
        beq     INBUF4      ;
        cmpa    #$0A        ;IS IT LF?
        beq     INBUF7      ;
        cmpa    #$1F        ;IS IT CONTROL?
        bls     INBUF2      ;IGNORE IF SO
INBUF3  cmpx    #LINBUF+LBL-1
        beq     INBUF2
INBUF4  sta     ,x+        ;PUT CHAR IN BUFFER
        cmpa    #$0D        ;IS IT RETURN?
        bne     INBUF2      ;REPEAT IF NOT
        rts                 ;
                            ;
INBUF6  cmpx    #LINBUF     ;FRONT OF BUFFER?
        beq     PRMTUSR     ;
        leax    -1,x        ;DEC THE POINTER
        lda     TTYBE       ;GET ECHO CHAR
        cmpa    #8          ;IS IT ^H ?
        bne     INBU65      ;
        lda     #$20        ;SETUP SPACE
        jsr     PUTCH6      ;OUTPUT IT
        lda     TTYBE       ;GET CHAR
INBU65  jsr     PUTCH6      ;OUTPUT IT
        bra     INBUF2      ;REPEAT
                            ;
INBUF7  lda     #$0D        ;OUTPUT CR
        jsr     PUTCHR      ;
        lda     #$20        ;SETUP SPACE
        bra     INBUF3

* PSTRNG
*
* PSTRNG prinTS THE STRING POINTED
* TO BY the iNDEX REGISTER.
*
*   ENTRy: x POINTS TO STRING
*   EXIT:  a & X CHANGED

PSTRNG  bsr     PCRLF       ;OUTPUT CR & LF

PDATA1  lda     ,x         ;GET A CHARACTER
        cmpa    #4          ;IS IT TERM?
        beq     PCRLF8      ;
        jsr     PUTCHR      ;GO PUT CHAR.
        leax    1,x         ;BUMP THE POINTER
        bra     PDATA1      ;REPEAT IT

* BREAK
*
* BREAK checkS FOR A CHARACTER ON INPUT CHANNEL,
* RETURNs immEDIATELY IF NONE OR NOT ESCAPE.
* IF ESCape, WAITS FOR ANOTHER OR FOR RETURN.

BREAK   jsr     DSTAT       ;ANY INPUT CHARACTER?
        beq     PCRLF9      ;EXIT IF NOT
                            ;
        jsr     [INCHNEP]   ;ELSE, GET THE CHARACTER
        anda    #$7F        ;STRIP UPPER BIT
        cmpa    TTYESC      ;AN ESCAPE?
        bne     PCRLF9      ;EXIT IF NOT
                            ;
BREAK1  clr     LINE        ;CLEAR LINE COUNT
BREAK2  jsr     [INCHNEP]   ;WAIT FOR A CHARACTER
        anda    #$7F        ;STRIP UPPER BIT
        cmpa    TTYESC      ;AN ESCAPE?
        beq     PCRLF9      ;CONTINUE IF SO
        cmpa    #$0D        ;IS IT A C.R.?
        bne     BREAK2      ;LOOP IF NEITHER
        clr     LSTTRM      ;CLEAR TERMINATOR
        jmp     [RETRNR]    ;JUMP TO RETURN REG

* PCRLF
*
* PCRLF outpuTS A CARRIAGE RETURN
* AND A line FEED COMBINATION.
*
*   ENTRY: NONE
*   EXIT:  A & B CHANGED

PCRLF   tst     SPCLS       ;TEST SPECIALS
        bne     PCRLF2      ;
        ;bra     PCRLF2      ;
        bsr     BREAK       ;CHECK FOR BREAK
        lda     TTYDP       ;GET COUNT
        beq     PCRLF2      ;IS IT OFF?
                            ;
        cmpa    LINE        ;CHECK COUNT
        bhi     PCRL19      ;
        clr     LINE        ;CLEAR COUNT
        tst     TTYPS       ;PAUSE ON?
        beq     PCRLF1      ;
        bsr     BREAK1      ;WAIT FOR ESC
                            ;
PCRLF1  pshs    b           ;SAVE B
        ldb     TTYEJ       ;CHECK COUNT
        beq     PCRL18      ;
PCRL15  bsr     PCRLF2      ;OUTPUT CR & LF
        decb                ;DEC THE COUNT
        bne     PCRL15      ;
                            ;
PCRL18  puls    b           ;RESTORE B
PCRL19  inc     LINE        ;BUMP LINE COUNT
PCRLF2  lda     #$0D        ;SET UP CR
        bsr     PUTCHR      ;OUTPUT IT
        lda     #$0A        ;SET UP LINE FEED
        bsr     PUTCHR      ;OUTPUT IT
        ;rts					; !!!
        pshs    b           ;SAVE B
        ldb     TTYNL       ;CHECK NULLS
        beq     PCRLF6      ;
PCRLF4  clra                ;SET UP NULL
        bsr     PUTCHR      ;OUTPUT IT
        decb                ;DEC THE COUNT
        bne     PCRLF4      ;REPEAT?
                            ;
PCRLF6  puls    b           ;RESTORE B
PCRLF8  andcc   #$FE        ;CLC  CLEAR ERRORS
PCRLF9  rts

* GETCHR
*
* GETCHR gets A CHARACTER FROM EITHER
* THE STandarD INPUT OR A FILE.
*
*   ENTRy: noNE
*   EXIT:  a HAS CHARACTER

GETCHR  tst     INCHNL      ;CHECK CHAN
        bne     GETCH5      ;
        tst     FILIN       ;FILE INPUT?
        beq     GETCH4      ;
        bsr     FILIO       ;DO FILE INPUT
        tst     FILEKO      ;ECHO CHARACTER?
        beq     GETCH6      ;
        tst     FILOUT      ;OUTPUT FILE?
        beq     GETCH6      ;
        bsr     PUTCH6      ;ECHO CHARACTER
        bra     GETCH6      ;
                            ;
GETCH4  jsr     INCH        ;GET CHAR
        bra     GETCH6      ;
                            ;
GETCH5  jsr     INCH2       ;TERMINAL INPUT
GETCH6  clr     LINE        ;CLEAR COUNTER
        rts

* FILIO
*
* FILIO dose A FMS CALL FOR CHARACTER
* IO TRAnsfer. CONTROL RETURNED TO
* WARM Start UPON ERROR.

FILIO   stx     IOTEMP      ;SAVE INDEX
        ldx     FILIN       ;GET INPUT FCB
        bra     FILIO4      ;
                            ;
FILIO2  stx     IOTEMP      ;SAVE X
        ldx     FILOUT      ;GET OUTPUT FCB
                            ;
FILIO4  jsr     FMS         ;CALL FMS
        bne     FILIO6      ;ERROR?
        ldx     IOTEMP      ;RESTORE INDEX
        rts                 ;
                            ;
FILIO6  clr     FILOUT      ;CLEAR CHAN
        jsr     RPTERR      ;REPORT ERROR
        jmp     WARMS       ;DO WARM START

* PUTCHR
*
* PUTCHR writES A CHARACTER TO EITHER
* THE STandarD OUTPUT OR TO A FILE.
*
*   ENTRy: chARACTER IN A
*   EXIT:  a MAY BE DESTROYED

PUTCHR  tst     SPCLS       ;CHECK SPECIALS
        bne     PUTCH6      ;
        cmpa    #$1F        ;IS IT CONTROL?
        bhi     PUTCH2      ;
        clr     COLMN       ;CLEAR COL COUNT
        bra     PUTCH6      ;JUMP AHEAD
                            ;
PUTCH2  inc     COLMN       ;BUMP COUNTER
        pshs    a           ;SAVE CHARACTER
        lda     COLCNT      ;GET COUNT
        beq     PUTCH4      ;IS IT 0?
        cmpa    COLMN       ;ENOUGH?
        bcc     PUTCH4      ;
        jsr     PCRLF       ;OUTPUT CR & LF
        inc     COLMN       ;
                            ;
PUTCH4  puls    a           ;RESTORE CHAR
PUTCH6  pshs    a           ;
        tst     OUTCHN      ;TEST CHANNEL
        bne     PUTCH7      ;
        tst     FILOUT      ;FILE OUTPUT?
        beq     PUTC68      ;
        bsr     FILIO2      ;DO FMS CALL
        bra     PUTC75      ;
                            ;
PUTC68  tst     FILIN       ;
        bne     PUTC75      ;FILE INPUT?
        jsr     OUTCH       ;OUTPUT IT
        bra     PUTC75      ;
                            ;
PUTCH7  jsr     OUTCH2      ;CHAN 2 OUTPUT
PUTC75  puls    a           ;RESTORE CHAR
        rts

* OUTDEC
*
* OUTPUT deciMAL NUMBER POINTED TO
* BY X. the nS ENTRY PRINTS LEADING
* ZEROES.
*
*   ENTRy: x POINTS TO NUMBER
*   EXIT:  alL CHANGED

OUTDEC  clr     OUTNUM      ;CLEAR FLAG
        stb     XFR         ;SET SUP FLAG
        lda     #4          ;SET COUNTER
        sta     Temp        ;SAVE IT
        ldd     ,x         ;GET VALUE
        ldx     #CONTBL     ;POINT TO CONSTANTS
                            ;
OUTDE4  bsr     OUTDIG      ;OUTPUT DIGIT
        leax    2,x         ;BUMP TO NEXT CONST.
        dec     Temp        ;DEC THE COUNT
        bne     OUTDE4      ;
        tfr     b,a         ;GET LS DIGIT
        bra     OUTHR       ;OUTPUT IT

* OUTDIG
*
* OUTDIG outpUTS THE DIGITS PLACE
* OF THE numbER IN A & B CORRESPONDING
* TO THE consTANT POINTED TO BY X.
*
*   ENTRy: a & B CONTAIN NUMBER
*          x POINTS TO CONSTANT
*   EXIT:  alL REGISTERS PRESERVED

OUTDIG  clr     COUNT       ;CLEAR COUNTER
OUTDI2  cmpd    ,x          ;COMPARE NUMBER
        bcs     OUTDI5      ;
        subd    ,x          ;SUB VALUE
        inc     COUNT       ;BUMP COUNTER
        bra     OUTDI2      ;REPEAT
                            ;
OUTDI5  pshs    a           ;SAVE A
        lda     COUNT       ;GET TOTAL
        bne     OUTDI6      ;IS IT ZERO?
        tst     OUTNUM      ;SUPRESS ZEROES?
        bne     OUTDI6      ;NUMBER YET?
        tst     XFR         ;NULL OR SPACE?
        beq     OUTDI8      ;
        lda     #$20        ;SETUP SPACE
        bsr     OUTHR2      ;OUTPUT IT
        bra     OUTDI8

OUTDI6  inc     OUTNUM      ;SHOW NUMBER
        bsr     OUTHR       ;OUTPUT DIGIT

OUTDI8  puls    a,pc        ;RESTORE A & RETURN

* OUTADR
*
* OUTPUT four HEX DIGITS POINTED
* TO BY the iNDEX REGISTER.

OUTADR  bsr     OUTHEX      ;OUT 2 DIGITS
        leax    1,x         ;BUMP POINTER

* OUTHEX
*
* OUTHEX outpUTS THE BYTE IN HEX
* POINTEd to BY X.
*
*   ENTRy: x POINTS TO BYTE
*   EXIT:  b PRESERVED

OUTHEX  lda     ,x          ;GET MSB
        bsr     OUTHL       ;OUTPUT IT
        lda     ,x          ;DO LSB
        bra     OUTHR       ;OUTPUT IT
                            ;
OUTHL   lsra                ;GET MSB TO LSB
        lsra
        lsra
        lsra

OUTHR   anda    #$0F        ;MASK OFF MSB
        adda    #$30        ;ADD IN BIAS
        cmpa    #$39        ;OVER NUMBERS?
        bls     OUTHR2

        adda    #7          ;FINISH BIAS

OUTHR2  jmp     PUTCHR      ;OUTPUT IT

* CLASS
*
* CLASS will CLASSIFY THE CHARACTER IN A.
*
*   ENTRy: chARACTER IN A
*   EXIT:  cs IF NOT 0-9 OR A-Z

CLASS   cmpa    #$30        ;IS IT 0?
        bcs     CLASS2      ;REPORT
        cmpa    #$39        ;COMPARE TO 9
        bls     CLASS4      ;IS IT NUMBER?
        cmpa    #$41        ;COMPARE TO A
        bcs     CLASS2      ;REPORT
        cmpa    #$5A        ;COMPARE TO Z
        bls     CLASS4      ;IS IT LETTER?
        cmpa    #$61        ;CHECK FOR LOWER
        bcs     CLASS2      ;REPORT
        cmpa    #$7A        ;UPPER LIMIT
        bls     CLASS4

CLASS2  orcc    #1          ;SEC  SET FOR NOT
        sta     LSTTRM
        rts

CLASS4  andcc   #$FE        ;CLC  SHOW ALPHANUMERIC
        rts

* NXTCH
*
* NXTCH gets THE NEXT CHARACTER FROM
* THE LIne buFFER.
*
*   ENTRy: noNE
*   EXIT:  a HAS CHARACTER

NXTCH   pshs    x
        ldx     BUFPNT      ;GET POINTER
        lda     CHAR        ;GET OLD CHAR
        sta     PRVCHR      ;SAVE AS PREVIOUS
NXTCH3  lda     ,x+        ;GET THE CHARACTER
        sta     CHAR        ;SAVE CHAR
        cmpa    #$0D        ;IS IT RETURN?
        beq     NXTCH4      ;
        cmpa    TTYEOL      ;IS IT EOL?
        beq     NXTCH4      ;
        stx     BUFPNT      ;SAVE NEW POSITION
        cmpa    #$20        ;CHECK FOR SPACE
        bne     NXTCH4      ;
        cmpa    ,x          ;NEXT CHAR SPACE?
        beq     NXTCH3      ;SKIP IF SO
                            ;
NXTCH4  bsr     CLASS       ;GO CLASSIFY
        puls    x,pc        ;RESTORE REG. & RETURN

* GETFIL
*
* GETFIL gets A FILE SPECIFICATION FROM
* THE INput sTREAM.
*
*   ENTRy: x POINTS TO FCB
*   EXIT:  alL REGISTERS CHANGED

GETFIL  lda     #21         ;SET PRE ERROR
        sta     1,x         ;
        lda     #$FF        ;SET DRIVE NEG
        sta     3,x         ;
        clr     4,x         ;
        clr     12,x        ;CLEAR EXTENSION
        jsr     SKPSPC      ;SKIP SPACES
        lda     #8          ;SET UP COUNT
        sta     COUNT       ;SAVE IT
        bsr     PRTM        ;PROCESS ITEM
        bcs     GETFI5      ;ERROR?
        bne     GETFI2      ;CHECK TERM
        bsr     PRTM        ;PROCESS ITEM
        bcs     GETFI5      ;ERROR?
        bne     GETFI2      ;CHECK TERM
        cmpx    CRSAVE      ;CHECK ERROR?
        beq     PRTM6       ;
        bsr     PRTM        ;PROCESS ITEM
        bls     PRTM6       ;ERROR?
                            ;
GETFI2  ldx     CRSAVE      ;RESTORE POINTER
        tst     4,x         ;IS NAME NULL?
        beq     PRTM6       ;
        tst     3,x         ;CHECK DRIVE NUMBER
        bpl     GETFI4      ;SET YET?
        tst     SYSFLG      ;SYSTEM DRIVE?
        beq     GETFI3      ;
        lda     SYSDRV      ;GET SYSTEM DRIVE
        bra     GETF35      ;
                            ;
GETFI3  lda     WRKDRV      ;GET WORK DRIVE
GETF35  sta     3,x         ;SET DRIVE NUMBER
GETFI4  clr     SYSFLG      ;CLEAR FLAG
GETFI5  ldx     CRSAVE      ;RESTORE FCB
        rts

* PRTM
*
* PRTM ProcesSES AN ITEM OF THE FILE SPEC

PRTM    bsr     NXTCH       ;GET NEXT CHAR
        bcs     PRTM6       ;ERROR?
        cmpa    #$39        ;CHECK IF NUMBER
        bhi     PRTM2       ;
        ldx     CRSAVE      ;RESTORE POINTER
        tst     3,x         ;CHECK FOR DRIVE NO
        bpl     PRTM6       ;ERROR?
        anda    #3          ;MASK DRIVE
        sta     3,x         ;SET DRIVE NUM
        jsr     NXTCH       ;GET NEXT CHAR
        bcc     PRTM6       ;ERROR?
                            ;
PRTM1   cmpa    #$2E        ;CHECK TERM
        andcc   #$FE        ;CLC  CLEAR ERROR
        rts                 ;
                            ;
PRTM2   ldb     COUNT       ;GET COUNT
        bmi     PRTM6       ;ERROR?
        pshs    b           ;SAVE COUNT
        subb    #5          ;SET NEW COUNT
        stb     COUNT       ;SAVE IT
        puls    b           ;RESTORE OLD
                            ;
PRTM3   cmpa    MAPUP       ;CHECK FOR LOWER CASE
        bcs     LD0AE       ;SKIP IF NOT
        suba    #$20        ;CONVERT TO UPPER
                            ;
LD0AE   sta     4,x         ;PUT CHARACTER
        leax    1,x         ;BUMP THE POINTER
        decb                ;DEC THE COUNT
        jsr     NXTCH       ;GET NEXT CHAR
        bcc     PRTM5       ;TERM CHAR?
        cmpa    #$2D        ;IS IT HYPHEN?
        beq     PRTM5       ;
                            ;
        cmpa    #$5F        ;IS IT UNDER SCORE?
        bne     PRTM7       ;
                            ;
PRTM5   tstb                ;CHECK COUNT
        bne     PRTM3       ;REPEAT
                            ;
PRTM6   orcc    #1          ;SEC  SET ERROR
        rts                 ;
                            ;
PRTM7   tstb                ;CHECK COUNT
        beq     PRTM1       ;FINISHED?
                            ;
        clr     4,x         ;CLEAR REST
        leax    1,x         ;BUMP POINTER
        decb                ;DEC THE COUNT
        bra     PRTM7       ;REPEAT

* SKPSPC
*
* SKPSPC skipS SPACES IN THE BUFFER
*
*   ENTRy: noNE
*   EXIT:  alL CHANGED

SKPSPC  stx     CRSAVE      ;SAVE INDEX
        ldx     BUFPNT      ;GET POINTER
                            ;
SKPSP2  lda      ,x          ;GET CHARACTER
        cmpa    #$20        ;IS IT SPACE?
        bne     SKPSP4      ;
                            ;
        leax    1,x         ;BUMP TO NEXT
        bra     SKPSP2      ;REPEAT
                            ;
SKPSP4  stx     BUFPNT      ;SET POINTER
        ldx     CRSAVE      ;RESTORE REGISTER
        rts

* SETEXT
*
* SETEXT sets A DEFAULT NAME EXTENSION
* IF THE exteNSION IS NULL. IT IS SET
* ACCORDing tO THE CODE IN A.
*
*   ENTRy: a HAS CODE
*          x POINTS TO FCB
*   EXIT:  alL REGISTERS CHANGED

SETEXT  pshs    x,y         ;SAVE REGISTERS
        ldb     12,x        ;GET FIRST EXT
        bne     SETEX6      ;NULL?
                            ;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;leay    <EXTTBL,pc  ;POINT TO TABLE
        FCB     $31,$8C,$1D             ; ASSEMBLER ERROR??
        cmpa    #$0F        ;CHECK RANGE
        bhi     SETEX6      ;
        ldb     #3          ;GET TO DESIRED EXT.
        mul                 ;
        leay    d,y         ;
        ldb     #3          ;GET EXTENSION LENGTH
                            ;
SETEX4  lda     ,y+        ;GET CHAR
        cmpa    MAPUP       ;IS IT LOWER CASE?
        bcs     SETEX5      ;NO
        suba    #$20        ;YES - MAKE UPPER CASE
                            ;
SETEX5  sta     12,x        ;PUT IN EXT
        leax    1,x         ;BUMP POINTER
        decb                ;THE COUNT
        bne     SETEX4      ;FINISHED?
                            ;
SETEX6  puls    x,y,pc      ;RESTORE REGS. & RETURN

* EXTTBL
*
* EXTENSion cODE TABLE

EXTTBL  fcc     "bin"   ;CODE 0
        fcc     "txt"   ;CODE 1
        fcc     "cmd"   ;CODE 2
        fcc     "bas"   ;CODE 3
        fcc     "sys"   ;CODE 4
        fcc     "bak"   ;CODE 5
        fcc     "scr"   ;CODE 6
        fcc     "dat"   ;CODE 7
        fcc     "bac"   ;CODE 8
        fcc     "dir"   ;CODE 9
        fcc     "prt"   ;CODE 10
        fcc     "out"   ;CODE 11
        fcc     "rel"   ;CODE 12
        fcc     "rfi"   ;CODE 13
        fcc     "dev"   ;CODE 14
        fcc     "arc"   ;CODE 15

* GETHEX
*
* GETHEX gets A HEX VALUE FROM THE
* INPUT buffeR.  B IS NON ZERO IF
* THERE was a NUMBER.
*
*   ENTRy: noNE
*   EXIT:  cs IF ERROR
*          vaLUE IN X

GETHEX  jsr     CLROFS      ;CLEAR SPACE & B REG
GETHE2  jsr     NXTCH       ;GET CHARACTER
        bcs     GETHE8      ;GRAPHICS?
                            ;
        bsr     TSTHEX      ;TEST FOR HEX
        bcs     GETHE6      ;ERROR?
                            ;
        pshs    b           ;SAVE IND
        ldb     #4          ;SET UP COUNT
                            ;
GETHE4  asl     OFFSET+1    ;SHIFT OVER 4
        rol     OFFSET      ;
        decb                ;DEC THE COUNT
        bne     GETHE4      ;LOOP TIL DONE
                            ;
        puls    b           ;RESTORE IND
        adda    OFFSET+1    ;
        sta     OFFSET+1    ;SET NEW DIGIT
        incb                ;SET INDICATOR
        bra     GETHE2      ;
                            ;
GETHE6  jsr     NXTCH       ;GET CHARACTER
        bcc     GETHE6      ;WAIT FOR TERM
        rts                 ;
                            ;
GETHE8  ldx     OFFSET      ;GET VALUE
GETHE9  andcc   #$FE        ;CLC  CLEAR ERRORS
        rts

* TSTHEX
*
* TEST For vaLID HEX CHARACTER

TSTHEX  cmpa    #$5F
        bls     TSTHE2
        suba    #$20

TSTHE2  suba    #$47        ;REMOVE BIAS
        bpl     TSTHE4      ;
                            ;
        adda    #6          ;CHECK RANGE
        bpl     TSTHE3      ;ERROR?
                            ;
        adda    #7          ;ADD BACK IN
        bpl     TSTHE4      ;ERROR?
                            ;
TSTHE3  adda    #$0A        ;FINAL BIAS
        bpl     GETHE9      ;NO ERROR

TSTHE4  orcc    #1
        rts

* INDEC
*
* INPUT decimAL NUMBER.
*
*   ENTRy: noNE
*   EXIT:  cs IF ERROR
*          vaLUE IN X
*          b=0 IF NO NUMBER

INDEC   jsr     CLROFS      ;CLEAR SPACE & B REG.
INDEC2  jsr     NXTCH       ;GET CHARACTER
        bcs     GETHE8      ;TERM?
        cmpa    #$39        ;CHECK FOR NUMBER
        bhi     GETHE6      ;
        anda    #$0F        ;MASK NUMBER
        pshs    b           ;SAVE COUNT
        pshs    a           ;SAVE NUMBER
        ldd     OFFSET      ;GET VALUE
        aslb                ;DO TIMES 8
        rola                ;
        aslb                ;
        rola                ;
        addd    OFFSET      ;PLUS TIMES 2
        aslb                ;
        rola                ;
        addb    ,s+        ;ADD IN NEW DIGIT
        adca    #0          ;
        std     OFFSET      ;SAVE RESULT
        puls    b           ;GET COUNT
        incb                ;BUMP COUNT
        bra     INDEC2      ;REPEAT

* LOAD
*
* LOAD Is the SYSTEM BINARY LOADER
*
*   ENTRy: x POINTS TO FCB
*   EXIT:  waRMS IF ERROR
*          alL RGISTERS CHANGED

LOAD    clr     XFR         ;CLEAR TRANSFER FLAG
LOAD2   bsr     DOFMS       ;DO READ
        cmpa    #2          ;BEGIN DESIGNATOR?
        beq     LOAD4       ;YES - GET DATA COUNT
                            ;
        cmpa    #$16        ;TRANSFER DESIG?
        bne     LOAD2       ;
        bsr     DOFMS       ;GET NEXT CHAR
        sta     TADR        ;SET TRANSFER ADR
        bsr     DOFMS       ;GET LSB
        sta     TADR+1      ;SAVE IT
        lda     #1          ;SET NON ZERO
        sta     XFR         ;SET TRANSFER FLAG
        bra     LOAD2       ;REPEAT
                            ;
LOAD4   bsr     DOFMS       ;GET NEXT CHAR
        tfr     a,b         ;SAVE IT
        bsr     DOFMS       ;GET REST
        exg     a,b         ;PUT IN ORDER
        addd    OFFSET      ;OFFSET + ADDRESS
        std     INDEX       ;SAVE POINTER
        bsr     DOFMS       ;GET DATA COUNT
        tfr     a,b         ;MOVE TO B
        tsta                ;ZERO COUNT?
        beq     LOAD2       ;YES -
                            ;
LOAD6   bsr     DOFMS       ;GET CHARACTER
        ldx     INDEX       ;GET POINTER
        sta     ,x+        ;SAVE IN MEMORY
        stx     INDEX       ;SAVE POINTER
        decb                ;DEC THE COUNT
        bne     LOAD6       ;FINISHED?
        bra     LOAD2       ;REPEAT

* DOFMS
*
* DOFMS does AN IO TRANSFER TO THE
* FILE Mgmnt SYSTEM.
*
*   ENTRy: noNE
*   EXIT:  saME AS FMS COMMAND

DOFMS   ldx     #SYSFCB     ;POINT TO FCB
        jsr     FMS         ;DO COMMAND
        beq     LD20B       ;ERROR?
                            ;
        lda     1,x         ;GET ERROR CODE
        cmpa    #8          ;IS IT EOF?
        bne     DOFMS4      ;
                            ;
        leas    2,s         ;FIX STACK
        lda     #4          ;SET CMND
        sta     ,x          ;
        jsr     FMS         ;CALL FMS
        bne     DOFMS6      ;ERROR?
                            ;
LD20B   andcc   #$FE        ;CLC  CLEAR ERROR
        rts                 ;
                            ;
DOFMS4  sta     ERRTYP      ;SET TYPE
        cmpa    #4          ;NO FILE ERROR?
        beq     LD287       ;YES -
                            ;
DOFMS6  bsr     RPTERR      ;REPORT ERROR
        jmp     NFERR4      ;DO WARM START

* GET
*
* GET IS the DOS COMMAND USED TO
* LOAD Binary FILES INTO MEMORY.
*
*   ENTRy: noNE
*   EXIT:  alL REGISTERS CHANGED

GET     lda     #0          ;SET DEFAULT CODE
        bsr     GETOPN      ;GET & OPEN FILE
        bcs     TSTNAM      ;NO NAME?
        bsr     CLROFS      ;CLEAR OFFSET
        inc     GOTFIL      ;SET FILE INDIC.
        bsr     LOAD        ;GO DO LOAD
        bra     GET         ;REPEAT PROCESS

* CLROFS
*
* CLEARS storAGE LOC. OFFSET

CLROFS  clra
        clrb
        std     OFFSET
        rts

* TSTNAM
*
* TSTNAM testS TO SEE IF ANY NAMES HAVE
* BEEN ProcesSED YET.

TSTNAM  ldb     GOTFIL      ;CHECK FLAG
        lbeq    NFERR       ;REPORT ERROR
        jmp     WARMS       ;ALL DONE

* LGO
*
* LGO IS the SYSTEM LOAD AND GO MODULE.
*
*   ENTRy: noNE
*   EXIT:  alL CHANGED

LGO     lda     #2          ;SET DEFAULT CODE
        bsr     GETOP2      ;OPEN FILE
        bsr     CLROFS      ;CLEAR OFFSET
        jsr     LOAD        ;GO DO LOAD
        ;                    ;
        ldb     XFR         ;CHECK FOR TRANSFER ADR
        beq     LGO2        ;
        jmp     [TADR]      ;JUMP TO XFR ADR
                            ;
LGO2    ldx     #NOTRST     ;POINT TO STRING
        lda     #$81        ;SET TYPE
        jmp     NFERR1      ;REPORT

* GETOPN
*
* GETOPN gets THE FILES NAME FROM
* THE INput bUFFER AND OPENS THE FILE
*
*   ENTRy: a HAS DEFAULT CODE
*   EXIT:  alL CHANGED

GETOPN  pshs    a           ;SAVE CODE
        ldx     #SYSFCB     ;POINT TO FCB
        jsr     GETFIL      ;GET FILE SPEC
        puls    a           ;RESTORE CODE
        bcs     GETOP4      ;ERROR?
                            ;
GETOP2  ldx     #SYSFCB     ;POINT TO FCB
        jsr     SETEXT      ;SET EXTENSION
        ldx     #SYSFCB     ;POINT TO FCB
        lda     #1          ;SET OPEN CODE
        sta     ,x          ;SET COMMAND
        jsr     DOFMS       ;GO DO FMS
        lbcs    NONMER      ;REPORT ANY ERROR
        lda     #$FF        ;SET NEG
        sta     59,x        ;SET FOR NO SPC COMP
        rts                 ;
                            ;
GETOP4  lda     LSTTRM      ;GET TERM
        cmpa    #$0D        ;IS TERM CR?
        beq     LD287       ;YES -
                            ;
        cmpa    TTYEOL      ;IS IT EOL?
        lbne    NFERR       ;ERROR IF NEITHER
                            ;
LD287   orcc    #1          ;SEC  SET TERM INDICATOR
        rts

* RPTERR
*
* RPTERR repoRTS FMS ERRORS

RPTERR  pshs    x,y         ;SAVE REGISTERS
        lda     1,x         ;GET ERR NUM
        sta     ERRTYP      ;SAVE IT
        beq     RPTE44      ;
        jsr     RESTIO      ;RESTORE IO
        ldy     ERRVEC      ;GET ERR VECTOR
        bne     RPTER1      ;
        cmpa    #$10        ;NOT READY ERROR
        beq     RPTER6      ;
        ldy     #ERNM       ;POINT TO STRING
                            ;
RPTER1  ldx     #SYSFCB     ;POINT TO FCB
        tst     2,x         ;
        beq     RPTER2      ;
                            ;
        lda     #4          ;CLOSE FILE IN FCB
        sta     ,x          ;
        jsr     FMS         ;CALL FMS
        bne     RPTER4      ;
                            ;
RPTER2  ldx     #SYSFCB-8   ;SET TO FCB
        ldb     #$0B        ;SET COUNT
        bsr     RPTER9      ;COPY NAME TO FCB
        ldx     #SYSFCB     ;
        lda     SYSDRV      ;SET ALL DRIVES ** CHANGED TO SYS ** 2-25-79
        sta     3,x         ;
        lda     #1          ;SET EXTENSION
        sta     ,x          ;OPEN FOR READ
        jsr     FMS         ;
        bne     RPTER4      ;ERROR?
                            ;
        lda     ERRTYP      ;GET ERROR NUM
        deca                ;CALCULATE REC NUM
        asra                ;
        asra                ;
        inca                ;
        clr     32,x        ;SET LRN IN FCB
        sta     33,x        ;
        lda     #21         ;
        sta     ,x          ;DO POSITION
        jsr     FMS         ;
        beq     RPTER7      ;
                            ;
RPTER4  ldx     #DSKERS     ;POINT TO STRING
        jsr     PSTRNG      ;OUTPUT IT
        ldx     CRSAVE      ;RESTORE TO FCB
        lda     ERRTYP      ;GET ERR NUM
        sta     1,x         ;
        clr     ,x          ;
        clrb                ;
        jsr     OUTDEC      ;OUTPUT NUMBER
                            ;
RPTE44  puls    x,y,pc      ;RESTORE REGS. & RETURN
                            ;
RPTER6  ldx     #NTRST      ;POINT TO STRING
        jsr     PSTRNG      ;OUTPUT IT
        bra     RPTE44      ;
                            ;
RPTER7  jsr     PCRLF       ;OUTPUT CR & LF
        ldx     #SYSFCB     ;SET TO FCB
        lda     ERRTYP      ;GET ERROR
        deca                ;FIND RECORD IN FCB
        anda    #3          ;MASK NUMBER
        ldb     #63         ;GET MESSAGE LENGTH
        mul                 ;GET TO DESIRED MESSAGE
        addb    #4          ;ADD IN BIAS
        stb     34,x        ;SET FDI IN FCB
                            ;
RPTE85  jsr     FMS         ;GET CHARACTER
        bne     RPTER4      ;ERROR?
        jsr     PUTCHR      ;OUTPUT CHARACTER
        cmpa    #$0D        ;IS IT CR?
        bne     RPTE85      ;REPEAT
                            ;
        lda     #4          ;CLOSE FILE
        sta     ,x          ;
        jsr     FMS         ;CALL FMS
        bra     RPTE44      ;EXIT
                            ;
RPTER9  pshs    x,y         ;SAVE REGISTERS
        jmp     SETEX4      ;GO COPY

* NONMER
*
* REPORT no nAME ERROR

NONMER  ldx     #NONMST     ;POINT TO STRING
        jmp     NFERR2      ;REPORT IT

* DOCMD
*
* DO COMmand LINE

DOCMD   puls    a,b         ;GET RET ADR
        std     RETADR      ;SAVE ADDRESS
        sts     STKSTR      ;SAVE STACK PNTR
        clr     ERRTYP      ;CLEAR FLAG
        inc     CMFLG       ;SET MODE
        jmp     DOS4        ;GO DO LINE

* RETRN
*
* RETRN returNS FROM DOCMD

RETRN   clr     CMFLG       ;CLEAR MODE
        lds     STKSTR      ;RESTORE STACK
        ldb     ERRTYP      ;GET STATUS
        jmp     [RETADR]    ;DO RETURN

* ADDBX
* ADDS ContenTS OF B TO X

ADDBX   abx
        rts

* MEXIT
*
* MONITOr exiT CHECK

MEXIT   tst     PR1         ;CHECK PROCESS 1
        bne     MEXIT2      ;
        jmp     [MONITRP]    ;JUMP TO MONITOR
                            ;
MEXIT2  ldx     #SYSFCB     ;POINT TO FCB
        lda     #27         ;
        sta     1,x         ;SET ERROR
        jsr     RPTERR      ;REPORT ERROR
        jmp     ENTRY       ;GO BACK
