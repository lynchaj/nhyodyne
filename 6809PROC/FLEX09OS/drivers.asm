                NAM     DRIVERS
                PAG
                PRAGMA CD

* ---------------------------------------------------------------------------
* File Name   : DRIVERS.ASM
* Format      : XASM09.EXE
*
* Processor:       6809 []
* Target assebler: Public domain 6809 assembler v2.01 (OS9 support)
*
*       This is a dissassembly of the actual code running in the
*       6809 box with the SBUG17/OS9 ROM set. This is from the
*       PL9-MACE boot diskette.
*

SCRATCH3        equ     $CC30
CPUFLAG         equ     $CC33
SPLFLG          equ     $CC34           spooling active flag
WARMS           equ     $CD03

MONTH           equ     $CC0E
DAY             equ     $CC0F
YEAR            equ     $CC10

HOUR            equ     $D370
MINUTE          equ     $D371
SECOND          equ     $D372
TICK            equ     $D373

SWIVEC          equ     $DFC2
IRQVEC          equ     $DFC8

ACIADD          equ     $DFE0

ACIAS           equ     $E004
MPT             equ     $E042
MPLPIA          equ     $E070

OUTCH           equ     $F80A
INCHEK          equ     $F808
INCHE           equ     $F806
INCH            equ     $F804

*
* CONSOLE I/O DRIVER VECTOR TABLE
*
                ORG     $D3E1       * TABLE STARTS AT $D3E1

LD3E1           FDB     ADDDEV      * add an IRQ handler to table
                FDB     DELDEV      * delete an IRQ handler from table

                FDB     INCHNE      * ($E86F) INPUT CHARACTER W/O ECHO
                FDB     IHNDLR      * ($E873) IRQ INTERRUPT HANDLER
                FDB     SWIVEC      * ($DFC2) SWI3 VECTOR LOCATION
                FDB     IRQVEC      * ($DFC8) IRQ VECTOR LOCATION
                FDB     TMOFF       * ($E8D6) TIMER OFF ROUTINE
                FDB     TMON        * ($E8D0) TIMER ON ROUTINE
                FDB     TMINT       * ($E8B4) TIMER INITIALIZATION
                FDB     MONITR      * ($E844) MONITOR ENTRY ADDRESS
                FDB     TINIT       * ($E850) TERMINAL INITIALIZATION
                FDB     STAT        * ($E867) CHECK TERMINAL STATUS
                FDB     VOUTCH      * ($E863) OUTPUT CHARACTER
                FDB     VINCH       * ($E85A) INPUT CHARACTER W/ ECHO

*
* DISK DRIVER ROUTINE JUMP TABLE
*
                ORG     $DE00

DREAD           JMP     >READ       * DE00 7E E955   READ      Read a single sector
DWRITE          JMP     >WRITE      * DE03 7E E9B9   WRITE     Write a single sector
DVERFY          JMP     >VERIFY     * DE06 7E EA21   VERIFY    Verify last sector written
DRESTOR         JMP     >RESTORE    * DE09 7E EAE8   RESTORE   Restore head to track #0
DDRIVE          JMP     >DRIVE      * DE0C 7E EB00   DRIVE     Select the specified drive
DCHECK          JMP     >CHKRDY     * DE0F 7E EB42   CHKRDY    Check for drive ready
DQUICK          JMP     >QUICK      * DE12 7E EB82   QUICK     Quick check for drive ready
DINIT           JMP     >INIT       * DE15 7E EAD2   INIT      Driver initialize (cold start)
DWARM           JMP     >WARM       * DE18 7E EADD   WARM      Driver initialize (warm start)
DSEEK           JMP     >SEEKIT     * DE1B 7E EA36   SEEK      Seek to specified track

DRVTBL          FCB     $00
                FCB     $00
                FCB     $00
                FCB     $00

                FCB     $00,$00,$00,$00
                FCB     $00,$00,$00,$00

                org $F000

* ---------------------------------------------------------------------------
*       Printer port initialization

