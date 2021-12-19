
;__MONITOR_______________________________________________________
; This is a simple monitor program that can be uploaded to the MBC
; from Z80 mode.
;
; It assumes that the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
; If the SBC is the only CPU in the system, ensure that jumpers
; J1 and J2 are set for 1&2.   Then burn monrom.hex into EPROM.
; (note that this monitor does not initialize the UART yet, so this is broken at the moment)
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
IRQVECTOR   	=   	$30   		; VECTOR FOR USER IRQ RTN
WORKPTR		=   	$32		; WORK POINTER FOR COMMAND PROCESSOR
JUMPPTR		=	$34		; JUMP VECTOR FOR LOOKUP TABLE
TEMPWORD	=	$36		;
TEMPWORD1	=   	$38		;
TEMPWORD2	=   	$3A		;
TEMPBYTE	=	$3B		;
ACC      	=   	$3D		; ACC STORAGE
XREG     	=   	$3E 		; X REG STORAGE
YREG     	=   	$3F 		; Y REG STORAGE
PREG     	=   	$40 		; CURRENT STACK POINTER
PCL      	=   	$41 		; PROGRAM COUNTER LOW
PCH      	=   	$42 		; PROGRAM COUNTER HIGH
SPTR     	=   	$43 		; CPU STATUS REGISTER
CKSM		=	$44		; CHECKSUM
BYTECT		=	$45		; BYTE COUNT
STRPTR	 	=	$48		;
COUNTER	 	=	$4A		;
SRC	 	=	$4C		;
DEST	 	=	$4E		;
INBUFFER	=	$0200		;

; UART 16C550 SERIAL -- Assumes IO is in page $03 -- DIP Switch settings $83
UART0       	=    	$0368           ; DATA IN/OUT
UART1       	=    	$0369           ; CHECK RX
UART2       	=    	$036A           ; INTERRUPTS
UART3       	=    	$036B           ; LINE CONTROL
UART4       	=    	$036C           ; MODEM CONTROL
UART5          	=    	$036D           ; LINE STATUS
UART6          	=    	$036E           ; MODEM STATUS
UART7	       	=    	$036F           ; SCRATCH REG.

; this is Z80 code that is used to be able to run this as a .COM file.  It is truncated
; when the various .HEX files are generated
;
                .segment "LOADER"
		.BYTE 		$F3 			;DI - DISABLE INTERRUPTS
		.BYTE 		$01,$00,$10    		;LD	BC,$1000 -BYTES TO MOVE
		.BYTE 		$11,$00,$70    		;LD	DE,$7000 -DESTINATION ADDRESS (6502 IS !A15)
		.BYTE 		$21,$20,$01	    	;LD	HL,$0120 -SOURCE ADDRESS
		.BYTE 		$ED,$B0       		;LDIR  		 -COPY RAM
		.BYTE		$DB,$FF       		;IN 	A,$FF    -ENABLE 6502
		.BYTE		$0E,$00       		;LD	C,00H    -CP/M SYSTEM RESET CALL
		.BYTE		$CD,$05,$00		;CALL	0005H	 -RETURN TO PROMPT
;
;
;


                .segment "TROM"

;__COLD_START___________________________________________________
;
; PERFORM SYSTEM COLD INIT
;
;_______________________________________________________________
COLD_START:
         	CLD				;  VERIFY DECIMAL MODE IS OFF
               	LDX   #$FF              	;
               	TXS                     	; CLEAR STACK
		txa
		SEI 				; DISABLE INTERRUPTS

	  	LDA #<STARTUP			; OUTPUT STARTUP STRING
                STA STRPTR			;
        	LDA #>STARTUP		       	;
             	STA STRPTR+1			;
               	JSR OUTSTR			;

		LDA #$00			;
		STA INBUFFER			; MAKE SURE INPUT BUFFER IS EMPTY
						;
         	BRK				; PERFORM BRK (START MONITOR)

;__BRKROUTINE___________________________________________________
;
; HANDLE CPU BRK INTERRUPT PROCESING AND START MONITOR
;
;_______________________________________________________________
BRKROUTINE:
		CLI				; MONITOR'S BREAK HANDLER
		CLC
               	PLA  				;
               	TAX           		        ; LOW BYTE OF PC
               	PLA 				;
		TAY				; HIGH BYTE OF PC
		SEC				;
		TXA				;
               	SBC   #$02     		        ; REMOVE BREAK INSTRUCTION
               	STA   PCL     		        ;
               	BCS   BRK2     		        ;
               	DEY             		;
BRK2:
		STY   PCH       		; SAVE PCH
               	TSX                    		; GET STACK POINTER
               	STX   SPTR              	; SAVE STACK POINTER
               	JSR   PRINT_REG         	; DUMP REGISTER CONTENTS
               	LDX   #$FF              	;
               	TXS                     	; CLEAR STACK
               	CLI                     	; ENABLE INTERRUPTS AGAIN
               	JMP   COMMAND_PROCESSOR 	; START THE MONITOR

