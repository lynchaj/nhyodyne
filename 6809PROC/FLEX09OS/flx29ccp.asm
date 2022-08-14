* OPT PAG
        TTL     TSC 6809 DOS VERSION 2.92
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

LINBUF  EQU     $C080
CURFCB  EQU     $D40B

* ASCII CODE EQUATES

NUL     EQU     $00
EOT     EQU     $04

* EXTERNAL LABEL EQUATES

STACK   EQU     $C07F
LC400   EQU     $C400
CHPR    EQU     $C700
;INDEX   EQU     $CC3D
;CRSAVE  EQU     $CC3F
;RETADR  EQU     $CC43
;STKSTR  EQU     $CC45
;IOTEMP  EQU     $CC47
;OUTNUM  EQU     $CC4A
;COUNT   EQU     $CC4B
;GOTFIL  EQU     $CC4C
TEMP    EQU     $CC4D

INCHNE  EQU     $D3E5
IHNDLR  EQU     $D3E7
SWIVEC  EQU     $D3E9
IRQVEC  EQU     $D3EB
MONITR  EQU     $D3F3

FMSINT  EQU     $D400
FMSCLS  EQU     $D403
FMS     EQU     $D406

DWARM   EQU     $DE18

        ORG     $C840

SYSFCB  FCB     $FF,0,0,0
        FCN     "startup"
        FCN     "txt"

LBL     EQU     128         LINE BUFFER LENGTH

        ORG     $CC00

TTYBS   FCB     $08         $CC00   BACK SPACE (^H)
TTYDEL  FCB     $18         $CC01   DELETE CHARACTER (^X)
TTYEOL  FCB     $3A         $CC02   END OF LINE CHAR (:)
TTYDP   FCB     $00         $CC03   LINES PER SCREEN
COLCNT  FCB     $00         $CC04   COLUMNS PER LINE
TTYNL   FCB     $06         $CC05   LINE PADDING NULLS
TTYTB   FCB     $00         $CC06   TAB CHARACTER
TTYBE   FCB     $00         $CC07   BACK SPACE ECHO
TTYEJ   FCB     $00         $CC08   EJECT LENGTH
TTYPS   FCB     $FF         $CC09   PAUSE CONTROL
TTYESC  FCB     $1B         $CC0A   ESCAPE CHARACTER
SYSDRV  FCB     $00         $CC0B   SYSTEM DRIVE
WRKDRV  FCB     $00         $CC0C   WORKING DRIVE
SYSFLG  FCB     $00         $CC0D   SYSTEM FLAG
SYSMTH  FCB     $00         $CC0E   SYSTEM DATE
SYSDAY  FCB     $00         $CC0F
SYSYR   FCB     $00         $CC10
LSTTRM  FCB     $00         $CC11   LAST TERMINATOR
USRTBL  FDB     $0000       $CC12   USER COMMAND TABLE
BUFPNT  FDB     $0000       $CC14   LINE BUFFER POINTER
RETRNR  FDB     $0000       $CC16   ESCAPE RETURN REG
CHAR    FCB     $00         $CC18   CHARACTER
PRVCHR  FCB     $00         $CC19   PREVIOUS CHARACTER
LINE    FCB     $00         $CC1A   CURRENT LINE NUMBER
OFFSET  FDB     $0000       $CC1B   LOADER ADR OFFSET
XFR     FCB     $00         $CC1D   TRANSFER FLAG
TADR    FDB     $0000       $CC1E   TRANSFER ADDRESS
ERRTYP  FCB     $00         $CC20   ERROR TYPE
SPCLS   FCB     $00         $CC21   SPECIAL IO FLAG
OUTCHN  FCB     $00         $CC22   OUTPUT CHANNEL BYTE
INCHNL  FCB     $00         $CC23   INPUT CHANNEL BYTE
FILOUT  FDB     $0000       $CC24   OUTPUT FILE ADDRESS
FILIN   FDB     $0000       $CC26   INPUT FILE ADDRESS
CMFLG   FCB     $00         $CC28   COMMAND FLAG
COLMN   FCB     $00         $CC29   CURRENT OUTPUT COL.
TMRFLG  FCB     $00         $CC2A   TIMER FLAG UNUSED NOW
MEMEND  FDB     $0000       $CC2B   MEMORY END
ERRVEC  FDB     $0000       $CC2D   ERROR NAME VECTOR
FILEKO  FCB     $01         $CC2F   FILE INPUT ECHO
FMSBSY  FCB     $00         $CC30   FMS IS BUSY FLAG
CP      FDB     $0000       $CC31
CPUTYP  FCB     $00         $CC33
PRCNT   FCB     $00         $CC34   UNUSED NOW
SPARES  FDB     0,0,0       $CC35   SPARE BYTES
XTEMP   RMB     2           $CC3B   INDEX TEMP
INDEX   RMB     2           $CC3D   INDEX TEMP STORAGE
CRSAVE  RMB     2           $CC3F   INDEX SAVE
DATPNT  RMB     2           $CC41   DATA POINTER
RETADR  RMB     2           $CC43   RETURN ADDRESS
STKSTR  RMB     2           $CC45   STACK STORAGE
IOTEMP  RMB     2           $CC47   IO TEMP STORE

* SET MAPUP TO $FF TO DISABLE MAPPING

MAPUP   FCB     $60         $CC49   MAP FILENAMES TO UPPER
OUTNUM  RMB     1           $CC4A   0 SUPPRESSION FLAG
COUNT   RMB     1           $CC4B   SPARE COUNT REGISTER
GOTFIL  RMB     1           $CC4C   FILE INDICATOR
Temp    RMB     1           $CC4D   TEMPORARY REGISTER

PPRMPT  FDB     PRMPT

WHATST  FCC     "WHAT?"
        FCB     EOT
NOTRST  FCC     "CAN'T TRANSFER"
        FCB     EOT
NONMST  FCC     "NOT FOUND"
        FCB     EOT
