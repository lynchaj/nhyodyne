
;__MONITOR_______________________________________________________
; This is a simple monitor program.
;
; It is used in:
;
;
; * lowmon - monitor program loaded in low memory for debugging
; * monitor - monitor program used to boot the 6502 board from a Z80 master
; * rom  - rom code for stand alone 6502 BIOS
;
;__PRINT_REG____________________________________________________
;
; PRINT OUT REGISTERS ON THE DISPLAY
;
;_______________________________________________________________
PRINT_REG:
        LDA     #<REGDATA       ; OUTPUT HEADER STRING
        STA     STRPTR          ;
        LDA     #>REGDATA       ;
        STA     STRPTR+1        ;
        JSR     OUTSTR          ;
        LDA     PC+1            ; OUTPUT PROGRAM COUNTER HIGH BYTE
        JSR     PRINT_BYTE      ;
        LDA     PC              ; OUTPUT PROGRAM COUNTER LOW BYTE
        JSR     PRINT_BYTE      ;
        LDA     #$20            ; OUTPUT SPACE
        JSR     OUTCH           ;
        LDA     ACC             ; OUTPUT ACCUMULATOR
        JSR     PRINT_BYTE      ;
        LDA     #$20            ; OUTPUT 2 SPACES
        JSR     OUTCH           ;
        LDA     #$20            ;
        JSR     OUTCH           ;
        LDA     XREG            ; OUTPUT X REGISTER
        JSR     PRINT_BYTE      ;
        LDA     #$20            ; OUTPUT 2 SPACES
        JSR     OUTCH           ;
        LDA     #$20            ;
        JSR     OUTCH           ;
        LDA     YREG            ; OUTPUT Y REGISTER
        JSR     PRINT_BYTE      ;
        LDA     #$20            ; OUTPUT 2 SPACES
        JSR     OUTCH           ;
        LDA     #$20            ;
        JSR     OUTCH           ;
        LDA     SPTR            ; OUTPUT STACK POINTER
        JSR     PRINT_BYTE      ;
        LDA     #$20            ; OUTPUT 2 SPACES
        JSR     OUTCH           ;
        LDA     #$20            ;
        JSR     OUTCH           ;
        LDA     PREG            ; OUTPUT STATUS REGISTER
        JSR     PRINT_BYTE      ; OUTPUT IN HEX
        LDA     #$2D            ; OUTPUT '-'
        JSR     OUTCH           ;
        LDA     PREG            ; OUTPUT STATUS REGISTER
        JSR     PRINT_BIN_BYTE  ; OUTPUT IN BINARY
        LDA     #$0D            ; PRINT NEW LINE
        JMP     OUTCH           ;

;__COMMAND_PROCESSOR____________________________________________
;
; PROMPT FOR, INPUT, AND PROCESS INCOMMING USER COMMANDS
;
;_______________________________________________________________
COMMAND_PROCESSOR:

        JSR     DISPLAY_PROMPT  ; PRINT PROMPT STRING
        LDA     #<INBUFFER      ; SETUP INPUT COMMAND BUFFER
        STA     STRPTR          ;
        LDA     #>INBUFFER      ;
        STA     STRPTR +1       ;

        JSR     INSTR           ; GET A STRING FROM THE CONSOLE

        LDA     #$0D            ;
        JSR     OUTCH           ;
        LDA     #$0A            ;
        JSR     OUTCH           ;


        LDY     #$00            ; SET INDEX = 0

        LDA     #<COMMAND_LOOKUP_TABLE; SETUP INPUT COMMAND POINTER
        STA     WORKPTR         ;
        LDA     #>COMMAND_LOOKUP_TABLE;
        STA     WORKPTR +1      ;
        LDA     INBUFFER,Y      ; MOVE FIRST BYTE OF COMMAND BUFFER TO ACC
        CMP     #$00            ; IS NULL?
        BEQ     COMMAND_PROCESSOR; YES, GET NEXT COMMAND

