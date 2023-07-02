;________________________________________________________________________________________________________________________________
;
;	Nhyodyne CP/M ESP IO test program
;
;  DWERNER 07/1/2023 	Initial
;________________________________________________________________________________________________________________________________

BDOS:           EQU $0005       ; BDOS invocation vector

ESP0:           EQU 9CH         ; ESP0 IO PORT

ESP_STATUS:     EQU 9EH         ; ESP  STATUS PORT
                                ; MSB XX S S S S S S
                                ;        | | | | | |- ESP0 READY OUTPUT
                                ;        | | | | |--- ESP0 BUSY
                                ;        | | | |----- ESP0 SPARE
                                ;        | | |------- ESP1 READY OUTPUT
                                ;        | |--------- ESP1 BUSY
                                ;        |----------- ESP1 SPARE
;
;
        ORG     0100H

        LD      sp,8000H        ; setup our private stack
;

        LD      C,9
        LD      DE,MENU
        CALL    BDOS            ; PRINT OPENING MENU


MNULOOP:
        LD      C,1
        CALL    BDOS            ; Get Menu Selection


        CP      '1'
        JP      Z,VGA_SINGLE_CHAR

        CP      '2'
        JP      Z,VGA_100SINGLE_CHAR

        CP      '3'
        JP      Z,VGA_OUT_STRING

        CP      '4'
        JP      Z,GET_KEY_IN

        CP      '5'
        JP      Z,GET_KEY_CHARS_IN_BUFFER

        CP      'E'
        JP      Z,EXIT
        JP      MNULOOP

EXIT:
;
        LD      C,0
        CALL    BDOS            ; return to CP/M via reset



VGA_SINGLE_CHAR:
        LD      A,1             ; SEND OPCODE 1 (OUT VGA CHAR)
        CALL    OUTESP0
        LD      A,'*'           ; SEND CHAR TO OUTPUT
        CALL    OUTESP0
        JP      MNULOOP

VGA_100SINGLE_CHAR:
        LD      c,100
VGA_100SINGLE_CHAR_1:
        LD      A,1             ; SEND OPCODE 1 (OUT VGA CHAR)
        CALL    OUTESP0
        LD      A,'*'           ; SEND CHAR TO OUTPUT
        CALL    OUTESP0
        DEC     c
        JP      nz,VGA_100SINGLE_CHAR_1
        JP      MNULOOP

VGA_OUT_STRING:
        LD      HL,VGA_TEST
        LD      A,2             ; SEND OPCODE 2 (OUT VGA NULL TERM STRING)
        CALL    OUTESP0
VGA_OUT_STRING_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP0
        LD      A,(HL)          ; GET CHAR
        INC     HL
        CP      0
        JP      nz,VGA_OUT_STRING_1
        JP      MNULOOP


GET_KEY_IN:
        CALL    CLEARESP0
        LD      A,3             ; SEND OPCODE 3 (GET KEY IN)
        CALL    OUTESP0
        CALL    INESP0_WAIT
        CALL    prtchr
        JP      MNULOOP


GET_KEY_CHARS_IN_BUFFER:
        CALL    CLEARESP0
        LD      A,4             ; SEND OPCODE 4 (GET KEY BUFFER LENGTH)
        CALL    OUTESP0
        CALL    INESP0_WAIT
        CALL    prthex
        JP      MNULOOP


;
;
;

; SEND BYTE TO ESP0
OUTESP0:
        PUSH    AF
OUTESP0_1:
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      NZ,OUTESP0_1    ; IF BUSY WAIT (SHOULD HAVE TIMEOUT HERE)
        POP     AF
        OUT     (ESP0),A        ; SEND BYTE
OUTESP0_2:
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      Z,OUTESP0_2     ; IF NOT BUSY WAIT (SHOULD HAVE TIMEOUT HERE)
        RET


