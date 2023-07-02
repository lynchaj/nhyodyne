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

; TERMINAL TESTS
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
        CP      '6'
        JP      Z,SET_CURSOR

; SERIAL TESTS
        CP      '7'
        JP      Z,SET_BAUD
        CP      '8'
        JP      Z,SET_MODE
        CP      '9'
        JP      Z,SERIAL_TX_CHAR
        CP      'A'
        JP      Z,SERIAL_TX_STRING
        CP      'B'
        JP      Z,GET_SERIAL_IN
        CP      'C'
        JP      Z,GET_SERIAL_CHARS_IN_BUFFER

; SOUND TESTS
        CP      'D'
        JP      Z,PLAY_STRING
        CP      'E'
        JP      Z,PLAY_SOUND
        CP      'F'
        JP      Z,SET_VOLUME

; GRAPHICS TESTS

; EXIT
        CP      'Z'
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


SET_CURSOR:
        LD      C,9
        LD      DE,CURSOR_PROMPT
        CALL    BDOS            ; PRINT PROMPT
        LD      C,1
        CALL    BDOS            ; Get Selection
        AND     1
        PUSH    AF
        LD      A,5             ; SEND OPCODE 5 (SET CURSOR)
        CALL    OUTESP0
        POP     AF
        CALL    OUTESP0
        JP      MNULOOP


SET_BAUD:
        LD      C,9
        LD      DE,BAUD_PROMPT
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS+2),A
        CALL    HEXBYTE
        LD      (PARMS+1),A
        CALL    HEXBYTE
        LD      (PARMS),A

        LD      A,(PARMS+2)
        CALL    prthex
        LD      A,(PARMS+1)
        CALL    prthex
        LD      A,(PARMS)
        CALL    prthex

        LD      A,6             ; SEND OPCODE 6 (SET BAUD)
        CALL    OUTESP0
        LD      A,(PARMS)
        CALL    OUTESP0
        LD      A,(PARMS+1)
        CALL    OUTESP0
        LD      A,(PARMS+2)
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP

SET_MODE:
        LD      C,9
        LD      DE,MODE_PROMPT
        CALL    BDOS            ; PRINT PROMPT
        LD      C,1
        CALL    BDOS            ; Get Selection
        AND     7
        PUSH    AF
        LD      A,7             ; SEND OPCODE 7 (SET MODE)
        CALL    OUTESP0
        POP     AF
        CALL    OUTESP0
        JP      MNULOOP


SERIAL_TX_CHAR:
        LD      A,8             ; SEND OPCODE 8 (TX CHAR)
        CALL    OUTESP0
        LD      A,'*'
        CALL    OUTESP0
        JP      MNULOOP


SERIAL_TX_STRING:
        LD      HL,SERIAL_TEST
        LD      A,9             ; SEND OPCODE 9 (OUT SERIAL NULL TERM STRING)
        CALL    OUTESP0
SERIAL_TX_STRING_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP0
        LD      A,(HL)          ; GET CHAR
        INC     HL
        CP      0
        JP      nz,SERIAL_TX_STRING_1
        JP      MNULOOP


GET_SERIAL_IN:
        CALL    CLEARESP0
        LD      A,10            ; SEND OPCODE 10 (GET SERIAL IN)
        CALL    OUTESP0
        CALL    INESP0_WAIT
        CALL    prtchr
        JP      MNULOOP


GET_SERIAL_CHARS_IN_BUFFER:
        CALL    CLEARESP0
        LD      A,11            ; SEND OPCODE 11 (GET SERIAL BUFFER LENGTH)
        CALL    OUTESP0
        CALL    INESP0_WAIT
        CALL    prthex
        JP      MNULOOP


PLAY_STRING:
        LD      HL,PLAY_TEST
        LD      A,12             ; SEND OPCODE 12 (PLAY SOUND STRING)
        CALL    OUTESP0
PLAY_STRING_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP0
        LD      A,(HL)          ; GET CHAR
        INC     HL
        CP      0
        JP      nz,PLAY_STRING_1
        JP      MNULOOP

PLAY_SOUND:
        LD      HL,SOUND_TEST
        LD      A,13             ; SEND OPCODE 13 (PLAY SOUND)
        CALL    OUTESP0
        LD      C,24
