
;__MONITOR_______________________________________________________
; This is a simple monitor program that can be uploaded to the MBC
; from Z80 mode.
;
; It assumes that the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
; If the SBC is the only CPU in the system, ensure that jumpers
; J1 and J2 are set for 1&2.   Then burn ROM.BIN into EPROM.
;
; If the SBC is secondary to a Z80, the monitor.com file can be run from CP/M or the
; monitor.hex file can be loaded from the monitor. Ensure that jumpers J1 and J4
; are set for 2&3, the 6502 toggle IO address is set for $FF and
; the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
;
; to run from the MBC Z80 monitor
;
; first set the MPCL to allow RAM in the low bank
; >O 7C 80
; >O 78 80
;
; then load the .HEX file.
; >L
;
;
; Finally transfer control to the 65C02 by reading the toggle register
; >I FF
;
; The '02 should reset and run this program
;
;__________________________________________________________________________________________________
;
; DATA CONSTANTS
;__________________________________________________________________________________________________
;REGISTER		IO PORT		; FUNCTION
farfunct        = $32           ;function to call in driver area
IRQVECTOR       = $35           ; VECTOR FOR USER IRQ RTN
NMIVECTOR       = $37           ; VECTOR FOR USER IRQ RTN
TEMPWORD        = $39           ;
STRPTR          = $3B

IO              = $0300         ; 0300-03FF Memory mapped IO
MPCL_ROM        = $037C         ; ROM MAPPER
MPCL_RAM        = $0378         ; RAM MAPPER

MD_PAGEBU       = $0400         ; 0400-04FF PAGE BUFFER ADDRESS
memmovr         = $0500         ; 0200-02ff subr to move data from ram/rom disks
MD_PAGERA       = $0500         ; PAGE DRIVER ADDRESS
MD_PAGESE       = $14           ; PAGE SECTOR STORAGE
BANKED_DRIVER_DISPATCHER=$8800  ; LOCATION OF DRIVER DISPATCHER
USEROM          = 1

; UART 16C550 SERIAL -- Assumes IO is in page $03 -- DIP Switch settings $83
UART0           = $0368         ; DATA IN/OUT
UART1           = $0369         ; CHECK RX
UART2           = $036A         ; INTERRUPTS
UART3           = $036B         ; LINE CONTROL
UART4           = $036C         ; MODEM CONTROL
UART5           = $036D         ; LINE STATUS
UART6           = $036E         ; MODEM STATUS
UART7           = $036F         ; SCRATCH REG.

        .PC02
        .SEGMENT "TROM"
        .ORG    $F000

;__COLD_START___________________________________________________
;
; PERFORM SYSTEM COLD INIT
;
;_______________________________________________________________
COLD_START:
        SEI                     ; DISABLE INTERRUPTS
        CLD                     ;  VERIFY DECIMAL MODE IS OFF
        LDX     #$FF            ;
        TXS                     ; CLEAR STACK

        LDA     #<IRQROUTINE
        STA     IRQVECTOR
        STA     NMIVECTOR
        LDA     #>IRQROUTINE
        STA     IRQVECTOR+1
        STA     NMIVECTOR+1

        JSR     INIT_SERIAL
        JSR     PAGER_INIT

        JSR     RELOCATE_DRIVERS

        LDA     #<STARTUP       ; OUTPUT STARTUP STRING
        STA     STRPTR          ;
        LDA     #>STARTUP       ;
        STA     STRPTR+1        ;
        JSR     OUTSTR          ;

;
        BRK                     ; PERFORM BRK (START MONITOR)


;__IRQROUTINE___________________________________________________
;
; HANDLE INTERRUPT PROCESING
;
;_______________________________________________________________
IRQROUTINE:
        CLI                     ; ENABLE INTERRUPTS AGAIN
        RTI

;__INTERRUPT____________________________________________________
;
; HANDLE IRQ INTERRUPT AND DETERMINE IF IT IS A BRK OR AN IRQ
;
;_______________________________________________________________
INTERRUPT:
        SEI                     ; DISABLE INTERRUPTS
        STA     TEMPWORD
        PLA                     ; GET STATUS REGISTER
        PHA                     ; SAVE STATUS REGISTER
        AND     #$10            ; MASK BRK
        BNE     BRKCMD          ; BRK CMD
        JMP     (IRQVECTOR)     ; LET USER ROUTINE HAVE IT (USER DEFINED IRQ)
BRKCMD:
        LDA     TEMPWORD
        PHA
        TXA
        PHA
        TYA
        PHA
        JMP     BRKROUTINE      ; MONITOR BRK ROUTINE

NINTERRUPT:
        JMP     (NMIVECTOR)     ; LET USER ROUTINE HAVE IT (USER DEFINED NMI)

;__________________________________________________________________________________________________________
;
;  AT SOME POINT, REPLACE THIS WITH 6502HBIOS CALLS
;

INIT_SERIAL:
        LDA     #$80            ;
        STA     UART3           ; SET DLAB FLAG
        LDA     #12             ; SET TO 12 = 9600 BAUD
        STA     UART0           ; save baud rate
        LDA     #00             ;
        STA     UART1           ;
        LDA     #03             ;
        STA     UART3           ; SET 8 BIT DATA, 1 STOPBIT
        STA     UART4           ;
        RTS

