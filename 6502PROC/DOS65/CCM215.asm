
;-------------------------------
;dos/65 console command module
;-------------------------------
;ccm unique definitions
nbuilt	=	7		;number built in commands
;main program
ccm:	cld			;set binary mode
	pha			;save drive number
	jsr	rstdsk		;initialize system
	pla			;restore drive num
	jsr	slctds		;select drive
	lda	sysdef+6	;get line length
	lsr	a		;divide
	lsr	a		;by
	lsr	a		;16
	lsr	a		;for dir
	sta	sixten		;and save
	lda	cnslng		;get buffer length
	bne	mrecmd		;if more handle it
ccmlpe:	ldx	#$ff		;set
	txs			;stack
	cld			;set binary mode
	lda	#17		; SEND A XON
	jsr	chrout		; ----------
	jsr	hdrout		;send header
	lda	#'>'		;then print
	jsr	chrout		;prompt
	lda	cnsbvc		;point to start
	ldy	cnsbvc+1	;of buffer
	jsr	rdebuf		;do buffer read
	ldy	#0		;clear index
	ldx	cnslng		;get length
	beq	ccmlpe		;loop if empty
lwrupr:	lda	cnstxt,y	;else get char
	cmp	#'a'		;if less than a
	bcc	nxtchg		;skip convert
	cmp	#'z'+1		;if over z
	bcs	nxtchg		;skip convert
	and	#%01011111	;else convert
	sta	cnstxt,y	;put back in buffer
nxtchg:	iny			;bump index
	dex			;count down
	bne	lwrupr		;loop if more
	txa			;set a to zero
	sta	cnstxt,y	;insert stopper
	sta	cnbfpt		;initialize pointer
mrecmd:	jsr	stdflb		;set default buffer
	jsr	intdsk		;get drive number
	sta	dfldsk		;store as default
	jsr	prslin		;parse command
	bne	cmderr		;error if afn
	lda	tmpdsk		;get temporary
	beq	nodrch		;if zero ok
	lda	#nbuilt*3	;else set and
	bne	dotrns		;do transient
nodrch:	lda	#0		;clear
	tax			;table index
	sta	ccmcount		;and count
tsnxfn:	ldy	#1		;set fcb index
tsnxch:	lda	fnctbl,x	;get table entry
	beq	gotcmd		;if zero got it
	cmp	fcbone,y	;else test
	bne	nocmpr		;no good if not =
	inx			;bump
	iny			;pointers
	bne	tsnxch		;and loop
nocmpr:	inx			;go to end
	lda	fnctbl,x	;of table
	bne	nocmpr		;entry
	inx			;point to next
	inc	ccmcount		;bump count
	lda	ccmcount		;and if not
	cmp	#nbuilt		;limit then
	bne	tsnxfn		;try next
gotcmd:	lda	ccmcount		;get count
	asl	a		;multiply by two
	adc	ccmcount		;then add for x3
dotrns:	tax			;use as index
	inx			;bump to pass jmp
	lda	xqfntb,x	;to get
	ldy	xqfntb+1,x	;entry address
	sta	vector		;then set
	sty	vector+1	;vector
	lda	extcvc+1	;save
	pha			;return
	lda	extcvc		;address
	pha			;on stack
	jmp	(vector)	;execute
extcmd:	jsr	rstddr		;restore default
extwod:	jsr	prslin		;parse more
	lda	fcbone+1	;if first
	sec			;character
	sbc	#' '		;not a space
	ora	tmpdsk		;or if temporary
	bne	cmderr		;then an error
	jmp	ccmlpe		;else loop
;command error syntax handler
cmderr:	jsr	ccrlf		;do a cr lf
	ldy	curpnt		;get command pointer
cmerlp:	lda	cnstxt,y	;get char
	beq	cmerex		;if null then done
	cmp	#' '		;if space
	beq	cmerex		;then done
	jsr	cotsxy		;output with save
	iny			;point to next
	bne	cmerlp		;and loop
