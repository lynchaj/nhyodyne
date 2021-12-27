;monitor version 9.00a
;1.75k rom based monitor for 6502 with
; suntronics ufdc-1 for 8" and 5"
; interfacer 4 for terminal i/o with wy-50
; spool-z-q 100 for printer
; xebec host adapter/s1410 for hard disk
; cmi 5619 hard disk
;released:	29 april 1996 (9.00)
;last revised:	29 april 1996 (9.00a)
;			eliminated extra control set
;fixed parameters
rtcnt	=	10		retry limit for disk ops
clreol	=	1		clear to eol (ctl-a)
clreos	=	2		clear to eos (ctl-b)
lf	=	$a		linefeed
cr	=	$d		carriage return
esc	=	$1b		escape char
delete	=	$7f		delete char
;**********************************************************************
;i/o port assignments and data definitions
;**********************************************************************
;base page for io
io	=	$f800
;ufdc-1 disk controller
disk	=	io+$98
dcom	=	disk+4
dstat	=	disk+4
track	=	disk+5
sectp	=	disk+6
ddata	=	disk+7
wait	=	disk+2
dcont	=	disk
;disk controller related parameters
;control bit for floppy side control
csdmsk	=	%11011111	clear bit
csd0	=	%00100000	side 0
csd1	=	%00000000	side 1
;1795 command bit
xsdmsk	=	%11111101	clear bit
xsdck	=	%00000010	check it
xsdnc	=	%00000000	do not check it
;interfacer 4
trmdat	=	io+$40		base address
trmsnd	=	%10000001	both 1 when ready to send
trmrcv	=	%00000010	1 when char ready
trmctl	=	trmdat+1	status port
;spool-z-q 100
szq100	=	io+$20		data and status
;winchester basic parameters
mxcl	=	306		cyl per drive
mxhd	=	6		heads per drive
rwc	=	306		start reduced write current cyl
wpc	=	306		start write pre-comp cyl
ecc	=	11		ecc burst length
cntrlb	=	%00000100	buffered seek option
;derived winchester parameters for dcb
numcyl	=	mxcl/2		cyl per logical drive
spt	=	mxhd*32*2	dos/65 sectors per track
blkscd	=	1		2048 byte blocks
maxblk	=	numcyl*mxhd*4-1	max block number
maxdir	=	1023		1024 directory entries
;xebec controller parameters
;addresses
xebec	=	io+$c0		host adapter address
datain	=	xebec		data input port
dataot	=	xebec		data output port
dcon	=	xebec+1		control port
dsta	=	xebec+2		status port
drst	=	xebec+2		reset port
;commands
wrt	=	%00001010	write
rdd	=	%00001000	read
recal	=	%00000001	re-calibrate
rqsns	=	%00000011	request sense
idc	=	%00001100	drive initialize
;**********************************************************************
;ram assignments
;**********************************************************************
;zero page ram
*	=	$f6
dmaadd	*=	*+2		pointer for r/w
cmdblk	*=	*+2		command block location
dtablk	*=	*+2		data block location
in	*=	*+2		input buffer/msg pointer
point	*=	*+2		monitor pointer
;system ram
sysrln	=	64		bytes of system ram
sysram	=	io-sysrln	start of system ram
*	=	sysram
nmi	*=	*+3		nmi jump
irqbrk	*=	*+3		irqbrk jump
dtalng	*=	*+1		data block length (0=256,1=1,...,255=255)
curdrv	*=	*+1		current drive
nxtdrv	*=	*+1		drive to read/write
nxtsec	*=	*+2		sector to read/write
nxttrk	*=	*+2		track to read/write
trktab	*=	*+7		seven drive track table
time	*=	*+3		real time clock
comnd	*=	*+6		controller command buffer
lun	=	comnd+1		lun and high address
mad	=	comnd+2		middle address
lad	=	comnd+3		lower address
rqscm	*=	*+6		cmd block for req sense
rqbuf	=	rqscm+2		status buffer
ercnt	*=	*+1		retry error count
sercnt	*=	*+1		seek retry count
errcde	*=	*+1		error code
optype	*=	*+1		operation type
				;0=home,2=read,4=write
