;-------------------------------
;dos/65 primitive execution module (pem)
;-------------------------------
;zero page data storage
addinp	=	$02		;initialized to a,y
bufadd	=	$04		;buffer address
alcpnt	=	$06		;allocation map pointer
chkpnt	=	$08		;checksum map pointer
numvar	=	8		;eight bytes
;main program
; input:x=command,a=value,a&y=address
; returns:a=value,a&y=address
; alters:all
pem:
	cld			;set binary mode
	sta	bytinp		;save input
	sta	lowin		;value and
	sty	bytinp+1	;save high
	sty	lowin+1		;address
	stx	cmdinp		;and command
	cpx	#numcmd		;if invalid
	bcs	extpem		;then exit
	lda	swctbl,x	;if flag zero
	beq	noswin		;skip switch
	lda	#255		;else set
	sta	swcflg		;memory switch flag
	jsr	switch		;move data to page zero
noswin:	lda	#0		;clear drive
	sta	tmpdrv		;switch flag
	lda	cmdinp		;get command
	asl	a		;multiply by two
	adc	cmdinp		;then add to get x3
	tax			;and make a pointer
	inx			;bump to pass jmp
	lda	cmdtbl,x	;get command
	ldy	cmdtbl+1,x	;address
	sta	xqtvec		;and put
	sty	xqtvec+1	;in vector
	lda	extevc+1	;get return
	pha			;address
	lda	extevc		;and push
	pha			;as return
	lda	bytinp		;get input value
	ldy	bytinp+1
	jmp	(xqtvec)	;then execute
extexq:	sta	bytout		;save value
	sty	addout+1	;and address
	lda	tmpdrv		;get temp drive
	beq	extpem		;if zero skip switch
	ldy	#0		;else
	sta	(addinp),y	;put back in fcb
	lda	olddrv		;get old drive number
	sta	bytinp		;set input value
	jsr	chgdrv		;then switch back
extpem:	bit	swcflg		;test memory switch
	bpl	noswot		;if not set skip
	jsr	switch		;else do memory switch
	lda	#0		;clear
	sta	swcflg		;flag
noswot:	ldy	addout+1	;get address
	lda	bytout		;and value (address low)
	rts
;command vector table
cmdtbl:	jmp	xwboot		;warm boot
	jmp	xcnsin		;console input with echo
	jmp	sndchr		;console output
	jmp	sim+21		;tape reader
	jmp	sim+18		;tape punch
	jmp	sim+15		;printer output
	jmp	getcon		;console input w/o echo
	jmp	xgtios		;read i/o status
	jmp	xstios		;set i/o status
	jmp	sndstr		;print buffer
	jmp	bufinp		;read buffer
	jmp	kbdsts		;test console ready
	jmp	sim+45		;read list status
	jmp	xintds		;initialize system
	jmp	chgdrv		;log in drive
	jmp	xopen		;open file
	jmp	xclose		;close file
	jmp	xfndfr		;find first match
	jmp	xfndnx		;find next match
	jmp	xdltfl		;delete file
	jmp	xread		;read record
	jmp	xwrite		;write record
	jmp	xmake		;create file
	jmp	xrenme		;rename file
	jmp	xintlg		;interrogate log in status
	jmp	xintdr		;interrogate current drive
	jmp	chgdma		;set buffer address
	jmp	xrdalv		;read allocation map start
	jmp	setron		;set r/w status
	jmp	xrdros		;read r/w status
	jmp	setlst		;set list echo status
	jmp	lststs		;read list echo status
	jmp	xrtclo		;read low clock
	jmp	xrtchi		;read high clock
	jmp	xrddcb		;read dcb address
	jmp	sim+51		;translate sector
;set list echo status
setlst:	sta	lstflg		;set flag
	rts
;read list echo status
lststs:	lda	lstflg		;read flag
	rts
;execute warm boot
; ***this command does not return to pem***
; ***instead it jumps to sim, resets	***
; ***system and stack and jumps to ccm. ***
xwboot:	bit	swcflg		;test memory switch flag
	bpl	dowmbt		;if clear do not
	jsr	switch		;switch memory
	lda	#0		;clear
	sta	swcflg		;flag
dowmbt:	jmp	sim+3		;go to sim

;execute read real time clock
xrtclo:	jsr	sim+48		;read clock

	sta	rtclk		;save low
	sty	rtclk+1		;middle
	stx	rtclk+2		;high
	txa
	and	#%10000000	;test for valid
	tay
	lda	rtclk		;get low
	rts
;execute read real time clock high
xrtchi:	lda	rtclk+2		;get high
	and	#%01111111	;clear status
	tay
	lda	rtclk+1		;get middle
	rts
;execute read dcb address
xrddcb:	lda	cptdcb+1	;get address
	ldy	cptdcb+2
	rts
;execute read i/o status
xgtios:	lda	iostat		;get status byte
	rts
;execute read allocation map starting address
xrdalv:	lda	alcmap		;get
	ldy	alcmap+1	;starting address
	rts			;then return
;execute set i/o status
xstios:	sta	iostat		;set status
	rts
;execute interrogate current drive
xintdr:	lda	curdrv		;get number
	rts
;execute read log in status
xintlg:	lda	lginvc		;get status
	rts
;execute read read/write status
xrdros:	lda	ronlst		;get status
	rts
;execute find next match
xfndnx:	jsr	autodr		;auto drive select
	lda	#13		;match including
	jmp	search		;extent
;execute read next record
xread:	jsr	autodr		;auto drive select
	jsr	inrcct		;initialize record counters
	lda	nxtrec		;if next record less
	cmp	numrec		;then number records
	bcc	tryrde		;then try to read
	cmp	#128		;but if not and
	beq	tryext		;is max try to extend
rdeeof:	lda	#1		;else set eof
	rts			;code and return
tryext:	ldx	#1		;try for a read
	jsr	extend		;file extension
	cmp	#0		;if not ok exit eof
	bne	rdeeof		;with jump back
	sta	nxtrec		;clear next record
tryrde:	jsr	getblk		;and get block
	lda	blknum		;if block not zero
	ora	blknum+1
	bne	dorde		;do the read
	lda	#2		;else set unwritten
	rts			;code and exit
dorde:	jsr	calrcn		;calculate record number
	jsr	sttrsc		;set track and sector
	jsr	rdesec		;do sector read
	jsr	updtrc		;update counters
	lda	#0		;return w/o error
extrde:	rts
;execute file rename
xrenme:	jsr	autodr		;automatic drive select
	jsr	tstron		;test for r/o
	lda	#12		;match name
	jsr	frstsr		;and type
	bmi	extren		;exit if not found