cmerex:	lda	#'?'		;send a
	jsr	chrout		;question mark
	jmp	ccmlpe		;and start over
;execute dir command
; dir <afn>
dir:	jsr	prslin		;find object file
	jsr	clrslt		;clear auto and select
	lda	#' '		;if name
	cmp	fcbone+1	;and
	bne	findfr		;type are
	cmp	fcbone+9	;not empty
	bne	findfr		;then use it
	lda	#'?'		;else
	ldy	#11		;fill
fillqu:	sta	fcbone,y	;fcb
	dey			;with
	bne	fillqu		;question marks
findfr:	jsr	srchf1		;search for first match
	bmi	notfnd		;error if none
fnddir:	lda	sixten		;set across
	sta	across		;to four
	jsr	ccrlf		;do a crlf
dirl:	jsr	hdr		;do header
	lda	#':'		;then a
	jsr	chrout		;colon
	lda	diradd		;get number
	asl	a		;and
	asl	a		;multiply
	asl	a		;by
	asl	a		;thirty two
	asl	a		;then
	and	#%01100000	;mask out insignificant
	tay			;make a pointer
	iny			;and bump
	ldx	#1		;set counter
nmelpe:	lda	dflbuf,y	;get name
	jsr	cotsxy		;else send to console
noname:	iny			;bump index
	inx			;and count
	cpx	#12		;if count is 12
	beq	endnme		;then done
	cpx	#9		;or if not 9
	bne	nmelpe		;then loop
	lda	#'.'		;else send
	jsr	cotsxy		;a period
	jmp	nmelpe		;and loop
endnme:	jsr	chkcst		;check console status
	bne	extdir		;if key down quit
	jsr	setone		;else point to fcb
	jsr	srchnx		;else search for next
	sta	diradd		;save number
	bmi	extdir		;quit if not found
	dec	across		;drop count
	beq	fnddir		;new line if 0
	jsr	spcout		;send
	jsr	spcout		;two spaces
	jmp	dirl		;and stay
extdir:	rts			;else done
;not found error handler
notfnd:	ldy	#ntfnms		;point to message
	jmp	sndmsg		;send and exit
;execute ren command
; ren <ufn> <ufn>
;where first ufn is from name and second is to name
ren:	jsr	prslin		;get old name
	bne	renerr		;error if afn
	jsr	tmpold		;save drive
	jsr	clrslt		;clear auto and select
	jsr	srchf1		;if file does not exist
	bmi	fntfnd		;then an error
	jsr	frssec		;move name to second half
	ldy	cnbfpt		;get pointer
	lda	cnstxt,y	;and then char
	cmp	#' '		;if not a space
	bne	rensyn		;then error
	jsr	prslin		;get new name
	bne	rensyn		;error if afn
	lda	tmpdsk		;get new drive
	beq	nonwdr		;if zero ok
	cmp	oldtmp		;compare to old
	beq	nonwdr		;ok if same
	sec			;drop for default check
	sbc	#1
	cmp	dfldsk		;if not default
	bne	rensyn		;is error
	lda	oldtmp		;and then if from not
	bne	rensyn		;default is error
nonwdr:	lda	oldtmp		;else get old
	sta	tmpdsk		;and save
	lda	#0		;clear
	sta	fcbone+16
	jsr	clrslt		;reselect
	jsr	srchf1		;search for old
	bpl	filexs		;error if found
	jsr	frssec		;swap names
	jsr	setone		;point to fcb
	jmp	renmfl		;and do it
;ren file exists error handler
filexs:	ldy	#flexms		;point to
	bne	remsg		;and send
