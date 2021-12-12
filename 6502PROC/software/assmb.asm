;*      
;* ASSEMBLER/DISSASSEMBLER
;*
;* Based on original source code by Jim Butterfield 
;* 
;* Mr. Butterfield inspired many of us with his work on the commodore series of computers.
;* May he rest in peace. (1936-2007)
;*


savx	.EQU	$1c
tmpc	.EQU	$1d
length	.EQU	$1f 
wrap	.EQU	$26
aflg	.EQU	$28
acmd	.EQU	$2a
nemo	.EQU	$44
tmp0	.EQU	$c1
tmp2	.EQU	$c3
stage	.EQU	$0210


;__DISASSEMBLE_________________________________________________
;
; Disassemble assembly lines to screen 
; USAGE:
; 
; DISSASSEMBLE XXXX 
;______________________________________________________________
DISASSEMBLE:

	LDA #(INBUFFER & $FF)   	; SETUP WORK BUFFER
	STA WORKPTR			;
	LDA #(INBUFFER >> 8)    	;
	STA WORKPTR +1 			;
                      	
	JSR INCWORKPTR			; JUMP OVER "D"
	JSR INCWORKPTR			; JUMP OVER "I"
	JSR INCWORKPTR			; JUMP OVER "S"
	JSR INCWORKPTR			; JUMP OVER "S"
	JSR INCWORKPTR			; JUMP OVER "A"
	JSR INCWORKPTR			; JUMP OVER "S"
	JSR INCWORKPTR			; JUMP OVER "S"
	JSR INCWORKPTR			; JUMP OVER "E"
	JSR INCWORKPTR			; JUMP OVER "M"
	JSR INCWORKPTR			; JUMP OVER "B"
	JSR INCWORKPTR			; JUMP OVER "L"
	JSR INCWORKPTR			; JUMP OVER "E"

	JSR EATWHITESPACE		; SKIP OVER THE WHITESPACE
	JSR GETNUMBER			; GET THE STARTING ADDRESS
	BCS DISASSEMBLE_ERROR		; IF NOT A NUMBER, REPORT ERROR
        LDA TEMPWORD
        STA tmp0
        LDA TEMPWORD+1
        STA tmp0+1
diss	lda #$0f
        sta TEMPBYTE
dislp   jsr diss1
        jsr pcadj
        sta tmp0
        sty tmp0+1
        dec TEMPBYTE
        bne dislp     
         

	LDA #(DISSASSEMBLE_TEXT& $FF)	; LOAD LOW BYTE OF PROMPT STRING       
	STA STRPTR			; STORE IN POINTER LOW BYTE
	LDA #(DISSASSEMBLE_TEXT >> 8)   ; LOAD HOGH BYTE OF PROMPR STRING
	STA STRPTR +1 			; STORE IN POINTER HIGH BYTE
	JSR OUTSTR			; OUTPUT THE STRING

      	JSR IOF_CONINW	
	cmp #'Y'
	bne dissexit
	jmp diss
dissexit:
        rts         
DISSASSEMBLE_TEXT:
	.db $0d,$0a
	.TEXT "CONTINUE? (Y/N) "
	.db $0d,$0a,$00

DISASSEMBLE_ERROR:
	JMP INVALID_NUMBER_ERROR         
ENTER_BYTE:     
	TAX				; SAVE A REGISTER
	LSR A				; SHIFT HIGH NIBBLE TO LOW NIBBLE
	LSR A				;
	LSR A				;
	LSR A				;
	CLC               		; CLEAR CARRY
	JSR ENTER_DIGIT			; PRINT LOW NIBBLE
	TXA				; RESTORE ACCUMULATOR
	JMP ENTER_DIGIT			; PRINT LOW NIBBLE
ENTER_DIGIT:
	AND #$0F			; STRIP OFF HIGH NIBBLE				
	ORA #$30			; ADD $30 TO PRODUCE ASCII
	CMP #$3A               		; IS GREATER THAN 9
	BMI ENTER_DIGIT_OUT		; NO, SKIP ADD
	CLC				; CLEAR CARRY
	ADC #$07			; ADD ON FOR LETTER VALUES
ENTER_DIGIT_OUT:			;	
	PHA
	JSR IOF_OUTCH            	; PRINT OUT CHAR
	PLA
	STA (WORKPTR)
	JMP INCWORKPTR	
	