doren:	lda	#0		;clear drive select
	ldy	#16		;in new name
	sta	(addinp),y	;part of fcb
	lda	#12		;then move
	ldx	#16		;new name
	jsr	dirchg		;to directory
	lda	#12		;see if
	jsr	search		;another match
	bpl	doren		;loop if found
extren:	rts			;number
;execute delete file
xdltfl:	jsr	autodr		;automatic drive select
	jsr	tstron		;test for r/o
	lda	#12		;match name
	jsr	frstsr		;and type
	bmi	extdlt		;done if not found
dodlt:	ldx	#0		;else do a
	jsr	mapdir		;delete
	ldy	subrec		;then change
	lda	empty		;byte zero to
	sta	(bufadd),y	;empty code
	jsr	updtck		;then update directory
	lda	#12		;search
	jsr	search		;for next
	bpl	dodlt		;loop if found
extdlt:	rts			;exit
;execute write next record
xwrite:	jsr	autodr		;automatic drive select
	jsr	tstron		;test for r/o
	jsr	inrcct		;initialize counters
	lda	nxtrec		;get next record
	cmp	#128		;compare to max
	bcc	ntexte		;continue if less
	lda	#1		;else flag as extend
	rts			;error and exit
ntexte:	jsr	getblk		;calculate block num
	lda	#0		;say normal write
	sta	pemwrtype		;for now
	lda	blknum		;get it and if
	ora	blknum+1
	beq	*+5		;zero then get number
	jmp	blkopn		;else go write
	lda	#2		;say unalloc write
	sta	pemwrtype
	lda	fcbind		;get index from prior
	pha			;and save
	cmp	#16		;if first block
	beq	isfrst		;then don't change
	tay			;else make an index
	dey			;point to last
	bit	blmode		;test mode
	bpl	*+3		;done if byte
	dey			;else drop for word
	lda	(addinp),y	;and get that number
	sta	blknum		;store as starting
	iny			;bump for word
	lda	#0		;preset for byte
	bit	blmode		;test mode
	bpl	*+4		;done if byte
	lda	(addinp),y	;else get high
	sta	blknum+1	;then set high
isfrst:	lda	blknum		;get block
	sta	lkdown		;set lower and
	sta	lookup		;upper pointers
	lda	blknum+1	;now set high part
	sta	lkdown+1
	sta	lookup+1
srblag:	lda	lookup		;if upper pointer
	cmp	maxblk		;not at max
	bne	upnemx		;then keep going
	ldy	lookup+1	;now check high
	cpy	maxblk+1
	beq	tstdwn		;go test down
upnemx:	inc	lookup		;else bump upper
	bne	*+5
	inc	lookup+1
	lda	lkdown		;then if lower
	ora	lkdown+1
	beq	dotest		;is zero start test
	bne	dcdown		;else drop lower
tstdwn:	lda	lkdown		;if upper & lower at
	ora	lkdown+1
	bne	dcdown		;drop if not zero
	tay			;also set y
	beq	extsbl		;then exit
dcdown:	lda	lkdown		;drop lower
	bne	*+5
	dec	lkdown+1
	dec	lkdown
dotest:	lda	lkdown		;get lower
	ldy	lkdown+1
	jsr	tstblk		;and test
	bne	trylup		;if full try upper
	lda	lkdown		;else use lower
	ldy	lkdown+1
	jmp	extsbl		;as result
trylup:	lda	lookup		;get upper
	ldy	lookup+1
	jsr	tstblk		;if full
	bne	srblag		;then loop
	lda	lookup		;else use upper
	ldy	lookup+1
extsbl:	sta	blknum		;then save number
	sty	blknum+1
	ora	blknum+1	;see if zero
	bne	gtgood		;then proceed
	pla			;clear stack
	lda	#2		;set end
	rts			;of data return
gtgood:	lda	blknum		;get low again
	jsr	setblk		;set allocation map
	pla			;get block
	tay			;pointer back
	lda	blknum		;get number
	sta	(addinp),y	;and put in fcb
	lda	blknum+1	;get high
	iny
	bit	blmode		;test mode
	bpl	*+4		;done if byte
	sta	(addinp),y	;else set high
blkopn:	jsr	calrcn		;calculate record num
	jsr	sttrsc		;set track and sector
	jsr	wrtsec		;do write
	ldx	nxtrec		;get next record
	cpx	numrec		;if less than max
	bcc	notful		;then ok
	inx			;else bump count
	stx	numrec		;and save
	dex			;back down
notful:	cpx	#127		;if not at max
	bne	noawex		;skip extending
	jsr	updtrc		;update record counters
	ldx	#0		;do write
	jsr	extend		;file extension
	cmp	#0		;if not ok
	bne	extwrt		;exit
	lda	#255		;else start counter
	sta	nxtrec		;at one short
noawex:	jsr	updtrc		;then update counters
	lda	#0		;good return
extwrt:	rts			;exit
;execute console input
xcnsin:	jsr	getcon		;get input
	jsr	tstchr		;test it and
	bcc	extxci		;if control exit
	pha			;else save
	jsr	sndchr		;echo
	pla			;restore
extxci:	rts			;return
;switch memory
;page zero block begins at $02 and is numvar bytes long.
switch:	ldx	#numvar-1	;get number to switch
nxtswh:	lda	2,x		;get zero page
	ldy	varblk,x	;and save area
	sta	varblk,x	;save zero
	sty	2,x		;and high
	dex			;count down
	bpl	nxtswh		;and loop until done
drvsme:	rts			;then return
;change dma address
; input:addinp=address
; returns:none
; alters:all
chgdma:	lda	addinp		;get low
	ldy	addinp+1	;and high address
	sta	bufadd		;then store
	sty	bufadd+1	;in address
	jmp	sim+36		;then go to sim

;change drive
; input:bytinp
; returns:none
; alters:all
chgdrv:	lda	bytinp		;get input
	cmp	curdrv		;if same as current
	beq	drvsme		;do nothing
	sta	curdrv		;else change current
	jmp	mapdrv		;then log it in
;automatic drive select
; input:(addinp) 0=no change
; 1-8 or 'A'-'H' = change
; returns:none
; alters:all
autodr:	ldy	#0		;get
	lda	(addinp),y	;first byte of fcb
	beq	qtatdr		;if zero quit
	sec			;set carry for
	sbc	#1		;subtract one
	and	#%00000111	;look at three lsbs
	sta	bytinp		;make parameter
	lda	curdrv		;get current
	sta	olddrv		;and save
	lda	(addinp),y	;get fcb entry
	sta	tmpdrv		;and save as flag
	tya			;set a to 0
	sta	(addinp),y	;clear byte zero in fcb
	jsr	chgdrv		;then select new drive
