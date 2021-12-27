*
* MON85: A software debugger for the 8080/8085 processor
*
* Copyright 1979-2005 Dave Dunfield
* All rights reserved.
*
ROM	EQU	$F000		Debugger goes here
DRAM	EQU	$E7A0		Debugger RAM (96 bytes required)
*
* Debugger data area (in RAM)
*
	ORG	DRAM		Monitor data goes here
*
UBASE	DS	2		Base address of user program
HL	DS	2		Saved HL register pair
DE	DS	2		Saved DE register pair
BC	DS	2		Saved BC register pair
PSW	DS	2		Saved PSW (A + CC)
SP	DS	2		Saved Stack Pointer
PC	DS	2		Saved Program Counter
OFLAG	DS	1		Output suspended flag
TFLAG	DS	1		Flag to enable TRACING
SFLAG	DS	1		Flag to enable SUBROUTINE tracing
AFLAG	DS	1		Flag to enable AUTO REGISTER DISPLAY
BRKTAB	DS	24		Breakpoint table
INST	DS	6		Save area for "faking" instructions
BUFFER	DS	48		Input/temp buffer & stack
DSTACK	EQU	*		Debugger stack
*
* Startup code... Kick off the monitor
*
	ORG	ROM		Debugger code goes here
*
	JMP	BEGIN		Execute main program
	DS	5		Filler bytes to first int
*
* Interrupt handlers for RESTART interrupts
*
* Although they RST 1.5, 2.5 and 3.5 vectors are not used by the
* 8085 hardware,  they are included since the space must contain
* SOMETHING,  and who knows,  perhaps someone uses them for jump
* table addresses etc...
*
* Restart 1 is the entry point for breakpoints
RST1	JMP	ENTRY		Execute handler
	DS	1		Filler to next int
RST15	CALL	RSTINT		Invoke interrupt
	DB	12		Offset to handler
RST2	CALL	RSTINT		Invoke interrupt
	DB	16		Offset to handler
RST25	CALL	RSTINT		Invoke interrupt
	DB	20		Offset to handler
RST3	CALL	RSTINT		Invoke interrupt
	DB	24		Offset to handler
RST35	CALL	RSTINT		Invoke interrupt
	DB	28		Offset to handler
RST4	CALL	RSTINT		Invoke interrupt
	DB	32		Offset to handler
TRAP	CALL	RSTINT		Invoke interrupt
	DB	36		Offset to handler
RST5	CALL	RSTINT		Invoke interrupt
	DB	40		Offset to handler
RST55	CALL	RSTINT		Invoke interrupt
	DB	44		Offset to handler
RST6	CALL	RSTINT		Invoke interrupt
	DB	48		Offset to handler
RST65	CALL	RSTINT		Invoke interrupt
	DB	52		Offset to handler
RST7	CALL	RSTINT		Invoke interrupt
	DB	56		Offset to handler
RST75	CALL	RSTINT		Invoke interrupt
	DB	60		Offset to handler
*
* Process a RESTART interrupt, get offset & vector to code
* To speed processing, it is assumed that the user program
* base address begins on a 256 byte page boundary.
*
RSTINT	XTHL			Save HL, Get PTR to offset
	PUSH	PSW		Save A and CC
	MOV	A,M		Get offset
	LHLD	UBASE		Get high of user program
	MOV	L,A		Set low address
	POP	PSW		Restore A & CC
	XTHL			Restore HL, set 
	RET			Vector to interrupt
*
* Register -> text translation tables used by the disassembler. These tables
* go here (near beginning) so that we can be sure the high address will not
* cross a page boundary allowing us to index by modifying low address only.
*
RTAB	STR	'BCDEHLMA'	Table of register names
RPTAB	STR	'BDHS'		Table of register pairs
*
* Entry point for breakpoints & program tracing
*
* Save the user program registers
ENTRY	SHLD	HL		Save HL
	XCHG			Get DE
	SHLD	DE		Save DE
	POP	H		Get RET addrss
	DCX	H		Backup to actual
	SHLD	PC		Save PC
	PUSH	B		Copy BC
	POP	H		And get it
	SHLD	BC		Save PC
	PUSH	PSW		Copy PSW
	POP	H		And get it
	SHLD	PSW		Save PSW
	LXI	H,0		Start with zero
	DAD	SP		Get SP
	SHLD	SP		Save SP
	LXI	SP,DSTACK	Move to our stack
	LHLD	PC		Get instruction back
	LXI	D,BRKTAB	Point to breakpoint table
	MVI	B,'0'		Assume breakpoint #0
* Search breakpoint table & see if this is a breakpoint
TRYBRK	LDAX	D		Get HIGH byte from table
	INX	D		Advance
	CMP	H		Does it match?
	LDAX	D		Get LOW byte from table
	INX	D		Advance
	JNZ	NOTBRK		No, try next
	CMP	L		Does it match?
	JZ	FOUND		Yes, we have an entry
NOTBRK	INX	D		Skip saved code byte
	INR	B		Advance breakpoint number
	MOV	A,B		Get breakpoint number
	CPI	'0'+8		Table exausted
	JC	TRYBRK		No, keep looking
* This interrupt is NOT a breakpoint
	JMP	NOBK		Enter with no breakpoint
* This interrupt is a breakpoint, display the message
FOUND	CALL	PRTMSG		Output message
	STRZ	'** Breakpoint '
	MOV	A,B		Get breakpoint number
	CALL	OUT		Output it
	CALL	LFCR		New line
* Reenter monitor, first, restore all breakpoint opcodes
NOBK	LXI	H,BRKTAB	Point to breakpoint table
	MVI	B,8		8 breakpoints
FIXL	MOV	D,M		Get HIGH address
	INX	H		Advance
	MOV	E,M		Get LOW address
	INX	H		Advance
	MOV	A,D		Get high
	ORA	E		Test for ZERO
	JZ	NOFIX		Breakpoint is not set
	MOV	A,M		Get opcode
	STAX	D		And patch user code
NOFIX	INX	H		Skip opcode
	DCR	B		Reduce count
	JNZ	FIXL		Not finished, keep going
	LDA	AFLAG		Get auto register display flag
	ANA	A		Is it enabled?
	CNZ	REGDIS		Yes, display the registers
	LDA	TFLAG		Get trace mode flag
	ANA	A		Is it enabled?
	JZ	REST		No, enter monitor
* Prompt for and handle trace mode commands
TRTB	CALL	PRTMSG		Output message
	STRZ	'T> '		Trace mode prompt
TRL	CALL	INCHR		Get a command character
	CPI	' '		Execute command?
	JZ	NOADR		Yes, handle it
	CPI	$1B		ESCAPE?
	JZ	RECR		Yes, abort
	CPI	'?'		Register display?
	JNZ	TRL		No, ignore it
	CALL	REGDIS		Display the registers
	JMP	TRTB		And go again
*
* Main entry point for the 8080 debugger
*
BEGIN	LXI	SP,DSTACK	Set up initial stack pointer
	CALL	INIT		Set up hardware
	CALL	PRTMSG		Output herald message
	DB	$0A,$0D
	STR	'MON85 Version 1.1'
	DB	$0A,$0D,$0A
	STR	'Copyright 1979-2006 Dave Dunfield'
	DB	$0A,$0D
	STR	'All rights reserved.'
	DB	$0A,0
	LXI	H,UBASE		Point to start of reserved RAM
	MVI	C,DSTACK-UBASE	Number of bytes to zero
INIL1	MVI	M,0		Clear a byte
	INX	H		Advance
	DCR	C		Reduce count
	JNZ	INIL1		Clear em all
