;*
;* ASSEMBLER/DISSASSEMBLER
;*
;* Based on original source code by Jim Butterfield
;*
;* Mr. Butterfield inspired many of us with his work on the commodore series of computers.
;* May he rest in peace. (1936-2007)
;*


savx            = $1c
tmpc            = $1d
length          = $1f
wrap            = $26
aflg            = $28
acmd            = $2a
nemo            = $44
tmp0            = $c1
tmp2            = $c3
stage           = $0210


;__DISASSEMBLE_________________________________________________
;
; Disassemble assembly lines to screen
; USAGE:
;
; DISSASSEMBLE XXXX
;______________________________________________________________
DISASSEMBLE:

        LDA     #<INBUFFER      ; SETUP WORK BUFFER
        STA     WORKPTR         ;
        LDA     #>INBUFFER      ;
        STA     WORKPTR +1      ;

        JSR     INCWORKPTR      ; JUMP OVER "D"
        JSR     INCWORKPTR      ; JUMP OVER "I"
        JSR     INCWORKPTR      ; JUMP OVER "S"
        JSR     INCWORKPTR      ; JUMP OVER "S"
        JSR     INCWORKPTR      ; JUMP OVER "A"
        JSR     INCWORKPTR      ; JUMP OVER "S"
        JSR     INCWORKPTR      ; JUMP OVER "S"
        JSR     INCWORKPTR      ; JUMP OVER "E"
        JSR     INCWORKPTR      ; JUMP OVER "M"
        JSR     INCWORKPTR      ; JUMP OVER "B"
        JSR     INCWORKPTR      ; JUMP OVER "L"
        JSR     INCWORKPTR      ; JUMP OVER "E"

        JSR     EATWHITESPACE   ; SKIP OVER THE WHITESPACE
        JSR     GETNUMBER       ; GET THE STARTING ADDRESS
        BCS     DISASSEMBLE_ERROR; IF NOT A NUMBER, REPORT ERROR
        LDA     TEMPWORD
        STA     tmp0
        LDA     TEMPWORD+1
        STA     tmp0+1
diss:
        LDA     #$0f
        STA     TEMPBYTE
dislp:
        JSR     diss1
        JSR     pcadj
        STA     tmp0
        STY     tmp0+1
        DEC     TEMPBYTE
        BNE     dislp


        LDA     #<DISSASSEMBLE_TEXT; LOAD LOW BYTE OF PROMPT STRING
        STA     STRPTR          ; STORE IN POINTER LOW BYTE
        LDA     #>DISSASSEMBLE_TEXT; LOAD HOGH BYTE OF PROMPR STRING
        STA     STRPTR +1       ; STORE IN POINTER HIGH BYTE
        JSR     OUTSTR          ; OUTPUT THE STRING

        JSR     IOF_CONINW
        CMP     #'Y'
        BNE     dissexit
        JMP     diss
dissexit:
        RTS
DISSASSEMBLE_TEXT:
        .BYTE   $0d,$0a
        .BYTE   "CONTINUE? (Y/N) "
        .BYTE   $0d,$0a,$00

DISASSEMBLE_ERROR:
        JMP     INVALID_NUMBER_ERROR
ENTER_BYTE:
        TAX                     ; SAVE A REGISTER
        LSR     A               ; SHIFT HIGH NIBBLE TO LOW NIBBLE
        LSR     A               ;
        LSR     A               ;
        LSR     A               ;
        CLC                     ; CLEAR CARRY
        JSR     ENTER_DIGIT     ; PRINT LOW NIBBLE
        TXA                     ; RESTORE ACCUMULATOR
        JMP     ENTER_DIGIT     ; PRINT LOW NIBBLE
ENTER_DIGIT:
        AND     #$0F            ; STRIP OFF HIGH NIBBLE
        ORA     #$30            ; ADD $30 TO PRODUCE ASCII
        CMP     #$3A            ; IS GREATER THAN 9
        BMI     ENTER_DIGIT_OUT ; NO, SKIP ADD
        CLC                     ; CLEAR CARRY
        ADC     #$07            ; ADD ON FOR LETTER VALUES
ENTER_DIGIT_OUT:                ;
        PHA
        JSR     OUTCH           ; PRINT OUT CHAR
        PLA
        STA     WORKPTR
        JMP     INCWORKPTR




;__diss1_______________________________________________________
;
; Disassemble 1 assembly line to screen
; Parms:
; tmp0 (WORD) Word Pointer to begin disassembly
;______________________________________________________________
diss1:
        JSR     crlf
        LDA     #'.'
        JSR     OUTCH
        JSR     space