qtatdr:	rts			;and return
;execute initialize system
; input:none
; returns:none
; alters:all,curdrv,lginvc,bufadd
xintds:	lda	#DEFDRV		;set current
	sta	curdrv		;drive to a
	sta	lginvc		;clear log in status
	lda	#<dflbuf	;get default buffer
	ldy	#>dflbuf	;address
	sta	addinp		;and set up
	sty	addinp+1	;parameters
	jsr	chgdma		;change address

;log in drive and set pointers and maps
; input:curdrv
; returns:none
; alters:all
mapdrv:	lda	curdrv		;if current drive
	cmp	#8		;is 0 to 7
	bcc	vlddrv		;then log it in
drserr:	jsr	errout		;send error message
	lda	sltmvc		;point to
	ldy	sltmvc+1	;select message
	jsr	sndstr		;and send it

	jmp	xwboot		;and abort

vlddrv:	jsr	sim+27		;go to sim to set
	sta	cptdcb+1	;save
	sty	cptdcb+2
	ora	cptdcb+2	;see if invalid
	beq	drserr		;error if is
;capture dcb
	ldy	#14-1		;do 14 bytes
cptdcb:	lda	$ffff,y		;get value from sim
	sta	dcb,y		;store it
	dey
	bpl	cptdcb		;loop for more
	lda	blkscd		;get block size code
	tay			;save in y
	clc
	adc	#3		;convert to sxb
	sta	sxb		;and save
	lda	sabtbl,y	;get sab
	sta	sab		;and set
	lda	maxdir		;get max dir
	sta	maxdrc		;set max dir record
	lda	maxdir+1
	lsr	a		;divide by 4
	ror	maxdrc
	lsr	a
	ror	maxdrc
	sta	maxdrc+1	;then save high
	lda	#0		;set mode to byte
	sta	blmode
	lda	maxblk+1	;branch if max block
	beq	ntm255		;not over 255
;if y=0 when the following line is executed it means
;that the user has put an illegal combination into
;the disk definition table. may want to consider
;putting some error checking here in the future if
;there is space in pem.
	dey			;back up index
	sec			;else set mode to word
	ror	blmode
ntm255:	lda	exmtbl,y	;get extent mask
	sta	exm

	sec			;now calculate cexm1f
	lda	#31
	sbc	exmtbl,y
	sta	cexm1f
	ldx	curdrv		;get drive as pointer
	lda	bitmap,x	;get bit
	and	lginvc		;if logged in
	bne	extstm		;then exit
	lda	bitmap,x	;get bit back
	ora	lginvc		;set in log-in
	sta	lginvc		;and update
	jmp	flinal		;then fill in maps

extstm:	rts			;and return
;fill in allocation map
flinal:	jsr	setrw		;set to read/write
	lda	maxblk		;divide max block by
	sta	gpcnt		;eight to get max
	lda	maxblk+1
	ldx	#3
clcnab:	lsr	a		;use a for speed
	ror	gpcnt
	dex
	bne	clcnab		;loop if more
	sta	gpcnt+1		;save high
	inc	gpcnt		;bump by one
	bne	*+5
	inc	gpcnt+1		;with carry
	lda	alcmap		;get map start
	ldy	alcmap+1
	sta	alcpnt		;set pointer to start
	sty	alcpnt+1
	ldy	#0		;clear index
clraml:	lda	#0		;clear byte
	sta	(alcpnt),y	;put in map
	inc	alcpnt		;bump pointer
	bne	*+4
	inc	alcpnt+1	;with carry
	lda	gpcnt		;get low of count
	bne	*+5		;skip if not zero
	dec	gpcnt+1		;else drop high
	dec	gpcnt		;always drop low
	lda	gpcnt		;test for zero
	ora	gpcnt+1
	bne	clraml		;loop if more
;at this point complete map is cleared
	lda	maxdrc		;get low of max dir record
	sta	gpcnt
	lda	maxdrc+1	;high in a
	ldx	sxb		;set x according to block size
clcmdb:	lsr	a		;do division
	ror	gpcnt
	dex
	bne	clcmdb		;until x is zero
	sta	gpcnt+1		;set high
	inc	gpcnt		;then bump by one
	bne	*+5
	inc	gpcnt+1
	stx	blknum		;clear block number
	stx	blknum+1
fildal:	lda	blknum		;get block number
	ldy	blknum+1
	jsr	setblk		;set bit
	inc	blknum		;bump block number
	bne	*+5
	inc	blknum+1
	lda	gpcnt		;get low of count
	bne	*+5		;skip if not zero
	dec	gpcnt+1		;else drop high
	dec	gpcnt		;always do low
	lda	gpcnt		;test for zero
	ora	gpcnt+1
	bne	fildal		;loop if more
;at this point directory space is mapped
	jsr	intdrv		;initialize drive
	jsr	cldrnm		;clear directory number
fillpe:	ldx	#1		;parameter for fill
	jsr	nxtdir		;execute for next directory
	bmi	extfil		;done if invalid
	ldy	subrec		;get offset
	lda	(bufadd),y	;get empty/valid flag
	cmp	#$e5		;if empty
	beq	fillpe		;try next
	ldx	#1		;parameter for fill in
	jsr	mapdir		;do directory map
	jmp	fillpe		;then loop
extfil:	rts			;return
;initialize drive
; input:nsystr
; returns:none
; alters:all
intdrv:	jsr	sim+24		;home then

	lda	nsystr		;get number of system tracks
	ldy	nsystr+1
	jmp	sim+30		;and set in sim

;directory record set up
; input:dirnum
; returns:none
; alters:all,recnum,dirrec
drrcsu:	lda	dirnum+1	;move high dir number
	sta	recnum+1	;to record number
	lda	dirnum		;divide
	lsr	recnum+1	;directory by four
	ror	a
	lsr	recnum+1
	ror	a
	sta	dirrec		;and save
	sta	recnum		;set low record number
	lda	recnum+1	;get high
	sta	dirrec+1	;and set
	lda	#0		;clear top byte
	sta	recnum+2
;set track and sector
; input:recnum
; returns:none
; alters:all,countr,trkctr
sttrsc:	ldx	#0		;clear track counter
	stx	trkctr
	stx	countr		;and record
	stx	countr+1	;counter
	stx	countr+2
trnxtr:	lda	recnum		;from
	cmp	countr		;record number
	lda	recnum+1	;and if a
	sbc	countr+1	;borrow then
	lda	recnum+2
	sbc	countr+2
	bcc	higher		;gone too far
	clc			;else
	lda	countr		;get counter
	adc	sectrk		;add sectors per track
	sta	countr		;sectors per track
	lda	countr+1
	adc	sectrk+1
	sta	countr+1
	bcc	bumptr		;done if no carry
	inc	countr+2	;else bump high
bumptr:	inx			;increase track count
	bne	trnxtr		;with carry
	inc	trkctr
	jmp	trnxtr		;then loop
