;________________________________________________________________________________________________________________________________
;
;	Nhyodyne return to CP/M
;
;  This program assumes that DOS/65 was started with a CP/M TPA command and that
;  the program counter is somewhere in the first 32 bytes of the TPA
;
;  DWERNER 12/30/2021
;________________________________________________________________________________________________________________________________

PEM             = $103          ;PEM ENTRY
CPUTOGGLE       = $03FF         ;TOGGLE CPUS
CPMTPA          = $8100         ; $100 in z80 address space

        .SEGMENT "TEA"
        .ORG    $0800

        LDA     #<MSG
        LDY     #>MSG
        LDX     #9              ; intro message
        JSR     PEM

        LDX     #$00
LOOP:   ; COPY Z80 INIT CODE (256 BYTES)
        LDA     Z80CODE,X
        STA     CPMTPA,X
        INX
        CPX     #$00
        BNE     LOOP
        LDA     CPUTOGGLE       ; BACK TO Z80

; PRAYER HAPPENS HERE :)

Z80CODE:
; HERE IS A Z80 PROGRAM TO RESET THE SYSTEM TO ENSURE A SANE CP/M CONTEXT
; FIRST SOME NOPS, BECAUSE WE CANNOT BE 100% SURE OF THE Z80'S PROGRAM COUNTER
;
        .BYTE   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .BYTE   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .BYTE   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .BYTE   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
; THEN JUMP TO $A000
        .BYTE   $C3,$00,$A0     ; JP    $A000
        .BYTE   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        .BYTE   0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0



; MORE Z80 CODE GOES HERE, THIS IS IN Z80 HIGH RAM ($A000)
; SHOULD BE A SAFE AREA TO SWAP IN THE ROM AND CALL THE REBOOT VECTOR
        .SEGMENT "CPMDATA"
        .ORG    $2000
        .BYTE   $3e,$00         ; LD	A,00H           SWITCH IN ROM PAGE, ENABLE LOWER ROM PAGE
        .BYTE   $d3,$78         ; OUT	(MPCL_RAM),A	FIRST, SWITCH OUT LOWER RAM PAGE (NO BUS CONTENTION)
        .BYTE   $00             ; NOP
        .BYTE   $00             ; NOP
        .BYTE   $00             ; NOP
        .BYTE   $d3,$7c         ; OUT	(MPCL_ROM),A	SEND TO PORT MAPPER, SWITCH IN LOWER ROM PAGE
        .BYTE   $00             ; NOP
        .BYTE   $00             ; NOP
        .BYTE   $00             ; NOP
        .BYTE   $C3,$00,$00     ; JP    $0000



MSG:
        .BYTE   "RETURNING TO ROMWBW CP/M$"
