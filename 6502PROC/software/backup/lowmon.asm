
;__LOWMON__________________________________________________________________________________________
; This is a simple monitor program that can loaded into low ram
; for debugging.
;
; It assumes that the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
;
;__________________________________________________________________________________________________
;
; DATA CONSTANTS
;__________________________________________________________________________________________________
;REGISTER			; FUNCTION
farfunct        = $32           ;function to call in driver area
farpointer      = $33           ;WORD POINTER to call in driver area
IRQVECTOR       = $35           ; VECTOR FOR USER IRQ RTN
NMIVECTOR       = $37           ; VECTOR FOR USER IRQ RTN
STRPTR          = $3B           ;
INBUFFER        = $0200         ;

IO              = $0300         ; 0300-03FF Memory mapped IO
MPCL_ROM        = $037C         ; ROM MAPPER
MPCL_RAM        = $0378         ; RAM MAPPER

BANKED_DRIVER_DISPATCHER=$8800  ; LOCATION OF DRIVER DISPATCHER


; UART 16C550 SERIAL -- Assumes IO is in page $03 -- DIP Switch settings $83
UART0           = $0368         ; DATA IN/OUT
UART1           = $0369         ; CHECK RX
UART2           = $036A         ; INTERRUPTS
UART3           = $036B         ; LINE CONTROL
UART4           = $036C         ; MODEM CONTROL
UART5           = $036D         ; LINE STATUS
UART6           = $036E         ; MODEM STATUS
UART7           = $036F         ; SCRATCH REG.




        .ORG    $1000


        LDA     #<STARTUP       ; OUTPUT STARTUP STRING
        STA     STRPTR          ;
        LDA     #>STARTUP       ;
        STA     STRPTR+1        ;
        JSR     OUTSTR          ;

        LDA     #$00            ;
        STA     INBUFFER        ; MAKE SURE INPUT BUFFER IS EMPTY
;
        JMP     STRT            ; START THE MONITOR


Z80:
        RTS

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

DO_FARCALL:
        PHA
        LDA     #$80
        STA     MPCL_ROM
        NOP
        NOP
        LDA     #$8C
        STA     MPCL_RAM
        NOP
        NOP
        PLA
        JSR     BANKED_DRIVER_DISPATCHER
        PHA
        LDA     #$00
        STA     MPCL_RAM
        NOP
        NOP
        STA     MPCL_ROM
        NOP
        NOP
        PLA
        RTS

DO_FARRUN:
        LDA     #$80
        STA     MPCL_ROM
        NOP
        NOP
        LDA     $00
        STA     MPCL_RAM
        NOP
        NOP
        JMP     ($0001)

        .INCLUDE "supermon.asm"

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

OUTCH:  ;
        PHA                     ; STORE A
TX_BUSYLP:
        LDA     UART5           ; READ LINE STATUS REGISTER
        AND     #$20            ; TEST IF UART IS READY TO SEND (BIT 5)
        CMP     #$00
        BEQ     TX_BUSYLP       ; IF NOT REPEAT
        PLA                     ; RESTORE ACC
        STA     UART0           ; THEN WRITE THE CHAR TO UART
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
        .BYTE   "* Low Memory ($1000-$2000) SuperMON 65c02 ",$0D,$0A,$00

        .END