higher:	dex			;back up track
	cpx	#$ff		;see if wrap around
	bne	*+5		;wasn't
	dec	trkctr		;else drop high
	txa			;move to a
	clc			;add starting track
	adc	nsystr
	tax			;save in x
	lda	trkctr
	adc	nsystr+1
	tay			;move to correct registers
	txa
	jsr	sim+30		;then set in sim

	sec			;back
	lda	countr		;counter down
	sbc	sectrk		;by sectors per track
	sta	countr		;and save
	lda	countr+1
	sbc	sectrk+1
	sta	countr+1
	sec			;now
	lda	recnum		;find difference
	sbc	countr		;as sector
	tax			;save in x
	lda	recnum+1
	sbc	countr+1
	tay			;move to correct registers
	txa
	jsr	sim+51		;translate

	jmp	sim+33		;and set through sim

;get block bit mask and index
; input:a&y=block number
; returns:a=bit mask and y=0
; alters:all and alcpnt
blkmsk:	pha			;save block number
	sty	alcpnt+1	;including high
	ldy	#3		;divide by eight
blkmlp:	lsr	alcpnt+1	;shift high
	ror	a
	dey			;loop until done
	bne	blkmlp
	clc			;now add map start
	adc	alcmap
	sta	alcpnt
	lda	alcpnt+1
	adc	alcmap+1
	sta	alcpnt+1
	pla			;get number back
	and	#%00000111	;look at 3 lsbs
	tax			;get
	lda	bitmsk,x	;mask
	rts			;and return
;test block
; input:a&y=block number
; returns:z=1 if unassigned
; 	   =0 if assigned and bit in a is set
; alters:all
tstblk:	jsr	blkmsk		;get mask and index
	and	(alcpnt),y	;mask with map entry
	rts			;then return
;alter block status
; input:a&y=block number,x=1 if set
;		   	  =0 if reset
; returns:none
; alters:all and allocation map
altalc:	cpx	#1		;if set
	beq	setblk		;go do it
clrblk:	jsr	blkmsk		;else get mask
	eor	#$ff		;and complement
	and	(alcpnt),y	;preserve others
	sta	(alcpnt),y	;and save
	rts			;then return
setblk:	jsr	blkmsk		;get mask
	ora	(alcpnt),y	;set bit
	sta	(alcpnt),y	;and put back
	rts			;then return
;set current drive to read only
; input:curdrv,ronlst,bitmap
; returns:none
; alters:a,x,p and ronlst
setron:	ldx	curdrv		;get number
	lda	bitmap,x	;and get mask
	ora	ronlst		;or with status
	sta	ronlst		;and put back
	rts			;then return
;calculate checksum of buffer @ bufadd
; input: buffer@(bufadd)
; returns:a=checksum
; alters:a,y,p
clcchk:	lda	#0		;clear accumulator
	ldy	#127		;start at end
chkmre:	clc			;no carry
	adc	(bufadd),y	;add byte
	dey			;count down
	bpl	chkmre		;and loop until done
	rts			;then return
;check read/write status
; input:curdrv,ronlst
; returns:z=0 if r/o or z=1 if r/w
; alters:a,x,p
chkron:	ldx	curdrv		;get current drive
	lda	bitmap,x	;get mask
	and	ronlst		;and test status
	rts
;initialize record counters from fcb
; input:fcb@(addinp)
; returns:none
; alters:a,y,p,nxtrec,numrec
inrcct:	ldy	#32		;next record offset
	lda	(addinp),y	;get next record
	sta	nxtrec		;and save
	ldy	#15		;number records offset
	lda	(addinp),y	;get number
	sta	numrec		;and save
	rts			;and return
;update record counters in fcb
; input:nxtrec,numrec
; returns:none
; alters:all,fcb@(addinp)
updtrc:	ldx	nxtrec		;get next record
	inx			;bump it
	txa			;transfer
	ldy	#32		;set offset
	sta	(addinp),y	;and store in fcb
	lda	numrec		;get number
	ldy	#15		;and its offset
	sta	(addinp),y	;and store
	rts			;then return
;execute open file
xopen:	jsr	autodr		;auto drive select
;open file
; input:fcb @ (addinp)
; returns:n=1 if not found,a=dirmod (255 if not found)
; alters:all
opnfle:	jsr	fndf13		;match all including extent
	bmi	extopn		;done if not found
	lda	#12		;point to first char
	ora	subrec		;add offset
	tay			;make it a pointer
nxopmv:	lda	(bufadd),y	;get buffer contents
	tax			;and save
	tya			;save index
	and	#%00011111	;remove offset
	tay			;back to index
	txa			;get byte back
	sta	(addinp),y	;and store in fcb
	tya			;get index
	ora	subrec		;add offset back
	tay			;and make index again
	iny			;next position
	tya			;if index
	and	#%00011111	;not gone past
	bne	nxopmv		;end then loop
;now correct extent and max records
	ldy	#12		;point at extent in fcb
	lda	savext		;get save from search
	cmp	(addinp),y	;compare
	beq	extsme		;jump ahead if same
	sta	(addinp),y	;else change extent
	lda	#128		;assume fcb ext < dir ext
	bcc	fcbxls		;jump ahead if true
	asl	a		;clear a
fcbxls:	ldy	#15		;point to max
	sta	(addinp),y	;and set
extsme:	lda	dirmod		;else get number
extopn:	rts			;and return
;execute close file
xclose:	jsr	autodr		;auto drive select
;close file
;if file is r/o then no actual close
;operation is performed.
; input:fcb @ (addinp)
; returns:n=1 if not valid,a=dirmod (255 if invalid)
; alters:all
clsfle:	jsr	fndf13		;match including extent
	bmi	extcls		;exit if not found
	jsr	chkron		;see if r/o
	bne	noclse		;branch if is
;now set flag to ensure directory extent and number of
;records fields are only changed if necessary.
;The decision to change is determined by whether or
;not the system is closing an extent less than the
;maximum extent in the directory entry. If that is
;the case, the directory extent and number of record
;fields are not changed.
	ldy	#12		;get extent
	lda	(addinp),y
	pha			;save it
	tya			;now look in directory
	ora	subrec
	tay
	pla			;get extent back
	cmp	(bufadd),y
	ror	skpdir		;save result
;now go do it
	jsr	updtdr		;update directory
noclse:	lda	dirmod		;get directory number
extcls:	rts			;and return
;execute find first match
xfndfr:	jsr	autodr		;auto drive select
fndf13:	lda	#13		;match including extent
;search for first match
; input:a=number char to match
; returns:n=1 if invalid,a=dirmod (255 if invalid)
; alters:all
frstsr:	pha			;save number to match
	jsr	cldrnm		;clear directory number to -1
	jsr	intdrv		;and drive
	pla			;get number to match