cntbit	*=	*+1		control bit
selcde	*=	*+1		select code
phytrk	*=	*+1		physical track for floppy
physec	*=	*+1		physical sector for floppy
chksid	*=	*+1		mask for bit to set side
secoff	*=	*+1		actual sector offset
offprm	*=	*+1		second side offset
;**********************************************************************
;code section
;**********************************************************************
*	=	$f900
;jump vectors
;initialize interrupts
	jmp	intlz
;system halt
	jmp	($fffc)		jump to monitor
;console status
	jmp	consts
;console read
	jmp	conrde
;console write
	jmp	conwrt
;set drive number
	jmp	setdrv
;set track
	jmp	settrk
;set sector
	jmp	setsec
;set buffer location
	jmp	setdma
;read sector
	jmp	rdesec
;write sector
	jmp	wrtsec
;home floppy drive
	jmp	home
;printer write
	jmp	prnwrt
;read clock
	jmp	rdtime		read clock
;recal winchester
	jmp	rest
;do sector translation
	jmp	xlate
;send string to console
	jmp	outmsg
;interrupt initialization sequence
intlz	sei			disable interrupts
	lda	#<clock		setup irq jump
	ldy	#>clock
	sta	irqbrk+1
	sty	irqbrk+2
;	cli			enable interrupts
	rts
;monitor entry
entry	ldx	#$ff		set
	txs			stack pointer
	inx			clear
	txa			all
clrsys	sta	sysram,x	of
	inx
	cpx	#sysrln		see if past end
	bne	clrsys		of system ram
	lda	#$4c		get jump opcode
	sta	irqbrk		and set vector
	cld
	jsr	intlz		setup interrupts
	lda	#$60		select drive 0
	sta	dcont
	ldx	#5		init hard disk command
hdcint	lda	icomnd,x	get start
	sta	comnd,x		set
	dex
	bpl	hdcint		loop if more
;initialize interfacer 4
	jsr	settrm		set user numberr
	lda	#%01101110	async,16x,8 bit,no par,even,1 stop
	sta	trmdat+2
	lda	#%00111110	internal,9600
	sta	trmdat+2
	lda	#%00100111	trans on,dtr low,rec on,no brk,no res,rts*
	sta	trmdat+3
;main monitor loop
main	jsr	crlf
	lda	#'#'
;send prompt, address and data to console
	jsr	conwrt		prompt
	jsr	outpnt
	jsr	outsp
	ldy	#0
	lda	(point),y	get pointer contents
	jsr	outbyt
	jsr	outsp
	jsr	execut
	jmp	main
;fetch, decode, and execute command
;y must be zero at entry as currently coded
execut	sty	in		clear buffer
	sty	in+1
read	jsr	conrde
	cmp	#'a'		see if lowercase
	bcc	notlc		branch if not
	cmp	#'z'+1		same at high end
	bcs	notlc
	and	#$5f		else convert
notlc	jsr	conwrt
;convert char to hex nibble
;if possible else just skip ahead
	cmp	#'0'
	bmi	pack3
	cmp	#'9'+1
	bmi	pack0
	cmp	#'A'
	bmi	pack3
	cmp	#'F'+1
	bpl	pack3
pack0	pha			save char
	cmp	#'A'-1
	bmi	pack1
	clc
	adc	#9
pack1	rol	a
	rol	a
	rol	a
	rol	a
	ldx	#4
pack2	rol	a
	rol	in
	rol	in+1
	dex
	bne	pack2
	pla			get char back
pack3	cmp	#'G'		go at point
	bne	notg
	jmp	(point)
notg	cmp	#'O'		open
	bne	noto
	lda	in
	sta	point
	lda	in+1
	sta	point+1
	rts
noto	cmp	#'S'		set
	bne	nots
	lda	in
	sta	(point),y	store at point
;bump pointer by one
noto1	inc	point
	bne	incpt1
	inc	point+1
incpt1	rts
nots	cmp	#'N'		next
	beq	noto1
	cmp	#'P'		previous
	bne	notp
	lda	point		if low
	bne	nodchp		do not do high
	dec	point+1		else drop it
nodchp	dec	point		then low
	rts
notp	cmp	#'Q'		dos/65 boot
	bne	notq
	jmp	boot