;__PRINT_REG____________________________________________________
;
; PRINT OUT REGISTERS ON THE DISPLAY
;
;_______________________________________________________________
PRINT_REG:  	LDA #<REGDATA			; OUTPUT HEADER STRING
                STA STRPTR			;
        	LDA #>REGDATA		       	;
             	STA STRPTR+1			;
               	JSR OUTSTR			;
               	LDA PCH				; OUTPUT PROGRAM COUNTER HIGH BYTE
               	JSR PRINT_BYTE			;
               	LDA PCL				; OUTPUT PROGRAM COUNTER LOW BYTE
               	JSR PRINT_BYTE			;
               	LDA #$20			; OUTPUT SPACE
               	JSR OUTCH			;
               	LDA ACC				; OUTPUT ACCUMULATOR
               	JSR PRINT_BYTE			;
               	LDA #$20			; OUTPUT 2 SPACES
               	JSR OUTCH			;
               	LDA #$20			;
               	JSR OUTCH			;
	       	LDA XREG			; OUTPUT X REGISTER
	       	JSR PRINT_BYTE			;
               	LDA #$20			; OUTPUT 2 SPACES
               	JSR OUTCH			;
               	LDA #$20			;
               	JSR OUTCH			;
	       	LDA YREG			; OUTPUT Y REGISTER
	       	JSR PRINT_BYTE			;
               	LDA #$20			; OUTPUT 2 SPACES
               	JSR OUTCH       		;
               	LDA #$20			;
               	JSR OUTCH			;
               	LDA SPTR			; OUTPUT STACK POINTER
	       	JSR PRINT_BYTE			;
               	LDA #$20			; OUTPUT 2 SPACES
               	JSR OUTCH     			;
               	LDA #$20			;
               	JSR OUTCH			;
      	       	LDA PREG			; OUTPUT STATUS REGISTER
	       	JSR PRINT_BYTE			; OUTPUT IN HEX
               	LDA #$2D			; OUTPUT '-'
               	JSR OUTCH			;
       	       	LDA PREG			; OUTPUT STATUS REGISTER
	       	JSR PRINT_BIN_BYTE		; OUTPUT IN BINARY
               	LDA #$0D			; PRINT NEW LINE
               	JMP OUTCH                	;

DO_PRINT_REG:
		BRK

;__INTERRUPT____________________________________________________
;
; HANDLE IRQ INTERRUPT AND DETERMINE IF IT IS A BRK OR AN IRQ
;
;_______________________________________________________________
INTERRUPT:
		STY	YREG			; SAVE Y
               	STX	XREG    		; SAVE X
		STA	ACC       		; SAVE A
		PLA				; GET STATUS REGISTER
		STA	PREG			; SAVE STATUS REGISTER
               	AND   #$10              	; MASK BRK
               	BNE   BRKCMD            	; BRK CMD
               	JMP   (IRQVECTOR)       	; LET USER ROUTINE HAVE IT (USER DEFINED IRQ)
BRKCMD:		JMP   BRKROUTINE        	; MONITOR BRK ROUTINE


;__COMMAND_PROCESSOR____________________________________________
;
; PROMPT FOR, INPUT, AND PROCESS INCOMMING USER COMMANDS
;
;_______________________________________________________________
COMMAND_PROCESSOR:

         	JSR DISPLAY_PROMPT		; PRINT PROMPT STRING
	        LDA #<INBUFFER		   	; SETUP INPUT COMMAND BUFFER
         	STA STRPTR			;
         	LDA #>INBUFFER			;
         	STA STRPTR +1 			;

         	JSR INSTR			; GET A STRING FROM THE CONSOLE

         	LDA #$0D			;
         	JSR OUTCH			;
         	LDA #$0A			;
         	JSR OUTCH			;


		LDY #$00			; SET INDEX = 0

	        LDA #<COMMAND_LOOKUP_TABLE 	; SETUP INPUT COMMAND POINTER
         	STA WORKPTR			;
         	LDA #>COMMAND_LOOKUP_TABLE	;
         	STA WORKPTR +1 			;
                LDA INBUFFER,Y			; MOVE FIRST BYTE OF COMMAND BUFFER TO ACC
                CMP #$00			; IS NULL?
                BEQ COMMAND_PROCESSOR		; YES, GET NEXT COMMAND

COMMAND_PROCESSOR_CMP:
               	LDX #$00			; X=0
		LDA INBUFFER,Y			; ACC= NEXT BYTE OF INPUT BUFFER
		CMP (WORKPTR,X)			; DOES NEXT BYTE OF INPUT BUFFER MATCH NEXT BYTE OF LOOKUP TABLE
		BNE CMD_PROCESOR_NEXT_CMD	; NO, GO TO NEXT COMMAND IN LOOKUP TABLE
		INY				; YES, Y=Y+1
		LDA INBUFFER,Y			; LOAD NEXT BYTE OF INPUT BUFFER
		CMP #$20			; IS IT A SPACE (SINGALING END OF COMMAND)
		BEQ CMD_PROCESSOR_MATCH_FOUND	; YES, POSSIBLE MATCH FOUND
		CMP #$00			; IS IT A NULL (SINGALING END OF COMMAND)
		BEQ CMD_PROCESSOR_MATCH_FOUND	; YES, POSSIBLE MATCH FOUND
		JSR INCWORKPTR			; NO, INCREMENT POINTER TO LOOKUP TABLE
		LDX #$00			;
	       	LDA (WORKPTR,X)			; A= NEXT BYTE OF LOOKUP TABLE
		CMP #$00			; IS IT A NULL? (SIGNALING END OF TABLE ENTRY)
		BEQ CMD_PROCESOR_NEXT_CMD1	; YES, ADVANCE TO NEXT COMMAND IN TABLE
		JMP COMMAND_PROCESSOR_CMP	; LOOP TO CHECK NEXT CHAR

