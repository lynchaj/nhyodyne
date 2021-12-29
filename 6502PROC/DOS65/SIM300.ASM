;dos/65 system interface module (sim)
;version 3.00
;this version is designed to work with MON900
;to handle DSDD and DSHD floppy disks.
;disk configuration:
; a 8 inch sssd - physical drive 0
; b 8 inch sssd - physical drive 1
; c 5 inch 40t dsdd (Kaypro IV) - physical drive 2
; d 5 inch 80t dshd (1.2 MB) - physical drive 3
; e cp/m hard disk partition
; f dos/65 hard disk partition
; g 5 inch 40t ssdd (Kaypro II) - physical drive 2
;released:	29 april 1996
;note that under dos/65 2.1 the code and initialized data
;portions of sim can be no longer than 11 sectors long.
;for sim start of $ed00, $f280 and up must be uninitialized
;or unused.
;base addresses
msize	=	62		memory size in 1k blocks
pages	=	11		pages in sim
io	=	$f800		i/o page base address
wbtjmp	=	$100		warm boot entry
pemjmp	=	$103		pem entry
iostat	=	$106		io status byte
dflbuf	=	$128		default buffer
;my system i/o routines in rom
sysrom	=	$f900		monitor start
intlz	=	sysrom		system initialization
consts	=	sysrom+6	console status
conrde	=	sysrom+9	console read
conwrt	=	sysrom+12	console write
setdrv	=	sysrom+15	set drive number
settrk	=	sysrom+18	set track
setsec	=	sysrom+21	set sector
setbuf	=	sysrom+24	set disk buffer addr
rdesec	=	sysrom+27	read sector
wrtsec	=	sysrom+30	write sector
fhome	=	sysrom+33	home floppy
prnwrt	=	sysrom+36	printer
rdtime	=	sysrom+39	read clock
wrecal	=	sysrom+42	recal winchester
xlate	=	sysrom+45	sector translate
outmsg	=	sysrom+48	output message
;winchester basic parameters
mxcl	=	306		cyl per drive
mxhd	=	6		heads per drive
;derived winchester parameters for dcb
numcyl	=	mxcl/2		cyl per logical drive
spt	=	mxhd*32*2	dos/65 sectors per track
blkscd	=	1		2048 byte blocks
maxblk	=	numcyl*mxhd*4-1	max block number
maxdir	=	1023		1024 directory entries
;pem constants on entry to write
wrall	=	0		write to allocated
wrdir	=	1		write to directory
wrual	=	2		write to unallocated
;page zero and system ram assignments
mvepnt	=	$f2		host buffer location
dmaadr	=	$f4		pointer for r/w
point	=	$fe		gp pointer
;module addresses
memlng	=	msize*1024	memory length in bytes
simlng	=	pages*256	sim length in bytes
pemlng	=	3072		pem length in bytes
ccmlng	=	2048		ccm length in bytes
pem	=	memlng-simlng-pemlng	pem start
ccm	=	pem-ccmlng	ccm start
length	=	ccmlng+pemlng	length less sim
nsects	=	length/128	number sectors
;fixed parameters
cr	=	$d		carriage return
lf	=	$a		linefeed
;main program
*	=	memlng-simlng	start of sim
;jump vector used by pem
sim	jmp	boot		from cold start
wboote	jmp	wboot		from warm boot
	jmp	consts		check for input
	jmp	conrde		get input
	jmp	conwrt		send to terminal
	jmp	prnwrt		printer output
	nop			punch output
	nop
	rts
	nop			reader input
	nop
	rts
	jmp	home		home drive
	jmp	seldsk		select disk
	jmp	seltrk		set track
	jmp	selsec		set sector
	jmp	setdma		set buffer address
	jmp	read		read sector
	jmp	write		write sector
	lda	#1		printer always ready
	rts
	jmp	rdtime		clock entry
	jmp	xlate		translate
;console definition block
	.byt	0		scratch
	.byt	8		backspace
	.byt	1		clear to end of line
	.byt	$c		forward space
	.byt	0		normal video
	.byt	'^'		invert video
	.byt	24		lines per screen
	.byt	80		char per line
	.byt	$c		formfeed
	.byt	$1e		home
	.byt	2		clear to end of screen
