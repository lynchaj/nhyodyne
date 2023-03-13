;__DSKYNG DRIVERS_________________________________________________________________________________________________________________
;
; 	Nhyodyne DSKY/NG drivers
;
;	Entry points:
;               DSKY_INIT
;               DSKY_SHOW
;               DSKY_BIN2SEG
;               DSKY_RESET
;               DSKY_STAT
;               DSKY_GETKEY
;               DSKY_BEEP
;               DSKY_L1ON
;               DSKY_L2ON
;               DSKY_L1OFF
;               DSKY_L2OFF
;               DSKY_PUTLED
;               DSKY_BLANK
;________________________________________________________________________________________________________________________________
;
;
; A DSKYNG CAN SHARE A PPI BUS WITH EITHER A PPIDE OR PPISD.
;
; LED SEGMENTS (BIT VALUES)
;
;	+--01--+
;	20    02
;	+--40--+
;	10    04
;	+--08--+  80
;
; KEY CODE MAP (KEY CODES) CSCCCRRR
;                          ||||||||
;                          |||||+++-- ROW
;                          ||+++----- COL
;                          |+-------- SHIFT
;                          +--------- CONTROL
;
;	00	08	10	18	23
;	01	09	11	19	22
;	02	0A	12	1A	21
;	03	0B	13	1B	20
;	04	0C	14	1C	SHIFT
;	05	0D	15	1D	CTRL
;
; LED BIT MAP (BIT VALUES)
;
;	$08	$09	$0A	$0B	$0C	$0D	$0E	$0F
;	---	---	---	---	---	---	---	---
;	01	01	01	01	01
;	02	02	02	02	02
;	04      04      04      04	04
;	08      08      08      08	08
;	10      10      10      10	10
;	20      20      20      20	20	L1	L2 	BUZZ
;
DSKY_PPI        = $0360         ; PORT
DSKY_PPIA       = DSKY_PPI + 0  ; PORT A
DSKY_PPIB       = DSKY_PPI + 1  ; PORT B
DSKY_PPIC       = DSKY_PPI + 2  ; PORT C
DSKY_PPIX       = DSKY_PPI + 3  ; PPI CONTROL PORT
;
DSKY_PPIX_RD    = %10010010     ; PPIX VALUE FOR READS
DSKY_PPIX_WR    = %10000010     ; PPIX VALUE FOR WRITES
;
; PIO CHANNEL C:
;
;	7	6	5	4	3	2	1	0
;	RES	0	0	CS	CS	/RD	/WR	A0
;
; SETTING BITS 3 & 4 WILL ASSERT /CS ON 3279
; CLEAR BITS 1 OR 2 TO ASSERT READ/WRITE
;
DSKY_PPI_IDLE   = %00000110
;
DSKY_CMD_CLR    = %11011111     ; CLEAR (ALL OFF)
DSKY_CMD_CLRX   = %11010011     ; CLEAR (ALL ON)
DSKY_CMD_WDSP   = %10010000     ; WRITE DISPLAY RAM
DSKY_CMD_RDSP   = %01110000     ; READ DISPLAY RAM
DSKY_CMD_CLK    = %00100000     ; SET CLK PRESCALE
DSKY_CMD_FIFO   = %01000000     ; READ FIFO
;
DSKY_PRESCL     = DSKYOSC/100000; PRESCALER
;
;__DSKY_INIT_________________________________________________________________________________________
;
;  DISPLAY DSKY INFO
;____________________________________________________________________________________________________
;
DSKY_INIT:
        PRTDBG  "DSKY INIT:$"
        JSR     DSKY_PREINIT
        PRTS    "DSKY:$"
        JSR     NEWLINE

;
        PRTS    " IO=0x$"
        LDA     #>DSKY_PPI      ; GET BASE PORT
        JSR     PRTHEXBYTE      ; PRINT BASE PORT
        LDA     #<DSKY_PPI      ; GET BASE PORT
        JSR     PRTHEXBYTE      ; PRINT BASE PORT
        PRTS    " MODE=$"
        PRTS    "NG$"           ; PRINT DSKY TYPE