;ren syntax error handler
rensyn:	jsr	rstddr		;restore default
renerr:	jmp	cmderr		;do error
;ren source file not found error handler
fntfnd:	ldy	#ntfnms		;point to
remsg:	jmp	sndmsg		;and send
;execute save command
; save <length> <drive:>ufn (<address>)
save:	lda	#<tea		;set start address to tea start
	ldy	#>tea
	sta	sadr
	sty	sadr+1
	jsr	bldnum		;calculate length
	bne	saverr		;error if > 255 pages
	sta	length		;else save low
	ora	length		;test for zero length
	beq	saverr		;error if is
	jsr	prslin		;get file name
	bne	saverr		;error if afn
	jsr	frssec		;move name to second half
	jsr	tmpold		;save drive
	jsr	bldnum		;it is so find value
	ldx	fcbone+1	;see if there
	cpx	#' '
	beq	nosadr		;it is not
	sta	sadr		;and set address
	sty	sadr+1
	cpy	#2		;make sure is high enough
	bcc	saverr		;error if not
nosadr:	jsr	secfrs		;move name back
	jsr	clrslt		;clear auto and select
	jsr	dlt1		;delete
	jsr	setone		;then create
	jsr	cratfl		;new file
	bmi	noroom		;say no room if error
	jsr	open1		;open file
	bmi	noopen		;if error
	clc			;now find end page
	lda	sadr+1
	adc	length
	sta	length
	lda	sadr		;get start address
	ldy	sadr+1
wrtmre:	sta	dskbuf		;set
	sty	dskbuf+1	;buffer
	jsr	mv128		;move data to buffer
	jsr	setone		;point to fcb
	jsr	wrrcrd		;write record
	bne	wrterr		;exit if error
	clc			;else
	lda	dskbuf		;get old
	ldy	dskbuf+1	;buffer
	adc	#128		;add 128
	bcc	donotc		;if carry
	iny			;bump upper
	beq	clssav		;done if page zero
donotc:	cpy	length		;loop if upper
	bne	wrtmre		;not at limit
clssav:	jsr	setone		;else point to
	jsr	clsefl		;and close file
	bmi	cantcl		;say so if error
extera:	rts
;save error handler
saverr:	jmp	cmderr		;do error
;save no room error handler
noroom:	ldy	#nospms		;point to
	bne	semsg		;and send
;save can not open error handler
noopen:	ldy	#cnnoms		;point to
	bne	semsg		;and send
;save write error handler
wrterr:	ldy	#wrerms		;point
	bne	semsg		;to and send
;save can not close error
cantcl:	ldy	#ntclms		;point to
semsg:	jmp	sndmsg		;and send
;execute era command
; era <afn>
era:	jsr	prslin		;get file name
	cmp	#11		;if not all ?
	bne	nteral		;then skip verify
	ldy	#alflms		;else point to
	jsr	sndmsg		;and send all files
	jsr	cnsrde		;get an input
	pha			;and save
	jsr	ccrlf		;do a cr lf
	pla			;restore char
	and	#$5f		;convert to upper case
	cmp	#'Y'		;if not y
	bne	extera		;then quit
nteral:	jsr	clrslt		;clear auto and select
	jmp	dlt1		;delete first
;execute type command
; type d:ufn
type:	jsr	prslin		;get file
	bne	typafn		;error if afn
	jsr	casdo1		;clear - select - open file 1
	bmi	notype		;error if not found
	jsr	ccrlf		;else do cr lf
typmre:	jsr	read1		;read record
	beq	okread		;if ok continue
	bpl	exttyp		;exit if just end
	bmi	typerr		;else error
okread:	ldx	#0		;clear index
typlpe:	lda	dflbuf,x	;get char
	cmp	#eof		;if eof
	beq	exttyp		;then exit
	jsr	cotsxy		;else send
	jsr	chkcst		;if key down
	bne	exttok		;then exit
	ldx	savx		;else get index
	inx			;bump it
	bpl	typlpe		;and loop if < 128
	bmi	typmre		;else read more
exttok:	ldx	#6		;clear console
	jsr	pemjmp		;with no echo