;search for directory match
; input:a=number char to match
; returns:n=1 if not found,a=dirmod (255 if invalid)
; alters:all
search:	sta	chrcnt		;save number
newtry:	ldx	#0		;set for search
	stx	cmppnt		;clear pointer
	jsr	nxtdir		;get next entry
	bmi	exitsr		;exit if not found
	ldx	chrcnt		;get count
mremch:	ldy	cmppnt		;get pointer
	inc	cmppnt		;and bump
	lda	(addinp),y	;get fcb entry
	cpy	#12		;see if at extent
	bne	notaex		;jump if not
	sta	savext		;save for later use
	pha			;save extent
	tya			;change to directory
	ora	subrec		;coordinates
	tay
	pla			;get extent back
	eor	(bufadd),y	;exclusive or with dir
	and	cexm1f		;and with exm complement + 1f
	beq	trynxt		;ok if zero
	bne	newtry		;else get next directory
notaex:	cmp	#'?'		;if a ? then
	beq	trynxt		;is a match
	pha			;save char
	tya			;then add
	ora	subrec		;offset to
	tay			;make pointer
	pla			;get char back
	cmp	(bufadd),y	;if not same
	bne	newtry		;try next directory
trynxt:	dex			;else count number down
	bne	mremch		;and loop if more
	lda	dirmod		;return with directory
exitsr:	rts			;number mod 4
;calculate logical record number
; input:blknum
; returns:none
; alters:a,x,p,recnum
calrcn:	ldx	sxb		;set x according to blkscd
mulmre:	asl	blknum		;multiply block
	rol	blknum+1	;number
	rol	blknum+2
	dex			;by code
	bne	mulmre
	lda	sab		;set mask in a
	and	nxtrec		;and with next record
	ora	recnum		;or with number
	sta	recnum		;and save
	rts
;update directory
updtdr:	lda	#32		;change all
	ldx	#0		;from start
;change directory entry
; input:a=number char to change,x=starting position,fcb@(addinp)
; returns:none
; alters:all,directory,checksums
dirchg:	sta	chrcnt		;save count
	dec	chrcnt		;back up
mrechg:	clc			;clear carry
	txa			;get offset
	adc	chrcnt		;compute index
	tay			;and set
	cpy	#12		;see if at extent
	beq	docare		;if so do special
	cpy	#15		;see if at number rec
	bne	dntcar		;if not skip
docare:	bit	skpdir		;check flag
	bpl	nochng		;skip if ok
dntcar:	lda	(addinp),y	;get char
	pha			;save it
	lda	chrcnt		;get count
	ora	subrec		;add offset
	tay			;make an index
	pla			;get char back
	sta	(bufadd),y	;and put in buffer
nochng:	dec	chrcnt		;count down
	bpl	mrechg		;and loop
	jsr	drrcsu		;set it up
	jmp	updtck		;and do change
;execute create file
xmake:	jsr	autodr		;auto drive select
;create file
; input:fcb@(addinp)
; returns:n=1 if not valid,a=dirmod (255 if not valid)
; alters:dirnum,dirmod,fcb@(addinp)
mkefle:	jsr	tstron		;test for r/o
	lda	addinp		;save fcb
	pha			;address
	lda	addinp+1	;on
	pha			;stack
	lda	empdvc		;then point
	ldy	empdvc+1	;to empty
	sta	addinp		;dummy
	sty	addinp+1	;fcb
	lda	#1		;match only
	jsr	frstsr		;first char
	pla			;restore
	sta	addinp+1	;fcb
	pla			;address
	sta	addinp		;from stack
	lda	dirmod		;get number mod 4
	bmi	extmke		;quit if not found
	ldy	#13		;else set up
	lda	#0		;to clear
mkeagn:	sta	(addinp),y	;rest of
	iny			;fcb
	cpy	#33		;including next
	bne	mkeagn		;record
;the next two lines ensure that the extent and
;number of records fields are updated
	sec
	ror	skpdir
	jsr	updtdr		;update directory
	lda	dirmod		;get number
extmke:	rts			;and quit
;extend file
; input:fcb@(addinp), x=1 read
;		        0 write
extend:	stx	exrwfl		;save parameter
	jsr	clsfle		;close current extent
	bmi	extext		;exit if not found
	ldy	#12		;else
	lda	(addinp),y	;get extent
	clc			;and
	adc	#1		;add one
	and	#%00011111	;see if overflow
	beq	exteof		;eof if so
	sta	(addinp),y	;and save
	jsr	fndf13		;see if next extent exists
	bpl	opnext		;if so open
	lda	exrwfl		;if not and is write then create
	bne	extext		;else return as eof
dwrtex:	jsr	mkefle		;create file
	jmp	tstext		;and test
opnext:	jsr	opnfle		;open
tstext:	bpl	extnok		;continue if ok
exteof:	lda	#1		;else set eof
	rts			;and return
extnok:	jsr	inrcct		;initialize counters
	lda	#0		;good
extext:	rts			;return
;set up next directory block
; input:dirnum,x=1 for update checksum
; returns:a=dirmod (255 if invalid),n=1 if invalid
; alters:alll,dirnum,dirmod
nxtdir:	txa			;save operation
	pha			;on stack
	inc	dirnum		;bump directory
	bne	*+5
	inc	dirnum+1
	lda	maxdir		;if not at limit continue
	cmp	dirnum
	lda	maxdir+1
	sbc	dirnum+1
	bcs	gtnxdr		;then continue
	pla			;else clear stack
	tax			;and set x
	jmp	cldrnm		;set to invalid
gtnxdr:	lda	dirnum		;get low again
	and	#%00000011	;look at 2 lsbs
	sta	dirmod		;save mod 4
	asl	a		;multiply
	asl	a		;by
	asl	a		;32 to
	asl	a		;get pointer
	asl	a		;offset
	sta	subrec		;and save
	beq	getdir		;if zero read new
	pla			;else clear stack
	tax			;set x
	jmp	gotdir		;and exit
getdir:	jsr	drrcsu		;set up to read
	jsr	rdesec		;do read
	pla			;get operation
	tax			;code
;;;;;;	jsr	chksop		;do it
gotdir:	lda	dirmod		;and return
exnxdr:	rts			;with number
;checksum operation
;this routine assumes calling routine has checked for
;valid dirnum and hence valid dirrec
; input:chkflg,dirrec,x (1=update else check)
; returns:none
; alters:map@(chkmap)
chksop:	bit	chkflg		;check flag
	bmi	exnxdr		;done if set
	dex			;dec code
	bne	tstchk		;if not zero test
	jsr	clcchk		;else calculate
	jsr	clcckp		;calculate pointer
	sta	(chkpnt),y	;and save
	rts			;then return