OPNPRT
;                ldx     <PPORT,pc
;                lda     #$3A
;                sta     1,x
;                lda     #$FF
;                sta     ,x
;                lda     #$3E
;                sta     1,x
                rts

* ---------------------------------------------------------------------------
*       Close the printer device (issue a <CR>)

CLSPRT    ;      lda     #$D

* ---------------------------------------------------------------------------
*       Output a character to the printer

OUTPRT          bsr     CHKPRT
                bpl     OUTPRT

                pshs    x
             ;   clr     <IRQBM,pc
             ;   ldx     <PPORT,pc
             ;   sta     ,x
             ;   lda     #$36
             ;   sta     1,x
             ;   lda     #$3E
             ;   sta     1,x
                puls    pc,x

* ---------------------------------------------------------------------------
*       check for printer ready

CHKPRT          pshs    x
              ;  tst     <IRQBM,pc
              ;  bmi     CHKDONE

               ; ldx     <PPORT,pc
               ; tst     1,x
               ; bpl     CHKDONE

               ; tst     ,x
               ; com     <IRQBM,pc

CHKDONE         puls    pc,x

* ---------------------------------------------------------------------------

PPORT           fdb     MPLPIA              * address of device
                fdb     0                   * IRQ handler address
IRQBM           fcb     0                   * bit mask for IRQ flag

* ---------------------------------------------------------------------------
*       Monitor entry routine

MONITR          lda     #$A
                bsr     VOUTCH              * output character
                lda     #$D
                bsr     VOUTCH              * output character
                swi                         * enter monitor
                jmp     WARMS               * re-enter FLEX gracefully

* ---------------------------------------------------------------------------
*       Terminal init routine

TINIT           pshs    a
                lda     #$11
                sta     [ACIADD]
                puls    pc,a

* ---------------------------------------------------------------------------
*       Terminal input routine

VINCH           tst     >TAPPTR             * allow redirection of input from terminal
                beq     TREDIR              * redirection not required
                jsr     [TAPPTR]            * redirect to alternate routine

* ---------------------------------------------------------------------------
*       Terminal output routine

VOUTCH          jmp     [OUTCH]

* ---------------------------------------------------------------------------
*       Terminal status check routine

STAT            jmp     [INCHEK]

* ---------------------------------------------------------------------------
*       Monitor terminal input character with echo

TREDIR          jmp     [INCHE]

* ---------------------------------------------------------------------------
*       Monitor terminal input character without echo

INCHNE          jmp     [INCH]

* ---------------------------------------------------------------------------
* Interupt handler

IHNDLR        ;  leau    <IRQLL-4,pc         get address of IRQ handler linked list
CHKNXT        ;  ldu     4,u                 get a link
              ;  beq     IHDONE              end of list

               ; lda     [,u]                get status from device
               ; bita    6,u                 did it interrupt?
               ; beq     CHKNXT              no - check next

               ; ldy     ,u                  yes - get address of device in Y
               ; jmp     [2,u]               go to device ISR

IHDONE          rti                         return from interrupt

* ---------------------------------------------------------------------------
*       add a device to IRQ handler table

ADDDEV          pshs    x,y,u
                bsr     SRCHLST             find link in chain
                beq     DEVARE              already exists - exit
                stu     4,x                 set link pointer in new ctl blk
                stx     4,y                 link this one into prev blk
DEVARE          puls    pc,u,y,x

* ---------------------------------------------------------------------------
*       delete a device from IRQ handler table

DELDEV          pshs    x,y,u
                bsr     SRCHLST             find link in chain
                bne     NODEV               not found - exit
                ldx     4,x                 get link from ctl blk to delete
                stx     4,u                 set in prev block
NODEV           puls    pc,u,y,x

* ---------------------------------------------------------------------------
*       search a linked list
*
*               entry: X = address of ISR control block
*               exit:  Y = address of link pointer
*                     CC = Z bit set if already linked
*
*               format of ISR control block:
*
*                       offset  description
*                         0     address of I/O device
*                         2     address of ISR
*                         4     link to next ISR control block
*                         6     bit mask for determining IRQ