DSKERS  FCC     "DISK ERROR #"
        FCB     EOT
NTRST   FCC     "DRIVE NOT READY"
        FCB     EOT
COMTBL  FCN     "GET"
        FDB     GET
        FCN     "MON"
        FDB     MEXIT
        FCB     $00

CONTBL  FDB     10000
        FDB     1000
        FDB     100
        FDB     10

ERNM    FCC     "errors"
        FCB     0,0
        FCC     "sys"
PRMPT   FCC     "+++"
        FCB     EOT
        ORG     $CCC0

PINIT   RTS

        ORG     $CCD8

PCHK    RTS

        ORG     $CCE4

POUT    RTS

        ORG     $CCF8

PR0     FCB     $01,$00,$00,$00
PR1     FCB     $00,$00,$00,$00

COLDS   JMP     INIT        GO INITIALIZE
WARMS   JMP     ENTRY       WARM ENTRY POINT
RENTER  JMP     DOS3        RE-ENTER DOS
INCH    JMP     INCH        **DRIVERS**                      INPUT ROUTINE
INCH2   JMP     INCH2       **DRIVERS**                      TERMINAL INPUT
OUTCH   JMP     OUTCH       **DRIVERS**                      OUTPUT CHARACTER
OUTCH2  JMP     OUTCH2      **DRIVERS**                      TERMINAL OUTPUT
DGETCH  JMP     GETCHR      GET CHARACTER
DPUTCH  JMP     PUTCHR      PUT CHARACTER
DINBUF  JMP     INBUF       INPUT TO BUFFER
DPSTRN  JMP     PSTRNG      PRINT STRING
DCLASS  JMP     CLASS       CLASSIFY CHARACTER
DPCRLF  JMP     PCRLF       PRINT CR AND LF
DNEXTC  JMP     NXTCH       NEXT BUFFER CHAR
RSTRIO  JMP     RESTIO      RESTORE IO VECTORS
DFILSP  JMP     GETFIL      GET FILE SPEC
DLOAD   JMP     LOAD        FILE LOADER
DSETEX  JMP     SETEXT      SET NAME EXTENSION
DADDBX  JMP     ADDBX       ADD B TO X
DOUTDE  JMP     OUTDEC      OUTPUT DECIMAL
DOUTHE  JMP     OUTHEX      OUT HEX CHARACTER
DRPTER  JMP     RPTERR      REPORT ERROR
DGETHX  JMP     GETHEX      GET HEX NUMBER
DOUTAD  JMP     OUTADR      OUT HEX ADDRESS
DINDEC  JMP     INDEC       GET DECIMAL NUMBER
DDOCMD  JMP     DOCMD       DO COMMAND LINE
DSTAT   JMP     DSTAT       **DRIVERS**                     TERMINAL INPUT STATUS
DSPR2   JMP     RTS
DSPR3   JMP     RTS

* INIT
*
* INIT IS THE INITIALIZATION ROUTINE.
* ALL SYSTEM VARIABLES ARE SET HERE.

INIT    LDS     #STACK      SET STACK
INIT1   CLR     LSTTRM      CLEAR TERM BYTE
        JSR     FMSINT      INIT SYSTEM
        CLR     CMFLG       CLEAR FLAG
        JSR     TSTSTR      CHECK FOR STARTUP

* ENTRY
*
* ENTRY IS THE WARM START ENTRY POINT.
* THE STACK IS RESET HERE.

ENTRY   LDS     #STACK      SET STACK
        JSR     DWARM       DO USER WARMSTART ROUTINE
        LDX     #WARMS      POINT TO WARM START
        STX     RETRNR      SET RETURN REG
        LDX     #CHPR       SET SWI3 VECTOR
        STX     [SWIVEC]
        LDX     IHNDLR      SET IRQ VECTOR
        STX     [IRQVEC]
        LDX     #PR0        SET PR # 0
        STX     CP
        CLR     PRCNT       SET STATUS
ENTRY2  CLR     GOTFIL      CLEAR FILE DESIG.
        BSR     RESTIO      RESTORE IO

* DOS
*
* DOS IS THE MAIN DOS LOOP

DOS     LDA     LSTTRM      CHECK TERMINATOR
        CMPA    TTYEOL      WAS IT EOL?
        BNE     DOS2
        INC     BUFPNT+1    RESET BUFPNT
        BRA     DOS3

DOS2    TST     CMFLG       TEST FLAG
        LBNE    RETRN       DO CMD RETURN
        JSR     FMSCLS      CLOSE ALL
        BNE     INIT1       ERRORS?
        BSR     PRMTUSR     POINT TO PROMPT

DOS3    JSR     SKPSPC      SKIP SPACES
        CMPA    #$0D        LONE CARRIAGE RET?
        BEQ     DOS2

DOS4    LDX     #SYSFCB     POINT TO SYSTEM FCB
        INC     SYSFLG      SET SYSTEM DRIVE
        JSR     GETFIL      GET FILE NAME
        BCS     NFERR       ERROR?
        LDX     #COMTBL     POINT TO TABLE
        BSR     LKNAM       LOOK FOR NAME
        BEQ     DOS6        FIND?
        LDX     USRTBL      CHECK USER TABLE
        BEQ     DOS8        IS THERE ONE?
        BSR     LKNAM       LOOK FOR NAME
        BNE     DOS8        FIND?

DOS6    JMP     [1,X]       JUMP TO COM ADDRESS

DOS8    JSR     LGO         DO LOAD & GO

* NFERR

NFERR   LDX     #WHATST     POINT TO STRING
        LDA     #$15        SET ERROR TYPE
NFERR1  STA     ERRTYP
NFERR2  JSR     PSTRNG      OUTPUT IT
NFERR4  CLR     LSTTRM      CLEAR TERM
        JMP     ENTRY       RESTART

* RESTIO
*
* RESTIO RESTORES THE SYSTEM IO JUMP
* VECTORS FOR INPUT, OUTPUT, & INIT.