;	MVI	A,1		0100
;	STA	UBASE+1		Set high
	LXI	H,$FFFF		Set flags
	SHLD	SFLAG		Turn on SUBTRACE & AUTOREG
	LXI	H,UBASE		Default user stack (below monitor RAM)
	SHLD	SP		Set user SP
* Prompt for an input command
RECR	CALL	LFCR		new line
REST	LXI	SP,DSTACK	Reset stack pointer
	CALL	PRTMSG		Output message
	STRZ	'> '		Command prompt
	CALL	INPT		Get command character
* Look up command in table
	LXI	H,CTABLE	Point to command table
REST0	MOV	B,A		Save for later
REST1	MOV	A,M		Get char
	INX	H		Advance
	CMP	B		Do it match?
	JZ	REST2		Yes, go for it
	INX	H		Skip HIGH address
	INX	H		Skip LOW address
	ANA	A		end of table?
	JNZ	REST1		Its OK
* Error has occured, issue message & return for command
ERROR	MVI	A,'?'		Error indicator
	CALL	OUT		Display
	JMP	RECR		And wait for command
* We have command, execute it
REST2	INX	D		Skip command character
	MOV	A,M		Get low address
	INX	H		Skip to next
	MOV	H,M		Get HIGH address
	MOV	L,A		Set LOW
	CALL	SKIP		Set 'Z' of no operands
	PCHL			And execute
* Extended commands
XCMD	CALL	SKIP		Get next character
	LXI	H,CTABLE1	Next command table
	JMP	REST0		And proceed
* Table of commands to execute
CTABLE	DB	'A'		Set AUTOREG flag
	DW	AUTO
	DB	'B'		Set/Display breakpoint
	DW	SETBRK
	DB	'C'		Copy memory
	DW	COPY
	DB	'D'		Disassemble
	DW	GODIS
	DB	'E'		Edit memory
	DW	EDIT
	DB	'F'		Fill memory
	DW	FILL
	DB	'G'		Go (begin execution)
	DW	GO
	DB	'I'		Input from port
	DW	INPUT
	DB	'L'		Load from serial port
	DW	LOAD
	DB	'M'		Memory display
	DW	MEMRY
	DB	'O'		Output to port
	DW	OUTPUT
	DB	'R'		Set/Display Registers
	DW	REGIST
	DB	'S'		Set SUBTRACE flag
	DW	SUBON
	DB	'T'		Set TRACE mode
	DW	TRACE
	DB	'U'		Set/Display user base
	DW	USRBASE
	DB	'V'		Install vectors
	DW	INSTV
	DB	'X'		extended command
	DW	XCMD
	DB	'?'		Help command
	DW	HELP
	DB	0		End of table
	DW	REST		Handle NULL command
CTABLE1	DB	'T'
	DW	MTEST
	DB	'R'
	DW	XREAD
	DB	'W'
	DW	XWRITE
	DB	'I'
	DW	XIN
	DB	'O'
	DW	XOUT
	DB	0
	DW	ERROR
*
* Help command
*
HELP	LXI	H,HTEXT		Point to help text
	SUB	A		Get a zero
	STA	OFLAG		Clear the output flag
* Output each line
HELP1	MVI	C,25		Column counter
HELP2	MOV	A,M		Get character
	INX	H		Advance to next
	ANA	A		End of line?
	JZ	HELP4		Yes, terminate
	CPI	'!'		Separator?
	JZ	HELP3		Yes, output
	CALL	OUT		Write character
	DCR	C		Reduce count
	JMP	HELP2		Keep going
* Fill with spaces to discription column
HELP3	CALL	SPACE		Output a space
	DCR	C		Reduce count
	JNZ	HELP3		Do them all
	MVI	A,'-'		Spperator
	CALL	OUT		Display
	CALL	SPACE		And space over
	JMP	HELP2		Output rest of line
* End of line encountered...
HELP4	CALL	CHKSUS		New line
	MOV	A,M		Get next byte
	ANA	A		End of text?
	JNZ	HELP1		Do them all
	JMP	REST		And go home
*
* Input from port
*
INPUT	CALL	SETIN		Get port number
	CALL	PRTMSG		Output message
	STRZ	'DATA='
	CALL	INST		Perform the read
	CALL	HPR		Output it
	JMP	RECR		Newline & EXIT
*
* Output to port
*
OUTPUT	CALL	SETOUT		Get port number
	MOV	A,L		Copy to ACC for out
	CALL	INST		Output the data
	JMP	REST		Back to command prompt
*
* Set breakpoint command
*
SETBRK	JZ	DISBRK		No operands, display breakpoints
* Set a breakpoint
	CALL	CALC		Get hex operand
	MOV	A,L		Get low value of operand
	CPI	8		In range?
	JNC	ERROR		No, invalud
	LXI	H,BRKTAB-3	Point to breakpoint table
	LXI	B,3		Offset for a breakpoint
SBRLP	DAD	B		Advance to next breakpoint
	DCR	A		Reduce count
	JP	SBRLP		Go until we are there
	PUSH	H		Save table address
	CALL	CALC		Get address
	POP	D		Restore address
	XCHG			D=brkpt address, H=table address
	MOV	M,D		Set HIGH address in table
	INX	H		Advance
	MOV	M,E		Set LOW address in table
	INX	H		Advance
	LDAX	D		Get opcode from memory
	MOV	M,A		Save in table
	JMP	REST		And get next command
* Display breakpoints
DISBRK	LXI	D,BRKTAB	Point to breakpoint table
	MVI	B,'0'		Begin with breakpoint zero
DISLP	MVI	A,'B'		Lead in character
	CALL	OUT		Output
	MOV	A,B		Get breakpoint number
	CALL	OUT		Output
	MVI	A,'='		Seperator character
	CALL	OUT		Output
	LDAX	D		Get HIGH address
	MOV	H,A		Copy
	INX	D		Advance
	LDAX	D		Get LOW address
	MOV	L,A		Copy
	ORA	H		Is breakpoint set?
	JZ	NOTSET		No, don't display
	CALL	HLOUT		Output in hex
	JMP	GIVLF		And proceed
* Breakpoint is not set
NOTSET	CALL	PRTMSG		Output message
	STRZ	'****'		Indicate not set
GIVLF	MVI	A,' '		Get a space
	CALL	OUT		Output
	CALL	OUT		Output
	MOV	A,B		Get breakpoint address
	CPI	'0'+3		Halfway through?
	CZ	LFCR		Yes, new line
	INX	D		Skip low byte
	INX	D		Skip opcode
	INR	B		Advance breakpoint number
	MOV	A,B		Get number again
	CPI	'0'+8		All done?
	JC	DISLP		No, keep going
	CALL	LFCR		New line
	LXI	H,AUTMSG	Message for AFLAG
	LDA	AFLAG		Get flag state
	CALL	DISON		Display ON/OFF indication
	LXI	H,SUBMSG	Message for SFLAG
	LDA	SFLAG		Get flag state
	CALL	DISON		Display ON/OFF indication
	LXI	H,TRCMSG	Message for TFLAG
	LDA	TFLAG		Get flag state
	CALL	DISON		Display ON/OFF indication
	CALL	LFCR		New line
	JMP	REST		Back for another command
* Display ON/OFF flag state
DISON	PUSH	PSW		Save A
	CALL	PRTSTR		Output message
	POP	PSW		Restore A
	LXI	H,OFF		Assume OFF
	ANA	A		Test A
	JZ	PRTSTR		Yes, display OFF
	LXI	H,ON		Convert to ON
	JMP	PRTSTR		And display ON
*
* GO command, Begin program execution
*
GO	JZ	NOHEX		Address not given, assume default
	CALL	CALC		Get argument
	SHLD	PC		Save new PC value
