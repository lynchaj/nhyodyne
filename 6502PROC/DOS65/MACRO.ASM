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
        JSR WRSER1
        BRA p1
p2:
        LDA #13
        jsr WRSER1
        LDA #10
        jsr WRSER1
        PLY
        plx
        pla
        bra p5
p4:
        .BYTE message
p5:
        .endif
.endmacro