RESTIO  LDX     OUTCH2+1    SET OUTPUT
        STX     OUTCH+1
        LDX     INCH2+1     SET INPUT
        STX     INCH+1
        CLR     INCHNL
        CLR     OUTCHN      CLEAR OUT CHAN
        CLR     SPCLS       SET SPECIALS
        CLR     FILIN       CLEAR FILES
        CLR     FILOUT
RTS     RTS

* LKNAM
*
* LKNAM LOOKS FOR A COMMAND
* NAME IN A TABLE
*
*   ENTRY: X POINTS TO TABLE
*   EXIT:  EQ IF FOUND
*          X+1 POINTS TO ADR

LKNAM   LDY     #SYSFCB+4   SET POINTER
LKNAM3  LDA     ,Y+         GET A NAME CHAR
        CMPA    #$5F        CHECK IF UPPER CASE
        BLS     LKNAM4      SKIP IF NOT
        SUBA    #$20        MAKE UPPER

LKNAM4  CMPA    ,X+         CHECK AGAINST TABLE
        BNE     LKNAM6      BRANCH IF NO MATCH
        TST     0,X         CHECK IF END
        BNE     LKNAM3      LOOP IF NOT

        TST     0,Y         AT END OF NAME
        BEQ     LKNAM8      GOT COMMAND IF SO

LKNAM6  TST     ,X+         END OF WORD?
        BNE     LKNAM6      LOOP TIL SO
        LEAX    2,X         BUMP PAST ADDRESS
        TST     0,X         END OF TABLE?
        BNE     LKNAM       REPEAT IF NOT
        ANDCC   #$FB        CLZ SET NOT EQUAL
LKNAM8  RTS

PRMTUSR LDX     PPRMPT
        BSR     PSTRNG

* INBUF
*
* INBUF INPUTS A LINE INTO THE LINE
* BUFFER. DELETE AND BACK SPACE
* CHARACTERS ARE CHECKED HERE.
*
*   ENTRY: NONE
*   EXIT:  ALL REGISTERS CHANGED

INBUF   LDX     #LINBUF     POINT TO BUFFER
        STX     BUFPNT      SET POINTER
INBUF2  JSR     GETCHR      GO GET A CHARACTER
        CMPA    TTYDEL      IS IT DELETE?
        BEQ     PRMTUSR
        CMPA    TTYBS       IS IT BACK SPACE?
        BEQ     INBUF6
        CMPA    #$0D        IS IT CARRIAGE RET?
        BEQ     INBUF4
        CMPA    #$0A        IS IT LF?
        BEQ     INBUF7
        CMPA    #$1F        IS IT CONTROL?
        BLS     INBUF2      IGNORE IF SO
INBUF3  CMPX    #LINBUF+LBL-1
        BEQ     INBUF2
INBUF4  STA     ,X+         PUT CHAR IN BUFFER
        CMPA    #$0D        IS IT RETURN?
        BNE     INBUF2      REPEAT IF NOT
        RTS

INBUF6  CMPX    #LINBUF     FRONT OF BUFFER?
        BEQ     PRMTUSR
        LEAX    -1,X        DEC THE POINTER
        LDA     TTYBE       GET ECHO CHAR
        CMPA    #8          IS IT ^H ?
        BNE     INBU65
        LDA     #$20        SETUP SPACE
        JSR     PUTCH6      OUTPUT IT
        LDA     TTYBE       GET CHAR
INBU65  JSR     PUTCH6      OUTPUT IT
        BRA     INBUF2      REPEAT

INBUF7  LDA     #$0D        OUTPUT CR
        JSR     PUTCHR
        LDA     #$20        SETUP SPACE
        BRA     INBUF3

* PSTRNG
*
* PSTRNG PRINTS THE STRING POINTED
* TO BY THE INDEX REGISTER.
*
*   ENTRY: X POINTS TO STRING
*   EXIT:  A & X CHANGED

PSTRNG  BSR     PCRLF       OUTPUT CR & LF
PDATA1  LDA     0,X         GET A CHARACTER
        CMPA    #4          IS IT TERM?
        BEQ     PCRLF8
        JSR     PUTCHR      GO PUT CHAR.
        LEAX    1,X         BUMP THE POINTER
        BRA     PDATA1      REPEAT IT

* BREAK
*
* BREAK CHECKS FOR A CHARACTER ON INPUT CHANNEL,
* RETURNS IMMEDIATELY IF NONE OR NOT ESCAPE.
* IF ESCAPE, WAITS FOR ANOTHER OR FOR RETURN.

BREAK   JSR     DSTAT       ANY INPUT CHARACTER?
        BEQ     PCRLF9      EXIT IF NOT

        JSR     [INCHNE]    ELSE, GET THE CHARACTER
        ANDA    #$7F        STRIP UPPER BIT
        CMPA    TTYESC      AN ESCAPE?
        BNE     PCRLF9      EXIT IF NOT

BREAK1  CLR     LINE        CLEAR LINE COUNT
BREAK2  JSR     [INCHNE]    WAIT FOR A CHARACTER
        ANDA    #$7F        STRIP UPPER BIT
        CMPA    TTYESC      AN ESCAPE?
        BEQ     PCRLF9      CONTINUE IF SO
        CMPA    #$0D        IS IT A C.R.?
        BNE     BREAK2      LOOP IF NEITHER
        CLR     LSTTRM      CLEAR TERMINATOR
        JMP     [RETRNR]    JUMP TO RETURN REG

* PCRLF
*
* PCRLF OUTPUTS A CARRIAGE RETURN
* AND A LINE FEED COMBINATION.
*
*   ENTRY: NONE
*   EXIT:  A & B CHANGED