SRCHLST       ;  leau    <IRQLL-4,pc
SRCHLP        ;  leay    ,u
              ;  cmpx    4,u                 X = link?
              ;  beq     FNDENT              yes - return pointer in U

              ;  ldu     4,u                 no - get link in U
              ;  bne     SRCHLP              not end of chain - loop
              ;  andcc   #$FB                clear Z flag in CC

FNDENT          rts                         return - not found

* --------------------------------------------------------------------

IRQLL           fdb     0                   pointer to first entry in the table
                fcb     1

TAPPTR          fdb     0                   no terminal input redirection

* --------------------------------------------------------------------
*       Timer routines for MPT
*
*       timer initialize - install the handler into the chain

TMINT           ldx     #MPT                point to hardware
                lda     #$FF                set up the port direction
                sta     ,x
                lda     #$3C
                sta     1,x
                lda     #$8F                this turns it off so it does
                sta     ,x                  not fire before the handler
                lda     ,x                  get's installed
                lda     #$3D
                sta     1,x

*               point X at address of timer handler control block

                ldx     #TIMER
                jmp     [LD3E1]             Add it to the linked list of handlers

* --------------------------------------------------------------------
*       timer on

TMON            lda     #4                  10 millisecond ticks
                sta     MPT                 enable the timer
                rts

* --------------------------------------------------------------------
*       timer off

TMOFF           lda     #$8F                disable the timer
                sta     MPT
                rts
* --------------------------------------------------------------------
*
*   Interrupt handler for the MP-T card.

IHND            lda     MPT                 kill IRQ flag in MPT
                inc     TICK                bump tick counter
                lda     TICK
                cmpa    #100                100 ticks?
                bne     NOUP                no - skip to spooler

                clr     TICK                yes - reset tick counter
                inc     SECOND              - increment second counter
                lda     SECOND              see if overflow
                cmpa    #60
                bne     NOUP                no - don't update minutes

                clr     SECOND              yes - reset seconds
                inc     MINUTE              increment minute
                lda     MINUTE
                cmpa    #60                 see if overflow
                bne     NOUP                no - don't update hour

                clr     MINUTE              yes - reset minute
                inc     HOUR                increment hours
                lda     HOUR
                cmpa    #24                 overflow?
                bne     NOUP                no - don't update day

                clr     HOUR                yes - reset hours
                inc     DAY                 increment system day
                lda     DAY                 get the day
                leax    MONTHDAYS,pc        point to days per month table
                ldb     MONTH               get month in b for offset
                decb                        make zero based
                leax    b,x                 set X to point to correct entry
                inca
                cmpa    ,x
                bne     NOUP                not time to change month yet

                lda     #1                  reset the day to the first
                sta     DAY
                inc     MONTH               bump the month
                lda     MONTH               get the month value
                cmpa    #13                 see if overflow
                bne     NOUP                no

                lda     #1                  set back to January
                sta     MONTH
                inc     YEAR                and bump to next year

NOUP            jmp     $C700               go to spooler code

MONTHDAYS       fcb     31                  Jan
                fcb     28                  Feb
                fcb     31                  Mar
                fcb     30                  Apr
                fcb     31                  May
                fcb     30                  Jun
                fcb     31                  Jul
                fcb     31                  Aug
                fcb     30                  Sep
                fcb     31                  Oct
                fcb     30                  Nov
                fcb     31                  Dec

TIMER           fdb     MPT+1               * where we can find device status byte
                fdb     IHND                * pointer to Interrupt handler
                fdb     0                   * pointer to next device in chain
                fcb     $80                 * mask for testing Interrupt occured

*   READ    This routine reads the specified sector into memory at the
*           specified address. This routine should perform a seek
*           operation if necessary. A sector is 256 bytes in length.
*
*           ENTRY - (X) = Address in memory where sector is to be placed.
*                   (A) = Track Number
*                   (B) = Sector Number
*
*           EXIT -  (X) May be destroyed
*                   (A) May be destroyed
*                   (B) = Error condition
*                   (Z) = 1 if no error
*                       = 0 if an error