diss1a:
        JSR     PRINT_WORD
        JSR     space
        LDX     #0
        LDA     (tmp0,x)
        JSR     instxx
        PHA
        JSR     disvv
        PLA
        JSR     propxx
        LDX     #$06
pradr1:
        CPX     #$03
        BNE     pradr3
        LDY     length
        BEQ     pradr3
pradr2:
        LDA     acmd
        CMP     #$e8
        LDA     (tmp0),y
        BCS     reladr
        JSR     prbyte
        DEY
        BNE     pradr2
pradr3:
        ASL     acmd
        BCC     pradr4
        LDA     char1-1,x
        JSR     chrout
        LDA     char2-1,x
        BEQ     pradr4
        JSR     chrout
pradr4:
        DEX
        BNE     pradr1
        RTS
; ** print rel address **
reladr:
        JSR     pcadj3
        TAX
        INX
        BNE     prntyx
        INY
; ** print word address **
prntyx:
        TYA
        JSR     prbyte
        TXA
; ** print Byte **
prbyte:
        STX     savx
        JSR     PRINT_BYTE
        LDX     savx
        RTS
; ** advance the program counter **
pcadj:
        LDA     length
        SEC
pcadj3:
        LDY     tmp0+1
        TAX
        BPL     pcadj4
        DEY
pcadj4:
        ADC     tmp0
        BCC     rts1
        INY
rts1:
        RTS
; ** check inst valid, len **
instxx:
        TAY
        LSR     a
        BCC     ieven
        LSR     a
        BCS     err
        CMP     #$22
        BEQ     err
        AND     #$07
        ORA     #$80
ieven:
        LSR     a
        TAX
        LDA     mode,x
        BCS     rtmode
        LSR     a
        LSR     a
        LSR     a
        LSR     a
rtmode:
        AND     #$0f
        BNE     getfmt
err:
        LDY     #$80
        LDA     #0
; ** get addr mode, length **
getfmt:
        TAX
        LDA     mode2,x
        STA     acmd
        AND     #$03
        STA     length
; ** extract intructn **
        TYA
        AND     #$8f
        TAX
        TYA
        LDY     #$03
        CPX     #$8a
        BEQ     mnndx3
mnndx1:
        LSR     a
        BCC     mnndx3
        LSR     a
mnndx2:
        LSR     a
        ORA     #$20
        DEY
        BNE     mnndx2
        INY
mnndx3:
        DEY
        BNE     mnndx1
        RTS
; print bytes
disvv:
        LDA     (tmp0),y
        JSR     prbyte
        LDX     #1
disvl:
        JSR     spacd
        CPY     length
        INY
        BCC     disvv
        LDX     #$03
        CPY     #4
        BCC     disvl
        RTS
; ** print mnemonic **
propxx:
        TAY
        LDA     mneml,y
        STA     aflg
        LDA     mnemr,y
        STA     aflg+1
prmn1:
        LDA     #0
        LDY     #$05
prmn2:
        ASL     aflg+1
        ROL     aflg
        ROL     a
        DEY
        BNE     prmn2
        ADC     #$3f
        JSR     OUTCH
        DEX
        BNE     prmn1
; ** print space **
space:
        LDA     #$20
        BNE     flip
; ** print cr, maybe lf **
crlf:
        LDA     #$0d
        JSR     OUTCH
        LDA     #$0a
flip:
        JMP     OUTCH


;__ASSEMBLE____________________________________________________
;
; Assemble line from keyboard to memory
;______________________________________________________________
ASSEMBLE:
        LDA     #<INBUFFER      ; SETUP WORK BUFFER
        STA     WORKPTR         ;
        LDA     #>INBUFFER      ;
        STA     WORKPTR +1      ;

        JSR     INCWORKPTR      ; JUMP OVER "A"
        JSR     INCWORKPTR      ; JUMP OVER "S"
        JSR     INCWORKPTR      ; JUMP OVER "S"
        JSR     INCWORKPTR      ; JUMP OVER "E"
        JSR     INCWORKPTR      ; JUMP OVER "M"
        JSR     INCWORKPTR      ; JUMP OVER "B"
        JSR     INCWORKPTR      ; JUMP OVER "L"
        JSR     INCWORKPTR      ; JUMP OVER "E"

        JSR     EATWHITESPACE   ; SKIP OVER ANY WHITESPACE
        JSR     GETNUMBER       ; GET NUMBER
        BCS     ASSEMBLE_ERROR  ; IF NOT A NUMBER REPORT ERROR
        JMP     asvald
ASSEMBLE_ERROR:
        JMP     error
asvald:
        LDA     TEMPWORD
        STA     tmp0
        LDA     TEMPWORD+1
        STA     tmp0+1