COMMAND_PROCESSOR_CMP:
        LDX     #$00            ; X=0
        LDA     INBUFFER,Y      ; ACC= NEXT BYTE OF INPUT BUFFER
        CMP     (WORKPTR,X)     ; DOES NEXT BYTE OF INPUT BUFFER MATCH NEXT BYTE OF LOOKUP TABLE
        BNE     CMD_PROCESOR_NEXT_CMD; NO, GO TO NEXT COMMAND IN LOOKUP TABLE
        INY                     ; YES, Y=Y+1
        LDA     INBUFFER,Y      ; LOAD NEXT BYTE OF INPUT BUFFER
        CMP     #$20            ; IS IT A SPACE (SINGALING END OF COMMAND)
        BEQ     CMD_PROCESSOR_MATCH_FOUND; YES, POSSIBLE MATCH FOUND
        CMP     #$00            ; IS IT A NULL (SINGALING END OF COMMAND)
        BEQ     CMD_PROCESSOR_MATCH_FOUND; YES, POSSIBLE MATCH FOUND
        JSR     INCWORKPTR      ; NO, INCREMENT POINTER TO LOOKUP TABLE
        LDX     #$00            ;
        LDA     (WORKPTR,X)     ; A= NEXT BYTE OF LOOKUP TABLE
        CMP     #$00            ; IS IT A NULL? (SIGNALING END OF TABLE ENTRY)
        BEQ     CMD_PROCESOR_NEXT_CMD1; YES, ADVANCE TO NEXT COMMAND IN TABLE
        JMP     COMMAND_PROCESSOR_CMP; LOOP TO CHECK NEXT CHAR

CMD_PROCESOR_NEXT_CMD:
        JSR     INCWORKPTR      ; INCREMENT POINTER TO LOOKUP TABLE
        LDX     #$00            ;
        LDA     (WORKPTR,X)     ; A = NEXT BYTE OF LOOKUP TABLE
        CMP     #$00            ; IS IT A NULL?
        BNE     CMD_PROCESOR_NEXT_CMD; NO, LOOP

CMD_PROCESOR_NEXT_CMD1:
        LDA     #3
        JSR     INCWORKPTRX     ; INCREMENT POINTER TO LOOKUP TABLE
        LDX     #$00            ;
        LDA     (WORKPTR,X)     ; A = NEXT BYTE OF LOOKUP TABLE
        CMP     #$01            ; IS IT $01 (SINGALING END OF LOOKUP TABLE)
        BEQ     CMD_PROCESOR_NOT_FOUND; YES, DISPLAY NOT FOUND MESSAGE
        LDY     #$00            ; NO RESET INPUT BUFFER COUNTER
        JMP     COMMAND_PROCESSOR_CMP; LOOP

CMD_PROCESSOR_MATCH_FOUND:
        JSR     INCWORKPTR      ; INCREMENT POINTER TO LOOKUP TABLE
        LDX     #$00            ;
        LDA     (WORKPTR,X)     ; A = NEXT BYTE OF LOOKUP TABLE
        CMP     #$00            ; IS IT A NULL?
        BNE     CMD_PROCESOR_NEXT_CMD; NO, TRY NEXT COMMAND
        JSR     INCWORKPTR      ; YES, INCREMENT POINTER TO LOOKUP TABLE
        LDX     #$00            ;
        LDA     (WORKPTR,X)     ; A = NEXT BYTE OF LOOKUP TABLE
        STA     JUMPPTR         ; STORE A INTO LOW BYTE OF JUMP VECTOR
        JSR     INCWORKPTR      ; INCREMENT POINTER TO LOOKUP TABLE
        LDX     #$00            ;
        LDA     (WORKPTR,X)     ; A = NEXT BYTE OF LOOKUP TABLE
        STA     JUMPPTR+1       ; INCREMENT POINTER TO LOOKUP TABLE
        JSR     CMD_PROCESOR_RUN; RUN COMMAND
        JMP     COMMAND_PROCESSOR; GET NEXT COMMAND

CMD_PROCESOR_NOT_FOUND:
        LDA     #<ERROR         ; LOAD LOW BYTE OF ERROR STRING
        STA     STRPTR          ; STORE IN POINTER LOW BYTE
        LDA     #>ERROR         ; LOAD HIGH BYTE OF ERROR STRING
        STA     STRPTR +1       ; STORE IN POINTER HIGH BYTE

        JSR     OUTSTR          ; OUTPUT THE STRING
        JMP     COMMAND_PROCESSOR;
CMD_PROCESOR_RUN:
        JMP     (JUMPPTR)       ; JUMP TO COMMAND VECTOR

EXIT_MONITOR:
        JMP     ($FFFC)         ;


;__BOOT_________________________________________________________
;
; BOOT OS
;
; BOOT X
;_______________________________________________________________
;IOF_BOOT:
;
;        LDA     #<INBUFFER      ; SETUP WORK BUFFER
;        STA     WORKPTR         ;
;        LDA     #>INBUFFER      ;
;        STA     WORKPTR +1      ;