exttyp:	rts
;type syntax error handler
typafn:	jmp	cmderr		;error return
;type read error handler
typerr:	ldy	#rderms		;point to
	bne	temsg		;and send
;type not found error handler
notype:	ldy	#ntfnms		;point to
temsg:	jmp	sndmsg		;and send
;execute load command
; load <ufn> (<address>)
load:	jsr	setddb		;set load start to tea start
	jsr	prslin		;build fcb
	bne	typafn		;error if afn
	jsr	frssec		;save in second half
	jsr	tmpold		;save file
	jsr	bldnum		;find start address
	ldx	fcbone+1	;see if number
	cpx	#' '
	beq	usedfl		;if none use default
	jsr	setdb		;and set
usedfl:	jsr	secfrs		;move name back
	jsr	casdo1		;clear - select - open file 1
	bmi	notype		;exit if not found
	lda	dskbuf		;get load start
	ldy	dskbuf+1
lcmdlp:	jsr	setbuf		;set as disk buffer
	jsr	read1		;read record
	bne	loadnd		;done if not zero
	jsr	adjdb		;bump address
	jmp	lcmdlp		;and loop
loadnd:	bmi	typerr		;if error say so
	jmp	stdflb		;back to default buffer
;execute go command
; go (<address>)
go:	jsr	bldnum		;get address
	ldx	fcbone+1	;get first char
	cpx	#' '		;see if nothing
	beq	nolnum		;nothing so use tea
	jmp	godoit		;then execute
nolnum:	jmp	gotea
;execute trns (transient) command
; <ufn> (<fn>) (<fn>)
trns:	lda	fcbone+1	;get first char
	cmp	#' '		;if not space
	bne	chktyp		;check type
	lda	tmpdsk		;else test temp
	beq	skpdrv		;if none skip
	sec			;else convert
	sbc	#1		;to number
	sta	dfldsk		;set default
	jsr	slctds		;and select
skpdrv:	jmp	extwod		;return
chktyp:	lda	fcbone+9	;get type
	cmp	#' '		;if space
	beq	typemp		;then ok
	jmp	trnerr		;else error
typemp:	ldx	#2		;make
setcom:	lda	typcom,x	;type
	sta	fcbone+9,x	;com
	dex			;then
	bpl	setcom		;continue
	jsr	casdo1		;clear - select - open file one
	bpl	gottrn		;jump if ok
	jmp	topner		;else do error
gottrn:	jsr	setddb		;set start to tea
nxtrcr:	jsr	setbuf		;set address
	jsr	read1		;read fcb 1
	bne	endlde		;branch if error or eof
	jsr	adjdb		;adjust address up by 128
	cmp	ccmvc		;if new low
	bcc	tryhig		;ok try high
	cpy	ccmvc+1		;else if high
	bcc	nxtrcr		;ok do more
	bcs	chklnd		;else check for end
tryhig:	cpy	ccmvc+1		;if high less
	bcc	nxtrcr		;then ok
	beq	nxtrcr		;or ok if same
chklnd:	jsr	stdflb		;set buffer to default
	jsr	read1		;read (should be eof)
	beq	tlderr		;error if more
endlde:	bmi	tlderr		;do error
gotea:	lda	#<tea		;set go address to tea start
	ldy	#>tea
godoit:	sta	do+1		;set to ay
	sty	do+2
	jsr	rstddr		;else restore default
	jsr	prslin		;parse file
	lda	tmpdsk		;set auto
	sta	fcbone		;select position
	ldx	#16		;do a second
	jsr	prsmre		;fcb if there
	lda	tmpdsk		;set auto select
	sta	fcbone+16	;again
	ldy	#0		;clear record
	sty	fcbone+32	;counter
	ldx	#32		;move
movfcb:	lda	fcbone,x	;all
	sta	dflfcb,x	;to
	dex			;default
	bpl	movfcb		;fcb
	inx			;set x to zero