tstchk:	jsr	clcchk		;do calculation
	jsr	clcckp		;calculate pointer
	cmp	(chkpnt),y	;compare to old
	beq	exnxdr		;if equal ok
	jmp	setron		;else set to r/o
;get block number
; input:nxtrec,blmode,fcb@(addinp),sxb,exm
; returns:none
; alters:all,blknum
getblk:	ldx	sxb		;set x according to blkscd
	lda	nxtrec		;get next record
gblp:	lsr	a		;divide by 2 x times
	dex
	bne	gblp
	sta	blknum		;save previous as temp
;use extent as offset but first use sxb to create param
	sec
	lda	#8
	sbc	sxb
	tax
;now get extent from fcb
	ldy	#12
	lda	(addinp),y
	and	exm		;and with mask
	lsr	a		;shift with lsb to c
gbxlp:	rol	a		;now go other way
	dex
	bne	gbxlp
	clc			;now add saved value
	adc	blknum		;back
	bit	blmode		;test mode
	bpl	*+3		;skip if byte
	asl	a		;else times two
	clc			;then add
	adc	#16		;offset into fcb
	sta	fcbind		;save for later
	tay			;set index
	lda	(addinp),y	;get number
	sta	blknum		;store
	iny
	lda	#0		;clear
	bit	blmode		;test mode
	bpl	*+4		;skip if byte
	lda	(addinp),y	;else get high
	sta	blknum+1	;high byte
	rts			;and return
;calculate chkpnt as function of dirrec and chkmap
; input:dirrec,chkmap
; returns:y=0
; alters:y,p,chkpnt
clcckp:	pha			;save a
	clc
	lda	dirrec		;add record number
	adc	chkmap		;to start
	sta	chkpnt
	lda	dirrec+1
	adc	chkmap+1
	sta	chkpnt+1
	ldy	#0
	pla			;get a back
	rts
;clear directory number to $ffff
; input:none
; returns:a=$ff,n=1,z=0
; alters:a,p,dirnum,dirmod
cldrnm:	lda	#$ff		;set to $ff
	sta	dirnum
	sta	dirnum+1
	sta	dirmod
	rts
;change allocation map
; input:subrec,directory record @ (bufadd)
; returns:none
; alters:all,allocation map
mapdir:	clc			;add 16 to
	lda	subrec		;to subrec to point
	adc	#16		;to block number field
	tay			;make index
lpmpdr:	sty	mpdrsy		;save index
	txa			;save x
	pha			;operation
	lda	(bufadd),y	;get block number
	sta	mpdrtm		;save in temp
	iny			;bump index for word
	jsr	gthibn		;get high part of number
mpdrnw:	ora	mpdrtm		;see if zero
	beq	skpedr		;skip if zero
	jsr	gthibn		;get high again
	tay			;move to y
	lda	mpdrtm		;get low again
	jsr	altalc		;else alter map
skpedr:	pla			;get operation
	tax			;back
	ldy	mpdrsy		;get index back
	iny			;bump it
	tya			;if still
	and	#%00001111	;in field
	bne	lpmpdr		;then loop
	rts			;else quit
;test r/w status
;does warm boot if r/o
; input:curdrv,ronlst
; returns:none
; alters:a,x,p
tstron:	jsr	chkron		;test bit
	beq	exttro		;exit if r/w
	jsr	errout		;else send error
	lda	rommvc		;point to r/o
	ldy	rommvc+1	;message
	jsr	sndstr		;send it
	jmp	xwboot		;then abort
;set current drive to r/w
; input:curdrv,ronlst
; returns:ronlst
; alters:a,x,p,ronlst
setrw:	ldx	curdrv		;get drive
	lda	bitmap,x	;and mask
	eor	#$ff		;complement
	and	ronlst		;and with status
	sta	ronlst		;save
exttro:	rts			;return
;read sector
rdesec:	jsr	sim+39		;do read

	jmp	chkrwe		;check for error
;update checksum and directory
updtck:	ldx	#1		;set for update
;;;;;	jsr	chksop		;do it
	lda	#1		;say is directory op
	bne	secwrt		;do it
;write sector
wrtsec:	lda	pemwrtype		;get write type
secwrt:	jsr	sim+42		;do write

chkrwe:	cmp	#0		;if not ok
	beq	exttro		;done if zero
;read/write error
rwerrt:	jsr	errout		;send error message
	lda	bdsmvc		;point to
	ldy	bdsmvc+1	;bad sector message
	jsr	sndstr		;and send
	jsr	getcon		;get input
	cmp	#cr		;if a cr
	beq	ignerr		;then continue
	jmp	xwboot		;else abort
ignerr:	jmp	pcrlf		;crlf and return
;error output routine
; input:curdrv,pemmvc
; returns:none
; alters:all
errout:	lda	pemmvc		;point to
	ldy	pemmvc+1	;error message
	jsr	sndstr		;send it
	lda	curdrv		;get drive number
	clc			;add
	adc	#'A'		;ascii a
	jmp	sndchr		;and send it
;get high part of block number if word (zero if byte)
; input:y=index to high,blmode,directory@(bufadd)+subrec
; returns:a=high part of block number
; alters:a,p,mpdrsy iff word
gthibn:	lda	#0		;preset for byte
	bit	blmode		;test mode
	bpl	gthiex		;done if byte
	lda	(bufadd),y	;get high
	sty	mpdrsy		;alter y
gthiex:	rts
;get console input
; input:pndkey
; returns:a=character
; alters:all,pndkey
getcon:
	lda	pndkey		;get pending
	pha			;save it
	lda	#0		;clear
	sta	pndkey		;pending
	pla			;restore
	bne	extget		;exit if not null
	jsr	sim+9		;else get new

extget:	rts			;and return
;check keyboard status
;handles <ctl-s> for freeze and <ctl-c> for boot
; input:pndkey
; returns:a=0 if no input or <>0 if input
; alters:all,pndkey
kbdsts:
	lda	pndkey		;get pending
	bne	extkbd		;if there quit
	jsr	sim+6		;else test
	CMP	#$00		;if zero
	beq	extkbd		;exit
	jsr	sim+9		;else get input
	cmp	#ctls		;if not freeze
	bne	newpnd		;save input
	jsr	sim+9		;else wait for more
	cmp	#ctlc		;if not abort
	bne	nowarm		;then jump
	jmp	xwboot		;else do warm boot
nowarm:	lda	#0		;clear
	rts			;and return
newpnd:	sta	pndkey		;save
	lda	#$ff		;set ready
extkbd:
	rts			;and return
;test character
; input:a=character
; returns:c=0 if control or c=1 if printing
; alters:p
tstchr:	cmp	#cr		;if cr
	beq	chtext		;quit
	cmp	#lf		;if linefeed
	beq	chtext		;quit
	cmp	#ctli		;if tab
	beq	chtext		;quit
	cmp	#' '		;see if control