;__diss1_______________________________________________________
;
; Disassemble 1 assembly line to screen 
; Parms:
; tmp0 (WORD) Word Pointer to begin disassembly
;______________________________________________________________
diss1    
         JSR crlf
	 lda #'.'
         jsr IOF_OUTCH
         jsr space
diss1a   jsr PRINT_WORD
         jsr space
         ldx #0
         lda (tmp0,x)
         jsr instxx
         pha 
         jsr disvv
         pla 
         jsr propxx
         ldx #$06
pradr1   cpx #$03
         bne pradr3
         ldy length
         beq pradr3
pradr2   lda acmd
         cmp #$e8
         lda (tmp0),y
         bcs reladr
         jsr prbyte
         dey 
         bne pradr2
pradr3   asl acmd
         bcc pradr4
         lda char1-1,x
         jsr chrout
         lda char2-1,x
         beq pradr4
         jsr chrout
pradr4   dex 
         bne pradr1
         rts 
; ** print rel address **
reladr   jsr pcadj3
         tax 
         inx 
         bne prntyx
         iny 
; ** print word address **         
prntyx   tya 
         jsr prbyte
         txa 
; ** print Byte **
prbyte   stx savx
         jsr PRINT_BYTE
         ldx savx
         rts 
; ** advance the program counter **
pcadj    lda length
         sec 
pcadj3   ldy tmp0+1
         tax 
         bpl pcadj4
         dey 
pcadj4   adc tmp0
         bcc rts1
         iny 
rts1     rts 
; ** check inst valid, len **
instxx   tay 
         lsr a
         bcc ieven
         lsr a
         bcs err
         cmp #$22
         beq err
         and #$07
         ora #$80
ieven    lsr a
         tax 
         lda mode,x
         bcs rtmode
         lsr a
         lsr a
         lsr a
         lsr a
rtmode   and #$0f
         bne getfmt
err      ldy #$80
         lda #0
; ** get addr mode, length **
getfmt   tax 
         lda mode2,x
         sta acmd
         and #$03
         sta length
; ** extract intructn **
         tya 
         and #$8f
         tax 
         tya 
         ldy #$03
         cpx #$8a
         beq mnndx3
mnndx1   lsr a
         bcc mnndx3
         lsr a
mnndx2   lsr a
         ora #$20
         dey 
         bne mnndx2
         iny 
mnndx3   dey 
         bne mnndx1
         rts 
; print bytes
disvv    lda (tmp0),y
         jsr prbyte
         ldx #1
disvl    jsr spacd
         cpy length
         iny 
         bcc disvv
         ldx #$03
         cpy #4
         bcc disvl
         rts 
; ** print mnemonic **
propxx   tay 
         lda mneml,y
         sta aflg
         lda mnemr,y
         sta aflg+1
prmn1    lda #0
         ldy #$05
prmn2    asl aflg+1
         rol aflg
         rol a
         dey 
         bne prmn2
         adc #$3f
         jsr IOF_OUTCH
         dex 
         bne prmn1
; ** print space **
space    lda #$20
         bne flip
; ** print cr, maybe lf **
crlf     lda #$0d
         jsr IOF_OUTCH
         lda #$0a
flip     jmp IOF_OUTCH


;__ASSEMBLE____________________________________________________
;
; Assemble line from keyboard to memory 
;______________________________________________________________
ASSEMBLE:
        LDA #(INBUFFER & $FF)   	; SETUP WORK BUFFER
	STA WORKPTR			;
	LDA #(INBUFFER >> 8)    	;
	STA WORKPTR +1 			;
                      	
	JSR INCWORKPTR			; JUMP OVER "A"
	JSR INCWORKPTR			; JUMP OVER "S"
	JSR INCWORKPTR			; JUMP OVER "S"
	JSR INCWORKPTR			; JUMP OVER "E"
	JSR INCWORKPTR			; JUMP OVER "M"
	JSR INCWORKPTR			; JUMP OVER "B"
	JSR INCWORKPTR			; JUMP OVER "L"
	JSR INCWORKPTR			; JUMP OVER "E"

	JSR EATWHITESPACE		; SKIP OVER ANY WHITESPACE
	JSR GETNUMBER			; GET NUMBER
	BCS ASSEMBLE_ERROR		; IF NOT A NUMBER REPORT ERROR 
        jmp asvald