notq	jmp	read
;subroutines
;get keyboard input
conrde	jsr	consts
	beq	conrde
	lda	trmdat		get char from uart
	and	#$7f
	rts
;test keyboard status
consts	jsr	settrm		set user number
	lda	trmctl		get status
	and	#trmrcv		test bit
	beq	conste		done if zero
	lda	#$ff		else set all bits
conste	rts
;monitor cr and lf
crlf	lda	#cr
	jsr	conwrt
	lda	#lf
	bne	conwrt		send and return
;output a space
outsp	lda	#' '
;console write
;alters:a,p
conwrt	pha			save char on stack
	and	#$7f		clear msb
	cmp	#delete		see if delete
	bne	notdlt		isn't
	lda	#' '		else make space
notdlt	cmp	#clreol		see if clear to eol
	bne	ntceol		not so skip
	lda	#esc		else get an esc
	jsr	doout		send it
	lda	#'T'		then a cap T
	jsr	doout
	jmp	endvid		then exit
ntceol	cmp	#clreos		see if clear to eos
	bne	ntceos		not so jump
	lda	#esc		send esc sequence
	jsr	doout
	lda	#'Y'		and y
	jsr	doout
	jmp	endvid		then exit
ntceos	jsr	doout		send as regular char
endvid	pla			get char back
	rts
;actually send a char to uart
doout	pha			save char
	jsr	settrm		point to correct port
trmbsy	lda	trmctl		get status
	and	#trmsnd		isolate bits
	cmp	#trmsnd		see if both set
	bne	trmbsy		not so loop
	pla			get char back
	sta	trmdat		then send it
	rts
;set correct user for terminal
settrm	lda	#1		user one
	sta	trmdat+7
	rts
;printer output
prnwrt	pha			save char
prtlpe	jsr	prtst
	beq	prtlpe
	pla
	sta	szq100		send to spooler
nprtr	rts
;printer status
prtst	lda	szq100		read status
	and	#1		isolate bit
	tax			drop to set correct values
	dex
	txa
	rts
;output pointer as two bytes
outpnt	lda	point+1		high byte
	jsr	outbyt
	lda	point
;output byte as two nibbles
outbyt	pha
	lsr	A
	lsr	A
	lsr	A
	lsr	A
	jsr	hex
	pla
;output a hex nibble
hex	and	#$F
	ora	#'0'
	cmp	#'9'+1
	bcc	hex1
	adc	#6
hex1	jmp	conwrt		go to output
;messages
selmsg	.byt	cr,lf,'SELECT ERROR',0
sekmsg	.byt	cr,lf,'SEEK ERROR',0
hmemsg	.byt	'HOME',0
rdemsg	.byt	'READ',0
wrtmsg	.byt	'WRITE',0
ioemsg	.byt	' ERROR-DRIVE:',0
trkmsg	.byt	'-TRACK:',0
secmsg	.byt	'-SECTOR:',0
cdemsg	.byt	'-CODE:',0
actmsg	.byt	cr,lf,'ACTION (0=REBOOT,1=IGNORE) ?',0
;message select table
opttbl	.wor	hmemsg,rdemsg,wrtmsg
;message output routine
;message is located at ay and is terminated
;by a zero or after 256th character.
;since this routine calls conwrt, characters in
;the string will be expanded to full strings needed
;for terminal control.
;alters:a,p,y,in,in+1
outmsg	sta	in		set pointer
	sty	in+1
	ldy	#0		clear index
msgout	lda	(in),y
	beq	msgend
	jsr	conwrt
	iny
	bne	msgout
msgend	rts
;dos/65 bootstrap
boot	lda	#%01100000	select
	sta	dcont		drive 0
	jsr	forint		force interrupt
	lda	#%00000011	do a
	sta	dcom		restore
	lda	wait		wait for home
	ldx	#1		set sector
	stx	sectp		to one
	dex			clear
	php			save interrupt status
	sei			disable interrupts
	lda	#%10001100	get and
	sta	dcom		send read
btloop	lda	wait		wait for DRQ
	bmi	btdone		exit if done
	lda	ddata		get byte
	sta	$00,x		save
	inx			bump index
	bne	btloop		and loop
btdone	plp			restore interrupt status
	lda	dstat		get status
	and	#%10011101	test for error
	beq	docold		boot if none
	rts			else return
