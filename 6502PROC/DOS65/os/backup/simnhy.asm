;________________________________________________________________________________________________________________________________
;
; Nhyodyne dos / 65 system interface module (sim)
;
; DWERNER 12 / 20 / 2021 ported to Nhyodyne
;________________________________________________________________________________________________________________________________

        .INCLUDE "MACRO.ASM"
DO_FARCALL      = farcall - md_pagecode + $0200

;dos / 65 system interface module (sim)
;version 3.00
;this version is designed to work with the N8VEM Host Processor

;fixed parameters
simstart:

;my system i / o routines in rom
nsects          = (simstart - ccm) / 128;number sectors

;main program
;jump vector used by pem
sim:
        JMP     boot            ;from cold start
wboote:
        JMP     wboot           ;from warm boot
        JMP     consts          ;check for input
        JMP     conrde          ;get input
        JMP     conwrt          ;send to terminal
        JMP     prnwrt          ;printer output
        JMP     punwrt          ;punch output
        JMP     rdrinp          ;reader input
        JMP     home            ;home drive
        JMP     seldsk          ;select disk
        JMP     seltrk          ;set track
        JMP     selsec          ;set sector
        JMP     setdma          ;set buffer address
        JMP     read            ;read sector
        JMP     write           ;write sector
        LDA     #1              ;printer always ready
        RTS
        JMP     rdtime          ;clock entry
        JMP     xlate           ;translate

;console definition block
sysdef:
        .BYTE   8               ;backspace
        .BYTE   1               ;clear to end of line
        .BYTE   $c              ;forward space
        .BYTE   0               ;normal video
        .BYTE   '^'             ;invert video
        .BYTE   24              ;lines per screen
        .BYTE   80              ;char per line
        .BYTE   $c              ;formfeed
        .BYTE   $1e             ;home
        .BYTE   2               ;clear to end of screen

;opening id message
opnmsg:
        .BYTE   cr, lf

        .BYTE   "d8888b.  .d88b.  .d8888.    dD     ooooo", cr, lf
        .BYTE   "88  `8D .8P  Y8. 88'  YP   d8'    8P~~~~", cr, lf
        .BYTE   "88   88 88    88 `8bo.    d8'    dP", cr, lf
        .BYTE   "88   88 88    88   `Y8b. d8888b. V8888b.", cr, lf,0
opnmsg1:
        .BYTE   "88  .8D `8b  d8' db   8D 88' `8D     `8D ", cr, lf
        .BYTE   "Y8888D'  `Y88P'  `8888Y' `8888P  88oobY'", cr, lf
        .BYTE   17, "DOS / 65 ON THE NHYODYNE 3.00", cr, lf, 0


;cold entry from loader
boot:
        SEI                     ; DISABLE INTERRUPTS
        LDX     #$ff            ;set stack
        TXS                     ;pointer
        CLD                     ;set binary mode

        JSR     PAGER_INIT      ;setup paging for device drivers

        PRTDBG  "OS Starting$"

        LDA     #<opnmsg        ;point to message
        LDY     #>opnmsg
        JSR     outmsg          ;send it
        LDA     #<opnmsg1
        LDY     #>opnmsg1
        JSR     outmsg          ;send it

        JSR     NEWLINE

; setup diskconfig table
        LDX     #0
@2:
        LDA     dftdskcfg, x
        STA     dskcfg, x
        INX
        CPX     #$10
        BNE     @2

        PRTDBG  "DISK CFG TABLE COPIED$"

        LDA     #0              ;set zero
        JSR     seldsk          ;and select drive zero

        LDA     #22             ;MD_SHOW
        STA     farfunct
        JSR     DO_FARCALL

        LDA     #25             ;FD_INIT
        STA     farfunct
        JSR     DO_FARCALL

        LDA     #04             ;PPIDE_INIT
        STA     farfunct
        JSR     DO_FARCALL

        .IF     USEDSKYNG=1 || USEDSKY=1
            LDA     #07             ;DSKY_INIT
            STA     farfunct
            JSR     DO_FARCALL

            LDX     #$00
