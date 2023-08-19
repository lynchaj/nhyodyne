;________________________________________________________________________________________________________________________________
;
;	Nhyodyne CP/M ESP IO test program
;
;  DWERNER 07/1/2023 	Initial
;________________________________________________________________________________________________________________________________

BDOS:           EQU $0005       ; BDOS invocation vector

ESP0:           EQU 9CH         ; ESP0 IO PORT

ESP1:           EQU 9DH         ; ESP1 IO PORT

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
MENU_PAGE_1:
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
        CP      'G'
        JP      Z,SET_RESOLUTION
        CP      'H'
        JP      Z,LOAD_FONT
        CP      'I'
        JP      Z,CLEAR_SCREEN
        CP      'J'
        JP      Z,COPY_RECT
        CP      'K'
        JP      Z,DRAW_BITMAP
        CP      'L'
        JP      Z,DRAW_CHAR
        CP      'M'
        JP      Z,DRAW_ELLIPSE
        CP      'N'
        JP      Z,DRAW_GLYPH
        CP      'O'
        JP      Z,DRAW_LINE
        CP      'P'
        JP      Z,DRAW_RECTANGLE
        CP      'Q'
        JP      Z,DRAW_FILLED_ELLIPSE
        CP      'R'
        JP      Z,DRAW_FILLED_RECTANGLE
        CP      'S'
        JP      Z,GET_PIXEL
        CP      'T'
        JP      Z,INVERT_RECTANGLE
        CP      'U'
        JP      Z,LINETO
        CP      'V'
        JP      Z,MOVETO
        CP      'W'
        JP      Z,SCROLL
        CP      'X'
        JP      Z,BRUSH_COLOR
        CP      'Y'
        JP      Z,MENU_PAGE_2


; EXIT
        CP      'Z'
        JP      Z,EXIT
        JP      MNULOOP

EXIT:
;
        LD      C,0
        CALL    BDOS            ; return to CP/M via reset


MENU_PAGE_2:

        LD      C,9
        LD      DE,MENU2
        CALL    BDOS            ; PRINT OPENING MENU

MNULOOP2:
        LD      C,1
        CALL    BDOS            ; Get Menu Selection

        CP      '1'
        JP      Z,LINE_ENDS
        CP      '2'
        JP      Z,PEN_COLOR
        CP      '3'
        JP      Z,PEN_WIDTH
        CP      '4'
        JP      Z,SET_PIXEL
        CP      '5'
        JP      Z,SET_GLYPH_OPTIONS
        CP      '6'
        JP      Z,SET_PALETTE_ITEM
        CP      '7'
        JP      Z,SET_MOUSE_CURSOR
        CP      '8'
        JP      Z,SET_MOUSE_POSITION
        CP      '9'
        JP      Z,REMOVE_SPRITES
        CP      'A'
        JP      Z,SET_SPRITE_MAP
        CP      'B'
        JP      Z,SET_SPRITE_LOCATION
        CP      'C'
        JP      Z,SET_SPRITE_VISIBILITY

; SERIAL TESTS
        CP      'D'
        JP      Z,SET_BAUD2
        CP      'E'
        JP      Z,SET_MODE2
        CP      'F'
        JP      Z,SERIAL_TX_CHAR2
        CP      'G'
        JP      Z,SERIAL_TX_STRING2
        CP      'H'
        JP      Z,GET_SERIAL_IN2
        CP      'I'
        JP      Z,GET_SERIAL_CHARS_IN_BUFFER2
; WiFi Tests
        CP      'J'
        JP      Z,Set_Wifi_SSID
        CP      'K'
        JP      Z,Set_WiFi_Password
        CP      'L'
        JP      Z,Connect_To_WiFi
        CP      'M'
        JP      Z,Get_WiFi_Status
        CP      'N'
        JP      Z,Get_WiFi_Signal_Strength
        CP      'O'
        JP      Z,Get_WiFi_IP_Address
        CP      'P'
        JP      Z,Get_WiFi_IP_Subnet_Mask
        CP      'Q'
        JP      Z,Get_WiFi_IP_Gateway
        CP      'R'
        JP      Z,Get_WiFi_IP_Primary_DNS
        CP      'S'
        JP      Z,Get_WiFi_IP_Secondary_DNS
        CP      'T'
        JP      Z,Set_WiFi_IP_Address
        CP      'U'
        JP      Z,Set_WiFi_IP_Subnet_Mask
        CP      'V'
        JP      Z,Set_WiFi_IP_Gateway
        CP      'W'
        JP      Z,Set_WiFi_IP_Primary_DNS
        CP      'X'
        JP      Z,Set_WiFi_IP_Secondary_DNS

        CP      'Y'
        JP      Z,MENU_PAGE_3

        CP      'Z'
        JP      Z,MENU_PAGE_1
        JP      MNULOOP2


MENU_PAGE_3:

        LD      C,9
        LD      DE,MENU3
        CALL    BDOS            ; PRINT OPENING MENU

MNULOOP3:
        LD      C,1
        CALL    BDOS            ; Get Menu Selection

        CP      '1'
        JP      Z,SET_HOSTNAME
        CP      '2'
        JP      Z,CREATE_OUTGOING_CONN
        CP      '3'
        JP      Z,SET_INCOMING_PORT
        CP      '4'
        JP      Z,OUT_BYTE_TO_CONNECTION_0
        CP      '5'
        JP      Z,OUT_BYTE_TO_CONNECTION_1
        CP      '6'
        JP      Z,OUT_STRING_TO_CONNECTION_0
        CP      '7'
        JP      Z,OUT_STRING_TO_CONNECTION_1
        CP      '8'
        JP      Z,IN_BYTE_FROM_CONNECTION_0
        CP      '9'
        JP      Z,IN_BYTE_FROM_CONNECTION_1
        CP      'A'
        JP      Z,QUEUE_LENGTH_CONNECTION_0
        CP      'B'
        JP      Z,QUEUE_LENGTH_CONNECTION_1
        CP      'C'
        JP      Z,CONNECTION_0_TELNET_BYTE_MODE
        CP      'D'
        JP      Z,GET_MOUSE
        CP      'Z'
        JP      Z,MENU_PAGE_2
        JP      MNULOOP3


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
        LD      A,12            ; SEND OPCODE 12 (PLAY SOUND STRING)
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
        LD      A,13            ; SEND OPCODE 13 (PLAY SOUND)
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
        LD      A,14            ; SEND OPCODE 14 (SET VOLUME)
        CALL    OUTESP0
        LD      A,7
        CALL    OUTESP0
        JP      MNULOOP