NOHEX	LDA	TFLAG		Get trace flag
	ANA	A		Enabled?
	JNZ	TRTB		Yes, wait for prompt
* Single-step one instruction...
* Used for first instruction even when NOT tracing, so
* that we can insert breakpoints
NOADR	SUB	A		Get NOP
	MOV	H,A		Set high
	MOV	L,A		Set LOW
	STA	INST		Set first byte
	SHLD	INST+1		Set second & third
	LHLD	PC		Get PC
	XCHG			Set DE to PC
	CALL	LOOK		Lookup instruction
	MOV	B,A		Save the TYPE/LENGTH byte
	ANI	$03		Mask TYPE, save LENGTH
	MOV	C,A		Save for count
* Copy instruction into "faking" area
	LXI	H,INST		Point to saved instruction
GOSET	LDAX	D		Get byte from code
	MOV	M,A		Save in instruction
	INX	H		Advance output
	INX	D		Advance input
	DCR	C		Reduce count
	JNZ	GOSET		Copy it all
	XCHG			HL = addrss to execute
	MVI	A,$C3		Get a JMP instruction
	STA	INST+3		Set up a JUMP instruction
	SHLD	INST+4		Set target address
	LDA	TFLAG		Get trace flag
	ANA	A		Are we tracing?
	JZ	NOTRC		No, we are not
	PUSH	B		Save TYPE/LENGTH
	LHLD	PC		Get PC address
	XCHG			Set up 'DE' as operand pointer
	CALL	DINST		Disassemble the instruction
	CALL	LFCR		New line
	LHLD	INST+4		Get termination address
	INX	H		Skip this one
	SHLD	BUFFER		Save for "fake" handling
	LXI	H,FAKE		Point to FAKE routine
	SHLD	INST+4		Save new addres
	POP	B		Restore TYPE/LENGTH
* Simulate any control transfer instruction
	LDA	INST		Get instruction
	CPI	$E9		Is it PCHL?
	JNZ	NOPCHL		No, its ok
	LHLD	HL		Get user HL value
	JMP	HLJMP		And simulate a jump
NOPCHL	MOV	A,B		Get TYPE back
	CPI	$0B		Is it a 'JUMP'
	JZ	GOJMP		Yes, handle it
	CPI	$05		Is it a 'RETURN'
	JZ	CALRET		Yes, handle it
	ANI	$F8		Save only conditional bits
	JZ	NOTRC		Not conditional, always execute instruction
	ANI	$08		Does this test require COMPLEMENTED flags
	LDA	PSW		Get status flags
	JZ	NOCOM		No need to complement
	CMA			Invert for NOT tests
NOCOM	MOV	C,A		Save PSW bits
	MOV	A,B		Get conditon back
	RAL			Is it SIGN flag?
	JC	SIGN		Yes, handle it
	RAL			Is it ZERO flag?
	JC	ZERO		Yes, handle it
	RAL			Is it PARITY flag?
	JC	PARITY		Yes, handle it
* This instruction is conditional on the CARRY flag
CARRY	MOV	A,C		Get flag bits
	ANI	$01		Test CARRY flag
	JMP	ENFLG		And proceed
* This instruction is conditional on the SIGN flag
SIGN	MOV	A,C		Get flag bits
	ANI	$80		Test SIGN flag
	JMP	ENFLG		And proceed
* This instruction is conditional on the ZERO flag
ZERO	MOV	A,C		Get flag bits
	ANI	$40		Test ZERO flag
	JMP	ENFLG		And proceed
* This instruction is conditional on the PARITY flag
PARITY	MOV	A,C		Get flag bits
	ANI	$04		Test PARITY flag
* Execute conditional instruction
ENFLG	JZ	NOTRC		Not executed
	MOV	A,B		Get type back
	ANI	$04		Is it JUMP
	JNZ	CALRET		No, try next
* Simulate a JUMP instruction
GOJMP	LDA	INST		Get instruction
	CPI	$CD		Is it a CALL
	JZ	PADR		Yes
	ANI	$C7		Mask conditional
	CPI	$C4		Conditional call?
	JNZ	NOPSH		No, its a jump
* Simulate a subroutine trace
PADR	LDA	SFLAG		Get subroutine tracing flag
	ANA	A		Is it set?
	JZ	NOTRC		No, simulate as one instruction
	LHLD	BUFFER		Get termination address
	DCX	H		Backup
	XCHG			D = address
	LHLD	SP		Get user SP
	DCX	H		Backup
	MOV	M,D		Set HIGH return address
	DCX	H		Backup
	MOV	M,E		Set LOW return address
	SHLD	SP		Resave user SP
* Continue simulation of a JUMP type instruction
NOPSH	LHLD	INST+1		Get target address
	JMP	HLJMP		And proceed
* Handle simulation of RETURN instruction
CALRET	LHLD	SP		Get sser SP
	MOV	E,M		Get LOW return address
	INX	H		Advance
	MOV	D,M		Get HIGH return address
	INX	H		Advance
	SHLD	SP		Resave user SP
	XCHG			Set HL = address
* Simulate a jump to the address in HL
HLJMP	INX	H		Advance
	SHLD	BUFFER		Save new target address
	SUB	A		Get NOP
	MOV	H,A		Set HIGH
	MOV	L,A		Set LOW
	STA	INST		NOP first byte
	SHLD	INST+1		NOP second byte
* Dispatch the user program
* First, insert any breakpoints into the object code
NOTRC	LXI	D,BRKTAB	Point to breakpoint table
	MVI	C,8		Size of table (in entries)
RESBP	LDAX	D		Get a HIGH address
	MOV	H,A		Save for later
	INX	D		Advance
	LDAX	D		Get low address
	MOV	L,A		Save for later
	INX	D		Advance
	ORA	H		Is breakpoint enabled?
	JZ	NORES		No, its not
	MVI	M,$CF		Set up a RST 1 breakpoint
NORES	INX	D		Skip opcode
	DCR	C		Reduce count
	JNZ	RESBP		Do them all
* Restore the user applications registers
	LHLD	SP		Get stack pointer
	SPHL			Set stack pointer
	LHLD	BC		Get BC
	PUSH	H		Save
	POP	B		And set
	LHLD	PSW		Get PSW
	PUSH	H		Save
	POP	PSW		And set
	LHLD	DE		Get DE
	XCHG			Set DE
	LHLD	HL		Get HL
	JMP	INST		Execute "faked" instruction
* Trace routine: simulate a breakpoint interrupt
FAKE	PUSH	H		Save HL on stack
	LHLD	BUFFER		Get address to execute
	XTHL			Restore HL, [SP] = address
	JMP	ENTRY		Display the registers
*
* Display/Change registers
*
REGIST	JNZ	CHG1		Register name to change is given
* Display registers
	CALL	REGDIS		Display registers
	JMP	REST		And exit
* Set register value
CHG1	MOV	B,A		Save command char
	CALL	GETCHI		Get char (in upper case)
	MOV	C,A		Save for later
	JZ	OKCH		End of string
* Drop extra characters incase 'PSW'
CHG2	CALL	GETCHR		Get next
	JNZ	CHG2		Clean them out
* Get new value for register
OKCH	CALL	CALC		Get new value
	MOV	A,B		Get first char
	CPI	'H'		Is it HL pair
	JNZ	CDE		No, try next
	SHLD	HL		Set HL value
	JMP	REST		And proceed
CDE	CPI	'D'		Is it DE pair?
	JNZ	CBC		No, try next
	SHLD	DE		Set DE value
	JMP	REST		And proceed
