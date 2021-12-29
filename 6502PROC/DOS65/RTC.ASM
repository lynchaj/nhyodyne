	.Title	"RTC"
;
; Program:	rtc.asm
; Author:		Andrew Lynch
; Date:		22 Feb 2007
; Enviroment:	TASM MS-DOS Z80 Cross Assembler source for CP/M
;

; constants


COLOSSUS6X0X	.EQU	1	; USE COLOSSUS 6X0X HARDWARE
ORIGINAL6X0X	.EQU	0	; USE ORIGINAL 6X0X HARDWARE

M6X0X_IOSPACE		.EQU	$E000
M6X0X_SHADOW_ROM 	.EQU	$F000
	
	  .IF COLOSSUS6X0X=1
DDRA		.EQU 	M6X0X_IOSPACE+$CF3
DDRB		.EQU 	M6X0X_IOSPACE+$CF2
DDRC		.EQU 	M6X0X_IOSPACE+$DF3
DDRD		.EQU 	M6X0X_IOSPACE+$DF2
PORTA		.EQU 	M6X0X_IOSPACE+$CFF
PORTB		.EQU 	M6X0X_IOSPACE+$CF0
PORTC		.EQU 	M6X0X_IOSPACE+$DFF
PORTD		.EQU 	M6X0X_IOSPACE+$DF0
	.ENDIF

mask_data:	.EQU	$20		; RTC data line
mask_clk:	.EQU	$40		; RTC Serial Clock line
mask_ce:	.EQU	$10		; De-activate RTC reset line


TEMPWORD	.EQU	$40
TEMP		.EQU	$42
TEMP1		.EQU	$43
TEMPPAUSE	.EQU	$44

PEM	=	$103			;PEM ENTRY
DFLFCB	=	$107			;DEFAULT FCB
TEA	=	$800			;TEA START


	.ORG	TEA			;TEA START

; print message 16 times
Print:


	LDA	#(MSG & $ff)		;SEND
	LDY	#((MSG / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM


	JSR	RTC_TOP_LOOP
 

	LDX	#14			;DEFAULT
	JMP	PEM			;AND RETURN
		
	BRK			; This code is never reached




; function RTC_BIT_DELAY
;
; based on following algorithm:
;
;  { Make a short delay }
;  PROCEDURE rtc_bit_delay;
;   var
;     x : int;
;  BEGIN
;    x := 3;
;  END;

RTC_BIT_DELAY:				; purpose is to delay ~36 uS 
					; (6) JSR INTO
	PHA				; 3
	LDA	#$02     		; 2  (1 REP AT 1 MHZ 6 REPS AT 2MHZ)
	STA	TEMPWORD		; 3
RTC_BIT_DELAY1:
	DEC	TEMPWORD		;5
	BNE	RTC_BIT_DELAY1		;3

	NOP				; 2
	NOP				; 2
	PLA				; 4
	RTS				; 6 


; function RTC_RESET
;
; based on following algorithm:
;
;  { Output a RTC reset signal }
;  PROCEDURE rtc_reset;
;  BEGIN
;    out(rtc_base,mask_data + mask_rd);
;    rtc_bit_delay();
;    rtc_bit_delay();
;    out(rtc_base,mask_data + mask_rd + mask_rst);
;    rtc_bit_delay();
;    rtc_bit_delay();
;  END;
;
RTC_RESET:
	LDA	#$70
	STA	DDRD
	LDA	#mask_data 
	STA	PORTD
	JSR	RTC_BIT_DELAY
	JSR	RTC_BIT_DELAY
	LDA	#mask_data + mask_ce
	STA	PORTD
	JSR	RTC_BIT_DELAY
	JSR	RTC_BIT_DELAY
	RTS


; function RTC_RESET_ON
;
; based on following algorithm:
;
;  { Assert RTC reset signal }
;  PROCEDURE rtc_reset_on;
;  BEGIN
;    out(rtc_base,mask_data + mask_rd);
;    rtc_bit_delay();
;    rtc_bit_delay();
;  END;

RTC_RESET_ON:
	LDA	#$70
	STA	DDRD
	LDA	#mask_data 
	STA	PORTD
	JSR	RTC_BIT_DELAY
	JSR	RTC_BIT_DELAY
	RTS

; function RTC_RESET_OFF
;
; based on following algorithm:
;
;  { De-assert RTC reset signal }
;  PROCEDURE rtc_reset_off;
;  BEGIN
;    out(rtc_base,mask_data + mask_rd + mask_rst);
;    rtc_bit_delay();
;    rtc_bit_delay();
;  END;