SET_RESOLUTION:
        LD      C,9
        LD      DE,RESOLUTION_PROMPT
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS),A
        CALL    prthex
        LD      A,15            ; SEND OPCODE 15 (SET RESOLUTION)
        CALL    OUTESP0
        LD      A,(PARMS)
        CALL    OUTESP0
        JP      MNULOOP
LOAD_FONT:
        LD      C,9
        LD      DE,FONT_PROMPT
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS),A

        LD      A,16            ; SEND OPCODE 16 (SET FONT)
        CALL    OUTESP0
        LD      A,(PARMS)
        CALL    OUTESP0
        JP      MNULOOP

CLEAR_SCREEN:
        LD      A,17            ; SEND OPCODE 17 (CLEAR SCREEN)
        CALL    OUTESP0
        JP      MNULOOP

COPY_RECT:
        LD      A,18            ; SEND OPCODE 18 (COPY RECT)
        CALL    OUTESP0
        LD      A,10            ; SEND X CORD 10
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,10            ; SEND Y CORD 10
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,100           ; SEND DEST X CORD 100
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,100           ; SEND DEST Y CORD 100
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,25            ; SEND WIDTH 25
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,25            ; SEND HEIGHT 25
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP


DRAW_BITMAP:
        LD      HL,BITMAP_TEST
        LD      A,19            ; SEND OPCODE 19 (DRAW BITMAP)
        CALL    OUTESP0

        LD      A,125           ; SEND X CORD 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND Y CORD 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,16            ; BITMAP WIDTH
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A, 15           ; BITMAP HEIGHT
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A, 4            ; BITMAP FORMAT  FORMAT=RGBA8888
        CALL    OUTESP0
        LD      A,0C0H          ; SEND BITMAP LENGTH (03C0)
        CALL    OUTESP0
        LD      A,03H
        CALL    OUTESP0
        LD      HL,BITMAP_TEST
        LD      DE,BITMAP_TEST_END
        PUSH    HL
DRAW_BITMAP_1:
        POP     HL
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP0
        LD      A,(HL)          ; GET CHAR
        INC     HL
        PUSH    HL
        OR      a               ; AT THE END?
        SBC     hl, de
        ADD     hl, de
        JP      nz,DRAW_BITMAP_1
        POP     HL
        JP      MNULOOP


DRAW_CHAR:
        LD      A,20            ; SEND OPCODE 20 (DRAW CHAR)
        CALL    OUTESP0
        LD      A,120           ; SEND X CORD 120
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,120           ; SEND Y CORD 120
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,'$'           ; SEND CHAR
        CALL    OUTESP0
        LD      A,26            ; SEND FONTID
        CALL    OUTESP0
        JP      MNULOOP


DRAW_ELLIPSE:
        LD      A,21            ; SEND OPCODE 21 (DRAW ELLIPSE)
        CALL    OUTESP0
        LD      A,150           ; SEND X CORD 150
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,150           ; SEND Y CORD 150
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND WIDTH 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND HEIGHT 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP




DRAW_GLYPH:
        LD      A,22            ; SEND OPCODE 22 (DRAW GLYPH)
        CALL    OUTESP0
        LD      A,180           ; SEND X CORD 180
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,180           ; SEND Y CORD 180
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,16            ; SEND WIDTH 16
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,7             ; SEND HEIGHT 7
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,0             ; SEND INDEX
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,14            ; SEND LENGTH 14
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0

        LD      HL,GLYPH_TEST
        LD      C,14
DRAW_GLYPH_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP0
        INC     HL
        DEC     C
        JP      nz,DRAW_GLYPH_1
        JP      MNULOOP



DRAW_LINE:
        LD      A,23            ; SEND OPCODE 23 (DRAW LINE)
        CALL    OUTESP0
        LD      A,50            ; SEND X CORD 50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,50            ; SEND Y CORD 50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND TO X 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND TO Y 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP

DRAW_RECTANGLE:
        LD      A,24            ; SEND OPCODE 24 (DRAW RECTANGLE)
        CALL    OUTESP0
        LD      A,50            ; SEND X CORD 50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,50            ; SEND Y CORD 50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND TO X 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND TO Y 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP

DRAW_FILLED_ELLIPSE:
        LD      A,25            ; SEND OPCODE 25 (DRAW FILLED ELLIPSE)
        CALL    OUTESP0
        LD      A,150           ; SEND X CORD 150
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,150           ; SEND Y CORD 150
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND WIDTH 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND HEIGHT 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP

DRAW_FILLED_RECTANGLE:
        LD      A,26            ; SEND OPCODE 26 (DRAW FILLED RECTANGLE)
        CALL    OUTESP0
        LD      A,50            ; SEND X CORD 50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,50            ; SEND Y CORD 50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND TO X 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND TO Y 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP



GET_PIXEL:
        CALL    CLEARESP0
        LD      A,27            ; SEND OPCODE 27 (GET PIXEL)
        CALL    OUTESP0
        LD      A,50            ; SEND X CORD 50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,50            ; SEND Y CORD 50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        CALL    INESP0_WAIT
        CALL    prthex
        CALL    INESP0_WAIT
        CALL    prthex
        CALL    INESP0_WAIT
        CALL    prthex
        JP      MNULOOP


INVERT_RECTANGLE:
        LD      A,28            ; SEND OPCODE 28 (INVERT RECTANGLE)
        CALL    OUTESP0
        LD      A,50            ; SEND X CORD 50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,50            ; SEND Y CORD 50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND TO X 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,125           ; SEND TO Y 125
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP


LINETO:
        LD      A,29            ; SEND OPCODE 29 (LINETO)
        CALL    OUTESP0
        LD      A,250           ; SEND X CORD 250
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,250           ; SEND Y CORD 250
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP

MOVETO:
        LD      A,30            ; SEND OPCODE 30 (MOVETO)
        CALL    OUTESP0
        LD      A,20            ; SEND X CORD 20
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,20            ; SEND Y CORD 20
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP

SCROLL:
        LD      A,31            ; SEND OPCODE 31 (SCROLL)
        CALL    OUTESP0
        LD      A,1             ; SEND X OFFSET 1
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,1             ; SEND Y OFFSET 1
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP



BRUSH_COLOR:
        LD      C,9
        LD      DE,BRUSH_PROMPT
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS),A

        LD      A,32            ; SEND OPCODE 32 (SET BRUSH COLOR)
        CALL    OUTESP0
        LD      A,(PARMS)
        CALL    OUTESP0
        JP      MNULOOP

