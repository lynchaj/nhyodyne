
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
IRQVECTOR       = $35           ; VECTOR FOR USER IRQ RTN
NMIVECTOR       = $37           ; VECTOR FOR USER IRQ RTN
WORKPTR         = $39           ; WORK POINTER FOR COMMAND PROCESSOR
JUMPPTR         = $3B           ; JUMP VECTOR FOR LOOKUP TABLE
TEMPWORD        = $3D           ;
TEMPWORD1       = $3F           ;
TEMPWORD2       = $40           ;

TEMPBYTE        = $42           ;
ACC             = $43           ; ACC STORAGE
XREG            = $44           ; X REG STORAGE
YREG            = $45           ; Y REG STORAGE
PREG            = $46           ; CURRENT STACK POINTER
PC              = $47           ; PROGRAM COUNTER
SPTR            = $49           ; CPU STATUS REGISTER
CKSM            = $4A           ; CHECKSUM
BYTECT          = $4B           ; BYTE COUNT
STRPTR          = $4C           ;
COUNTER         = $4E           ;
SRC             = $50           ;
DEST            = $52           ;
INBUFFER        = $0200         ;

; UART 16C550 SERIAL -- Assumes IO is in page $03 -- DIP Switch settings $83
UART0           = $0368         ; DATA IN/OUT
UART1           = $0369         ; CHECK RX
UART2           = $036A         ; INTERRUPTS
UART3           = $036B         ; LINE CONTROL
UART4           = $036C         ; MODEM CONTROL
UART5           = $036D         ; LINE STATUS
UART6           = $036E         ; MODEM STATUS
UART7           = $036F         ; SCRATCH REG.

; this is Z80 code that is used to be able to run this as a .COM file.  It is truncated
; when the various .HEX files are generated
;
        .SEGMENT "LOADER"
        .BYTE   $F3             ;DI - DISABLE INTERRUPTS
        .BYTE   $01,$00,$10     ;LD	BC,$1000 -BYTES TO MOVE
        .BYTE   $11,$00,$70     ;LD	DE,$7000 -DESTINATION ADDRESS (6502 IS !A15)
        .BYTE   $21,$20,$01     ;LD	HL,$0120 -SOURCE ADDRESS
        .BYTE   $ED,$B0         ;LDIR  		 -COPY RAM
        .BYTE   $DB,$FF         ;IN 	A,$FF    -ENABLE 6502
        .BYTE   $0E,$00         ;LD	C,00H    -CP/M SYSTEM RESET CALL
        .BYTE   $CD,$05,$00     ;CALL	0005H	 -RETURN TO PROMPT
;
;
;


        .SEGMENT "TROM"

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
        TXA

        LDA     #<IRQROUTINE
        STA     IRQVECTOR
        STA     NMIVECTOR
        LDA     #>IRQROUTINE
        STA     IRQVECTOR+1
        STA     NMIVECTOR+1

        LDA     #<STARTUP       ; OUTPUT STARTUP STRING
        STA     STRPTR          ;
        LDA     #>STARTUP       ;
        STA     STRPTR+1        ;
        JSR     OUTSTR          ;

        LDA     #$00            ;
        STA     INBUFFER        ; MAKE SURE INPUT BUFFER IS EMPTY
;
        BRK                     ; PERFORM BRK (START MONITOR)

;__BRKROUTINE___________________________________________________
;
; HANDLE CPU BRK INTERRUPT PROCESING AND START MONITOR
;
;_______________________________________________________________
BRKROUTINE:
; MONITOR'S BREAK HANDLER
        CLC
        PLA                     ;
        TAX                     ; LOW BYTE OF PC
        PLA                     ;
        TAY                     ; HIGH BYTE OF PC
        SEC                     ;
        TXA                     ;
        SBC     #$02            ; REMOVE BREAK INSTRUCTION
        STA     PC              ;
        BCS     BRK2            ;
        DEY
BRK2:
        STY     PC+1            ; SAVE PC
        TSX                     ; GET STACK POINTER
        STX     SPTR            ; SAVE STACK POINTER
        JSR     PRINT_REG       ; DUMP REGISTER CONTENTS
        LDX     #$FF            ;
        TXS                     ; CLEAR STACK
        CLI                     ; ENABLE INTERRUPTS AGAIN
        JMP     COMMAND_PROCESSOR; START THE MONITOR


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
        STY     YREG            ; SAVE Y
        STX     XREG            ; SAVE X
        STA     ACC             ; SAVE A
        PLA                     ; GET STATUS REGISTER
        STA     PREG            ; SAVE STATUS REGISTER
        AND     #$10            ; MASK BRK
        BNE     BRKCMD          ; BRK CMD
        JMP     (IRQVECTOR)     ; LET USER ROUTINE HAVE IT (USER DEFINED IRQ)
BRKCMD:
        JMP     BRKROUTINE      ; MONITOR BRK ROUTINE

NINTERRUPT:
        JMP     (NMIVECTOR)     ; LET USER ROUTINE HAVE IT (USER DEFINED NMI)


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

Z80:
        LDA     $03FF
        BRK
        .BYTE   00,00,00

        .INCLUDE"MONCODE.ASM"

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
        .BYTE   "* 65c02 MONITOR ",$0D,$0A,$00

        .SEGMENT "VECTORS"
NNTVECTOR:
        .WORD   NINTERRUPT      ;
RSTVECTOR:
        .WORD   COLD_START      ;
INTVECTOR:
        .WORD   INTERRUPT       ; ROM VECTOR FOR IRQ

        .END