;
        LDA     DSKY_PRESENT    ; PRESENT?
        CMP     #$FF            ; SET FLAGS
        BEQ     DSKY_INITA
        PRTS    " NOT PRESENT$" ; NOT PRESENT
DSKY_INITA:
        JSR     NEWLINE
        RTS                     ; DONE
;
;__DSKY_PREINIT______________________________________________________________________________________
;
;  CONFIGURE PARALLEL PORT AND INITIALIZE 8279
;____________________________________________________________________________________________________
; HARDWARE RESET 8279 BY PULSING RESET LINE
DSKY_PREINIT:
; CHECK FOR PPI
        JSR     DSKY_PPIDETECT  ; TEST FOR PPI HARDWARE
        BNE     DSKY_ABORT      ; BAIL OUT IF NOT THERE

; SETUP PPI TO DEFAULT MODE
        JSR     DSKY_PPIRD
; INIT 8279 VALUES TO IDLE STATE
        LDA     #DSKY_PPI_IDLE
        STA     DSKY_PPIC
; PULSE RESET SIGNAL ON 8279
        ORA     #%10000000
        STA     DSKY_PPIC
        AND     #%01111111
        STA     DSKY_PPIC
; INITIALIZE 8279
        JSR     DSKY_REINIT
; NOW SEE IF A DSKYNG IS REALLY THERE...
        LDA     #$A5
        LDY     #$00
        JSR     DSKY_PUTBYTE
        LDY     #$00
        JSR     DSKY_GETBYTE
        CMP     #$A5
        BNE     DSKY_ABORT      ; BAIL OUT IF MISCOMPARE
        LDA     #$FF
        STA     DSKY_PRESENT
DSKY_ABORT:
        RTS
;
DSKY_REINIT:
        JSR     DSKY_PPIIDLE
; SET CLOCK SCALER TO 20
        LDA     #DSKY_CMD_CLK | DSKY_PRESCL
        JSR     DSKY_CMD
; FALL THRU
;
DSKY_RESET:
; RESET DSKY -- CLEAR RAM AND FIFO
        LDA     #DSKY_CMD_CLR
        JSR     DSKY_CMD
;
; 8259 TAKES ~160US TO CLEAR RAM DURING WHICH TIME WRITES TO
; DISPLAY RAM ARE INHIBITED.  HIGH BIT OF STATUS BYTE IS SET
; DURING THIS WINDOW.  TO PREVENT A DEADLOCK, A LOOP COUNTER
; IS USED TO IMPLEMENT A TIMEOUT.
        LDX     #0              ; TIMEOUT LOOP COUNTER
DSKY_RESET1:
        PHX                     ; SAVE COUNTER
        PLX                     ; RECOVER COUNTER
        DEX
        BNE     DSKY_RESET1     ; LOOP TILL TIMEOUT
;
DSKY_RESET2:
        RTS
;
;
;
;__DSKY_PPIDETECT____________________________________________________________________________________
;
;  PROBE FOR PPI HARDWARE
;____________________________________________________________________________________________________
;
DSKY_PPIDETECT:
;
; TEST FOR PPI EXISTENCE
; WE SETUP THE PPI TO WRITE, THEN WRITE A VALUE OF ZERO
; TO PORT A (DATALO), THEN READ IT BACK.  IF THE PPI IS THERE
; THEN THE BUS HOLD CIRCUITRY WILL READ BACK THE ZERO. SINCE
; WE ARE IN WRITE MODE, AN IDE CONTROLLER WILL NOT BE ABLE TO
; INTERFERE WITH THE VALUE BEING READ.
        JSR     DSKY_PPIWR
;
        LDA     #$00            ; VALUE ZERO
        STA     DSKY_PPIA       ; PUSH VALUE TO PORT
        LDA     DSKY_PPIA       ; GET PORT VALUE
        CMP     #$00
        RTS                     ; AND RETURN
;
        .IF     DSKY_KBD=1