CBC	CPI	'B'		Is it BC pair?
	JNZ	CSP		No, try next
	SHLD	BC		Set BC value
	JMP	REST		And proceed
CSP	CPI	'S'		Is it SP?
	JNZ	CP		No, try next
	SHLD	SP		Set SP value
	JMP	REST		And proceed
CP	CPI	'P'		Is it PS or PC
	JNZ	ERROR		No, error
	MOV	A,C		Get low character
	CPI	'S'		Is it PSW?
	JNZ	CPC		No, try next
	SHLD	PSW		Set new PSW
	JMP	REST		And proceed
CPC	CPI	'C'		Is it PC?
	JNZ	ERROR		No, error
	SHLD	PC		Set new PC
	JMP	REST		And proceed
* Process an ON/OFF operand
ONOFF	CALL	SKIP		Get next char
	CPI	'O'		Must begin with ON
	JNZ	ERROR		Invalid
	CALL	GETCHI		Get next char
	MVI	B,0		Assume OFF
	CPI	'F'		OFF?
	JZ	RETON		Yes, set it
	CPI	'N'		ON?
	JNZ	ERROR		No, error
	DCR	B		Convert to FF
RETON	MOV	A,B		Save new value
	RET
*
* Turn automatic register display ON or OFF
*
AUTO	CALL	ONOFF		Get ON/OFF value
	STA	AFLAG		Set AUTOREG flag
	JMP	REST		And proceed
*
* Turn SUBROUTINE tracing ON or OFF
*
SUBON	CALL	ONOFF		Get ON/OFF value
	STA	SFLAG		Set SUBTRACE flag
	JMP	REST		And proceed
*
* Set TRACE mode ON or OFF
*
TRACE	CALL	ONOFF		Get ON/OFF value
	STA	TFLAG		Set TRACE flag
	JMP	REST		And proceed
*
* Edit memory contents
*
EDIT	CALL	CALC		Get address
EDIT1	CALL	HLOUT		Display address
	CALL	SPACE		Separator
	MOV	A,M		Get contents
	CALL	HPR		Output
	MVI	A,'='		Prompt
	CALL	OUT		Output
	PUSH	H		Save address
	CALL	INPT		Get a value
	POP	H		Restore address
	INX	H		Assume advance
	JZ	EDIT1		Null, advance
	DCX	H		Fix mistake
	DCX	H		Assume backup
	CPI	'-'		Backup?
	JZ	EDIT1		Yes, backup a byte
	INX	H		Fix mistake
	CPI	$27		Single quote?
	JNZ	EDIT3		No, try hex value
* Handle quoted ASCII text
	INX	D		Skip the quote
EDIT2	LDAX	D		Get char
	INX	D		Advance input
	ANA	A		End of loop?
	JZ	EDIT1		Yes, exit
	MOV	M,A		Save it
	INX	H		Advance output
	JMP	EDIT2		And proceed
* Handle HEXIDECIMAL values
EDIT3	PUSH	H		Save address
	CALL	CALC		Get HEX value
	MOV	A,L		Get value
	POP	H		HL = address
	MOV	M,A		Set value
	INX	H		Advance to next
	CALL	SKIP		More operands?
	JNZ	EDIT3		Get then all
	JMP	EDIT1		And continue
*
* FIll memory with a value
*
FILL	CALL	CALC		Get starting address
	PUSH	H		Save for later
	CALL	CALC		Get ending address
	MOV	B,H		BC = End address
	MOV	C,L
	CALL	CALC		Get value
	XCHG			DE = value
	POP	H		HL = Starting address
FILL1	MOV	M,E		Save one byte
	CALL	COMP16		Test for match
	INX	H		Advance
	JC	FILL1		And proceed
	JMP	REST		Back for next
* 16 bit compare of HL to BC
COMP16	MOV	A,H		Get HIGH
	CMP	B		Match?
	RNZ			No, we are done
	MOV	A,L		Get LOW
	CMP	C		Match?
	RET
*
* Copy a block of memory
*
COPY	CALL	CALC		Get SOURCE address
	PUSH	H		Save for later
	CALL	CALC		Get DEST Address
	MOV	B,H		BC = Dest address
	MOV	C,L
	CALL	CALC		Get size
	XCHG			DE = Size
	POP	H		HL = Source
COPY1	MOV	A,D		Get HIGH size
	ORA	E		More to go?
	JZ	REST		No, exit
	MOV	A,M		Get byte from source
	STAX	B		Write to dest
	INX	H		Advance source
	INX	B		Advance dest
	DCX	D		Reduce count
	JMP	COPY1		And proceed
*
* Install monitor vectors
*
INSTV	XRA	A
	MOV	L,A		low source
	MOV	B,A		high dest
	MOV	C,A		low dest
	MOV	D,A		high size
	MVI	H,=ROM		high source
	MVI	E,$40		Set size
	JMP	copy1		Restore vectors
*
* Test memory
*
MTEST	CALL	CALC		Get source address
	PUSH	H		Save for later
	CALL	CALC		Get end address
	MOV	B,H		BX = end address
	MOV	C,L
	XRA	A		Get zero
	MOV	D,A		Zero initial
	MOV	H,A		Zero high
	MOV	L,A		Zero low
	SHLD	INST		Record counter
	POP	H		Get address
	PUSH	H		Resave
mtest1	MOV	M,D		Zero one byte
	CALL	COMP16		At end?
	INX	H		Skip to next
	JC	mtest1		Do them all
mtest2	MOV	E,D		Save old
	INR	D		Set new
	JNZ	mtest3		No wrap
	LHLD	INST		Get count
	INX	H		Advance
	SHLD	INST		Resave
mtest3	CALL	CR		new line
	LHLD	INST		Get count
	CALL	HLOUT		Display
	CALL	SPACE		Space over
	MOV	A,D		Get value
	CALL	HPR		Display
	POP	H		Restore address
	CALL	CHKSUS1		Test for exit
	PUSH	H		Save address
mtest4	MOV	A,M		Get mem
	CMP	E		Match?
	JZ	mtest5		It's OK
; Memory error
	PUSH	PSW		Save data
	CALL	SPACE
	CALL	HLOUT		Display H
	CALL	SPACE
	MOV	A,E
	CALL	HPR
	CALL	SPACE
	POP	PSW
	CALL	HPR
	CALL	LFCR		
mtest5	MOV	M,D		Set new value
	CALL	COMP16		Test for at end
	INX	H		Advance
	JC	mtest4		Test them all
	JMP	mtest2		And continue
*
* Loop read
*
XREAD	CALL	CALC		Read memory
xread1	MOV	A,M		Read value
	CALL	CHKSUS1		Test for exit
	JMP	xread1		And continue
*
* Loop write
*
XWRITE	CALL	CALC		Read memory
	PUSH	H		Save address
	CALL	CALC		Get data
	POP	D		DE = Address
	XCHG			HL = address E = DATA
xwrite1	MOV	M,E		Write to memory
	CALL	CHKSUS1		Test for exit
	JMP	xwrite1		And continue
*
* Loop input
*
XIN	CALL	SETIN		Setup for input
xin1	CALL	INST		Read data
	CALL	CHKSUS1		Test for exit
	JMP	xin1		And continue
*
* Loop output
*
XOUT	CALL	SETOUT		Setup for output
xout1	MOV	A,L		Get data
	CALL	INST		Perform output
	CALL	CHKSUS1		Test for exit
	JMP	xout1		And continue
*
* Display a block of memory
*
MEMRY	CALL	CALC		Get operand
	SUB	A		Get a ZERO
	STA	OFLAG		Clear output flag
ALOOP	CALL	HLOUT2		Display address (in hex) with 2 spaces
	MVI	D,16		16 bytes/line
	PUSH	H		Save address