docold	jmp	$0000		jump
;real time clock interrupt handler
clock	pha			save accum
	pla			get accum back
	rti			done
;read real time clock
rdtime	sei			disable interrupts
	cli			turn interrupts on
	rts
;check for winchester and set z=1 if winchester is nxtdrv
testhd	lda	nxtdrv		get next
	cmp	#4		see if "e"
	beq	ishd		done if is
	cmp	#5		see if "f"
ishd	rts
;set drive for rdesec/wrtsec/home/rest
setdrv	sta	nxtdrv		save
	rts
;do actual select for floppy
;if ok then z=1 else z=0 and errcde is set
;alters:a,p,x,trktab,curdrv,phytrk,physec,offprm,cntbit,chksid
;first see if single sided and if so skip ahead
dosel	ldx	nxtdrv
	lda	sidet,x
	beq	sngsid
;ok, we know it is double sided - now we need to determine
;which algorithm to use
;first see if Kaypro IV and if so skip ahead
	cmp	#1
	beq	kayp4
;now assume it is 1.2 mb 5 inch drive and set offset
	lda	#15
	bne	likek4
;here is Kaypro IV section - first set offset
kayp4	lda	#10
;common code for Kaypro 4 like drives
likek4	sta	offprm
;first assume it is side 0
	lda	#csd0
	sta	cntbit
	lda	#0
	sta	secoff
	sta	chksid
;no actually find out side and other data
	lda	nxttrk
	and	#1
;if it really is side 0 then done
	beq	k4sd0
;else set up for side 1
	lda	#csd1
	sta	cntbit
	lda	offprm
	sta	secoff
;do the calculations
k4sd0	lda	nxtsec
	clc
	adc	secoff
	sta	physec
	lda	nxttrk
	lsr	a
	sta	phytrk
	jmp	sdrdy
;here is single sided code - simple
sngsid	lda	nxtsec
	sta	physec
	lda	nxttrk
	sta	phytrk
	lda	#csd0
	sta	cntbit
	lda	#xsdnc
	sta	chksid
;ok - now we are ready to start sending and getting
;controller data
;first calculate correct control byte and set it
sdrdy	ldx	nxtdrv
	lda	contt,x
	and	#csdmsk
	ora	cntbit
;save for possible use later
	sta	selcde
	sta	dcont
	jsr	busy		wait for 1795
	lda	track		then get track from 1795
	ldx	curdrv		get old drive number
	sta	trktab,x	and put in table
	ldx	nxtdrv		get new number
	stx	curdrv		and update current
	lda	trktab,x	get track
	sta	track		set track
	sta	ddata		and data also
;if supposed to be at track 0 - do restore
	bne	norest
	jsr	dohome
;now seek correct track
norest	lda	dcont		get step rate
	and	#%00000011	isolate bits
	ora	#%00011000	seek with load
	jsr	ex1795		head
	jsr	busy		and wait for end
	lda	#0		clear error status
	sta	errcde		save in case bad
selext	rts			return
;drive tables - base select code
contt	.byt	$60,$61,$22,$23,0,0,$22
;double side mode and algorithm table
; 0 single sided or not floppy
; 1 Kaypro IV (offset = 10)
; 2 1.2 MB (like Kaypro IV but offset = 15)
sidet	.byt	0,0,1,2,0,0,0
;set sector number
setsec	sta	nxtsec		save low and high
	sty	nxtsec+1
	rts
;translate sector in ay for nxtdrv
xlate	tax			move low to x
	lda	nxtdrv		get next drive
	cmp	#2		see if drive c or greater
	bcs	setshd		if so no translate
	lda	xlt8,x		else get 8 inch value
	rts
setshd	txa			restore low
	rts
;set buffer address
;alters:none
setdma	sta	dmaadd		store low
	sty	dmaadd+1	and high
	rts			then return
;read dos/65 sector from floppy or winchester
; on return a=0 if no errors,=1 if error
rdesec	lda	#2		say is read op
	sta	optype
	jsr	testhd		see if winchester
	bne	fread		if not do floppy
	jmp	hread		else do hard disk