LINE_ENDS:
        LD      C,9
        LD      DE,LINE_ENDS_PROMPT
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS),A

        LD      A,33            ; SEND OPCODE 33 (SET LINE ENDS)
        CALL    OUTESP0
        LD      A,(PARMS)
        CALL    OUTESP0
        JP      MNULOOP2

PEN_COLOR:
        LD      C,9
        LD      DE,PEN_PROMPT
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS),A

        LD      A,34            ; SEND OPCODE 34 (SET PEN COLOR)
        CALL    OUTESP0
        LD      A,(PARMS)
        CALL    OUTESP0
        JP      MNULOOP2

PEN_WIDTH:
        LD      C,9
        LD      DE,PEN_WIDTH_PROMPT
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS),A

        LD      A,35            ; SEND OPCODE 35 (SET PEN WIDTH)
        CALL    OUTESP0
        LD      A,(PARMS)
        CALL    OUTESP0
        JP      MNULOOP2


SET_PIXEL:
        LD      A,36            ; SEND OPCODE 36 (SET PIXEL)
        CALL    OUTESP0
        LD      A,100           ; SEND X  100
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,50            ; SEND Y  50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP2


SET_GLYPH_OPTIONS:
        LD      C,9
        LD      DE,GLYPH_PROMPT_1
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS),A
        LD      C,9
        LD      DE,GLYPH_PROMPT_2
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS+1),A
        LD      C,9
        LD      DE,GLYPH_PROMPT_3
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS+2),A
        LD      C,9
        LD      DE,GLYPH_PROMPT_4
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS+3),A
        LD      C,9
        LD      DE,GLYPH_PROMPT_5
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS+4),A
        LD      C,9
        LD      DE,GLYPH_PROMPT_6
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS+5),A
        LD      C,9
        LD      DE,GLYPH_PROMPT_7
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS+6),A
        LD      A,37            ; SEND OPCODE 37 (SET GLYPH OPTIONS)
        CALL    OUTESP0
        LD      A,(PARMS)
        CALL    OUTESP0
        LD      A,(PARMS+1)
        CALL    OUTESP0
        LD      A,(PARMS+2)
        CALL    OUTESP0
        LD      A,(PARMS+3)
        CALL    OUTESP0
        LD      A,(PARMS+4)
        CALL    OUTESP0
        LD      A,(PARMS+5)
        CALL    OUTESP0
        LD      A,(PARMS+6)
        CALL    OUTESP0

        JP      MNULOOP2

SET_PALETTE_ITEM:
        LD      C,9
        LD      DE,PALETTE_PROMPT_1
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS),A
        LD      C,9
        LD      DE,PALETTE_PROMPT_2
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS+1),A
        LD      C,9
        LD      DE,PALETTE_PROMPT_3
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS+2),A
        LD      C,9
        LD      DE,PALETTE_PROMPT_4
        CALL    BDOS            ; PRINT PROMPT
        LD      C,0AH
        LD      DE,BUFFER
        CALL    BDOS            ; GET INPUT
        LD      HL,BUFFER+2
        CALL    HEXBYTE
        LD      (PARMS+3),A
        LD      A,38            ; SEND OPCODE 38 (SET PALETTE ITEM)
        CALL    OUTESP0
        LD      A,(PARMS)
        CALL    OUTESP0
        LD      A,(PARMS+1)
        CALL    OUTESP0
        LD      A,(PARMS+2)
        CALL    OUTESP0
        LD      A,(PARMS+3)
        CALL    OUTESP0
        JP      MNULOOP2

SET_MOUSE_CURSOR:
        LD      A,39            ; SEND OPCODE 39 (SET MOUSE CURSOR)
        CALL    OUTESP0
        LD      A,1             ; SEND CURSOR TYPE  1
        CALL    OUTESP0
        JP      MNULOOP2

SET_MOUSE_POSITION:
        LD      A,40            ; SEND OPCODE 40 (SET MOUSE CURSOR POSITION)
        CALL    OUTESP0
        LD      A,100           ; SEND X  100
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,50            ; SEND Y  50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        JP      MNULOOP2



REMOVE_SPRITES:
        LD      A,41            ; SEND OPCODE 41 (REMOVE SPRITES)
        CALL    OUTESP0
        JP      MNULOOP2


SET_SPRITE_MAP:
        LD      HL,BITMAP_TEST
        LD      A,42            ; SEND OPCODE 42 (SET SPRITE MAP)
        CALL    OUTESP0
        LD      A,0             ; SEND INDEX 1
        CALL    OUTESP0
        LD      A,16            ; BITMAP WIDTH
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A, 15           ; BITMAP HEIGHT
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A, 4            ; BITMAP FORMAT  FORMAT=RGBA8888
        CALL    OUTESP0
        LD      A,0C0H          ; SEND BITMAP LENGTH (03C0)
        CALL    OUTESP0
        LD      A,03H
        CALL    OUTESP0
        LD      HL,BITMAP_TEST
        LD      DE,BITMAP_TEST_END
        PUSH    HL
SET_SPRITE_MAP_1:
        POP     HL
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP0
        LD      A,(HL)          ; GET CHAR
        INC     HL
        PUSH    HL
        OR      a               ; AT THE END?
        SBC     hl, de
        ADD     hl, de
        JP      nz,SET_SPRITE_MAP_1
        POP     HL
        JP      MNULOOP2


SET_SPRITE_LOCATION:
        LD      A,43            ; SEND OPCODE 43 (SET SPRITE LOCATION)
        CALL    OUTESP0
        LD      A,100           ; SEND X  100
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,50            ; SEND Y  50
        CALL    OUTESP0
        LD      A,0
        CALL    OUTESP0
        LD      A,0             ; SEND 1
        CALL    OUTESP0
        JP      MNULOOP2

SET_SPRITE_VISIBILITY:
        LD      A,44            ; SEND OPCODE 44 (SET SPRITE VISIBILITY)
        CALL    OUTESP0
        LD      A,1             ; SEND INDEX 1
        CALL    OUTESP0
        LD      A,1             ; SET VISIBLE
        CALL    OUTESP0
        JP      MNULOOP2

;
;
;
;

