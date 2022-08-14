*************************************************
*                                               *
*       Actual Disk driver routines             *
*                                               *
*************************************************
*
*       Read sector

Read    LBSR    Seek
        LDA     #$88            read sector command
        ORA     dens            or in density bit
        ORA     dlayf           or in 15 msec delay flag
        CLR     dlayf           clear 15 msec delay flag
        TST     SplFlg          spooling active?
        BEQ     ZDE3F           no - proceed

        SWI3                    give spooler opportunity to run

ZDE3F   NOP 
        ORCC    #$50            disable FIRQ and IRQ
        STA     dcmnd           issue command
        LBSR    Delay           wait for WD2793 to accept command
        CLRB                    set byte counter
        TST     dens            see if single or double density
        BEQ     ZDE6F           single

*       do double density read

        PSHS    U,Y
        LDU     #ddata
        LDY     #dcntrl

ZDE57   LDA     ,Y
        BMI     ZDE5F

        BEQ     ZDE57

        BRA     ZDE66

ZDE5F   LDA     ,U
        STA     ,X+
        DECB 
        BNE     ZDE57

ZDE66   LBSR    ZDF90
        ANDCC   #$AF
        BITB    #$9C
        PULS    PC,U,Y

*       do single density read

ZDE6F   LDA     dstat
        BMI     ZDE86

        BITA    #$02
        BNE     ZDE7E

        BITA    #$01
        BNE     ZDE6F

        BRA     ZDE86

ZDE7E   LDA     ddata
        STA     ,X+
        DECB 
        BNE     ZDE6F

ZDE86   LBSR    ZDF90
        ANDCC   #$AF
        BITB    #$9C
        RTS 

*       Write sector

Write   LBSR    Seek
        LDA     #$A8            write sector command
        ORA     dens            pick up density bit
        ORA     dlayf           pick up 15 msec delay bit
        CLR     dlayf           clear 15 msec delay bit
        TST     SplFlg          spooling active?
        BEQ     ZDEA3           no - proceed

        SWI3                    give spooler a slice of time

ZDEA3   NOP 
        ORCC    #$50            disable FIRQ and IRQ
        STA     dcmnd           issue command
        LBSR    Delay           wait for WD2793 to accept command
        CLRB                    set byte counter
        TST     dens            single or double density
        BEQ     ZDED1           single

*       do double density write

        PSHS    U,Y
        LDU     #ddata
        LDY     #dcntrl

ZDEBB   LDA     ,Y
        BMI     ZDEC3

        BEQ     ZDEBB

        BRA     ZDECA

ZDEC3   LDA     ,X+
        STA     ,U
        DECB 
        BNE     ZDEBB

ZDECA   LBSR    ZDF90
        BSR     ZDEEB
        PULS    PC,U,Y

*       do single density write

ZDED1   LDA     dstat
        BMI     ZDEE8

        BITA    #$02
        BNE     ZDEE0

        BITA    #$01
        BNE     ZDED1

        BRA     ZDEE8

ZDEE0   LDA     ,X+
        STA     ddata
        DECB 
        BNE     ZDED1

ZDEE8   LBSR    ZDF90

ZDEEB   CLRA 

ZDEEC   DECA 
        LBNE    ZDEEC

        ANDCC   #$AF
        BITB    #$DC
        RTS 

*       Verify sector

Verify  LDA     #$88            read sector command
        ORA     dens            get density bit
        ORCC    #$50            disable FIRQ and IRQ
        STA     dcmnd           issue command
        LBSR    Delay           wait for WD2793 to get it
        LBSR    ZDF90
        ANDCC   #$AF
        BITB    #$98
        RTS 

*       Seek sector

Seekit  CMPD    #$0000
        BNE     Seek

        LDX     #dnstb
        LDB     curdv           get current drive
        CLR     B,X
        LDA     dtrak
        LDX     #dport
        RTS 

Seek    PSHS    X,A             save track and X
        STB     dsect           select sector
        BSR     ZDF64           set density and get side bit
        ORB     curdv           get current drive bits
        STB     dcntrl          select drive and side
        CMPA    dtrak           see if already at correct track
        BEQ     ZDF60           yes - no need to seek

        LDB     curdv
        LDX     #dnstb
        LDB     B,X
        ANDB    #$02
        STB     dbltf
        BEQ     ZDF45

        ASL     dtrak
        ASLA 

ZDF45   STA     ddata
        LDA     #$04            15 msec delay bit
        STA     dlayf           set it
        LDA     #$18            restore heads cmd
        STA     dcmnd
        LBSR    Delay
        LBSR    WNbsy
        LBSR    Delay
        TST     dbltf
        BEQ     ZDF62

        LSR     dtrak