tstbuf:	lda	cnstxt,y	;get char
	beq	isnull		;if null jump
	cmp	#' '		;or if space
	beq	isnull		;jump
	iny			;else bump pointer
	bne	tstbuf		;and loop
isnull:	lda	#0		;clear
	sta	dflbuf		;count
movbuf:	lda	cnstxt,y	;get char
	sta	dflbuf+1,x	;and move
	beq	fillov		;exit if null
	inx			;increment
	iny			;counters
	inc	dflbuf		;and length
	bne	movbuf		;and loop
fillov:	jsr	ccrlf		;do a cr lf
	jsr	stdflb		;set default
do:	jsr	tea		;execute
	lda	dfldsk		;get default
	jsr	slctds		;and set
	jmp	ccmlpe		;then loop
;trns syntax error handler
topner:	jsr	rstddr		;restore default
trnerr:	jmp	cmderr		;do error
;trns load error
tlderr:	ldy	#lderms		;point to
	jmp	sndmsg		;and send
;carriage return and linefeed
ccrlf:	lda	#cr		;get a cr
	jsr	chrout		;send
	lda	#lf		;get a lf
	bne	chrout		;and send
;pem entry routines
cnsrde:	ldx	#1		;console read
	bne	pemgo
spcout:	lda	#' '		;output space
chrout:	ldx	#2		;console output
	bne	pemgo
rdebuf:	ldx	#10		;buffered input
	bne	pemgo
chkcst:	ldx	#11		;check console
	bne	pemgo
rstdsk:	ldx	#13		;initialize system
	bne	pemgo
slctds:	ldx	#14		;select drive
	bne	pemgo
openfl:	ldx	#15		;open file
	bne	pemgo
clsefl:	ldx	#16		;close file
	bne	pemgo
srchfr:	ldx	#17		;first match
	bne	pemgo
srchnx:	ldx	#18		;next match
	bne	pemgo
;delete file one
dlt1:	jsr	setone		;point to fcb
dltfil:	ldx	#19		;delete file
	bne	pemgo
rdrcrd:	ldx	#20		;read record
	bne	pemgo
wrrcrd:	ldx	#21		;write record
	bne	pemgo
cratfl:	ldx	#22		;create file
	bne	pemgo
renmfl:	ldx	#23		;rename file
	bne	pemgo
intdsk:	ldx	#25		;read drive num
	bne	pemgo
setbuf:	ldx	#26		;set buffer add
pemgo:	jmp	pemjmp		;go to pem
;restore default drive
rstddr:	lda	tmpdsk		;if temp drive
	beq	extddr		;zero then exit
	sec			;else
	sbc	#1		;subtract one
	cmp	dfldsk		;compare to default
	beq	extddr		;exit if same
seldfl:	lda	dfldsk		;else get default
	jmp	slctds		;select
;clear auto - select disk - open file at fcbone
casdo1:	jsr	clrslt		;clear auto and select
;open file one
; returns:n=1 if not found
open1:	lda	#0		;clear
	sta	fcbone+32	;record number
	jsr	setone		;point to fcb
	jsr	openfl		;open it
	sta	diradd		;save number
extddr:	rts
;read file one
read1:	jsr	setone		;point to fcb
	jmp	rdrcrd		;do read
;search for first file one
; returns:n=1 if not found
srchf1:	jsr	setone		;point to fcb
	jsr	srchfr		;search for first
	sta	diradd		;save number
	rts
;header output
hdrout:	jsr	ccrlf		;do cr lf
hdr:	jsr	intdsk		;get drive number
	clc			;make
	adc	#'A'		;a letter