SET_BAUD2:
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

        LD      A,6             ; SEND OPCODE 6 (SET BAUD)
        CALL    OUTESP1
        LD      A,(PARMS)
        CALL    OUTESP1
        LD      A,(PARMS+1)
        CALL    OUTESP1
        LD      A,(PARMS+2)
        CALL    OUTESP1
        LD      A,0
        CALL    OUTESP1
        JP      MNULOOP2

SET_MODE2:
        LD      C,9
        LD      DE,MODE_PROMPT
        CALL    BDOS            ; PRINT PROMPT
        LD      C,1
        CALL    BDOS            ; Get Selection
        AND     7
        PUSH    AF
        LD      A,7             ; SEND OPCODE 7 (SET MODE)
        CALL    OUTESP1
        POP     AF
        CALL    OUTESP1
        JP      MNULOOP2


SERIAL_TX_CHAR2:
        LD      A,8             ; SEND OPCODE 8 (TX CHAR)
        CALL    OUTESP1
        LD      A,'*'
        CALL    OUTESP1
        JP      MNULOOP2


SERIAL_TX_STRING2:
        LD      HL,SERIAL_TEST
        LD      A,9             ; SEND OPCODE 9 (OUT SERIAL NULL TERM STRING)
        CALL    OUTESP1
SERIAL_TX_STRING2_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP1
        LD      A,(HL)          ; GET CHAR
        INC     HL
        CP      0
        JP      nz,SERIAL_TX_STRING2_1
        JP      MNULOOP2


GET_SERIAL_IN2:
        CALL    CLEARESP1
        LD      A,10            ; SEND OPCODE 10 (GET SERIAL IN)
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prtchr
        JP      MNULOOP2


GET_SERIAL_CHARS_IN_BUFFER2:
        CALL    CLEARESP1
        LD      A,11            ; SEND OPCODE 11 (GET SERIAL BUFFER LENGTH)
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prthex
        JP      MNULOOP2


Set_Wifi_SSID:
        LD      HL,SSID_STRING
        LD      A,1             ; SEND OPCODE 1 (Get SSID)
        CALL    OUTESP1
Set_Wifi_SSID_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP1
        LD      A,(HL)          ; GET CHAR
        INC     HL
        CP      0
        JP      nz,Set_Wifi_SSID_1
        JP      MNULOOP2

Set_WiFi_Password:
        LD      HL,PASSWORD_STRING
        LD      A,2             ; SEND OPCODE 9 (Get WiFi Password)
        CALL    OUTESP1
Set_WiFi_Password_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP1
        LD      A,(HL)          ; GET CHAR
        INC     HL
        CP      0
        JP      nz,Set_WiFi_Password_1
        JP      MNULOOP2

Connect_To_WiFi:
        CALL    CLEARESP1
        LD      A,3             ; SEND OPCODE 3 (Connect To WiFi)
        CALL    OUTESP1
        JP      MNULOOP2

Get_WiFi_Status:
        CALL    CLEARESP1
        LD      A,4             ; SEND OPCODE 4 (GET WiFi Status)
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prthex
        JP      MNULOOP2

Get_WiFi_Signal_Strength:
        CALL    CLEARESP1
        LD      A,5             ; SEND OPCODE 5 (GET WiFi Signal Strength)
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prthex
        JP      MNULOOP2


Get_WiFi_IP_Address:
        CALL    CLEARESP1
        LD      A,12            ; SEND OPCODE 12 (GET WiFi IP Address)
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        JP      MNULOOP2

Get_WiFi_IP_Subnet_Mask:
        CALL    CLEARESP1
        LD      A,13            ; SEND OPCODE 13 (GET WiFi Subnet Mask)
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        JP      MNULOOP2

Get_WiFi_IP_Gateway:
        CALL    CLEARESP1
        LD      A,14            ; SEND OPCODE 14 (GET WiFi Gateway)
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        JP      MNULOOP2

Get_WiFi_IP_Primary_DNS:
        CALL    CLEARESP1
        LD      A,15            ; SEND OPCODE 15 (GET WiFi Primary DNS)
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        JP      MNULOOP2

Get_WiFi_IP_Secondary_DNS:
        CALL    CLEARESP1
        LD      A,16            ; SEND OPCODE 16 (GET WiFi Secondary DNS)
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    prtdot
        CALL    INESP1_WAIT
        CALL    prthex
        JP      MNULOOP2


Set_WiFi_IP_Address:
        LD      A,17            ; SEND OPCODE 17 (SET WiFi STATIC IP)
        CALL    OUTESP1
        LD      A,192
        CALL    OUTESP1
        LD      A,168
        CALL    OUTESP1
        LD      A,0
        CALL    OUTESP1
        LD      A,175
        CALL    OUTESP1
        JP      MNULOOP2

Set_WiFi_IP_Subnet_Mask:
        LD      A,18            ; SEND OPCODE 18 (SET WiFi SUBNET)
        CALL    OUTESP1
        LD      A,255
        CALL    OUTESP1
        LD      A,255
        CALL    OUTESP1
        LD      A,255
        CALL    OUTESP1
        LD      A,0
        CALL    OUTESP1
        JP      MNULOOP2

Set_WiFi_IP_Gateway:
        LD      A,19            ; SEND OPCODE 19 (SET WiFi GATEWAY)
        CALL    OUTESP1
        LD      A,192
        CALL    OUTESP1
        LD      A,168
        CALL    OUTESP1
        LD      A,0
        CALL    OUTESP1
        LD      A,1
        CALL    OUTESP1
        JP      MNULOOP2

Set_WiFi_IP_Primary_DNS:
        LD      A,20            ; SEND OPCODE 20 (SET WiFi PRIMARY DNS)
        CALL    OUTESP1
        LD      A,192
        CALL    OUTESP1
        LD      A,168
        CALL    OUTESP1
        LD      A,0
        CALL    OUTESP1
        LD      A,1
        CALL    OUTESP1
        JP      MNULOOP2

Set_WiFi_IP_Secondary_DNS:
        LD      A,21            ; SEND OPCODE 21 (SET WiFi sECONDARY DNS)
        CALL    OUTESP1
        LD      A,192
        CALL    OUTESP1
        LD      A,168
        CALL    OUTESP1
        LD      A,0
        CALL    OUTESP1
        LD      A,1
        CALL    OUTESP1
        JP      MNULOOP2


SET_HOSTNAME:
        LD      HL,HOSTNAME_TEST
        LD      A,22            ; SEND OPCODE 22 (SEND HOSTNAME)
        CALL    OUTESP1
SET_HOSTNAME_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP1
        LD      A,(HL)          ; GET CHAR
        INC     HL
        CP      0
        JP      nz,SET_HOSTNAME_1
        JP      MNULOOP3

