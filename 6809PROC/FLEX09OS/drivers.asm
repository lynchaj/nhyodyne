                NAM     DRIVERS
                PAG
                PRAGMA CD

USEDSKYNG       EQU     1
USEDSKYKB       EQU     1


;_____________________________________________________________________________________________________
; File Name   : DRIVERS.ASM
;_____________________________________________________________________________________________________
;
;  Harware Addresses
;_____________________________________________________________________________________________________
; UART 16C550 SERIAL
UART0       	equ    	$FE68           ; DATA IN/OUT
UART1       	equ    	$FE69           ; CHECK RX
UART2       	equ    	$FE6A           ; INTERRUPTS
UART3       	equ    	$FE6B           ; LINE CONTROL
UART4       	equ    	$FE6C           ; MODEM CONTROL
UART5          	equ    	$FE6D           ; LINE STATUS
UART6          	equ    	$FE6E           ; MODEM STATUS
UART7	       	equ    	$FE6F           ; SCRATCH REG.

;_____________________________________________________________________________________________________
;
; DISK DRIVER ROUTINE JUMP TABLE
;_____________________________________________________________________________________________________
                ORG     $DE00

READ            JMP     >DREAD       * DE00    READ      Read a single sector
WRITE           JMP     >DWRITE      * DE03    WRITE     Write a single sector
VERIFY          JMP     >DVERIFY     * DE06    VERIFY    Verify last sector written
RESTORE         JMP     >DRESTORE    * DE09    RESTORE   Restore head to track #0
DRIVE           JMP     >DDRIVE      * DE0C    DRIVE     Select the specified drive
CHKRDY          JMP     >DCHKRDY     * DE0F    CHKRDY    Check for drive ready
QUICK           JMP     >DQUICK      * DE12    QUICK     Quick check for drive ready
CINIT           JMP     >DCINIT      * DE15    CINIT     Driver initialize (cold start)
WARM            JMP     >DWARM       * DE18    WARM      Driver initialize (warm start)
SEEK            JMP     >DSEEK       * DE1B    SEEK      Seek to specified track


;_____________________________________________________________________________________________________
; Temp Storage Area
;_____________________________________________________________________________________________________


CURDRV          FCB     $00
CURDRVTYP       FCB     $00
CURDRVADDRESS   FCB     $00
CURDRVSLICE     FDB     $0000

DRVTYPES        FCB     $02,$02,$01,$01
                ;   $00 - INVALID
                ;   $01 - Floppy
                ;   $02 - IDE
DRVADDRESS      FCB     $01,$01,$01,$01
DRVSLICE        FDB     $0000,$0000,$0000,$0000

;_____________________________________________________________________________________________________
;_____________________________________________________________________________________________________
;_____________________________________________________________________________________________________




;_____________________________________________________________________________________________________
;
;       Monitor entry routine
;_____________________________________________________________________________________________________
MONITR          LDA     #$A
                BSR     VOUTCH              * OUTPUT CHARACTER
                LDA     #$D
                BSR     VOUTCH              * OUTPUT CHARACTER
                JMP     $FC0B               LOCATION OF MONITOR

;_____________________________________________________________________________________________________
;
;       Timer Drivers
;
;       Timers not supported
;_____________________________________________________________________________________________________
TMOFF       ; TIMER OFF ROUTINE
TMON        ; TIMER ON ROUTINE
TMINT       ; TIMER INITIALIZATION
                RTS

;_____________________________________________________________________________________________________
;
;       Console Drivers
;_____________________________________________________________________________________________________
;       Terminal init routine
TINIT           PSHS    A
                ; these are all set by CP/M prior to activating the 6809 card. If 6809 is the primary CPU, these need to be set
               	;	LDA		#$80		;
            	;	STA		UART3		; SET DLAB FLAG
	            ;	LDA		#12			; SET TO 12 = 9600 BAUD
	            ;	STA		UART0		; save baud rate
	            ;	LDA		#00			;
	            ;	STA		UART1		;
	            ;	LDA		#03			;
	            ;	STA		UART3		; SET 8 BIT DATA, 1 STOPBIT
	            ;	STA		UART4		;
                PULS    PC,A


;       Terminal input routine

VINCH           TST     >TAPPTR         ; allow redirection of input from terminal
                BEQ     TREDIR          ; redirection not required
                JSR     [TAPPTR]        ; redirect to alternate routine

;       Terminal output routine