IOF_CONINW:                     ;
SERIAL_INCHW1:
        LDA     UART5           ; READ LINE STATUS REGISTER
        AND     #$01            ; TEST IF DATA IN RECEIVE BUFFER
        CMP     #$00
        BEQ     SERIAL_INCHW1   ; LOOP UNTIL DATA IS READY
        LDA     UART0           ; THEN READ THE CHAR FROM THE UART

        RTS

IOF_CONIN:                      ;
        LDA     UART5           ; READ LINE STATUS REGISTER
        AND     #$01            ; TEST IF DATA IN RECEIVE BUFFER
        BEQ     SERIAL_INCH1    ; NO CHAR FOUND
        LDA     UART0           ; THEN READ THE CHAR FROM THE UART
        RTS
SERIAL_INCH1:                   ;
        LDA     #$00
        RTS                     ;

;OUTCH:  ;
;        PHA                     ; STORE A
;TX_BUSYLP:
;        LDA     UART5           ; READ LINE STATUS REGISTER
;        AND     #$20            ; TEST IF UART IS READY TO SEND (BIT 5)
;        CMP     #$00
;        BEQ     TX_BUSYLP       ; IF NOT REPEAT
;        PLA                     ; RESTORE ACC
;        STA     UART0           ; THEN WRITE THE CHAR TO UART
;        RTS
;__IOF_CONINW____________________________________________________________________________________________
;
; PERFORM BLOCKING CONSOLE READ
;________________________________________________________________________________________________________
;IOF_CONINW:
;        LDA     #02
;        STA     farfunct
;        JMP     DO_FARCALL

;__IOF_CONIN_____________________________________________________________________________________________
;
; PERFORM NON-BLOCKING CONSOLE READ
;________________________________________________________________________________________________________
;IOF_CONIN:
 ;       LDA     #01
  ;      STA     farfunct
   ;     JMP     DO_FARCALL

;__OUTCH_________________________________________________________________________________________________
;
; PERFORM CONSOLE WRITE
;________________________________________________________________________________________________________
OUTCH:
        PHA
        LDA     #00
        STA     farfunct
        PLA
        JMP     DO_FARCALL


Z80:
        BRK
        .BYTE   00,00,00

;__OUTSTR______________________________________________________
;
; OUTPUT THE STRING POINTED TO BY OUTSTR TO THE SCREEN
;
;______________________________________________________________
OUTSTR:
        LDY     #$00            ; LOAD $00 INTO Y
OUTSTRLP:
        LDA     (STRPTR),Y      ; LOAD NEXT CHAR FROM STRING INTO ACC
        CMP     #$00            ; IS NULL?
        BEQ     ENDOUTSTR       ; YES, END PRINT OUT
        JSR     OUTCH           ; PRINT CHAR IN ACC
        INC     STRPTR
        BNE     OUTSTRLP
        INC     STRPTR+1
        JMP     OUTSTRLP        ; DO NEXT CHAR
ENDOUTSTR:
        RTS                     ; RETURN

        .INCLUDE"SUPERMON.ASM"
        .INCLUDE"../DOS65/OS/DOSPAGER.ASM"

DO_FARCALL      = farcall - md_pagecode + $0500

;__RELOCATE_DRIVERS______________________________________________________________________________________
;
; MOVE ROM BIOS HARDWARE DRIVERS FROM ROM PAGE 0D TO RAM PAGE 0C PERFORM CONSOLE WRITE
;________________________________________________________________________________________________________
RELOCATE_DRIVERS:

; MOVE RELCODE TO LOWRAM
        LDX     #$00
:
        LDA     RELCODE,X
        STA     $0600,X
        INX
        CPX     #$00
        BNE     :-

        JMP     $0600           ; RUN IT

RELCODE:
        LDA     #$00
        STA     TEMPWORD
        LDA     #$88
        STA     TEMPWORD+1
        LDY     #$00
:
        LDA     #$00
        STA     MPCL_RAM
        NOP
        NOP
        LDA     #$0D
        STA     MPCL_ROM
        NOP
        NOP
        LDA     (TEMPWORD),Y
        PHA
        LDA     #$80
        STA     MPCL_ROM
        NOP
        NOP
        LDA     #$8C
        STA     MPCL_RAM
        PLA
        STA     (TEMPWORD),Y

        INC     TEMPWORD
        LDA     TEMPWORD
        CMP     #$00
        BNE     :-
        INC     TEMPWORD+1
        LDA     TEMPWORD+1
        CMP     #$FF
        BNE     :-

        LDA     #$00
        STA     MPCL_RAM
        NOP
        NOP
        LDA     #$00
        STA     MPCL_ROM

        RTS

; START BANNER
STARTUP:
        .BYTE   $0D,$0A

        .BYTE   "  Nhyodyne",$0D,$0A
        .BYTE   "   __ _____  _____ ___ ___ ",$0D,$0A
        .BYTE   "  / /| ____|/ ____/ _ \__ \ ",$0D,$0A
        .BYTE   " / /_| |__ | |   | | | | ) | ",$0D,$0A
        .BYTE   "| '_ \___ \| |   | | | |/ / ",$0D,$0A
        .BYTE   "| (_) |__) | |___| |_| / /_ ",$0D,$0A
        .BYTE   " \___/____/ \_____\___/____| ",$0D,$0A
        .BYTE   "* 65c02 SuperMON ",$0D,$0A,$00

        .SEGMENT "VECTORS"
NNTVECTOR:
        .WORD   NINTERRUPT      ;
RSTVECTOR:
        .WORD   COLD_START      ;
INTVECTOR:
        .WORD   INTERRUPT       ; ROM VECTOR FOR IRQ

        .END