chtext:	rts			;and return
;send string ending in $
; input:ay=string address
; returns:none
; alters:all,index,sndlpe+1 and +2
sndstr:	sta	sndlpe+1	;set pointer
	sty	sndlpe+2
	ldy	#0
sndlpe:	lda	$ffff,y		;get char
	cmp	#'$'		;if terminator
	beq	sndext		;then exit
	iny			;else bump
	sty	index		;and save
	jsr	sndchr		;send char
	ldy	index		;get index
	bne	sndlpe		;and loop
sndext:	rts			;return
;send char to printer if enabled
; input:a=character,lstflg
; returns:a=character
; alters:x,y,p
lstout:
	bit	lstflg		;test flag
	bpl	extlst		;exit if off
	bit	outflg		;test output flag
	bmi	extlst		;done if set
	pha			;save char
	jsr	sim+15		;send
	pla			;get char
extlst:	rts			;and done
;output a character
; input:a=character,console definition block in sim
; returns:none
; alters:all,positn
output:	jsr	tstchr		;test it
	bcs	sndchr		;if not control jump
	pha			;else save
	lda	sysdef+4	;get invert
	jsr	nolist		;send to console
	lda	#'^'		;get arrow
	jsr	lstout		;send to printer
	pla			;get character
	ora	#'A'-1		;convert to ascii
	jsr	pchrot		;send to all
	lda	sysdef+3	;get normal
	jmp	nolist		;to console
sndchr:	cmp	#ctli		;if not tab
	bne	pchrot		;send
tabspc:	lda	#' '		;else get space
	jsr	pchrot		;send
	lda	positn		;get count
	and	#7		;if not mod 8
	bne	tabspc		;loop
	rts			;else exit
pchrot:	pha			;save char
	jsr	kbdsts		;test input
	pla			;restore
	jsr	lstout		;to printer if on
nolist:	pha			;save again
	bit	outflg		;test flag
	bmi	*+5		;done if set
	jsr	sim+12		;to console
	pla			;restore
	inc	positn		;bump col
	cmp	#' '		;if space or more
	bcs	extchr		;is ok
	cmp	sysdef+2	;also ok
	beq	extchr		;if forward
	dec	positn		;else drop back
	cmp	sysdef+0	;see if bs
	bne	tryotr		;branch if not
	dec	positn		;else drop again
	bmi	zrocol		;zero if <0
	rts			;else ok
tryotr:	cmp	#cr		;if a cr
	beq	zrocol		;clear col
	cmp	sysdef+7	;if a formfeed
	beq	zrocol		;also clear
	cmp	sysdef+8	;if not home
	bne	extchr		;then done
zrocol:	lda	#0		;clear
	sta	positn		;column
extchr:	rts			;and exit
;go to left and space past prompt
; input:frscol,positn
; returns:none
; alters:positn
spcovr:	lda	#cr		;get cr
	jsr	pchrot		;send to all
	lda	#lf		;send lf
	jsr	lstout		;only to printer
mreovr:	lda	frscol		;get first
	cmp	positn		;see if there
	beq	extchr		;done if is
	lda	sysdef+2	;get forward
	jsr	nolist		;send it
	jmp	mreovr		;and loop
;buffered read
; input:buffer@(addinp)
; returns:none
; alters:all,buffer@(addinp)
bufinp:	lda	#0		;clear
	ldy	#1		;length
	sta	(addinp),y	;position in buffer
	sty	bufpsn		;set point to 1
	lda	positn		;get current
	sta	frscol		;and save
nxtinp:	jsr	getcon		;get input
	ldy	bufpsn		;get index
	cmp	#cr		;if not a cr
	bne	notcr		;then jump
	jmp	endlin		;else done
notcr:	cmp	#delete		;if not delete
	bne	ntdelt		;then jump
	cpy	#1		;else if start
	beq	nxtinp		;then loop
	lda	(addinp),y	;get last
	pha			;save char
	ldy	#1		;point to count
	sec			;set carry
	lda	(addinp),y	;get count
	sbc	#1		;decrement
	sta	(addinp),y	;then save
	pla			;restore char
	dec	bufpsn		;backup pointer
	cmp	#' '		;if space or more
	bcs	nrmbs		;just backspace
	cmp	#ctli		;see if tab
	bne	ctlbs		;if not is control
	sec			;set flag
	ror	outflg
	lda	positn		;get position and save
	sta	lstcol
	jsr	spcovr		;else go back
	jsr	rptlne		;and retype
	lda	positn		;get new last position
	pha			;save on stack
	sec			;subtract to get delta
	lda	lstcol
	sbc	positn
	sta	lstcol		;and save
	asl	outflg		;clear flag
bstab:	jsr	dobs		;do one
	dec	lstcol		;drop count
	bne	bstab		;loop if more
	pla			;get position
	sta	positn		;and set
	jmp	nxtinp		;then loop
ctlbs:	lda	sysdef+3	;get normal
	jsr	chkbs		;bs if printing
	lda	sysdef+4	;same for invert
	jsr	chkbs		;then delete char itself
nrmbs:	jsr	dobs		;do a backspace
	jmp	nxtinp		;and loop
ntdelt:	cmp	#ctlp		;if not ctl-p
	bne	ntctlp		;then jump
	lda	lstflg		;else get printer flag
	eor	#$ff		;complement
	sta	lstflg		;save
	jmp	nxtinp		;and loop
ntctlp:	cmp	#ctlx		;if not ctl-x
	bne	ntctlx		;then jump
	jsr	spcovr		;restart
	lda	sysdef+1	;get clear to eol
	jsr	nolist		;send it
	jmp	bufinp		;and start over
ntctlx:	cmp	#ctlr		;if not ctl-r
	bne	ntctlr		;then jump
	jsr	spcovr		;restart
	jsr	rptlne		;retype line
	jmp	nxtinp		;and start over
ntctlr:	iny			;next position
	sta	(addinp),y	;store char
	pha			;and save
	sty	bufpsn		;index
	ldy	#1		;point to count
	tya			;set a to 1
	clc			;then
	adc	(addinp),y	;add count
	sta	(addinp),y	;and save
	pla			;restore char
dontsv:	jsr	output		;send char
	ldy	bufpsn		;get index
	lda	(addinp),y	;get char
	cmp	#ctlc		;if not ctl-c
	bne	ignrcc		;ignore
	ldy	#1		;get count
	lda	(addinp),y	;from buffer
	cmp	#1		;if not at start
	bne	ignrcc		;ignore
	jmp	xwboot		;else do warm boot
ignrcc:	ldy	#1		;get
	lda	(addinp),y	;count
	dey			;point to max
	cmp	(addinp),y	;if length
	bcs	lineen		;at max jump
	jmp	nxtinp		;else loop