@1:
            LDA     DOS65DSKYINIT, X
            STA     DSKY_BUF, X
            INX
            CPX     #8
            BNE     @1
            LDA     #08             ;DSKY_SHOW
            STA     farfunct
            JSR     DO_FARCALL

            LDA     #13             ;DSKY_BEEP
            STA     farfunct
            JSR     DO_FARCALL
.ENDIF

            LDA     #<cnstxt        ; STORE POINTER TO COMMAND LINE
            STA     cmdlnp
            LDA     #>cnstxt
            STA     cmdlnp + 1

            LDA     #<dskcfg        ; STORE POINTER TO DISK CONFIG TABLE FOR APPS
            STA     dskcfpc
            LDA     #>dskcfg
            STA     dskcfpc + 1
            JSR     DSPL_DSK_CFG    ; DISPLAY DISK CONFIG TO USERS


;set up jumps into dos / 65 in page one
setup:
            JSR     PAGER_INIT
            LDX     #0              ;clear index
;first clear key dba variables
            STX     hstact          ;host buffer inactive
            STX     unacnt          ;clear unalloc count
setupl:
            LDA     inttbl, x       ;get byte
            STA     $100, x         ;insert at start
            INX
            CPX     #6
            BNE     setupl          ;loop until done
            LDA     #<dflbuf        ;get low buffer
            LDY     #>dflbuf        ;and high
            JSR     setdma          ;and set
            LDA     sekdsk          ;get disk

            LDA     #DEFDRV         ;set zero
            JSR     seldsk          ;and select drive zero
            JSR     home            ;home that drive

            PRTDBG  "Start CCM$"
            LDA     #DEFDRV         ;set zero
            JMP     ccm             ;and go to ccm
;initialization table
inttbl:
            .BYTE   $4c, <wboote, >wboote, $4c, <pem, >pem
;warm boot - read dos / 65 back except sim and then
; jump to ccm.


wboot:
            SEI                     ; DISABLE INTERRUPTS
            LDX     #$ff            ;set stack
            TXS                     ;pointer
            CLD                     ;set binary mode

            JMP     setup           ;go setup



;__SELDSK_________________________________________________________________________________________________
;
; PERFORM DOS / 65 DISK DRIVE SELECT
;________________________________________________________________________________________________________
;select disk
seldsk:
            AND     #7              ;three lsbs only
            STA     sekdsk          ;save for later
            LDA     sekdsk          ;save for later
            ASL     a               ;multiply by two
            TAX                     ;make an Index
            LDA     dcbtbl, x       ;get address
            LDY     dcbtbl + 1, x
            RTS

;table of dcb addresses
dcbtbl:
            .WORD   dcba            ; A
            .WORD   dcbb            ; B
            .WORD   dcbc            ; C
            .WORD   dcbd            ; D
            .WORD   dcbe            ; E
            .WORD   dcbf            ; F
            .WORD   dcbg            ; G
            .WORD   dcbh            ; H

;__HOME__________________________________________________________________________________________________
;
; PERFORM DOS / 65 HEAD HOME
;________________________________________________________________________________________________________
home:
            LDA     #$00
            LDY     #$00

;__SELTRK________________________________________________________________________________________________
;
; PERFORM DOS / 65 SELECT TRACK
;
; A=TRACK LOW BYTE
; Y=TRACK HIGH BYTE
;________________________________________________________________________________________________________
seltrk:
            CLC
            STA     sektrk          ;save number
            STY     sektrk + 1
            RTS

;__SELSEC________________________________________________________________________________________________
;
; PERFORM DOS / 65 SECTOR SELECT
;
; A=SECTOR LOW BYTE
; Y=SECTOR HIGH BYTE
;________________________________________________________________________________________________________
selsec:
            STA     seksec          ;save low and high
            STY     seksec + 1
            RTS

;__READ__________________________________________________________________________________________________
;
; PERFORM DOS / 65 SECTOR READ
;________________________________________________________________________________________________________
read:
            JSR     GET_DRIVE_DEVICE;
            AND     #$F0            ; only want first nybble
            CMP     #$00
            BNE     :+              ; not MD drive
;RAM
            LDA     #20             ;MD_READ_SECTOR
            STA     farfunct
            JSR     DO_FARCALL
            JMP     MOVEBUFTODMA
:
            CMP     #$20
            BNE     :+              ; not floppy drive