ALP1	MOV	A,M		Get byte
	CALL	HPR		Output in hex
	CALL	SPACE		Space over
	MOV	A,D		Get count
	CPI	9		At boundary?
	CZ	SPACE		Yes, extra space
	MOV	A,D		Get count
	ANI	7		Mask for low bits
	CPI	5		At boundary?
	CZ	SPACE		Extra space
	INX	H		Advance address
	DCR	D		Reduce count
	JNZ	ALP1		Do them all
	MVI	D,4		# separating spaces
AL2	CALL	SPACE		Output a space
	DCR	D		Reduce count
	JNZ	AL2		And proceed
	POP	H
	MVI	D,16		16 chars/display
AL3	MOV	A,M		Get data byte
	CALL	OUTP		Display (if printable)
	INX	H		Advance to next
	DCR	D		Reduce count
	JNZ	AL3		Do them all
	CALL	CHKSUS		Handle output suspension
	JMP	ALOOP		And continue
*
* Perform disassembly to console
*
GODIS	CALL	CALC		Get starting address
	PUSH	H		Save address
	POP	D		Copy to D
	SUB	A		Get a zero
	STA	OFLAG		Clear output flag
VLOOP	CALL	DINST		Display one instruction
	CALL	CHKSUS		Handle output
	JMP	VLOOP		And proceed
*
* Set/display user base address
*
USRBASE	JNZ	USRB1		Address is given, set it
	CALL	PRTMSG		Output message
	STRZ	'BASE='
	LHLD	UBASE		Get address
	CALL	HLOUT		Output
	JMP	RECR		New line & exit
USRB1	CALL	CALC		Get operand
	SHLD	UBASE		Set the address
	JMP	REST		and return
*
* Download command
*
LOAD	MVI	A,$0F		Get default initial state
	JZ	LOAD1		Address not given...
	CALL	CALC		Get operand value
	SHLD	BUFFER+3	Save for later calulation
	MVI	A,$FF		Set new initial state
* Setup the offset calculator
LOAD1	LXI	H,0		Assume no offset
	STA	BUFFER		Set mode flag
	SHLD	BUFFER+1	Assume offset is ZERO
* Download the records
LOAD2	CALL	DLREC		Get a record
	JNZ	DLBAD		Report error
	JNC	LOAD2		Get them all
	JMP	DLWAIT		And back to monitor
* Error in receiving download record
DLBAD	CALL	PRTMSG		Output message
	STR	'?Load error'
	DB	$0A,$0D,0
* Wait till incoming data stream stops
DLWAIT	MVI	C,0		Initial count
DLWAIT1	CALL	IN		Test for input
	ANA	A		Any data
	JNZ	DLWAIT		Reset count
	DCR	C		Reduce counter
	JNZ	DLWAIT1		Keep looking
	JMP	REST		Back to monitor
*
* Download a record from the serial port
*
DLREC	CALL	INCHR		Read a character
	CPI	':'		Start of record?
	JZ	DLINT		Download INTEL format
	CPI	'S'		Is it MOTOROLA?
	JNZ	DLREC		No, keep looking
* Download a MOTOROLA HEX format record
DLMOT	CALL	INCHR		Get next character
	CPI	'0'		Header record?
	JZ	DLREC		Yes, skip it
	CPI	'9'		End of file?
	JZ	DLEOF		Yes, report EOF
	CPI	'1'		Type 1 (code) record
	JNZ	DLERR		Report error
	CALL	GETBYT		Get length
	MOV	C,A		Start checksum
	SUI	3		Convert for overhead
	MOV	B,A		Save data length
	CALL	GETBYT		Get first byte of address
	MOV	H,A		Set HIGH address
	ADD	C		Include in checksum
	MOV	C,A		And re-save
	CALL	GETBYT		Get next byte of address
	MOV	L,A		Set LOW address
	ADD	C		Include in checksum
	MOV	C,A		And re-save
	CALL	SETOFF		Handle record offsets
DMOT1	CALL	GETBYT		Get a byte of data
	MOV	M,A		Save in memory
	INX	H		Advance
	ADD	C		Include in checksum
	MOV	C,A		And re-save
	DCR	B		Reduce length
	JNZ	DMOT1		Keep going
	CALL	GETBYT		Get record checksum
	ADD	C		Include calculated checksum
	INR	A		Adjust for test
	ANA	A		Clear carry set Z
	RET
* Download a record in INTEL hex format
DLINT	CALL	GETBYT		Get length
	ANA	A		End of file?
	JZ	DLEOF		Yes, handle it
	MOV	C,A		Begin Checksum
	MOV	B,A		Record length
	CALL	GETBYT		Get HIGH address
	MOV	H,A		Set HIGH address
	ADD	C		Include in checksum
	MOV	C,A		Re-save
	CALL	GETBYT		Get LOW address
	MOV	L,A		Set LOW address
	ADD	C		Include in checksum
	MOV	C,A		Re-save
	CALL	SETOFF		Handle record offsets
	CALL	GETBYT		Get type byte
	ADD	C		Include in checksum
	MOV	C,A		Re-save
DLINT1	CALL	GETBYT		Get data byte
	MOV	M,A		Save in memory
	INX	H		Advance to next
	ADD	C		Include in checksum
	MOV	C,A		Resave checksum
	DCR	B		Reduce count
	JNZ	DLINT1		Do entire record
	CALL	GETBYT		Get record checksum
	ADD	C		Add to computed checksum
	ANA	A		Clear carry, set Z
	RET
* End of file on download
DLEOF	STC			Set carry, EOF
	RET
*
* Process record offsets for download records
*
SETOFF	LDA	BUFFER		Get flag
	ANA	A		Test flag
	JNZ	SETOF1		Special case
* Not first record, adjust for offset & proceed
	XCHG			DE = address
	LHLD	BUFFER+1	Get offset
	DAD	D		HL = address + offset
	RET
* First record, set USER BASE & calculate offset (if any)
SETOF1	MVI	A,0		Get zero (NO CC)
	STA	BUFFER		Clear flag
	SHLD	UBASE		Set user program base
	RP			No more action
* Calculate record offset to RAM area
	XCHG			DE = address
	LHLD	BUFFER+3	Get operand
	MOV	A,L		Subtract
	SUB	E		Record
	MOV	L,A		From
	MOV	A,H		Operand
	SBB	D		To get
	MOV	H,A		Offset
	SHLD	BUFFER+1	Set new offset
	DAD	D		Get address
	RET
*
* Gets a byte of HEX data from serial port.
*
GETBYT	CALL	GETNIB		Get first nibble
	RLC			Shift into
	RLC			Upper nibble
	RLC			Of result
	RLC			To make room for lower
	MOV	E,A		Keep high digit
	CALL	GETNIB		Get second digit
	ORA	E		Insert high digit
	RET
* GETS A NIBBLE FROM THE TERMINAL (IN ASCII HEX)
GETNIB	CALL	INCHR		Get a character
	SUI	'0'		Is it < '0'?
	JC	GETN1		Yes, invalid
	CPI	10		0-9?
	RC			Yes, its OK
	SUI	7		Convert
	CPI	10		9-A?
	JC	GETN1		Yes, invalid
	CPI	16		A-F?
	RC			Yes, its OK
GETN1	POP	D		Remove GETNIB RET addr
	POP	D		Remove GETBYT RET addr
* Error during download record
DLERR	ORI	$FF		Error indicator
	RET
*
* Read an input line from the console
*
INPT	LXI	H,BUFFER	Point to input buffer
INPT1	CALL	INCHR		Get a char
	CPI	$1B		ESCAPE?
	JZ	RECR		Back for command
	CPI	$0D		Carriage return?
	JZ	INPT4		Yes, exit
	MOV	D,A		Save for later