; GET BYTE FROM ESP0 (BLOCKING)
INESP0_WAIT:
INESP0_WAIT_1:
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      NZ,INESP0_WAIT_1; IF BUSY, WAIT (SHOULD HAVE TIMEOUT HERE)
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     1               ; Is there data?
        JP      Z,INESP0_WAIT_1 ; IF NO, BUSY WAIT
        IN      A,(ESP0)        ; GET BYTE
        PUSH    AF
INESP0_WAIT_2:
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      Z,INESP0_WAIT_2 ; IF NOT BUSY WAIT (SHOULD HAVE TIMEOUT HERE)
        POP     AF
        RET

; CLEAR ESP0 INPUT BYTE QUEUE
CLEARESP0:
        CALL    INESP0
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     1               ; Is there MORE data?
        JP      NZ,CLEARESP0    ; IF YES, LOOP
        RET

; GET BYTE FROM ESP0 (NON BLOCKING)
INESP0:
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      NZ,INESP0       ; IF BUSY, WAIT (SHOULD HAVE TIMEOUT HERE)
        IN      A,(ESP0)        ; GET BYTE
        PUSH    AF
INESP0_1:
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      Z,INESP0_1      ; IF NOT BUSY WAIT (SHOULD HAVE TIMEOUT HERE)
        POP     AF
        RET

;
;
;
;
;
;
prthex:
        PUSH    af              ; save AF
        PUSH    de              ; save DE
        CALL    hexascii        ; convert value in A to hex chars in DE
        LD      a,d             ; get the high order hex char
        CALL    prtchr          ; print it
        LD      a,e             ; get the low order hex char
        CALL    prtchr          ; print it
        POP     de              ; restore DE
        POP     af              ; restore AF
        RET                     ; done
prtchr:
        PUSH    AF
        PUSH    bc              ; save registers
        PUSH    de
        PUSH    hl
        LD      E,A
        LD      C,2
        CALL    BDOS            ; return to CP/M via reset
        POP     hl              ; restore registers
        POP     de
        POP     bc
        POP     AF
        RET
;
; Convert binary value in A to ascii hex characters in DE
;
hexascii:
        LD      d,a             ; save A in D
        CALL    hexconv         ; convert low nibble of A to hex
        LD      e,a             ; save it in E
        LD      a,d             ; get original value back
        RLCA                    ; rotate high order nibble to low bits
        RLCA
        RLCA
        RLCA
        CALL    hexconv         ; convert nibble
        LD      d,a             ; save it in D
        RET                     ; done
;
; Convert low nibble of A to ascii hex
;
hexconv:
        AND     $0F             ; low nibble only
        ADD     a,$90
        DAA
        ADC     a,$40
        DAA
        RET
;
;
;
;
MENU:
        DB      0AH,0DH
        DM      "Nhodyne ESP32 IO board test"
        DB      0AH,0DH,0AH,0DH,0AH,0DH
        DM      "1> Output single char to VGA"
        DB      0AH,0DH
        DM      "2> Output 100 single chars to VGA"
        DB      0AH,0DH
        DM      "3> Output string to VGA"
        DB      0AH,0DH
        DM      "4> Get Keystroke"
        DB      0AH,0DH
        DM      "5> Get Key Buffer Length"
        DB      0AH,0DH
        DM      "6> Set Cursor visibility"
        DB      0AH,0DH
        DB      0AH,0DH
        DM      "E> Exit Program"
        DB      0AH,0DH

        DM      "$"

VGA_TEST:
        DB      0AH,0DH
        DM      27,"[40;31mH",27,"[40;32mI ",27,"[40;33mF",27,"[40;34mR"
        DM      27,"[40;35mOM ",27,"[40;36mN",27,"[40;37mH",27,"[40;91mY"
        DM      27,"[40;92mO",27,"[40;93mD",27,"[40;94mY",27,"[40;95mN"
        DM      27,"[40;96mE ",27,"[40;97m."
        DB      0AH,0DH,00H



        .END