;FD
            LDA     #23             ;FD_READ_SECTOR
            STA     farfunct
            JSR     DO_FARCALL
            JMP     MOVEBUFTODMA
            RTS                     ;
:
            CMP     #$30
            BNE     :+              ; invalid drive
;PPIDE
            LDA     #05             ;IDE_READ_SECTOR
            STA     farfunct
            JSR     DO_FARCALL
            JMP     MOVEBUFTODMA
:
            LDA     #$FF            ; signal error
            RTS                     ;


;__WRITE_________________________________________________________________________________________________
;
; PERFORM DOS / 65 SECTOR WRITE
;________________________________________________________________________________________________________
write:
            JSR     GET_DRIVE_DEVICE;
            JSR     MOVEDMATOBUF

            AND     #$F0            ; only want first nybble

            CMP     #$00
            BNE     :+              ; not MD Drive
;MD
            LDA     #21             ;MD_WRITE_SECTOR
            STA     farfunct
            JMP     DO_FARCALL
:
            CMP     #$20
            BNE     :+              ; not floppy drive
;FD
            LDA     #24             ;FD_WRITE_SECTOR
            STA     farfunct
            JMP     DO_FARCALL
:
            CMP     #$30
            BNE     writex          ; not ppide
;PPIDE
            LDA     #06             ;IDE_WRITE_SECTOR
            STA     farfunct
            JMP     DO_FARCALL
writex:
            LDA     #$FF            ; signal error
            RTS                     ;


;__SETDMA________________________________________________________________________________________________
;
; PERFORM DOS / 65 BUFFER ADDRESS SELECTION
;
; A=BUFFER LOW BYTE
; Y=BUFFER HIGH BYTE
;________________________________________________________________________________________________________
setdma:
            STA     dmaadr          ;store low
            STY     dmaadr + 1      ;and high
            RTS


;__CONSTS________________________________________________________________________________________________
;
; GET DOS / 65 CONSOLE STATUS
;________________________________________________________________________________________________________
consts:
            LDA     #03
            STA     farfunct
            JMP     DO_FARCALL

;__CONRDE________________________________________________________________________________________________
;
; PERFORM DOS / 65 CONSOLE READ
;________________________________________________________________________________________________________
conrde:
            LDA     #02
            STA     farfunct
            JMP     DO_FARCALL


;__CONWRT________________________________________________________________________________________________
;
; PERFORM DOS / 65 CONSOLE WRITE
;________________________________________________________________________________________________________
conwrt:
            PHA
            LDA     #00
            STA     farfunct
            PLA
            JMP     DO_FARCALL

prnwrt:
            RTS                     ;printer
punwrt:
            RTS                     ;punch output
rdrinp:
            RTS                     ;reader input
rdtime:
            RTS                     ;read clock
xlate:
            RTS                     ;sector translate


;__OUTMSG________________________________________________________________________________________________
;
; WRITE A NULL TERMINATED STRING TO THE CONSOLE
;
; A=POINTER LOW BYTE
; Y=POINTER HIGH BYTE
;________________________________________________________________________________________________________
outmsg:     ;output message
            STA     OUTMSG_W
            STY     OUTMSG_W + 1
            LDY     #$00
OUTSTRLP:
            LDA     (OUTMSG_W), Y   ; LOAD NEXT CHAR FROM STRING INTO ACC
            CMP     #$00            ; IS NULL?
            BEQ     ENDOUTSTR       ; YES, END PRINT OUT
            JSR     conwrt          ; PRINT CHAR IN ACC
            INY                     ; Y=Y + 1 (BUMP INDEX)
            JMP     OUTSTRLP        ; DO NEXT CHAR
ENDOUTSTR:
            RTS                     ; RETURN

;___GET_DRIVE_DEVICE_____________________________________________________________________________________
;
; GET SELECTED DEVICE TYPE AND UNIT, RETURN IN "A"
;
;________________________________________________________________________________________________________
GET_DRIVE_DEVICE:
            TXA
            PHA
            LDA     sekdsk          ; GET DRIVE
            AND     #7              ; ONLY FIRST 8 DEVICES SUPPORTED
            ASL     a               ; DOUBLE NUMBER FOR TABLE LOOKUP
            TAX                     ; MOVE TO X REGISTER
            LDA     dskcfg, X       ; GET device