;output with save of x and y
;this routine calls the pem resident routine
;tstchr to see if a char is a printing char.
;if it is then c=1 upon return from tstchr.
cotsxy:	stx	savx		;save x
	sty	savy		;and y
	jsr	tstchr		;see if printing
	bcs	isprnt		;jump if is
	pha			;else save
	lda	sysdef+4	;get invert
	jsr	chrout		;send it
	pla			;get char
	ora	#'@'		;make printing
	jsr	chrout		;send it
	lda	sysdef+3	;get normal
isprnt:	jsr	chrout		;do output
	ldy	savy		;get y
	ldx	savx		;and x
	rts
;set up fcb one pointer
setone:	lda	fcb1vc		;low
	ldy	fcb1vc+1	;and high
	rts
;save tmpdsk in oldtmp
tmpold:	lda	tmpdsk
	sta	oldtmp
	rts
;parse command line
prslin:	ldx	#0		;clear index
prsmre:	txa			;save
	pha			;index
	lda	#0		;clear temp
	sta	tmpdsk		;drive flag
	ldy	cnbfpt		;get buffer pointer
	jsr	skpspc		;find first non-space
	sty	curpnt		;save index
	beq	nulchr		;jump if null
	and	#%00001111	;else look at 4 lsbs
	pha			;and save
	iny			;point to next char
	lda	cnstxt,y	;and get it
	cmp	#':'		;if a colon
	beq	drvinp		;jump and set drive
	pla			;else clear stack
	dey			;backup index
nulchr:	lda	dfldsk		;set automatic
	sta	fcbone,x	;to default
	bpl	trynme		;then parse name
drvinp:	pla			;get number
	sta	tmpdsk		;set temp flag
	sta	fcbone,x	;and fcb
	iny			;point past colon
trynme:	lda	#8		;set name count
	sta	ccmcount		;to eight
tstnme:	jsr	tstlgl		;test for illegal
	beq	flnmsp		;if illegal jump
	inx			;bump pointer
	cmp	#'*'		;if not *
	bne	notafn		;skip ? fill
	lda	#'?'		;get a ?
	sta	fcbone,x	;store
	bne	nxtout		;and jump
notafn:	sta	fcbone,x	;store char
	iny			;bump source
nxtout:	dec	ccmcount		;drop counter down
	bne	tstnme		;and loop
skpmre:	jsr	tstlgl		;if illegal
	beq	trytyp		;try type
	iny			;else bump index
	bne	skpmre		;and loop
flnmsp:	inx			;next position
	lda	#' '		;get a space
	sta	fcbone,x	;store
	dec	ccmcount		;count down
	bne	flnmsp		;and loop
	lda	cnstxt,y	;get char again
trytyp:	pha			;save char
	lda	#3		;set count
	sta	ccmcount		;to three
	pla			;get char
	cmp	#'.'		;if not .
	bne	fltysp		;then fill spaces
	iny			;else bump source
tsttyp:	jsr	tstlgl		;if not legal
	beq	fltysp		;then fill spaces
	inx			;else bump index
	cmp	#'*'		;if not *
	bne	notaft		;then skip fill
	lda	#'?'		;else get ?
	sta	fcbone,x	;move to fcb
	bne	mrtyfl		;and loop
notaft:	sta	fcbone,x	;move char to fcb
	iny			;bump source
mrtyfl:	dec	ccmcount		;count down
	bne	tsttyp		;and loop
nttype:	jsr	tstlgl		;if illegal
	beq	filnul		;fill out nulls
	iny			;else bump source
	bne	nttype		;and loop
fltysp:	inx			;bump fcb pointer
	lda	#' '		;get space
	sta	fcbone,x	;put in fcb
	dec	ccmcount		;count down
	bne	fltysp		;and continue
filnul:	lda	#3		;clear
	sta	ccmcount		;three
mrnlty:	inx			;bump fcb pointer
	lda	#0		;get a zero
	sta	fcbone,x	;move to fcb
	dec	ccmcount		;count down
	bne	mrnlty		;loop until done
	sty	cnbfpt		;update start pointer
	lda	#0		;clear
	sta	ccmcount		;count
	pla			;restore stack
	tay			;move to index
	ldx	#11		;counter to 11
