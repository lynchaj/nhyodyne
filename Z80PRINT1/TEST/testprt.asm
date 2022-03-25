;__TESTPRT________________________________________________________________________________________
;
;	TESTPRT         Test Nhyodyne Printer
;
;	WRITTEN BY: DAN WERNER -- 03/20/2022
;_________________________________________________________________________________________________
;

; DATA CONSTANTS
;__________________________________________________________________________________________________
;IDE REGISTER		IO PORT		; FUNCTION
PRINT0   	.EQU	$E8
PRINT1   	.EQU	$E9
PRINT2  	.EQU	$EA


ESC		.EQU	1BH
CR		.EQU	0DH
LF		.EQU	0AH
TAB		.EQU	09H
BELL		.EQU	07H

	.ORG	$0100
;__________________________________________________________________________________________________
; MAIN PROGRAM BEGINS HERE
;__________________________________________________________________________________________________
        LD	HL,SIGNON
	CALL	PRINT_STRING

    	CALL	PR_INITIALIZE

        LD	HL,INIT
	CALL	PRINT_STRING

       ld      A,32
LOOP1:
        INC     A
        call    PR_OUTCHAR
        CP	128
	JP	NZ,LOOP1
        LD	HL,DONE
	CALL	PRINT_STRING

	LD	C,00H			; CP/M SYSTEM RESET CALL
	CALL	0005H			; RETURN TO PROMPT
	RET






;__PR_OUTCHAR______________________________________________________________________________________
;
; 	PR_OUTCHAR- OUTPUT CHAR TO PRINTER PORT
;	A: CHAR TO OUTPUT
;__________________________________________________________________________________________________
PR_OUTCHAR:
	PUSH	AF			; STORE AF
        PUSH	AF			; STORE AF

        ld      A,10001100B             ; select
        OUT	(PRINT2),A		; OUTPUT DATA TO PORT

PR_OUTCHAR_LOOP:
 	IN	A,(PRINT1)		; GET STATUS INFO
    	AND	10000000B		; ONLY INTERESTED IN BUSY FLAG
 	JP	Z,PR_OUTCHAR_LOOP	; LOOP IF BUSY
  	POP	AF			; RESTORE AF
 	OUT	(PRINT0),A		; OUTPUT DATA TO PORT
 	call 	DELAY   		; ignore anything back after a reset
        ld      A,00001101B             ; select & strobe
        OUT	(PRINT2),A		; OUTPUT DATA TO PORT
  	call 	DELAY   		; ignore anything back after a reset
        ld      A,01001100B             ; select
        OUT	(PRINT2),A		; OUTPUT DATA TO PORT
        POP	AF			; RESTORE AF
      	ret

;__PR_INITIALIZE___________________________________________________________________________________
;
; 	initialise - SET UP PORT FOR PRINTING
;__________________________________________________________________________________________________
PR_INITIALIZE:
        ld      A,11001000B             ; Reset strobe
        OUT	(PRINT2),A		; OUTPUT DATA TO PORT
        call    DELAY
        ld      A,01001100B             ; select
        OUT	(PRINT2),A		; OUTPUT DATA TO PORT
        ret

DELAY:
	PUSH	AF			; STORE AF
        ld      A,0
DELAY1:
        INC     A
        CP	150
	JP	NZ,DELAY1
        POP	AF			; RESTORE AF
        ret



;---------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------
; Main console I/O routines
;
;---------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------
;---------------------------------------------------------------------------------------------------

ZCO:
	PUSH HL
	LD E,C
	LD C,02H			;BDOS Function 2 Write Console Byte
	CALL 0005H			;Call BDOS
	POP HL
	RET

ZCI:
	LD C,0BH			;BDOS Function 11 Read Console Status
	CALL 0005H			;Call BDOS
	JP Z,ZCI
	LD C,01H			;BDOS Function 1 Read Console Byte
	CALL 0005H			;Call BDOS
	RET
;
; Send CR/LF to Console
;
ZCRLF:
	PUSH	AF
	PUSH	BC
	LD	C,CR
	CALL	ZCO
	LD	C,LF
	CALL	ZCO
	POP	BC
	POP	AF
	RET


PRINT_STRING:
	PUSH	AF
	push	BC
print1:
	LD	a,(HL)			;Point to start of string
	inc	HL			;By using the CS over-ride we will always have
	CP	'$'			;a valid pointer to messages at the end of this monitor
	JP	z,print2
	CP	0			;Also terminate with 0's
	JP	Z,print2
	LD	C,A
	call	ZCO
	jp	print1
print2:
	pop	BC
	POP	AF
	ret

;---------------------------------------------------------------------------------------------------
; Black: ESC,[30m
; Red: ESC,[31m
; Green: ESC,[32m
; Yellow: ESC,[33m
; Blue: ESC,[34m
; Magenta: ESC,[35m
; Cyan: ESC,[36m
; White: ESC,[37m
; Reset: ESC,[0m

SIGNON:
		.DB	CR,LF,LF
		.DB	ESC,"[33m","Test Nhyodyne Centronics Parallel Print interface (Z80PRINT)."	; Yellow
		.DB	CR,LF,"$"
INIT:
		.DB	CR,LF,BELL
		.DB	ESC,"[36m","Initialization Completed."
		.DB	CR,LF,"$"

DONE:
		.DB	CR,LF,BELL
		.DB	ESC,"[32m","Test Completed."
		.DB	CR,LF,"$"