asv1:
        JSR     crlf
        LDA     #'.'
        JSR     OUTCH
        JSR     space
        JSR     PRINT_WORD
        JSR     space
        JSR     t2t2
        STX     stage+1
        LDA     #<INBUFFER      ; SETUP INPUT COMMAND BUFFER
        STA     STRPTR          ;
        STA     WORKPTR         ;
        LDA     #>INBUFFER      ;
        STA     STRPTR +1       ;
        STA     WORKPTR+1       ;
        JSR     INSTR           ; GET A STRING FROM THE CONSOLE
        JSR     EATWHITESPACE
        LDX     #$03            ; push opcode to stack
        LDY     #$00
apush:
        LDA     (WORKPTR),Y     ; GET NEXT CHAR FROM BUFFER
        PHA
        JSR     INCWORKPTR
        DEX
        BNE     apush

        LDX     #$03
apull:
        PLA
        SEC
        SBC     #$3f
        LDY     #$05
acrun:
        LSR     a
        ROR     stage+1
        ROR     stage
        DEY
        BNE     acrun
        DEX
        BNE     apull
        LDX     #$02
ainp:
        LDY     #$00
        LDA     (WORKPTR),Y     ; GET NEXT CHAR FROM BUFFER
        JSR     INCWORKPTR
        CMP     #$00
        BEQ     aret
        CMP     #$20
        BEQ     ainp
        JSR     ahex
        BCS     stone

        JSR     rdob2
        LDY     tmp0
        STY     tmp0+1
        STA     tmp0

        LDA     #$30
        STA     stage,x
        INX
stone:
        STA     stage,x
        INX
        BNE     ainp
aret:
        STX     aflg
        LDX     #0
        STX     wrap
        BEQ     atry
abump:
        INC     wrap
        BEQ     aerr
atry:
        LDX     #0
        STX     tmpc
        LDA     wrap
        JSR     instxx
        LDX     acmd
        STX     aflg+1
        TAX
        LDY     mneml,x
        LDA     mnemr,x
        JSR     achek2
        BNE     abump
        LDX     #$06
aoprnd:
        CPX     #$03
        BNE     ashf
        LDY     length
        BEQ     ashf
arsc:
        LDA     acmd
        CMP     #$e8
        LDA     #$30
        BCS     arel1
        JSR     acheck
        BNE     abump
        JSR     achick
        BNE     abump
        DEY
        BNE     arsc
ashf:
        ASL     acmd
        BCC     adex
        LDY     char2-1,x
        LDA     char1-1,x
        JSR     achek2
        BNE     abump
adex:
        DEX
        BNE     aoprnd
        BEQ     ald
arel1:
        JSR     acdb1
        BNE     abump
        JSR     acdb1
        BNE     abump
ald:
        LDA     aflg
        CMP     tmpc
        BNE     abump
        JSR     t2t2
        LDY     length
        BEQ     aopset
        LDA     aflg+1
        CMP     #$9d
        BNE     aopnd
        JSR     diffb
        BCC     abdown
        TYA
        BNE     aerr
        LDA     nemo
        BPL     abran
aerr:
        JMP     error
abdown:
        INY
        BNE     aerr
        LDA     nemo
        BPL     aerr
abran:
        LDY     length
        BNE     abrel
aopnd:
        LDA     tmp2-1,y
abrel:
        STA     (tmp0),y
        DEY
        BNE     aopnd
aopset:
        LDA     wrap
        STA     (tmp0),y
        JSR     pcadj
        STA     tmp0
        STY     tmp0+1
        JMP     asv1
acdb1:
        TAY
achek2:
        JSR     acheck
        BNE     acex
        TYA
acheck:
        BEQ     acex
achick:
        STX     savx
        LDX     tmpc
        CMP     stage,x
        PHP
        INX
        STX     tmpc
        LDX     savx
        PLP
acex:
        RTS
ahex:
        CMP     #$30
        BCC     asx
        CMP     #$47
        RTS
asx:
        SEC
        RTS



; ** swap tmp0, tmp2 **
t2t2:
        LDX     #$02
t2t21:
        LDA     tmp0-1,x
        PHA
        LDA     tmp2-1,x
        STA     tmp0-1,x
        PLA
        STA     tmp2-1,x
        DEX
        BNE     t2t21
        RTS

PRINT_WORD:
        PHA
        LDA     tmp0+1
        JSR     prbyte
        LDA     tmp0
        JSR     prbyte
        PLA
        RTS
; ** calc tmp2-tmp0-2 **
diffb:
        LDA     tmp2
        LDY     tmp2+1
        SEC
        SBC     #2
        BCS     deck
        DEY
        BCC     deck
; ** calc aflg-tmp0 **
diffa:
        LDA     aflg
        LDY     aflg+1
        JMP     deck