READ            lbsr    SEEK
                lda     #$88                read sector command
                ora     DRVTBL
                ora     DRVTBL+2
                clr     DRVTBL+2
                tst     SPLFLG              spooling active?
                beq     LE96A               no - proceed

                swi3                        give spooler opportunity to run

LE96A           nop
                orcc    #$50                disable FIRQ and IRQ
                sta     $E018               issue command
                lbsr    SEBB8               wait for WD2793 to accept command
                clrb                        set byte counter
                tst     DRVTBL              see if single or double density
                beq     LE99A               single

*               do double density read

                pshs    y,u
                ldu     #$E01B
                ldy     #$E014

LE982           lda     ,y
                bmi     LE98A
                beq     LE982
                bra     LE991

LE98A           lda     ,u
                sta     ,x+
                decb
                bne     LE982

LE991           lbsr    SEABF
                andcc   #$AF
                bitb    #$9C
                puls    pc,u,y

*               do single density read

LE99A           lda     $E018
                bmi     LE9B1
                bita    #2
                bne     LE9A9
                bita    #1
                bne     LE99A
                bra     LE9B1

LE9A9           lda     $E01B
                sta     ,x+
                decb
                bne     LE99A

LE9B1           lbsr    SEABF
                andcc   #$AF
                bitb    #$9C
                rts

*   WRITE   This routine writes the information from the specifed memory
*           buffer area to the disk sector specified. This routine should
*           perform a seek operation if necessary. A sector is 256 bytes
*           in length.
*
*           ENTRY - (X) = Address of 256 memory buffer containing data
*                         to be written to disk
*                   (A) = Track Number
*                   (B) = Sector Number
*
*           EXIT -  (X) May be destroyed
*                   (A) May be destroyed
*                   (B) = Error condition
*                   (Z) = 1 if no error
*                       = 0 if an error

WRITE           lbsr    SEEK
                lda     #$A8                    write sector command
                ora     DRVTBL                  pick up density bit
                ora     DRVTBL+2
                clr     DRVTBL+2
                tst     SPLFLG                  spooling active?
                beq     LE9CE                   no - proceed

                swi3                            give spooler a slice of time

LE9CE           nop
                orcc    #$50                    disable FIRQ and IRQ
                sta     $E018                   issue command
                lbsr    SEBB8                   wait for WD2793 to accept command
                clrb                            set byte counter
                tst     DRVTBL                  single or double density
                beq     LE9FC                   single

*               do double density write

                pshs    y,u
                ldu     #$E01B
                ldy     #$E014

LE9E6           lda     ,y
                bmi     LE9EE
                beq     LE9E6
                bra     LE9F5

LE9EE           lda     ,x+
                sta     ,u
                decb
                bne     LE9E6

LE9F5           lbsr    SEABF
                bsr     SEA16
                puls    pc,u,y

*               do single density write

LE9FC           lda     $E018
                bmi     LEA13
                bita    #2
                bne     LEA0B
                bita    #1
                bne     LE9FC
                bra     LEA13

LEA0B           lda     ,x+
                sta     $E01B
                decb
                bne     LE9FC

LEA13           lbsr    SEABF

SEA16           clra
LEA17           deca
                lbne    LEA17
                andcc   #$AF
                bitb    #$DC
                rts

*   VERIFY  The sector just written to the disk is to be verified to
*           determine if there are CRC errors. No seek is required as
*           this routine will only be called immediately after a write
*           single sector operation.
*
*           ENTRY - No entry parameters
*
*           EXIT -  (X) May be destroyed
*                   (A) May be destroyed
*                   (B) = Error condition
*                   (Z) = 1 if no error
*                       = 0 if an error

VERIFY          lda     #$88                    read sector command
                ora     DRVTBL                  get density bit
                orcc    #$50                    disable FIRQ and IRQ
                sta     $E018                   issue command
                lbsr    SEBB8                   wait for WD2793 to get it
                lbsr    SEABF
                andcc   #$AF
                bitb    #$98
                rts

