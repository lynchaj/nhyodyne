
;__MONITOR_______________________________________________________
; This is a simple monitor program that can be uploaded to the MBC
; from Z80 mode.
;
; It assumes that the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
; If the SBC is the only CPU in the system, ensure that jumpers
; J1 and J2 are set for 1&2.   Then burn ROM.BIN into EPROM.
;
; If the SBC is secondary to a Z80, the monitor.com file can be run from CP/M or the
; monitor.hex file can be loaded from the monitor. Ensure that jumpers J1 and J4
; are set for 2&3, the 6502 toggle IO address is set for $FF and
; the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
;
; to run from the MBC Z80 monitor
;
; first set the MPCL to allow RAM in the low bank
; >O 7C 80
; >O 78 80
;
; then load the .HEX file.
; >L
;
;
; Finally transfer control to the 65C02 by reading the toggle register
; >I FF
;
; The '02 should reset and run this program
;
;__________________________________________________________________________________________________
;
; DATA CONSTANTS
;__________________________________________________________________________________________________
;REGISTER		IO PORT		; FUNCTION
farfunct	=   $32         ;function to call in driver area
IRQVECTOR   =  	$35   		; VECTOR FOR USER IRQ RTN
NMIVECTOR   =  	$37   		; VECTOR FOR USER IRQ RTN
WORKPTR		=  	$39			; WORK POINTER FOR COMMAND PROCESSOR
JUMPPTR		=	$3B			; JUMP VECTOR FOR LOOKUP TABLE
TEMPWORD	=	$3D			;
TEMPWORD1	=  	$3F			;
TEMPWORD2	=  	$40			;

TEMPBYTE	=	$42			;
ACC      	=  	$43			; ACC STORAGE
XREG     	=  	$44 		; X REG STORAGE
YREG     	=  	$45 		; Y REG STORAGE
PREG     	=  	$46 		; CURRENT STACK POINTER
PCL      	=  	$47 		; PROGRAM COUNTER LOW
PCH      	=  	$48 		; PROGRAM COUNTER HIGH
SPTR     	=  	$49 		; CPU STATUS REGISTER
CKSM		=	$4A			; CHECKSUM
BYTECT		=	$4B			; BYTE COUNT
STRPTR	 	=	$4C			;
COUNTER	 	=	$4E			;
SRC	 		=	$50			;
DEST	 	=	$52			;
INBUFFER	=	$0200		;
IO          =   $0300       ; 0300-03FF Memory mapped IO
MPCL_ROM	=	$037C		; ROM MAPPER
MPCL_RAM	=	$0378		; RAM MAPPER

MD_PAGEBU   =   $0400       ; 0400-04FF PAGE BUFFER ADDRESS
memmovr     =	$0500		; 0200-02ff subr to move data from ram/rom disks
MD_PAGERA   =   $0500       ; PAGE DRIVER ADDRESS
MD_PAGESE   =   $14	      	; PAGE SECTOR STORAGE
BANKED_DRIVER_DISPATCHER=$8800  ; LOCATION OF DRIVER DISPATCHER
ROMDRIVERS 	= 1
RAMDRIVERS 	= 0
ROMRAMDRIVERS 	= 0

; UART 16C550 SERIAL -- Assumes IO is in page $03 -- DIP Switch settings $83
UART0       =  	$0368       ; DATA IN/OUT
UART1       =  	$0369       ; CHECK RX
UART2       =  	$036A       ; INTERRUPTS
UART3       =  	$036B       ; LINE CONTROL
UART4       =  	$036C       ; MODEM CONTROL
UART5       =  	$036D       ; LINE STATUS
UART6       =  	$036E       ; MODEM STATUS
UART7	    =  	$036F       ; SCRATCH REG.

				.PC02
                .segment "TROM"

;__COLD_START___________________________________________________
;
; PERFORM SYSTEM COLD INIT
;
;_______________________________________________________________
COLD_START:
		SEI 				; DISABLE INTERRUPTS
        CLD					;  VERIFY DECIMAL MODE IS OFF
        LDX   #$FF          ;
        TXS                 ; CLEAR STACK
		txa

		LDA <IRQROUTINE
		STA IRQVECTOR
		STA NMIVECTOR
		LDA >IRQROUTINE
		STA IRQVECTOR+1
		STA NMIVECTOR+1

		JSR INIT_SERIAL
		JSR PAGER_INIT

	  	LDA #<STARTUP		; OUTPUT STARTUP STRING
        STA STRPTR			;
        LDA #>STARTUP		;
        STA STRPTR+1		;
        JSR OUTSTR			;

		LDA #$00			;
		STA INBUFFER		; MAKE SURE INPUT BUFFER IS EMPTY
							;
        BRK					; PERFORM BRK (START MONITOR)