; SETUP FLOPPY CONTROL WHILE WE ARE HERE
            AND     #$01
            CMP     #$00
            BNE     :+
            LDA     #%00010000
            STA     DSKUNIT
            JMP     GET_DRIVE_DEVICE_1
:
            LDA     #%00100001
            STA     DSKUNIT
GET_DRIVE_DEVICE_1:
            LDA     dskcfg, X       ; GET device
            STA     STACKA
            PLA
            TAX
            LDA     STACKA
            RTS

;___DSPL_DSK_CFG_________________________________________________________________________________________
;
; DISPLAY THE DISK CONFIGURATION FOR THE USER
;
;________________________________________________________________________________________________________
DSPL_DSK_CFG:
            JSR     NEWLINE
            PRTS    "DISK   Configuration:$"
            JSR     NEWLINE
            LDX     #0
DSPL_DSK_CFG_1:
            PRTS    " $"            ; MAKE IT PRETTY :)
            TXA
            LSR     A
            CLC
            ADC     #'A'
            JSR     conwrt
            LDA     #':'
            JSR     conwrt
            LDA     #'='
            JSR     conwrt
            JSR     prtdevice       ; PRINT DEVICE NAME FROM TABLE (X)
            LDA     #':'
            JSR     conwrt
            INX                     ; WANT SECOND BYTE OF ENTRY
            LDA     dskcfg, x       ; GET SLICE
            JSR     PRTDEC          ; PRINT SLICE IN DECIMAL (A)
            INX
            JSR     NEWLINE
            CPX     #16
            BNE     DSPL_DSK_CFG_1
            RTS

; DEVICE TABLE:
; $00 MD
; $2x FLOPPY
; $3x IDE
prtdevice:
            LDA     dskcfg, X       ; GET DEVICE TYPE
            PHA
            AND     #$F0            ; FILTER OUT UNIT
            CMP     #$00
            BNE     prtdevice1
            PRTS    "MD$"
            JMP     prtdevice_done
prtdevice1:
            CMP     #$10
            BNE     prtdevice2
            PRTS    "UNK$"
            JMP     prtdevice_done
prtdevice2:
            CMP     #$20
            BNE     prtdevice3
            PRTS    "FD$"
            JMP     prtdevice_done
prtdevice3:
            CMP     #$30
            BNE     prtdevicex
            PRTS    "PPIDE$"
            JMP     prtdevice_done
prtdevicex:
            PRTS    "UNK$"
prtdevice_done:
            PLA
            AND     #$0F            ; FILTER OUT DEVICE
            JSR     PRTDEC
            RTS

            .INCLUDE "dospager.asm"
; - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
;___MOVEBUFTODMA_________________________________________________________________________________________
;
; MOVE BUFFER TO DMA
;
;________________________________________________________________________________________________________
MOVEBUFTODMA:
            PHA
            LDA     #$00            ;
            STA     SRC
            LDA     #>MD_PAGEBU     ;
            STA     SRC + 1         ;
            LDA     dmaadr          ;
            STA     DEST            ;
            LDA     dmaadr + 1      ;
            STA     DEST + 1        ;
            JSR     COPY_DOS_SECTOR ;
            PLA
            RTS

;___MOVEDMATOBUF_________________________________________________________________________________________
;
; MOVE DMA TO BUFFER
;
;________________________________________________________________________________________________________
MOVEDMATOBUF:
            PHA
            LDA     #$00            ;
            STA     DEST
            LDA     #>MD_PAGEBU     ;
            STA     DEST + 1        ;
            LDA     dmaadr          ;
            STA     SRC             ;
            LDA     dmaadr + 1      ;
            STA     SRC + 1         ;
            JSR     COPY_DOS_SECTOR ;
            PLA
            RTS



;___COPY_DOS_SECTOR______________________________________________________________________________________
;
; COPY 128 BYTE SECTOR FOR DOS / 65
;
;________________________________________________________________________________________________________
COPY_DOS_SECTOR:
            PHA
            TYA
            PHA
            LDY     #$00            ;
COPY_DOS_SECTOR1:
            LDA     (SRC), Y        ;
            STA     (DEST), Y       ;
            INY                     ;
            TYA                     ;
            CMP     #$80            ;
            BNE     COPY_DOS_SECTOR1;
            PLA
            TAY
            PLA
            RTS