* Test for DELETE function
	CPI	$5F		Is it delete?
	JZ	INPT3		Yes, it is
	CPI	$08		Backspace?
	JZ	INPT3		Yes, it is
* Insert character in buffer
	MOV	A,L		Get low address
	CPI	BUFFER+30	Beyond end?
	MVI	A,7		Assume error
	JZ	INPT2		Yes, report error
	MOV	A,D		Get char back
	MOV	M,A		Save in memory
	INX	H		Advance
INPT2	CALL	OUT		Echo it
	JMP	INPT1		And proceed
* Delete last character from buffer
INPT3	MOV	A,L		Get char
	CPI	BUFFER		At begining
	MVI	A,7		Assume error
	JZ	INPT2		Report error
	PUSH	H		Save H
	CALL	PRTMSG		Output message
	DB	8,' ',8,0	Wipe away character
	POP	H		Restore H
	DCX	H		Backup
	JMP	INPT1		And proceed
* Terminate the command
INPT4	MVI	M,0		Zero terminate
	CALL	LFCR		New line
	LXI	D,BUFFER	Point to input buffer
* Advance to next non-blank in buffer
SKIP	LDAX	D		Get char from buffer
	INX	D		Advance
	CPI	' '		Space?
	JZ	SKIP		Yes, keep looking
	DCX	D		Backup to it
	JMP	TOCAP		And convert to upper
*
* Read next character from command & convert to upper case
*
GETCHI	INX	D		Skip next character
GETCHR	LDAX	D		Get char from command line
	ANA	A		End of line?
	RZ			Yes, return with it
	INX	D		Advance command pointer
*
* Convert character in A to uppercase, set Z if SPACE or EOL
*
TOCAP	CPI	$61		Lower case?
	JC	TOCAP1		Yes, its ok
	ANI	$5F		Convert to UPPER
TOCAP1	CPI	' '		Space
	RZ			Yes, indicate
	ANA	A		Set 'Z' if EOL
	RET
* Setup I/O port input subroutine
SETIN	CALL	CALC		Get port number
	MVI	A,$DB		'IN' instruction
	MVI	H,$C9		'RET' instruction
	STA	INST		Set RAM instruction
	SHLD	INST+1		Set RAM instruction
	RET
* Setup I/O port output subroutine
SETOUT	CALL	CALC		Get port number
	MVI	A,$D3		'OUT' instruction
	MVI	H,$C9		'RET' instruction
	STA	INST		Set RAM instruction
	SHLD	INST+1		Set RAM instruction
*
* Get HEX operands to command
*
CALC	PUSH	B		Save B-C
	CALL	SKIP		Find start of operand
	LXI	H,0		Begin with zero value
	MOV	C,H		Clear flag
CALC1	CALL	GETCHR		Get next char
	JZ	CALC3		End of number
	CALL	VALHEX		Is it valid hex?
	JC	ERROR		No, report error
	DAD	H		HL = HL*2
	DAD	H		HL = HL*4
	DAD	H		HL = HL*8
	DAD	H		HL = HL*16 (Shift over 4 bits)
	SUI	'0'		Convert to ASCII
	CPI	10		Decimal number?
	JC	CALC2		Yes, its ok
	SUI	7		Convert to HEX
CALC2	ORA	L		Include in final value
	MOV	L,A		Resave low bute
	MVI	C,$FF		Set flag & indicate we have char
	JMP	CALC1		And continue
* End of input string was found
CALC3	MOV	A,C		Get flag
	POP	B		Restore B-C
	ANA	A		Was there any digits?
	JZ	ERROR		No, invalid
	RET
* Test for character in A as valid hex
VALHEX	CPI	'0'		< '0'
	RC			Too low
	CPI	'G'		>'F'
	CMC			Set C state
	RC			Too high
	CPI	$3A		<='9'
	CMC			Set C state
	RNC			Yes, its OK
	CPI	'A'		Set C if < 'A'
	RET
*
* Display the user process registers
*
REGDIS	LHLD	BC		Get saved BC pair
	LXI	B,'BC'		And register names
	CALL	OUTPT		Output
	LHLD	DE		Get saved DE pair
	LXI	B,'DE'		And register names
	CALL	OUTPT		Output
	LHLD	HL		Get saved HL pair
	LXI	B,'HL'		And register names
	CALL	OUTPT		Output
	LHLD	SP		Get saved SP
	LXI	B,'SP'		And register name
	CALL	OUTPT		Output
	LHLD	PC		Get saved PC
	LXI	B,'PC'		And regsiter name
	CALL	OUTPT		Output
	CALL	PRTMSG		Output message
	STRZ	' PSW='
	LHLD	PSW		Get saved PSW
	CALL	HLOUT2		Output value (with two spaces)
	CALL	PRTMSG		Output
	STRZ	' FLAGS='
	LHLD	PSW		Get PSW again
	MVI	B,'S'		'S' flag
	CALL	OUTB		Display
	MVI	B,'Z'		'Z' flag
	CALL	OUTB		Display
	DAD	H		Skip next
	MVI	B,'A'		'A' flag
	CALL	OUTB		Display
	DAD	H		Skip next
	MVI	B,'P'		'P' flag
	CALL	OUTB		Display
	DAD	H		Skip next
	MVI	B,'C'		'C' flag
	CALL	OUTB		Display
	JMP	LFCR		New line & exit
* Display contents of a register pair
OUTPT	MOV	A,B		Get first char of name
	CALL	OUT		Output
	MOV	A,C		Get second char of name
	CALL	OUT		Output
	MVI	A,'='		Get separator
	CALL	OUT		Output
HLOUT2	CALL	HLOUT		Output value
	CALL	SPACE		Output a space
* Display a space on the console
SPACE	MVI	A,' '		Get a spave
	JMP	OUT		Display it
* Display an individual flag bit B=title, L[7]=bit
OUTB	MOV	A,L		Get flag bits
	RLC			Shift L[7] into carry
	MOV	L,A		Resave it
	RNC			Do not display
	MOV	A,B		Get character
	JMP	OUT		And display
*
* Display an instruction in disassembly format
*
DINST	PUSH	D		Save address
	MOV	A,D		Get high value
	CALL	HPR		Output
	MOV	A,E		Get low address
	CALL	HPR		Output
	CALL	SPACE		Output a space
	CALL	LOOK		Lookup instruction
	ANI	$03		Save length
	PUSH	PSW		Save length
	PUSH	H		Save table address
	MVI	B,4		4 spaces total
	MOV	C,A		Save count
	DCX	D		Backup address
* Display the opcode bytes in HEX
VLP1	INX	D		Advance
	LDAX	D		Get opcode
	CALL	HPR		Output in HEX
	CALL	SPACE		Separator
	DCR	B		Reduce count
	DCR	C		Reduce count of opcodes
	JNZ	VLP1		Do them all
* Fill in to boundary
VLP2	CALL	SPACE		Space over
	CALL	SPACE		Space over
	CALL	SPACE		Spave over
	DCR	B		Reduce count
	JNZ	VLP2		Do them all
* DISPLAY ASCII equivalent of opcodes
	POP	B		Restore table address
	POP	PSW		Restore type/length
	POP	D		Restore instruction address
	PUSH	D		Resave
	PUSH	PSW		Resave
	MVI	H,8		8 spaces/field
	ANI	$0F		Save only length
	MOV	L,A		Save for later
PCHR	LDAX	D		Get byte from opcode
	INX	D		Advance
	CALL	OUTP		Display (if printable)
	DCR	H		Reduce field count
	DCR	L		Reduce opcode count
	JNZ	PCHR		Do them all