CMD_PROCESOR_NEXT_CMD:
		JSR INCWORKPTR			; INCREMENT POINTER TO LOOKUP TABLE
		LDX #$00			;
	       	LDA (WORKPTR,X)			; A = NEXT BYTE OF LOOKUP TABLE
		CMP #$00			; IS IT A NULL?
		BNE CMD_PROCESOR_NEXT_CMD	; NO, LOOP

CMD_PROCESOR_NEXT_CMD1:
		JSR INCWORKPTR			; INCREMENT POINTER TO LOOKUP TABLE
		JSR INCWORKPTR			; INCREMENT POINTER TO LOOKUP TABLE
		JSR INCWORKPTR			; INCREMENT POINTER TO LOOKUP TABLE
	       	LDX #$00			;
	       	LDA (WORKPTR,X)			; A = NEXT BYTE OF LOOKUP TABLE
		CMP #$01			; IS IT $01 (SINGALING END OF LOOKUP TABLE)
		BEQ CMD_PROCESOR_NOT_FOUND	; YES, DISPLAY NOT FOUND MESSAGE
		LDY #$00			; NO RESET INPUT BUFFER COUNTER
		JMP COMMAND_PROCESSOR_CMP	; LOOP

CMD_PROCESSOR_MATCH_FOUND:
		JSR INCWORKPTR			; INCREMENT POINTER TO LOOKUP TABLE
	       	LDX #$00			;
	       	LDA (WORKPTR,X)			; A = NEXT BYTE OF LOOKUP TABLE
		CMP #$00			; IS IT A NULL?
		BNE CMD_PROCESOR_NEXT_CMD	; NO, TRY NEXT COMMAND
		JSR INCWORKPTR			; YES, INCREMENT POINTER TO LOOKUP TABLE
		LDX #$00			;
		LDA (WORKPTR,X)			; A = NEXT BYTE OF LOOKUP TABLE
		STA JUMPPTR			; STORE A INTO LOW BYTE OF JUMP VECTOR
		JSR INCWORKPTR			; INCREMENT POINTER TO LOOKUP TABLE
		LDX #$00			;
		LDA (WORKPTR,X)			; A = NEXT BYTE OF LOOKUP TABLE
		STA JUMPPTR+1			; INCREMENT POINTER TO LOOKUP TABLE
		JSR CMD_PROCESOR_RUN		; RUN COMMAND
		JMP COMMAND_PROCESSOR		; GET NEXT COMMAND

CMD_PROCESOR_NOT_FOUND:
		LDA #<ERROR 			; LOAD LOW BYTE OF ERROR STRING
         	STA STRPTR			; STORE IN POINTER LOW BYTE
         	LDA #>ERROR		       	; LOAD HIGH BYTE OF ERROR STRING
         	STA STRPTR +1 			; STORE IN POINTER HIGH BYTE

         	JSR OUTSTR			; OUTPUT THE STRING
		JMP COMMAND_PROCESSOR		;
CMD_PROCESOR_RUN:
		JMP (JUMPPTR)		        ; JUMP TO COMMAND VECTOR


;__LOAD_________________________________________________________

; LOAD A MOTOROLA FORMATTED HEX FILE
;
;_______________________________________________________________
LOAD:
	JSR	IOF_CONINW			;
	CMP	#'S'				;
	BNE	LOAD				; FIRST CHAR NOT (S)
	JSR	IOF_CONINW			; READ CHAR
	CMP	#'9'				;
	BEQ	LOAD21				;
	CMP	#'1'				;
	BNE	LOAD				; SECOND CHAR NOT (1)
	LDA	#$00				;
	STA	CKSM				; ZERO CHECKSUM
	JSR	GETBYTE				; READ BYTE
	SBC	#$01				;
	STA	BYTECT				; BYTE COUNT
	JSR	BADDR				; BUILD ADDRESS
	LDY	#$00				;
LOAD11:
	JSR	GETBYTE				;
	DEC	BYTECT				;
	BEQ	LOAD15				; ZERO BYTE COUNT
	STA	(TEMPWORD1),Y			; STORE DATA
	JSR 	INCTEMPWORD			;
	JMP	LOAD11				;

LOAD15:
	INC	CKSM				;
	BEQ	LOAD				;
LOAD19:
	LDA	#'?'				;
	JSR	OUTCH				;
LOAD21:
	RTS
GETBYTE:
	JSR	INHEX				; GET HEX CHAR
	ASL					;
	ASL					;
	ASL					;
	ASL					;
	STA	TEMPBYTE			;
	JSR	INHEX				;
	AND	#$0F				; MASK TO 4 BITS
	ORA	TEMPBYTE			;
	PHA					;
	CLC					;
	ADC	CKSM				;
	STA	CKSM				;
	PLA					;
	RTS					;
; INPUT HEX CHAR
INHEX:
	JSR	IOF_CONINW			;
	PHA					;
	JSR	OUTCH				;
	PLA					;
    	CMP #$3A  				; LESS THAN 9?
      	BCS INHEX_BIG  				; NO, SKIP NEXT
      	SBC #$2F  				; CONVERT 0-9
INHEX_BIG:
	CMP #$41  				; A OR MORE?
      	BCC INHEX_SMALL 			; NO, SKIP NEXT
      	SBC #$37  				; CONVERT A-F
INHEX_SMALL:
	RTS					;

; BUILD ADDRESS
BADDR:
	JSR	GETBYTE				; READ 2 FRAMES
	STA	TEMPWORD1+1			;
	JSR	GETBYTE				;
	STA	TEMPWORD1			;
	RTS


