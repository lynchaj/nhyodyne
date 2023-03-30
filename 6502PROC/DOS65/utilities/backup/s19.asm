;FIXED PARAMETERS
DFLFCB          = $107          ;DEFAULT FCB
PEM             = $103          ;PEM ENTRY
BOOT            = $100          ;WARM BOOT
TEA             = $800          ;EXECUTION ORG
CCMLNG          = 2048          ;CCM LENGTH
;MAIN PROGRAM
        .SEGMENT "TEA"
        .ORG    $0800

        LDY     #$00
LOOP:
        LDA     START,Y
        STA     $0700,Y
        INY
        CPY     #$20
        BNE     LOOP
        JMP     $0700
START:
        LDA     #$00
        STA     $0378
        NOP
        NOP
        STA     $037C
        JSR     $FFF0           ; CALL S19 LOADER FROM BIOS
        LDA     #$80
        STA     $037C
        LDA     #$8E
        STA     $0378
        JMP     BOOT
        .END