VOUTCH          PSHS    a
!
		        LDA		UART5			; READ LINE STATUS REGISTER
		        ANDA	#$20			; TEST IF UART IS READY TO SEND (BIT 5)
		        CMPA 	#$00
		        BEQ		<       		; IF NOT REPEAT
                PULS    A
		        STA		UART0			; THEN WRITE THE CHAR TO UART
                RTS


;       Terminal status check routine

STAT:           PSHS    A
    	        LDA	    UART5			; READ LINE STATUS REGISTER
		        ANDA	#$01			; TEST IF DATA IN RECEIVE BUFFER
		        CMPA 	#$00
		        PULS    PC,A


;       Monitor terminal input character with echo

TREDIR          JSR     INCHNE
                BRA     VOUTCH


;       Monitor terminal input character without echo

INCHNE
		        LDA	    UART5			; READ LINE STATUS REGISTER
		        ANDA	#$01			; TEST IF DATA IN RECEIVE BUFFER
		        CMPA 	#$00
		        BEQ	    INCHNE      	; LOOP UNTIL DATA IS READY
		        LDA	    UART0			; THEN READ THE CHAR FROM THE UART
		        RTS


;_____________________________________________________________________________________________________
;
;       Interupt handler
;_____________________________________________________________________________________________________
IHNDLR          ;leau    <IRQLL-4,pc         get address of IRQ handler linked list
                fcb     $33,$8c             Why?  Because LWASM does not handle the above line correctly
                fcb     IRQLL-*-5
CHKNXT          ldu     4,u                 get a link
                beq     IHDONE              end of list

                lda     [,u]                get status from device
                bita    6,u                 did it interrupt?
                beq     CHKNXT              no - check next

                ldy     ,u                  yes - get address of device in Y
                jmp     [2,u]               go to device ISR

IHDONE          rti                         return from interrupt

;_____________________________________________________________________________________________________
;       add a device to IRQ handler table
;_____________________________________________________________________________________________________
ADDDEV          pshs    x,y,u
                bsr     SRCHLST             find link in chain
                beq     DEVARE              already exists - exit
                stu     4,x                 set link pointer in new ctl blk
                stx     4,y                 link this one into prev blk
DEVARE          puls    pc,X,Y,U

;_____________________________________________________________________________________________________
;       delete a device from IRQ handler table
;_____________________________________________________________________________________________________
DELDEV          pshs    x,y,u
                bsr     SRCHLST             find link in chain
                bne     NODEV               not found - exit
                ldx     4,x                 get link from ctl blk to delete
                stx     4,u                 set in prev block
NODEV           puls    pc,X,Y,U

;_____________________________________________________________________________________________________
;       search a linked list
;
;               entry: X = address of ISR control block
;               exit:  Y = address of link pointer
;                     CC = Z bit set if already linked
;
;               format of ISR control block:
;
;                       offset  description
;                         0     address of I/O device
;                         2     address of ISR
;                         4     link to next ISR control block
;                         6     bit mask for determining IRQ
;_____________________________________________________________________________________________________
SRCHLST         ;leau    <IRQLL-4,pcMONTH
                fcb     $33,$8c             Why?  Because LWASM does not handle the above line correctly
                fcb     IRQLL-*-5
SRCHLP          leay    ,u
                cmpx    4,u                 X = link?
                beq     FNDENT              yes - return pointer in U

                ldu     4,u                 no - get link in U
                bne     SRCHLP              not end of chain - loop
                andcc   #$FB                clear Z flag in CC

FNDENT          rts                         return - not found

;_____________________________________________________________________________________________________


IRQLL           fdb     0                   pointer to first entry in the table
                fcb     1

TAPPTR          fdb     0                   no terminal input redirection



;_____________________________________________________________________________________________________
;
;       Disk Driver Dispatchers
;
;       This code checks for the current drive type and dispatches the correct
;       driver for the device
;
;_____________________________________________________________________________________________________


;_____________________________________________________________________________________________________
;   READ    This routine reads the specified sector into memory at the
;           specified address. This routine should perform a seek
;           operation if necessary. A sector is 256 bytes in length.
;
;           ENTRY - (X) = Address in memory where sector is to be placed.
;                   (A) = Track Number
;                   (B) = Sector Number
;
;           EXIT -  (X) May be destroyed
;                   (A) May be destroyed
;                   (B) = Error condition
;                   (Z) = 1 if no error
;                       = 0 if an error
;_____________________________________________________________________________________________________
DREAD
                PSHS     A
                LDA     CURDRVTYP
                CMPA    #$01
                BEQ     READFLOPPY
                CMPA    #$02
                BEQ     READIDE