;read sector from floppy
fread	jsr	dosel		select drive
	bne	selerr		exit if error
	jsr	seek		and track
	bne	sekerr		exit if error
	lda	#rtcnt		get retry limit
	sta	ercnt		and set counter
rretry	ldy	#0		set index to zero
	jsr	forint		force interrupt
	jsr	busy		wait for idle
	lda	physec		get sector &
	sta	sectp		store sector
	php			save interrupt status
	sei			disable interrupts
	lda	dstat		get status
	and	#%00100000	look at head load
	beq	readl		if not loaded load head
	lda	#%10001000	else read w/o load
	bne	reade		do it
readl	lda	#%10001100	read with load
;no set side control correctly
reade	and	#xsdmsk
	ora	chksid
	jsr	ex1795		send command and wait
rdelp	lda	wait		wait for drq
	bmi	rddone		done if intrq
	lda	ddata		get byte
	sta	(dmaadd),y	store it
	iny			bump index
	bne	rdelp		and loop
	inc	dmaadd+1	bump high
	jmp	rdelp		and loop for more
rddone	lda	dstat		read status
	plp			restore interrupt status
	and	#%10011101	look at error bits
	sta	errcde		save for error
	beq	rdeok		done if no error
check	jsr	erchk		check error
	dec	ercnt		count down
	bne	rretry		and loop if not zero
	jsr	dskerr		report error
	lda	#1		and set for error
rdeok	rts			on return
;check for not found error
erchk	and	#%00010000	if not not found
	beq	rdeok		then do no reseek
;do home and reseek
chksk	jsr	busy		wait for 1795
	jsr	dohome		and home
	jmp	seek		do seek
;select error on floppy
;probably means 8" w/o disk inserted
selerr	lda	#<selmsg	get message
	ldy	#>selmsg
cmnerr	jsr	outmsg		send it
	jmp	dskerr		do common
;seek error
sekerr	lda	#<sekmsg	get message
	ldy	#>sekmsg
	jmp	cmnerr		go do it
;write dos/65 sector to floppy or winchester
;return with a=0 if ok or a<>0 if error
wrtsec	lda	#4		set op type
	sta	optype
	jsr	testhd		see if winchester
	bne	fwrit		if not go do floppy
	jmp	hwrit		else do hard disk
;write sector to floppy
fwrit	jsr	dosel		select drive
selbne	bne	selerr		exit if error
	jsr	seek		and track
	bne	sekerr		exit if error
	lda	#rtcnt		get retry limit
	sta	ercnt		and set counter
wretry	ldy	#0		set index to zero
	jsr	forint		force interrupt
	jsr	busy		wait for idle
	lda	physec		get sector
	sta	sectp		store sector
	php			save interrupt status
	sei			disable interrupts
	lda	dstat		look at status
	and	#%00100000	look at head load
	beq	writel		if not loaded do load
	lda	#%10101000	else do not load
	bne	write2		do command
writel	lda	#%10101100	load head
;now set side bit correctly in command
write2	and	#xsdmsk
	ora	chksid
	jsr	ex1795		send command and wait
wrtlp	lda	wait		wait for drq
	bmi	wdone		done if intrq
	lda	(dmaadd),y	get byte
	sta	ddata		send
	iny			bump index
	bne	wrtlp		and loop
	inc	dmaadd+1	else bump high
	jmp	wrtlp		then loop
wdone	lda	dstat		look at status
	plp			restore interrupt status
	and	#%11111101	look at error bits
	sta	errcde		save if error
	beq	wrtok		done if no error
	jsr	erchk		check error
	dec	ercnt		and count down
	bne	wretry		if not zero try again
	jsr	dskerr		report error
	lda	#1		return with error
wrtok	rts
;move to track zero
;note that for winchester this entry does nothing!!!
home	lda	#0		clear
	sta	nxttrk		current track
	sta	nxttrk+1
	sta	phytrk
	sta	optype		say is home
	jsr	testhd		see if winchester
	beq	homend		done if is
	jsr	dosel		select drive
	bne	selbne		exit if error
;the following entry point is used in erchk
;to do a restore on drive if not found error.
dohome	jsr	busy		wait until not busy
	lda	dcont		get bits
	and	#%00000011	isolate them
	ora	#%00001100	make a restore
	jsr	ex1795		command
	lda	wait		wait for end
	lda	#0		clear error code
	sta	errcde		save error