;        LDA     #4
;        JSR     INCWORKPTRX     ; JUMP OVER "BOOT"
;
;        JSR     EATWHITESPACE   ; SKIP OVER THE WHITESPACE
;        JSR     HEXIN           ;
;        BCS     BOOT_ERROR

;        CMP     #$01            ;
;        BEQ     BOOTFDD
;
;        CMP     #$04            ;
;        BEQ     BOOTHDD

;        JSR     P_PPP_SOFT_RESET;
;        LDA     #$00
;        STA     DSKUNIT
;        STA     debcyll         ;
;        STA     debcylm         ;
;        STA     debsehd         ;
;        JSR     P_PPP_READ_SECTOR;
;        JMP     hstbuf          ;
;
;BOOTHDD:
;
;        JSR     P_PPP_INITIALIZE;
;        LDA     #$00
;        STA     DSKUNIT
;        STA     debcyll         ;
;        STA     debcylm         ;
;        STA     debsehd         ;
;        JSR     P_IDE_READ_SECTOR;
;        JMP     hstbuf          ;
;BOOTFDD:
;
;        LDA     #$01            ;
;        STA     sekdsk          ;
;        JSR     P_SETUPDRIVE    ;
;        LDA     #$00
;        STA     DSKUNIT
;        STA     debcyll         ;
;        STA     debcylm         ;
;        STA     debsehd         ;
;        JSR     P_READFL        ;
;        JMP     hstbuf          ;

;BOOT_ERROR:
;        JMP     INVALID_NUMBER_ERROR

;__GO______________________________________________________
;
; GO COMMAND
;
; GO XXXX
;_______________________________________________________________
GO:

        LDA     #<INBUFFER      ; SETUP WORK BUFFER
        STA     WORKPTR         ;
        LDA     #>INBUFFER      ;
        STA     WORKPTR +1      ;

        LDA     #2
        JSR     INCWORKPTRX     ; JUMP OVER "GO"

        JSR     EATWHITESPACE   ; SKIP OVER THE WHITESPACE
        JSR     GETNUMBER       ; GET THE STARTING ADDRESS
        BCS     DUMP_ERROR      ; IF NOT A NUMBER, REPORT ERROR

        JMP     (TEMPWORD)      ;




;__DUMPMEM______________________________________________________
;
; DUMP MEMORY COMMAND
;
; DUMP XXXX (XXXX)
;_______________________________________________________________
DUMP:

        LDA     #<INBUFFER      ; SETUP WORK BUFFER
        STA     WORKPTR         ;
        LDA     #>INBUFFER      ;
        STA     WORKPTR +1      ;

        LDA     #4
        JSR     INCWORKPTRX     ; JUMP OVER "DUMP"

        JSR     EATWHITESPACE   ; SKIP OVER THE WHITESPACE
        JSR     GETNUMBER       ; GET THE STARTING ADDRESS
        BCS     DUMP_ERROR      ; IF NOT A NUMBER, REPORT ERROR

        LDA     TEMPWORD        ; STORE STARTING ADDRESS IN WORD POINTER (TEMPWORD1)
        STA     TEMPWORD1       ;
        LDA     TEMPWORD+1      ;
        STA     TEMPWORD1+1     ;

        JSR     EATWHITESPACE   ; SKIP OVER ANY WHITESPACE
        JSR     GETNUMBER       ; GET THE ENDING ADDRESS
        BCS     DUMP_ERROR      ; IF NOT A NUMBER, REPORT ERROR

        LDA     TEMPWORD1       ; STORE ENDING ADDRESS IN WORD POINTER (WORKPTR)
        STA     WORKPTR         ;
        LDA     TEMPWORD1+1     ;
        STA     WORKPTR+1       ;
DUMP_LOOP:
        JSR     PRINT_MEM_LINE  ;
        LDA     #$0D            ;
        JSR     OUTCH           ;
        LDA     #$0A            ;
        JSR     OUTCH           ;
        LDA     WORKPTR+1       ; COMPARE HIGH BYTES
        CMP     TEMPWORD+1
        BCC     DUMP_LOOP       ; IF NUM1H < NUM2H THEN NUM1 < NUM2
        BNE     DUMP_DONE       ; IF NUM1H <> NUM2H THEN NUM1 > NUM2 (SO NUM1 >= NUM2)
        LDA     WORKPTR         ; COMPARE LOW BYTES
        CMP     TEMPWORD
        BCC     DUMP_LOOP       ; IF NUM1L < NUM2L THEN NUM1 < NUM2