PCRLF   TST     SPCLS       TEST SPECIALS
        BNE     PCRLF2
        BSR     BREAK       CHECK FOR BREAK
        LDA     TTYDP       GET COUNT
        BEQ     PCRLF2      IS IT OFF?

        CMPA    LINE        CHECK COUNT
        BHI     PCRL19
        CLR     LINE        CLEAR COUNT
        TST     TTYPS       PAUSE ON?
        BEQ     PCRLF1
        BSR     BREAK1      WAIT FOR ESC

PCRLF1  PSHS    B           SAVE B
        LDB     TTYEJ       CHECK COUNT
        BEQ     PCRL18
PCRL15  BSR     PCRLF2      OUTPUT CR & LF
        DECB                DEC THE COUNT
        BNE     PCRL15

PCRL18  PULS    B           RESTORE B
PCRL19  INC     LINE        BUMP LINE COUNT
PCRLF2  LDA     #$0D        SET UP CR
        BSR     PUTCHR      OUTPUT IT
        LDA     #$0A        SET UP LINE FEED
        BSR     PUTCHR      OUTPUT IT
        PSHS    B           SAVE B
        LDB     TTYNL       CHECK NULLS
        BEQ     PCRLF6
PCRLF4  CLRA                SET UP NULL
        BSR     PUTCHR      OUTPUT IT
        DECB                DEC THE COUNT
        BNE     PCRLF4      REPEAT?

PCRLF6  PULS    B           RESTORE B
PCRLF8  ANDCC   #$FE        CLC  CLEAR ERRORS
PCRLF9  RTS

* GETCHR
*
* GETCHR GETS A CHARACTER FROM EITHER
* THE STANDARD INPUT OR A FILE.
*
*   ENTRY: NONE
*   EXIT:  A HAS CHARACTER

GETCHR  TST     INCHNL      CHECK CHAN
        BNE     GETCH5
        TST     FILIN       FILE INPUT?
        BEQ     GETCH4
        BSR     FILIO       DO FILE INPUT
        TST     FILEKO      ECHO CHARACTER?
        BEQ     GETCH6
        TST     FILOUT      OUTPUT FILE?
        BEQ     GETCH6
        BSR     PUTCH6      ECHO CHARACTER
        BRA     GETCH6

GETCH4  JSR     INCH        GET CHAR
        BRA     GETCH6

GETCH5  JSR     INCH2       TERMINAL INPUT
GETCH6  CLR     LINE        CLEAR COUNTER
        RTS

* FILIO
*
* FILIO DOSE A FMS CALL FOR CHARACTER
* IO TRANSFER. CONTROL RETURNED TO
* WARM START UPON ERROR.

FILIO   STX     IOTEMP      SAVE INDEX
        LDX     FILIN       GET INPUT FCB
        BRA     FILIO4

FILIO2  STX     IOTEMP      SAVE X
        LDX     FILOUT      GET OUTPUT FCB

FILIO4  JSR     FMS         CALL FMS
        BNE     FILIO6      ERROR?
        LDX     IOTEMP      RESTORE INDEX
        RTS

FILIO6  CLR     FILOUT      CLEAR CHAN
        JSR     RPTERR      REPORT ERROR
        JMP     WARMS       DO WARM START

* PUTCHR
*
* PUTCHR WRITES A CHARACTER TO EITHER
* THE STANDARD OUTPUT OR TO A FILE.
*
*   ENTRY: CHARACTER IN A
*   EXIT:  A MAY BE DESTROYED

PUTCHR  TST     SPCLS       CHECK SPECIALS
        BNE     PUTCH6
        CMPA    #$1F        IS IT CONTROL?
        BHI     PUTCH2
        CLR     COLMN       CLEAR COL COUNT
        BRA     PUTCH6      JUMP AHEAD

PUTCH2  INC     COLMN       BUMP COUNTER
        PSHS    A           SAVE CHARACTER
        LDA     COLCNT      GET COUNT
        BEQ     PUTCH4      IS IT 0?
        CMPA    COLMN       ENOUGH?
        BCC     PUTCH4
        JSR     PCRLF       OUTPUT CR & LF
        INC     COLMN

PUTCH4  PULS    A           RESTORE CHAR
PUTCH6  PSHS    A
        TST     OUTCHN      TEST CHANNEL
        BNE     PUTCH7
        TST     FILOUT      FILE OUTPUT?
        BEQ     PUTC68
        BSR     FILIO2      DO FMS CALL
        BRA     PUTC75

PUTC68  TST     FILIN
        BNE     PUTC75      FILE INPUT?
        JSR     OUTCH       OUTPUT IT
        BRA     PUTC75

PUTCH7  JSR     OUTCH2      CHAN 2 OUTPUT
PUTC75  PULS    A           RESTORE CHAR
        RTS

* OUTDEC
*
* OUTPUT DECIMAL NUMBER POINTED TO
* BY X. THE NS ENTRY PRINTS LEADING
* ZEROES.
*
*   ENTRY: X POINTS TO NUMBER
*   EXIT:  ALL CHANGED

OUTDEC  CLR     OUTNUM      CLEAR FLAG
        STB     XFR         SET SUP FLAG
        LDA     #4          SET COUNTER
        STA     TEMP        SAVE IT
        LDD     0,X         GET VALUE
        LDX     #CONTBL     POINT TO CONSTANTS

OUTDE4  BSR     OUTDIG      OUTPUT DIGIT
        LEAX    2,X         BUMP TO NEXT CONST.
        DEC     TEMP        DEC THE COUNT
        BNE     OUTDE4
        TFR     B,A         GET LS DIGIT
        BRA     OUTHR       OUTPUT IT

* OUTDIG
*
* OUTDIG OUTPUTS THE DIGITS PLACE
* OF THE NUMBER IN A & B CORRESPONDING
* TO THE CONSTANT POINTED TO BY X.
*
*   ENTRY: A & B CONTAIN NUMBER
*          X POINTS TO CONSTANT
*   EXIT:  ALL REGISTERS PRESERVED