;opening id message
opnmsg	.byt	cr,lf,'3.00',0
;cold entry from loader
boot	jsr	wrecal		recal winchester
	lda	#<opnmsg	point to message
	ldy	#>opnmsg
	jsr	outmsg		send it
;set up jumps into dos/65 in page one
setup	ldx	#0		clear index
;first clear key dba variables
	stx	hstact		host buffer inactive
	stx	unacnt		clear unalloc count
setupl	lda	inttbl,x	get byte
	sta	$100,x		insert at start
	inx
	cpx	#6
	bne	setupl		loop until done
	lda	#<dflbuf	get low buffer
	ldy	#>dflbuf	and high
	jsr	setdma		and set
	lda	sekdsk		get disk
	jmp	ccm		and go to ccm
;initialization table
inttbl	.byt	$4c,<wboote,>wboote,$4c,<pem,>pem
;warm boot-read dos/65 back except sim and then
; jump to ccm.
wboot	ldx	#$ff		set stack
	txs			pointer
	cld			set binary mode
	jsr	intlz		intialize interrupts
	lda	#0		set zero
	jsr	setdrv		and select drive zero
	jsr	fhome		home that drive
	lda	#0		set track to 0
	tay
	jsr	settrk
	lda	#<ccm	 	get ccm low
	ldy	#>ccm		and high
	jsr	setdma		then set start
	lda	#nsects		get number sectors
	sta	count		and set count
	lda	#2		starting sector
rdblk	ldy	#0
	sta	savsec		save for later
	jsr	setsec		set it
	jsr	rdesec		then do read
	and	#$ff		test for error
	bne	rderr		if error handle it
	clc			clear carry
	lda	dmaadr		get buffer address
	ldy	dmaadr+1
	adc	#128		and raise it
	bcc	nocary		skip if no carry
	iny			bump high
nocary	jsr	setdma		reset
	dec	count		count down
	beq	aldon		if zero done
	lda	savsec		else get old sector
	cmp	#26		if last in track
	beq	newtrk		go to track 1
	adc	#1		else add 1
	bne	rdblk		and read next portion
newtrk	lda	#1		set track
	ldy	#0
	jsr	settrk		to one
	lda	#1		else set sector to 1
	bne	rdblk		and loop
aldon	lda	sekdsk		set default drive
	jsr	setdrv
	jmp	setup		go setup
rderr	jmp	($fffc)		go to monitor
;select disk
seldsk	and	#7		three lsbs only
	jsr	setdrv		go to rom
	sta	sekdsk		save for later
	asl	a		multiply by two
	tax			make an undex
	lda	dcbtbl,x	get address
	ldy	dcbtbl+1,x
	rts
;table of dcb addresses
dcbtbl	.wor	dcba
	.wor	dcbb
	.wor	dcbc
	.wor	dcbd
	.wor	dcbe
	.wor	dcbf
	.wor	dcbg
;see if deblocking required for sekdsk
;returns number of dos/65 sectors per physical
;sector in a and
;returns z=1 if no deblocking reguired else z=0
tstdbl	ldx	sekdsk		get desired disk
;see if deblocking required for disk x
tstdbx	lda	spttbl,x	get dos/65 sectors/host
	cmp	#1		test for no deblock
	rts
;table containing number of dos/65 sectors
;per host physical sector.  if entry is 1
;then deblocking is skipped.
spttbl	.byt	1,1,4,4,2,2,4
;table of records/block
rbltbl	.byt	8,8,16,16,16,16,8
;home the selected disk
home	lda	hstwrt		check for pending write
	bne	homed		there is so skip
	sta	hstact		clear host active flag
	jmp	fhome		then home drive
homed	rts			do nothing
;the read entry point takes the place of
;the previous sim definition for read.
;read the selected dos/65 sector
read	ldx	#0		x <-- 0
	stx	unacnt		clear unallocated count
	inx			x <-- 1
	stx	readop		say is read operation
	stx	rsflag		must read data
	inx			x <-- wrual
	stx	wrtype		treat as unalloc
	jmp	rwoper		to perform the read
