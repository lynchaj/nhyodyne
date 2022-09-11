        OPT PAG
        TTL 6809 FILE MANAGEMENT SYSTEM
        PAG
        PRAGMA CD
*
* TSC 6809 DISK FILE MANAGEMENT SYSTEM
*
* COPYRIGHT (C) 1979 BY
*
* TECHNICAL SYSTEMS CONSULTANTS, INC.
* BOX 2574
* WEST LAFAYETTE, INDIANA 47906
* (317) 463-2502
*
* NOTE:
* AS OF 11/79 THE POINTS IN FMS WHICH LOAD A REGISTER
* WITH THE SECTOR LENGTH HAVE BEEN CHANGED TO SIMPLY
* CLEAR THE REGISTER (SINCE LDB #256 = LDB #0).
* ALL POINTS AFFECTED BY THIS CHANGE ARE FLAGGED WITH
* FOUR BACKSLASHES IN THE COMMENT FIELD (\\\\).
*
* CORRECTED WRITE FILE SECTOR MAP ROUTINE (WTFSM) 2/4/80.

*
* THE FILE MANAGEMENT SYSTEM (FMS) RELIES
* ON THE USER DEFINITIONS OF FILE CONTROL
* BLOCKS (FCB) FOR EACH FILE OPENED.
* THE FCB STRUCTURE IS AS FOLLOWS:
*
* EACH FCB CONSUMES 320 BYTES OF RAM.
* EACH BYTE IS USED AS FOLLOWS:
*
* NAME  OFFSET FUNCTION
* ----  ------ --------

FFC     equ     0           ;FUNCTION OP CODE
FES     equ     1           ;ERROR STATUS BYTE
FAS     equ     2           ;ACTIVITY STATUS
FDN     equ     3           ;DRIVE NUMBER
FFN     equ     4           ;- 11 FILE NAME
FNE     equ     12          ;- 14 NAME EXTENSION
FID     equ     15          ;IDENTIFIER BYTE
FNU     equ     16          ;FILE NUMBER
FSA     equ     17          ;- 18 START DISK ADR.
FEA     equ     19          ;- 20 END DISK ADDRESS
FSZ     equ     21          ;- 22 FILE SIZE
FMP     equ     23          ;- 24 FILE SECTOR MAP
FDT     equ     25          ;- 27 CREATION DATE
FLP     equ     28          ;- 29 FCB LIST POINTER
FCS     equ     30          ;- 31 CURRENT SECTOR
FRN     equ     32          ;- 33 RECORD NUMBER
FDI     equ     34          ;DATA INDEX
FRI     equ     35          ;RANDOM INDEX
FWB     equ     36          ;- 46 NAME WORK BUFFER
FCD     equ     47          ;- 49 CURRENT DIR. ADR.
FFD     equ     50          ;- 52 FIRST DELETED DIR.
FLR     equ     53          ;- 55 LAST RECORD PNTR
FNK     equ     56          ;- 58 NEXT KEY POINTER
FSC     equ     59          ;SPACE COMP. CNTR
FSP     equ     60          ;- 63 SPARE BYTES
FSB     equ     64          ;- 319 SECTOR BUFFER

FMX equ FSP 				;MAX SECTOR NUMBER
SBC equ FLR+2 				;SEQ. BLOCK COUNT

*
* ALL DRIVER ROUTINES ARE REFERENCED
* THROUGH THIS TABLE.

;DREAD   equ     $DE00       ;DISK READ ROUTINE
;DWRITE  equ     $DE03       ;DISK WRITE ROUTINE
;RESTOR  equ     $DE09       ;HEAD RESTORE ROUTINE
;VERIFY  equ     $DE06       ;WRITE VERIFY ROUTINE
;DRIVE   equ     $DE0C       ;DRIVE SELECT
;CHECK   equ     $DE0F       ;CHECK READY
;QUKCHK  equ     $DE12       ;QUICK READY CHECK
;DINIT   equ     $DE15       ;INITIALIZE DRIVERS
;DWARM   equ     $DE18       ;USER WARMSTART ROUTINE
;DSEEK   equ     $DE1B       ;SEEK TO TRACK ROUTINE

* ALL LOW LEVEL SYSTEM VARIABLES
* AND CONSTANTS ARE IN THIS AREA.
*
* SYSTEM CONSTANTS

SL      equ     256         ;SECTOR LENGTH
NL      equ     11          ;NAME LENGTH
RTC     equ     5           ;RETRY COUNT
RSC     equ     7           ;SEEK RETRY COUNT
RS      equ     4           ;RECORD START
IRS     equ     16          ;INFO RECORD START
IRL     equ     24          ;INFO RECORD LENGTH
IRFAS   equ     $04         ;INFO MASK
LSTFC   equ     22          ;LAST FUNCTION CODE
MAXSP   equ     $7F         ;MAX SPACE COUNT
SPC     equ     $20         ;ASCII SPACE
SCC     equ     9           ;SPACE COMPRESSION CHAR.
DELC    equ     $18         ;DELETE CHARACTER
NODR    equ     4           ;NUMBER OF DRIVES
DTRK    equ     0           ;DIRECTORY START TRACK
DSEC    equ     5           ;DIR. START SECTOR
ISEC    equ     3           ;INFO SECTOR NUMBER
TRMSK   equ     $7F         ;TRACK MASK
SCMSK   equ     $7F         ;SECTOR MASK
LSTTRK  equ     76          ;LAST TRACK NUMBER
LSTSEC  equ     15          ;LAST SECTOR NUMBER
RNFMSK  equ     $10         ;REC NOT FOUND MASK
MAIND   equ     $0005       ;MAIN DIRECTORY ADDRESS

* DOS CONSTANTS

DATE    equ     $CC0E       ;SYSTEM DATA
LOCK    equ     $C709       ;LOCK FMS
UNLOCK  equ     $C70C       ;UNLOCK FMS
;PR1     equ     $CCFC       ;PROCESS 1 REGISTER

* SYSTEM ERROR NUMBER DEFINITIONS
*
* NAME  NUMBER MEANING
* ----  ------ -------

NOER    equ     0           ;NO ERROR
ICER    equ     1           ;ILLEGAL FUNCTION CODE
FBER    equ     2           ;FILE BUSY
FEER    equ     3           ;FILE EXISTS
NFER    equ     4           ;NO SUCH FILE
DRER    equ     5           ;DIRECTORY ERROR
TMER    equ     6           ;TOO MANY FILES
DFER    equ     7           ;DISK FULL
EFER    equ     8           ;END OF FILE
RDER    equ     9           ;READ ERROR (CRC)
WTER    equ     10          ;WRITE ERROR (CRC)
WPER    equ     11          ;WRITE PROTECTED
DPER    equ     12          ;DELETE PROTECTED
IFER    equ     13          ;ILLEGAL FCB
DAER    equ     14          ;ILLEGAL DISK ADDRESS
DNER    equ     15          ;DRIVE NUMBER ERROR
NRER    equ     16          ;NOT READY
ADER    equ     17          ;ACCESS DENIED
STER    equ     18          ;STATUS ERROR
IRER    equ     19          ;INDEX RANGE ERROR
FIER    equ     20          ;FMS INACTIVE
INER    equ     21          ;ILLEGAL FILE NAME
CLER    equ     22          ;CLOSE ERROR
FSER    equ     23          ;FSM OVERFLOW ERROR
RRER    equ     24          ;RECORD RANGE ERROR
RMER    equ     25          ;RECORD MATCH ERROR

;
; CONSOLE I/O DRIVER VECTOR TABLE
;_____________________________________________________________________________________________________
                ORG     $D3E1       ; TABLE STARTS AT $D3E1

LD3E1           FDB     ADDDEV      ; add an IRQ handler to table
                FDB     DELDEV      ; delete an IRQ handler from table

INCHNEP         FDB     INCHNE      ; INPUT CHARACTER W/O ECHO
IHNDLRP         FDB     IHNDLR      ; IRQ INTERRUPT HANDLER
SWIVECP         FDB     SWIVEC      ; SWI3 VECTOR LOCATION
IRQVECP         FDB     IRQVEC      ; IRQ VECTOR LOCATION
                FDB     TMOFF       ; TIMER OFF ROUTINE
                FDB     TMON        ; TIMER ON ROUTINE
                FDB     TMINT       ; TIMER INITIALIZATION
MONITRP         FDB     MONITR      ; MONITOR ENTRY ADDRESS
TINITP          FDB     TINIT       ; TERMINAL INITIALIZATION
                FDB     STAT        ; CHECK TERMINAL STATUS
                FDB     VOUTCH      ; OUTPUT CHARACTER
                FDB     VINCH       ; INPUT CHARACTER W/ ECHO


        org     $D3FD
TSTSTR  jmp     STAR

        org $D400

* FMS JUMP TABLES
*
* ALL CALLS TO THE FMS SHOULD ENTER
* THROUGH ONE OF THESE THREE POINTS.

FMSINT  jmp     INIT        ;FMS INITIALIZATION  $D400
FMSCLS  jmp     EXCLS       ;FMS CLOSURE         $D403
FMS     jmp     CMND        ;FMS COMMAND ENTRY   $D406

* GLOBAL VARIABLE STORAGE

FCBBAS  rmb     2           ;FCB BASE POINTER        $D409
FCBSTR  rmb     2           ;CURRENT FCB             $D40B
TEMP    rmb     2           ;TEMPORARY INDEX         $D40D
DATAPT  rmb     2           ;DATA POINTER            $D40F
ETRIES  rmb     1           ;ERROR TRY COUNT         $D411
STRIES  rmb     1           ;SEEK TRY COUNT          $D412
CLD     rmb     2           ;CURRENT LOOK UP DIR     $D413
CUD     rmb     2           ;CURRENT USER DIR        $D415
DIRDN   rmb     1           ;DIRECTORY DRIVE NUM     $D417
BKLN    rmb     2           ;BACK LINK               $D418
SINDIR  rmb     1           ;SINGLE DIR SEARCH       $D41A
AVLPNT  rmb     2           ;AVAIL POINTER           $D41B
SECMAP  rmb     NODR*6      ;SECTOR MAPS             $D41D

        org     $D435

VRFYFG  fcb     $FF         ;VERIFY FLAG

DRVINFO fcb     $00,$00,$00,$00

* SYSTEM ENTRY ROUTINES
*
* THE FOLLOWING THREE ROUTINES SHOULD
* BE ACCESSED THROUGH THE SYSTEM JUMP
* TABLE.

* INIT
*
* INIT IS THE FMS INITIALIZATION ROUTINE.
* NO ERRORS CAN OCCUR FROM THIS ROUTINE
* AND THE SYSTEM ASSUMES NO FILES ARE OPEN.

INIT    jsr     CINIT       ;INITIALIZE DRIVERS
        ldx     #FCBBAS     ;SET POINTER
        ldb     #10         ;SET COUNT
        bsr     INIT4       ;CLEAR SPACE
        ldx     #MAIND      ;SET MAIN DIRECTORY
        stx     CLD         ;
        stx     CUD         ;
        clr     SINDIR      ;CLEAR SINGLE DIR
                            ;
INIT2   ldx     #AVLPNT     ;POINT TO FMS SPC
        ldb     #26         ;SET COUNTER
                            ;
INIT4   clr     ,x+        ;CLEAR BYTE
        decb                ;DEC THE COUNT
        bne     INIT4       ;REPEAT?
        jmp     UNLOCK

* EXCLS
*
* EXCLS IS THE FMS EXIT ROUTINE.
* EXECUTION OF THIS ROUTINE TELLS THE
* SYSTEM TO CLOSE ALL OPEN FILES.

EXCLS   jsr     LOCK        ;LOCK FMS
EXCLS1  ldx     FCBBAS      ;GET LINK BASE
        beq     INIT2       ;ANY FCBS LEFT?
        leax    -FLP,x      ;
        stx     FCBSTR      ;SET ACT. FCB
        pshs    y           ;SAVE REGISTER
        jsr     CLOSE       ;GO CLOSE FILE
        puls    y           ;RESTORE REGISTER
        bcc     EXCLS1      ;REPEAT
                            ;
        ldx     FCBSTR      ;SET TO FCB
        clr     2,x         ;CLEAR FAS
        jsr     UNLOCK      ;UNLOCK FMS
        ldb     #$FF        ;SET ERROR
        rts

* CMND
*
* CMND IS THE FMS COMMAND INTERPRETER.
* ALL COMMAND CALLS TO FMS SHOULD BE
* THROUGH THIS ROUTINE.

CMND    tst     PR1         ;PROCESS ACTIVE?
        beq     CMND1       ;
        jsr     LOCK        ;LOCK FMS
                            ;
CMND1   pshs    b,y         ;SAVE REGISTERS
        stx     FCBSTR      ;SET FCB STORAGE
        clr     FES,x       ;CLEAR ERRORS
        ldb     FFC,x       ;GET FUNCTION CODE
        bne     CMND4       ;IO CODE?
                            ;
        ldb     FAS,x       ;GET ACTIVITY BYTE
        beq     CMND3       ;
                            ;
        cmpb    #2          ;IS IT WRITE?
        beq     CMND2       ;
        jsr     SRDSEQ      ;GO DO READ
CMND15  ldx     FCBSTR      ;RESTORE X
        bcs     CMND7       ;ERROR?
        tst     PR1         ;PR 1 ACTIVE?
        bne     CMND8       ;
        clrb                ;CLEAR ERRORS
        puls    b,y         ;RESTORE REGISTERS
        rts                 ;
                            ;jmp  $f82a

CMND2   jsr     SWTSEQ      ;GO DO WRITE
        bra     CMND15      ;
                            ;
CMND3   ldb     #STER       ;SET STATUS ERROR
        bra     CMND7       ;REPORT ERROR
                            ;
CMND4   cmpb    #LSTFC      ;CHECK CODE
        bls     CMND5       ;
        ldb     #ICER       ;SET CODE ERROR
        bra     CMND7       ;REPORT IT
                            ;
CMND5   decb                ;DEC THE CODE
        aslb                ;CODE TIMES 2
        ldx     #CODTBL     ;POINT TO TABLE
        jsr     [b,x]       ;GO DO ROUTINE
        ldx     FCBSTR      ;RESTORE FCB PNTR
        bcc     CMND8       ;ERRORS?
                            ;
CMND7   stb     FES,x       ;SET ERROR
                            ;
CMND8   jsr     UNLOCK      ;
        tst     FES,x       ;TEST FOR ERROR
        puls    b,y         ;RESTORE REGISTERS
        rts

* CODTBL
*
* CODTBL IS THE SYSTEM TABLE OF
* FUNCTION CODE ROUTINE ADDRESSES.

CODTBL  fdb     OPNRD       ;OPNRD   OPEN FOR READ
        fdb     OPNWT       ;OPNWT   OPEN FOR WRITE
        fdb     OPNRW       ;OPNRW   OPEN FOR READ WRITE
        fdb     CLOSE       ;CLOSE   CLOSE FILE
        fdb     REWIND      ;REWIND  REWIND FILE
        fdb     OPNDIR      ;OPNDIR  OPEN DIRECTORY
        fdb     GETIR       ;GETIR   GET INFO RECORD
        fdb     PUTIR       ;PUTIR   PUT INFO RECORD
        fdb     READSS      ;READSS  READ SINGLE SECTOR
        fdb     WRITSS      ;WRITSS  WRITE SINGLE SECTOR
        fdb     WRTDIR      ;WRTDIR  WRITE DIRECTORY
        fdb     DELETE      ;DELETE  DELETE FILE
        fdb     RENAME      ;RENAME  RENAME FILE
        fdb     RETRY4      ;RETRY4  APPEND FILES
        fdb     NEXTS       ;NEXTS   NEXT SEQU. SECTOR
        fdb     OPNSIR      ;OPNSIR  OPEN SYSTEM INFO
        fdb     GETRAN      ;GETRAN  GET RANDOM CHARACTER
        fdb     PUTRAN      ;PUTRAN  WRITE RANDOM CHARACTER
        fdb     WTAPP       ;WTAPP   OPEN WRITE APPEND
        fdb     NXTRDY      ;NXTRDY  FIND NEXT READY DRIVE
        fdb     POSIT       ;POSIT   POSITION TO RECORD N
        fdb     BKREC       ;BKREC   BACKUP ONE RECORD

*
* THE FOLLOWING ROUTINES ARE THE SYSTEM
* LEVEL ROUTINES USED BY THE FMS.

* SETFCB
*
* SETFCB IS USED TO TELL THE SYSTEM
* WHERE THE NEW FCB IS LOCATED.
* IT SETS UP A CHAINED STRUCTURE
* WITH FCBBAS AS THE BASE OF THE CHAIN.
*
*   ENTRY: NONE
*   EXIT:  CS IF FCB EXISTS
*          ALL REGISTERS CHANGED

SETFCB  bsr     FNDFCB      ;FIND FCB
        bne     SETFC2      ;ERROR?
        ldb     #FBER       ;FILE BUSY
        orcc    #1          ;SEC SHOW ERROR
        rts                 ;
                            ;
SETFC2  std     ,x         ;SET FCB
        ldx     ,x         ;GET FCB POS
        clr     ,x         ;CLEAR LAST LINK
        clr     1,x         ;ALSO SHOWS NO ERROR
        rts

* REMFCB
*
* REMFCB IS USED TO REMOVE AN ACTIVE
* FCB FROM THE SYSTEM FCB LIST.
*
*   ENTRY: NONE
*   EXIT:  CS IF FCB NOT FOUND
*          ALL REGISTERS CHANGED

REMFCB  bsr     FNDFCB      ;FIND FCB
        beq     REMFC2      ;ERROR?
        ldb     #IFER       ;SET ERROR CODE
        orcc    #1          ;SEC SHOW ERROR
        rts                 ;
                            ;
REMFC2  ldd     [,x]       ;GET NEXT LINK
        std     ,x         ;SAVE NEW VALUE
        andcc   #$FE        ;CLC CLEAR ERRORS
        rts

* FNDFCB
*
* FNDFCB TRIES TO FIND THE FCB IN
* FCBSTR IN THE SYSTEM TABLE.
*
*   ENTRY: NONE
*   EXIT:  NE IF NOT FOUND
*          A & B DESTROYED
*          X POINTS TO FCB

FNDFCB  ldd     FCBSTR      ;PICKUP FCB
        addd    #FLP        ;SET TO LIST PNTR
        ldx     #FCBBAS     ;GET BASE LOC.
FNDFC3  ldy     ,x         ;CHECK FOR LIST END
        bne     FNDFC4      ;
        andcc   #$FB        ;SET NE BIT
        rts                 ;
                            ;
FNDFC4  cmpd    ,x         ;COMPARE VALUE
        bne     FNDFC6      ;
        rts                 ;RET WITH EQ
                            ;
FNDFC6  ldx     ,x         ;MOVE TO NEXT FCB
        bra     FNDFC3      ;REPEAT

* CLRFCB
*
* CLRFCB CLEARS SELECTED SECTIONS OF
* THE CURRENT FCB.
*
*   ENTRY: NONE
*   EXIT:  ALL REGISTERS CHANGED

CLRFCB  ldx     FCBSTR      ;GET FCB
        clra                ;CLEAR A BYTE
        clrb                ;GET SECTOR LENGTH \\\\
        bsr     CLRFC2      ;CLEAR OUT
        ldb     #FSB-FSA    ;
CLRFC2  sta     FSA,x       ;CLEAR BYTE
        leax    1,x         ;BUMP THE POINTER
        decb                ;DEC THE COUNT
        bne     CLRFC2      ;LOOP TIL DONE
        rts

* COPNAM
*
* COPNAM WILL COPY THE NAME (NL BYTES)
* FROM FCB AREA FFN (FILE NAME) TO THE
* AREA FWB (WORK BUFFER).
*
*   ENTRY: NONE
*   EXIT:  ALL REGISTERS CHANGED

COPNAM  ldx     FCBSTR      ;PICKUP FCB
        ldb     #NL         ;SET NAME LENGTH
COPNA2  lda     FFN,x       ;GET CHARACTER
        sta     FWB,x       ;MOVE IT
        leax    1,x         ;BUMP THE POINTER
        decb                ;DEC THE COUNTER
        bne     COPNA2
        rts

* CMPNAM
*
* CMPNAM WILL COMPARE THE NAME (NL
* BYTES LONG) IN THE FCB AREA FWB
* (WORK BUFFER) TO THE CONTENTS OF
* FCB AREA FFN (FILE NAME).
*
*   ENTRY: NONE
*   EXIT:  NE IF NOT EQUAL
*          ALL REGISTERS CHANGED

CMPNAM  ldx     FCBSTR      ;PICKUP FCB
        ldb     #NL         ;SET LENGTH
                            ;
CMPNA1  lda     FFN,x       ;GET CHARACTER
        ora     #$20        ;MAKE LOWERCASE
        pshs    a           ;
        lda     FWB,x       ;GET 2ND CHARACTER
        ora     #$20        ;MAKE LOWERCASE
        cmpa    ,s+         ;COMPARE THEM
        bne     CMPNA4      ;NOT EQUAL?
                            ;
        leax    1,x         ;BUMP THE POINTER
        decb                ;DEC THE COUNTER
        bne     CMPNA1      ;REPEAT
CMPNA4  rts

* GETRAN   * FFC #17 *
*
* GETRAN GETS A RANDOM CHARACTER FROM
* THE CURRENT FSB.
*
*   ENTRY: FRI CONTAINS DESIRED INDEX
*   EXIT:  CS IF FRI OUT OF RANGE
*          A CONTAINS CHARACTER
*          B & X CHANGED

GETRAN  ldx     FCBSTR      ;GET FCB
        ldb     FAS,x       ;GET STATUS
        lsrb                ;CHECK IF R OR RW
        bcc     REWIN2      ;GO SET ERROR
        ldb     FRI,x       ;GET RANDOM INDEX
        jmp     RDSEQ0

* PUTNXT
*
* PUTNXT PUTS THE CHARACTER IN A INTO
* THE NEXT AVAILABLE FSB LOCATION
* POINTED TO BY THE FDI.
*
*   ENTRY: A CONTAINS CHARACTER
*   EXIT:  CS IF LAST FSB POS. USED
*          B & X CHANGED

PUTNXT  ldx     FCBSTR      ;PICKUP FCB
        ldb     FDI,x       ;GET DATA INDEX
        inc     FDI,x       ;BUMP FDI
        abx                 ;ADD IN INDEX
        sta     FSB,x       ;PUT THE CHARACTER
        incb                ;BUMP IT
        bne     PUTRA2      ;OVER END OF FSB?
        orcc    #1          ;SEC OVER END!
        rts

* PUTRAN   * FFC #18 *
*
* PUTRAN PUTS THE CHARACTER IN A
* IN THE FSB LOCATION INDEXED BY
* THE FRI.
*
*   ENTRY: A CONTAINS CHARACTER
*          FRI CONTAINS INDEX
*   EXIT:  CS IF FRI OUT OF RANGE
*          B & X CHANGED

PUTRAN  ldx     FCBSTR      ;GET FCB
        ldb     FAS,x       ;CHECK IF RW
        andb    #3          ;MASK OFF
        cmpb    #3          ;IS IT RW?
        bne     REWIN2      ;SKIP IF ERROR
        orb     #$80        ;SET UPDATE BIT
        stb     FAS,x       ;SAVE IT
        ldb     FID,x       ;CHECK WP
        bitb    #$80        ;
        bne     PUTRA4      ;
        ldb     FRI,x       ;GET RANDOM INDEX
        abx                 ;ADD IN INDEX
        sta     64,x        ;FSB,x PUT CHARACTER
                            ;
PUTRA2  andcc   #$FE        ;CLC CLEAR ERROR
        rts                 ;
                            ;
PUTRA4  ldb     #WPER       ;SET WP ERROR
        orcc    #1          ;SEC SET ERROR
        rts

* SRDSEQ
*
* SRDSEQ IS THE HIGH LEVEL READ
* SEQUENTIAL CHARACTER ROUTINE.
* CONTROL CHARACTERS AND SPACE
* EXPANSION ARE HANDLED HERE UNLESS
* FSC IS NEGATIVE.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR
*          B HAS ERROR NUMBER
*          A & X CHANGED

SRDSEQ  lda     FSC,x       ;CHECK FOR SP. EXP.
        bmi     RDSEQ       ;CONTROL IGNORE?
        beq     SRDSE2      ;ACTIVE EXPANSION?
        dec     FSC,x       ;DEC THE SPACE COUNT
        lda     #SPC        ;SETUP SPACE
        bra     SRDSE7      ;FINISH UP
                            ;
SRDSE2  bsr     RDSEQ       ;READ NEXT CHAR
        bcs     SRDSE8      ;ERRORS?
        cmpa    #DELC       ;IS IT DELETED?
        bhi     SRDSE7      ;SKIP ALL SPECIALS
        beq     SRDSE2      ;
        cmpa    #SCC        ;SPACE COMP CHAR?
        bne     SRDSE6      ;
        bsr     RDSEQ       ;GO GET COUNT
        bcs     SRDSE8      ;ERROR?
        ldx     FCBSTR      ;RESTORE POINTER
        sta     FSC,x       ;SAVE COUNT
        bra     SRDSEQ      ;REPEAT
                            ;
SRDSE6  tsta                ;IS CHAR NULL?
        beq     SRDSE2      ;IGNORE IF SO
                            ;
SRDSE7  andcc   #$FE        ;CLC CLEAR ERROR
SRDSE8  rts

* REWIND   * FFC #5 *
*
* REWIND WILL LOGICALLY REWIND THE
* FILE SPECIFIED IN THE FCB.
*
*   ENTRY: NONE
*   EXIT:  SAME AS RDNEXT

REWIND  jsr     DOSTAT      ;CHECK STATUS
        bcs     REWIN2      ;ERROR?
        bita    #1          ;CHECK FOR R BIT
        beq     REWIN2      ;ERROR?
        sta     FFC,x       ;SET FFC
        jmp     OPNRD1      ;GO SETUP FILE
                            ;
REWIN2  ldb     #STER       ;SET ERROR CODE
        orcc    #1          ;SEC SHOW ERROR
        rts

* RDSEQ
*
* RDSEQ IS THE LOW LEVEL GET
* SEQUENTIAL CHARACTER ROUTINE.
*
*   ENTRY: NONE
*   EXIT:  CHAR IN A
*          CS IF ERROR
*          B & X DESTROYED

RDSEQ   ldx     FCBSTR      ;PICKUP FCB
        ldb     FDI,x       ;GET DATA INDEX
        beq     RDSEQ1      ;
        inc     FDI,x       ;BUMP DATA INDEX
                            ;
RDSEQ0  abx                 ;ADD IN OFFSET
        lda     FSB,x       ;GET CHARACTER
        andcc   #$FE        ;CLC
        rts                 ;
                            ;
RDSEQ1  bsr     RDNEXT      ;GET NEXT RECORD
        bcc     RDSEQ       ;ERRORS?
        rts

* RDNEXT
*
* RDNEXT READS THE NEXT SEQUENTIAL
* RECORD IF IT EXISTS.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR
*          B HAS ERROR NUMBER
*          A & X CHANGED

RDNEXT  ldx     FCBSTR      ;PICKUP FCB
        ldd     FSB,x       ;GET TRACK & SECTOR
        inc     FRN+1,x     ;BUMP REC NUM
        bne     RDNEX1      ;
        inc     FRN,x       ;
                            ;
RDNEX1  cmpd    #$0000      ;TEST IF 0 LINK
        beq     RDNEX4      ;END OF FILE?
RDNEX2  std     FCS,x       ;SET CURRENT ADR.
        pshs    a           ;
        lda     #RS         ;SET RECORD START
        sta     FDI,x       ;SAVE IT
        puls    a           ;
        bsr     READSS      ;GO DO READ
        bcc     RDNEX8      ;ERRORS?
        bitb    #$80        ;CHECK NOT READY
        beq     RDNEX3      ;
        ldb     #NRER       ;SET ERROR
        bra     RDNEX6      ;
                            ;
RDNEX3  ldb     #RDER       ;SET READ ERROR
        bra     RDNEX6      ;
                            ;
RDNEX4  ldb     #EFER       ;SET EOF ERROR
RDNEX6  orcc    #1          ;SEC SHOW ERROR
RDNEX8  rts

* READSS   * FFC #9 *
*
* READSS READS A SINGLE RECORD (SECTOR)
* FROM THE DISK.
*
*   ENTRY: NONE
*   EXIT:  CS IF READ ERROR
*          ALL REGISTERS CHANGED

READSS  bsr     CLRTRY      ;CLEAR TRY COUNTERS
        ldx     FCBSTR      ;SET POINTER
        jsr     DRIVE       ;DO DRIVE SEL
        bcs     READS6      ;
                            ;
READS2  bsr     GETCUR      ;GET DISK ADDRESS
        jsr     READ        ;GO READ RECORD
        bne     READS4      ;ERRORS?
        andcc   #$FE        ;CLC CLEAR ERROR
        rts                 ;
                            ;
READS4  pshs    b           ;SAVE B
        bsr     RETRY       ;CHECK IF RETRY
        puls    b           ;RESTORE B
        bcc     READS2      ;TRY AGAIN?

READS6  rts

* GETCUR
*
* GETCUR GETS THE CURRENT RECORD ADDRESS
* (TRACK AND SECTOR) INTO A & B.
* IF ILLEGAL ADDRESS, CARRY IS SET.
*
*   ENTRY: NONE
*   EXIT:  CS IF ILLEGAL ADR.
*          A = TRACK NUMBER
*          B = SECTOR NUMBER
*          X POINTS TO FSB

GETCUR  ldx     FCBSTR      ;PICKUP FCB
        ldd     FCS,x       ;GET TRACK & SECTOR
        leax    FSB,x       ;ADD FSB BIAS
        rts

* CLRTRY
*
* CLRTRY CLEARS THE ERROR TRY COUNTERS
*
*   ENTRY: NONE
*   EXIT:  A CLEARED

CLRTRY  clra                ;CLEAR A
        sta     ETRIES      ;CLEAR COUNTERS
        sta     STRIES
        rts

* RETRY
*
* RETRY WILL TEST THE TRY COUNTERS
* ETRIES AND STRIES TO SEE IF THEY
* ARE AT MAXIMUM.
* A RESTORE OPERATION IS PERFORMED
* IF NECESSARY.
*
*   ENTRY: NONE
*   EXIT:  CS IF NO MORE TRIES LEFT

RETRY   bitb    #$10        ;CHECK IF SEEK ERROR
        bne     RETRY2      ;
        bitb    #$80        ;CHECK NOT READY
        bne     RETRY6      ;
        ldb     ETRIES      ;CHECK ERROR CNTR
        incb                ;BUMP IT ONE
        cmpb    #RTC        ;IS IT MAXIMUM?
        beq     RETRY2      ;
                            ;
        stb     ETRIES      ;SAVE COUNT
        bra     RETRY4      ;
                            ;
RETRY2  clr     ETRIES      ;CLEAR COUNTER
        ldb     STRIES      ;CHECK SEEK CNTR
        incb                ;BUMP IT
        cmpb    #RSC        ;IS IT MAXIMUM?
        beq     RETRY6      ;
        stb     STRIES      ;SAVE COUNTER
        ldx     FCBSTR      ;
        jsr     RESTORE     ;GO RESTORE
                            ;
RETRY4  andcc   #$FE        ;CLC CLEAR ERROR
        rts                 ;
                            ;
RETRY6  orcc    #1          ;SEC SET ERROR
        rts

* WRITSS   * FFC #10 *
*
* WRITSS IS THE SYSTEM WRITE SINGLE
* SECTOR ROUTINE.
*
*   ENTRY: NONE
*   EXIT:  CS IF WRITE ERROR
*          ALL REGISTERS CHANGED

WRITSS  bsr     CLRTRY      ;CLEAR TRY COUNTERS
        ldx     FCBSTR      ;SET POINTER
        jsr     DRIVE       ;DO DRIVE SEL
        bcs     WRITS6      ;
                            ;
WRITS2  ldx     FCBSTR      ;SET POINTER
        bsr     GETCUR      ;GET CURRENT SEC
        jsr     WRITE      ;DO ACTUAL WRITE
        bne     WRITS4      ;ERRORS?
                            ;
        lda     VRFYFG      ;VERIFY SECTOR?
        beq     SWTSE6      ;NO VERIFY
                            ;
        jsr     VERIFY      ;GO DO VERIFY
        beq     SWTSE6      ;ERROR?
                            ;
WRITS4  bitb    #$40        ;CHECK IF W.P.
        bne     WRITS8      ;
                            ;
        pshs    b           ;SAVE STATUS
        bsr     RETRY       ;RETRY?
        puls    b           ;RESTORE STATUS
        bcc     WRITS2      ;TRY AGAIN
WRITS6  rts                 ;ERROR RETURN
                            ;
WRITS7  ldb     #$20        ;SET ERROR
WRITS8  orcc    #1          ;SHOW ERROR
        rts                 ;ERROR RETURN

* SWTSEQ
*
* SWTSEQ IS THE HIGH LEVEL WRITE
* SEQUENTIAL CHARACTER ROUTINE.
* SPACE COMPRESSION IS HANDLED HERE
* UNLESS FSC IS NEGATIVE.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR
*          B HAS ERROR NUMBER
*          A & X CHANGED

SWTSEQ  ldx     FCBSTR      ;PICKUP FCB
        ldb     FSC,x       ;GET SPC COUNT
        bmi     WTSEQ       ;WRITE IF NEG.
        cmpa    #SPC        ;IS CHARACTER SPACE?
        bne     SWTSE4      ;
        incb                ;BUMP THE COUNT
        stb     FSC,x       ;SAVE IT
        cmpb    #MAXSP      ;MAXIMUM?
        bne     SWTSE6      ;
        bra     PUTSPC      ;** FIX FOR 128 SPACES **
                            ;
SWTSE2  bsr     PUTSPC      ;GO PUT SPACES
        bcc     SWTSEQ      ;ERRORS?
        rts                 ;
                            ;
SWTSE4  tstb                ;COUNT ZERO?
        beq     WTSEQ       ;
        bra     SWTSE2      ;DO SPACES
                            ;
SWTSE6  andcc   #$FE        ;CLC CLEAR ERRORS
        rts

* PUTSPC
*
* PUTSPC IS THE ROUTINE WHICH WRITES
* THE SPACE COMPRESSION CODE AND THE
* SPACE COUNT.
*
*   ENTRY: B HAS COUNT
*   EXIT:  A PRESERVED

PUTSPC  pshs    a           ;SAVE CHAR
        cmpb    #1          ;IS COUNT 1?
        bne     PUTSP2      ;
        lda     #$20        ;SETUP SPACE
        bra     PUTSP4      ;GO WRITE
                            ;
PUTSP2  lda     #SCC        ;SETUP SCC
        bsr     WTSEQ       ;WRITE IT OUT
        puls    a           ;
        bcs     PUTSP6      ;ERROR?
        pshs    a           ;SAVE CHAR
        ldx     FCBSTR      ;PICKUP FCB
        lda     FSC,x       ;GET COUNT
PUTSP4  clr     FSC,x   	;CLEAR COUNT
        bsr     WTSEQ       ;WRITE COUNT
        puls    a           ;RESTORE CHAR
PUTSP6  rts

* WTSEQ
*
* WTSEQ WRITES THE NEXT CHARACTER TO
* THE FSB AREA OF THE FCB.
*
*   ENTRY: A HAS CHARACTER
*   EXIT:  CS IF ERROR
*          B HAS ERROR NUMBER
*          X CHANGED

WTSEQ   ldx     FCBSTR      ;GET FCB POINTER
        ldb     FAS,x       ;GET ACTIVE STATUS
        cmpb    #2          ;IS IT WRITE?
        lbne    REWIN2      ;ERROR IF NOT
        ldb     FDI,x       ;GET INDEX
        cmpb    #RS         ;IS IT BEGINNING?
        bne     WTSEQ2      ;
        pshs    a           ;SAVE CHAR.
        bsr     WTNEXT      ;GO WRITE RECORD
        puls    a           ;RESTORE CHAR.
        bcs     WTSEQ4      ;ERRORS?
                            ;
WTSEQ2  jsr     PUTNXT      ;PUT CHARACTER
        bcc     WTSEQ4      ;LAST SPACE USED?
        ldb     #RS         ;SET RECORD START
        ldx     FCBSTR      ;POINT TO FCB
        stb     FDI,x       ;SET INDEX
        andcc   #$FE        ;CLC CLEAR ERRORS
WTSEQ4  rts

* CLRLRN

CLRLRN  ldx     FCBSTR      ;GET POINTER
        clra                ;
        clrb                ;
        std     FRN,x       ;CLEAR LRN
        std     FSB+2,x     ;CLEAR ACTUAL RN
        bra     WTNEX1      ;GO WRITE NEXT

* WTNEXT
*
* WTNEXT WRITES THE NEXT RECORD.
*
*   ENTRY: X = FCB
*   EXIT:  CS IF ERROR
*          REGISTERS CHANGED

WTNEXT  ldb     FSA+1,x     ;FIRST RECORD?
        bne     WTNEX1      ;
        ldb     FMP,x       ;CHECK FOR RANDOM
        beq     ASNNXT      ;
        clr     FMP,x       ;CLEAR FLAG
        bsr     ASNNXT      ;GO ASSIGN
        bcs     GETFS2      ;ERROR?
        bsr     CLRLRN      ;CLEAR LRN
        bcs     GETFS2      ;ERROR?
        bsr     CLRLRN      ;CLEAR NEXT
        bcs     GETFS2      ;ERROR?
        ldx     FCBSTR      ;GET FCB
        ldb     #2          ;SET FSM COUNT
        stb     FMP,x       ;
        ldd     FSA,x       ;GET START ADDR
        jmp     UPDF75      ;GO DO UPDATE
                            ;
WTNEX1  bsr     GETFST      ;GET FIRST AVAIL
        ldx     FCBSTR      ;SET FCB PNTR
        std     FSB,x       ;SET FORWARD LINK
        jsr     WRITSS      ;WRITE RECORD
        bcc     ASNNXT      ;ERROR?
        jmp     WRTERR      ;REPORT ERROR

* GETFST
*
* GETFST LOADS THE FIRST AVAILABLE
* SECTOR ADDRESS INTO A & B.
*
*   ENTRY: NONE
*   EXIT:  EQ IF FSTAVL = 00
*          X UNCHANGED
*          A & B = FSTAVL H & L

GETFST  bsr     FSECMP      ;FIND SECTOR MAP
        ldd     ,x         ;GET FIRST AVAIL.
GETFS2  rts

* FSECMP
*
* FSECMP FINDS THE SECTOR MAP
* CORRESPONDING TO THE CURRENT
* DRIVE SELECTED IN THE FCB.
*
*   ENTRY: NONE
*   EXIT:  EQ IF AVAIL NOT SET
*          X POINTS TO SECTOR MAP

FSECMP  ldx     FCBSTR      ;PICKUP FCB
        ldb     FDN,x       ;GET DRIVE NUMBER
        lda     #6          ;MULTIPLY TIMES 6
        mul                 ;
        ldx     #SECMAP     ;POINT TO MAPS
        abx                 ;FIX POINTER
        stx     AVLPNT      ;SET POINTER
        tst     ,x         ;IS AVAIL EMPTY?
        rts

* ASNNXT
*
* ASNNXT ASSIGNS THE NEXT AVAILABLE
* RECORD TO THE CURRENT OPEN WRITE
* FILE POINTED TO BY THE FCB.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR
*          ALL REGISTERS CHANGED

ASNNXT  bsr     GETFST      ;GET FSTAVL
        bne     ASNNX2      ;IS IT ZERO?
        ldb     #DFER       ;DISK FULL!
ASNNX1  orcc    #1          ;SEC SET ERROR
        rts                 ;
                            ;
ASNNX2  ldx     FCBSTR      ;GET FCB POINTER
        std     FEA,x       ;SET END ADDRESS
        tst     FSA+1,x     ;IS THIS FIRST?
        bne     ASNNX4      ;JUMP AHEAD IF NOT
        std     FSA,x       ;SET START ADDRESS
                            ;
ASNNX4  inc     FSZ+1,x     ;BUMP FILE SIZE
        bne     ASNNX6      ;
        inc     FSZ,x       ;FIX MSB
                            ;
ASNNX6  tst     FMP,x       ;CHECK FOR RANDOM
        beq     ASNN65      ;
        jsr     UPDFSM      ;UPDATE FSM ENTRY
        bcs     ASNNX1      ;ERROR?
        ldx     FCBSTR      ;GET FCB
        ldd     FEA,x       ;GET END ADDRESS
                            ;
ASNN65  jsr     RDNEX2      ;READ NEXT RECORD
        bcs     ASNNX1      ;READ ERROR?
        ldx     FCBSTR      ;POINT TO FCB
        ldd     FSB,x       ;GET FOR. LINK
        pshs    a,b         ;SAVE LINK
        bsr     FSECMP      ;FIND SECTOR MAP
        puls    a,b         ;RESTORE LINK
        std     ,x         ;SET FIRST AVAIL
        bne     ASNNX7      ;FULL DISK??
                            ;
        clr     2,x         ;CLEAR OUT REST
        clr     3,x         ;
        clr     4,x         ;
        clr     5,x         ;
        bra     ASNNX8      ;GO AHEAD
                            ;
ASNNX7  ldy     4,x         ;GET SEC COUNT
        leay    -1,y        ;DEC BY 1
        sty     4,x         ;SAVE RESULT
                            ;
ASNNX8  clra                ;CLEAR REGISTER
        ldx     FCBSTR      ;SET POINTER
        inc     FRN+1,x     ;INC LRN
        bne     ASNN85      ;
        inc     FRN,x       ;
                            ;
ASNN85  clrb                ;GET SECTOR LENGTH \\\\
ASNNX9  sta     FSB,x       ;CLEAR LOCATION
        leax    1,x         ;BUMP POINTER
        decb                ;DEC THE COUNTER
        bne     ASNNX9      ;REPEAT?
                            ;
        ldx     FCBSTR      ;GET FCB PNTR
        ldd     FRN,x       ;GET LRN
        std     FSB+2,x     ;SAVE IN DATA
        andcc   #$FE        ;CLC CLEAR ERRORS
        rts

* OPN - SIR, DIR
*
* OPNIR OPENS EITHER THE SYSTEM IR
* OR THE DIRECTORY IR, DEPENDING ON
* THE ENTRY POINT.
*
*   ENTRY: NONE
*   EXIT:  B & X DESTROYED

OPNSIR  clrb                ;SET TRACK 0
        pshs    b
        ldb     #ISEC       ;GET SECTOR
        bra     OPNIR

* ------- No Path to this code

OPNCUD  ldx     CUD         ;GET CUD
        stx     CLD         ;SAVE AS LOOKUP
                            ;
* -------                   ;

OPNDIR:                     ;
OPNCLD  ldb     CLD         ;GET TRACK
        pshs    b           ;SAVE IT
        ldb     CLD+1       ;GET SECTOR
                            ;
                            ;
OPNIR   ldx     FCBSTR      ;SET FCB POINTER
        stb     FSB+1,x     ;SAVE SECTOR
        puls    b           ;GET TRACK
        stb     FSB,x       ;SET SECTOR PNTR
        clr     BKLN        ;CLEAR BACK LINK
        clrb                ;GET SECTOR LENGTH \\\\
        stb     FDI,x       ;SAVE IT
        rts

* GETIR
*
* GETIR GETS THE NEXT INFORMATION
* RECORD (IR) FROM THE FSB.
*
*   ENTRY: X = FCB
*   EXIT:  CS IF ERROR

GETIR   ldx     FCBSTR      ;SET FCB POINTER
        ldb     FDI,x       ;GET DATA INDEX
        bne     GETIR2      ;NEXT SECTOR?
                            ;
        jsr     RDNEXT      ;GET NEXT SECTOR
        bcs     GETIR8      ;ERROR?
                            ;
        ldx     FCBSTR      ;GET FCB POINTER
        tst     BKLN        ;TEST BACK LINK
        bne     GETIR1      ;IS IT SET?
                            ;
        ldd     #$0005 		;< OLD Code
*       ldd     FSB+4,x    	;GET NEW BL  <- CORRECTED
        std     BKLN        ;SAVE IT
                            ;
GETIR1  lda     #IRS        ;SET START INDEX
        sta     FDI,x       ;
        ldd     FCS,x       ;GET CURRENT SEC ADR
        std     FCD,x       ;SET CURRENT IR
                            ;
GETIR2  lda     FDI,x       ;GET CURRENT INDEX
        sta     FCD+2,x     ;SAVE IT
        ldb     #IRL        ;SET LENGTH
                            ;
GETIR4  pshs    b,x         ;SAVE VALUES
        jsr     RDSEQ       ;READ NEXT CHAR
        puls    b,x         ;RESTORE VALUES
        sta     FFN,x       ;PUT THE CHAR
        leax    1,x         ;BUMP THE POINTER
        decb                ;DEC THE COUNT
        bne     GETIR4      ;FINISHED?
*       clrb                ;CLEAR ERRORS
        andcc   #$FE        ;CLC CLEAR ERROR
GETIR8  rts

* PUTIR
*
* PUTIR PUTS THE IR INTO THE FSB.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR

PUTIR   ldx     FCBSTR      ;SET FCB POINTER
        lda     FCD+2,x     ;GET INDEX
        sta     FDI,x       ;SET IT
        ldb     #IRL        ;SET LENGTH COUNT
                            ;
PUTIR2  pshs    b,x         ;SAVE POINTERS
        lda     FFN,x       ;GET THE CHAR
        jsr     WTSEQ       ;GO WRITE CHAR
        puls    b,x         ;RESTORE POINTERS
        leax    1,x         ;BUMP THE POINTER
        decb                ;DEC THE COUNT
        bne     PUTIR2      ;REPEAT?
                            ;
        jmp     WRITSS      ;GO WRITE SECTOR

* FNDNAM
*
* FNDNAM TRIES TO FIND THE NAME IN
* FFN IN THE DIRECTORY.
*
*   ENTRY: NAME IN FFN
*   EXIT:  EQ IF FOUND
*          CS IF ERROR ( IN B )
*          REGISTERS CHANGED

FNDNAM  ldx     FCBSTR      ;GET FCB
        lda     FDN,x       ;GET DRIVE NUM
        sta     FRI,x       ;SAVE IT IN TEMP
        lda     DIRDN       ;GET DIR DRIVE NUM
        tst     SINDIR      ;SINGLE DIR ?
        bne     FNDNA1      ;
                            ;
        sta     FDN,x       ;SET NEW DRIVE NUM
        ldx     CUD         ;GET DIR POINTER
        stx     CLD         ;SET CLD
                            ;
FNDN04  cmpx    #MAIND      ;IS IT MAIN?
        beq     FNDN06      ;
        bsr     FNDNA1      ;SEARCH DIR
        bls     FNDNA3      ;FIND OR ERROR?
        ldx     BKLN        ;GET BACK LINK
        stx     CLD         ;SET CLD
        bra     FNDN04      ;REPEAT
                            ;
FNDN06
        ldx     FCBSTR      ;SET POINTER
        lda     FRI,x       ;RESTORE DN
        sta     FDN,x       ;
        bpl     FNDNA1      ;DRIVE SPECIFIC?
                            ;
FNDN08  jsr     NXTRDY      ;GET NEXT RDY DRV
        bcs     FNDNA9      ;ERROR?
        bsr     FNDNA1      ;DO SEARCH
        bls     FNDNA3      ;FIND OR ERROR?
        jsr     RSTNAM      ;RESTORE NAME
        bra     FNDN08      ;
                            ;
FNDNA1  ldx     FCBSTR      ;SET POINTER
        clr     SINDIR      ;CLEAR MODE
        jsr     COPNAM      ;COPY NAME TO FWB
        jsr     OPNDIR      ;OPEN DIRECTORY
                            ;
FNDNA2  jsr     GETIR       ;GET RECORD
        bcc     FNDNA4      ;ERROR?
        cmpb    #EFER       ;END OF FILE?
        beq     FNDNA9      ;
        orcc    #1          ;SEC SET ERROR
FNDNA3  rts                 ;ERROR RETURN
                            ;
FNDNA4  ldx     FCBSTR      ;POINT TO FCB
        lda     FFN,x       ;GET CHAR
        beq     FNDNA8      ;NO MORE?
        bpl     FNDNA6      ;DELETED NAME?
        bsr     SETFD       ;SET DELETED
                            ;
FNDNA6  jsr     CMPNAM      ;COMPARE NAME
        bne     FNDNA2      ;EQUAL?
        andcc   #$FE        ;CLC CLEAR ERRORS
        rts                 ;
                            ;
FNDNA8  bsr     SETFD       ;
FNDNA9  andcc   #$FB        ;SHOW NO FIND
        andcc   #$FE        ;CLC CLEAR ERRORS
        rts                 ;
                            ;
SETFD   lda     FFD+1,x     ;FIRST DELETED?
        bne     SETFD2      ;
        ldd     FCD,x       ;GET CURRENT ADR
        std     FFD,x       ;SET FIRST DELETED
        lda     FCD+2,x     ;GET INDEX
        sta     FFD+2,x     ;SAVE IT
SETFD2  rts

* GETAVL
*
* GETAVL SETS THE SECTOR MAP POINTERS
* IF THEY HAVE NOT BEEN SET.
*
*   ENTRY: NONE
*   EXIT:  CS SET IF ERROR
*          REGISTERS CHANGED

GETAVL  jsr     FSECMP      ;FIND MAP
        bne     GETAV3      ;SET YET?
        bsr     GETDIS      ;READ IN DIS
        bcs     GETAV4      ;ERROR?
                            ;
        ldb     #6          ;SET COUNTER
        ldy     FCBSTR      ;GET FCB
        ldx     AVLPNT      ;POINT TO MAP

GETAV2  lda     FSB+FSA+IRS-4,y
        leay    1,y
        sta     ,x+
        decb                ;DEC THE COUNT
        bne     GETAV2      ;FINISHED?

GETAV3  andcc   #$FE        ;CLC CLEAR ERRORS
GETAV4  rts

* GETDIS
*
* GETDIS READS IN THE DIS SECTOR.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR
*          REGISTERS CHANGED

GETDIS  jsr     OPNSIR      ;OPEN THE DIS
        jsr     RDNEXT      ;READ NEXT BLOCK
        bcs     GETDI2      ;ERROR?
                            ;
        ldx     FCBSTR      ;SET POINTER
        ldb     #IRS        ;SET START POINT
        stb     FDI,x       ;SET INDEX
GETDI2  rts

* PUTAVL
*
* PUTAVL UPDATES THE DIS SECTOR.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR
*          REGISTERS CHANGED

PUTAVL  jsr     FSECMP      ;FIND SECTOR MAP
        bsr     GETDIS      ;GO GET DIS
        bcs     GETDI2      ;ERROR?
        ldb     #6          ;SET UP COUNTER
        ldy     FCBSTR      ;GET FCB POINTER
        ldx     AVLPNT      ;POINT TO MAP

PUTAV2  lda     ,x+
        sta     FSB+FSA+IRS-4,y
        leay    1,y
        decb                ;DEC THE COUNT
        bne     PUTAV2      ;FINISHED?
                            ;
        jsr     WRITSS      ;WRITE SECTOR
        bcc     GETDI2      ;ERROR?
        jmp     WRTERR      ;REPORT ERROR

* WRTDIR
*
* WRTDIR UPDATES THE DISK DIRECTORY.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR

WRTDIR  ldx     FCBSTR      ;POINT TO FCB
        lda     #2          ;SET FOR WRITE
        sta     FAS,x       ;
        ldd     FCD,x       ;GET CURRENT DIR
        std     FCS,x       ;SET CURRENT SECTOR
        jsr     READSS      ;READ IN DIR
        bcs     WRTDI2      ;ERROR?
        jsr     PUTIR       ;GO WRITE DIR
        bcc     WRTDI4      ;
        jmp     WRTERR      ;CHECK FOR WP ERR
                            ;
WRTDI2  ldb     #WTER       ;SET ERROR
WRTDI4  rts                 ;ERROR RETURN

* OPNRD
*
* OPNRD IS THE HIGH LEVEL SYSTEM
* ROUTINE WHICH OPENS A FILE FOR
* A READ OPERATION.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR (IN B)
*          REGISTERS CHANGED

OPNRD
        jsr     SETFCB      ;SET FCB POINTER
        bcs     OPNRD2      ;ERROR?
        jsr     FNDNAM      ;LOOK UP NAME
        bcs     OPNRD2      ;ERRORS?
                            ;
        bne     LD9D6       ;WAS IT FOUND?
                            ;
        ldx     FCBSTR      ;POINT TO FCB
        tst     SINDIR      ;SINGLE DIR?
        beq     OPNRD1      ;
        lda     FID,x       ;CHECK RP BIT
        bita    #$20        ;IS IT SET?
        bne     OPNRD3      ;REPORT ERROR
                            ;
OPNRD1  jsr     SETMAX      ;SET MAX SEC
        bcs     OPNERR      ;ERROR?
        ldd     FSA,x       ;GET ADDRESS
        std     FSB,x       ;SET FRWD LINK
        jsr     SETST       ;SET STATUS
        ldb     FMP,x       ;CHECK RANDOM
        beq     OPNR15      ;
                            ;
OPNR12  pshs    b           ;SAVE COUNT
        jsr     RDNEXT      ;GET NEXT SECTOR
        puls    b           ;RESTORE COUNT
        bcs     OPNRD2      ;ERROR?
                            ;
        decb                ;DEC THE COUNT
        bne     OPNR12      ;
                            ;
        ldx     FCBSTR      ;SET FCB PNTR
        clrb                ;GET SECTOR LENGTH \\\\
        stb     FDI,x       ;
                            ;
OPNR15  andcc   #$FE        ;CLC CLEAR ERRORS
OPNRD2
        rts                 ;
                            ;
OPNRD3  ldb     #ADER       ;READ ACC DENIED
        bra     OPNERR      ;
                            ;
LD9D6   ldb     #NFER       ;FILE NOT FOUND

* OPEN ERROR

OPNERR  pshs    b           ;SAVE ERROR
        jsr     REMFCB      ;REMOVE FCB
        puls    b           ;
        orcc    #1          ;SEC  SET ERROR
        rts

* OPNWT
*
* OPNWT OPENS A FILE FOR WRITE.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR (IN B)
*          REGISTERS CHANGED

OPNWT   ldx     FCBSTR      ;SET POINTER
        tst     FDN,x       ;CHECK FOR ALL DRIVES
        bpl     OPNWT3      ;
        jsr     NXTRDY      ;FIND READY
        bcc     OPNWT3      ;FOUND ONE
        ldb     #NRER       ;NONE READY
        rts                 ;
                            ;
OPNWT3  jsr     SETFCB      ;SET FCB LINK
        bcs     OPNERR      ;ERROR?
        jsr     CLRFCB      ;CLEAR OUT FCB
        jsr     GETAVL      ;SETUP SECTOR MAP
        bcs     OPNERR      ;ERROR?
        jsr     FNDNAM      ;GO LOOK FOR NAME
        bcs     OPNERR      ;ERROR?
        bne     OPNWT4      ;FIND?
        ldb     #FEER       ;FOUND - ERROR
        bra     OPNERR      ;
                            ;
OPNWT4  jsr     SETMAX      ;SET MAX SEC
        bcs     OPNERR      ;ERROR?
        ldx     FCBSTR      ;POINT TO FCB
        ldb     #10         ;SET COUNT
OPNWT5  clr     FID,x       ;CLEAR BLOCK
        leax    1,x         ;
        decb                ;DEC THE COUNT
        bne     OPNWT5      ;
                            ;
        ldx     FCBSTR      ;
        ldd     FFD,x       ;GET FIRST DELETED
        beq     OPNWT8      ;EOF ER?
        std     FCD,x       ;SET CURRENT DIR
        lda     FFD+2,x     ;GET INDEX
        sta     FCD+2,x     ;SAVE IT
        ldd     DATE        ;GET DATE
        std     FDT,x       ;SET DATE
        lda     DATE+2
        sta     FDT+2,x

*       -- not in UniFLEX version

        lda     FDN,x       ;GET DRIVE
        ldx     #DRVINFO    ;GET TABLE POINTER
        lda     a,x         ;GET DRIVE INFO
        ldx     FCBSTR      ;POINT TO FCB
        sta     24,x        ;
                            ;
*       --                  ;
                            ;
        jsr     RSTNAM      ;RESTORE NAME
        jsr     WRTDIR      ;SET DIRECTORY
        bcs     OPNERR      ;ERROR?
        bsr     SETST       ;SET STATUS
        lda     #RS         ;SET DATA POINTER
        sta     FDI,x       ;
        andcc   #$FE        ;CLC CLEAR ERRORS
        rts                 ;
                            ;
OPNWT8  ldx     FCBSTR      ;POINT TO FCB
        clr     FMP,x       ;CLEAR FLAG
        inc     FSA+1,x     ;SET FSA NON 0
        ldd     FCD,x       ;GET POSITION
        jsr     RDNEX2      ;READ SECTOR
        bcs     OPNW85      ;ERROR?
                            ;
        jsr     WTNEX1      ;GO WRITE NEW
        bcs     OPNW85      ;ERROR?
                            ;
        jsr     WRITSS      ;WRITE NEW SECTOR
        bcc     OPNWT9      ;ERROR?
        jsr     WRTERR      ;REPORT ERROR
                            ;
OPNW85  jmp     OPNERR      ;
                            ;
OPNWT9  ldx     FCBSTR      ;SET POINTER
        ldd     FCS,x       ;GET CURRENT
        std     FFD,x       ;SET FIRST DELETED
        lda     #IRS        ;SET INDEX
        sta     FFD+2,x     ;
        jsr     PUTAVL      ;UPDATE AVLS
        bcs     OPNW85      ;
        jmp     OPNWT4      ;FINISH UP

* SETST
*
* SETST SETS THE FCB STATUS AFTER
* AN OPEN FILE COMMAND.
*
*   ENTRY: NONE
*   EXIT:  A & X CHANGED

SETST   ldx     FCBSTR      ;POINT TO FCB
        lda     FFC,x       ;GET FUNCTION CODE
        sta     FAS,x       ;SET ACTIVITY STATUS
        clr     FFC,x       ;CLEAR FUNCTION CODE
        clr     FSC,x       ;CLEAR SPC COMP
        clra                ;GET SECTOR LENGTH \\\\
        sta     FDI,x       ;SET INDEX
        rts

* NEXTS
*
* NEXTS IS THE SYSTEM ROUTINE TO
* ADVANCE TO THE NEXT SECTOR.
*
*   ENTRY: NONE
*   EXIT:  ALL CHANGED

NEXTS   bsr     DOSTAT      ;CHECK STATUS
        bcs     NEXTS4      ;ERROR?
        clr     ,x         ;
        lsra                ;READING?
        lbcs    RDNEXT      ;READ NEXT
                            ;
        ldb     #RS         ;SET START
        stb     FDI,x       ;SET INDEX
        andcc   #$FE        ;CLC CLEAR ERRORS
NEXTS4  rts

* CHKWT
*
* CHECK FOR WRITE SECTOR NECESSITY
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR

CHKWT   ldx     FCBSTR      ;GET FCB POINTER
        lda     FAS,x       ;GET STATUS
        cmpa    #$83        ;NEED WRITING?
        bne     CHKWT4      ;
                            ;
        lda     #3          ;RESET STATUS
        sta     FAS,x       ;
                            ;
CHKWT2  jsr     WRITSS      ;WRITE SECTOR
        lbcs    WRTERR      ;REPORT ERROR
                            ;
CHKWT4  andcc   #$FE        ;CLC CLEAR ERRORS
        rts

* DOSTAT
*
* DOSTAT DOES FILE STATUS CHECKING
*
*   ENTRY: NONE
*   EXIT:  ALL CHANGED
*          CS IF ERROR

DOSTAT  bsr     CHKWT       ;CHECK FOR WRITE
        bcs     DOSTA4      ;ERRORS?
                            ;
        ldx     FCBSTR      ;SET POINTER
        lda     FAS,x       ;GET STATUS
        cmpa    #3          ;IS IT RW?
        bls     CHKWT4      ;ERROR?
                            ;
        ldb     #STER       ;SET ERROR
        orcc    #1          ;SEC
DOSTA4  rts                 ;ERROR RETURN

* CLOSE
*
* CLOSE A DISK FILE
*
*   ENTRY: NONE
*   EXIT:  ALL CHANGED

CLOSE   bsr     DOSTAT      ;CHECK STATUS
        bcs     CLOSE4      ;ERROR?
        cmpa    #2          ;IS IT WRITE?
        beq     CLOSE2      ;
                            ;
CLOSE1  ldx     FCBSTR      ;GET FCB
        clr     FAS,x       ;CLEAR STATUS
        jmp     REMFCB      ;REMOVE FCB
                            ;
CLOSE2  lda     FSA+1,x     ;CHECK IF EMPTY
        bne     CLOSE3      ;EMPTY?
        jsr     DELNAM      ;DELETE NAME
        bra     CLOS35      ;
                            ;
CLOSE3  bsr     CHKWT2      ;WRITE SECTOR
        bcs     CLOSE4      ;ERROR?
        ldx     FCBSTR      ;GET POINTER
        tst     FMP,x       ;RANDOM?
        beq     CLOS32      ;
                            ;
        jsr     WTFSM       ;WRITE FSM
        bcs     CLOSE4      ;ERROR?
                            ;
CLOS32  jsr     WRTDIR      ;WRITE DIRECTORY
        bcs     CLOSE4      ;ERROR?
                            ;
        jsr     PUTAVL      ;SET AVL MAP
                            ;
CLOS35  bcc     CLOSE1      ;ERRORS?
CLOSE4  rts                 ;ERROR RETURN

* OPNRW
*
* OPNRW OPENS A FILE FOR UPDATE
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR

OPNRW   jsr     OPNRD       ;OPEN AS READ
        bcs     WTAPP4      ;ERROR?
        jsr     RDNEXT      ;READ FIRST SEC
        bcs     WTAPP4      ;ERRORS?

        lda     #3          ;SET RW STATUS
        bra     WTAPP2      ;FINISH UP

* WTAPP
*
* WTAPP IS THE SYSTEM OPEN FILE
* FOR WRITE APPEND. THE FILE MUST
* EXIST AND NEW DATA IS WRITTEN ON
* THE END OF THE FILE.
*
*   ENTRY: NONE
*   EXIT:  CS IF ERROR

WTAPP   jsr     OPNRD       ;OPEN AS READ
        bcs     WTAPP4      ;ERRORS?
                            ;
        ldx     FCBSTR      ;GET FCB POINTER
        lda     FID,x       ;GET ATT BYTE
        bita    #$80        ;CHECK WP BIT
        bne     WTAPP6      ;
                            ;
        ldd     FEA,x       ;GET END ADDRESS
        jsr     RDNEX2      ;READ IN LAST
        bcs     WTAPP4      ;ERRORS?
                            ;
        lda     #2          ;SET WRITE STATUS
                            ;
WTAPP2  ldx     FCBSTR      ;SET POINTER
        sta     FAS,x       ;SET STATUS
        andcc   #$FE        ;CLC CLEAR ERRORS
WTAPP4  rts                 ;
                            ;
WTAPP6  ldb     #WPER       ;SET ERROR
        orcc    #1          ;SEC
        rts

* RENAME
*
* RENAME IS THE SYSTEM FILE RENAME
* ROUTINE.  THE NEW NAME MUST BE IN
* FCB+FLR.
*
*   ENTRY: SEE ABOVE
*   EXIT:  CS IF ERROR

RENAME  bsr     SWAP        ;SWAP NAMES
        jsr     FNDNAM      ;GO LOOK FOR IT
        bcs     RENAM5      ;ERROR?
        beq     RENAM4      ;ALREADY EXISTS?
                            ;
        ldx     FCBSTR      ;
        ldb     #NL         ;SET COUNTER
                            ;
RENAM1  lda     FWB,x       ;GET CHAR
        sta     FFN,x       ;MOVE BACK
        leax    1,x         ;BUMP THE POINTER
        decb                ;DEC THE COUNT
        bne     RENAM1      ;
        bsr     SWPNM       ;SWAP AND FIND
        bcs     RENAM5      ;ERROR?
        ldx     FCBSTR      ;GET POINTER
        lda     FID,x       ;GET ATT BYTE
        bita    #$80        ;
        bne     WTAPP6      ;
        bita    #$60        ;CHECK DP BIT
        bne     RENAM6      ;
        bsr     SWAP        ;SWAP NAMES
        bra     DELNA2      ;WRITE DIRECTORY
                            ;
RENAM4  ldb     #FEER       ;SET ERROR
        orcc    #1          ;SEC SHOW ERROR
RENAM5  rts                 ;
                            ;
RENAM6  ldb     #DPER       ;SET ERROR
        orcc    #1          ;SEC SHOW ERROR
        rts

* SWAP
*
* SWAP THE NAME IN FLR WITH FFN.
* IF FLR HAS NULL EXT SET AS FFN.

SWAP    ldx     FCBSTR      ;SET FCB POINTER
        lda     #NL         ;SET COUNT
        sta     ETRIES      ;SAVE IT
                            ;
SWAP2   lda     FFN,x       ;GET CHARACTER
        ldb     FLR,x       ;GET OTHER
        sta     FLR,x       ;SWAP THEM
        stb     FFN,x       ;
        leax    1,x         ;BUMP TO NEXT
        dec     ETRIES      ;DEC THE COUNT
        bne     SWAP2       ;AGAIN?
                            ;
        ldx     FCBSTR      ;RESTORE POINTER
        lda     FNE,x       ;GET IST CHAR
        bne     SWAP6       ;IS IT NULL?
        ldb     #3          ;SET COUNT
SWAP4   lda     FLR+8,x     ;GET CHAR
        sta     FNE,x       ;SAVE IT
        leax    1,x         ;BUMP TO NEXT
        decb                ;DEC THE COUNT
        bne     SWAP4       ;
SWAP6   ldx     FCBSTR      ;RESTORE POINTER
        rts

* SWPNM
*
* SWAP NAMES AND DO FNDNAM

SWPNM   bsr     SWAP        ;GO DO SWAP
SWPNM2  jsr     FNDNAM      ;FIND NAME
        bcs     SWPNM4      ;ERROR?
        bne     SWPNM5      ;NO FIND?
                            ;
        ldx     FCBSTR      ;RESTORE POINTER
        andcc   #$FE        ;CLC CLEAR ERRORS
SWPNM4  rts                 ;
                            ;
SWPNM5  ldb     #NFER       ;SET ERROR
        orcc    #1          ;SEC
        rts

* DELNAM
*
* DELETE FILE NAME IN DIR

DELNAM  ldx     FCBSTR      ;POINT TO FCB
        lda     #$FF        ;SET NEGATIVE
        sta     FFN,x       ;SET VALUE
                            ;
DELNA2  jsr     WRTDIR      ;WRITE DIRECTORY
        ldx     FCBSTR      ;SET POINTER
        lda     #0          ;CLEAR STATUS
        sta     FAS,x
        rts

* WRITIT
*
* WRITIT PUTS AND WRITES NEW
* FORWARD LINK IN SECTOR.

WRITIT  std     FSB,x       ;SET NEW LINK
        jsr     WRITSS      ;WRITE SECTOR
        bcc     WRTER4      ;
                            ;
WRTERR  bitb    #$40        ;W.P. ?
        bne     WRTER1      ;
        bitb    #$80        ;
        beq     WRTER3      ;
        ldb     #NRER       ;SET NOT READY
        bra     WRTER3      ;
                            ;
WRTER1  ldb     #WPER       ;SET WP ERROR
        bra     WRTER3      ;
                            ;
* ---- No path to this code ;
                            ;
WRTER2  ldb     #WTER       ;SET WRITE ERROR

* ----

WRTER3  orcc    #1
WRTER4  rts

* DELETE
*
* DELETE A SYSTEM FILE RETURNING ITS
* SECTORS BACK TO THE LIST OF AVAIL.
*
*   ENTRY: NAME IN FFN
*   EXIT:  ALL CHANGED
*          CS IF ERROR

DELETE   jsr     GETAVL      ;GET SEC MAP
        bcs     DELET6      ;ERROR?
        bsr     SWPNM2      ;FIND NAME
        bcs     DELET6      ;ERROR?
                            ;
        ldx     FCBSTR      ;GET POINTER
        lda     FID,x       ;GET ATT BYTE
        bita    #$80        ;CHECK WP BIT
        bne     DELET7      ;
                            ;
        bita    #$60        ;CHECK DP BIT
        bne     DELET8      ;
                            ;
        jsr     FSECMP      ;FIND SEC MAP
        ldx     AVLPNT      ;GET MAP POINTER
        ldd     2,x         ;GET LAST AVAIL
        bne     DELET2      ;IS IT NULL?
        ldx     FCBSTR      ;RESTORE POINTER
        ldd     FSA,x       ;GET START ADR
        beq     DELET5      ;
        ldx     AVLPNT      ;POINT TO AVAILS
        std     ,x         ;SET NEW
        bra     DELET4      ;JUMP AHEAD
                            ;
DELET2  ldx     FCBSTR      ;SET POINTER
        jsr     RDNEX2      ;READ SECTOR
        bcs     DELET6      ;ERRORS?
        ldx     FCBSTR      ;RESTORE POINTER
        ldd     FSA,x       ;GET START ADR
        beq     DELET5      ;
        bsr     WRITIT      ;SET LINK
        bcs     DELET6      ;ERROR?
                            ;
DELET4  ldx     FCBSTR      ;SET FCB PNTR
        ldd     FEA,x       ;GET END ADR
        ldx     AVLPNT      ;POINT TO AVAILS
        std     2,x         ;SET NEW LAST
        ldx     FCBSTR      ;SET POINTER
        ldd     FSZ,x       ;GET SIZE
        ldx     AVLPNT      ;POINT TO AVAILS
        addd    4,x         ;ADD IN SECTORS
        std     4,x         ;SAVE NEW COUNT
                            ;
DELET5  jsr     DELNAM      ;DELETE NAME
        bcs     DELET6      ;ERROR?
        jsr     PUTAVL      ;WRITE AVAIL SEC
DELET6  rts                 ;
                            ;
DELET7  ldb     #WPER       ;SET ERROR
        bra     DELET9      ;
                            ;
DELET8  ldb     #DPER       ;SET ERROR
DELET9  orcc    #1          ;SEC SHOW ERROR
        rts

* UPDFSM
*
* UPDATE FILE SECTOR MAP

UPDFSM  ldd     FCS,x       ;GET CURRENT SEC
        incb    			;CHECK IF SEQUENTIAL
        cmpb    FMX,x       ;CHECK MAX
        bls     UPDFS2      ;
        ldb     #1          ;SET SECTOR 1
        inca                ;BUMP TRACK
UPDFS2  cmpd    FEA,x       ;CHECK END
        bne     UPDFS4      ;
        lda     SBC,x       ;CHECK MAX COUNT
        cmpa    #$FF        ;IS IT MAX?
        beq     UPDFS4      ;
        inca                ;BUMP COUNT
        sta     SBC,x       ;SAVE IT
        andcc	#$fe        ;clc CLEAR ERRORS
        rts                 ;RETURN
                            ;
UPDFS4  bsr     WTFSM       ;WRITE FSM
        bcs     UPDFS9      ;ERROR?
        ldx     FCBSTR      ;SET POINTER
        lda     FNK+2,x     ;GET OFFSET
        adda    #3          ;BUMP TO NEXT ENTRY
        bne     UPDFS8      ;END OF SECTOR?
        ldd     FCS,x       ;GET CURRENT
        cmpd    FSA,x       ;START ADDR?
        beq     UPDFS7      ;
UPDFS6  ldb     #FSER       ;SET ERROR
        orcc    #1			;sec
        rts                 ;RETURN
                            ;
UPDFS7  ldd     FSB,x       ;GET LINK
UPDF75  std     FNK,x       ;SET POINTER
        lda     #4          ;SET INITIAL OFFSET
UPDFS8  sta     FNK+2,x     ;
        ldd     FEA,x       ;GET END ADDR
        std     FLR,x       ;MARK POSITION
        lda     #1          ;SET COUNT
        sta     SBC,x       ;
        andcc	#$fe        ;clc CLEAR ERRORS
UPDFS9  rts                 ;RETURN

* WTFSM
*
* WRITE FILE SECTOR MAP

WTFSM   ldd     FNK,x       ;GET RECORD
        jsr     RDNEX2      ;READ SECTOR
        bcs     UPDFS9      ;ERROR?
        ldx     FCBSTR
        tfr     x,y
        ldb     FNK+2,x

* LEAX    B,x   < original code
* Add NOP and ABX

        nop
        abx                 ;CORRECTED 2/4/80
        ldb     #3
WTFSM2  lda     FLR,y
        leay    1,y
        sta     FSB,x
        leax    1,x
        decb                ;DEC THE COUNT
        bne     WTFSM2      ;
        jsr     WRITSS      ;WRITE SECTOR
        bcc     UPDFS9      ;ERROR?
        jmp     WRTERR      ;SET ERROR

* SETMAX
*
* SET MAX SECTOR NUMBER

SETMAX  jsr     OPNSIR      ;GET SECTOR
        jsr     RDNEXT      ;
        bcs     POSI05      ;ERROR?
        ldx     FCBSTR      ;SET FCB PNTR
        clra                ;
        clrb                ;
        std     FRN,x       ;CLEAR REC NUM
        lda     FSB+39,x    ;GET MAX
        sta     FMX,x       ;SAVE MAX
        clrb                ;GET SECTOR LENGTH \\\\
SETMA2  clr     FSB,x       ;CLEAR BYTES
        leax    1,x         ;
        decb                ;DEC THE COUNTER
        bne     SETMA2      ;
        ldx     FCBSTR      ;RESTORE POINTER
        andcc	#$fe        ;clc CLEAR ERRORS
        rts                 ;RETURN

* BKREC
*
* BACK UP ONE RECORD

BKREC   ldx     FCBSTR      ;GET FCB
        lda     FMP,x       ;RANDOM?
        beq     POSIT0      ;
        ldd     FRN,x       ;GET REC NUMBER
        subd    #1          ;DEC BY ONE
        bpl     BKREC2      ;UNDERFLOW?
        jmp     POSIT8      ;
BKREC2  std     FRN,x       ;SAVE NEW

* POSIT
*
* POSITION TO FRN RECORD NUMBER

POSIT   jsr     DOSTAT      ;CHECK STATUS
        bcs     POSI05      ;ERROR?
        rora                ;
        bcc     POSIT0      ;ERROR?
        clr     ,x         ;CLEAR FFC
        lda     FMP,x       ;CHECK RANDOM
        bne     POSIT1      ;ERROR?
                            ;
POSIT0  ldb     #STER       ;SET ERROR
        orcc    #1			;sec
POSI05  rts                 ;RETURN
                            ;
POSIT1  clr     ETRIES      ;CLEAR COUNT
        ldd     FSA,x       ;GET START ADDR
        ldy     FRN,x       ;CHECK FOR 0
        beq     POSIT7      ;GO DO ZERO
POSIT2  jsr     GETFSM      ;GET FSM
        bcs     POSI05      ;
        clra                ;CLEAR COUNT
        clrb                ;
POSIT3  tst     2,x         ;CHECK FOR EOF
        beq     POSIT8      ;
        addb    2,x         ;ADD IN NEW
        adca    #0          ;
        stx     DATAPT      ;
        ldx     FCBSTR      ;
        cmpd    FRN,x       ;CHECK NUMBER
        bhs     POSIT6      ;
POSIT4  ldx     DATAPT      ;RESTORE POINTER
        leax    3,x         ;BUMP TO NEXT
        pshs a              ;SAVE COUNT
        lda     ETRIES      ;
        inca                ;BUMP POSITION
        sta     ETRIES      ;SAVE RESULT
        cmpa    #84         ;LAST RECORD?
        beq     POSIT5      ;
        cmpa    #168        ;
        puls a              ;RESTORE TOTAL
        beq     POSIT8      ;ERROR?
        bra     POSIT3      ;REPEAT
POSIT5  pshs b              ;
        ldx     FCBSTR      ;SET POINTER
        ldd     FSB,x       ;
        bsr     GETFSM      ;GET FSM
        bcs     POSIT8      ;ERROR?
        puls b              ;
        puls a              ;RESTORE TOTAL
        bra     POSIT3      ;REPEAT
POSIT6  subd    FRN,x       ;SUB REC NUM
        ldx     DATAPT      ;RESTORE POINTER
        lda     2,x         ;
        pshs b				; sba
		suba ,s+            ;
        deca                ;FIX UP COUNT
        tfr     a,b         ;
        lda     ,x         ;GET TRACK
        addb    1,x         ;ADD IN SECTOR
        ldx     FCBSTR      ;
        bcs     POSI68      ;
POSI65  cmpb    FMX,x       ;MAX?
        bls     POSIT7      ;
POSI68  subb    FMX,x       ;FIX IF SO
        inca                ;BUMP TRACK
        bra     POSI65      ;
POSIT7  jsr     RDNEX2      ;READ NEXT
        bcs     POSI85      ;ERROR?
        ldx     FCBSTR      ;
        ldd     FSB+2,x     ;GET LRN
        cmpd    FRN,x       ;COMPARE TO FRN
        beq     GETS1       ;
POSI75  ldb     #RMER       ;SET ERROR
        bra     POSI82      ;
POSIT8  ldb     #RRER       ;SET ERROR
POSI82  orcc	#01			;sec
POSI85  rts     			;RETURN

* GET FSM SECTOR

GETFSM  jsr     RDNEX2      ;READ NEXT SEC
        bcs     GETS2       ;ERROR?
        ldx     FCBSTR      ;SET INDEX
        ldb     #FSB+4      ;SET OFFSET
        abx                 ;
GETS1   andcc	#$fe        ; clc CLEAR ERRORS
GETS2   rts

* RSTNAM
*
* RESTORE NAME FROM FWB TO FFN.

RSTNAM  ldx     FCBSTR      ;SET FCB
        ldb     #NL         ;SET COUNTER
RSTNA2  lda     FWB,x       ;GET CHARACTER
        sta     FFN,x       ;PUT IT
        leax    1,x           ;BUMP THE POINTER
        decb                ;DEC THE COUNT
        bne     RSTNA2      ;
        rts                 ;RETURN

* NXTRDY
*
* NXTRDY RETURNS THE DRIVE NUMBER IN
* FCB+FDN OF THE NEXT READY DRIVE.
* CS IF NO MORE READY DRIVES.

NXTRDY  ldx     FCBSTR      ;GET FCB
        lda     FDN,x       ;GET DRIVE NUMBER
        inca                ;BUMP BY ONE
        cmpa    #4          ;PAST RANGE?
        bhs     NXTRD6      ;
        sta     FDN,x       ;SAVE NEW NUMBER
        bne     NXTRD2      ;DRIVE 0 ?
        jsr     CHKRDY      ;CHECK IF READY
        bra     NXTRD4      ;
NXTRD2  jsr     QUICK       ;QUICK CHECK
NXTRD4  bcs     NXTRDY      ;CHECK NEXT DRIVE
        rts                 ;RETURN
NXTRD6  ldb     #NRER       ;SET ERROR
        orcc    #1			;sec
        rts                 ;RETURN
