        NAM     INIT.TXT
        OPT     pag
*       LEN     96
        PAG
        PRAGMA CD
*************************************************
*                                               *
*       Flex 2.9:1 initialization code          *
*                                               *
*************************************************

LNBUFF  EQU     $C080
STARTR  EQU     $C100
SYSFCB  EQU     $C840

SMONTH  EQU     $CC0E
LNBUFP  EQU     $CC14
ESCRTN  EQU     $CC16
MEMEND  EQU     $CC2B
CPUTYP  EQU     $CC33
PROMPT  EQU     $CC4E

COLDST  EQU     $CD00
WARMST  EQU     $CD03
RENTER  EQU     $CD06
INCH    EQU     $CD09
INCH2   EQU     $CD0C
OUTCH   EQU     $CD0F
OUTCH2  EQU     $CD12
INBUFF  EQU     $CD1B
PSTRNG  EQU     $CD1E
PRCRLF  EQU     $CD24
INDECM  EQU     $CD48
STAT    EQU     $CD4E

ZD0F0   EQU     $D0F0
ZD0F1   EQU     $D0F1

STIME   EQU     $D370

IHNDLR  EQU     $D3E7
TIMOFF  EQU     $D3ED
TIMON   EQU     $D3EF
TMINIT  EQU     $D3F1
TRMINT  EQU     $D3F5
TRMCHK  EQU     $D3F7
TIMOUT  EQU     $D3F9
TIMINE  EQU     $D3FB
ZD3FD   EQU     $D3FD

FMSCAL  EQU     $D406

DCHECK  EQU     $DE0F
DWARM   EQU     $DE18

ZDFD0   EQU     $DFD0
ZDFDC   EQU     $DFDC
ZDFDD   EQU     $DFDD

ZE005   EQU     $E005
ZE045   EQU     $E045
ZE085   EQU     $E085
ZE090   EQU     $E090
ZE0C5   EQU     $E0C5

ZF810   EQU     $F810
ZFFF0   EQU     $FFF0
ZFFFC   EQU     $FFFC
ZFFFD   EQU     $FFFD
        pag

****************************************************


*
* STARTUP ROUTINE
* THIS ROUTINE INITIALIZES CERTAIN PARAMETERS, GETS
* DATE FROM USER, AND EXECUTES A STARTUP.TXT FILE.

        ORG     $C400

STAR    BRA     STAR0
Vers    FCB     $82,$2E,$89,$3A,$81

STAR0   LDA     #$39            SET UP RTS
        STA     >ZD3FD          disable re-entry to this code

        LDD     #$CD03          setup 'escape routine' address
        STD     >ESCRTN

        LDD     >TRMCHK         get address of terminal status check routine
        STD     >STAT+1         set in FLEX status check jump

        LDD     >TIMOUT         get address of terminal output routine
        STD     >OUTCH+1        set in FLEX out char jump
        STD     >OUTCH2+1       set in FLEX alternate out char jump

        LDD     >TIMINE         get address of terminal input routine
        STD     >INCH+1         set in FLEX in char jump
        STD     >INCH2+1        set in FLEX alt in char jump

        JSR     [TRMINT]        do terminal init
        LDX     #ZC810          point to Flex version signon
        JSR     >PSTRNG         print to terminal
        JSR     >PRCRLF         and CRLF

ZC43A   LDD     >PROMPT         get  current prompt pointer
        PSHS    B,A             save it
        LDX     #ZC82E          request for date
        STX     >PROMPT         set new prompt pointer
        JSR     >PSTRNG         do prompt
        JSR     >INBUFF         get date
        PULS    B,A             restore prompt pointer
        STD     >PROMPT
        LDY     #SMONTH         point Y reg to date regs
        BSR     ZC4A0           convert month from ascii
        BCS     ZC43A           no good - retry

        BSR     ZC4A0           convert day from ascii
        BCS     ZC43A           no good - retry

        BSR     ZC4A0           convert year from ascii
        BCS     ZC43A           no good - retry

        LDY     #STIME          point Y reg to system time regs
        BSR     ZC4A0
        BCS     ZC43A           no good - retry

        BSR     ZC4A0
        BCS     ZC43A           no good - retry

        BSR     ZC4A0
        BCS     ZC43A           no good - retry
        CLR     STIME+3         clear tick counter

        JSR     >PRCRLF         do CRLF
      ;  JSR     >DWARM          init the disk drivers
      ;  LDX     #SYSFCB         point to STARTUP.TXT FCB
      ;  JSR     >DCHECK         do disk check
      ;  LDA     #$01            set for read operation
      ;  STA     ,X
      ;  JSR     >FMSCAL
      ;  BEQ     ZC47E           no error

      ;  LDA     $01,X
      ;  CMPA    #$04            file not found error?
      ;  BNE     ZC4B2           no -

        JMP     >WARMST         yes - ignore file

ZC47E   LDY     #LNBUFF         init line buffer pointer
        STY     >LNBUFP
        LDB     #$80            set byte count to move

ZC488   JSR     >FMSCAL         get byte from startup.txt
        BNE     ZC4B2           error
        DECB                    decrement count
        BEQ     ZC4B2           done

        STA     ,Y+             put character in line buffer
        CMPA    #$0D            see if EOL character
        BNE     ZC488           no - loop

        LDA     #$04            yes - close file
        STA     ,X
        JSR     >FMSCAL

        JMP     >RENTER         re-enter FLEX with command in line buffer