lineen:	lda	#cr		;get a cr
endlin:	jmp	pchrot		;and send
;cr and lf
pcrlf:	lda	#cr		;then a
	jsr	pchrot		;cr
	lda	#lf		;and a
	jmp	pchrot		;lf
;retype line
rptlne:	lda	bufpsn		;save point
	sta	numcnt		;as count
	lda	#1		;start position
	pha			;save
mrerpt:	pla			;get position
	dec	numcnt		;count down
	bne	*+3		;continue if more
	rts			;else done
	tay			;else make index
	iny			;and bump
	tya			;save
	pha			;on stack
	lda	(addinp),y	;get char
	jsr	output		;send
	jmp	mrerpt		;and loop
;check for printing and backspace if needed
chkbs:	cmp	#' '		;compare to space
	bcc	extdec		;not printing so done
;do a backspace
dobs:	lda	sysdef+0	;get backspace
	pha			;save it
	jsr	nolist		;send
	lda	#' '		;get space
	jsr	nolist		;send
	pla			;get backspace
	jmp	nolist		;send it
;test for decimal digit
;if decimal then c=0 else c=1
tstdec:	cmp	#'0'		;if under 0
	bcc	notdec		;then not decimal
	cmp	#'9'+1		;if 9 or under is ok
	bcc	extdec
notdec:	sec			;else not a match
extdec:	rts
;test for hexadecimal digit
;if hex then c=0 else c=1
tsthex:	jsr	tstdec		;first try decimal
	bcc	extdec		;ok if dec
	cmp	#'A'		;if under A
	bcc	notdec		;then not hex
	cmp	#'F'+1		;set c in F compare
	rts
;bump load address by 128 and return in ay
adjdb:	lda	dskbuf		;get old
	ldy	dskbuf+1	;address
	clc			;and bump
	adc	#128		;by 128
	sta	dskbuf		;save low
	bcc	*+6		;then bump
	iny			;and save
	sty	dskbuf+1	;high as needed
	rts
;move record from disk buffer to default buffer
mv128:	lda	dskbuf		;get address
	ldy	dskbuf+1
	sta	mvfrom+1	;and set pointer
	sty	mvfrom+2
	ldx	#0		;clear index
mvfrom:	lda	$ffff,x		;get byte
	sta	dflbuf,x	;move it
	inx
	bpl	mvfrom		;loop until done
	rts

;relocatable vectors
	.byte	$4c
extevc:	.word	extexq-1
	.byte	$4c
sltmvc:	.word	sltmsg
	.byte	$4c
empdvc:	.word	empty
	.byte	$4c
rommvc:	.word	romsg
	.byte	$4c
bdsmvc:	.word	bdsmsg
	.byte	$4c
pemmvc:	.word	pemmsg
	.byte	$4c
dcbevc:	.word	dcb
;relocation stopper
	.byte	$ff
;messages
romsg:	.byte	" - R/O$"
bdsmsg:	.byte	" - BAD SECTOR"
	.byte	cr,lf,"<RET> TO IGNORE -- <OTHER> "
	.byte	"TO ABORT$"
pemmsg:	.byte	cr,lf,"PEM ERROR ON $"
sltmsg:	.byte	" - INVALID DRIVE$"

;dummy fcb
empty:	.byte	$e5
;zero page switch enable table
swctbl:	.byte	0,0,0,0,0,0,0,0
	.byte	0,0,1,0,0,1,1,1
	.byte	1,1,1,1,1,1,1,1
	.byte	0,0,1,0,0,0,0,0
	.byte	0,0,0,0
;bit mask table
bitmsk:	.byte	128,64,32,16,8,4,2,1
;bit map table
bitmap:	.byte	1,2,4,8,16,32,64,128
;extent mask table (also uses 3 bytes in sabtbl
exmtbl:	.byte	0,1,3
;sab table
sabtbl:	.byte	7,15,31,63,127
;variable storage
skpdir:	.byte	0		;positive if no change
fcbind:	.byte	0		;index to block number
savext:	.byte	0		;save extent
frscol:	.byte	0		;first col
pndkey:	.byte	0		;pending input
lstflg:	.byte	0		;printer flag
positn:	.byte	0		;print position
swcflg:	.byte	0		;zero page switch flag
bytinp:	.word	0		;input value
cmdinp:	.byte	0		;input command
addout:	.word	0		;output address
bytout	=	addout		;output value
bufpsn:	.byte	0		;input buffer position
exrwfl:	.byte	0		;extend flag
tmpdrv:	.byte	0		;temporary drive number
;align xqtvec on word boundary
	.align 2
xqtvec:	.word	0		;command vector
countr:	.word	0		;record counter
	.byte	0		;overflow
lkdown:	.word	0		;down pnt. for block search
lookup:	.word	0		;up pnt. for block search
olddrv:	.byte	0		;old drive number
curdrv:	.byte	0		;current drive
lginvc:	.byte	0		;log in status
ronlst:	.byte	0		;read write status
dirnum:	.word	0		;directory number
subrec:	.byte	0		;directory offset
recnum:	.word	0		;record number
blknum	=	recnum		;block number
	.byte	0		;overflow
chrcnt:	.byte	0		;character count
cmppnt:	.byte	0		;comparison pointer
nxtrec:	.byte	0		;next record
numrec:	.byte	0		;number records
dirrec:	.word	0		;directory record
dirmod:	.byte	0		;directory mod 4
index:	.byte	0		;buffer index
numcnt:	.byte	0		;counter
outflg:	.byte	0		;output enable flag
lstcol:	.byte	0		;last column
mpdrsy:	.byte	0		;save for y in mapdir
mpdrtm:	.byte	0		;temp in mapdir
blmode:	.byte	0		;<128 if byte else word
maxdrc:	.word	0		;max directory record
sab:	.byte	0		;mask for block
sxb:	.byte	0		;shift for block
rtclk:	.byte	0,0,0		;real time clock
gpcnt:	.word	0		;gp counter
trkctr:	.byte	0		;track counter
;following region is used to capture dcb
dcb:
maxblk:	.word	0		;maximum block number
sectrk:	.word	0		;sectors per track
nsystr:	.word	0		;number system tracks
blkscd:	.byte	0		;block size code
maxdir:	.word	0		;maximum directory number
alcmap:	.word	0		;address of allocation map
chkflg:	.byte	0		;check flag
chkmap:	.word	0		;address of checksum map
pemwrtype:	.byte	0		;write type 0=norm,1=dir,2=unalloc
exm:	.byte	0		;extent mask
cexm1f:	.byte	0		;exm complemented and 1f
;zero page save block
varblk:
lowin:	.word	0
	.word	0		;save bufadd
	.word	0		;save alcpnt
	.word	0		;save chkpnt
