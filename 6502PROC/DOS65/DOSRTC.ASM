
	
;__RTC DRIVERS___________________________________________________________________________________________________________________
;
; 	DOS REAL TIME CLOCK drivers 
;
;	Entry points:
;		DOSREADRTC   - called to RETURN RTC
;________________________________________________________________________________________________________________________________
;
;*
;* HARDWARE I/O ADDRESSES
;*

	
		
	  .IF COLOSSUS6X0X=1
RTCDDRD		.EQU 	M6X0X_IOSPACE+$DF2
RTCPORTD	.EQU 	M6X0X_IOSPACE+$DF0
	.ENDIF
	
		
mask_data:	.EQU	$20		; RTC data line
mask_clk:	.EQU	$40		; RTC Serial Clock line
mask_ce:	.EQU	$10		; De-activate RTC reset line
	
	
;__DOSREADRTC________________________________________________________________________________________
;
;  READ REAL TIME CLOCK
;  X=HRS Y=MIN A=SEC   
;____________________________________________________________________________________________________
DOSREADRTC:

;	{ Read minutes }
	LDX	#$01			; minutes register in DS1302
	JSR	RTC_READ		; read value from DS1302, value is in Reg C
	TYA
	STA	RTCMIN	 	

	
;	{ Read HOURS }
	LDX	#$03			; minutes register in DS1302
	JSR	RTC_READ		; read value from DS1302, value is in Reg C
	TYA
	STA	RTCHOURS	 	
	

;	{ Read SECONDS }
	LDX	#$00			; seconds register in DS1302
	JSR	RTC_READ		; read value from DS1302, value is in Reg C
	TYA
	STA	RTCSEC

	LDX	RTCHOURS
	LDY	RTCMIN
	
	RTS

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
	
	
RTC_WR:
	STA	RTCTEMP			; save accumulator as it is the DATA
	LDA	#$70
	STA	RTCDDRD
	LDX	#$00			; set X index counter of FOR loop
RTC_WR1:
	LDA	RTCTEMP
	
	AND	#$01
	
	CMP	#$00			; is LSB a 0 or 1?
	BEQ	RTC_WR2			; if it’s a 0, handle it at RTC_WR2.
					; LSB is a 1, handle it below
					; setup RTC latch with RST and DATA high, SCLK low
	LDA	#mask_ce + mask_data
	STA	RTCPORTD
	JSR	RTC_BIT_DELAY		; let it settle a while
					; setup RTC with RST, DATA, and SCLK high
	LDA	#mask_ce + mask_clk + mask_data
	STA	RTCPORTD
	JMP	RTC_WR3			; exit FOR loop 

RTC_WR2:
					; LSB is a 0, handle it below
	LDA	#mask_ce		; setup RTC latch with RST high, SCLK and DATA low
	STA	RTCPORTD			; output to RTC latch
	JSR	RTC_BIT_DELAY		; let it settle a while
					; setup RTC with RST and SCLK high, DATA low
	LDA	#mask_ce + mask_clk
	STA	RTCPORTD

RTC_WR3:
	JSR	RTC_BIT_DELAY		; let it settle a while
	LSR	RTCTEMP			; move next bit into LSB position for processing to RTC
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
	STA	RTCDDRD
	LDX	#$00			; set X index counter of FOR loop

	LDA	#$00			; set A=0 output of RTC_RD is passed in A
	STA	RTCTEMP
	LDA	#$01			; mask value
	STA	RTCTEMP1
RTC_RD1:
					; setup RTC with RST and RD high, SCLK low
	LDA	#mask_ce 
	STA	RTCPORTD
	JSR	RTC_BIT_DELAY		; let it settle a while
	LDA	RTCPORTD			; input from RTC latch
	AND	#$20			; is  0 or 1?
	CMP	#$00
	BEQ	RTC_RD2			; if is a 0, handle it below
	LDA	RTCTEMP1
	CLC
	ADC	RTCTEMP
	STA	RTCTEMP
					; if LSB is a 0, skip it (C=C+0)
RTC_RD2:
	ASL	RTCTEMP1			; SHIFT MASK
	LDA	#mask_ce + mask_clk  
	STA	RTCPORTD
	JSR	RTC_BIT_DELAY		; let it settle
	INX				; increment FOR loop (A=A+1)
	CPX	#$08			; is A < $08 ?
	BNE	RTC_RD1			; No, do FOR loop again
	LDA	RTCTEMP
	RTS				; Yes, end function and return.  Read RTC value is in C

RTC_BIT_DELAY:				; purpose is to delay ~36 uS 
					; (6) JSR INTO
	PHA				; 3
	LDA	#$02     		; 2  (1 REP AT 1 MHZ 6 REPS AT 2MHZ)
	STA	RTCTEMPWORD		; 3
RTC_BIT_DELAY1:
	DEC	RTCTEMPWORD		;5
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
	STA	RTCDDRD
	LDA	#mask_data 
	STA	RTCPORTD
	JSR	RTC_BIT_DELAY
	JSR	RTC_BIT_DELAY
	LDA	#mask_data + mask_ce
	STA	RTCPORTD
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
	STA	RTCDDRD
	LDA	#mask_data 
	STA	RTCPORTD
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
	STA	RTCDDRD
	LDA	#mask_data +  mask_ce
	STA	RTCPORTD
	JSR	RTC_BIT_DELAY
	JSR	RTC_BIT_DELAY
	RTS

	
RTCTEMP	 	.DB	00
RTCTEMP1 	.DB	00
RTCHOURS 	.DB	00
RTCMIN	 	.DB	00
RTCSEC	 	.DB	00
RTCTEMPWORD	.DW	00
	