;__GO______________________________________________________
;
; GO COMMAND
;
; GO XXXX
;_______________________________________________________________
GO:

	        LDA #<INBUFFER 		   	; SETUP WORK BUFFER
         	STA WORKPTR			;
         	LDA #>INBUFFER		    	;
         	STA WORKPTR +1 			;

		JSR INCWORKPTR			; JUMP OVER "G"
		JSR INCWORKPTR			; JUMP OVER "O"

		JSR EATWHITESPACE		; SKIP OVER THE WHITESPACE
		JSR GETNUMBER			; GET THE STARTING ADDRESS
		BCS DUMP_ERROR			; IF NOT A NUMBER, REPORT ERROR

		JMP (TEMPWORD)			;




;__DUMPMEM______________________________________________________
;
; DUMP MEMORY COMMAND
;
; DUMP XXXX (XXXX)
;_______________________________________________________________
DUMP:

	        LDA #<INBUFFER 		   	; SETUP WORK BUFFER
         	STA WORKPTR			;
         	LDA #>INBUFFER		    	;
         	STA WORKPTR +1 			;

		JSR INCWORKPTR			; JUMP OVER "D"
		JSR INCWORKPTR			; JUMP OVER "U"
		JSR INCWORKPTR			; JUMP OVER "M"
		JSR INCWORKPTR			; JUMP OVER "P"

		JSR EATWHITESPACE		; SKIP OVER THE WHITESPACE
		JSR GETNUMBER			; GET THE STARTING ADDRESS
		BCS DUMP_ERROR			; IF NOT A NUMBER, REPORT ERROR

		LDA TEMPWORD			; STORE STARTING ADDRESS IN WORD POINTER (TEMPWORD1)
		STA TEMPWORD1			;
		LDA TEMPWORD+1			;
		STA TEMPWORD1+1			;

		JSR EATWHITESPACE		; SKIP OVER ANY WHITESPACE
		JSR GETNUMBER			; GET THE ENDING ADDRESS
		BCS DUMP_ERROR			; IF NOT A NUMBER, REPORT ERROR

		LDA TEMPWORD1			; STORE ENDING ADDRESS IN WORD POINTER (WORKPTR)
		STA WORKPTR			;
		LDA TEMPWORD1+1			;
		STA WORKPTR+1			;
DUMP_LOOP:
	       	JSR PRINT_MEM_LINE		;
	       	LDA #$0D			;
	       	JSR OUTCH			;
	       	LDA #$0A			;
	       	JSR OUTCH			;
           	LDA WORKPTR+1  			; COMPARE HIGH BYTES
           	CMP TEMPWORD+1
           	BCC DUMP_LOOP 			; IF NUM1H < NUM2H THEN NUM1 < NUM2
           	BNE DUMP_DONE			; IF NUM1H <> NUM2H THEN NUM1 > NUM2 (SO NUM1 >= NUM2)
           	LDA WORKPTR  			; COMPARE LOW BYTES
           	CMP TEMPWORD
           	BCC DUMP_LOOP			; IF NUM1L < NUM2L THEN NUM1 < NUM2
DUMP_DONE:
		RTS
DUMP_ERROR:
		JMP INVALID_NUMBER_ERROR



;__ENTERMEM_____________________________________________________
;
; ENTER MEMORY COMMAND
;
; ENTER XXXX (XX XX XX XX XX XX XX XX XX XX XX XX XX XX )
;_______________________________________________________________
ENTERMEM:

	        LDA #<INBUFFER 			; SETUP WORK BUFFER
         	STA WORKPTR			;
         	LDA #>INBUFFER		    	;
         	STA WORKPTR +1 			;

		JSR INCWORKPTR			; JUMP OVER "E"
		JSR INCWORKPTR			; JUMP OVER "N"
		JSR INCWORKPTR			; JUMP OVER "T"
		JSR INCWORKPTR			; JUMP OVER "E"
		JSR INCWORKPTR			; JUMP OVER "R"

		JSR EATWHITESPACE		; SKIP OVER ANY WHITESPACE
		JSR GETNUMBER			; GET NUMBER
		BCS ENTER_ERROR			; IF NOT A NUMBER REPORT ERROR

		LDA TEMPWORD			; STORE ADDRESS INTO WORD POINTER (TEMPWORD1)
		STA TEMPWORD1			;
		LDA TEMPWORD+1			;
		STA TEMPWORD1+1			;
		LDY #$00			; RESET COUNTER TO 0
ENTERLOOP:
		LDX #$00			;
		LDA (WORKPTR,X)			; GET NEXT BYTE FROM BUFFER
		CMP #$00			; IS NULL?
		BEQ ENTER_DONE			; YES, WE'RE DONE
		JSR EATWHITESPACE		; SKIP OVER ANY WHITESPACE
		JSR GETNUMBER			; GET NEXT NUMBER
		BCS ENTER_ERROR			; IF NOT A NUMBER REPORT ERROR
		LDA TEMPWORD			; STORE BYTE IN ADDRESS (INDEXED BY Y)
		STA (TEMPWORD1),Y		;
		INY				; GO TO NEXT BYTE
		JMP ENTERLOOP			; LOOP
ENTER_DONE:
		CPY #$00			; WAS LINE BLANK?
		BNE ENTER_CONTINUE		; NO, PREPARE FOR NEXT LINE
		RTS				; YES, END DATA ENTRY