ZDF60   LBSR    Delay

ZDF62   PULS    PC,X,A

* select correct side

ZDF64   BSR     ZDF76           set up density flag
        BEQ     ZDF6F           single density

        CMPB    #$12            max sector per side for double dens
        BLS     ZDF73           still on side 0

ZDF6C   LDB     #$40            set side 1 select bit for dcntrl
        RTS 

ZDF6F   CMPB    #$0A            see if side 0 for single density
        BHI     ZDF6C           no - set side 1

ZDF73   LDB     #$00            set side 0
        RTS 

*

ZDF76   BRN     ZDF8C           if bit 7 of track set - try different format
        STA     ,-S             save A reg
        BEQ     ZDF84           if track = 0 set density to single

        LDA     curdv           get current drive number
        LDX     #dnstb          point to density table
        LDA     A,X             get density for this drive

ZDF84   ANDA    #$01
        ASLA 
        STA     dens 
        PULS    PC,A

ZDF8C   CLR     dens            try single density
        RTS 

*

ZDF90   LBSR    WNbsy
        PSHS    X,B
        BITB    #$10
        BEQ     ZDFA0

        LDB     curdv
        LDX     #dnstb
        INC     B,X

ZDFA0   PULS    PC,X,B

*       Init drives

Init    LDX     #dens 
        LDB     #$0C

Iloop   CLR     ,X+
        DECB
        BNE     Iloop
        RTS 

*       Winit drives

WInit   TST     FMSBUSY
        BNE     ZCB15
        LDA     #$80
        STA     dcntrl

ZCB15   RTS 

*       Restore drive

Restor  BSR     Select
        BCS     ZCB2D

        LDA     #$0A            restore heads command
        STA     dcmnd
        LBSR    Delay
        LBSR    WNbsy
        ANDCC   #$FE
        BITB    #$40
        BEQ     ZCB2D

        LDB     #$0B

ZCB2D   RTS 

*       Select drive

Select  PSHS    X
        LDA     $03,X
        CMPA    #$04
        BCS     ZCB3B

        LDB     #$1F
        ASRB 
        PULS    PC,X

ZCB3B   BSR     ZCB68
        LDB     dtrak
        STB     ,X
        STA     dcntrl
        CMPA    curdv
        BEQ     ZCB5C

        LDX     #$0C14
        TST     CnfgByt         see if 1 or 2 MHZ
        BPL     ZCB55           2MHZ

        LDX     #$17EA          1MHZ

ZCB55   LBSR    Delay
        LEAX    -$01,X
        BNE     ZCB55

ZCB5C   STA     curdv
        BSR     ZCB68
        LDA     ,X
        STA     dtrak
        BRA     ZCB77

ZCB68   LDX     #drvtb
        LDB     curdv
        ABX 
        RTS 

*       Check drive ready

Check   PSHS    X
        LDA     $03,X
        STA     dcntrl

ZCB77   BRN     ZCB89

        LDX     #$49B3
        TST     CnfgByt         see if 1 or 2 MHZ
        BPL     ZCB84           2MHZ

        LDX     #$9367          1MHZ

ZCB84   LDB     dstat
        BMI     ZCB8C

ZCB89   CLRA 
        PULS    PC,X

ZCB8C   LBSR    Delay
        LDB     dstat
        BPL     ZCB9B

        LEAX    -$01,X
        BNE     ZCB8C

ZCB98   COMB 
        PULS    PC,X

ZCB9B   LDX     #$1576
        TST     CnfgByt         see if 1 or 2 MHZ
        BPL     ZCBA6           2MHZ

        LDX     #$27DC          1MHZ

ZCBA6   LBSR    Delay
        LEAX    -$01,X
        BNE     ZCBA6

        CLRA
        PULS    PC,X

*       Quick Check for drive ready

Qchck   PSHS    X
        LDA     $03,X
        STA     dcntrl
        BRN     ZCB89

        LDX     #$0B0E
        TST     CnfgByt         see if 1 or 2 MHZ
        BPL     ZCBC4           2MHZ

        LDX     #$161C          1MHZ

ZCBC4   TST     dstat
        LBSR    Delay
        LEAX    -$01,X
        BNE     ZCBC4

        LDB     dstat
        BMI     ZCB98

        CLRA
        PULS    PC,X

*       Wait for WD2793 to go not busy

WNbsy   TST     SplFlg          spooler active?
        BEQ     ZDFA9           no - proceed

        SWI3                    give spooler a chance

ZDFA9   NOP 
        LDB     dstat
        BITB    #$01
        BNE     WNbsy

        RTS 

*       Delay while WD2793 gets it together

Delay   BSR     del00
del00   BSR     del01
del01   BSR     del02
del02   RTS 