DUMP_DONE:
        RTS
DUMP_ERROR:
        JMP     INVALID_NUMBER_ERROR



;__ENTERMEM_____________________________________________________
;
; ENTER MEMORY COMMAND
;
; ENTER XXXX (XX XX XX XX XX XX XX XX XX XX XX XX XX XX )
;_______________________________________________________________
ENTERMEM:

        LDA     #<INBUFFER      ; SETUP WORK BUFFER
        STA     WORKPTR         ;
        LDA     #>INBUFFER      ;
        STA     WORKPTR +1      ;

        LDA     #5
        JSR     INCWORKPTRX     ; JUMP OVER "ENTER"

        JSR     EATWHITESPACE   ; SKIP OVER ANY WHITESPACE
        JSR     GETNUMBER       ; GET NUMBER
        BCS     ENTER_ERROR     ; IF NOT A NUMBER REPORT ERROR

        LDA     TEMPWORD        ; STORE ADDRESS INTO WORD POINTER (TEMPWORD1)
        STA     TEMPWORD1       ;
        LDA     TEMPWORD+1      ;
        STA     TEMPWORD1+1     ;
        LDY     #$00            ; RESET COUNTER TO 0
ENTERLOOP:
        LDX     #$00            ;
        LDA     (WORKPTR,X)     ; GET NEXT BYTE FROM BUFFER
        CMP     #$00            ; IS NULL?
        BEQ     ENTER_DONE      ; YES, WE'RE DONE
        JSR     EATWHITESPACE   ; SKIP OVER ANY WHITESPACE
        JSR     GETNUMBER       ; GET NEXT NUMBER
        BCS     ENTER_ERROR     ; IF NOT A NUMBER REPORT ERROR
        LDA     TEMPWORD        ; STORE BYTE IN ADDRESS (INDEXED BY Y)
        STA     (TEMPWORD1),Y   ;
        INY                     ; GO TO NEXT BYTE
        JMP     ENTERLOOP       ; LOOP
ENTER_DONE:
        CPY     #$00            ; WAS LINE BLANK?
        BNE     ENTER_CONTINUE  ; NO, PREPARE FOR NEXT LINE
        RTS                     ; YES, END DATA ENTRY
ENTER_CONTINUE:
        LDA     #$0D            ;
        JSR     OUTCH           ;
        LDA     #$0A            ;
        JSR     OUTCH
        LDA     #$3A            ; OUTPUT ":" TO SCREEN
        JSR     OUTCH           ;
        CLC                     ; CLEAR CARRY
        TYA                     ; A=Y (LAST COUNTER)
        ADC     TEMPWORD1       ; ADD LAST COUNT TO BEGINNING POINTER
        STA     TEMPWORD1       ; STORE RESULT IN BEGINNING POINTER
        BNE     ENTER_INCREMENT ; NOT ZERO?, DONE
        INC     TEMPWORD1+1     ; ZERO, INC HIGH BYTE
ENTER_INCREMENT:
        LDA     TEMPWORD1+1     ; PRINTOUT STARTING ADDRESS TO SCREEN
        JSR     PRINT_BYTE      ; (HIGH)
        LDA     TEMPWORD1       ;
        JSR     PRINT_BYTE      ; (LOW)
        LDA     #$20            ; OUTPUT SPACE TO SCREEN
        JSR     OUTCH           ;
        LDA     #<INBUFFER      ; SETUP INPUT COMMAND BUFFER
        STA     STRPTR          ;
        LDA     #>INBUFFER      ;
        STA     STRPTR +1       ;
        JSR     INSTR           ; GET A STRING FROM THE CONSOLE
        LDA     #<INBUFFER      ; SETUP WORK BUFFER
        STA     WORKPTR         ;
        LDA     #>INBUFFER      ;
        STA     WORKPTR +1      ;
        LDY     #$00            ;
        JMP     ENTERLOOP       ; LOOP


ENTER_ERROR:
        JMP     INVALID_NUMBER_ERROR