READERR:        LDB     #$1F
                ASRB
                PULS    PC,A
READFLOPPY:
                PULS    A
                JMP     FL_READ_SECTOR
READIDE:
                PULS    A
                JMP     IDE_READ_SECTOR

;_____________________________________________________________________________________________________
;   WRITE   This routine writes the information from the specifed memory
;           buffer area to the disk sector specified. This routine should
;           perform a seek operation if necessary. A sector is 256 bytes
;           in length.
;
;           ENTRY - (X) = Address of 256 memory buffer containing data
;                         to be written to disk
;                   (A) = Track Number
;                   (B) = Sector Number
;
;           EXIT -  (X) May be destroyed
;                   (A) May be destroyed
;                   (B) = Error condition
;                   (Z) = 1 if no error
;                       = 0 if an error
;_____________________________________________________________________________________________________
DWRITE
                PSHS     A
                LDA     CURDRVTYP
                CMPA    #$01
                BEQ     WRITEFLOPPY
                CMPA    #$02
                BEQ     WRITEIDE
WRITEERR:       LDB     #$1F
                ASRB
                PULS    PC,A
WRITEFLOPPY:
                PULS    A
                JMP     FL_WRITE_SECTOR

WRITEIDE:
                PULS    A
                JMP     IDE_WRITE_SECTOR
;_____________________________________________________________________________________________________
;   VERIFY  The sector just written to the disk is to be verified to
;           determine if there are CRC errors. No seek is required as
;           this routine will only be called immediately after a write
;           single sector operation.
;
;           ENTRY - No entry parameters
;
;           EXIT -  (X) May be destroyed
;                   (A) May be destroyed
;                   (B) = Error condition
;                   (Z) = 1 if no error
;                       = 0 if an error
;_____________________________________________________________________________________________________
DVERIFY
                LDA     CURDRVTYP
                CMPA    #$01
                BEQ     VERIFYFLOPPY
                CMPA    #$02
                BEQ     VERIFYIDE
VERIFYERR:      LDB     #$1F
                ASRB
                RTS
VERIFYFLOPPY:
                BRA     VERIFYERR
VERIFYIDE:
                LDB     #$00
                RTS
;_____________________________________________________________________________________________________
;   SEEK    Seeks to the track specified in the 'A' accumulator. In
;           double-sided systems, this routine should also select the
;           correct side depending on the sector number supplied in 'B'.
;
;           ENTRY - (A) = Track Number
;                   (B) = Sector Number
;
;           EXIT -  (X) May be destroyed (See text)
;                   (A) May be destroyed (See text)
;                   (B) = Error condition
;                   (Z) = 1 if no error
;                       = 0 if an error
;_____________________________________________________________________________________________________
DSEEK
                LDA     CURDRVTYP
                CMPA    #$01
                BEQ     SEEKFLOPPY
                CMPA    #$02
                BEQ     SEEKIDE
SEEKERR:        LDB     #$1F
                ASRB
                RTS
SEEKFLOPPY:
                BRA     SEEKERR
SEEKIDE:
                LDB     #$00
                RTS

;_____________________________________________________________________________________________________
;   INIT    This routine performs any necessary initialization of the
;           drivers during cold start (at boot time). Actually, any
;           operation which must be done when the system is first booted
;           can be done here.
;
;           ENTRY - No parameters
;
;           EXIT - A, B, X, Y, and U may be destroyed
;_____________________________________________________________________________________________________
DCINIT
                JSR     PPIDE_INIT
	IF USEDSKYNG = 1
	        	JSR     DSKY_INIT
	ENDC
                JSR     FL_SETUP
                RTS

;_____________________________________________________________________________________________________
;   WARM    Performs any necessary functions during FLEX warmstart. FLEX
;           calls this routine each time it goes thru the warm start
;           procedure (after every command). As an example, some
;           controllers use PIA's for communication with the processor.
;           If FLEX is exited with a CPU reset, these PIA's may also be
;           reset such that the controller would not function properly
;           upon a jump to the FLEX warm start entry point. This routine
;           could re-initialize the PIA when the warm start was executed.
;
;           ENTRY - No parameters
;
;           EXIT - A, B, X, Y, and U may be destroyed
;_____________________________________________________________________________________________________
DWARM
                RTS