OUTDIG  CLR     COUNT       CLEAR COUNTER
OUTDI2  CMPD    0,X         COMPARE NUMBER
        BCS     OUTDI5
        SUBD    0,X         SUB VALUE
        INC     COUNT       BUMP COUNTER
        BRA     OUTDI2      REPEAT

OUTDI5  PSHS    A           SAVE A
        LDA     COUNT       GET TOTAL
        BNE     OUTDI6      IS IT ZERO?
        TST     OUTNUM      SUPRESS ZEROES?
        BNE     OUTDI6      NUMBER YET?
        TST     XFR         NULL OR SPACE?
        BEQ     OUTDI8
        LDA     #$20        SETUP SPACE
        BSR     OUTHR2      OUTPUT IT
        BRA     OUTDI8

OUTDI6  INC     OUTNUM      SHOW NUMBER
        BSR     OUTHR       OUTPUT DIGIT

OUTDI8  PULS    A,PC        RESTORE A & RETURN

* OUTADR
*
* OUTPUT FOUR HEX DIGITS POINTED
* TO BY THE INDEX REGISTER.

OUTADR  BSR     OUTHEX      OUT 2 DIGITS
        LEAX    1,X         BUMP POINTER

* OUTHEX
*
* OUTHEX OUTPUTS THE BYTE IN HEX
* POINTED TO BY X.
*
*   ENTRY: X POINTS TO BYTE
*   EXIT:  B PRESERVED

OUTHEX  LDA     0,X         GET MSB
        BSR     OUTHL       OUTPUT IT
        LDA     0,X         DO LSB
        BRA     OUTHR       OUTPUT IT

OUTHL   LSRA                GET MSB TO LSB
        LSRA
        LSRA
        LSRA

OUTHR   ANDA    #$0F        MASK OFF MSB
        ADDA    #$30        ADD IN BIAS
        CMPA    #$39        OVER NUMBERS?
        BLS     OUTHR2

        ADDA    #7          FINISH BIAS

OUTHR2  JMP     PUTCHR      OUTPUT IT

* CLASS
*
* CLASS WILL CLASSIFY THE CHARACTER IN A.
*
*   ENTRY: CHARACTER IN A
*   EXIT:  CS IF NOT 0-9 OR A-Z

CLASS   CMPA    #$30        IS IT 0?
        BCS     CLASS2      REPORT
        CMPA    #$39        COMPARE TO 9
        BLS     CLASS4      IS IT NUMBER?
        CMPA    #$41        COMPARE TO A
        BCS     CLASS2      REPORT
        CMPA    #$5A        COMPARE TO Z
        BLS     CLASS4      IS IT LETTER?
        CMPA    #$61        CHECK FOR LOWER
        BCS     CLASS2      REPORT
        CMPA    #$7A        UPPER LIMIT
        BLS     CLASS4

CLASS2  ORCC    #1          SEC  SET FOR NOT
        STA     LSTTRM
        RTS

CLASS4  ANDCC   #$FE        CLC  SHOW ALPHANUMERIC
        RTS

* NXTCH
*
* NXTCH GETS THE NEXT CHARACTER FROM
* THE LINE BUFFER.
*
*   ENTRY: NONE
*   EXIT:  A HAS CHARACTER

NXTCH   PSHS    X
        LDX     BUFPNT      GET POINTER
        LDA     CHAR        GET OLD CHAR
        STA     PRVCHR      SAVE AS PREVIOUS
NXTCH3  LDA     ,X+         GET THE CHARACTER
        STA     CHAR        SAVE CHAR
        CMPA    #$0D        IS IT RETURN?
        BEQ     NXTCH4
        CMPA    TTYEOL      IS IT EOL?
        BEQ     NXTCH4
        STX     BUFPNT      SAVE NEW POSITION
        CMPA    #$20        CHECK FOR SPACE
        BNE     NXTCH4
        CMPA    0,X         NEXT CHAR SPACE?
        BEQ     NXTCH3      SKIP IF SO

NXTCH4  BSR     CLASS       GO CLASSIFY
        PULS    X,PC        RESTORE REG. & RETURN

* GETFIL
*
* GETFIL GETS A FILE SPECIFICATION FROM
* THE INPUT STREAM.
*
*   ENTRY: X POINTS TO FCB
*   EXIT:  ALL REGISTERS CHANGED

GETFIL  LDA     #21         SET PRE ERROR
        STA     1,X
        LDA     #$FF        SET DRIVE NEG
        STA     3,X
        CLR     4,X
        CLR     12,X        CLEAR EXTENSION
        JSR     SKPSPC      SKIP SPACES
        LDA     #8          SET UP COUNT
        STA     COUNT       SAVE IT
        BSR     PRTM        PROCESS ITEM
        BCS     GETFI5      ERROR?
        BNE     GETFI2      CHECK TERM
        BSR     PRTM        PROCESS ITEM
        BCS     GETFI5      ERROR?
        BNE     GETFI2      CHECK TERM
        CMPX    CRSAVE      CHECK ERROR?
        BEQ     PRTM6
        BSR     PRTM        PROCESS ITEM
        BLS     PRTM6       ERROR?

GETFI2  LDX     CRSAVE      RESTORE POINTER
        TST     4,X         IS NAME NULL?
        BEQ     PRTM6
        TST     3,X         CHECK DRIVE NUMBER
        BPL     GETFI4      SET YET?
        TST     SYSFLG      SYSTEM DRIVE?
        BEQ     GETFI3
        LDA     SYSDRV      GET SYSTEM DRIVE
        BRA     GETF35

GETFI3  LDA     WRKDRV      GET WORK DRIVE
GETF35  STA     3,X         SET DRIVE NUMBER
GETFI4  CLR     SYSFLG      CLEAR FLAG
GETFI5  LDX     CRSAVE      RESTORE FCB
        RTS

* PRTM
*
* PRTM PROCESSES AN ITEM OF THE FILE SPEC