;__BRKROUTINE___________________________________________________
;
; HANDLE CPU BRK INTERRUPT PROCESING AND START MONITOR
;
;_______________________________________________________________
BRKROUTINE:
							; MONITOR'S BREAK HANDLER
		CLC
        PLA  				;
        TAX           		; LOW BYTE OF PC
        PLA 				;
		TAY					; HIGH BYTE OF PC
		SEC					;
		TXA					;
        SBC   #$02     		; REMOVE BREAK INSTRUCTION
        STA   PCL     		;
        BCS   BRK2     		;
        DEY
BRK2:
		STY   PCH       	; SAVE PCH
        TSX                 ; GET STACK POINTER
        STX   SPTR          ; SAVE STACK POINTER
        JSR   PRINT_REG     ; DUMP REGISTER CONTENTS
        LDX   #$FF          ;
        TXS                 ; CLEAR STACK
        CLI                 ; ENABLE INTERRUPTS AGAIN
        JMP   COMMAND_PROCESSOR 	; START THE MONITOR


;__IRQROUTINE___________________________________________________
;
; HANDLE INTERRUPT PROCESING
;
;_______________________________________________________________
IRQROUTINE:
        CLI                 ; ENABLE INTERRUPTS AGAIN
		RTI

;__INTERRUPT____________________________________________________
;
; HANDLE IRQ INTERRUPT AND DETERMINE IF IT IS A BRK OR AN IRQ
;
;_______________________________________________________________
INTERRUPT:
		SEI 				; DISABLE INTERRUPTS
		STY	YREG			; SAVE Y
       	STX	XREG    		; SAVE X
		STA	ACC       		; SAVE A
		PLA					; GET STATUS REGISTER
		STA	PREG			; SAVE STATUS REGISTER
       	AND #$10      	    ; MASK BRK
       	BNE BRKCMD     	 	; BRK CMD
       	JMP (IRQVECTOR)   	; LET USER ROUTINE HAVE IT (USER DEFINED IRQ)
BRKCMD:
		JMP BRKROUTINE 		; MONITOR BRK ROUTINE

NINTERRUPT:
      	JMP (NMIVECTOR)   	; LET USER ROUTINE HAVE IT (USER DEFINED NMI)

;__________________________________________________________________________________________________________
;
;  AT SOME POINT, REPLACE THIS WITH 6502HBIOS CALLS
;

INIT_SERIAL:
		LDA	#$80			;
		STA	UART3			; SET DLAB FLAG
		LDA	#12				; SET TO 12 = 9600 BAUD
		STA	UART0			; save baud rate
		LDA	#00				;
		STA	UART1			;
		LDA	#03				;
		STA	UART3			; SET 8 BIT DATA, 1 STOPBIT
		STA	UART4			;
		RTS


;__IOF_CONINW____________________________________________________________________________________________
;
; PERFORM BLOCKING CONSOLE READ
;________________________________________________________________________________________________________
IOF_CONINW:
	lda #02
	sta farfunct
	jmp DO_FARCALL

;__IOF_CONIN_____________________________________________________________________________________________
;
; PERFORM NON-BLOCKING CONSOLE READ
;________________________________________________________________________________________________________
IOF_CONIN:
	lda #02
	sta farfunct
	jmp DO_FARCALL

;__OUTCH_________________________________________________________________________________________________
;
; PERFORM CONSOLE WRITE
;________________________________________________________________________________________________________
OUTCH:
	pha
	lda #00
	sta farfunct
	pla
	jmp DO_FARCALL

Z80:
		LDA 	$03FF
		BRK
	.BYTE 00,00,00

	.include"moncode.asm"
	.INCLUDE"../DOS65/os/dospager.asm"

DO_FARCALL = farcall - md_pagecode + $0500

; START BANNER
STARTUP: 	.BYTE   $0D,$0A

		.BYTE   "  Nhyodyne",$0D,$0A
		.BYTE   "   __ _____  _____ ___ ___ ",$0D,$0A
   		.BYTE   "  / /| ____|/ ____/ _ \__ \ ",$0D,$0A
  		.BYTE   " / /_| |__ | |   | | | | ) | ",$0D,$0A
 		.BYTE   "| '_ \___ \| |   | | | |/ / ",$0D,$0A
 		.BYTE   "| (_) |__) | |___| |_| / /_ ",$0D,$0A
  		.BYTE   " \___/____/ \_____\___/____| ",$0D,$0A
		.BYTE   "* 65c02 MONITOR ",$0D,$0A,$00

                 .segment "VECTORS"
NNTVECTOR:  .WORD   NINTERRUPT		;
RSTVECTOR:  .WORD   COLD_START		;
INTVECTOR: 	.WORD   INTERRUPT		; ROM VECTOR FOR IRQ

	.END