;_____________________________________________________________________________________________________
;   RESTORE A restore operation (also known as a "seek to track 00") is to
;           be performed on the specified drive. The drive is specified
;           in the FCB pointed to by the contents of the X register. Note
;           that the drive number is the 4th byte of the FCB. This
;           routine should select the drive before executing the restore
;           operation.
;
;           ENTRY - (X) = FCB address (3,X contains drive number)
;
;           EXIT -  (X) May be destroyed
;                   (A) May be destroyed
;                   (B) = Error condition
;                   (Z) = 1 if no error
;                       = 0 if an error
;_____________________________________________________________________________________________________
DRESTORE
                BSR     DDRIVE
                LDA     CURDRVTYP
                CMPA    #$01
                BEQ     RESTOREFLOPPY
                CMPA    #$02
                BEQ     RESTOREIDE
RESTOREERR:     LDB     #$1F
                ASRB
                RTS
RESTOREFLOPPY:
                BRA     RESTOREERR
RESTOREIDE:
                LDB     #$00
                RTS


;_____________________________________________________________________________________________________
;   DRIVE   The specified drive is to be selected. The drive is specified
;           in the FCB pointed to by the contents of the X register. Note
;           that the drive number is the 4th byte of the FCB.
;
;           ENTRY - (X) = FCB address (3,X contains drive number)
;
;           EXIT -  (X) May be destroyed
;                   (A) May be destroyed
;                   (B) = $0F if non-existent drive
;                       = Error condition otherwise
;                   (Z) = 1 if no error
;                       = 0 if an error
;                   (C) = 0 if no error
;                       = 1 if an error
;_____________________________________________________________________________________________________
DDRIVE:
                LDA     3,X             ; DETERMINE IF DRIVE#>4, IF SO SET ERROR AND EXIT.
                CMPA    #4
                BCS     DRIVE1
DRIVEERR:
                LDB     #$1F
                ASRB
                RTS

DRIVE1          LDX     #DRVTYPES
                LEAX    A,X             ; GET DRIVE ENTRY FOR SELECTED DRIVE
                LDB     ,X
                CMPB    #$01            ; IF $01, OK
                BEQ     >
                CMPB    #$02            ; IF $02, OK
                BEQ     >
                BRA     DRIVEERR
!               STB     CURDRVTYP
                STA     CURDRV
                LDX     #DRVADDRESS
                LEAX    A,X             ; GET DRIVE ADDRESS FOR SELECTED DRIVE
                LDB     ,X
                STB     CURDRVADDRESS
                LDX     #DRVSLICE
                LSLA                    ; THIS ONE IS A WORD, NOT BYTE LOOKUP
                LEAX    A,X             ; GET DRIVE SLICE FOR SELECTED DRIVE
                LDB     ,X
                STB     CURDRVSLICE
                LEAX    1,X             ; GET DRIVE SLICE FOR SELECTED DRIVE
                LDB     ,X
                STB     CURDRVSLICE+1
                LDB     #$00
                RTS

;_____________________________________________________________________________________________________
;   CHKRDY  Check for a drive ready condition. The drive number is found
;           in the specified FCB (at 3,X). If the user's controller turns
;           the drive motors off after some time delay, this routine
;           should first check for a drive ready condition and if it is
;           not ready, should delay long enough for the motors to come up
;           to speed, then check again. This delay should be done ONLY if
;           not ready on the first try and ONLY if necessary for the
;           particular drives and controller! If the hardware always
;           leaves the drive motors on, this routine should perform a
;           single check for drive ready and immediately return the
;           resulting status. Systems which do not have the ability to
;           check for a drive ready condition should simply always return
;           a ready status if the drive number is valid.
;
;           ENTRY - (X) = FCB address (3,X contains drive number)
;
;           EXIT -  (X) May be destroyed
;                   (A) May be destroyed
;                   (B) = Error condition
;                   (Z) = 1 if drive ready
;                       = 0 if not ready
;                   (C) = 0 if drive ready
;                       = 1 if not ready
;_____________________________________________________________________________________________________
DCHKRDY
            RTS

;_____________________________________________________________________________________________________
;   QUICK   This routine performs a "quick" drive ready check. Its
;           function is exactly like the CHKRDY routine above except that
;           no delay should be done. If the drive does not give a ready
;           condition on the first check, a not ready condition is
;           immediately returned. Entry and exit are as above.
;_____________________________________________________________________________________________________
DQUICK
            RTS

;_____________________________________________________________________________________________________
                INCLUDE "flexidedrv.asm"
                INCLUDE "flexflpy.asm"
	IF USEDSKYNG = 1
	        	INCLUDE "flxdsky.asm"
	ENDC




;_____________________________________________________________________________________________________

HSTBUF:         RMB     512