RTC_RESET_OFF:
	LDA	#$70
	STA	DDRD
	LDA	#mask_data +  mask_ce
	STA	PORTD
	JSR	RTC_BIT_DELAY
	JSR	RTC_BIT_DELAY
	RTS

; function RTC_WR
; input value in A
; uses X
;
;  PROCEDURE rtc_wr(n : int);
;   var
;    i : int;
;  BEGIN
;    for i := 0 while i < 8 do inc(i) loop
;       if (n and 1) <> 0 then
;          out(rtc_base,mask_rst + mask_data);
;          rtc_bit_delay();
;          out(rtc_base,mask_rst + mask_clk + mask_data);
;       else
;          out(rtc_base,mask_rst);
;          rtc_bit_delay();
;          out(rtc_base,mask_rst + mask_clk);
;       end;
;       rtc_bit_delay();
;       n := shr(n,1);
;    end loop;
;  END;

RTC_WR:
	STA	TEMP			; save accumulator as it is the DATA
	LDA	#$70
	STA	DDRD
	LDX	#$00			; set X index counter of FOR loop
RTC_WR1:
	LDA	TEMP
	
	AND	#$01
	
	CMP	#$00			; is LSB a 0 or 1?
	BEQ	RTC_WR2			; if it’s a 0, handle it at RTC_WR2.
					; LSB is a 1, handle it below
					; setup RTC latch with RST and DATA high, SCLK low
	LDA	#mask_ce + mask_data
	STA	PORTD
	JSR	RTC_BIT_DELAY		; let it settle a while
					; setup RTC with RST, DATA, and SCLK high
	LDA	#mask_ce + mask_clk + mask_data
	STA	PORTD
	JMP	RTC_WR3			; exit FOR loop 

RTC_WR2:
					; LSB is a 0, handle it below
	LDA	#mask_ce		; setup RTC latch with RST high, SCLK and DATA low
	STA	PORTD			; output to RTC latch
	JSR	RTC_BIT_DELAY		; let it settle a while
					; setup RTC with RST and SCLK high, DATA low
	LDA	#mask_ce + mask_clk
	STA	PORTD

RTC_WR3:
	JSR	RTC_BIT_DELAY		; let it settle a while
	LSR	TEMP			; move next bit into LSB position for processing to RTC
	INX				; increment A in FOR loop (A=A+1)
	CPX	#$08			; is A < $08 ?
	BNE	RTC_WR1			; No, do FOR loop again
	RTS				; Yes, end function and return