;__PRINT_MEM_LINE_______________________________________________
;
; PRINT MEMORY DUMP LINE
;
; PRINT 16 HEX LOCATIONS STARTING WITH ADDRESS WORKPTR
;_______________________________________________________________
PRINT_MEM_LINE:
        LDA     #$3A            ; LOAD ':' INTO ACC
        JSR     OUTCH           ; PRINT ':'
        LDA     WORKPTR+1       ; PRINT ADDRESS
        JSR     PRINT_BYTE      ;
        LDA     WORKPTR         ;
        JSR     PRINT_BYTE      ;
        LDA     #$2D            ; LOAD '-'
        JSR     OUTCH           ; PRINT '-'
        LDY     #$00            ;
PRINT_MEM_LINE_LOOP:
        LDA     (WORKPTR),Y     ; LOAD NEXT BYTE
        JSR     PRINT_BYTE      ; PRINT BYTE
        LDA     #$20            ; LOAD ' '
        JSR     OUTCH           ; PRINT ' '
        INY                     ; INCREMENT COUNTER
        CPY     #$10            ; HAVE WE PRINTED 16 ADDRESSES
        BNE     PRINT_MEM_LINE_LOOP; NO, LOOP
        LDA     #$3A            ; LOAD ':' INTO ACC
        JSR     OUTCH           ; PRINT ':'
        LDX     #$00            ;
        LDY     #$00            ;
PRINT_MEM_LINE_LOOP_ASCII:
        LDA     (WORKPTR,X)     ; GET NEXT BYTE
        JSR     OUTASCII        ; PRINT ASCII VALUE OF BYTE
        INY                     ; INCREMENT COUNTER
        JSR     INCWORKPTR      ; INCREMENT BUFFER POINTER
        CPY     #$10            ; HAVE WE PRINTED 16 ADDRESSES
        BNE     PRINT_MEM_LINE_LOOP_ASCII; NO, LOOP
        LDA     #$0D            ; YES, PRINT CR
        JSR     OUTCH           ;
        RTS                     ; RETURN



;__DISPLAY_PROMPT______________________________________________
;
; DISPLAY THE INPUT PROMPT ON THE SCREEN
;
;______________________________________________________________
DISPLAY_PROMPT:
        LDA     #<PROMPT        ; LOAD LOW BYTE OF PROMPT STRING
        STA     STRPTR          ; STORE IN POINTER LOW BYTE
        LDA     #>PROMPT        ; LOAD HOGH BYTE OF PROMPR STRING
        STA     STRPTR +1       ; STORE IN POINTER HIGH BYTE

        JMP     OUTSTR          ; OUTPUT THE STRING


;__INCWORKPTR___________________________________________________
; INCREMENT THE 16BIT WORK POINTER
;
;
;
;_______________________________________________________________
INCWORKPTR:
        INC     WORKPTR         ; INCREMENT LOWBYTE
        BNE     :+              ; NOT ZERO?, DONE
        INC     WORKPTR+1       ; ZERO, INC HIGH BYTE
:
        RTS                     ; RETURN


;__INCWORKPTRX__________________________________________________
; INCREMENT THE 16BIT WORK POINTER X TIMES
;   A= NUMBER OF TIMES TO INCREMENT
;_______________________________________________________________
INCWORKPTRX:
        CLC
        ADC     WORKPTR         ; INCREMENT LOWBYTE
        BCC     :+              ; NO CARRY?
        INC     WORKPTR+1       ; CARRY, INC HIGH BYTE
:
        STA     WORKPTR         ; STORE
        RTS                     ; RETURN





;__INCTEMPWORD__________________________________________________
;
; INCREMENT THE 16BIT WORK POINTER
;
;_______________________________________________________________
INCTEMPWORD:
        INC     TEMPWORD1       ; INCREMENT LOWBYTE
        BNE     :+              ; NOT ZERO?, DONE
        INC     TEMPWORD1+1     ; ZERO, INC HIGH BYTE
:
        RTS                     ; RETURN

;__INCTEMPWORD2__________________________________________________
;
; INCREMENT THE 16BIT WORK POINTER
;
;
;_______________________________________________________________
INCTEMPWORD2:
        INC     TEMPWORD2       ; INCREMENT LOWBYTE
        BNE     :+              ; NOT ZERO?, DONE
        INC     TEMPWORD2+1     ; ZERO, INC HIGH BYTE
:
        RTS                     ; RETURN

;__OUTASCII_____________________________________________________
;
; PRINT CHAR IF VALID, ELSE PRINT '.'
;
;_______________________________________________________________
OUTASCII:
        CMP     #$20            ; IS < 20
        BCC     :+              ; YES, SKIP
        CMP     #$80
        BCS     :+
        JMP     OUTCH           ; NO, PRINT CHAR AND RETURN