PLAY_SOUND_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP0
        LD      A,(HL)          ; GET CHAR
        INC     HL
        DEC     C
        JP      nz,PLAY_SOUND_1
        JP      MNULOOP

SET_VOLUME:
        LD      A,14             ; SEND OPCODE 14 (SET VOLUME)
        CALL    OUTESP0
        LD      A,7
        CALL    OUTESP0
        JP      MNULOOP
;

;
;
;
;



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
;__HEXBYTE____________________________________________________________________
;
;	GET ONE BYTE OF HEX DATA FROM BUFFER IN HL, RETURN IN A
;_____________________________________________________________________________
;
HEXBYTE:
        CALL    NIBL            ; CONVERT HEX CHAR TO BINARY VALUE IN A & INC HL
        SLA     A
        SLA     A
        SLA     A
        SLA     A
        LD      C,A
        CALL    NIBL            ; CONVERT HEX CHAR TO BINARY VALUE IN A & INC HL
        OR      C               ; COMBINE WITH WORKING VALUE
        RET                     ; AND DONE
;
;
;__NIBL_______________________________________________________________________
;
;	GET ONE BYTE OF HEX DATA FROM BUFFER IN HL, RETURN IN A
;_____________________________________________________________________________
;
NIBL:
        LD      A,(HL)          ; GET K B. DATA
        INC     HL              ; INC KB POINTER
        CP      40H             ; TEST FOR ALPHA
        JR      NC,ALPH
        AND     0FH             ; GET THE BITS
        RET
ALPH:
        AND     0FH             ; GET THE BITS
        ADD     A,09H           ; MAKE IT HEX A-F
        RET
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
        DM      "7> Set serial baud rate"
        DB      0AH,0DH
        DM      "8> Set serial mode"
        DB      0AH,0DH
        DM      "9> Serial TX single char"
        DB      0AH,0DH
        DM      "A> Serial TX string"
        DB      0AH,0DH
        DM      "B> Serial RX"
        DB      0AH,0DH
        DM      "C> Serial Buffer Length"
        DB      0AH,0DH
        DB      0AH,0DH
        DM      "D> Play String"
        DB      0AH,0DH
        DM      "E> Play Sound"
        DB      0AH,0DH
        DM      "F> Set Volume"
        DB      0AH,0DH


        DB      0AH,0DH
        DM      "Z> Exit Program"
        DB      0AH,0DH

        DM      "$"

VGA_TEST:
        DB      0AH,0DH
        DM      27,"[40;31mH",27,"[40;32mI ",27,"[40;33mF",27,"[40;34mR"
        DM      27,"[40;35mOM ",27,"[40;36mN",27,"[40;37mH",27,"[40;91mY"
        DM      27,"[40;92mO",27,"[40;93mD",27,"[40;94mY",27,"[40;95mN"
        DM      27,"[40;96mE ",27,"[40;97m."
        DB      0AH,0DH,00H


CURSOR_PROMPT:
        DB      0AH,0DH
        DM      "0>DISABLE CURSOR"
        DB      0AH,0DH
        DM      "1>ENABLE CURSOR"
        DB      0AH,0DH
        DM      "$"

BAUD_PROMPT:
        DB      0AH,0DH
        DM      "ENTER BAUD RATE (6 DIGITS HEX):"
        DM      "$"

SERIAL_TEST:
        DB      0AH,0DH
        DM      "SUCCESSFUL SERIAL STRING WRITE."
        DB      0AH,0DH,00H

MODE_PROMPT:
        DB      0AH,0DH
        DM      "ENTER SERIAL MODE: (8n1=0,8e1=1,8o1=2,7n1=3,7e1=4,7o1=5):"
        DM      "$"

PLAY_TEST:
        DM      "A4 4 2 A4 4 2 A#4 4 2 C5 4 2 C5 4 2 A#4 4 2 A4 4 2 G4 4 2 F4 4 2 F4 4 2 G4 4 2 A4 4 2 A4 2 2 G4 16 2 G4 2 2 P 8 2 "
        DB      00
SOUND_TEST:
        DB      5,0,0,0, 128,0,0,0 ,120,0, 0,1,0,0 ,4, 127, 0 ,0, 2 ,1, 0  ,1, 0 ,0
PARMS:
        DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
BUFFER:
        DB      20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

        .END