; function RTC_RD
; output value in A
; uses X
;
; function RTC_RD
;
;  PROCEDURE rtc_rd(): int ;
;   var
;     i,n,mask : int;
;  BEGIN
;    n := 0;
;    mask := 1;
;    for i := 0 while i < 8 do inc(i) loop
;       out(rtc_base,mask_rst + mask_rd);
;       rtc_bit_delay();
;       if (in(rtc_base) and #1) <> #0 then
;          { Data = 1 }
;          n := n + mask;
;       else
;          { Data = 0 }
;       end;
;       mask := shl(mask,1);
;       out(rtc_base,mask_rst + mask_clk + mask_rd);
;       rtc_bit_delay();
;    end loop;
;    return n;
;  END;

RTC_RD:
	LDA	#$50
	STA	DDRD
	LDX	#$00			; set X index counter of FOR loop

	LDA	#$00			; set A=0 output of RTC_RD is passed in A
	STA	TEMP
	LDA	#$01			; mask value
	STA	TEMP1
RTC_RD1:
					; setup RTC with RST and RD high, SCLK low
	LDA	#mask_ce 
	STA	PORTD
	JSR	RTC_BIT_DELAY		; let it settle a while
	LDA	PORTD			; input from RTC latch
	AND	#$20			; is  0 or 1?
	CMP	#$00
	BEQ	RTC_RD2			; if is a 0, handle it below
	LDA	TEMP1
	CLC
	ADC	TEMP
	STA	TEMP
					; if LSB is a 0, skip it (C=C+0)
RTC_RD2:
	ASL	TEMP1			; SHIFT MASK
	LDA	#mask_ce + mask_clk  
	STA	PORTD
	JSR	RTC_BIT_DELAY		; let it settle
	INX				; increment FOR loop (A=A+1)
	CPX	#$08			; is A < $08 ?
	BNE	RTC_RD1			; No, do FOR loop again
	LDA	TEMP
	RTS				; Yes, end function and return.  Read RTC value is in C

; function RTC_WRITE
; input address in X
; input value in Y
; uses A
;
; based on following algorithm:		
;
;  PROCEDURE rtc_write(address, value: int);
;  BEGIN
;    lock();
;    rtc_reset_off();
;    { Write command }
;    rtc_wr(128 + shl(address and $3f,1));
;    { Write data }
;    rtc_wr(value and $ff);
;    rtc_reset_on();
;    unlock();
;  END;

RTC_WRITE:
	SEI				; disable interrupts during critical section
	JSR	RTC_RESET_OFF		; turn off RTC reset
	TXA				; bring into A the address from D
	AND	#%00111111		; keep only bits 6 LSBs, discard 2 MSBs
	CLC
	ASL	A	
	CLC
	ADC	#%10000000		; set MSB to one for DS1302 COMMAND BYTE (WRITE)
	JSR	RTC_WR			; write address to DS1302
	TYA				; start processing value
	JSR	RTC_WR			; write address to DS1302
	JSR	RTC_RESET_ON		; turn on RTC reset
	CLI
	RTS


; function RTC_READ
; input address in X
; output value in Y
; uses A
;
; based on following algorithm
;
;  PROCEDURE rtc_read(address: int): int;
;   var
;     n : int;
;  BEGIN
;    lock();
;    rtc_reset_off();
;    { Write command }
;    rtc_wr(128 + shl(address and $3f,1) + 1);
;    { Read data }
;    n := rtc_rd();
;    rtc_reset_on();
;    unlock();
;    return n;
;  END;

RTC_READ:
	SEI				; disable interrupts during critical section
	JSR	RTC_RESET_OFF		; turn off RTC reset
	TXA				; bring into A the address from D
	AND	#%00111111		; keep only bits 6 LSBs, discard 2 MSBs
	CLC
	ASL	A			; rotate address bits to the left
	CLC
	ADC	#%10000001		; set MSB to one for DS1302 COMMAND BYTE (READ)
	JSR	RTC_WR			; write address to DS1302
	JSR	RTC_RD			; read value from DS1302 (value is in reg A)
	TAY
	JSR	RTC_RESET_ON		; turn on RTC reset
	CLI
	RTS


; function RTC_WR_PROTECT
; input x (address) $07
; input y (value) $80
; uses A
;
; based on following algorithm
;
;  PROCEDURE rtc_wr_protect;
;  BEGIN
;    rtc_write(7,128);
;  END;

RTC_WR_PROTECT:
	LDX	#%00000111
	LDY	#%10000000
	JSR	RTC_WRITE
	RTS


; function RTC_WR_UNPROTECT
; input D (address) $07
; input E (value) $00
; uses A
;
; based on following algorithm
;
;  PROCEDURE rtc_wr_unprotect;
;  BEGIN
;    rtc_write(7,0);
;  END;

RTC_WR_UNPROTECT:
	LDX	#%00000111
	LDY	#%00000000
	JSR	RTC_WRITE
	RTS


; function RTC_GET_TIME
; input HL (memory address of buffer)
; uses A,C,D,E
;
; based on following algorithm
;
;  PROCEDURE rtc_get_time(var buf: string);
;   var
;     n  : int;
;  BEGIN
;    lock();
;    rtc_reset_off();
;    { Write command, burst read }
;    rtc_wr(255 - 64);
;    { Read seconds }
;    n := rtc_rd(); 0
;    buf[16] := char(((n / 16) and $07)) + '0';
;    buf[17] := char((n and $0f)) + '0';
;    { Read minutes }
;    n := rtc_rd(); 1
;    buf[13] := char(((n / 16) and $07)) + '0';
;    buf[14] := char((n and $0f)) + '0';
;    buf[15] := ':';
;    { Read hours }
;    n := rtc_rd(); 2
;    buf[10] := char(((n / 16) and $03)) + '0';
;    buf[11] := char((n and $0f)) + '0';
;    buf[12] := ':';
;    { Read date }
;    n := rtc_rd(); 3
;    buf[7] := char(((n / 16) and $03)) + '0';
;    buf[8] := char((n and $0f)) + '0';
;    buf[9] := ' ';
;    { Read month }
;    n := rtc_rd(); 4
;    buf[4] := char(((n / 16) and $03)) + '0';
;    buf[5] := char((n and $0f)) + '0';
;    buf[6] := '-';
;    { Read day }
;    n := rtc_rd(); 5
;    {
;    buf[4] := char(((n / 16) and $03)) + '0';
;    buf[4] := char((n and $0f)) + '0';
;    }
;    { Read year }
;    n := rtc_rd(); 6
;    buf[1] := char(((n / 16) and $0f)) + '0';
;    buf[2] := char((n and $0f)) + '0';
;    buf[3] := '-';
;    length(buf) := 17;
;    rtc_reset_on();
;    unlock();
;  END rtc_get_time;

RTC_GET_TIME:
	SEI				; disable interrupts during DS1302 read
	JSR	RTC_RESET_OFF		; turn of RTC reset
					;    { Write command, burst read }
	LDA	#%10111111		; (255 - 64)
	JSR	RTC_WR			; send COMMAND BYTE (BURST READ) to DS1302

;    { Read seconds }

	JSR	RTC_RD			; read value from DS1302, value is in Reg A
	PHA
	; digit 16
	CLC
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	AND	#$07
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+15

	; digit 17
	PLA
	AND	#$0F
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+16

;    { Read minutes }

	JSR	RTC_RD			; read value from DS1302, value is in Reg C
	PHA
	; digit 13
	CLC
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	AND	#$07
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+12

	; digit 14
	PLA
	AND	#$0F
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+13

	; digit 15	
	LDA	#':'
	STA	RTC_PRINT_BUFFER+14

;    { Read hours }

	JSR	RTC_RD			; read value from DS1302, value is in Reg C
	PHA
	; digit 10
	CLC
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	AND	#$03
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+09

	; digit 11
	PLA
	AND	#$0F
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+10

	; digit 12
	LDA	#':'
	STA	RTC_PRINT_BUFFER+11
	
;    { Read date }

	JSR	RTC_RD			; read value from DS1302, value is in Reg C
	PHA
	; digit 07
	CLC
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	AND	#$03
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+06

	; digit 08
	PLA
	AND	#$0F
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+07

	; digit 09
	LDA	#' '
	STA	RTC_PRINT_BUFFER+08

;    { Read month }

	JSR	RTC_RD			; read value from DS1302, value is in Reg C
	PHA
	; digit 04
	CLC
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	AND	#$03
	CLC	
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+03

	; digit 05
	PLA
	AND	#$0F
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+04

	; digit 06
	LDA	#'-'
	STA	RTC_PRINT_BUFFER+05

;    { Read day }

	JSR	RTC_RD			; read value from DS1302, value is in Reg C


;    { Read year }

	JSR	RTC_RD			; read value from DS1302, value is in Reg C
	PHA
	; digit 01
	CLC
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	AND	#$0F
	CLC	
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+00

	; digit 02
	PLA
	AND	#$0F
	CLC
	ADC	#$'0'
	STA	RTC_PRINT_BUFFER+01

	; digit 03
	LDA	#'-'
	STA	RTC_PRINT_BUFFER+02

	JSR	RTC_RESET_ON		; turn RTC reset back on 
	CLI				; re-enable interrupts

	RTS				; Yes, end function and return


; function RTC_SET
; uses A, D, E
;
; based on following algorithm
;
;  { Set time to 96-02-18 19:43:00 }
;  PROCEDURE rtc_set_now;
;  BEGIN
;    rtc_wr_unprotect();
;    { Set seconds }
;    rtc_write(0,0);
;    { Set minutes }
;    rtc_write(1,$43);
;    { Set hours }
;    rtc_write(2,$19);
;    { Set date }
;    rtc_write(3,$18);
;    { Set month }
;    rtc_write(4,$02);
;    { Set day }
;    rtc_write(5,$07);
;    { Set year }
;    rtc_write(6,$96);
;    rtc_wr_protect();
;  END;

RTC_SET:

	JSR RTC_WR_UNPROTECT
	LDA	#20
	STA	RTC_PRINT_BUFFER

	; seconds
	LDX	#$00
	LDY	#$00
	JSR	RTC_WRITE

	
	LDA	#(RTC_TOP_LOOP1_SET_TIME & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_SET_TIME / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM

	LDA	#(RTC_PRINT_BUFFER & $ff)		;SEND
	LDY	#((RTC_PRINT_BUFFER / $100)& $FF)	
	LDX	#10			;MESSAGE
	JSR	PEM
		
	LDA	RTC_PRINT_BUFFER+6
	AND	#$0F
	STA	TEMP
	LDA	RTC_PRINT_BUFFER+5
	AND	#$0F
	CLC
	ASL	A
	ASL	A
	ASL	A
	ASL	A
	CLC
	ADC	TEMP
	TAY
	
	JSR 	$F528
	
; minutes
	LDX	#$01
	JSR 	RTC_WRITE

	LDA	RTC_PRINT_BUFFER+3
	AND	#$0F
	STA	TEMP
	LDA	RTC_PRINT_BUFFER+2
	AND	#$0F
	CLC
	ASL	A
	ASL	A
	ASL	A
	ASL	A
	CLC
	ADC	TEMP
	TAY
	
; hours
	LDX	#$02
	JSR	RTC_WRITE

	


	LDA	#(RTC_TOP_LOOP1_OTHER2 & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_OTHER2 / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
			
	LDA	#(RTC_TOP_LOOP1_SET_DATE & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_SET_DATE / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	
	LDA	#(RTC_PRINT_BUFFER & $ff)		;SEND
	LDY	#((RTC_PRINT_BUFFER / $100)& $FF)	
	LDX	#10			;MESSAGE
	JSR	PEM

	
	LDA	#(RTC_TOP_LOOP1_OTHER2 & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_OTHER2 / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	

	LDA	RTC_PRINT_BUFFER+6
	AND	#$0F
	STA	TEMP
	LDA	RTC_PRINT_BUFFER+5
	AND	#$0F
	CLC
	ASL	A
	ASL	A
	ASL	A
	ASL	A
	CLC
	ADC	TEMP
	TAY


; date
	LDX	#$03
	JSR	RTC_WRITE

	LDA	RTC_PRINT_BUFFER+3
	AND	#$0F
	STA	TEMP
	LDA	RTC_PRINT_BUFFER+2
	AND	#$0F
	CLC
	ASL	A
	ASL	A
	ASL	A
	ASL	A
	CLC
	ADC	TEMP
	TAY

	
; month
	LDX	#$04
	LDY	#$02
	JSR	RTC_WRITE

; day
	LDX	#$05
	LDY	#$00
	JSR	RTC_WRITE

	LDA	RTC_PRINT_BUFFER+9
	AND	#$0F
	STA	TEMP
	LDA	RTC_PRINT_BUFFER+8
	AND	#$0F
	CLC
	ASL	A
	ASL	A
	ASL	A
	ASL	A
	CLC
	ADC	TEMP
	TAY
	
	
; year
	LDX	#$06
	JSR	RTC_WRITE

	JSR	RTC_WR_PROTECT
	RTS


; function RTC_RESTART
;
; uses A, D, E,
;
; based on the following algorithm
;
;  { Restart clock, set seconds to 00 }
;  PROCEDURE rtc_restart;
;  BEGIN
;    rtc_wr_unprotect();
;    { Set seconds }
;    rtc_write(0,0);
;    rtc_wr_protect();
;  END;

RTC_RESTART:
	JSR	RTC_WR_UNPROTECT
	LDX	#$00
	LDY	#$00
	JSR	RTC_WRITE
	JSR	RTC_WR_PROTECT
	RTS


; function RTC_CHARGE_ENABLE
;
; uses A, D, E
;
; based on following algorithm
;
;  PROCEDURE rtc_charge_enable;
;  BEGIN
;    rtc_wr_unprotect();
;    { Enable trickle charger, 2kohm, 1 diode }
;    rtc_write(8,$a5);
;    rtc_wr_protect();
;  END;

RTC_CHARGE_ENABLE:
	JSR	RTC_WR_UNPROTECT
	LDX	#$08
	LDY	#$A5
	JSR	RTC_WRITE
	JSR	RTC_WR_PROTECT
	RTS


; function RTC_CHARGE_DISABLE
;
; uses A, D, E
;
; based on following algorithm
;
;  PROCEDURE rtc_charge_disable;
;  BEGIN
;    rtc_wr_unprotect();
;    { Disable trickle charger}
;    rtc_write(8,$00);
;    rtc_wr_protect();
;  END;

RTC_CHARGE_DISABLE:
	JSR	RTC_WR_UNPROTECT
	LDX	#$08
	LDY	#$00
	JSR	RTC_WRITE
	JSR	RTC_WR_PROTECT
	RTS


; function TEST_BIT_DELAY
;
; based on the following algorithm
;
;
;  PROCEDURE test_bit_delay();
;   var
;     i,t0,t1 : int;
;  BEGIN
;    putln("Testing bit delay...");
;    t0 := sys_time();
;    for i := 0 while i < 1000 do inc(i) loop
;      rtc_bit_delay();
;    end loop;
;    t1 := sys_time();
;    putln(i," rtc_bit_delay calls took ",t1-t0," ms.");
;  END;

RTC_TEST_BIT_DELAY
	LDA	#(TESTING_BIT_DELAY_MSG & $ff)		;SEND
	LDY	#((TESTING_BIT_DELAY_MSG / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM

	; test should take approximately 43 seconds based on the following code analysis
	; of Z80 T-states on a 4 MHz processor
	; =(4+15*(7+255*(7+255*(17+144+4+10)+4+10)+10)+7)/4/1000000

	LDY	#$FF
PAUSE1:
	LDA	#$$FF			; ADJUST THE TIME 13h IS FOR 4 MHZ
	STA	TEMPPAUSE
PAUSE2:
	JSR	RTC_BIT_DELAY		; CAUSE 36uS DELAY
	DEC	TEMPPAUSE		; DEC COUNTER.
	BNE	PAUSE2			; JUMP TO PAUSE2 IF A <> 0.
	DEY				; DEC COUNTER
	BNE	PAUSE1			; JUMP TO PAUSE1 IF C <> 0.

	
	LDA	#(TESTING_BIT_DELAY_OVER & $ff)		;SEND
	LDY	#((TESTING_BIT_DELAY_OVER / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	RTS


; function RTC_HELP
;
; based on following algorithm
;
;  PROCEDURE help();
;  BEGIN
;    putln();
;    putln("rtc: ",version);
;    putln("rtc: Commands: (E)xit (T)ime st(A)rt (S)et (R)aw (L)oop (C)harge (N)ocharge (H)elp");
;  END;

RTC_HELP
	LDA	#(RTC_HELP_MSG & $ff)		;SEND
	LDY	#((RTC_HELP_MSG / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	RTS


; function RTC_TOP_LOOP
;
; based on following algorithm
;
;  PROCEDURE toploop();
;   var
;     err,i,n,fd  : int;
;  BEGIN
;    putln();
;    help();
;    rtc_reset_on();
;    hold(100);
;    test_bit_delay();
;    rtc_charge_disable();
;    putln("rtc: trickle charger disabled.");
;    loop
;       put("rtc>");
;       gets(line);
;       if line = "exit" then
;          putln("Bye.");
;          exit(0);
;       elsif line = "charge" then
;          putln("Trickle charger enabled.");
;          rtc_charge_enable();
;       elsif line = "nocharge" then
;          putln("Trickle charger disabled.");
;          rtc_charge_disable();
;       elsif line = "start" then
;          rtc_restart();
;          putln("Restarting RTC");
;       elsif line = "t" then
;          rtc_get_time(line);
;          putln("Current time: ",line);
;       elsif line = "raw" then
;          putln();
;          putln("Raw read loop, hit any key to stop...");
;          while read(0,@n,1 + RD_NOWAIT) = 0 loop
;             put(#13,"sec=",hexstr(rtc_read(0))^);
;             put(" min=",hexstr(rtc_read(1))^);
;             hold(500);
;          end loop;
;       elsif line = "loop" then
;          putln();
;          putln("Clock loop, hit any key to stop...");
;          while read(0,@n,1 + RD_NOWAIT) = 0 loop
;             rtc_get_time(line);
;             put(#13,line);
;             hold(200);
;          end loop;
;       elsif line = "set" then
;          putln("Setting RTC time to 96-02-18 19:43:00");
;          rtc_set_now();
;       elsif (line = "help") or (line = "?") then
;          help();
;       elsif length(line) <> 0 then
;          putln("You typed: """,line,"""");
;       end;
;    end loop;
;  END toploop;

RTC_TOP_LOOP:
	LDA	#(CRLF_MSG & $ff)		;SEND
	LDY	#((CRLF_MSG / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM

	JSR	RTC_HELP

	JSR	RTC_RESET_ON

	JSR	RTC_BIT_DELAY
	JSR	RTC_BIT_DELAY
	JSR	RTC_BIT_DELAY

	LDA	#(RTC_TOP_LOOP1_MSG & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_MSG / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	

RTC_TOP_LOOP_1:
	LDA	#(RTC_TOP_LOOP1_PROMPT & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_PROMPT / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	
		
	LDX	#01			; CP/M console input call
	JSR	PEM

	AND	#%01011111		; handle lower case responses to menu

	CMP	#'E'
	BEQ	JRTC_TOP_LOOP_EXIT

	CMP	#'C'
	BEQ	JRTC_TOP_LOOP_CHARGE

	CMP	#'N'
	BEQ	JRTC_TOP_LOOP_NOCHARGE

	CMP	#'A'
	BEQ	JRTC_TOP_LOOP_START

	CMP	#'T'
	BEQ	JRTC_TOP_LOOP_TIME

	CMP	#'R'
	BEQ	JRTC_TOP_LOOP_RAW

	CMP	#'L'
	BEQ	JRTC_TOP_LOOP_LOOP

	CMP	#'H'
	BEQ	JRTC_TOP_LOOP_HELP

	CMP	#'D'
	BEQ	JRTC_TOP_LOOP_DELAY

	CMP	#'S'
	BEQ	JRTC_TOP_LOOP_SET

	PHA
	LDA	#(RTC_TOP_LOOP1_OTHER1 & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_OTHER1 / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	
	PLA
	LDX	#02			; CP/M Console output call
	JSR	PEM

	LDA	#(RTC_TOP_LOOP1_OTHER2 & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_OTHER2 / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	
	JMP	RTC_TOP_LOOP_1

	
JRTC_TOP_LOOP_EXIT:	JMP	RTC_TOP_LOOP_EXIT
JRTC_TOP_LOOP_CHARGE:	JMP	RTC_TOP_LOOP_CHARGE
JRTC_TOP_LOOP_NOCHARGE:	JMP	RTC_TOP_LOOP_NOCHARGE
JRTC_TOP_LOOP_START:	JMP	RTC_TOP_LOOP_START
JRTC_TOP_LOOP_TIME:	JMP	RTC_TOP_LOOP_TIME
JRTC_TOP_LOOP_RAW:	JMP	RTC_TOP_LOOP_RAW
JRTC_TOP_LOOP_LOOP:	JMP	RTC_TOP_LOOP_LOOP
JRTC_TOP_LOOP_HELP:	JMP	RTC_TOP_LOOP_HELP
JRTC_TOP_LOOP_DELAY:	JMP	RTC_TOP_LOOP_DELAY
JRTC_TOP_LOOP_SET:	JMP	RTC_TOP_LOOP_SET
	
	
	
RTC_TOP_LOOP_EXIT:
	RTS

RTC_TOP_LOOP_CHARGE:
	LDA	#(RTC_TOP_LOOP1_CHARGE & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_CHARGE / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	JSR	RTC_CHARGE_ENABLE
	JMP	RTC_TOP_LOOP_1

RTC_TOP_LOOP_NOCHARGE:
	LDA	#(RTC_TOP_LOOP1_NOCHARGE & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_NOCHARGE / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	JSR	RTC_CHARGE_DISABLE
	JMP	RTC_TOP_LOOP_1

RTC_TOP_LOOP_START:
	LDA	#(RTC_TOP_LOOP1_START & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_START / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	JSR	RTC_RESTART
	JMP	RTC_TOP_LOOP_1

RTC_TOP_LOOP_TIME:
	LDA	#(RTC_TOP_LOOP1_TIME & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_TIME / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	JSR	RTC_GET_TIME
	LDA	#(RTC_PRINT_BUFFER & $ff)		;SEND
	LDY	#((RTC_PRINT_BUFFER / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	JMP	RTC_TOP_LOOP_1

RTC_TOP_LOOP_RAW:
	LDA	#(RTC_TOP_LOOP1_RAW & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_RAW / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM

RTC_TOP_LOOP_RAW1:

;	{ Read seconds }
	LDX	#$00			; seconds register in DS1302
	JSR	RTC_READ		; read value from DS1302, value is in Reg C
	TYA
	PHA
	; digit 16
	CLC
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	AND	#$07
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+15
	
	; digit 17
	PLA
	AND	#$0F
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+16

;	{ Read minutes }

	LDX	#$01			; minutes register in DS1302
	JSR	RTC_READ		; read value from DS1302, value is in Reg C
	TYA
	PHA
	; digit 13
	CLC
	LSR	A
	LSR	A
	LSR	A
	LSR	A
	AND	#$07
	CLC	
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+12
	
	; digit 14
	PLA
	AND	#$0F
	CLC
	ADC	#'0'
	STA	RTC_PRINT_BUFFER+13

	; digit 15
	LDA	#':'
	STA	RTC_PRINT_BUFFER+14

	; digits 1-12 and 18-20 are spaces
	LDA	#' '			; space
	STA	RTC_PRINT_BUFFER+19
	STA	RTC_PRINT_BUFFER+18
	STA	RTC_PRINT_BUFFER+17
	STA	RTC_PRINT_BUFFER+11
	STA	RTC_PRINT_BUFFER+10
	STA	RTC_PRINT_BUFFER+09
	STA	RTC_PRINT_BUFFER+08
	STA	RTC_PRINT_BUFFER+07
	STA	RTC_PRINT_BUFFER+06
	STA	RTC_PRINT_BUFFER+05
	STA	RTC_PRINT_BUFFER+04
	STA	RTC_PRINT_BUFFER+03
	STA	RTC_PRINT_BUFFER+02
	STA	RTC_PRINT_BUFFER+01
	STA	RTC_PRINT_BUFFER+00

	LDA	#(RTC_PRINT_BUFFER & $ff)		;SEND
	LDY	#((RTC_PRINT_BUFFER / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM

	LDX	#01			; CP/M console input call
	JSR	PEM

	CMP	#' '			; space
	BEQ	RTC_TOP_LOOP_RAW1

	JMP	RTC_TOP_LOOP_1

RTC_TOP_LOOP_LOOP:
	LDA	#(RTC_TOP_LOOP1_LOOP & $ff)		;SEND
	LDY	#((RTC_TOP_LOOP1_LOOP / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM

	
RTC_TOP_LOOP_LOOP1:
	JSR	RTC_GET_TIME

	LDA	#(RTC_PRINT_BUFFER & $ff)		;SEND
	LDY	#((RTC_PRINT_BUFFER / $100)& $FF)	
	LDX	#9			;MESSAGE
	JSR	PEM
	
	LDX	#01			; CP/M console input call
	JSR	PEM

	CMP	#' '
	JMP	RTC_TOP_LOOP_LOOP1	

	JMP	RTC_TOP_LOOP_1

RTC_TOP_LOOP_SET:
	JSR	RTC_SET
	JMP	RTC_TOP_LOOP_1

RTC_TOP_LOOP_DELAY:
	JSR	RTC_TEST_BIT_DELAY
	JMP	RTC_TOP_LOOP_1

RTC_TOP_LOOP_HELP:
	JSR	RTC_HELP
	JMP	RTC_TOP_LOOP_1

;
; Text Strings
;

MSG:
	.TEXT	"Start Real Time Clock Program"
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

CRLF_MSG:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

TESTING_BIT_DELAY_MSG:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"Testing bit delay.  Successful test is approximately xx seconds."
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"Start clock and press space bar to continue."
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

TESTING_BIT_DELAY_OVER:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"Test complete.  Stop clock."
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

RTC_HELP_MSG:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"RTC: Version 1.0"
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"RTC: Commands: (E)xit (T)ime st(A)rt (S)et (R)aw (L)oop (C)harge"
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"               (N)ocharge (D)elay (H)elp"
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

RTC_TOP_LOOP1_MSG:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"RTC: trickle charger disabled."
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

RTC_TOP_LOOP1_PROMPT:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"RTC>"
	.DB	"$"			; Line terminator

RTC_TOP_LOOP1_CHARGE:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"Trickle charger enabled."
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

RTC_TOP_LOOP1_NOCHARGE:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"Trickle charger disabled."
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

RTC_TOP_LOOP1_START:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"Restarting RTC."
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

RTC_TOP_LOOP1_TIME:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"Current time: "
	.DB	"$"			; Line terminator

RTC_TOP_LOOP1_RAW:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"Raw read Loop.  Press SPACE BAR for next or any other key to stop."
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

RTC_TOP_LOOP1_LOOP:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"Clock Loop.  Press SPACE BAR for next or any other key to stop."
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

RTC_TOP_LOOP1_SET_TIME:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"TIME (HH:MM)>"
	.DB	"$"			; Line terminator

RTC_TOP_LOOP1_SET_DATE:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"DATE (MM/DD/YY)>"
	.DB	"$"			; Line terminator
	
	
RTC_TOP_LOOP1_OTHER1:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.TEXT	"YOU TYPED: "
	.DB	"$"			; Line terminator

RTC_TOP_LOOP1_OTHER2:
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; Line terminator

RTC_PRINT_BUFFER:
	.TEXT	"                     "	; Buffer for formatted date & time to print
	.DB	0Ah, 0Dh		; line feed and carriage return
	.DB	"$"			; line terminator


.end