PRTM    BSR     NXTCH       GET NEXT CHAR
        BCS     PRTM6       ERROR?
        CMPA    #$39        CHECK IF NUMBER
        BHI     PRTM2
        LDX     CRSAVE      RESTORE POINTER
        TST     3,X         CHECK FOR DRIVE NO
        BPL     PRTM6       ERROR?
        ANDA    #3          MASK DRIVE
        STA     3,X         SET DRIVE NUM
        JSR     NXTCH       GET NEXT CHAR
        BCC     PRTM6       ERROR?

PRTM1   CMPA    #$2E        CHECK TERM
        ANDCC   #$FE        CLC  CLEAR ERROR
        RTS

PRTM2   LDB     COUNT       GET COUNT
        BMI     PRTM6       ERROR?
        PSHS    B           SAVE COUNT
        SUBB    #5          SET NEW COUNT
        STB     COUNT       SAVE IT
        PULS    B           RESTORE OLD

PRTM3   CMPA    MAPUP       CHECK FOR LOWER CASE
        BCS     LD0AE       SKIP IF NOT
        SUBA    #$20        CONVERT TO UPPER

LD0AE   STA     4,X         PUT CHARACTER
        LEAX    1,X         BUMP THE POINTER
        DECB                DEC THE COUNT
        JSR     NXTCH       GET NEXT CHAR
        BCC     PRTM5       TERM CHAR?
        CMPA    #$2D        IS IT HYPHEN?
        BEQ     PRTM5

        CMPA    #$5F        IS IT UNDER SCORE?
        BNE     PRTM7

PRTM5   TSTB                CHECK COUNT
        BNE     PRTM3       REPEAT

PRTM6   ORCC    #1          SEC  SET ERROR
        RTS

PRTM7   TSTB                CHECK COUNT
        BEQ     PRTM1       FINISHED?

        CLR     4,X         CLEAR REST
        LEAX    1,X         BUMP POINTER
        DECB                DEC THE COUNT
        BRA     PRTM7       REPEAT

* SKPSPC
*
* SKPSPC SKIPS SPACES IN THE BUFFER
*
*   ENTRY: NONE
*   EXIT:  ALL CHANGED

SKPSPC  STX     CRSAVE      SAVE INDEX
        LDX     BUFPNT      GET POINTER

SKPSP2  LDA     0,X         GET CHARACTER
        CMPA    #$20        IS IT SPACE?
        BNE     SKPSP4

        LEAX    1,X         BUMP TO NEXT
        BRA     SKPSP2      REPEAT

SKPSP4  STX     BUFPNT      SET POINTER
        LDX     CRSAVE      RESTORE REGISTER
        RTS

* SETEXT
*
* SETEXT SETS A DEFAULT NAME EXTENSION
* IF THE EXTENSION IS NULL. IT IS SET
* ACCORDING TO THE CODE IN A.
*
*   ENTRY: A HAS CODE
*          X POINTS TO FCB
*   EXIT:  ALL REGISTERS CHANGED

SETEXT  PSHS    X,Y         SAVE REGISTERS
        LDB     12,X        GET FIRST EXT
        BNE     SETEX6      NULL?

        LEAY    <EXTTBL,PCR POINT TO TABLE
        CMPA    #$0F        CHECK RANGE
        BHI     SETEX6
        LDB     #3          GET TO DESIRED EXT.
        MUL
        LEAY    D,Y
        LDB     #3          GET EXTENSION LENGTH

SETEX4  LDA     ,Y+         GET CHAR
        CMPA    MAPUP       IS IT LOWER CASE?
        BCS     SETEX5      NO
        SUBA    #$20        YES - MAKE UPPER CASE

SETEX5  STA     12,X        PUT IN EXT
        LEAX    1,X         BUMP POINTER
        DECB                THE COUNT
        BNE     SETEX4      FINISHED?

SETEX6  PULS    X,Y,PC      RESTORE REGS. & RETURN

* EXTTBL
*
* EXTENSION CODE TABLE

EXTTBL  FCC     "bin"   ;CODE 0
        FCC     "txt"   ;CODE 1
        FCC     "cmd"   ;CODE 2
        FCC     "bas"   ;CODE 3
        FCC     "sys"   ;CODE 4
        FCC     "bak"   ;CODE 5
        FCC     "scr"   ;CODE 6
        FCC     "dat"   ;CODE 7
        FCC     "bac"   ;CODE 8
        FCC     "dir"   ;CODE 9
        FCC     "prt"   ;CODE 10
        FCC     "out"   ;CODE 11
        FCC     "rel"   ;CODE 12
        FCC     "rfi"   ;CODE 13
        FCC     "dev"   ;CODE 14
        FCC     "arc"   ;CODE 15

* GETHEX
*
* GETHEX GETS A HEX VALUE FROM THE
* INPUT BUFFER.  B IS NON ZERO IF
* THERE WAS A NUMBER.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR
*          VALUE IN X

GETHEX  JSR     CLROFS      CLEAR SPACE & B REG
GETHE2  JSR     NXTCH       GET CHARACTER
        BCS     GETHE8      GRAPHICS?

        BSR     TSTHEX      TEST FOR HEX
        BCS     GETHE6      ERROR?

        PSHS    B           SAVE IND
        LDB     #4          SET UP COUNT

GETHE4  ASL     OFFSET+1    SHIFT OVER 4
        ROL     OFFSET
        DECB                DEC THE COUNT
        BNE     GETHE4      LOOP TIL DONE

        PULS    B           RESTORE IND
        ADDA    OFFSET+1
        STA     OFFSET+1    SET NEW DIGIT
        INCB                SET INDICATOR
        BRA     GETHE2

GETHE6  JSR     NXTCH       GET CHARACTER
        BCC     GETHE6      WAIT FOR TERM
        RTS

GETHE8  LDX     OFFSET      GET VALUE
GETHE9  ANDCC   #$FE        CLC  CLEAR ERRORS
        RTS