homend	rts			done
;set track
settrk	sta	nxttrk		save number
	sty	nxttrk+1
	rts
;seek track
;if ok then z=1 else z=0
seek	lda	#rtcnt		get limit
	sta	sercnt		and set counter
sretry	jsr	busy		wait for not busy
	lda	track		then get track
	cmp	phytrk		see if same
	beq	there		done if same
	lda	phytrk		get desired
	sta	ddata		send as data
	lda	dcont		get step rate
	and	#%00000011	isolate bits
	ora	#%00011100	make command
	jsr	ex1795		and execute
	lda	wait		and wait
	lda	dstat		read status
	and	#%10011001	look at error bits
	sta	errcde		save error code
	beq	there		if zero done
	dec	sercnt		and count down
	bne	sretry		if not zero loop
	lda	#$ff		say major error
there	rts
;wait for 1795 not busy
busy	lda	dstat		read status
	lsr	a		get busy bit
	bcs	busy		loop if set
	rts			else done
;force interrupt and wait
forint	lda	#%11010000	issue
;execute 1795 command
ex1795	sta	dcom		send command
;do a big delay
	jsr	twelve		wait
	jsr	twelve
	jsr	twelve
	jsr	twelve
;delay twelve microseconds
twelve	rts
;hard disk routines
;setup the task parameter block to be passed to the s1410
;controller.
uptask	lda	#0		only one drive for now
	sta	lun		save
	lda	nxtsec		then get low of phy sector
	sta	lad		and save
;now start on track - first add in track x 128
	lda	nxttrk+1	first get high part
	lsr	a
	lda	nxttrk		then low after moving lsb to carry
	ror	a		shift carry to high
	sta	mad		save in mad
	ror	a		move old lsb to msb
	and	#%10000000	clear all but msb
	clc			then add in low
	adc	lad
	sta	lad		and save result
	bcc	nbmp1		skip if no carry
	inc	mad		else bump high
;now add in track x 64
nbmp1	lda	nxttrk+1	get high
	lsr	a		shift lsb to carry
	lda	nxttrk		now get low
	ror	a		then to bit 6
	lsr	a
	clc
	adc	mad		carry is be cleared
	sta	mad		then save again
	lda	nxttrk		get low track again
	ror	a		move two lsbs to msbs
	ror	a
	ror	a
	and	#%11000000	then clear rest
	clc			and add in low
	adc	lad
	sta	lad		save it
	bcc	nbmp2		skip if no carry
	inc	mad		else bump high
nbmp2	rts
;do a physical sector read from hard disk
hread	jsr	uptask		set up parameters
	lda	#rdd		get read command
	bne	outcom		and execute
;do a physical sector write to hard disk
hwrit	jsr	uptask		set up parameters
	lda	#wrt		get opcode
	bne	outcom		and execute
;reset the controller and re-cal drive
rest	lda	#0		reset the controller
	sta	drst
	sta	lun		only do one drive for now
	lda	#$ff		insure buffer reread
	sta	mad		after re-cal
	sta	lad
	lda	#recal		get opcode
;execute command in a after doing drive initialize
outcom	pha			save command
	jsr	stcmpt		set pointer to command block
	lda	#idc		get initialize command
	sta	comnd
	lda	#<drvchr	point to drive characteristics
	ldy	#>drvchr
	ldx	#8		eight bytes of data
	jsr	excmd		execute
	jsr	stcmpt		set command pointer to normal
	pla			get command value back
	sta	comnd
	lda	dmaadd		point to data buffer
	ldy	dmaadd+1
	ldx	#0		256 bytes
;execute command at (cmdblk) using parameters in a,y, and x
excmd	sta	dtablk		save data block address
	sty	dtablk+1
	stx	dtalng		and length
	lda	#1		select controller
	sta	dataot
	lda	#$42		assert select
	sta	dcon
conbsy	lda	dsta		wait until controller busy
	and	#8
	beq	conbsy
	lda	#2		outbound data flow
	sta	dcon
	ldy	#0		clear index
	jsr	wtests		wait for request
