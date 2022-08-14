        NAM     SPOOLER.TXT
        OPT     pag
*       LEN     96
        PAG
        PRAGMA CD

*************************************************
*                                               *
*       FLEX Spooler (for task switching)       *
*                                               *
*************************************************

ZC810   EQU     $C810
SYSFCB  EQU     $C840
ZC980   EQU     $C980

FMSBUSY EQU     $CC30
CP      EQU     $CC31
ZCC34   EQU     $CC34
PRDYCH  EQU     $CCD8
PTROUT  EQU     $CCE4
PR0     EQU     $CCF8
PR1     EQU     $CCFC

IHNDLR  EQU     $D3E7
TIMOFF  EQU     $D3ED

FMSCAL  EQU     $D406
        pag

        ORG     $C700

        JMP     >ZC723          scheduler
        JMP     >ZC75C
        JMP     >ZC75D          queue handler
        JMP     >ZC74C
        JMP     >ZC757
        JMP     >ZC71F          IRQ ISR

ZC712   FCB     $0C             TOF character
        FCB     $00,$00,$00,$00
        FDB     ZC810           first queue entry pointer
ZC719   FDB     ZC810           current queue entry pointer
ZC71B   FCB     $00             queue count
ZC71C   FCB     $00             <cr> flag
ZC71D   FCB     $00             qcheck 'kill' flag
ZC71E   FCB     $00             qcheck 'suspend' flag

ZC71F   JMP     [IHNDLR]        handle IRQ

*       Scheduler

ZC723   ORCC    #$50            disable IRQ and FIRQ
        LDX     >CP             get stack address
        STS     $02,X           save current system stack
        TST     >ZCC34          see if spooling is active
        BNE     ZC741           yes - go toggle task

        LDX     #PR1            point to background task stack pointer
        INC     >ZCC34          bump spooling active flag
        TST     ,X              see if we are printing
        BEQ     ZC741           no - clear spooling flag

ZC73A   STX     >CP             set task stack pointer
        LDS     $02,X           restore stack pointer
        RTI                     return from interrupt

*       Toggle background and forground tasks

ZC741   LDX     #PR0            load foreground task stack pointer
        CLR     >ZCC34          set spooling inactive
        BRA     ZC73A           go set the foreground task active

*

ZC749   SWI3
        NOP

ZC74C   ORCC    #$50            disable IRQ and FIRQ
        TST     >FMSBUSY
        BNE     ZC749
        INC     >FMSBUSY
        RTS

ZC757   CLR     >FMSBUSY
        ANDCC   #$AF

ZC75C   RTS

*       Queue handler

ZC75D   ORCC    #$50            disable IRQ and FIRQ
        TST     >ZC71B          see if queue count = 0
        BEQ     ZC78D           yes - queue is empty
        LDX     >ZC719          no - get queue control block address
        LDA     ,X              get drive number
        PSHS    A               save it
        LDD     $01,X           get next track and sector link
        LDX     #ZC980          point to queue file control block
        STD     $40,X           set link in FCB
        PULS    A               get drive
        STA     $03,X           set in FCB
        CLR     ,X              set function = open for read
        LDA     #$01            set activity status of FCB
        STA     $02,X
        CLR     $22,X           clear data index
        CLR     $3B,X           and set space compression flag on

ZC783   TST     >ZC71E          are we suspended?
        BEQ     ZC79B           no - output the file to printer
        SWI3                    yes - go to scheduler
        NOP
        BRA     ZC783           loop

*       turn timer off and exit to foreground task

ZC78D   CLR     >PR1            say that background task is done
        ANDCC   #$AF            allow IRQ and FIRQ
        SWI3                    go to scheduler
        NOP
        BRA     ZC78D           loop

*       output the current file in the queue

ZC79B   TST     >ZC71D          kill flag set?
        BNE     ZC7C7           yes - set up next queued entry

        LDX     #ZC980          point to queue FCB
        JSR     >FMSCAL         read a byte of data
        BNE     ZC7C7           error or end of file

        TST     >ZC71C          <cr> flag set?
        BEQ     ZC7BC           no -

        CLR     >ZC71C          yes - clear it and do a linefeed
        CMPA    #$0A            was the character already a linefeed?
        BEQ     ZC7C3           yes - just do one
        PSHS    A               no - save character
        LDA     #$0A            and do a line feed
        BSR     ZC7F9           output character
        PULS    A               restore character

ZC7BC   CMPA    #$0D            is character a <cr>?
        BNE     ZC7C3           no - then just output it
        STA     >ZC71C          yes - set <cr> flag

ZC7C3   BSR     ZC7F9           output the character and loop
        BRA     ZC79B

*       got to end of file or FMS error - do next queued entry

ZC7C7   LDA     #$0D            close output file with a <cr>
        BSR     ZC7F9
        LDA     #$0A            and line feed
        BSR     ZC7F9
        LDA     >ZC712          get TOF character
        BSR     ZC7F9           output it also
        CLR     >ZC71D          reset kill flag
        LDX     >ZC719          point to current entry control block
        TST     $03,X           see if all copies have been done
        BEQ     ZC7E3           yes - do next entry in queue
        DEC     $03,X           no - decrement count
        JMP     >ZC75D          loop on queue handler

*       bump control pointer to next entry

ZC7E3   LEAX    $04,X           bump pointer
        CMPX    #SYSFCB         overflow?
        BNE     ZC7ED           no - set pointer to next
        LDX     #ZC810          yes - reset queue pointer

ZC7ED   STX     >ZC719          set pointer to next entry
        DEC     >ZC71B          decrement queue count
        JMP     >ZC75D          loop on queue handler

*

ZC7F6   SWI3
        NOP

*       output to printer

ZC7F9   JSR     >PRDYCH         printer ready?
        BPL     ZC7F6           no - go to scheduler
        JMP     >PTROUT         yes - ouput byte

        END
