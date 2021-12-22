


DBGmsg	.db	cr,lf,"DOS/65 CALL ",0
DBGmsg2	.db	cr,lf,"DEBUG A= ",0
DBGmsg1	.db	cr,lf,0
DBGmsg3	.db	cr,lf,"DEBUGb *A= ",0

DBGmsg4	.db	cr,lf,"Disk command string= ",0

LO_DBGmsg = DBGmsg & $FF
HI_DBGmsg = (DBGmsg & $FF00)/256
LO_DBGmsg1 = DBGmsg1 & $FF
HI_DBGmsg1 = (DBGmsg1 & $FF00)/256
LO_DBGmsg2 = DBGmsg2 & $FF
HI_DBGmsg2 = (DBGmsg2 & $FF00)/256
LO_DBGmsg3 = DBGmsg3 & $FF
HI_DBGmsg3 = (DBGmsg3 & $FF00)/256
LO_DBGmsg4 = DBGmsg4 & $FF
HI_DBGmsg4 = (DBGmsg4 & $FF00)/256

         
         
DBGX		.DB 0		
DBGY		.DB 0		
DBGA		.DB 0		
DBGLOW		.DB 0		
DBGHIGH		.DB 0		
         

DEBUG:
	
	STA	DBGA
	STY	DBGY
	STX	DBGX
	
	PLA	
	STA	DBGLOW
	PLA	
	STA	DBGHIGH
	PHA
	LDA	DBGLOW
	PHA
	
	lda	#LO_DBGmsg	;point to message
	ldy	#HI_DBGmsg
	jsr	outmsg		;send it
	
	LDA	DBGHIGH
	JSR	$FB93
	LDA	DBGLOW
	JSR	$FB93
	TSX
	TXA
	JSR	$FB93
	
	lda	#LO_DBGmsg1	;point to message
	ldy	#HI_DBGmsg1
	jsr	outmsg		;send it
	
	LDA	DBGA
	LDY	DBGY
	LDX	DBGX
	RTS
	
DEBUGA:
	STA	DBGA
	STY	DBGY
	STX	DBGX	
	lda	#LO_DBGmsg2	;point to message
	ldy	#HI_DBGmsg2
	jsr	outmsg		;send it
	
	LDA	DBGA
	JSR	$FB93
	
	
	lda	#LO_DBGmsg1	;point to message
	ldy	#HI_DBGmsg1
	jsr	outmsg		;send it
	LDA	DBGA
	LDY	DBGY
	LDX	DBGX
	RTS

DEBUGB:
	STA	DBGA
	STY	DBGY
	STX	DBGX	
	lda	#LO_DBGmsg3	;point to message
	ldy	#HI_DBGmsg3
	jsr	outmsg		;send it
	
	LDA	DBGA
	JSR	$FB93
	
	
	lda	#LO_DBGmsg1	;point to message
	ldy	#HI_DBGmsg1
	jsr	outmsg		;send it
	LDA	DBGA
	LDY	DBGY
	LDX	DBGX
	RTS	
	

	
DEBUGDISK:
	STA	DBGA
	STY	DBGY
	STX	DBGX	

	lda	#LO_DBGmsg4	;point to message
	ldy	#HI_DBGmsg4
	jsr	outmsg		;send it
	
		
	LDA	FCMD			;
	JSR	$FB93
	LDA	UNIT			;
	JSR	$FB93
	LDA	debcyl			;
	JSR	$FB93
	LDA	debhead			;
	JSR	$FB93
	CLC
	LDA	debsec			;
	ADC	#$01	
	JSR	$FB93
	LDA	#$02			;
	JSR	$FB93
	LDA	#$09			;
	JSR	$FB93
	LDA	#$0D			;
	JSR	$FB93
	LDA	#$FF			; DTL, IS THE LAST COMMAND BYTE TO I8272
	JSR	$FB93
	
	lda	#LO_DBGmsg1	;point to message
	ldy	#HI_DBGmsg1
	jsr	outmsg		;send it
	LDA	DBGA
	LDY	DBGY
	LDX	DBGX

	.DB	$60
	RTS	
	RTS
	
DEBUGC:
	STA	DBGA
	STY	DBGY
	STX	DBGX	
	lda	#LO_DBGmsg3	;point to message
	ldy	#HI_DBGmsg3
	jsr	outmsg		;send it
	
	LDA	DBGA
	JSR	$FB93
	
	
	lda	#LO_DBGmsg1	;point to message
	ldy	#HI_DBGmsg1
	jsr	outmsg		;send it
	LDA	DBGA
	LDY	DBGY
	LDX	DBGX
	RTS	