consnd	lda	(cmdblk),y	get byte
	sta	dataot		send
	iny
	cpy	#6		see if all sent
	bne	consnd		loop if not
	ldy	#0		clear index for read/write
	jsr	wtests		wait for another request
	and	#$10		is command high
	bne	getsta		yes - then no data
	lda	dsta		read again
	and	#$40		check direction
	bne	datwrt		high means write
;do read of data
datrd	lda	datain		get byte
	sta	(dtablk),y	save
	iny
	cpy	dtalng		check for end
	bne	datrd		loop if not
	beq	getsta		else go get status
;do write of data
datwrt	lda	(dtablk),y	get byte
	sta	dataot		send to controller
	iny
	cpy	dtalng		see if done
	bne	datwrt		loop if not
;retrieve status bytes
getsta	jsr	wtests		wait until ready
	ldx	datain		get valid
	jsr	wtests		wait for another ready
	lda	datain		get and discard
	txa			get valid back
	and	#%00000010	test for error
	beq	noerro		done if no error
;handle error
	lda	#$ff		preset error code
	sta	rqbuf
	lda	#<rqscm		set command block pointer
	ldy	#>rqscm
	sta	cmdblk
	sty	cmdblk+1
	lda	lun		get correct lun
	sta	rqscm+1		and set
	lda	#rqsns		get command
	sta	rqscm		and set
	lda	#<rqbuf		point to data area
	ldy	#>rqbuf
	ldx	#4		transfer four bytes
	jsr	excmd		execute
	lda	rqbuf		get sense byte
	and	#$7f		mask adr valid bit
;check for correctable data error and ignore if was
	cmp	#$18
	beq	corerr		it was
	sta	errcde		save code
	jsr	dskerr		report error
	lda	#$ff		reset address so will read
	sta	mad
	sta	lad
	rts			return with a<>0
corerr	lda	#0		say no error
noerro	rts
;set pointer to normal command block
stcmpt	lda	#<comnd		set pointer to normal command block
	ldy	#>comnd
	sta	cmdblk
	sty	cmdblk+1
	rts
;wait for request from controller
wtests	lda	dsta		get status
	bpl	wtests		loop while msb = 0
	rts
;disk error handler/reporting
dskerr	jsr	crlf		send cr and lf
	ldx	optype		get oper type
	lda	opttbl,x	get low
	ldy	opttbl+1,x	and high
	jsr	outmsg		send message
	lda	#<ioemsg	now do general error msg
	ldy	#>ioemsg
	jsr	outmsg
	lda	nxtdrv		send drive
	jsr	hex		as nibble
	lda	#<trkmsg	do track message
	ldy	#>trkmsg
	jsr	outmsg
	lda	nxttrk+1	do high
	jsr	outbyt
	lda	nxttrk
	jsr	outbyt
	lda	#<secmsg	now sector message
	ldy	#>secmsg
	jsr	outmsg
	lda	nxtsec+1
	jsr	outbyt
	lda	nxtsec
	jsr	outbyt
	lda	#<cdemsg	now error code
	ldy	#>cdemsg
	jsr	outmsg
	lda	errcde
	jsr	outbyt
getact	lda	#<actmsg	ask for action
	ldy	#>actmsg
	jsr	outmsg
	jsr	conrde		get char
	cmp	#'0'		see if zero
	bne	noboot		skip if not
	jmp	boot		else reboot
noboot	cmp	#'1'		see if one
	bne	getact		try again if not
	lda	#1		say error
	rts
;sector translation tables
;8 inch
xlt8	.byt	1,7,13,19,25,5,11,17,23,3,9,15,21
	.byt	2,8,14,20,26,6,12,18,24,4,10,16,22
;initial controller command buffer
icomnd	.byt	0		opcode goes here
	.byt	0		lun and high address
	.byt	$ff		middle address
	.byt	$ff		lower address
	.byt	1		interleave or block count
	.byt	cntrlb		fast step data
;command string for drive init
;note that these parameters are in high - low order
;and since that is the opposite of the usual 6502 .wor
;order .byt directives must be used
drvchr	.byt	>mxcl,<mxcl,mxhd,>rwc,<rwc,>wpc,<wpc,ecc
;interrupt and reset vectors
*	=	$fffa
	.wor	nmi
	.wor	entry
	.wor	irqbrk
	.end