* Space over to instruction address
SPLP	CALL	SPACE		Output a space
	DCR	H		Reduce count
	JNZ	SPLP		Do them all
	MVI	D,6		Field width
VLP3	LDAX	B		Get char from table
	ANA	A		End of string?
	JZ	VOUT1		Yes, exit
	CALL	OUT		Output it
	INX	B		Advance to next
	DCR	D		reduce count
	CPI	' '		end of name?
	JNZ	VLP3		no, keep going
* Fill in name field with spaces
VOUT	DCR	D		reduce count
	JZ	VLP3		Keep going
	CALL	SPACE		Output a space
	JMP	VOUT		And proceed
* Output operands for the instruction
VOUT1	POP	PSW		Restore type
	POP	D		Restore instruction address
	DCR	A		Is it type1?
	JZ	T1		Yes, handle it
* Type 2 -  One byte immediate date
T2	PUSH	PSW		Save type
	MVI	A,'$'		Get HEX indicator
	CALL	OUT		Output
	POP	PSW		Restore type
	DCR	A		Type 2?
	JNZ	T3		No, try next
	INX	D		Advance to data
	LDAX	D		Get data
	CALL	HPR		Output in HEX
* Type 1 - No operand
T1	INX	D
	RET
* Type 3 - Two bytes immediate data
T3	INX	D		Skip to low	
	INX	D		Skip to high
	LDAX	D		Get HIGH
	CALL	HPR		Output
	DCX	D		Backup to low
	LDAX	D		Get LOW
	CALL	HPR		Output
	INX	D		Advance to high
	INX	D
	RET
*
* Look up instruction in table & return TYPE/LENGTH[A], and string[HL]
*
LOOK	PUSH	D		Save DE
	LDAX	D		Get opcode
	MOV	B,A		Save for later
	LXI	H,ITABLE	Point to table
LOOK1	MOV	A,B		Get Opcode
	ANA	M		Mask
	INX	H		Skip mask
	CMP	M		Does it match
	INX	H		Skip opcode
	JZ	LOOK3		Yes, we found it
* This wasn't it, advance to the next
LOOK2	MOV	A,M		Get byte
	INX	H		Advance to next
	ANA	A		End of string?
	JNZ	LOOK2		No, keep looking
	JMP	LOOK1		And continue
* We found the instruction, copy over the text description
LOOK3	MOV	C,M		Save type
	INX	H		Skip type
	LXI	D,BUFFER	Point to text buffer
LOOK4	MOV	A,M		Get char from source
	INX	H		Advance to next
* Insert a RESTART vector number
	CPI	'v'		Restart vector
	JNZ	LOOK5		No, its OK
	MOV	A,B		Get opcode
	RRC			Shift it
	RRC			Over
	RRC			To low digit
	ANI	$07		Remove trash
	ADI	'0'		Convert to digit
	JMP	LOOK10		And set the character
* Insert a register pair name
LOOK5	CPI	'p'		Register PAIR?
	JNZ	LOOK6		No, try next
	MOV	A,B		Get opcode
	RRC			Shift
	RRC			Over into
	RRC			Low digit
	RRC			For lookup
	ANI	$03		Save only RP
	PUSH	H		Save HL
	LXI	H,RPTAB		Point to pair table
	JMP	LOOK9		And proceed
* Insert destination register name
LOOK6	CPI	'd'		Set destination?
	JNZ	LOOK7		No, try next
	MOV	A,B		Get opcode
	RRC			Shift
	RRC			Into low
	RRC			digit
	JMP	LOOK8		And proceed
* Insert source register name
LOOK7	CPI	's'		Source register?
	JNZ	LOOK10		No, its OK
	MOV	A,B		Get opcode
* Lookup a general processor register
LOOK8	ANI	$07		Save only source
	PUSH	H		Save HL
	LXI	H,RTAB		Point to table
* Lookup register in table
LOOK9	ADD	L		Offset to value
	MOV	L,A		Resave address
	MOV	A,M		Get character
	POP	H		Restore HL
* Save character in destination string
LOOK10	STAX	D		Save value
	INX	D		Advance to next
	ANA	A		End of list?
	JNZ	LOOK4		No, keep copying
* End of LIST
	LXI	H,BUFFER	Point to description
	MOV	A,C		Get length
	POP	D		Restore DE
	RET
*
* Opcode disassembly table: MASK, OPCODE, TYPE/LENGTH, STRINGZ
*
ITABLE	DB	$FF,$FE,$02
	STRZ	'CPI '
	DB	$FF,$3A,$03
	STRZ	'LDA '
	DB	$FF,$32,$03
	STRZ	'STA '
	DB	$FF,$2A,$03
	STRZ	'LHLD '
	DB	$FF,$22,$03
	STRZ	'SHLD '
	DB	$FF,$F5,$01
	STRZ	'PUSH PSW'
	DB	$FF,$F1,$01
	STRZ	'POP PSW'
	DB	$FF,$27,$01
	STRZ	'DAA'
	DB	$FF,$76,$01
	STRZ	'HLT'
	DB	$FF,$FB,$01
	STRZ	'EI'
	DB	$FF,$F3,$01
	STRZ	'DI'
	DB	$FF,$37,$01
	STRZ	'STC'
	DB	$FF,$3F,$01
	STRZ	'CMC'
	DB	$FF,$2F,$01
	STRZ	'CMA'
	DB	$FF,$EB,$01
	STRZ	'XCHG'
	DB	$FF,$E3,$01
	STRZ	'XTHL'
	DB	$FF,$F9,$01
	STRZ	'SPHL'
	DB	$FF,$E9,$01
	STRZ	'PCHL'
	DB	$FF,$DB,$02
	STRZ	'IN '
	DB	$FF,$D3,$02
	STRZ	'OUT '
	DB	$FF,$07,$01
	STRZ	'RLC'
	DB	$FF,$0F,$01
	STRZ	'RRC'
	DB	$FF,$17,$01
	STRZ	'RAL'
	DB	$FF,$1F,$01
	STRZ	'RAR'
	DB	$FF,$C6,$02
	STRZ	'ADI '
	DB	$FF,$CE,$02
	STRZ	'ACI '
	DB	$FF,$D6,$02
	STRZ	'SUI '
	DB	$FF,$DE,$02
	STRZ	'SBI '
	DB	$FF,$E6,$02
	STRZ	'ANI '
	DB	$FF,$F6,$02
	STRZ	'ORI '
	DB	$FF,$EE,$02
	STRZ	'XRI '
	DB	$FF,$00,$01
	STRZ	'NOP'
