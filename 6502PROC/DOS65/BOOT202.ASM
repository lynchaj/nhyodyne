;dos/65 boot
;version 2.02
;released:	22 september 1982
;last revision:	17 february 1984
;			converted to ufdc-1
;		24 november 1984
;			moved io to $f800
;			memory to 62k
;base addresses
msize	=	62		memory size in 1k blocks
pages	=	11		pages in sim
memlng	=	msize*1024	memory size in bytes
simlng	=	pages*256	sim length in bytes
pemlng	=	3072		pem length in bytes
ccmlng	=	2048		ccm length in bytes
syslng	=	ccmlng+pemlng	system length less sim
sim	=	memlng-simlng	start of sim
ccm	=	sim-syslng	start of ccm
nsects	=	26*2-1		sectors to load
sectrs	=	26		full size format
;fdi addresses
disk	=	$f898		fdi base
dcom	=	disk+4		command port
dstat	=	disk+4		status port
sectp	=	disk+6		sector register
ddata	=	disk+7		data register
wait	=	disk+2		wait port
;variables
*	=	$7e
seccnt	.byt	nsects		sector count
	.byt	$20		density code
;main program
*	=	$00
cold	sei			disable interrupts
	cld			set binary mode
	ldx	#$ff		clear
	txs			stack
	ldx	#2		starting sector
rdblk	lda	dstat		but if 1795
	lsr	a		busy
	bcs	rdblk		wait until not busy
track	lda	#0		starting track
	inc	track+1		bump for next time around
	sta	ddata		send to 1795
	lda	#%00010011	do a
	sta	dcom		slow seek
	lda	wait		wait for intrq
	lda	dstat		get status
	and	#%10011001	if error
	bne	error		halt
	lda	#%10001100	read with delay
doread	stx	sectp		set sector
	ldy	#0		clear index
	sta	dcom		do read
rloop	lda	wait		wait for drq/intrq
	bmi	rdone		exit if done
	lda	ddata		get byte
point	sta	ccm,y		store data
	iny			bump index
	bne	rloop		and loop
rdone	clc			bump
	lda	point+1		pointer
	adc	#128		by 128
	sta	point+1		save
	bcc	nocry		if no carry
	inc	point+2		skip high bump
nocry	lda	dstat		get status
	and	#%10011101	check for error
	bne	error		halt if error
	dec	seccnt		count down
	beq	boote		if zero done
	inx			else bump sector
	cpx	#sectrs+1	if over limit
	bcc	rdblk2		jump
	ldx	#1		else sector is one
	bne	rdblk		and start over
rdblk2	lda	#%10001000	read w/o delay
	bne	doread		and loop
;error halt
error	jmp	($fffc)		reset system
;normal exit
boote	jmp	sim		execute
	.end