;The write entry point takes the place of
;the previous sim defintion for write.
;write the selected dos/65 sector
write	sta	wrtype		save param from pem
	jsr	tstdbl		see if one rec/sec
	bne	usewrt		if not use type passed
	lda	#wrdir		if is say directory
	sta	wrtype		to force write
usewrt	ldx	#0		say is
	stx	readop		not a read operation
	lda	wrtype		get write type back
	cmp	#wrual		write unallocated?
	bne	chkuna		check for unalloc
;write to unallocated, set parameters
	ldx	sekdsk		get next disk number
	lda	rbltbl,x	get records/block
	sta	unacnt
	stx	unadsk		unadsk <-- sekdsk
	lda	sektrk
	ldy	sektrk+1
	sta	unatrk		unatrk <-- sectrk
	sty	unatrk+1
	lda	seksec
	ldy	seksec+1
	sta	unasec		unasec <-- seksec
	sty	unasec+1
;check for write to unallocated sector
chkuna	lda	unacnt		any unalloc remain?
	beq	alloc		skip if not
;more unallocated records remain
	dec	unacnt		unacnt <-- unacnt-1
	lda	sekdsk
	cmp	unadsk		sekdsk = unadsk?
	bne	alloc		skip if not
;disks are the same
	lda	unatrk		sektrk = unatrk?
	cmp	sektrk
	bne	alloc		no so skip
	lda	unatrk+1
	cmp	sektrk+1
	bne	alloc		skip if not
;tracks are the same
	lda	unasec		seksec = unasec?
	cmp	seksec
	bne	alloc		no so skip
	lda	unasec+1
	cmp	seksec+1
	bne	alloc		skip if not
;match, move to next sector for future ref
	inc	unasec		unasec = unasec+1
	bne	nounsc
	inc	unasec+1
;calculate dos/65 sectors/track
nounsc	lda	sekdsk		get disk number
	asl	a		mult by two
	tax			make an index
	lda	dcbtbl,x	get dcb start
	ldy	dcbtbl+1,x
	sta	point		set pointer
	sty	point+1
;point has address now get spt at byte 2,3
	ldy	#2
	lda	(point),y	low
	sta	d65spt
	iny
	lda	(point),y
	sta	d65spt+1	then low
;check for end of track
	lda	unasec		end of track?
	cmp	d65spt		count dos/65 sectors
	lda	unasec+1
	sbc	d65spt+1
	bcc	noovf		skip if no overflow
;overflow to next track
	lda	#0		unasec <-- 0
	sta	unasec
	sta	unasec+1
	inc	unatrk		unatrk <-- unatrk+1
	bne	noovf
	inc	unatrk+1
;match found, mark as unnecessary read
noovf	lda	#0		0 to accumulator
	sta	rsflag		rsflag <-- 0
	beq	rwoper		to perform the write
;not an unallocated record, requires pre-read
alloc	ldx	#0		x <-- 0
	stx	unacnt		unacnt <-- 0
;say preread required
	inx			x <-- 1
	stx	rsflag		rsflag <-- 1
;check for single record/sector - and if so
;then say preread not required.
	jsr	tstdbl		test
	bne	rwoper		more than one
	lda	#0		say no preread
	sta	rsflag
;common code for read and write follows
;enter here to perform the read/write
rwoper	lda	#0		zero to accum
	sta	erflag		no errors (yet)
	lda	seksec		compute host sector
	ldy	seksec+1
	sta	sekhst
	sty	sekhst+1
	jsr	tstdbl		get records/sector
	lsr	a		divide by two
	tax			make a counter
	beq	noshif		done if zero
shflpe	lsr	sekhst+1	do high
	ror	sekhst		then low
	dex
	bne	shflpe		loop if more
;active host sector?
noshif	lda	hstact		host active flag
	pha			save
	inx			x <-- 1
	stx	hstact
	pla			get flag back
	beq	filhst		fill host if not active