ENTER_CONTINUE:
		LDA #$0D			;
		JSR OUTCH			;
		LDA #$0A			;
		JSR OUTCH
		LDA #$3A			; OUTPUT ":" TO SCREEN
		JSR OUTCH			;
		CLC				; CLEAR CARRY
		TYA				; A=Y (LAST COUNTER)
		ADC TEMPWORD1			; ADD LAST COUNT TO BEGINNING POINTER
		STA TEMPWORD1			; STORE RESULT IN BEGINNING POINTER
		BNE ENTER_INCREMENT		; NOT ZERO?, DONE
		INC TEMPWORD1+1			; ZERO, INC HIGH BYTE
ENTER_INCREMENT:
		LDA TEMPWORD1+1			; PRINTOUT STARTING ADDRESS TO SCREEN
		JSR PRINT_BYTE			; (HIGH)
		LDA TEMPWORD1			;
		JSR PRINT_BYTE			; (LOW)
		LDA #$20			; OUTPUT SPACE TO SCREEN
		JSR OUTCH			;
	        LDA #<INBUFFER 		   	; SETUP INPUT COMMAND BUFFER
         	STA STRPTR			;
         	LDA #>INBUFFER 		 	;
         	STA STRPTR +1 			;
         	JSR INSTR			; GET A STRING FROM THE CONSOLE
	        LDA #<INBUFFER 		   	; SETUP WORK BUFFER
         	STA WORKPTR			;
         	LDA #>INBUFFER 		    	;
         	STA WORKPTR +1 			;
         	LDY #$00 			;
         	JMP ENTERLOOP			; LOOP


ENTER_ERROR:
		JMP INVALID_NUMBER_ERROR

;__PRINT_MEM_LINE_______________________________________________
;
; PRINT MEMORY DUMP LINE
;
; PRINT 16 HEX LOCATIONS STARTING WITH ADDRESS WORKPTR
;_______________________________________________________________
PRINT_MEM_LINE:
		LDA #$3A			; LOAD ':' INTO ACC
		JSR OUTCH			; PRINT ':'
    	     	LDA WORKPTR+1			; PRINT ADDRESS
	       	JSR PRINT_BYTE			;
      	       	LDA WORKPTR			;
	       	JSR PRINT_BYTE			;
 	       	LDA #$2D			; LOAD '-'
	       	JSR OUTCH			; PRINT '-'
	       	LDY #$00			;
PRINT_MEM_LINE_LOOP:
		LDA (WORKPTR),Y			; LOAD NEXT BYTE
		JSR PRINT_BYTE	       		; PRINT BYTE
 	       	LDA #$20			; LOAD ' '
	       	JSR OUTCH			; PRINT ' '
	       	INY				; INCREMENT COUNTER
	       	CPY #$10			; HAVE WE PRINTED 16 ADDRESSES
	       	BNE PRINT_MEM_LINE_LOOP		; NO, LOOP
		LDA #$3A			; LOAD ':' INTO ACC
		JSR OUTCH			; PRINT ':'
                LDX #$00			;
		LDY #$00			;
PRINT_MEM_LINE_LOOP_ASCII:
		LDA (WORKPTR,X)			; GET NEXT BYTE
		JSR OUTASCII			; PRINT ASCII VALUE OF BYTE
		INY				; INCREMENT COUNTER
		JSR INCWORKPTR			; INCREMENT BUFFER POINTER
	       	CPY #$10			; HAVE WE PRINTED 16 ADDRESSES
	       	BNE PRINT_MEM_LINE_LOOP_ASCII	; NO, LOOP
	       	LDA #$0D			; YES, PRINT CR
	       	JSR OUTCH			;
	       	RTS				; RETURN



;__DISPLAY_PROMPT______________________________________________
;
; DISPLAY THE INPUT PROMPT ON THE SCREEN
;
;______________________________________________________________
DISPLAY_PROMPT:
		LDA #<PROMPT 			; LOAD LOW BYTE OF PROMPT STRING
         	STA STRPTR			; STORE IN POINTER LOW BYTE
         	LDA #>PROMPT 		       	; LOAD HOGH BYTE OF PROMPR STRING
         	STA STRPTR +1 			; STORE IN POINTER HIGH BYTE

         	JMP OUTSTR			; OUTPUT THE STRING


;__INCWORKPTR___________________________________________________
; INCREMENT THE 16BIT WORK POINTER
;
;
;
;_______________________________________________________________
INCWORKPTR:
		INC WORKPTR			; INCREMENT LOWBYTE
		BNE INCWORKPTR_OUT		; NOT ZERO?, DONE
		INC WORKPTR+1			; ZERO, INC HIGH BYTE
INCWORKPTR_OUT:
		RTS				; RETURN


;__INCTEMPWORD__________________________________________________
;
; INCREMENT THE 16BIT WORK POINTER
;
;_______________________________________________________________
INCTEMPWORD:
		INC TEMPWORD1			; INCREMENT LOWBYTE
		BNE INCTEMPWORD_OUT		; NOT ZERO?, DONE
		INC TEMPWORD1+1			; ZERO, INC HIGH BYTE
INCTEMPWORD_OUT:
		RTS				; RETURN

;__INCTEMPWORD2__________________________________________________
;
; INCREMENT THE 16BIT WORK POINTER
;
;
;_______________________________________________________________
INCTEMPWORD2:
		INC TEMPWORD2			; INCREMENT LOWBYTE
		BNE INCTEMPWORD2_OUT		; NOT ZERO?, DONE
		INC TEMPWORD2+1			; ZERO, INC HIGH BYTE
INCTEMPWORD2_OUT:
		RTS				; RETURN