tstqus:	iny			;point to
	lda	fcbone,y	;and get char
	cmp	#'?'		;if not a ?
	bne	nxtqus		;then jump
	inc	ccmcount		;else bump count
nxtqus:	dex			;loop until
	bne	tstqus		;11 tested
	lda	ccmcount		;get count
	rts			;and return
;skip space
skpspc:	lda	cnstxt,y	;get char
	beq	extskp		;jump if null
	cmp	#' '		;if not space
	bne	extskp		;then exit
	iny			;else go to next
	bne	skpspc		;and test
extskp:	rts
;test legal
tstlgl:	lda	cnstxt,y	;get char
	beq	extlgl
	cmp	#' '		;if space
	bcc	badinp		;ok - less is error
	beq	extlgl
	cmp	#'='
	beq	extlgl
	cmp	#'.'
	beq	extlgl
	cmp	#':'
	beq	extlgl
	cmp	#semico
	beq	extlgl
	cmp	#'<'
	beq	extlgl
	cmp	#'>'
extlgl:	rts
badinp:	jmp	cmderr
;set default buffer address
stdflb:	lda	#<dflbuf 	;point to
	ldy	#>dflbuf	;location
	jmp	setbuf		;and set
;clear automatic and select
clrslt:	lda	#0		;clear auto
	sta	fcbone		;select
slttmp:	lda	tmpdsk		;get temp
	beq	extsnd		;if zero exit
	sec			;else subtract
	sbc	#1		;one
	cmp	dfldsk		;if same as default
	beq	extsnd		;then quit
	jmp	slctds		;else set
;send message
sndmsg:	sty	savy		;save index
	jsr	ccrlf		;do cr and lf
	ldy	savy		;get index
lpesnd:	lda	msgtbl,y	;get char
	beq	extsnd		;if null quit
	jsr	cotsxy		;else send
	iny			;point to next
	bne	lpesnd		;and loop
extsnd:	rts
;set load start address
setddb:	lda	#<tea		;to tea start
	ldy	#>tea
setdb:	sta	dskbuf		;to ay
	sty	dskbuf+1
	rts
;move first part of fcb to second half
;and move second part to first part.
;only ren depends upon this routine to actually
;swap fcb halves.
;alters:a,x,p
;returns:x=$ff
frssec:	ldx	#15		;set index to last
frsclp:	lda	fcbone,x	;get byte
	ldy	fcbone+16,x
	sta	fcbone+16,x	;move it
	tya
	sta	fcbone,x
	dex
	bpl	frsclp		;until 16 moved
	rts
;move second part of fcb to first half
;restore tmpdsk from save location
;alters:a,x,p
;returns:x=$ff
secfrs:	ldx	#15		;set index to last
scfrlp:	lda	fcbone+16,x	;get byte
	sta	fcbone,x	;move it
	dex
	bpl	scfrlp		;loop until done
	lda	oldtmp		;get old flag
	sta	tmpdsk		;and set
	rts
;build a number from command line and leave in num
;will handle either decimal (e.g., 578) or hexadecimal (e.g., $3f2)
;move parse index past number
;modifies:all
;returns:a,y set to low and high of number
;	 flags set according to y which is high part of number
bldnum:	lda	#9		;preset to decimal
	sta	moduls
	jsr	prslin		;put in fcb
	lda	tmpdsk		;if temp
	bne	numerr		;is error
	sta	num		;else clear num
	sta	num+1
	tay			;and index
	lda	fcbone+1,y	;get first char
	cmp	#'$'		;see if hex signal
	bne	bnumlp		;skip if not
	lda	#15		;set for modulus
	sta	moduls
	iny			;bump past $