*   SEEK    Seeks to the track specified in the 'A' accumulator. In
*           double-sided systems, this routine should also select the
*           correct side depending on the sector number supplied in 'B'.
*
*           ENTRY - (A) = Track Number
*                   (B) = Sector Number
*
*           EXIT -  (X) May be destroyed (See text)
*                   (A) May be destroyed (See text)
*                   (B) = Error condition
*                   (Z) = 1 if no error
*                       = 0 if an error

SEEKIT          cmpd    #0                  are we going to track 0 sector 0?
                bne     SEEK                no =

                ldx     #DRVTBL+4
                ldb     DRVTBL+3
                clr     b,x
                lda     $E019
                ldx     #$E010
                rts

SEEK            pshs    a,x
                stb     $E01A
                bsr     SEA93
                orb     DRVTBL+3
                stb     $E014
                cmpa    $E019
                beq     LEA8E
                ldb     DRVTBL+3
                ldx     #DRVTBL+4
                ldb     b,x
                andb    #2
                stb     DRVTBL+1
                beq     LEA70
                asl     $E019
                asla

LEA70           sta     $E01B
                lda     #4
                sta     DRVTBL+2
                lda     #$18
                sta     $E018
                lbsr    SEBB8
                lbsr    SEBA8
                lbsr    SEBB8
                tst     DRVTBL+1
                beq     LEA91
                lsr     $E019

LEA8E           lbsr    SEBB8
LEA91           puls    pc,x,a

SEA93           bsr     SEAA5
                beq     LEA9E
                cmpb    #$12
                bls     LEAA2

LEA9B           ldb     #$40
                rts

LEA9E           cmpb    #$A
                bhi     LEA9B

LEAA2           ldb     #0
                rts

SEAA5           brn     LEABB
                sta     ,-s
                beq     LEAB3
                lda     DRVTBL+3
                ldx     #DRVTBL+4
                lda     a,x

LEAB3           anda    #1
                asla
                sta     DRVTBL
                puls    pc,a

LEABB           clr     DRVTBL
                rts

SEABF           lbsr    SEBA8
                pshs    b,x
                bitb    #$10
                beq     LEAD0
                ldb     DRVTBL+3
                ldx     #DRVTBL+4
                inc     b,x
LEAD0           puls    pc,x,b

*   INIT    This routine performs any necessary initialization of the
*           drivers during cold start (at boot time). Actually, any
*           operation which must be done when the system is first booted
*           can be done here.
*
*           ENTRY - No parameters
*
*           EXIT - A, B, X, Y, and U may be destroyed

INIT            ldx     #DRVTBL
                ldb     #12

INIT2           clr     ,x+
                decb
                bne     INIT2
                rts

*   WARM    Performs any necessary functions during FLEX warmstart. FLEX
*           calls this routine each time it goes thru the warm start
*           procedure (after every command). As an example, some
*           controllers use PIA's for communication with the processor.
*           If FLEX is exited with a CPU reset, these PIA's may also be
*           reset such that the controller would not function properly
*           upon a jump to the FLEX warm start entry point. This routine
*           could re-initialize the PIA when the warm start was executed.
*
*           ENTRY - No parameters
*
*           EXIT - A, B, X, Y, and U may be destroyed

WARM            tst     SCRATCH3
                bne     LREAE7
                lda     #$80
                sta     $E014

LREAE7          rts

*   RESTORE A restore operation (also known as a "seek to track 00") is to
*           be performed on the specified drive. The drive is specified
*           in the FCB pointed to by the contents of the X register. Note
*           that the drive number is the 4th byte of the FCB. This
*           routine should select the drive before executing the restore
*           operation.
*
*           ENTRY - (X) = FCB address (3,X contains drive number)
*
*           EXIT -  (X) May be destroyed
*                   (A) May be destroyed
*                   (B) = Error condition
*                   (Z) = 1 if no error
*                       = 0 if an error

RESTORE         bsr     DRIVE
                bcs     LREAFF
                lda     #$A                     restore heads command
                sta     $E018
                lbsr    SEBB8
                lbsr    SEBA8
                andcc   #$FE
                bitb    #$40
                beq     LREAFF
                ldb     #$B