CREATE_OUTGOING_CONN:
        LD      HL,OUTGOING_TEST
        LD      A,23            ; SEND OPCODE 23 (OPEN OUTGOING CONNECTION)
        CALL    OUTESP1
        LD      A,1
        CALL    OUTESP1
        LD      A,90H           ; PORT 8080
        CALL    OUTESP1
        LD      A,1FH
        CALL    OUTESP1
CREATE_OUTGOING_CONN_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP1
        LD      A,(HL)          ; GET CHAR
        INC     HL
        CP      0
        JP      nz,CREATE_OUTGOING_CONN_1
        JP      MNULOOP3

SET_INCOMING_PORT:
        LD      A,24            ; SEND OPCODE 24 (SET LISTEN PORT)
        CALL    OUTESP1
        LD      A,90H           ; PORT 8080
        CALL    OUTESP1
        LD      A,1FH
        CALL    OUTESP1
        JP      MNULOOP3

OUT_BYTE_TO_CONNECTION_0:
        LD      A,25            ; SEND OPCODE 25 (TX CHAR)
        CALL    OUTESP1
        LD      A,0
        CALL    OUTESP1
        LD      A,'*'
        CALL    OUTESP1
        JP      MNULOOP3

OUT_BYTE_TO_CONNECTION_1:
        LD      A,25            ; SEND OPCODE 25 (TX CHAR)
        CALL    OUTESP1
        LD      A,1
        CALL    OUTESP1
        LD      A,'*'
        CALL    OUTESP1
        JP      MNULOOP3

OUT_STRING_TO_CONNECTION_0:
        LD      HL,SERIAL_TEST
        LD      A,26            ; SEND OPCODE 26 (OUT  NULL TERM STRING)
        CALL    OUTESP1
        LD      A,0
        CALL    OUTESP1
OUT_STRING_TO_CONNECTION_0_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP1
        LD      A,(HL)          ; GET CHAR
        INC     HL
        CP      0
        JP      nz,OUT_STRING_TO_CONNECTION_0_1
        JP      MNULOOP3

OUT_STRING_TO_CONNECTION_1:
        LD      HL,SERIAL_TEST
        LD      A,26            ; SEND OPCODE 26 (OUT  NULL TERM STRING)
        CALL    OUTESP1
        LD      A,1
        CALL    OUTESP1
OUT_STRING_TO_CONNECTION_1_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP1
        LD      A,(HL)          ; GET CHAR
        INC     HL
        CP      0
        JP      nz,OUT_STRING_TO_CONNECTION_1_1
        JP      MNULOOP3

IN_BYTE_FROM_CONNECTION_0:
        CALL    CLEARESP1
        LD      A,27            ; SEND OPCODE 27 (GET WIFI IN)
        CALL    OUTESP1
        LD      A,0
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prtchr
        JP      MNULOOP3

IN_BYTE_FROM_CONNECTION_1:
        CALL    CLEARESP1
        LD      A,27            ; SEND OPCODE 27 (GET WIFI IN)
        CALL    OUTESP1
        LD      A,1
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prtchr
        JP      MNULOOP3

QUEUE_LENGTH_CONNECTION_0:
        CALL    CLEARESP1
        LD      A,28            ; SEND OPCODE 28 (GET WIFI BUFFER LENGTH)
        CALL    OUTESP1
        LD      A,0
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prthex
        JP      MNULOOP3

QUEUE_LENGTH_CONNECTION_1:
        CALL    CLEARESP1
        LD      A,28            ; SEND OPCODE 28 (GET WIFI BUFFER LENGTH)
        CALL    OUTESP1
        LD      A,1
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prthex
        JP      MNULOOP3


CONNECTION_0_TELNET_BYTE_MODE:
        LD      HL,TELNET_CHAR_MODE
        LD      A,26            ; SEND OPCODE 26 (OUT  NULL TERM STRING)
        CALL    OUTESP1
        LD      A,0
        CALL    OUTESP1
CONNECTION_0_TELNET_BYTE_MODE_1:
        LD      A,(HL)          ; SEND CHAR TO OUTPUT
        CALL    OUTESP1
        LD      A,(HL)          ; GET CHAR
        INC     HL
        CP      0
        JP      nz,CONNECTION_0_TELNET_BYTE_MODE_1
        JP      MNULOOP3


GET_MOUSE:
        CALL    CLEARESP1
        LD      A,29            ; SEND OPCODE 29 (GET MOUSE)
        CALL    OUTESP1
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    INESP1_WAIT
        CALL    prthex
        CALL    INESP1_WAIT
        CALL    prthex
        JP      MNULOOP3
;
;
;
; SEND BYTE TO ESP0
OUTESP0:
        PUSH    BC
        PUSH    AF
        LD      C,0
OUTESP0_1:
        INC     C
        JP      Z,OUTESP0_TIMEOUT
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      NZ,OUTESP0_1    ; IF BUSY WAIT
        POP     AF
        OUT     (ESP0),A        ; SEND BYTE
        LD      C,$E0
OUTESP0_2:
        INC     C
        JP      Z,OUTESP0_3
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      Z,OUTESP0_2     ; IF NOT BUSY WAIT
OUTESP0_3:
        POP     BC
        RET
OUTESP0_TIMEOUT:
        POP     AF
        POP     BC
        RET


; GET BYTE FROM ESP0 (BLOCKING)
INESP0_WAIT:
        PUSH    BC
        LD      C,0
INESP0_WAIT_1:
        INC     C
        JP      Z,INESP0_TIMEOUT
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      NZ,INESP0_WAIT_1; IF BUSY, WAIT
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     1               ; Is there data?
        JP      Z,INESP0_WAIT_1 ; IF NO, BUSY WAIT
        IN      A,(ESP0)        ; GET BYTE
        PUSH    AF
        LD      C,$E0
INESP0_WAIT_2:
        INC     C
        JP      Z,INESP0_3
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      Z,INESP0_WAIT_2 ; IF NOT BUSY WAIT (SHOULD HAVE TIMEOUT HERE)
INESP0_3:
        POP     AF
        POP     BC
        RET
INESP0_TIMEOUT:
        LD      a,0
        POP     BC
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
        PUSH    BC
        LD      C,0
INESP0_1:
        INC     C
        JP      Z,INESP0_TIMEOUT
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      NZ,INESP0_1     ; IF BUSY, WAIT (SHOULD HAVE TIMEOUT HERE)
        IN      A,(ESP0)        ; GET BYTE
        PUSH    AF
        LD      C,$E0