ASSEMBLE_ERROR:
	jmp error
asvald:      
	LDA TEMPWORD
	STA tmp0
	LDA TEMPWORD+1
	STA tmp0+1
asv1:	
	JSR crlf
	lda #'.'
        jsr IOF_OUTCH
        jsr space
        jsr PRINT_WORD
        jsr space
        JSR t2t2
        STX stage+1
 	LDA #(INBUFFER & $FF)   	; SETUP INPUT COMMAND BUFFER
	STA STRPTR			;
	sta WORKPTR			;
	LDA #(INBUFFER >> 8)    	;
	STA STRPTR +1 			;
	STA WORKPTR+1	             	;
	JSR INSTR			; GET A STRING FROM THE CONSOLE	 		
	jsr EATWHITESPACE	
	LDX #$03			; push opcode to stack
	LDY #$00
apush   LDA (WORKPTR),Y			; GET NEXT CHAR FROM BUFFER
	pha
	JSR INCWORKPTR
	dex
	bne apush

        ldx #$03
apull    pla 
         sec 
         sbc #$3f
         ldy #$05
acrun    lsr a
         ror stage+1
         ror stage
         dey 
         bne acrun
         dex 
         bne apull
         ldx #$02
ainp     LDY #$00
	 LDA (WORKPTR),Y		; GET NEXT CHAR FROM BUFFER
  	 JSR INCWORKPTR
         cmp #$00
         beq aret
         cmp #$20
         beq ainp
         jsr ahex
         bcs stone
         
         jsr rdob2
         ldy tmp0
         sty tmp0+1
         sta tmp0
         
         lda #$30
         sta stage,x
         inx 
stone    sta stage,x
         inx 
         bne ainp
aret     stx aflg
         ldx #0
         stx wrap
         beq atry
abump    inc wrap
         beq aerr	 
atry     ldx #0
         stx tmpc
         lda wrap
         jsr instxx
         ldx acmd
         stx aflg+1
         tax          
         ldy mneml,x
         lda mnemr,x
         jsr achek2
         bne abump
         ldx #$06
aoprnd   cpx #$03
         bne ashf
         ldy length
         beq ashf
arsc     lda acmd
         cmp #$e8
         lda #$30
         bcs arel1
         jsr acheck
         bne abump
         jsr achick
         bne abump
         dey 
         bne arsc
ashf     asl acmd
         bcc adex
         ldy char2-1,x
         lda char1-1,x
         jsr achek2
         bne abump
adex     dex 
         bne aoprnd
         beq ald
arel1    jsr acdb1
         bne abump
         jsr acdb1
         bne abump
ald      lda aflg
         cmp tmpc
         bne abump
         jsr t2t2
         ldy length
         beq aopset
         lda aflg+1
         cmp #$9d
         bne aopnd
         jsr diffb
         bcc abdown
         tya 
         bne aerr
         lda nemo
         bpl abran
aerr     jmp error
abdown   iny 
         bne aerr
         lda nemo
         bpl aerr
abran    ldy length
         bne abrel
aopnd    lda tmp2-1,y
abrel    sta (tmp0),y
         dey 
         bne aopnd
aopset   lda wrap
         sta (tmp0),y
         jsr pcadj
         sta tmp0
         sty tmp0+1
         jmp asv1
acdb1    tay 
achek2   jsr acheck
         bne acex
         tya 
acheck   beq acex
achick   stx savx
         ldx tmpc
         cmp stage,x
         php 
         inx
         stx tmpc
         ldx savx
         plp 
acex     rts 
ahex     cmp #$30
         bcc asx
         cmp #$47
         rts 
asx      sec 
         rts 
	
	
	
                         ; ** swap tmp0, tmp2 **
t2t2     ldx #$02
t2t21    lda tmp0-1,x
         pha
         lda tmp2-1,x
         sta tmp0-1,x
         pla
         sta tmp2-1,x
         dex
         bne t2t21
         rts
        
PRINT_WORD:
	pha
	lda tmp0+1
	jsr prbyte
	lda tmp0
	jsr prbyte
	pla
	rts       
                          ; ** calc tmp2-tmp0-2 **