; ** calc tmp2-tmp0 **
diffp:
        LDA     tmp2
        LDY     tmp2+1
deck:
        SEC
        SBC     tmp0
        STA     nemo
        TYA
        SBC     tmp0+1
        TAY
        ORA     nemo
        RTS

error:
        LDA     #$3f
        JSR     OUTCH
        RTS
; ** print spaces **
spacd:
        JSR     space
        DEX
        BNE     spacd
        RTS
chrout:
        CMP     aflg
        BEQ     caltrit
        JSR     OUTCH
caltrit:
        RTS

altrit:
        TYA
        PHA
        JSR     crlf
        PLA
        JSR     OUTCH
        LDA     #$2e
        JMP     OUTCH

; ** print hex byte **
wroa:
        LDA     tmp0+1
        JSR     PRINT_BYTE
        LDA     tmp0
        JMP     PRINT_BYTE

; ** read hex byte **
rdob2:
        JSR     hexit
        ASL     a
        ASL     a
        ASL     a
        ASL     a
        STA     acmd
        LDA     (WORKPTR),Y     ; GET NEXT CHAR FROM BUFFER
        JSR     INCWORKPTR
rdob3:
        JSR     hexit
        ORA     acmd
        SEC
        RTS
; ** convert from hex **
hexit:
        CMP     #$3a
        BCC     hex08
        ADC     #$08
hex08:
        AND     #$0f
        RTS


; mode table... nybble organized
; 0= err  4= implied  8= zer,x   c= zer,y
; 1= imm  5= acc      9= abs,x   d= rel
; 2= zer  6= (ind,x)  a= abs,y
; 3= abs  7= (ind),y  b= (ind)
mode:
        .BYTE   $40,$02,$45,$03
        .BYTE   $d0,$08,$40,$09
        .BYTE   $30,$22,$45,$33
        .BYTE   $d0,$08,$40,$09
        .BYTE   $40,$02,$45,$33
        .BYTE   $d0,$08,$40,$09
        .BYTE   $40,$02,$45,$b3
        .BYTE   $d0,$08,$40,$09
        .BYTE   $00,$22,$44,$33
        .BYTE   $d0,$8c,$44,$00
        .BYTE   $11,$22,$44,$33
        .BYTE   $d0,$8c,$44,$9a
        .BYTE   $10,$22,$44,$33
        .BYTE   $d0,$08,$40,$09
        .BYTE   $10,$22,$44,$33
        .BYTE   $d0,$08,$40,$09
        .BYTE   $62,$13,$78,$a9
;master modes
;six hi-order bits  mode options
;two lo-order bits  operand length ready.
mode2:
        .BYTE   $00,$21,$81,$82
        .BYTE   $00,$00,$59,$4d
        .BYTE   $91,$92,$86,$4a,$85,$9d
char1:
        .BYTE   $2c,$29,$2c,$23,$28,$24
char2:
        .BYTE   $59,$00,$58,$24,$24,$00
; packed mnemonics
mneml:
        .BYTE   $1c,$8a,$1c,$23
        .BYTE   $5d,$8b,$1b,$a1
        .BYTE   $9d,$8a,$1d,$23
        .BYTE   $9d,$8b,$1d,$a1
        .BYTE   $00,$29,$19,$ae
        .BYTE   $69,$a8,$19,$23
        .BYTE   $24,$53,$1b,$23
        .BYTE   $24,$53,$19,$a1
        .BYTE   $00,$1a,$5b,$5b
        .BYTE   $a5,$69,$24,$24
        .BYTE   $ae,$ae,$a8,$ad
        .BYTE   $29,$00,$7c,$00
        .BYTE   $15,$9c,$6d,$9c
        .BYTE   $a5,$69,$29,$53
        .BYTE   $84,$13,$34,$11
        .BYTE   $a5,$69,$23,$a0

mnemr:
        .BYTE   $d8,$62,$5a,$48
        .BYTE   $26,$62,$94,$88
        .BYTE   $54,$44,$c8,$54
        .BYTE   $68,$44,$e8,$94
        .BYTE   $00,$b4,$08,$84
        .BYTE   $74,$b4,$28,$6e
        .BYTE   $74,$f4,$cc,$4a
        .BYTE   $72,$f2,$a4,$8a
        .BYTE   $00,$aa,$a2,$a2
        .BYTE   $74,$74,$74,$72
        .BYTE   $44,$68,$b2,$32
        .BYTE   $b2,$00,$22,$00
        .BYTE   $1a,$1a,$26,$26
        .BYTE   $72,$72,$88,$c8
        .BYTE   $c4,$ca,$26,$48
        .BYTE   $44,$44,$a2,$c8