INESP0_2:
        INC     C
        JP      Z,INESP0_4
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     2               ; Is ESP0 BUSY?
        JP      Z,INESP0_2      ; IF NOT BUSY WAIT (SHOULD HAVE TIMEOUT HERE)
INESP0_4:
        POP     AF
        POP     bc
        RET



; SEND BYTE TO ESP1
OUTESP1:
        PUSH    BC
        PUSH    AF
        LD      C,0
OUTESP1_1:
        INC     C
        JP      Z,OUTESP1_TIMEOUT
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     10H             ; Is ESP0 BUSY?
        JP      NZ,OUTESP1_1    ; IF BUSY WAIT
        POP     AF
        OUT     (ESP1),A        ; SEND BYTE
        LD      C,$E0
OUTESP1_2:
        INC     C
        JP      Z,OUTESP1_3
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     10H             ; Is ESP0 BUSY?
        JP      Z,OUTESP1_2     ; IF NOT BUSY WAIT
OUTESP1_3:
        POP     BC
        RET
OUTESP1_TIMEOUT:
        POP     AF
        POP     BC
        RET


; GET BYTE FROM ESP1 (BLOCKING)
INESP1_WAIT:
        PUSH    BC
        LD      C,0
INESP1_WAIT_1:
        INC     C
        JP      Z,INESP1_TIMEOUT
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     10H             ; Is ESP0 BUSY?
        JP      NZ,INESP1_WAIT_1; IF BUSY, WAIT
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     8H              ; Is there data?
        JP      Z,INESP1_WAIT_1 ; IF NO, BUSY WAIT
        IN      A,(ESP1)        ; GET BYTE
        PUSH    AF
        LD      C,$E0
INESP1_WAIT_2:
        INC     C
        JP      Z,INESP1_3
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     10H             ; Is ESP0 BUSY?
        JP      Z,INESP1_WAIT_2 ; IF NOT BUSY WAIT (SHOULD HAVE TIMEOUT HERE)
INESP1_3:
        POP     AF
        POP     BC
        RET
INESP1_TIMEOUT:
        LD      a,0
        POP     BC
        RET

; CLEAR ESP1 INPUT BYTE QUEUE
CLEARESP1:
        CALL    INESP1
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     8H              ; Is there MORE data?
        JP      NZ,CLEARESP1    ; IF YES, LOOP
        RET


; GET BYTE FROM ESP1 (NON BLOCKING)
INESP1:
        PUSH    BC
        LD      C,0
INESP1_1:
        INC     C
        JP      Z,INESP0_TIMEOUT
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     10H               ; Is ESP1 BUSY?
        JP      NZ,INESP1_1       ; IF BUSY, WAIT
        IN      A,(ESP1)        ; GET BYTE
        PUSH    AF
        LD      C,$E0
INESP1_2:
        INC     C
        JP      Z,INESP1_4
        IN      A,(ESP_STATUS)  ; GET STATUS
        AND     10H               ; Is ESP1 BUSY?
        JP      Z,INESP1_2      ; IF NOT BUSY WAIT
INESP1_4:
        POP     AF
        pop     bc
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

prtdot:
        PUSH    AF
        PUSH    bc              ; save registers
        PUSH    de
        PUSH    hl
        LD      E,'.'
        LD      C,2
        CALL    BDOS            ; return to CP/M via reset
        POP     hl              ; restore registers
        POP     de
        POP     bc
        POP     AF
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
        DM      "                            Nhodyne ESP32 IO board test"
        DB      0AH,0DH,0AH,0DH,0AH,0DH
;                12345678901234567890123456789012345678901234567890123456789012345678901234567890
        DM      "1> Output single char to VGA                  J.  COPY RECT                    "
        DB      0AH,0DH
        DM      "2> Output 100 single chars to VGA             K.  DRAW BITMAP                  "
        DB      0AH,0DH
        DM      "3> Output string to VGA                       L.  DRAW CHAR                    "
        DB      0AH,0DH
        DM      "4> Get Keystroke                              M.  DRAW ELLIPSE                 "
        DB      0AH,0DH
        DM      "5> Get Key Buffer Length                      N.  DRAW GLYPH                   "
        DB      0AH,0DH
        DM      "6> Set Cursor visibility                      O.  DRAW LINE                    "
        DB      0AH,0DH
        DM      "                                              P.  DRAW RECTANGLE               "
        DB      0AH,0DH
        DM      "7> Set serial baud rate                       Q.  FILL ELLIPSE                 "
        DB      0AH,0DH
        DM      "8> Set serial mode                            R.  FILL RECTANGLE               "
        DB      0AH,0DH
        DM      "9> Serial TX single char                      S.  GET PIXEL                    "
        DB      0AH,0DH
        DM      "A> Serial TX string                           T.  INVERT RECTANGLE             "
        DB      0AH,0DH
        DM      "B> Serial RX                                  U.  LINE TO                      "
        DB      0AH,0DH
        DM      "C> Serial Buffer Length                       V.  MOVE TO                      "
        DB      0AH,0DH
        DM      "                                              W.  SCROLL                       "
        DB      0AH,0DH
        DM      "D> Play String                                X.  SET BRUSH COLOR              "
        DB      0AH,0DH
        DM      "E> Play Sound"
        DB      0AH,0DH
        DM      "F> Set Volume"
        DB      0AH,0DH
        DB      0AH,0DH
        DM      "G> Set Resolution"
        DB      0AH,0DH
        DM      "H> Load Font"
        DB      0AH,0DH
        DM      "I> Clear                                      Y.  MENU PAGE TWO                "
        DB      0AH,0DH
        DB      0AH,0DH
        DM      "Z> Exit Program"
        DB      0AH,0DH

        DM      "$"


MENU2:
        DB      0AH,0DH
        DM      "                       Nhodyne ESP32 IO board test PAGE 2"
        DB      0AH,0DH,0AH,0DH,0AH,0DH