;
KY_0                = $00
KY_1                = $01
KY_2                = $02
KY_3                = $03
KY_4                = $04
KY_5                = $05
KY_6                = $06
KY_7                = $07
KY_8                = $08
KY_9                = $09
KY_A                = $0A
KY_B                = $0B
KY_C                = $0C
KY_D                = $0D
KY_E                = $0E
KY_F                = $0F
KY_FW               = $10           ; FORWARD
KY_BK               = $11           ; BACKWARD
KY_CL               = $12           ; CLEAR
KY_EN               = $13           ; ENTER
KY_DE               = $14           ; DEPOSIT
KY_EX               = $15           ; EXAMINE
KY_GO               = $16           ; GO
KY_BO               = $17           ; BOOT
KY_F4               = $18           ; F4
KY_F3               = $19           ; F3
KY_F2               = $20           ; F2
KY_F1               = $21           ; F1
;
;__DSKY_STAT_________________________________________________________________________________________
;
;  CHECK FOR KEY PRESS, SAVE RAW VALUE, RETURN STATUS
;____________________________________________________________________________________________________
;
DSKY_STAT:
            LDA     DSKY_PRESENT    ; DOES IT EXIST?
            CMP     #$FF            ; SET FLAGS
            BNE     DSKY_STATA      ; ABORT WITH A=0 IF NOT THERE
            JSR     DSKY_ST
            AND     #$0F            ; ISOLATE THE CUR FIFO LEN
DSKY_STATA:
            RTS
;
;__DSKY_GETKEY_____________________________________________________________________________________
;
;  WAIT FOR A DSKY KEYPRESS AND RETURN
;____________________________________________________________________________________________________
;
DSKY_GETKEY:
            LDA     DSKY_PRESENT    ; DOES IT EXIST?
            CMP     #$FF            ; SET FLAGS
            BNE     DSKY_GETKEY1A   ; ABORT WITH A=0 IF NOT THERE
            JSR     DSKY_STAT
            BEQ     DSKY_GETKEY     ; LOOP IF NOTHING THERE
            LDA     #DSKY_CMD_FIFO
            JSR     DSKY_CMD
            JSR     DSKY_DIN
            EOR     #%11000000      ; FLIP POLARITY OF SHIFT/CTL BITS
            PHA
            AND     #$3F            ; STRIP SHIFT/CTL BITS FOR LOOKUP
            STA     DSKY_TEMP_VAL
            LDX     #0              ; INDEX
DSKY_GETKEY1:
            LDA     DSKY_KEYMAP,X
            CMP     DSKY_TEMP_VAL   ; MATCH?
            BEQ     DSKY_GETKEY2    ; FOUND, DONE
            INX
            CPX     #28
            BNE     DSKY_GETKEY1    ; LOOP UNTIL EOT
DSKY_GETKEY1A:
            PLA
            LDA     #$FF            ; NOT FOUND ERR, RETURN $FF
            RTS
DSKY_GETKEY2:
; RETURN THE INDEX POSITION WHERE THE SCAN CODE WAS FOUND
; THE ORIGINAL SHIFT/CTRL BITS ARE RESTORED
            PLA                     ; RESTORE RAW VALUE
            AND     %11000000       ; ISOLATE SHIFT/CTRL BITS
            STA     DSKY_TEMP_VAL
            TXA
            ORA     DSKY_TEMP_VAL   ; COMBINE WITH INDEX VALUE
            RTS
;
;_KEYMAP_TABLE_____________________________________________________________________________________________________________
;
DSKY_KEYMAP:
; POS	$00  $01  $02  $03  $04  $05  $06  $07
; KEY   [0]  [1]  [2]  [3]  [4]  [5]  [6]  [7]
            .BYTE   $0D, $04, $0C, $14, $03, $0B, $13, $02
;
; POS	$08  $09  $0A  $0B  $0C  $0D  $0E  $0F
; KEY   [8]  [9]  [A]  [B]  [C]  [D]  [E]  [F]
            .BYTE   $0A, $12, $01, $09, $11, $00, $08, $10
;
; POS	$10  $11  $12  $13  $14  $15  $16  $17
; KEY   [FW] [BK] [CL] [EN] [DE] [EX] [GO] [BO]
            .BYTE   $05, $15, $1D, $1C, $1B, $1A, $19, $18

; POS	$18  $19  $20  $21
; KEY   [F4] [F3] [F2] [F1]
            .BYTE   $23, $22, $21, $20

;
        .ENDIF                  ; DSKY_KBD