*       convert ascii to decimal

ZC4A0   JSR     >INDECM
        PSHS    X
        BCS     ZC4B0
        LDA     ,Y
        TSTB                    see if any valid decimal digits entered
        ORCC    #$01            set carry flag for error
        BEQ     ZC4AE           no - return error

        LDA     $01,S           yes - get returned byte
        ANDCC   #$FE            set carry flag = 0 if no error
ZC4AE   STA     ,Y+             put in callers buffer
ZC4B0   PULS    PC,B,A          return

*       error in startup file - report it

ZC4B2   LDX     #ZC555          can't run startup message
        JSR     >PSTRNG

        JMP     >WARMST

*       fix up number of K of memory available message

ZC4BB   PSHS    X,B
        LDX     #ZC82B          'K' message
        LDA     #$04
        BRA     ZC4CA

*

ZC4C4   SUBA    #$0A
        STA     ,X
        LDA     #$01

*

ZC4CA   ADDA    ,-X
        ORA     #$30
        STA     ,X
        CMPA    #$39
        BHI     ZC4C4
        PULS    PC,X,B

*       return status that no no RTC is available
*       but MPT does exist

ZC4D6   JSR     [TMINIT]        init timer
        LDA     #$02            set flag for MPT
        RTS

*       startup file error message

ZC555   FCC     "Can't run STARTUP."
        FCB     $04

*       FLEX startup signon message

ZC810   FCC     "FLEX for Nhyodyne 6809 Version 2.9:2 - "
        FCB     $00,$00,$00,$00

ZC82B   FCC     "K"
        FCB     $15
        FCB     $04

*       Date prompt

ZC82E   FCC     "Date and TIME (MM/DD/YY HH/MM/SS)? "
        FCB     $04

        ORG     SYSFCB

        FCB     $FF
        FCB     $00
        FCB     $00
        FCB     $00
        FCC     "startup"
        FCB     $00
        FCC     "txt"
        FCB     $00

*************************************************
*                                               *
*       FLEX entry point after boot             *
*                                               *
*         this must start at $C850              *
*                                               *
*************************************************

SFRES1  ORCC    #$50
        LDS     #LNBUFF
        LDD     >ZDFDC
        LDX     >ZD0F0
        PSHS    X,B,A
        LDX     #$99AA
        LDY     #STARTR+256
        LDB     #$FF

ZC867   LBSR    ZC91A
        STX     >ZD0F0
        CMPX    >ZD0F0
        BNE     ZC888
        PSHS    B

ZC874   LBSR    ZC91A
        STB     >ZD0F1
        SUBB    #$01
        BCC     ZC874

        PULS    B
        LBSR    ZC91A
        CMPB    >ZD0F1
        BEQ     ZC889
ZC888   CLRA

ZC889   STA     ,-Y
        BEQ     ZC890
        LBSR    ZC4BB

ZC890   SUBB    #$01
        BCC     ZC867

        PULS    X,B,A
        STD     >ZFFFC
        STX     >ZD0F0
        CLRA
        LDX     #STARTR
        LDB     >ZDFDC
        EORB    #$0F
        CLR     D,X
        LDB     >ZDFDD
        EORB    #$0F
        CLR     D,X
        BSR     ZC922
        TSTB
        BEQ     ZC8B8

ZC8B3   CLR     ,Y+
        DECB
        BNE     ZC8B3

ZC8B8   LEAY    -$0C,Y
        LDX     #ZFFF0
        LDB     #$10

ZC8BF   LDA     ,Y+
        STA     ,X+
        DECB
        BNE     ZC8BF
        LDA     >MEMEND
        ASLA
        ASLA
        ASLA
        ASLA
        CLRB
        SUBD    #$0001
        STD     >MEMEND
        LBSR    ZC4D6
        ORA     >CPUTYP
        LDB     >ZDFD0
        BITB    #$F0
        BEQ     ZC8E3
        ORA     #$01

ZC8E3   LDB     >ZE005
        BEQ     ZC8FD
        CMPB    #$FF
        BEQ     ZC8FD
        CMPB    >ZE0C5
        BNE     ZC8FD
        CMPB    >ZE045
        BNE     ZC8FD
        CMPB    >ZE085
        BNE     ZC8FD
        ORA     #$04

ZC8FD   LDX     >$E800
        PSHS    X
        LDX     #$99AA
        STX     >$E800
        CMPX    >$E800
        PULS    X
        BNE     ZC911
        ORA     #$10

ZC911   STX     >$E800
        STA     >CPUTYP
        JMP     >COLDST

*

ZC91A   TFR     B,A
        EORA    #$0F
        STA     >ZFFFD
        RTS

*

ZC922   LDB     #$0C
        LDY     #ZDFD0
*       LDX     #STARTR+16
        LDX     #STARTR

ZC92B   CMPX    #STARTR+256
        BEQ     ZC93D
        LDA     ,X+
        BEQ     ZC92B
        STA     ,Y+
        INC     >MEMEND
        DECB
        BNE     ZC92B
        RTS

ZC93D   LDX     #STARTR

ZC940   CMPX    #STARTR+16
        BEQ     ZC951
        LDA     ,X+
        BEQ     ZC940
        STA     ,Y+
        INC     >MEMEND
        DECB
        BNE     ZC940

ZC951   RTS

        END