* TSTHEX
*
* TEST FOR VALID HEX CHARACTER

TSTHEX  CMPA    #$5F
        BLS     TSTHE2
        SUBA    #$20

TSTHE2  SUBA    #$47        REMOVE BIAS
        BPL     TSTHE4

        ADDA    #6          CHECK RANGE
        BPL     TSTHE3      ERROR?

        ADDA    #7          ADD BACK IN
        BPL     TSTHE4      ERROR?

TSTHE3  ADDA    #$0A        FINAL BIAS
        BPL     GETHE9      NO ERROR

TSTHE4  ORCC    #1
        RTS

* INDEC
*
* INPUT DECIMAL NUMBER.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR
*          VALUE IN X
*          B=0 IF NO NUMBER

INDEC   JSR     CLROFS      CLEAR SPACE & B REG.
INDEC2  JSR     NXTCH       GET CHARACTER
        BCS     GETHE8      TERM?
        CMPA    #$39        CHECK FOR NUMBER
        BHI     GETHE6
        ANDA    #$0F        MASK NUMBER
        PSHS    B           SAVE COUNT
        PSHS    A           SAVE NUMBER
        LDD     OFFSET      GET VALUE
        ASLB                DO TIMES 8
        ROLA
        ASLB
        ROLA
        ADDD    OFFSET      PLUS TIMES 2
        ASLB
        ROLA
        ADDB    ,S+         ADD IN NEW DIGIT
        ADCA    #0
        STD     OFFSET      SAVE RESULT
        PULS    B           GET COUNT
        INCB                BUMP COUNT
        BRA     INDEC2      REPEAT

* LOAD
*
* LOAD IS THE SYSTEM BINARY LOADER
*
*   ENTRY: X POINTS TO FCB
*   EXIT:  WARMS IF ERROR
*          ALL RGISTERS CHANGED

LOAD    CLR     XFR         CLEAR TRANSFER FLAG
LOAD2   BSR     DOFMS       DO READ
        CMPA    #2          BEGIN DESIGNATOR?
        BEQ     LOAD4       YES - GET DATA COUNT

        CMPA    #$16        TRANSFER DESIG?
        BNE     LOAD2
        BSR     DOFMS       GET NEXT CHAR
        STA     TADR        SET TRANSFER ADR
        BSR     DOFMS       GET LSB
        STA     TADR+1      SAVE IT
        LDA     #1          SET NON ZERO
        STA     XFR         SET TRANSFER FLAG
        BRA     LOAD2       REPEAT

LOAD4   BSR     DOFMS       GET NEXT CHAR
        TFR     A,B         SAVE IT
        BSR     DOFMS       GET REST
        EXG     A,B         PUT IN ORDER
        ADDD    OFFSET      OFFSET + ADDRESS
        STD     INDEX       SAVE POINTER
        BSR     DOFMS       GET DATA COUNT
        TFR     A,B         MOVE TO B
        TSTA                ZERO COUNT?
        BEQ     LOAD2       YES -

LOAD6   BSR     DOFMS       GET CHARACTER
        LDX     INDEX       GET POINTER
        STA     ,X+         SAVE IN MEMORY
        STX     INDEX       SAVE POINTER
        DECB                DEC THE COUNT
        BNE     LOAD6       FINISHED?
        BRA     LOAD2       REPEAT

* DOFMS
*
* DOFMS DOES AN IO TRANSFER TO THE
* FILE MGMNT SYSTEM.
*
*   ENTRY: NONE
*   EXIT:  SAME AS FMS COMMAND

DOFMS   LDX     #SYSFCB     POINT TO FCB
        JSR     FMS         DO COMMAND
        BEQ     LD20B       ERROR?

        LDA     1,X         GET ERROR CODE
        CMPA    #8          IS IT EOF?
        BNE     DOFMS4

        LEAS    2,S         FIX STACK
        LDA     #4          SET CMND
        STA     0,X
        JSR     FMS         CALL FMS
        BNE     DOFMS6      ERROR?

LD20B   ANDCC   #$FE        CLC  CLEAR ERROR
        RTS

DOFMS4  STA     ERRTYP      SET TYPE
        CMPA    #4          NO FILE ERROR?
        BEQ     LD287       YES -

DOFMS6  BSR     RPTERR      REPORT ERROR
        JMP     NFERR4      DO WARM START

* GET
*
* GET IS THE DOS COMMAND USED TO
* LOAD BINARY FILES INTO MEMORY.
*
*   ENTRY: NONE
*   EXIT:  ALL REGISTERS CHANGED

GET     LDA     #0          SET DEFAULT CODE
        BSR     GETOPN      GET & OPEN FILE
        BCS     TSTNAM      NO NAME?
        BSR     CLROFS      CLEAR OFFSET
        INC     GOTFIL      SET FILE INDIC.
        BSR     LOAD        GO DO LOAD
        BRA     GET         REPEAT PROCESS

* CLROFS
*
* CLEARS STORAGE LOC. OFFSET

CLROFS  CLRA
        CLRB
        STD     OFFSET
        RTS

* TSTNAM
*
* TSTNAM TESTS TO SEE IF ANY NAMES HAVE
* BEEN PROCESSED YET.

TSTNAM  LDB     GOTFIL      CHECK FLAG
        LBEQ    NFERR       REPORT ERROR
        JMP     WARMS       ALL DONE

* LGO
*
* LGO IS THE SYSTEM LOAD AND GO MODULE.
*
*   ENTRY: NONE
*   EXIT:  ALL CHANGED

LGO     LDA     #2          SET DEFAULT CODE
        BSR     GETOP2      OPEN FILE
        BSR     CLROFS      CLEAR OFFSET
        JSR     LOAD        GO DO LOAD

        LDB     XFR         CHECK FOR TRANSFER ADR
        BEQ     LGO2
        JMP     [TADR]      JUMP TO XFR ADR

