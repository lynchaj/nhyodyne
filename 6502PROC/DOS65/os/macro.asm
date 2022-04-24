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
        JSR conwrt
        JMP p1
p2:
        LDA #13
        jsr conwrt
        LDA #10
        jsr conwrt
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
        JSR conwrt
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
               JMP conwrt              		; PRINT OUT CHAR

NEWLINE:
                pha
                PHX
                phy
                LDA #$0D
                JSR conwrt
                LDA #$0A
                Jsr conwrt
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
                JSR  conwrt             ;Convert to character and print it
PrDecDigit2:
                PLA
                RTS                     ;Restore A and return