;__OUTASCII_____________________________________________________
;
; PRINT CHAR IF VALID, ELSE PRINT '.'
;
;_______________________________________________________________
OUTASCII:
		CMP #$20			; IS < 20
		BMI OUTASCII_DOT		; YES, SKIP
		CMP #$7E			; IS >7E
		BPL OUTASCII_DOT		; YES, SKIP
		JMP OUTCH			; NO, PRINT CHAR AND RETURN
OUTASCII_DOT:
		LDA #$2E			; A= '.'
		JMP OUTCH			; PRINT '.' AND RETURN



;__INVALID_NUMBER_ERROR__________________________________________
;
; PRINT "INVALID HEX NUMBER MESSAGE"
;
;_______________________________________________________________
INVALID_NUMBER_ERROR:
		LDA #<INERROR 			; LOAD LOW BYTE OF ERROR STRING
         	STA STRPTR			; STORE IN POINTER LOW BYTE
         	LDA #>INERROR		       	; LOAD HOGH BYTE OF ERROR STRING
         	STA STRPTR +1 			; STORE IN POINTER HIGH BYTE
         	JMP OUTSTR			; OUTPUT THE STRING


;__GETNUMBER______________________________________________________
;
; GET ASCII NUMBER FROM BUFFER AND PARSE INTO TEMPWORD
;
;_______________________________________________________________
GETNUMBER:
		LDA #$00			;
		STA TEMPWORD			; CLEAR OUT TEMPWORD (OUTPUT OF GETNUMBER)
		STA TEMPWORD+1			;
		LDX #$00			;
GETNUMBER_LOOP:
		LDA (WORKPTR,X)			; GET NEXT BYTE FROM BUFFER
		CMP #$20			; IS SPACE?
		BEQ GETNUMBER_DONE		; YES, WE'RE DONE
		CMP #$00			; IS NULL?
		BEQ GETNUMBER_DONE		; YES, WE'RE DONE
		CMP #$2C			; IS ","?
		BEQ GETNUMBER_DONE		; YES, WE'RE DONE
		CMP #$29			; IS ")"?
		BEQ GETNUMBER_DONE		; YES, WE'RE DONE
		JSR HEXIN			; GET HEX DIGIT
		BCS GETNUMBER_ERROR		; IS INVALID DIGIT?, YES PRINT ERROR AND ABORT
		CLC				; CLEAR CARRY
		ROL TEMPWORD			; MOVE WORD OVER 4 BITS TO LEFT
		ROL TEMPWORD+1			;
		CLC				;
		ROL TEMPWORD			;
		ROL TEMPWORD+1			;
		CLC				;
		ROL TEMPWORD			;
		ROL TEMPWORD+1			;
		CLC				;
		ROL TEMPWORD			;
		ROL TEMPWORD+1			;
		ORA TEMPWORD			; ADD IN NEW DIGIT
		STA TEMPWORD			; STORE BACK TO TEMPWORD
		JSR INCWORKPTR			; INCREMENT BUFFER POINTER
		JMP GETNUMBER_LOOP		; LOOP
GETNUMBER_ERROR:
		SEC				; SET ERROR FLAG (CARRY)
		RTS				; RETURN
GETNUMBER_DONE:
		CLC				; CLEAR ERROR FLAG (CARRY)
		RTS				; RETURN

;__HEXIN________________________________________________________
;
; GET NEXT CHAR FROM INPUT BUFFER AND CHANGE TO HEX DIGIT
;
; IF INVALID, SET CARRY FLAG
;_______________________________________________________________
HEXIN:
		LDX #$00			;
		LDA (WORKPTR,X)			; GET NEXT CHAR FROM BUFFER
      		CMP #$3A  			; LESS THAN 9?
      		BCS HEXIN_BIG  			; NO, SKIP NEXT
      		SBC #$2F  			; CONVERT 0-9
HEXIN_BIG:
		CMP #$41  			; A OR MORE?
      		BCC HEXIN_SMALL 		; NO, SKIP NEXT
      		SBC #$37  			; CONVERT A-F
HEXIN_SMALL:
		CMP #$10  			; RESULT TOO BIG?
      		RTS


;__EATWHITESPACE___________________________________________________
;
; FORWARD THE BUFFER POINTER PAST ANY WHITE SPACE IN THE INPUT BUFFER
;
;_______________________________________________________________
EATWHITESPACE:
		LDX #$00			;
		LDA (WORKPTR,X)			; GET NEXT CHAR FROM BUFFER
		CMP #$20			; IS SPACE
		BNE EATWHITESPACE_OUT		; NO, DONE
		JSR INCWORKPTR			; YES, INCREMENT BUFFER POINTER
		JMP EATWHITESPACE		; LOOP
EATWHITESPACE_OUT:
		RTS				; RETURN


;__PRINT_BYTE__________________________________________________
;
; PRINT OUT ACCUMULATOR AS HEX NUMBER
;
;______________________________________________________________
PRINT_BYTE:
               TAX				; SAVE A REGISTER
               LSR 				; SHIFT HIGH NIBBLE TO LOW NIBBLE
               LSR 				;
               LSR 				;
               LSR 				;
               CLC               		; CLEAR CARRY
               JSR PRINT_DIGIT			; PRINT LOW NIBBLE
               TXA				; RESTORE ACCUMULATOR
               JMP PRINT_DIGIT			; PRINT LOW NIBBLE

;__PRINT_DIGIT_________________________________________________
;
; PRINT OUT LOW NIBBLE OF ACCUMULATOR IN HEX
;
;______________________________________________________________
PRINT_DIGIT:
               AND #$0F				; STRIP OFF HIGH NIBBLE
               ORA #$30				; ADD $30 TO PRODUCE ASCII
               CMP #$3A               		; IS GREATER THAN 9
               BMI PRINT_DIGIT_OUT		; NO, SKIP ADD
               CLC				; CLEAR CARRY
               ADC #$07				; ADD ON FOR LETTER VALUES