;
;__DSKY_BIN2SEG________________________________________________________________________________________
;
; CONVERT 32 BIT BINARY TO 8 BYTE HEX SEGMENT DISPLAY
;
; DSKY_BUF: 32 BIT BINARY
; DSKY_HEXBUF: DEST LED SEGMENT DISPLAY BUFFER (8 BYTES)
;____________________________________________________________________________________________________
;
DSKY_BIN2SEG:
        LDX     #$00
DSKY_BIN2SEG1:
        LDA     DSKY_HEXBUF,X   ; FIRST NIBBLE
        LSR     A
        LSR     A
        LSR     A
        LSR     A
        PHX                     ; STORE READ INDEX
        TAX                     ; MOVE DIGIT TO LOOKUP INDEX
        LDA     DSKY_HEXMAP,X   ; GET DECODED DIGIT INTO A
        PLX                     ; GET READ INDEX
        PHX
        PHA
        TXA
        ASL     a
        TAX
        PLA
        STA     DSKY_BUF,X      ;STORE HIGH BYTE IN OUT BUFFER
        PLX
        LDA     DSKY_HEXBUF,X   ; SECOND NIBBLE

        AND     #$0F
        PHX
        TAX
        LDA     DSKY_HEXMAP,X   ; GET DECODED DIGIT INTO A
        PLX
        PHX
        PHA
        TXA                     ; GET READ INDEX
        ASL     a
        TAX
        INX
        PLA
        STA     DSKY_BUF,X      ;STORE HIGH BYTE IN OUT BUFFER
        PLX
        INX
        CPX     #4
        BNE     DSKY_BIN2SEG1
        RTS
;
;__DSKY_SHOW___________________________________________________________________________________________
; DSKY SHOW BUFFER
;______________________________________________________________________________________________________
;
DSKY_SHOW:
        PHA
        PHX
        PHY
        LDX     #0
DSKY_SHOW1:
        LDA     DSKY_BUF,X
        PHX
        PLY
        JSR     DSKY_PUTBYTE
        INX
        CPX     #8
        BNE     DSKY_SHOW1
        PLY
        PLX
        PLA
        RTS

;______________________________________________________________________________________________________
; DSKYNG OUTPUT ROUTINES
;______________________________________________________________________________________________________

; SEND DSKY COMMAND BYTE IN REGISTER A
DSKY_CMD:
        PHA
        LDA     #$01
        JMP     DSKY_DOUT2
;
; SEND DSKY DATA BYTE IN REGISTER A
; TRASHES BC
;
DSKY_DOUT:
        PHA
        LDA     #$00
;
DSKY_DOUT2:
; SET PPI LINE CONFIG TO WRITE MODE
        JSR     DSKY_PPIWR
;
; SET ADDRESS FIRST
        ORA     #DSKY_PPI_IDLE
        STA     DSKY_PPIC
;
; ASSERT 8279 /CS
        ORA     #%00011000
        STA     DSKY_PPIC
;
; PPIC WORKING VALUE TO DSKY_TEMP_VAL
        STA     DSKY_TEMP_VAL
;
; ASSERT DATA BYTE VALUE
        PLA
        STA     DSKY_PPIA
;
; PULSE /WR
        LDA     DSKY_TEMP_VAL
        AND     #%11111101
        STA     DSKY_PPIC
        NOP                     ; MAY NOT BE NEEDED
        ORA     #%00000010
        STA     DSKY_PPIC
;
; DEASSERT /CS
        AND     #%11100111
        STA     DSKY_PPIC
;
; CLEAR ADDRESS BIT
        AND     #%11100110
        STA     DSKY_PPIC
;
; DONE
        JSR     DSKY_PPIIDLE
        RTS
;
;==================================================================================================
; DSKYNG OUTPUT ROUTINES
;==================================================================================================
;
; RETURN DSKY STATUS VALUE IN A
;
DSKY_ST:
        LDA     #$01
        JMP     DSKY_DIN2
;
; RETURN NEXT DATA VALUE IN A
;
DSKY_DIN:
        LDA     #$00
;
DSKY_DIN2:
; SET PPI LINE CONFIG TO READ MODE
        JSR     DSKY_PPIRD
;
; SET ADDRESS FIRST
        ORA     #DSKY_PPI_IDLE
        STA     DSKY_PPIC