LGO2    LDX     #NOTRST     POINT TO STRING
        LDA     #$81        SET TYPE
        JMP     NFERR1      REPORT

* GETOPN
*
* GETOPN GETS THE FILES NAME FROM
* THE INPUT BUFFER AND OPENS THE FILE
*
*   ENTRY: A HAS DEFAULT CODE
*   EXIT:  ALL CHANGED

GETOPN  PSHS    A           SAVE CODE
        LDX     #SYSFCB     POINT TO FCB
        JSR     GETFIL      GET FILE SPEC
        PULS    A           RESTORE CODE
        BCS     GETOP4      ERROR?

GETOP2  LDX     #SYSFCB     POINT TO FCB
        JSR     SETEXT      SET EXTENSION
        LDX     #SYSFCB     POINT TO FCB
        LDA     #1          SET OPEN CODE
        STA     0,X         SET COMMAND
        JSR     DOFMS       GO DO FMS
        LBCS    NONMER      REPORT ANY ERROR
        LDA     #$FF        SET NEG
        STA     59,X        SET FOR NO SPC COMP
        RTS

GETOP4  LDA     LSTTRM      GET TERM
        CMPA    #$0D        IS TERM CR?
        BEQ     LD287       YES -

        CMPA    TTYEOL      IS IT EOL?
        LBNE    NFERR       ERROR IF NEITHER

LD287   ORCC    #1          SEC  SET TERM INDICATOR
        RTS

* RPTERR
*
* RPTERR REPORTS FMS ERRORS

RPTERR  PSHS    X,Y         SAVE REGISTERS
        LDA     1,X         GET ERR NUM
        STA     ERRTYP      SAVE IT
        BEQ     RPTE44
        JSR     RESTIO      RESTORE IO
        LDY     ERRVEC      GET ERR VECTOR
        BNE     RPTER1
        CMPA    #$10        NOT READY ERROR
        BEQ     RPTER6
        LDY     #ERNM       POINT TO STRING

RPTER1  LDX     #SYSFCB     POINT TO FCB
        TST     2,X
        BEQ     RPTER2

        LDA     #4          CLOSE FILE IN FCB
        STA     0,X
        JSR     FMS         CALL FMS
        BNE     RPTER4

RPTER2  LDX     #SYSFCB-8   SET TO FCB
        LDB     #$0B        SET COUNT
        BSR     RPTER9      COPY NAME TO FCB
        LDX     #SYSFCB
        LDA     SYSDRV      SET ALL DRIVES ** CHANGED TO SYS ** 2-25-79
        STA     3,X
        LDA     #1          SET EXTENSION
        STA     0,X         OPEN FOR READ
        JSR     FMS
        BNE     RPTER4      ERROR?

        LDA     ERRTYP      GET ERROR NUM
        DECA                CALCULATE REC NUM
        ASRA
        ASRA
        INCA
        CLR     32,X        SET LRN IN FCB
        STA     33,X
        LDA     #21
        STA     0,X         DO POSITION
        JSR     FMS
        BEQ     RPTER7

RPTER4  LDX     #DSKERS     POINT TO STRING
        JSR     PSTRNG      OUTPUT IT
        LDX     CRSAVE      RESTORE TO FCB
        LDA     ERRTYP      GET ERR NUM
        STA     1,X
        CLR     0,X
        CLRB
        JSR     OUTDEC      OUTPUT NUMBER

RPTE44  PULS    X,Y,PC      RESTORE REGS. & RETURN

RPTER6  LDX     #NTRST      POINT TO STRING
        JSR     PSTRNG      OUTPUT IT
        BRA     RPTE44

RPTER7  JSR     PCRLF       OUTPUT CR & LF
        LDX     #SYSFCB     SET TO FCB
        LDA     ERRTYP      GET ERROR
        DECA                FIND RECORD IN FCB
        ANDA    #3          MASK NUMBER
        LDB     #63         GET MESSAGE LENGTH
        MUL                 GET TO DESIRED MESSAGE
        ADDB    #4          ADD IN BIAS
        STB     34,X        SET FDI IN FCB

RPTE85  JSR     FMS         GET CHARACTER
        BNE     RPTER4      ERROR?
        JSR     PUTCHR      OUTPUT CHARACTER
        CMPA    #$0D        IS IT CR?
        BNE     RPTE85      REPEAT

        LDA     #4          CLOSE FILE
        STA     0,X
        JSR     FMS         CALL FMS
        BRA     RPTE44      EXIT

RPTER9  PSHS    X,Y         SAVE REGISTERS
        JMP     SETEX4      GO COPY

* NONMER
*
* REPORT NO NAME ERROR

NONMER  LDX     #NONMST     POINT TO STRING
        JMP     NFERR2      REPORT IT

* DOCMD
*
* DO COMMAND LINE

DOCMD   PULS    A,B         GET RET ADR
        STD     RETADR      SAVE ADDRESS
        STS     STKSTR      SAVE STACK PNTR
        CLR     ERRTYP      CLEAR FLAG
        INC     CMFLG       SET MODE
        JMP     DOS4        GO DO LINE

* RETRN
*
* RETRN RETURNS FROM DOCMD

RETRN   CLR     CMFLG       CLEAR MODE
        LDS     STKSTR      RESTORE STACK
        LDB     ERRTYP      GET STATUS
        JMP     [RETADR]    DO RETURN

* ADDBX
* ADDS CONTENTS OF B TO X

ADDBX   ABX
        RTS

* MEXIT
*
* MONITOR EXIT CHECK

MEXIT   TST     PR1         CHECK PROCESS 1
        BNE     MEXIT2
        JMP     [MONITR]    JUMP TO MONITOR

MEXIT2  LDX     #SYSFCB     POINT TO FCB
        LDA     #27
        STA     1,X         SET ERROR
        JSR     RPTERR      REPORT ERROR
        JMP     ENTRY       GO BACK

        ORG     $D3FD

TSTSTR  JMP     LC400