LREAFF          rts

*   DRIVE   The specified drive is to be selected. The drive is specified
*           in the FCB pointed to by the contents of the X register. Note
*           that the drive number is the 4th byte of the FCB.
*
*           ENTRY - (X) = FCB address (3,X contains drive number)
*
*           EXIT -  (X) May be destroyed
*                   (A) May be destroyed
*                   (B) = $0F if non-existent drive
*                       = Error condition otherwise
*                   (Z) = 1 if no error
*                       = 0 if an error
*                   (C) = 0 if no error
*                       = 1 if an error

DRIVE           pshs    x
                lda     3,x
                cmpa    #4
                bcs     LEB0D
                ldb     #$1F
                asrb
                puls    pc,x

LEB0D           bsr     SEB3A
                ldb     $E019
                stb     ,x
                sta     $E014
                cmpa    DRVTBL+3
                beq     LEB2E
                ldx     #$C14
                tst     CPUFLAG                 see if 1 or 2 MHZ
                bpl     LEB27                   2MHZ

                ldx     #$17EA                  1MHZ

LEB27           lbsr    SEBB8
                leax    -1,x
                bne     LEB27

LEB2E           sta     DRVTBL+3
                bsr     SEB3A
                lda     ,x
                sta     $E019
                bra     LEB49

SEB3A           ldx     #DRVTBL+8
                ldb     DRVTBL+3
                abx
                rts

*   CHKRDY  Check for a drive ready condition. The drive number is found
*           in the specified FCB (at 3,X). If the user's controller turns
*           the drive motors off after some time delay, this routine
*           should first check for a drive ready condition and if it is
*           not ready, should delay long enough for the motors to come up
*           to speed, then check again. This delay should be done ONLY if
*           not ready on the first try and ONLY if necessary for the
*           particular drives and controller! If the hardware always
*           leaves the drive motors on, this routine should perform a
*           single check for drive ready and immediately return the
*           resulting status. Systems which do not have the ability to
*           check for a drive ready condition should simply always return
*           a ready status if the drive number is valid.
*
*           ENTRY - (X) = FCB address (3,X contains drive number)
*
*           EXIT -  (X) May be destroyed
*                   (A) May be destroyed
*                   (B) = Error condition
*                   (Z) = 1 if drive ready
*                       = 0 if not ready
*                   (C) = 0 if drive ready
*                       = 1 if not ready

CHKRDY          pshs    x
                lda     3,x
                sta     $E014

LEB49           brn     LEB5B
                ldx     #$49B3
                tst     CPUFLAG
                bpl     LEB56
                ldx     #$9367

LEB56           ldb     $E018
                bmi     LEB5E

LEB5B           clra
                puls    pc,x

LEB5E           lbsr    SEBB8
                ldb     $E018
                bpl     LEB6D
                leax    -1,x
                bne     LEB5E

LEB6A           comb
                puls    pc,x

LEB6D           ldx     #$1576
                tst     CPUFLAG
                bpl     LEB78
                ldx     #$27DC

LEB78           lbsr    SEBB8
                leax    -1,x
                bne     LEB78
                clra
                puls    pc,x

*   QUICK   This routine performs a "quick" drive ready check. Its
*           function is exactly like the CHKRDY routine above except that
*           no delay should be done. If the drive does not give a ready
*           condition on the first check, a not ready condition is
*           immediately returned. Entry and exit are as above.

QUICK           pshs    x
                lda     3,x
                sta     $E014
                brn     LEB5B
                ldx     #$B0E
                tst     CPUFLAG
                bpl     LEB96
                ldx     #$161C

LEB96           tst     $E018
                lbsr    SEBB8
                leax    -1,x
                bne     LEB96
                ldb     $E018
                bmi     LEB6A
                clra
                puls    pc,x

SEBA8           tst     SPLFLG
                beq     LEBAF
                swi3

LEBAF           nop
                ldb     $E018
                bitb    #1
                bne     SEBA8
                rts

SEBB8           bsr     *+2
                bsr     *+2
                bsr     *+2
                rts

                END     $C850