;                12345678901234567890123456789012345678901234567890123456789012345678901234567890
        DM      "1>  SET LINE END TYPE                         J. Set Wifi SSID                 "
        DB      0AH,0DH
        DM      "2>  SET PEN COLOR                             K. Set WiFi Password             "
        DB      0AH,0DH
        DM      "3>  SET PEN WIDTH                             L. Connect To WiFi               "
        DB      0AH,0DH
        DM      "4>  SET PIXEL                                 M. Get WiFi Status               "
        DB      0AH,0DH
        DM      "5>  SET GLYPH OPTIONS                         N. Get WiFi Signal Strength      "
        DB      0AH,0DH
        DM      "6>  SET PALLETTE ITEM                         O. Get IP Address                "
        DB      0AH,0DH
        DM      "7>  SET MOUSE CURSOR                          P. Get Subnet Mask               "
        DB      0AH,0DH
        DM      "8>  SET MOUSE CURSOR POSITION                 Q. Get Gateway                   "
        DB      0AH,0DH
        DM      "                                              R. Get Primary DNS               "
        DB      0AH,0DH
        DM      "9> REMOVE SPRITES                             S. Get Secondary DNS             "
        DB      0AH,0DH
        DM      "A> SET SPRITE MAP                             T. Set IP Address                "
        DB      0AH,0DH
        DM      "B> SET SPRITE LOCATION                        U. Set Subnet Mask               "
        DB      0AH,0DH
        DM      "C> SET SPRITE VISIBILITY                      V. Set Gateway                   "
        DB      0AH,0DH
        DM      "                                              W. Set Primary DNS               "
        DB      0AH,0DH
        DM      "D> Set serial 2 baud rate                     X. Set Secondary DNS             "
        DB      0AH,0DH
        DM      "E> Set serial 2 mode                                                           "
        DB      0AH,0DH
        DM      "F> Serial 2 TX single char                    Y. Page Three                    "
        DB      0AH,0DH
        DM      "G> Serial 2 TX string                                                          "
        DB      0AH,0DH
        DM      "H> Serial 2 RX                                                                 "
        DB      0AH,0DH
        DM      "I> Serial 2 Buffer Length                                                      "
        DB      0AH,0DH
        DB      0AH,0DH
        DM      "Z> MENU PAGE ONE"
        DB      0AH,0DH

        DM      "$"

MENU3:
        DB      0AH,0DH
        DM      "                       Nhodyne ESP32 IO board test PAGE 3"
        DB      0AH,0DH,0AH,0DH,0AH,0DH
;                12345678901234567890123456789012345678901234567890123456789012345678901234567890
        DM      "1>  SET HOSTNAME"
        DB      0AH,0DH
        DM      "2>  CREATE OUTGOING CONN"
        DB      0AH,0DH
        DM      "3>  SET INCOMING PORT"
        DB      0AH,0DH
        DM      "4>  OUT BYTE TO CONNECTION 0"
        DB      0AH,0DH
        DM      "5>  OUT BYTE TO CONNECTION 1"
        DB      0AH,0DH
        DM      "6>  OUT STRING TO CONNECTION 0"
        DB      0AH,0DH
        DM      "7>  OUT STRING TO CONNECTION 1"
        DB      0AH,0DH
        DM      "8>  IN BYTE FROM CONNECTION 0"
        DB      0AH,0DH
        DM      "9>  IN BYTE FROM CONNECTION 1"
        DB      0AH,0DH
        DM      "A>  QUEUE LENGTH CONNECTION 0"
        DB      0AH,0DH
        DM      "B>  QUEUE LENGTH CONNECTION 1"
        DB      0AH,0DH
        DB      0AH,0DH
        DM      "C> PLACE CONNECTION 0 IN BYTE MODE (FOR TELNET CLIENTS)"
        DB      0AH,0DH
        DB      0AH,0DH
        DM      "D> GET MOUSE"
        DB      0AH,0DH
        DB      0AH,0DH

        DM      "Z> MENU PAGE TWO"
        DB      0AH,0DH

        DM      "$"

VGA_TEST:
        DB      0AH,0DH
        DM      27,"[40;31mH",27,"[40;32mI ",27,"[40;33mF",27,"[40;34mR"
        DM      27,"[40;35mOM ",27,"[40;36mN",27,"[40;37mH",27,"[40;91mY"
        DM      27,"[40;92mO",27,"[40;93mD",27,"[40;94mY",27,"[40;95mN"
        DM      27,"[40;96mE",27,"[40;97m."
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

RESOLUTION_PROMPT:
        DB      0AH,0DH
        DM      "ENTER SCREEN RESOLUTION (2 DIGITS HEX):"
        DM      "$"
FONT_PROMPT:
        DB      0AH,0DH
        DM      "ENTER FONT (2 DIGITS HEX):"
        DM      "$"

BRUSH_PROMPT:
        DB      0AH,0DH
        DM      "ENTER BRUSH COLOR (2 DIGITS HEX):"
        DM      "$"

LINE_ENDS_PROMPT:
        DB      0AH,0DH
        DM      "ENTER LINE END TYPE (2 DIGITS HEX):"
        DM      "$"

PEN_PROMPT:
        DB      0AH,0DH
        DM      "ENTER PEN COLOR (2 DIGITS HEX):"
        DM      "$"

PEN_WIDTH_PROMPT:
        DB      0AH,0DH
        DM      "ENTER PEN WIDTH (2 DIGITS HEX):"
        DM      "$"

GLYPH_PROMPT_1:
        DB      0AH,0DH
        DM      "GLYPH BLANK? (2 DIGITS HEX):"
        DM      "$"

GLYPH_PROMPT_2:
        DB      0AH,0DH
        DM      "GLYPH BOLD? (2 DIGITS HEX):"
        DM      "$"
GLYPH_PROMPT_3:
        DB      0AH,0DH
        DM      "GLYPH DOUBLE WIDE? (2 DIGITS HEX):"
        DM      "$"
GLYPH_PROMPT_4:
        DB      0AH,0DH
        DM      "GLYPH FILL BACKGROUND (2 DIGITS HEX):"
        DM      "$"
GLYPH_PROMPT_5:
        DB      0AH,0DH
        DM      "GLYPH INVERT (2 DIGITS HEX):"
        DM      "$"
GLYPH_PROMPT_6:
        DB      0AH,0DH
        DM      "GLYPH ITALIC (2 DIGITS HEX):"
        DM      "$"
GLYPH_PROMPT_7:
        DB      0AH,0DH
        DM      "GLYPH UNDERLINE (2 DIGITS HEX):"
        DM      "$"

PALETTE_PROMPT_1:
        DB      0AH,0DH
        DM      "PALETTE INDEX (2 DIGITS HEX):"
        DM      "$"
PALETTE_PROMPT_2:
        DB      0AH,0DH
        DM      "PALETTE B  (2 DIGITS HEX):"
        DM      "$"