:
        LDA     #$2E            ; A= '.'
        JMP     OUTCH           ; PRINT '.' AND RETURN

;__INVALID_NUMBER_ERROR__________________________________________
;
; PRINT "INVALID HEX NUMBER MESSAGE"
;
;_______________________________________________________________
INVALID_NUMBER_ERROR:
        LDA     #<INERROR       ; LOAD LOW BYTE OF ERROR STRING
        STA     STRPTR          ; STORE IN POINTER LOW BYTE
        LDA     #>INERROR       ; LOAD HOGH BYTE OF ERROR STRING
        STA     STRPTR +1       ; STORE IN POINTER HIGH BYTE
        JMP     OUTSTR          ; OUTPUT THE STRING


;__GETNUMBER______________________________________________________
;
; GET ASCII NUMBER FROM BUFFER AND PARSE INTO TEMPWORD
;
;_______________________________________________________________
GETNUMBER:
        LDA     #$00            ;
        STA     TEMPWORD        ; CLEAR OUT TEMPWORD (OUTPUT OF GETNUMBER)
        STA     TEMPWORD+1      ;
        LDX     #$00            ;
GETNUMBER_LOOP:
        LDA     (WORKPTR,X)     ; GET NEXT BYTE FROM BUFFER
        CMP     #$20            ; IS SPACE?
        BEQ     GETNUMBER_DONE  ; YES, WE'RE DONE
        CMP     #$00            ; IS NULL?
        BEQ     GETNUMBER_DONE  ; YES, WE'RE DONE
        CMP     #$2C            ; IS ","?
        BEQ     GETNUMBER_DONE  ; YES, WE'RE DONE
        CMP     #$29            ; IS ")"?
        BEQ     GETNUMBER_DONE  ; YES, WE'RE DONE
        JSR     HEXIN           ; GET HEX DIGIT
        BCS     GETNUMBER_ERROR ; IS INVALID DIGIT?, YES PRINT ERROR AND ABORT
        CLC                     ; CLEAR CARRY
        ROL     TEMPWORD        ; MOVE WORD OVER 4 BITS TO LEFT
        ROL     TEMPWORD+1      ;
        CLC                     ;
        ROL     TEMPWORD        ;
        ROL     TEMPWORD+1      ;
        CLC                     ;
        ROL     TEMPWORD        ;
        ROL     TEMPWORD+1      ;
        CLC                     ;
        ROL     TEMPWORD        ;
        ROL     TEMPWORD+1      ;
        ORA     TEMPWORD        ; ADD IN NEW DIGIT
        STA     TEMPWORD        ; STORE BACK TO TEMPWORD
        JSR     INCWORKPTR      ; INCREMENT BUFFER POINTER
        JMP     GETNUMBER_LOOP  ; LOOP
GETNUMBER_ERROR:
        SEC                     ; SET ERROR FLAG (CARRY)
        RTS                     ; RETURN
GETNUMBER_DONE:
        CLC                     ; CLEAR ERROR FLAG (CARRY)
        RTS                     ; RETURN

;__HEXIN________________________________________________________
;
; GET NEXT CHAR FROM INPUT BUFFER AND CHANGE TO HEX DIGIT
;
; IF INVALID, SET CARRY FLAG
;_______________________________________________________________
HEXIN:
        LDX     #$00            ;
        LDA     (WORKPTR,X)     ; GET NEXT CHAR FROM BUFFER
        CMP     #$3A            ; LESS THAN 9?
        BCS     HEXIN_BIG       ; NO, SKIP NEXT
        SBC     #$2F            ; CONVERT 0-9
HEXIN_BIG:
        CMP     #$41            ; A OR MORE?
        BCC     HEXIN_SMALL     ; NO, SKIP NEXT
        SBC     #$37            ; CONVERT A-F
HEXIN_SMALL:
        CMP     #$10            ; RESULT TOO BIG?
        RTS


;__EATWHITESPACE___________________________________________________
;
; FORWARD THE BUFFER POINTER PAST ANY WHITE SPACE IN THE INPUT BUFFER
;
;_______________________________________________________________
EATWHITESPACE:
        LDX     #$00            ;
        LDA     (WORKPTR,X)     ; GET NEXT CHAR FROM BUFFER
        CMP     #$20            ; IS SPACE
        BEQ     :+              ; YES
        RTS                     ; RETURN
