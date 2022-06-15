;__MACRO___________________________________________________________________________________________________________________
;
; 	Macros for the betterment of Mankind
;________________________________________________________________________________________________________________________________
;

.macro          PRTDBG      message
.LOCAL p1
.LOCAL p2
.LOCAL p3
.LOCAL p4
.LOCAL p5
  .if     .paramcount <> 1
        .error  "Too few parameters for macro PRTDBG"
        .endif
        .if DEBUG=1
        PHA
        PHX
        PHY
        LDX #$00
p1:
        LDA p4,x
        INX
        CMP #'$'
        BEQ p2
        JSR CONSOLE_OUT
        JMP p1
p2:
        LDA #13
        jsr CONSOLE_OUT
        LDA #10
        jsr CONSOLE_OUT
        PLY
        plx
        pla
        JMP p5
p4:
        .BYTE message
p5:
        .endif
.endmacro

.macro          PRTS      message
.LOCAL p1
.LOCAL p2
.LOCAL p3
.LOCAL p4
.LOCAL p5
  .if     .paramcount <> 1
        .error  "Too few parameters for macro PRTS"
        .endif
        PHA
        PHX
        PHY
        LDX #$00
p1:
        LDA p4,x
        INX
        CMP #'$'
        BEQ p2
        JSR CONSOLE_OUT
        JMP p1
p2:
        PLY
        plx
        pla
        JMP p5
p4:
        .BYTE message
p5:
.endmacro

.macro          DBGFLAG      character
  .if     .paramcount <> 1
        .error  "Too few parameters for macro DBGFLAG"
        .endif
        .if DEBUG=1
        PHA
        LDA #character
        JSR CONSOLE_OUT
        pla
        .endif
.endmacro


;__PRTHEXBYTE__________________________________________________
; PRINT OUT ACCUMULATOR AS HEX NUMBER
;______________________________________________________________
PRTHEXBYTE:
        PHA
        PHX
        PHY
        TAX				; SAVE A REGISTER
        LSR 				; SHIFT HIGH NIBBLE TO LOW NIBBLE
        LSR 				;
        LSR 				;
        LSR 				;
        CLC               		; CLEAR CARRY
        JSR PRINT_DIGIT			; PRINT LOW NIBBLE
        TXA				; RESTORE ACCUMULATOR
        JSR PRINT_DIGIT			; PRINT LOW NIBBLE
        PLY
        plx
        PLA
        RTS

;__PRINT_DIGIT_________________________________________________
;
; PRINT OUT LOW NIBBLE OF ACCUMULATOR IN HEX
;
;______________________________________________________________
PRINT_DIGIT:
               AND #$0F				; STRIP OFF HIGH NIBBLE
               ORA #$30				; ADD $30 TO PRODUCE ASCII
               CMP #$3A               		; IS GREATER THAN 9
               BMI PRINT_DIGIT_OUT		; NO, SKIP ADD
               CLC				; CLEAR CARRY
               ADC #$07				; ADD ON FOR LETTER VALUES
PRINT_DIGIT_OUT:					;
               JMP CONSOLE_OUT              		; PRINT OUT CHAR

NEWLINE:
                pha
                PHX
                phy
                LDA #$0D
                JSR CONSOLE_OUT
                LDA #$0A
                Jsr CONSOLE_OUT
                ply
                plx
                pla
                rts

PRTDEC:
                phy
                PHX
                PHA
                ldy #00
                LDX #$FF
                SEC
PrDec100:
                INX
                SBC #100
                BCS PrDec100            ;Count how many 100s
                ADC #100
                JSR PrDecDigit          ;Print the 100s
                LDX #$FF
                SEC                     ;Prepare for subtraction
PrDec10:
                INX
                SBC #10
                BCS PrDec10             ;Count how many 10s
                ADC #10
                JSR PrDecDigit          ;Print the 10s
                TAX                     ;Pass 1s into X
                ldy #1
                JSR PrDecDigit          ;Print the 1s
                PLA
                PLX
                ply
                RTS
PrDecDigit:
                PHA
                cpy #$00
                bne PrDecDigit1
                txa
                tay
                cpy #$00
                bne PrDecDigit1
                jmp PrDecDigit2
PrDecDigit1:
                TXA                     ;Save A, pass digit to A
                ORA #'0'
                JSR  CONSOLE_OUT        ;Convert to character and print it
PrDecDigit2:
                PLA
                RTS                     ;Restore A and return