PALETTE_PROMPT_3:
        DB      0AH,0DH
        DM      "PALETTE G (2 DIGITS HEX):"
        DM      "$"
PALETTE_PROMPT_4:
        DB      0AH,0DH
        DM      "PALETTE R (2 DIGITS HEX):"
        DM      "$"

        INCLUDE "secrets.asm"

HOSTNAME_TEST:
        DM      "TESTHOST"
        DB      00

OUTGOING_TEST:
        DM      "192.168.0.31"
        DB      00

TELNET_CHAR_MODE:
        DM      255,251,1,255,251,3,255,252,34,0,0


PLAY_TEST:
        DM      "A4 4 2 A4 4 2 A#4 4 2 C5 4 2 C5 4 2 A#4 4 2 A4 4 2 G4 4 2 F4 4 2 F4 4 2 G4 4 2 A4 4 2 A4 2 2 G4 16 2 G4 2 2 P 8 2 "
        DB      00
SOUND_TEST:
        DB      5,0,0,0, 128,0,0,0 ,120,0, 0,1,0,0 ,4, 127, 0 ,0, 2 ,1, 0  ,1, 0 ,0


BITMAP_TEST:                    ;   RGBA, 8 bits per channel. Four bytes contains one pixel. -- LOOKS BEST IN A 64 COLOR MODE!
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 00
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff; // 10
        DB      0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 20
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 30
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 40
        DB      0x00, 0x00, 0x00, 0xff, 0xb7, 0xb5, 0xcc, 0xff, 0x00, 0x00, 0x00, 0xff, 0x80, 0x5e, 0x4d, 0xff; // 50
        DB      0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 60
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 70
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 80
        DB      0x00, 0x00, 0x00, 0xff, 0xb7, 0xb5, 0xcc, 0xff, 0x9c, 0x9a, 0xba, 0xff, 0x00, 0x00, 0x00, 0xff; // 90
        DB      0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // A0
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // B0
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // C0
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x9c, 0x9a, 0xba, 0xff, 0x9c, 0x9a, 0xba, 0xff; // D0
        DB      0xb7, 0xb5, 0xcc, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff; // E0
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff; // F0
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 100
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff; // 110
        DB      0x9c, 0x9a, 0xba, 0xff, 0x9c, 0x9a, 0xba, 0xff, 0xb7, 0xb5, 0xcc, 0xff, 0xb7, 0xb5, 0xcc, 0xff; // 120
        DB      0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff, 0xdc, 0xdb, 0xe6, 0xff, 0x00, 0x00, 0x00, 0xff; // 130
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 140
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x80, 0x5e, 0x4d, 0xff, 0x00, 0x00, 0x00, 0xff; // 150
        DB      0x00, 0x00, 0x00, 0xff, 0xb7, 0xb5, 0xcc, 0xff, 0x9c, 0x9a, 0xba, 0xff, 0x9c, 0x9a, 0xba, 0xff; // 160
        DB      0xb7, 0xb5, 0xcc, 0xff, 0xb7, 0xb5, 0xcc, 0xff, 0xdc, 0xdb, 0xe6, 0xff, 0x00, 0x00, 0x00, 0xff; // 170
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 180
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x80, 0x5e, 0x4d, 0xff, 0x00, 0x00, 0x00, 0xff; // 190
        DB      0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff, 0x9c, 0x9a, 0xba, 0xff, 0x9c, 0x9a, 0xba, 0xff; // 1A0
        DB      0x9c, 0x9a, 0xba, 0xff, 0xb7, 0xb5, 0xcc, 0xff, 0xdc, 0xdb, 0xe6, 0xff, 0x00, 0x00, 0x00, 0xff; // 1B0
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 1C0
        DB      0x00, 0x00, 0x00, 0xff, 0x80, 0x5e, 0x4d, 0xff, 0x3f, 0x2c, 0x16, 0xff, 0x00, 0x00, 0x00, 0xff; // 1D0
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x9c, 0x9a, 0xba, 0xff, 0x9c, 0x9a, 0xba, 0xff; // 1E0
        DB      0x9c, 0x9a, 0xba, 0xff, 0xdc, 0xdb, 0xe6, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00; // 1F0
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 200
        DB      0x00, 0x00, 0x00, 0xff, 0x3f, 0x2c, 0x16, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00; // 210
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x9c, 0x9a, 0xba, 0xff, 0x9c, 0x9a, 0xba, 0xff; // 220
        DB      0xb7, 0xb5, 0xcc, 0xff, 0xdc, 0xdb, 0xe6, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00; // 230
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff; // 240
        DB      0x80, 0x5e, 0x4d, 0xff, 0x3f, 0x2c, 0x16, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00; // 250
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xb7, 0xb5, 0xcc, 0xff, 0xb7, 0xb5, 0xcc, 0xff; // 260
        DB      0xdc, 0xdb, 0xe6, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 270
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff; // 280
        DB      0x80, 0x5e, 0x4d, 0xff, 0x3f, 0x2c, 0x16, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00; // 290
        DB      0x00, 0x00, 0x00, 0xff, 0xdc, 0xdb, 0xe6, 0xff, 0xdc, 0xdb, 0xe6, 0xff, 0xdc, 0xdb, 0xe6, 0xff; // 2A0
        DB      0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 2B0
        DB      0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff, 0x80, 0x5e, 0x4d, 0xff; // 2C0
        DB      0x3f, 0x2c, 0x16, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 2D0
        DB      0x00, 0x00, 0x00, 0xff, 0xdc, 0xdb, 0xe6, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff; // 2E0
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 2F0
        DB      0x00, 0x00, 0x00, 0xff, 0x80, 0x5e, 0x4d, 0xff, 0x80, 0x5e, 0x4d, 0xff, 0x3f, 0x2c, 0x16, 0xff; // 300
        DB      0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 310
        DB      0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 320
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 330
        DB      0x00, 0x00, 0x00, 0xff, 0x3f, 0x2c, 0x16, 0xff, 0x3f, 0x2c, 0x16, 0xff, 0x00, 0x00, 0x00, 0xff; // 340
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 350
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 360
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 370
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00; // 380
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 390
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 3A0
        DB      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00; // 3B0
BITMAP_TEST_END:

GLYPH_TEST:
        DB      0x07, 0xe0, 0x1f, 0xf8, 0x3f, 0xfc, 0x6d, 0xb6, 0xff, 0xff, 0x39, 0x9c, 0x10, 0x08




PARMS:
        DB      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
BUFFER:
        DB      20,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

        .END