;
; ASSERT 8279 /CS
        ORA     #%00011000
        STA     DSKY_PPIC
;
; ASSERT /RD
        AND     #%01111011
        STA     DSKY_PPIC
;
        STA     DSKY_TEMP_VAL
; GET VALUE
        LDA     DSKY_PPIA
        PHA

        LDA     DSKY_TEMP_VAL
; DEASSERT /RD
        ORA     #%00000100
        STA     DSKY_PPIC
;
; DEASSERT /CS
        AND     #%11100111
        STA     DSKY_PPIC
;
; CLEAR ADDRESS BIT
        AND     #%11100110
        STA     DSKY_PPIC
;
; DONE
        JSR     DSKY_PPIIDLE
        PLA
        RTS

;__DSKY_BLANK_____________________________________________________________________________________
;
; BLANK DSKYNG DISPLAY  (WITHOUT USING CLEAR)
;
;_________________________________________________________________________________________________
;
DSKY_BLANK:
        LDA     #DSKY_CMD_WDSP
        JSR     DSKY_CMD
        LDX     #16
DSKY_BLANK1:
        LDA     #$FF
        JSR     DSKY_DOUT
        DEX
        BNE     DSKY_BLANK1
        RTS
;
;__DSKY_PUTBYTE____________________________________________________________________________________
;
; WRITE A RAW BYTE VALUE TO DSKY DISPLAY RAM
; AT LOCATION IN REGISTER Y, VALUE IN A.
;
;__________________________________________________________________________________________________
;
DSKY_PUTBYTE:
        PHY
        PHA
        PHA
        CLC
        TYA
        ADC     #DSKY_CMD_WDSP
        TAY
        JSR     DSKY_CMD
        PLA
        EOR     #$FF
        JSR     DSKY_DOUT
        PLA
        PLY
        RTS
;
;__DSKY_GETBYTE___________________________________________________________________________________
; READ A RAW BYTE VALUE FROM DSKY DISPLAY RAM
; AT LOCATION IN REGISTER Y, VALUE RETURNED IN A
;
;_________________________________________________________________________________________________
;
DSKY_GETBYTE:
        CLC
        TYA
        ADC     #DSKY_CMD_RDSP
        TAY
        JSR     DSKY_CMD
        JSR     DSKY_DIN
        EOR     #$FF
        RTS

;
;__DSKY_PUTLED____________________________________________________________________________________
;
;	This function is intended to update the LEDs.
;	VALUES SHOULD BE IN DSKY_BUF
;_________________________________________________________________________________________________
;
DSKY_PUTLED:
        PHX
        PHY
        PHA
        LDY     #$00
        LDX     #$00
DSKY_PUTLED_1:
        LDA     DSKY_BUF,X      ; GET BYTE
        JSR     DSKY_PUTBYTE    ; SEND IT TO DSKY
        INY                     ; LOOP TIL DONE
        INX
        CPY     #8
        BNE     DSKY_PUTLED_1
        PLA                     ; RESTORE REGISTERS
        PLY
        PLX
        RTS
;
;__DSKY_BEEP______________________________________________________________________________________
;	This function is intended to beep the speaker on the DSKY
;_________________________________________________________________________________________________
;
DSKY_BEEP:
        PHY
        PHX
        PHA
        LDY     #$0F
        JSR     DSKY_GETBYTE
        ORA     #$20
        LDA     #$20
        LDY     #$0F
        JSR     DSKY_PUTBYTE

;;; 	timer . . .
        LDX     #$8F
        LDY     #$FF
DSKY_BEEP1:
        DEY
        BNE     DSKY_BEEP1
        DEX
        BNE     DSKY_BEEP1

        LDY     #$0F
        JSR     DSKY_GETBYTE
        AND     #$DF
        LDA     #$DF
        LDY     #$0F
        JSR     DSKY_PUTBYTE

        PLA
        PLX
        PLY
        RTS
;
;__DSKY_L1ON______________________________________________________________________________________
;	This function is intended to turn on DSKY L1
;_________________________________________________________________________________________________
;
DSKY_L1ON:
        PHY
        PHA
        LDY     #$0D
        JSR     DSKY_GETBYTE
        ORA     #$20
        LDY     #$0D
        JSR     DSKY_PUTBYTE
        PLA
        PLY
        RTS
