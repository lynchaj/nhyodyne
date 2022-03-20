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



	.ORG	$0100
;__________________________________________________________________________________________________
; MAIN PROGRAM BEGINS HERE
;__________________________________________________________________________________________________
    	CALL	PR_INITIALIZE

       ld      A,32
LOOP1:
        INC     A
        call    PR_OUTCHAR
        CP	128
	JP	NZ,LOOP1


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
PR_OUTCHAR_LOOP:
 	IN	A,(PRINT2)		; GET STATUS INFO
    	AND	10000000B		; ONLY INTERESTED IN BUSY FLAG
 	JP	NZ,PR_OUTCHAR_LOOP	; LOOP IF BUSY
  	POP	AF			; RESTORE AF
 	OUT	(PRINT0),A		; OUTPUT DATA TO PORT
 	call 	DELAY   		; ignore anything back after a reset
        ld      A,00001001B             ; select & strobe
        OUT	(PRINT2),A		; OUTPUT DATA TO PORT
  	call 	DELAY   		; ignore anything back after a reset
        ld      A,00001000B             ; select
        OUT	(PRINT2),A		; OUTPUT DATA TO PORT
        POP	AF			; RESTORE AF
      	ret

;__PR_INITIALIZE___________________________________________________________________________________
;
; 	initialise - SET UP PORT FOR PRINTING
;__________________________________________________________________________________________________
PR_INITIALIZE:
        ld      A,00001100B             ; Reset strobe
        OUT	(PRINT2),A		; OUTPUT DATA TO PORT
        call    DELAY
        ld      A,00001000B             ; select
        OUT	(PRINT2),A		; OUTPUT DATA TO PORT
        ret

DELAY:
	PUSH	AF			; STORE AF
        ld      A,0
DELAY1:
        INC     A
        CP	50
	JP	Z,DELAY1
        POP	AF			; RESTORE AF
        ret