diffb    lda tmp2
         ldy tmp2+1
         sec
         sbc #2
         bcs deck
         dey
         bcc deck
                          ; ** calc aflg-tmp0 **
diffa    lda aflg
         ldy aflg+1
         jmp deck
                          ; ** calc tmp2-tmp0 **
diffp    lda tmp2
         ldy tmp2+1
deck     sec 
         sbc tmp0
         sta nemo
         tya
         sbc tmp0+1
         tay
         ora nemo
         rts

error
         lda #$3f
         jsr IOF_OUTCH
         rts
                       ; ** print spaces **
spacd    jsr space
         dex
         bne spacd
         rts
chrout   cmp aflg
         beq caltrit
         jsr IOF_OUTCH
caltrit  rts  

altrit   tya 
         pha
         jsr crlf
         pla
         jsr IOF_OUTCH
         lda #$2e
         jmp IOF_OUTCH

                          ; ** print hex byte **
wroa     lda tmp0+1
         jsr PRINT_BYTE
         lda tmp0
         jmp PRINT_BYTE

                         ; ** read hex byte **
rdob2    jsr hexit
         asl a
         asl a
         asl a
         asl a
         sta acmd
         LDA (WORKPTR),Y			; GET NEXT CHAR FROM BUFFER
  	 JSR INCWORKPTR
rdob3    jsr hexit
         ora acmd
         sec
         rts
                          ; ** convert from hex **
hexit    cmp #$3a
         bcc hex08
         adc #$08
hex08    and #$0f
         rts


                          ; mode table... nybble organized
                          ; 0= err  4= implied  8= zer,x   c= zer,y
                          ; 1= imm  5= acc      9= abs,x   d= rel
                          ; 2= zer  6= (ind,x)  a= abs,y
                          ; 3= abs  7= (ind),y  b= (ind)
mode     .db $40,$02,$45,$03
         .db $d0,$08,$40,$09
         .db $30,$22,$45,$33
         .db $d0,$08,$40,$09
         .db $40,$02,$45,$33
         .db $d0,$08,$40,$09
         .db $40,$02,$45,$b3
         .db $d0,$08,$40,$09
         .db $00,$22,$44,$33
         .db $d0,$8c,$44,$00
         .db $11,$22,$44,$33
         .db $d0,$8c,$44,$9a
         .db $10,$22,$44,$33
         .db $d0,$08,$40,$09
         .db $10,$22,$44,$33
         .db $d0,$08,$40,$09
         .db $62,$13,$78,$a9
                          ;master modes
                          ;six hi-order bits  mode options
                          ;two lo-order bits  operand length ready.
mode2    .db $00,$21,$81,$82
         .db $00,$00,$59,$4d
         .db $91,$92,$86,$4a,$85,$9d
char1    .db $2c,$29,$2c,$23,$28,$24
char2    .db $59,$00,$58,$24,$24,$00
                          ; packed mnemonics
mneml    .db $1c,$8a,$1c,$23
         .db $5d,$8b,$1b,$a1
         .db $9d,$8a,$1d,$23
         .db $9d,$8b,$1d,$a1
         .db $00,$29,$19,$ae
         .db $69,$a8,$19,$23
         .db $24,$53,$1b,$23
         .db $24,$53,$19,$a1
         .db $00,$1a,$5b,$5b
         .db $a5,$69,$24,$24
         .db $ae,$ae,$a8,$ad
         .db $29,$00,$7c,$00
         .db $15,$9c,$6d,$9c
         .db $a5,$69,$29,$53
         .db $84,$13,$34,$11
         .db $a5,$69,$23,$a0

mnemr    .db $d8,$62,$5a,$48
         .db $26,$62,$94,$88
         .db $54,$44,$c8,$54
         .db $68,$44,$e8,$94
         .db $00,$b4,$08,$84
         .db $74,$b4,$28,$6e
         .db $74,$f4,$cc,$4a
         .db $72,$f2,$a4,$8a
         .db $00,$aa,$a2,$a2
         .db $74,$74,$74,$72
         .db $44,$68,$b2,$32
         .db $b2,$00,$22,$00
         .db $1a,$1a,$26,$26
         .db $72,$72,$88,$c8
         .db $c4,$ca,$26,$48
         .db $44,$44,$a2,$c8

 .END
 