;
;__DSKY_L2ON______________________________________________________________________________________
;	This function is intended to turn on DSKY L2
;_________________________________________________________________________________________________
;
DSKY_L2ON:
        PHY
        PHA
        LDY     #$0E
        JSR     DSKY_GETBYTE
        ORA     #$20
        LDY     #$0E
        JSR     DSKY_PUTBYTE
        PLA
        PLY
        RTS
;
;__DSKY_L1OFF_____________________________________________________________________________________
;	This function is intended to turn off DSKY L1
;_________________________________________________________________________________________________
;
DSKY_L1OFF:
        PHY
        PHA
        LDY     #$0D
        JSR     DSKY_GETBYTE
        AND     #$DF
        LDY     #$0D
        JSR     DSKY_PUTBYTE
        PLA
        PLY
        RTS
;
;__DSKY_L2OFF_____________________________________________________________________________________
;	This function is intended to turn off DSKY L2
;_________________________________________________________________________________________________
;
DSKY_L2OFF:
        PHY
        PHA
        LDY     #$0E
        JSR     DSKY_GETBYTE
        AND     #$DF
        LDY     #$0E
        JSR     DSKY_PUTBYTE
        PLA
        PLY
        RTS
;
;_________________________________________________________________________________________________
; DSKYNG LINE CONTROL ROUTINES
;
; SETUP PPI FOR WRITING: PUT PPI PORT A IN OUTPUT MODE
; AVOID REWRTING PPIX IF ALREADY IN OUTPUT MODE
;
;_________________________________________________________________________________________________
;
DSKY_PPIWR:
        PHA
;
; CHECK FOR WRITE MODE
        LDA     DSKY_PPIX_VAL
        CMP     #DSKY_PPIX_WR
        BEQ     DSKY_PPIWR1
;
; SET PPI TO WRITE MODE
        LDA     #DSKY_PPIX_WR
        STA     DSKY_PPIX
        STA     DSKY_PPIX_VAL
;
; RESTORE PORT C (MAY NOT BE NEEDED)
        LDA     #DSKY_PPI_IDLE
        STA     DSKY_PPIC
;
DSKY_PPIWR1:
;
        PLA
        RTS
;
; SETUP PPI FOR READING: PUT PPI PORT A IN INPUT MODE
; AVOID REWRTING PPIX IF ALREADY IN INPUT MODE
;
DSKY_PPIRD:
        PHA
;
; CHECK FOR READ MODE
        LDA     DSKY_PPIX_VAL
        CMP     #DSKY_PPIX_RD
        BEQ     DSKY_PPIRD1
;
; SET PPI TO READ MODE
        LDA     #DSKY_PPIX_RD
        STA     DSKY_PPIX
        STA     DSKY_PPIX_VAL
;
DSKY_PPIRD1:
        PLA
        RTS
;
; RELEASE USE OF PPI
;
DSKY_PPIIDLE:
        JMP     DSKY_PPIRD      ; SAME AS READ MODE
;
;__STORAGE_________________________________________________________________________________________
; CODES FOR NUMERICS
; HIGH BIT ALWAYS CLEAR TO SUPPRESS DECIMAL POINT
; SET HIGH BIT TO SHOW DECIMAL POINT
;_________________________________________________________________________________________________
;
DSKY_HEXMAP:
        .BYTE   $3F             ; 0
        .BYTE   $06             ; 1
        .BYTE   $5B             ; 2
        .BYTE   $4F             ; 3
        .BYTE   $66             ; 4
        .BYTE   $6D             ; 5
        .BYTE   $7D             ; 6
        .BYTE   $07             ; 7
        .BYTE   $7F             ; 8
        .BYTE   $67             ; 9
        .BYTE   $77             ; A
        .BYTE   $7C             ; B
        .BYTE   $39             ; C
        .BYTE   $5E             ; D
        .BYTE   $79             ; E
        .BYTE   $71             ; F
;
DSKY_TEMP_VAL:
        .BYTE   0
DSKY_PPIX_VAL:
        .BYTE   0
DSKY_PRESENT:
        .BYTE   0