PRINT_DIGIT_OUT:					;
               JMP OUTCH               		; PRINT OUT CHAR


;__PRINT_BIN_BYTE______________________________________________
;
; PRINT OUT BYTE IN BINARY
;
;______________________________________________________________
PRINT_BIN_BYTE:
               ASL				; ROTATE BIT 7 INTO CARRY FLAG
               BCC PRINT_BIN8_0			;  IS ZERO?
               JSR PRINT_1			;  NO, PRINT OUT A '1'
               JMP PRINT_BIN_BIT_7		;  JUMP TO NEXT BIT
PRINT_BIN8_0:					;
               JSR PRINT_0			;  YES, PRINT A '0'
PRINT_BIN_BIT_7:					;
               ASL				; ROTATE BIT 6 INTO CARRY FLAG
               BCC PRINT_BIN7_0			;  IS ZERO?
               JSR PRINT_1			;  NO, PRINT OUT A '1'
               JMP PRINT_BIN_BIT_6		;  JUMP TO NEXT BIT
PRINT_BIN7_0:					;
               JSR PRINT_0			;  YES, PRINT A '0'
PRINT_BIN_BIT_6:					;
               ASL				; ROTATE BIT 5 INTO CARRY FLAG
               BCC PRINT_BIN6_0			;  IS ZERO?
               JSR PRINT_1			;  NO, PRINT OUT A '1'
               JMP PRINT_BIN_BIT_5		;  JUMP TO NEXT BIT
PRINT_BIN6_0:					;
               JSR PRINT_0			;  YES, PRINT A '0'
PRINT_BIN_BIT_5:					;
               ASL				; ROTATE BIT 4 INTO CARRY FLAG
               BCC PRINT_BIN5_0			;  IS ZERO?
               JSR PRINT_1			;  NO, PRINT OUT A '1'
               JMP PRINT_BIN_BIT_4		;  JUMP TO NEXT BIT
PRINT_BIN5_0:					;
               JSR PRINT_0			;  YES, PRINT A '0'
PRINT_BIN_BIT_4:					;
               ASL				; ROTATE BIT 3 INTO CARRY FLAG
               BCC PRINT_BIN3_0			;  IS ZERO?
               JSR PRINT_1			;  NO, PRINT OUT A '1'
               JMP PRINT_BIN_BIT_2		;  JUMP TO NEXT BIT
PRINT_BIN3_0:					;
               JSR PRINT_0			;  YES, PRINT A '0'
PRINT_BIN_BIT_2:					;
               ASL				; ROTATE BIT 2 INTO CARRY FLAG
               BCC PRINT_BIN2_0			;  IS ZERO?
               JSR PRINT_1			;  NO, PRINT OUT A '1'
               JMP PRINT_BIN_BIT_1		;  JUMP TO NEXT BIT
PRINT_BIN2_0:					;
               JSR PRINT_0			;  YES, PRINT A '0'
PRINT_BIN_BIT_1:					;
               ASL				; ROTATE BIT 1 INTO CARRY FLAG
               BCC PRINT_BIN1_0			;  IS ZERO?
               JSR PRINT_1			;  NO, PRINT OUT A '1'
               JMP PRINT_BIN_BIT_0		;  JUMP TO NEXT BIT
PRINT_BIN1_0:					;
               JSR PRINT_0			;  YES, PRINT A '0'
PRINT_BIN_BIT_0:					;
               ASL				; ROTATE BIT 0 INTO CARRY FLAG
               BCC PRINT_BIN0_0			;  IS ZERO?
               JMP PRINT_1			;  NO, PRINT OUT A '1'
PRINT_BIN0_0:					;
               JMP PRINT_0			;   YES, PRINT A '0'



;__PRINT_1_____________________________________________________
;
; PRINT OUT A '1'
;
;______________________________________________________________
PRINT_1:
               PHA				; PUSH ACC TO STACK
               LDA #$31				; LOAD '1'
               JSR OUTCH			; OUTPUT CHAR TO SCREEN
               PLA				; PULL ACC FROM STACK
               RTS				; RETURN


;__PRINT_0_____________________________________________________
;
; PRINT OUT A '0'
;
;______________________________________________________________
PRINT_0:
               PHA				; PUSH ACC TO STACK
               LDA #$30				; LOAD '0'
               JSR OUTCH			; OUTPUT CHAR TO SCREEN
               PLA				; PULL ACC FROM STACK
               RTS				; RETURN


;__OUTSTR______________________________________________________
;
; OUTPUT THE STRING POINTED TO BU OUTSTR TO THE SCREEN
;
;______________________________________________________________
OUTSTR:
	        LDY   #$00			; LOAD $00 INTO Y
OUTSTRLP:
        	LDA (STRPTR),Y     		; LOAD NEXT CHAR FROM STRING INTO ACC
        	CMP #$00			; IS NULL?
        	BEQ ENDOUTSTR			; YES, END PRINT OUT
        	JSR OUTCH  			; PRINT CHAR IN ACC
        	INY      			; Y=Y+1 (BUMP INDEX)
        	JMP OUTSTRLP			; DO NEXT CHAR
ENDOUTSTR:
        	RTS				; RETURN