;host buffer active, same as seek buffer?
	lda	sekdsk
	cmp	hstdsk		same disk?
	bne	nmatch
;same disk, same track?
	lda	hsttrk		sektrk = hsttrk?
	cmp	sektrk
	bne	nmatch		no
	lda	hsttrk+1
	cmp	sektrk+1
	bne	nmatch
;same disk, same track, same sector?
	lda	sekhst		sekhst = hstsec?
	cmp	hstsec
	bne	nmatch		no
	lda	sekhst+1
	cmp	hstsec+1
	beq	match		skip if match
;proper disk, but not correct sector
nmatch	lda	hstwrt		host written?
	beq	filhst		skip if was
	jsr	writeh		else clear host buff
;may have to fill the host buffer
;so set host parameters
filhst	lda	sekdsk
	sta	hstdsk
	lda	sektrk
	ldy	sektrk+1
	sta	hsttrk
	sty	hsttrk+1
	lda	sekhst
	ldy	sekhst+1
	sta	hstsec
	sty	hstsec+1
	lda	rsflag		need to read?
	beq	noread		no
;read desired physical sector from host
	jsr	hcom		set parameters
	jsr	rdesec		to rom
	sta	erflag		save result
noread	lda	#0		0 to accum
	sta	hstwrt		no pending write
;copy data to or from buffer
match	lda	#0		clear move pointer
	sta	mvepnt
	sta	mvepnt+1
	jsr	tstdbl		get records/sector
	beq	endmve		done if no deblocking
	tax			drop by one
	dex
	txa
	and	seksec		mask sector number
	tax			make a counter
	beq	nooff		done if zero
clcpnt	clc
	lda	mvepnt
	adc	#128
	sta	mvepnt
	lda	mvepnt+1
	adc	#0
	sta	mvepnt+1
	dex
	bne	clcpnt		loop if more
;mvepnt has relative host buffer address
nooff	clc			add hstbuf
	lda	#<hstbuf
	adc	mvepnt
	sta	mvepnt
	lda	#>hstbuf
	adc	mvepnt+1
	sta	mvepnt+1
;at this point mvepnt contains the address of the
;sector of interest in the hstbuf buffer.
	ldy	#127		length of move - 1
	ldx	readop		which way?
	bne	rmove		skip if read
;write operation so move from dmaadr to mvepnt
	inx			x <-- 1
	stx	hstwrt		hstwrt <-- 1
wmove	lda	(dmaadr),y
	sta	(mvepnt),y
	dey
	bpl	wmove		loop if more
	bmi	endmve		else done
;read operation so move from mvepnt to dmaadr
rmove	lda	(mvepnt),y
	sta	(dmaadr),y
	dey
	bpl	rmove		loop if more
;data has been moved to/from host buffer
endmve	lda	wrtype		write type
	cmp	#wrdir		to directory?
	bne	nodir		done if not
;clear host buffer for directory write
	lda	erflag		get error flag
	bne	nodir		done if errors
	sta	hstwrt		say buffer written
	jsr	writeh
nodir	lda	erflag
	rts	
;writeh performs the physical write to
;the host disk.
writeh	jsr	hcom		setup params
	jsr	wrtsec		to rom
	sta	erflag		save result
	rts
;set parameters for host read/write
hcom	lda	hstdsk		set disk number
	jsr	setdrv
	lda	hsttrk		then track
	ldy	hsttrk+1
	jsr	settrk
	lda	hstsec		then sector
	ldy	hstsec+1
	jsr	setsec
	ldx	hstdsk		get host disk
	jsr	tstdbx		see if deblocking
	beq	ndblh		branch if none
	lda	#<hstbuf	finally address
	ldy	#>hstbuf
	jmp	setbuf
ndblh	lda	dmaadr		send normal address
	ldy	dmaadr+1	for no deblocking
	jmp	setbuf
;set sector number
selsec	sta	seksec		save low and high
	sty	seksec+1
	jmp	setsec		go to rom also
;set buffer address
setdma	sta	dmaadr		store low
	sty	dmaadr+1	and high
	jmp	setbuf		go to rom also