DOS65DSKYINIT:
            .BYTE   $54, $6E, $5C, $5E, $6E, $54, $79, $40

;disk control blocks
dcba:
            .WORD   127             ;max block number
            .WORD   64              ;sectors per track
            .WORD   0               ;number system tracks
            .BYTE   1               ;block size = 2048
            .WORD   255             ;max directory number
            .WORD   almpa           ;address of map for a
            .BYTE   00              ;do checksums
            .WORD   ckmp            ;checksum map
dcbb:
            .WORD   191             ;max block number
            .WORD   64              ;sectors per track
            .WORD   0               ;number system tracks
            .BYTE   1               ;block size = 2048
            .WORD   155             ;max directory number
            .WORD   almpb           ;address of map for b
            .BYTE   00              ;do checksums
            .WORD   ckmp            ;checksum map
dcbc:
            .WORD   2047            ;max block number
            .WORD   64              ;sectors per track
            .WORD   16              ;number system tracks
            .BYTE   2               ;block size = 4096
            .WORD   511             ;max directory number
            .WORD   almpc           ;address of map for C
            .BYTE   0               ;do checksums
            .WORD   ckmp            ;checksum map
dcbd:
            .WORD   350             ;max block number
            .WORD   36              ;sectors per track
            .WORD   4               ;number system tracks
            .BYTE   1               ;block size = 2048
            .WORD   127             ;max directory number
            .WORD   almpd           ;address of map for d
            .BYTE   0               ;do checksums
            .WORD   ckmp            ;checksum map
dcbe:
            .WORD   350             ;max block number
            .WORD   36              ;sectors per track
            .WORD   4               ;number system tracks
            .BYTE   1               ;block size = 2048
            .WORD   127             ;max directory number
            .WORD   almpe           ;address of map for e
            .BYTE   0               ;do checksums
            .WORD   ckmp            ;checksum map
dcbf:
            .WORD   2047            ;max block number
            .WORD   64              ;sectors per track
            .WORD   16              ;number system tracks
            .BYTE   2               ;block size = 4096
            .WORD   511             ;max directory number
            .WORD   almpf           ;address of map for f
            .BYTE   0               ;do checksums
            .WORD   ckmp            ;checksum map
dcbg:
            .WORD   2047            ;max block number
            .WORD   64              ;sectors per track
            .WORD   16              ;number system tracks
            .BYTE   2               ;block size = 4096
            .WORD   511             ;max directory number
            .WORD   almpg           ;address of map for g
            .BYTE   0               ;do checksums
            .WORD   ckmp            ;checksum map
dcbh:
            .WORD   2047            ;max block number
            .WORD   64              ;sectors per track
            .WORD   16              ;number system tracks
            .BYTE   2               ;block size = 4096
            .WORD   511             ;max directory number
            .WORD   almph           ;address of map for h
            .BYTE   0               ;do checksums
            .WORD   ckmp            ;checksum map

;data area

hstwrt:
            .BYTE   0               ;0=written, 1=pending host write
debtmp:
            .WORD   0               ; DEBLOCK TEMP VAR
hstact:
            .BYTE   0               ;host active flag
unacnt:
            .BYTE   0               ;unalloc rec cnt


;allocation maps
almpa:
            .RES    254
almpb:
            .RES    254
almpc:
            .RES    254
almpd:
            .RES    254
almpe:
            .RES    254
almpf:
            .RES    254
almpg:
            .RES    254
almph:
            .RES    254
;checksum maps - not used
ckmp:
            .RES    128

dftdskcfg:
            .BYTE   $00, $00        ; disk A: unit, slice (invalid for floppy and RAM disks)
            .BYTE   $01, $00        ; disk B: unit, slice (invalid for floppy and RAM disks)
            .BYTE   $30, $06        ; disk C: unit, slice
            .BYTE   $20, $00        ; disk D: unit, slice
            .BYTE   $21, $00        ; disk E: unit, slice
            .BYTE   $30, $03        ; disk F: unit, slice
            .BYTE   $30, $04        ; disk G: unit, slice
            .BYTE   $30, $00        ; disk H: unit, slice