:
        JSR     INCWORKPTR      ; YES, INCREMENT BUFFER POINTER
        JMP     EATWHITESPACE   ; LOOP



;__PRINT_BYTE__________________________________________________
;
; PRINT OUT ACCUMULATOR AS HEX NUMBER
;
;______________________________________________________________
PRINT_BYTE:
        TAX                     ; SAVE A REGISTER
        LSR     A               ; SHIFT HIGH NIBBLE TO LOW NIBBLE
        LSR     A               ;
        LSR     A               ;
        LSR     A               ;
        CLC                     ; CLEAR CARRY
        JSR     PRINT_DIGIT     ; PRINT LOW NIBBLE
        TXA                     ; RESTORE ACCUMULATOR
        JMP     PRINT_DIGIT     ; PRINT LOW NIBBLE

;__PRINT_DIGIT_________________________________________________
;
; PRINT OUT LOW NIBBLE OF ACCUMULATOR IN HEX
;
;______________________________________________________________
PRINT_DIGIT:
        AND     #$0F            ; STRIP OFF HIGH NIBBLE
        ORA     #$30            ; ADD $30 TO PRODUCE ASCII
        CMP     #$3A            ; IS GREATER THAN 9
        BMI     PRINT_DIGIT_OUT ; NO, SKIP ADD
        CLC                     ; CLEAR CARRY
        ADC     #$07            ; ADD ON FOR LETTER VALUES
PRINT_DIGIT_OUT:                ;
        JMP     OUTCH           ; PRINT OUT CHAR


;__PRINT_BIN_BYTE______________________________________________
;
; PRINT OUT BYTE IN BINARY
;
;______________________________________________________________
PRINT_BIN_BYTE:
        PHA
        TXA
        PHA
        LDX     #$08
:
        ASL     A               ; ROTATE BIT INTO CARRY FLAG
        BCC     :+              ;  IS ZERO?
        PHA                     ; PUSH ACC TO STACK
        LDA     #$31            ; LOAD '1'
        JSR     OUTCH           ; OUTPUT CHAR TO SCREEN
        PLA                     ; PULL ACC FROM STACK
        JMP     :++             ;  JUMP TO NEXT BIT
:
;  YES, PRINT A '0'
        PHA                     ; PUSH ACC TO STACK
        LDA     #$30            ; LOAD '0'
        JSR     OUTCH           ; OUTPUT CHAR TO SCREEN
        PLA                     ; PULL ACC FROM STACK
:
        DEX
        CPX     #$00
        BNE     :---
        PLA
        TAX
        PLA
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

;__INSTR_______________________________________________________
;
; INPUT STRING FROM KEYBOARD INTO KEYBOARD BUFFER
;
;______________________________________________________________
INSTR:
        LDY     #$00            ; LOAD $00 INTO Y
INSTRLP:
        JSR     IOF_CONINW
        CMP     #$60            ; IS LOWER CASE
        BCC     INSTRUC         ; NO, SKIP
        AND     #$DF            ; TO UPPER CASE
INSTRUC:
        CMP     #$0D            ; IS CR?
        BEQ     ENDINSTR        ; YES, DONE WITH INPUT
        CMP     #$08            ; IS BACKSPACE?
        BNE     INSTR_NOTBS     ; NO, SKUP BACKSPACE RTN
        CPY     #$00            ; IS INDEX =0 ?
        BEQ     INSTR_EMPTY_BS  ; YES, SKIP BACKSPACE
        JSR     OUTCH           ; OUTPUT CHAR TO SCREEN
        DEY                     ; Y=Y-1
        LDA     #$00            ;
        STA     (STRPTR),Y      ; NULL TERMINATE INPUT BUFFER
        DEY                     ; Y=Y-1
        JMP     INSTR_SKIP_STORE; SKIP STORE OF CHAR TO INPUT BUFFER
INSTR_NOTBS:
        STA     (STRPTR),Y      ; STORE CHAR IN KEYBAORD BUFFER
        JSR     OUTCH           ; OUTPUT CHAR TO SCREEN
INSTR_SKIP_STORE:
        INY                     ; Y=Y+1
        CPY     #$FF            ; DOES Y=$FF
        BNE     INSTRLP         ; NO, LOOP FOR NEXT CHAR