;set track
seltrk	sta	sektrk		save number
	sty	sektrk+1
	jmp	settrk		go to rom also
;disk control blocks
;drive a
dcba	.wor	242		max block number
	.wor	26		sectors per track
	.wor	2		number system tracks
	.byt	0		block size = 1024
	.wor	63		max directory number
	.wor	almpa		address of map for a
	.byt	0		do checksums
	.wor	ckmpa		checksum map
;drive b
dcbb	.wor	242		max block number
	.wor	26		sectors per track
	.wor	2		number system tracks
	.byt	0		block size = 1024
	.wor	63		max directory number
	.wor	almpb		address of map for a
	.byt	0		do checksums
	.wor	ckmpb		checksum map
;drive c (Kaypro IV)
dcbc	.wor	196		max block number
	.wor	40		sectors per track
	.wor	1		number system tracks
	.byt	1		block size = 2048
	.wor	127		max directory number
	.wor	almpc		address of allocation map
	.byt	0		do checksums
	.wor	ckmpc		address of checksum map
;drive d (5 inch 1.2 MB)
dcbd	.wor	595		max block number
	.wor	60		sectors per track
	.wor	1		number system tracks
	.byt	1		block = 2048
	.wor	255		max directory
	.wor	almpd		address of allocation map
	.byt	0		do checksums
	.wor	ckmpd		address of checksum map
;winchester
;drive e
dcbe	.wor	maxblk		max block number
	.wor	spt		sectors per track
	.wor	0		number system tracks
	.byt	blkscd		block size code
	.wor	maxdir		max directory
	.wor	almpe		address of allocation map
	.byt	128		do not do checksums
	.wor	0		phony address
;drive f
dcbf	.wor	maxblk		max block number
	.wor	spt		sectors per track
	.wor	numcyl		number system tracks
	.byt	blkscd		block size code
	.wor	maxdir		max directory
	.wor	almpf		address of allocation map
	.byt	128		do not do checksums
	.wor	0		phony address
;drive g
;kaypro 2
dcbg	.wor	194		max block number
	.wor	40		sectors per track
	.wor	1		one system track
	.byt	0		1024 byte blocks
	.wor	127		128 directory entries
	.wor	almpg		address of allocation map
	.byt	0		do checksums
	.wor	ckmpg		address of checksum map
;data area
sekdsk	.byt	0		seek disk number
hstwrt	.byt	0		0=written,1=pending host write
;allocate the following data areas to unused ram space
savsec	*=	*+1		save sector for warm boot
count	*=	*+1		counter in warm boot
temp	*=	*+1		save hstdsk for warm boot
hstact	*=	*+1		host active flag
unacnt	*=	*+1		unalloc rec cnt
sektrk	*=	*+2		seek track number
seksec	*=	*+2		seek sector number
hstdsk	*=	*+1		host disk number
hsttrk	*=	*+2		host track number
hstsec	*=	*+2		host sector number
sekhst	*=	*+2		seek shr secshf
unadsk	*=	*+1		last unalloc disk
unatrk	*=	*+2		last unalloc track
unasec	*=	*+2		last unalloc sector
erflag	*=	*+1		error reporting
rsflag	*=	*+1		read sector flag
readop	*=	*+1		1 if read operation
wrtype	*=	*+1		write operation type
d65spt	*=	*+2		dos/65 records/track
;allocation maps
;drive a
almpa	*=	*+31
;drive b
almpb	*=	*+31
;drive c
almpc	*=	*+25
;drive d
almpd	*=	*+75
;drive e
almpe	*=	maxblk/8+1+*
;drive f
almpf	*=	maxblk/8+1+*
;drive g
almpg	*=	*+25
;checksum maps
;drive a
ckmpa	*=	*+16
;drive b
ckmpb	*=	*+16
;drive c
ckmpc	*=	*+32
;drive d
ckmpd	*=	*+64
;drive g
ckmpg	*=	*+32
;deblocking buffer for dba
hstbuf	*=	*+512		256 or 512 byte sectors
	.end
