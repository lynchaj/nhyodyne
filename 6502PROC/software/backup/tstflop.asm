;__TSTFLOP_______________________________________________________
;
; This is a quick program to debug floppy access
;
;_______________________________________________________________





        .INCLUDE "../DOS65/os/drvmacro.asm"
        .INCLUDE "../DOS65/os/dosdefn.asm"

; UART 16C550 SERIAL
UART0           = $0368         ; DATA IN/OUT
UART1           = $0369         ; CHECK RX
UART2           = $036A         ; INTERRUPTS
UART3           = $036B         ; LINE CONTROL
UART4           = $036C         ; MODEM CONTROL
UART5           = $036D         ; LINE STATUS
UART6           = $036E         ; MODEM STATUS
UART7           = $036F         ; SCRATCH REG.

STRPTR          = $f0

        .SEGMENT "CODE"

;_______________________________________________________________
COLD_START:
        LDA     #<STARTUP       ; OUTPUT STARTUP STRING
        STA     STRPTR          ;
        LDA     #>STARTUP       ;
        STA     STRPTR+1        ;
        JSR     OUTSTR          ;

        JSR     FL_SETUP


        LDA     #$00
        STA     sektrk          ; LOAD TRACK # (LOW BYTE)
        LDA     #$10
        STA     seksec          ; LOAD SECTOR # (LOW BYTE)
        JSR     FL_READ_SECTOR




        BRK
        DRIVERS=0
        .INCLUDE "../DOS65/OS/DOSFLP.ASM"

;_______________________________________________________________
;__OUTSTR______________________________________________________
;
; OUTPUT THE STRING POINTED TO BU OUTSTR TO THE SCREEN
;
;______________________________________________________________
OUTSTR:
        LDY     #$00            ; LOAD $00 INTO Y
OUTSTRLP:
        LDA     (STRPTR),Y      ; LOAD NEXT CHAR FROM STRING INTO ACC
        CMP     #$00            ; IS NULL?
        BEQ     ENDOUTSTR       ; YES, END PRINT OUT
        JSR     OUTCH           ; PRINT CHAR IN ACC
        INY                     ; Y=Y+1 (BUMP INDEX)
        JMP     OUTSTRLP        ; DO NEXT CHAR
ENDOUTSTR:
        RTS                     ; RETURN

DSKY_SHOW:
DSKY_BIN2SEG:
BLKSECR512:
DEBSECR512:
        RTS

OUTCH:
CONSOLE_OUT:
        PHA
TX_BUSYLP:
        LDA     UART5           ; READ LINE STATUS REGISTER
        AND     #$20            ; TEST IF UART IS READY TO SEND (BIT 5)
        CMP     #$00
        BEQ     TX_BUSYLP       ; IF NOT REPEAT
        PLA
        STA     UART0           ; THEN WRITE THE CHAR TO UART
        RTS

STARTUP:
        .BYTE   $0D,$0A
        .BYTE   "   __ _____  _____ ___ ___ ",$0D,$0A
        .BYTE   "  / /| ____|/ ____/ _ \__ \ ",$0D,$0A
        .BYTE   " / /_| |__ | |   | | | | ) | ",$0D,$0A
        .BYTE   "| '_ \___ \| |   | | | |/ / ",$0D,$0A
        .BYTE   "| (_) |__) | |___| |_| / /_ ",$0D,$0A
        .BYTE   " \___/____/ \_____\___/____| ",$0D,$0A
        .BYTE   "* FLOPPY TEST APP",$0D,$0A,$00


hstbuf:
        .RES    512             ;256 or 512 byte sectors



        .END