;__INSTR_______________________________________________________
;
; INPUT STRING FROM KEYBOARD INTO KEYBOARD BUFFER
;
;______________________________________________________________
INSTR:
	        LDY   #$00			; LOAD $00 INTO Y
INSTRLP:
		JSR IOF_CONINW
        	CMP #$0D			; IS CR?
        	BEQ ENDINSTR			; YES, DONE WITH INPUT
        	CMP #$08			; IS BACKSPACE?
        	BNE INSTR_NOTBS			; NO, SKIP BACKSPACE RTN
        	CPY #$00			; IS INDEX =0 ?
        	BEQ INSTR_EMPTY_BS		; YES, SKIP BACKSPACE
        	JSR OUTCH     			; OUTPUT CHAR TO SCREEN
        	DEY				; Y=Y-1
        	LDA #$00			;
        	STA (STRPTR),Y			; NULL TERMINATE INPUT BUFFER
        	DEY				; Y=Y-1
        	JMP INSTR_SKIP_STORE       	; SKIP STORE OF CHAR TO INPUT BUFFER
INSTR_NOTBS:
        	STA (STRPTR),Y			; STORE CHAR IN KEYBAORD BUFFER
        	JSR OUTCH     			; OUTPUT CHAR TO SCREEN
INSTR_SKIP_STORE:
	        INY				; Y=Y+1
        	CPY #$FF			; DOES Y=$FF
        	BNE INSTRLP                	; NO, LOOP FOR NEXT CHAR
ENDINSTR:
        	LDA #$00			; A=0
        	STA (STRPTR),Y			; NULL TERMINATE INPUT BUFFER
        	RTS
INSTR_EMPTY_BS:
        	LDA #$00			; BLANK OUT KEYBOARD CHAR, TO SIGNAL READY FOR NEXT CHAR
        	JMP INSTRLP			; JUMP TO INPUT LOOP


;__________________________________________________________________________________________________________

IOF_CONINW:					;
SERIAL_INCHW1:
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$01			; TEST IF DATA IN RECEIVE BUFFER
		CMP 	#$00
		BEQ	SERIAL_INCHW1		; LOOP UNTIL DATA IS READY
		LDA	UART0			; THEN READ THE CHAR FROM THE UART

		RTS

IOF_CONIN:					;
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$01			; TEST IF DATA IN RECEIVE BUFFER
		BEQ	SERIAL_INCH1		; NO CHAR FOUND
		LDA	UART0			; THEN READ THE CHAR FROM THE UART
		RTS
SERIAL_INCH1:					;
		LDA	#$00
		RTS				;

OUTCH:						;
		PHA				; STORE A
TX_BUSYLP:
		LDA	UART5			; READ LINE STATUS REGISTER
		AND	#$20			; TEST IF UART IS READY TO SEND (BIT 5)
		CMP 	#$00
		BEQ	TX_BUSYLP		; IF NOT REPEAT
		PLA				; RESTORE ACC
		STA	UART0			; THEN WRITE THE CHAR TO UART
		RTS

Z80:
		LDA 	$03FF
		BRK
	.BYTE 00,00,00

	.include"assmb.asm"

; COMMAND PROCESSOR JUMP TABLE
COMMAND_LOOKUP_TABLE:
 		.BYTE "REGISTER",0,<DO_PRINT_REG,>DO_PRINT_REG
 		.BYTE "DUMP",0,<DUMP,>DUMP
 		.BYTE "ENTER",0,<ENTERMEM,>ENTERMEM
 		.BYTE "GO",0,<GO,>GO
 		.BYTE "LOAD",0,<LOAD,>LOAD
 		.BYTE "Z80",0,<Z80,>Z80
		.BYTE "DISASSEMBLE",0,<DISASSEMBLE,>DISASSEMBLE
		.BYTE "ASSEMBLE",0,<ASSEMBLE,>ASSEMBLE
		.BYTE 01,0
; COMMAND PROMPT STRING
PROMPT:  	.BYTE   $0D,$0A,".",0
; ERROR STRING
ERROR:	 	.BYTE   $0D,$0A,"? COMMAND NOT FOUND",$0D,0
INERROR:	.BYTE   $0D,$0A,"? INVALID HEX NUMBER",$0D,0
; STRINGS FOR REGISTER DISPLY
REGDATA: 	.BYTE   $0D,$0A
		.BYTE   "   PC  AC  XR  YR  SP  SR(NVRBDIZC)"
		.BYTE   $0D,$0A,"! ",0
; START BANNER
STARTUP: 	.BYTE   $0D,$0A

		.BYTE   "  __ |_  _ ",$0D,$0A
		.BYTE   "  ||||_)(_ ",$0D,$0A
		.BYTE   "   __ _____  _____ ___ ___ ",$0D,$0A
   		.BYTE   "  / /| ____|/ ____/ _ \__ \ ",$0D,$0A
  		.BYTE   " / /_| |__ | |   | | | | ) | ",$0D,$0A
 		.BYTE   "| '_ \___ \| |   | | | |/ / ",$0D,$0A
 		.BYTE   "| (_) |__) | |___| |_| / /_ ",$0D,$0A
  		.BYTE   " \___/____/ \_____\___/____| ",$0D,$0A
		.BYTE   "* 6502 MONITOR ",$0D,$0A,$00

                 .segment "VECTORS"
	;	 .org   $FFFA
NMIVECTOR:      .WORD   INTERRUPT		;
RSTVECTOR:      .WORD   COLD_START		;
INTVECTOR: 	.WORD   INTERRUPT		; ROM VECTOR FOR IRQ

	.END