bnumlp:	iny			;next char
	lda	fcbone,y	;get digit
	cmp	#' '		;see if space
	beq	endnlp		;done if is
	jsr	tstdec		;see if decimal
	bcc	usedig		;use if is
	jsr	tsthex		;see if hex
	bcs	numerr		;error if not
	sbc	#6		;remove offset
	ldx	#15		;test for hex modulus
	cpx	moduls
	bne	numerr		;error if not
usedig:	and	#%00001111	;eliminate ascii bias
	pha			;save result
	lda	num		;move number to temp
	sta	tnum
	lda	num+1
	sta	tnum+1
	ldx	moduls		;get modulus
	clc
addlpe:	lda	num		;add number to itself
	adc	tnum
	sta	num
	lda	num+1		;modulus times
	adc	tnum+1
	sta	num+1
	bcs	numerr		;error if carry out
	dex
	bne	addlpe		;loop if more
	pla			;get input back
	adc	num		;add in
	sta	num
	bcc	bnumlp		;loop if no carry
	inc	num+1		;else bump high
	bne	bnumlp		;and loop for more
;error in bldnum - handle and quit
numerr:	jmp	cmderr		;do general error
;end of use of name part - check type
endnlp:	lda	fcbone+9	;get first
	cmp	#' '		;see if space
	bne	numerr		;error if not
	lda	num		;return with result
	ldy	num+1
	rts
;relocatable vectors
	.byte	$4c
cnsbvc:	.word	cnsbuf
	.byte	$4c
extcvc:	.word	extcmd-1
	.byte	$4c
ccmvc:	.word	ccm
	.byte	$4c
fcb1vc:	.word	fcbone
;function entry vector
xqfntb:	jmp	dir
	jmp	save
	jmp	era
	jmp	type
	jmp	ren
	jmp	go
	jmp	load
	jmp	trns
;terminator for relocation
	.byte	$ff
;messages
msgtbl:
	.byte 0
nospms	=	*-msgtbl
	.byte	"NO SPACE",0
ntclms	=	*-msgtbl
	.byte "CAN NOT CLOSE",0
alflms	=	*-msgtbl
	.byte "ALL FILES (Y/N)?",0
rderms	=	*-msgtbl
	.byte	"READ ERROR",0
ntfnms	=	*-msgtbl
	.byte	"NOT FOUND",0
flexms	=	*-msgtbl
	.byte "FILE EXISTS",0
lderms	=	*-msgtbl
	.byte "LOAD ERROR",0
cnnoms	=	*-msgtbl
	.byte "CAN NOT OPEN",0
wrerms	=	*-msgtbl
	.byte "WRITE ERROR",0
;function name table
fnctbl:	.byte	"DIR ",0
	.byte	"SAVE ",0
	.byte	"ERA ",0
	.byte	"TYPE ",0
	.byte	"REN ",0
	.byte	"GO ",0
	.byte	"LOAD ",0
;input buffer
cnsbuf:
cnsmax: .byte 127
cnslng: .byte 0
cnstxt:
	.res 127
;fcb one
fcbone:
	.res 33
;com type field
typcom:	.byte	"COM"
;variable storage
cnbfpt:	.byte	0		;buffer index
dfldsk:	.byte	0		;default drive
tmpdsk:	.byte	0		;temporary dvive
;align vector on word boundary
	.align 2
vector:	.word	0		;execution vector
ccmcount:	.byte	0		;counter
curpnt:	.byte	0		;input parse start
diradd:	.byte	0		;directory number
savx:	.byte	0		;save x location
savy:	.byte	0		;save y location
length:	.byte	0		;number tages to save
oldtmp:	.byte	0		;temp drive in ren
dskbuf:	.word	tea		;disk buffer start
across:	.byte	0		;dir count on line
sixten:	.byte	0		;line length div 16
moduls:	.byte	9		;modulus-1 for number input
num:	.word	0		;input number
tnum:	.word	0		;temp in bldnum
sadr:	.word	tea		;save start address