ENDINSTR:
        LDA     #$00            ; A=0
        STA     (STRPTR),Y      ; NULL TERMINATE INPUT BUFFER
        RTS
INSTR_EMPTY_BS:
        LDA     #$00            ; BLANK OUT KEYBOARD CHAR, TO SIGNAL READY FOR NEXT CHAR
        JMP     INSTRLP         ; JUMP TO INPUT LOOP


;__LOAD_________________________________________________________

; LOAD A MOTOROLA FORMATTED HEX FILE
;
;_______________________________________________________________
LOAD:
        JSR     IOF_CONINW      ;
        CMP     #'S'            ;
        BNE     LOAD            ; FIRST CHAR NOT (S)
        JSR     IOF_CONINW      ; READ CHAR
        CMP     #'9'            ;
        BEQ     LOAD21          ;
        CMP     #'1'            ;
        BNE     LOAD            ; SECOND CHAR NOT (1)
        LDA     #$00            ;
        STA     CKSM            ; ZERO CHECKSUM
        JSR     GETBYTE         ; READ BYTE
        SBC     #$01            ;
        STA     BYTECT          ; BYTE COUNT
        JSR     BADDR           ; BUILD ADDRESS
        LDY     #$00            ;
LOAD11:
        JSR     GETBYTE         ;
        DEC     BYTECT          ;
        BEQ     LOAD15          ; ZERO BYTE COUNT
        STA     (TEMPWORD1),Y   ; STORE DATA
        JSR     INCTEMPWORD     ;
        JMP     LOAD11          ;

LOAD15:
        INC     CKSM            ;
        BEQ     LOAD            ;
LOAD19:
        LDA     #'?'            ;
        JSR     OUTCH           ;
LOAD21:
        RTS
GETBYTE:
        JSR     INHEX           ; GET HEX CHAR
        ASL                     ;
        ASL                     ;
        ASL                     ;
        ASL                     ;
        STA     TEMPBYTE        ;
        JSR     INHEX           ;
        AND     #$0F            ; MASK TO 4 BITS
        ORA     TEMPBYTE        ;
        PHA                     ;
        CLC                     ;
        ADC     CKSM            ;
        STA     CKSM            ;
        PLA                     ;
        RTS                     ;
; INPUT HEX CHAR
INHEX:
        JSR     IOF_CONINW      ;
        PHA                     ;
        JSR     OUTCH           ;
        PLA                     ;
        CMP     #$3A            ; LESS THAN 9?
        BCS     INHEX_BIG       ; NO, SKIP NEXT
        SBC     #$2F            ; CONVERT 0-9
INHEX_BIG:
        CMP     #$41            ; A OR MORE?
        BCC     INHEX_SMALL     ; NO, SKIP NEXT
        SBC     #$37            ; CONVERT A-F
INHEX_SMALL:
        RTS                     ;

; BUILD ADDRESS
BADDR:
        JSR     GETBYTE         ; READ 2 FRAMES
        STA     TEMPWORD1+1     ;
        JSR     GETBYTE         ;
        STA     TEMPWORD1       ;
        RTS


        .INCLUDE"ASSMB.ASM"

; COMMAND PROCESSOR JUMP TABLE
COMMAND_LOOKUP_TABLE:
        .BYTE   "REGISTER",0,<PRINT_REG,>PRINT_REG
        .BYTE   "DUMP",0,<DUMP,>DUMP
        .BYTE   "ENTER",0,<ENTERMEM,>ENTERMEM
        .BYTE   "GO",0,<GO,>GO
        .BYTE   "LOAD",0,<LOAD,>LOAD
        .BYTE   "Z80",0,<Z80,>Z80
        .BYTE   "DISASSEMBLE",0,<DISASSEMBLE,>DISASSEMBLE
        .BYTE   "ASSEMBLE",0,<ASSEMBLE,>ASSEMBLE
        .BYTE   01,0
; COMMAND PROMPT STRING
PROMPT:
        .BYTE   $0D,$0A,".",0
; ERROR STRING
ERROR:
        .BYTE   $0D,$0A,"? COMMAND NOT FOUND",$0D,0
INERROR:
        .BYTE   $0D,$0A,"? INVALID HEX NUMBER",$0D,0
; STRINGS FOR REGISTER DISPLY
REGDATA:
        .BYTE   $0D,$0A
        .BYTE   "   PC  AC  XR  YR  SP  SR(NVRBDIZC)"
        .BYTE   $0D,$0A,"! ",0