* 8085 specific instructions
;	DB	$FF,$20,$01
;	STRZ	'RIM'
;	DB	$FF,$30,$01
;	STRZ	'SIM'
* Jumps, Calls & Returns
	DB	$FF,$C3,$0B
	STRZ	'JMP '
	DB	$FF,$CA,$43
	STRZ	'JZ '
	DB	$FF,$C2,$4B
	STRZ	'JNZ '
	DB	$FF,$DA,$13
	STRZ	'JC '
	DB	$FF,$D2,$1B
	STRZ	'JNC '
	DB	$FF,$EA,$23
	STRZ	'JPE '
	DB	$FF,$E2,$2B
	STRZ	'JPO '
	DB	$FF,$FA,$83
	STRZ	'JM '
	DB	$FF,$F2,$8B
	STRZ	'JP '
	DB	$FF,$CD,$0B
	STRZ	'CALL '
	DB	$FF,$CC,$43
	STRZ	'CZ '
	DB	$FF,$C4,$4B
	STRZ	'CNZ '
	DB	$FF,$DC,$13
	STRZ	'CC '
	DB	$FF,$D4,$1B
	STRZ	'CNC '
	DB	$FF,$EC,$23
	STRZ	'CPE '
	DB	$FF,$E4,$2B
	STRZ	'CPO '
	DB	$FF,$FC,$83
	STRZ	'CM '
	DB	$FF,$F4,$8B
	STRZ	'CP '
	DB	$FF,$C9,$05
	STRZ	'RET'
	DB	$FF,$C8,$45
	STRZ	'RZ'
	DB	$FF,$C0,$4D
	STRZ	'RNZ'
	DB	$FF,$D8,$15
	STRZ	'RC'
	DB	$FF,$D0,$1D
	STRZ	'RNC'
	DB	$FF,$E8,$25
	STRZ	'RPE'
	DB	$FF,$E0,$2D
	STRZ	'RPO'
	DB	$FF,$F8,$85
	STRZ	'RM'
	DB	$FF,$F0,$8D
	STRZ	'RP'
* Register based instructions
	DB	$C0,$40,$01
	STRZ	'MOV d,s'
	DB	$C7,$06,$02
	STRZ	'MVI d,'
	DB	$F8,$90,$01
	STRZ	'SUB s'
	DB	$F8,$98,$01
	STRZ	'SBB s'
	DB	$F8,$80,$01
	STRZ	'ADD s'
	DB	$F8,$88,$01
	STRZ	'ADC s'
	DB	$F8,$A0,$01
	STRZ	'ANA s'
	DB	$F8,$B0,$01
	STRZ	'ORA s'
	DB	$F8,$A8,$01
	STRZ	'XRA s'
	DB	$F8,$B8,$01
	STRZ	'CMP s'
	DB	$C7,$04,$01
	STRZ	'INR d'
	DB	$C7,$05,$01
	STRZ	'DCR d'
* Register pair instructions
	DB	$CF,$01,$03
	STRZ	'LXI p,'
	DB	$EF,$0A,$01
	STRZ	'LDAX p'
	DB	$EF,$02,$01
	STRZ	'STAX p'
	DB	$CF,$03,$01
	STRZ	'INX p'
	DB	$CF,$0B,$01
	STRZ	'DCX p'
	DB	$CF,$09,$01
	STRZ	'DAD p'
	DB	$CF,$C5,$01
	STRZ	'PUSH p'
	DB	$CF,$C1,$01
	STRZ	'POP p'
* Restart instruction
	DB	$C7,$C7,$01
	STRZ	'RST v'
* This entry always matches invalid opcodes
	DB	$00,$00,$01
	STRZ	'DB '
* Misc Strings and messages
ON	STRZ	'ON '
OFF	STRZ	'OFF'
AUTMSG	STRZ	'AUTOREG='
SUBMSG	STRZ	' SUBTRACE='
TRCMSG	STRZ	' TRACE='
HTEXT	STR	'MON85 Commands:'
	DB	$0A,$0D,0
	STRZ	'A ON|OFF!Enable/Disable Automatic register display'
	STRZ	'B [bp address]!Set/Display breakpoints'
	STRZ	'C <src> <dest> <size>!Copy memory'
	STRZ	'D <address>!Display memory in assembly format'
	STRZ	'E <address>!Edit memory'
	STRZ	'F <start> <end> <value>!Fill memory'
	STRZ	'G [address]!Begin/Resume execution'
	STRZ	'I <port>!Input from port'
	STRZ	'L [address]!Load image into memory'
	STRZ	'M <address>!Display memory in hex dump format'
	STRZ	'O <port> <data>!Output to port'
	STRZ	'R [rp value]!Set/Display program registers'
	STRZ	'S ON|OFF!Enable/Disable Subroutine trace'
	STRZ	'T ON|OFF!Enable/Disable Trace mode'
	STRZ	'U [address]!Set/Display program base address'
	STRZ	'V!Install vectors'
	STRZ	'XI <port>!loop Input'
	STRZ	'XO <port> <data>!loop Output'
	STRZ	'XR <address>!loop Read'
	STRZ	'XT <start> <end>!Test memory'
	STRZ	'XW <address> <data>!loop Write'
	DB	0
*
* Read a character, and wait for it
*
INCHR	CALL	IN		Check for a character
	ANA	A		Is there any data?
	JZ	INCHR		Wait for it
	RET
*
* Display HL in hexidecimal
*
HLOUT	MOV	A,H		Get HIGH byte
	CALL	HPR		Output
	MOV	A,L		Get LOW byte
*
* Display A in hexidecimal
*
HPR	PUSH	PSW		Save low digit
	RRC			Shift
	RRC			high
	RRC			digit
	RRC			into low
	CALL	HOUT		Display a single digit
	POP	PSW		Restore low digit
HOUT	ANI	$0F		Remove high digit
	ADI	'0'		Convert to ASCII
	CPI	$3A		Numeric digit
	JC	HOK		Yes, display it
	ADI	7		Convert to ALPHA
HOK	JMP	OUT		And output it
*
* Display message [PC]
*
PRTMSG	POP	H		Get address
	CALL	PRTSTR		Output message
	PCHL			And return
*
* Display message [HL]
*
PRTSTR	MOV	A,M		Get byte from message
	INX	H		Advance to next
	ANA	A		End of message?
	RZ			Yes, exit
	CALL	OUT		Output the character
	JMP	PRTSTR		And proceed
*
* Handle output suspension
*
CHKSUS	CALL	LFCR		New line
CHKSUS1	LDA	OFLAG		Is output suspended?
	ANA	A		Test flag
	JNZ	CHKS1		Yes it is
	CALL	IN		Test for CONTROL-C interrupt
	CPI	$1B		ESCAPE?
	JZ	REST		Abort
	CPI	' '		SPACE - Suspend command
	RNZ
	STA	OFLAG		Set the flag
* Output is suspended, wait for command
CHKS1	CALL	INCHR		Get char
	CPI	' '		One line?
	RZ			Allow it
	CPI	$1B		ESCAPE?
	JZ	REST		Abort
	CPI	$0D		Resume?
	JNZ	CHKS1		Keep going
	SUB	A		Reset flag
	STA	OFLAG		Write it
	RET
* Display a character if its printable
OUTP	CPI	' '		< ' '
	JC	OUTP1		Invalid, exchange it
	CPI	$7F		Printable?
	JC	OUT		Ok to display
OUTP1	MVI	A,'.'		Set to DOT to indicate invalid
	JMP	OUT		And display
*
* Write a Line-Feed and Carriage-Return to console
*
LFCR	MVI	A,$0A		Line-feed
	CALL	OUT		Output
CR	MVI	A,$0D		Carriage return
;
; ---------- I/O dependant console functions ----------
;
; You will need to modify the 'OUT' and 'IN' functions to
; work with console I/O hardware of your system.
;
; NOTE: LFCR "falls" through into OUT which MUST be the
;       first function defined here.
;
cStat	EQU	0		3P+S Control register
cData	EQU	1		3P+S Data register
;
; Write character in ACC to console - no registers may be modified
;
OUT	PUSH	PSW		Save ACC
OUT1	IN	cStat		Read status
	ANI	$80		TX ready?
	JZ	OUT1		No, wait for it
	POP	PSW		Restore ACC
	OUT	cData		Write to data port
	RET
;
; Test for character available from CONSOLE
; Do not wait - return 0 if no console data available.
;
IN	IN	cStat		Read status
	ANI	$40		RX ready?
	RZ			No, return with 0
	IN	cData		Read data
	RET
;
; Host initialization function
; - Do nothing for 3P+S
INIT	RET
