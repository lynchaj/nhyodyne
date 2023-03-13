;________________________________________________________________________________________________________________________________
;
;	Nhyodyne dos/65 dos/65 console command module (ccm)
;
;  DWERNER 12/20/2021 	ported to Nhyodyne
;  DWERNER 12/30/2021   changed .COM files to .CO6 files to reduce confusion when
;                       sharing CP/M file system images
;  DWERNER 02/19/2022   Strip off Most significant bit of file name in dir to
;			make filesystem compatible with ROMWBW
;________________________________________________________________________________________________________________________________

;ccm unique definitions
nbuilt          = 7             ;number built in commands
;main program
; warm boot vector
        JMP     boot
ccm:
        CLD                     ;set binary mode
        PHA                     ;save drive number
        JSR     rstdsk          ;initialize system
        PLA                     ;restore drive num
        JSR     slctds          ;select drive
        LDA     sysdef+6        ;get line length
        LSR     a               ;divide
        LSR     a               ;by
        LSR     a               ;16
        LSR     a               ;for dir
        STA     sixten          ;and save
        LDA     cnslng          ;get buffer length
        BNE     mrecmd          ;if more handle it
ccmlpe:
        LDX     #$ff            ;set
        TXS                     ;stack
        CLD                     ;set binary mode
        LDA     #17             ; SEND A XON
        JSR     chrout          ; ----------
        JSR     hdrout          ;send header
        LDA     #'>'            ;then print
        JSR     chrout          ;prompt
        LDA     cnsbvc          ;point to start
        LDY     cnsbvc+1        ;of buffer
        JSR     rdebuf          ;do buffer read
        LDY     #0              ;clear index
        LDX     cnslng          ;get length
        BEQ     ccmlpe          ;loop if empty
lwrupr:
        LDA     cnstxt,y        ;else get char
        CMP     #'a'            ;if less than a
        BCC     nxtchg          ;skip convert
        CMP     #'z'+1          ;if over z
        BCS     nxtchg          ;skip convert
        AND     #%01011111      ;else convert
        STA     cnstxt,y        ;put back in buffer
nxtchg:
        INY                     ;bump index
        DEX                     ;count down
        BNE     lwrupr          ;loop if more
        TXA                     ;set a to zero
        STA     cnstxt,y        ;insert stopper
        STA     cnbfpt          ;initialize pointer
mrecmd:
        JSR     stdflb          ;set default buffer
        JSR     intdsk          ;get drive number
        STA     dfldsk          ;store as default
        JSR     prslin          ;parse command
        BNE     cmderr          ;error if afn
        LDA     tmpdsk          ;get temporary
        BEQ     nodrch          ;if zero ok
        LDA     #nbuilt*3       ;else set and
        BNE     dotrns          ;do transient
nodrch:
        LDA     #0              ;clear
        TAX                     ;table index
        STA     ccmcount        ;and count
tsnxfn:
        LDY     #1              ;set fcb index
tsnxch:
        LDA     fnctbl,x        ;get table entry
        BEQ     gotcmd          ;if zero got it
        CMP     fcbone,y        ;else test
        BNE     nocmpr          ;no good if not =
        INX                     ;bump
        INY                     ;pointers
        BNE     tsnxch          ;and loop
nocmpr:
        INX                     ;go to end
        LDA     fnctbl,x        ;of table
        BNE     nocmpr          ;entry
        INX                     ;point to next
        INC     ccmcount        ;bump count
        LDA     ccmcount        ;and if not
        CMP     #nbuilt         ;limit then
        BNE     tsnxfn          ;try next
gotcmd:
        LDA     ccmcount        ;get count
        ASL     a               ;multiply by two
        ADC     ccmcount        ;then add for x3
dotrns:
        TAX                     ;use as index
        INX                     ;bump to pass jmp
        LDA     xqfntb,x        ;to get
        LDY     xqfntb+1,x      ;entry address
        STA     vector          ;then set
        STY     vector+1        ;vector
        LDA     extcvc+1        ;save
        PHA                     ;return
        LDA     extcvc          ;address
        PHA                     ;on stack
        JMP     (vector)        ;execute
extcmd:
        JSR     rstddr          ;restore default
extwod:
        JSR     prslin          ;parse more
        LDA     fcbone+1        ;if first
        SEC                     ;character
        SBC     #' '            ;not a space
        ORA     tmpdsk          ;or if temporary
        BNE     cmderr          ;then an error
        JMP     ccmlpe          ;else loop
;command error syntax handler
cmderr:
        JSR     ccrlf           ;do a cr lf
        LDY     curpnt          ;get command pointer
cmerlp:
        LDA     cnstxt,y        ;get char
        BEQ     cmerex          ;if null then done
        CMP     #' '            ;if space
        BEQ     cmerex          ;then done
        JSR     cotsxy          ;output with save
        INY                     ;point to next
        BNE     cmerlp          ;and loop
cmerex:
        LDA     #'?'            ;send a
        JSR     chrout          ;question mark
        JMP     ccmlpe          ;and start over
;execute dir command
; dir <afn>
dir:
        JSR     prslin          ;find object file
        JSR     clrslt          ;clear auto and select
        LDA     #' '            ;if name
        CMP     fcbone+1        ;and
        BNE     findfr          ;type are
        CMP     fcbone+9        ;not empty
        BNE     findfr          ;then use it
        LDA     #'?'            ;else
        LDY     #11             ;fill
fillqu:
        STA     fcbone,y        ;fcb
        DEY                     ;with
        BNE     fillqu          ;question marks
findfr:
        JSR     srchf1          ;search for first match
        BMI     notfnd          ;error if none
fnddir:
        LDA     sixten          ;set across
        STA     across          ;to four
        JSR     ccrlf           ;do a crlf
dirl:
        JSR     hdr             ;do header
        LDA     #':'            ;then a
        JSR     chrout          ;colon
        LDA     diradd          ;get number
        ASL     a               ;and
        ASL     a               ;multiply
        ASL     a               ;by
        ASL     a               ;thirty two
        ASL     a               ;then
        AND     #%01100000      ;mask out insignificant
        TAY                     ;make a pointer
        INY                     ;and bump
        LDX     #1              ;set counter
nmelpe:
        LDA     dflbuf,y        ;get name
        AND     #$7F            ;mask out read only bit
        JSR     cotsxy          ;else send to console
noname:
        INY                     ;bump index
        INX                     ;and count
        CPX     #12             ;if count is 12
        BEQ     endnme          ;then done
        CPX     #9              ;or if not 9
        BNE     nmelpe          ;then loop
        LDA     #'.'            ;else send
        JSR     cotsxy          ;a period
        JMP     nmelpe          ;and loop
endnme:
        JSR     chkcst          ;check console status
        BNE     extdir          ;if key down quit
        JSR     setone          ;else point to fcb
        JSR     srchnx          ;else search for next
        STA     diradd          ;save number
        BMI     extdir          ;quit if not found
        DEC     across          ;drop count
        BEQ     fnddir          ;new line if 0
        JSR     spcout          ;send
        JSR     spcout          ;two spaces
        JMP     dirl            ;and stay
extdir:
        RTS                     ;else done
;not found error handler
notfnd:
        LDY     #ntfnms         ;point to message
        JMP     sndmsg          ;send and exit
;execute ren command
; ren <ufn> <ufn>
;where first ufn is from name and second is to name
ren:
        JSR     prslin          ;get old name
        BNE     renerr          ;error if afn
        JSR     tmpold          ;save drive
        JSR     clrslt          ;clear auto and select
        JSR     srchf1          ;if file does not exist
        BMI     fntfnd          ;then an error
        JSR     frssec          ;move name to second half
        LDY     cnbfpt          ;get pointer
        LDA     cnstxt,y        ;and then char
        CMP     #' '            ;if not a space
        BNE     rensyn          ;then error
        JSR     prslin          ;get new name
        BNE     rensyn          ;error if afn
        LDA     tmpdsk          ;get new drive
        BEQ     nonwdr          ;if zero ok
        CMP     oldtmp          ;compare to old
        BEQ     nonwdr          ;ok if same
        SEC                     ;drop for default check
        SBC     #1
        CMP     dfldsk          ;if not default
        BNE     rensyn          ;is error
        LDA     oldtmp          ;and then if from not
        BNE     rensyn          ;default is error
nonwdr:
        LDA     oldtmp          ;else get old
        STA     tmpdsk          ;and save
        LDA     #0              ;clear
        STA     fcbone+16
        JSR     clrslt          ;reselect
        JSR     srchf1          ;search for old
        BPL     filexs          ;error if found
        JSR     frssec          ;swap names
        JSR     setone          ;point to fcb
        JMP     renmfl          ;and do it
;ren file exists error handler
filexs:
        LDY     #flexms         ;point to
        BNE     remsg           ;and send
;ren syntax error handler
rensyn:
        JSR     rstddr          ;restore default
renerr:
        JMP     cmderr          ;do error
;ren source file not found error handler
fntfnd:
        LDY     #ntfnms         ;point to
remsg:
        JMP     sndmsg          ;and send
;execute save command
; save <length> <drive:>ufn (<address>)
save:
        LDA     #<tea           ;set start address to tea start
        LDY     #>tea
        STA     sadr
        STY     sadr+1
        JSR     bldnum          ;calculate length
        BNE     saverr          ;error if > 255 pages
        STA     length          ;else save low
        ORA     length          ;test for zero length
        BEQ     saverr          ;error if is
        JSR     prslin          ;get file name
        BNE     saverr          ;error if afn
        JSR     frssec          ;move name to second half
        JSR     tmpold          ;save drive
        JSR     bldnum          ;it is so find value
        LDX     fcbone+1        ;see if there
        CPX     #' '
        BEQ     nosadr          ;it is not
        STA     sadr            ;and set address
        STY     sadr+1
        CPY     #2              ;make sure is high enough
        BCC     saverr          ;error if not
nosadr:
        JSR     secfrs          ;move name back
        JSR     clrslt          ;clear auto and select
        JSR     dlt1            ;delete
        JSR     setone          ;then create
        JSR     cratfl          ;new file
        BMI     noroom          ;say no room if error
        JSR     open1           ;open file
        BMI     noopen          ;if error
        CLC                     ;now find end page
        LDA     sadr+1
        ADC     length
        STA     length
        LDA     sadr            ;get start address
        LDY     sadr+1
wrtmre:
        STA     dskbuf          ;set
        STY     dskbuf+1        ;buffer
        JSR     mv128           ;move data to buffer
        JSR     setone          ;point to fcb
        JSR     wrrcrd          ;write record
        BNE     wrterr          ;exit if error
        CLC                     ;else
        LDA     dskbuf          ;get old
        LDY     dskbuf+1        ;buffer
        ADC     #128            ;add 128
        BCC     donotc          ;if carry
        INY                     ;bump upper
        BEQ     clssav          ;done if page zero
donotc:
        CPY     length          ;loop if upper
        BNE     wrtmre          ;not at limit
clssav:
        JSR     setone          ;else point to
        JSR     clsefl          ;and close file
        BMI     cantcl          ;say so if error
extera:
        RTS
;save error handler
saverr:
        JMP     cmderr          ;do error
;save no room error handler
noroom:
        LDY     #nospms         ;point to
        BNE     semsg           ;and send
;save can not open error handler
noopen:
        LDY     #cnnoms         ;point to
        BNE     semsg           ;and send
;save write error handler
wrterr:
        LDY     #wrerms         ;point
        BNE     semsg           ;to and send
;save can not close error
cantcl:
        LDY     #ntclms         ;point to
semsg:
        JMP     sndmsg          ;and send
;execute era command
; era <afn>
era:
        JSR     prslin          ;get file name
        CMP     #11             ;if not all ?
        BNE     nteral          ;then skip verify
        LDY     #alflms         ;else point to
        JSR     sndmsg          ;and send all files
        JSR     cnsrde          ;get an input
        PHA                     ;and save
        JSR     ccrlf           ;do a cr lf
        PLA                     ;restore char
        AND     #$5f            ;convert to upper case
        CMP     #'Y'            ;if not y
        BNE     extera          ;then quit
nteral:
        JSR     clrslt          ;clear auto and select
        JMP     dlt1            ;delete first
;execute type command
; type d:ufn
type:
        JSR     prslin          ;get file
        BNE     typafn          ;error if afn
        JSR     casdo1          ;clear - select - open file 1
        BMI     notype          ;error if not found
        JSR     ccrlf           ;else do cr lf
typmre:
        JSR     read1           ;read record
        BEQ     okread          ;if ok continue
        BPL     exttyp          ;exit if just end
        BMI     typerr          ;else error
okread:
        LDX     #0              ;clear index
typlpe:
        LDA     dflbuf,x        ;get char
        CMP     #eof            ;if eof
        BEQ     exttyp          ;then exit
        JSR     cotsxy          ;else send
        JSR     chkcst          ;if key down
        BNE     exttok          ;then exit
        LDX     savx            ;else get index
        INX                     ;bump it
        BPL     typlpe          ;and loop if < 128
        BMI     typmre          ;else read more
exttok:
        LDX     #6              ;clear console
        JSR     pemjmp          ;with no echo
exttyp:
        RTS
;type syntax error handler
typafn:
        JMP     cmderr          ;error return
;type read error handler
typerr:
        LDY     #rderms         ;point to
        BNE     temsg           ;and send
;type not found error handler
notype:
        LDY     #ntfnms         ;point to
temsg:
        JMP     sndmsg          ;and send
;execute load command
; load <ufn> (<address>)
load:
        JSR     setddb          ;set load start to tea start
        JSR     prslin          ;build fcb
        BNE     typafn          ;error if afn
        JSR     frssec          ;save in second half
        JSR     tmpold          ;save file
        JSR     bldnum          ;find start address
        LDX     fcbone+1        ;see if number
        CPX     #' '
        BEQ     usedfl          ;if none use default
        JSR     setdb           ;and set
usedfl:
        JSR     secfrs          ;move name back
        JSR     casdo1          ;clear - select - open file 1
        BMI     notype          ;exit if not found
        LDA     dskbuf          ;get load start
        LDY     dskbuf+1
lcmdlp:
        JSR     setbuf          ;set as disk buffer
        JSR     read1           ;read record
        BNE     loadnd          ;done if not zero
        JSR     adjdb           ;bump address
        JMP     lcmdlp          ;and loop
loadnd:
        BMI     typerr          ;if error say so
        JMP     stdflb          ;back to default buffer
;execute go command
; go (<address>)
go:
        JSR     bldnum          ;get address
        LDX     fcbone+1        ;get first char
        CPX     #' '            ;see if nothing
        BEQ     nolnum          ;nothing so use tea
        JMP     godoit          ;then execute
nolnum:
        JMP     gotea
;execute trns (transient) command
; <ufn> (<fn>) (<fn>)
trns:
        LDA     fcbone+1        ;get first char
        CMP     #' '            ;if not space
        BNE     chktyp          ;check type
        LDA     tmpdsk          ;else test temp
        BEQ     skpdrv          ;if none skip
        SEC                     ;else convert
        SBC     #1              ;to number
        STA     dfldsk          ;set default
        JSR     slctds          ;and select
skpdrv:
        JMP     extwod          ;return
chktyp:
        LDA     fcbone+9        ;get type
        CMP     #' '            ;if space
        BEQ     typemp          ;then ok
        JMP     trnerr          ;else error
typemp:
        LDX     #2              ;make
setcom:
        LDA     typcom,x        ;type
        STA     fcbone+9,x      ;com
        DEX                     ;then
        BPL     setcom          ;continue
        JSR     casdo1          ;clear - select - open file one
        BPL     gottrn          ;jump if ok
        JMP     topner          ;else do error
gottrn:
        JSR     setddb          ;set start to tea
nxtrcr:
        JSR     setbuf          ;set address
        JSR     read1           ;read fcb 1
        BNE     endlde          ;branch if error or eof
        JSR     adjdb           ;adjust address up by 128
        CMP     ccmvc           ;if new low
        BCC     tryhig          ;ok try high
        CPY     ccmvc+1         ;else if high
        BCC     nxtrcr          ;ok do more
        BCS     chklnd          ;else check for end
tryhig:
        CPY     ccmvc+1         ;if high less
        BCC     nxtrcr          ;then ok
        BEQ     nxtrcr          ;or ok if same
chklnd:
        JSR     stdflb          ;set buffer to default
        JSR     read1           ;read (should be eof)
        BEQ     tlderr          ;error if more
endlde:
        BMI     tlderr          ;do error
gotea:
        LDA     #<tea           ;set go address to tea start
        LDY     #>tea
godoit:
        STA     do+1            ;set to ay
        STY     do+2
        JSR     rstddr          ;else restore default
        JSR     prslin          ;parse file
        LDA     tmpdsk          ;set auto
        STA     fcbone          ;select position
        LDX     #16             ;do a second
        JSR     prsmre          ;fcb if there
        LDA     tmpdsk          ;set auto select
        STA     fcbone+16       ;again
        LDY     #0              ;clear record
        STY     fcbone+32       ;counter
        LDX     #32             ;move
movfcb:
        LDA     fcbone,x        ;all
        STA     dflfcb,x        ;to
        DEX                     ;default
        BPL     movfcb          ;fcb
        INX                     ;set x to zero
tstbuf:
        LDA     cnstxt,y        ;get char
        BEQ     isnull          ;if null jump
        CMP     #' '            ;or if space
        BEQ     isnull          ;jump
        INY                     ;else bump pointer
        BNE     tstbuf          ;and loop
isnull:
        LDA     #0              ;clear
        STA     dflbuf          ;count
movbuf:
        LDA     cnstxt,y        ;get char
        STA     dflbuf+1,x      ;and move
        BEQ     fillov          ;exit if null
        INX                     ;increment
        INY                     ;counters
        INC     dflbuf          ;and length
        BNE     movbuf          ;and loop
fillov:
        JSR     ccrlf           ;do a cr lf
        JSR     stdflb          ;set default
do:
        JSR     tea             ;execute
        LDA     dfldsk          ;get default
        JSR     slctds          ;and set
        JMP     ccmlpe          ;then loop
;trns syntax error handler
topner:
        JSR     rstddr          ;restore default
trnerr:
        JMP     cmderr          ;do error
;trns load error
tlderr:
        LDY     #lderms         ;point to
        JMP     sndmsg          ;and send
;carriage return and linefeed
ccrlf:
        LDA     #cr             ;get a cr
        JSR     chrout          ;send
        LDA     #lf             ;get a lf
        BNE     chrout          ;and send
;pem entry routines
cnsrde:
        LDX     #1              ;console read
        BNE     pemgo
spcout:
        LDA     #' '            ;output space
chrout:
        LDX     #2              ;console output
        BNE     pemgo
rdebuf:
        LDX     #10             ;buffered input
        BNE     pemgo
chkcst:
        LDX     #11             ;check console
        BNE     pemgo
rstdsk:
        LDX     #13             ;initialize system
        BNE     pemgo
slctds:
        LDX     #14             ;select drive
        BNE     pemgo
openfl:
        LDX     #15             ;open file
        BNE     pemgo
clsefl:
        LDX     #16             ;close file
        BNE     pemgo
srchfr:
        LDX     #17             ;first match
        BNE     pemgo
srchnx:
        LDX     #18             ;next match
        BNE     pemgo
;delete file one
dlt1:
        JSR     setone          ;point to fcb
dltfil:
        LDX     #19             ;delete file
        BNE     pemgo
rdrcrd:
        LDX     #20             ;read record
        BNE     pemgo
wrrcrd:
        LDX     #21             ;write record
        BNE     pemgo
cratfl:
        LDX     #22             ;create file
        BNE     pemgo
renmfl:
        LDX     #23             ;rename file
        BNE     pemgo
intdsk:
        LDX     #25             ;read drive num
        BNE     pemgo
setbuf:
        LDX     #26             ;set buffer add
pemgo:
        JMP     pemjmp          ;go to pem
;restore default drive
rstddr:
        LDA     tmpdsk          ;if temp drive
        BEQ     extddr          ;zero then exit
        SEC                     ;else
        SBC     #1              ;subtract one
        CMP     dfldsk          ;compare to default
        BEQ     extddr          ;exit if same
seldfl:
        LDA     dfldsk          ;else get default
        JMP     slctds          ;select
;clear auto - select disk - open file at fcbone
casdo1:
        JSR     clrslt          ;clear auto and select
;open file one
; returns:n=1 if not found
open1:
        LDA     #0              ;clear
        STA     fcbone+32       ;record number
        JSR     setone          ;point to fcb
        JSR     openfl          ;open it
        STA     diradd          ;save number
extddr:
        RTS
;read file one
read1:
        JSR     setone          ;point to fcb
        JMP     rdrcrd          ;do read
;search for first file one
; returns:n=1 if not found
srchf1:
        JSR     setone          ;point to fcb
        JSR     srchfr          ;search for first
        STA     diradd          ;save number
        RTS
;header output
hdrout:
        JSR     ccrlf           ;do cr lf
hdr:
        JSR     intdsk          ;get drive number
        CLC                     ;make
        ADC     #'A'            ;a letter
;output with save of x and y
;this routine calls the pem resident routine
;tstchr to see if a char is a printing char.
;if it is then c=1 upon return from tstchr.
cotsxy:
        STX     savx            ;save x
        STY     savy            ;and y
        JSR     tstchr          ;see if printing
        BCS     isprnt          ;jump if is
        PHA                     ;else save
        LDA     sysdef+4        ;get invert
        JSR     chrout          ;send it
        PLA                     ;get char
        ORA     #'@'            ;make printing
        JSR     chrout          ;send it
        LDA     sysdef+3        ;get normal
isprnt:
        JSR     chrout          ;do output
        LDY     savy            ;get y
        LDX     savx            ;and x
        RTS
;set up fcb one pointer
setone:
        LDA     fcb1vc          ;low
        LDY     fcb1vc+1        ;and high
        RTS
;save tmpdsk in oldtmp
tmpold:
        LDA     tmpdsk
        STA     oldtmp
        RTS
;parse command line
prslin:
        LDX     #0              ;clear index
prsmre:
        TXA                     ;save
        PHA                     ;index
        LDA     #0              ;clear temp
        STA     tmpdsk          ;drive flag
        LDY     cnbfpt          ;get buffer pointer
        JSR     skpspc          ;find first non-space
        STY     curpnt          ;save index
        BEQ     nulchr          ;jump if null
        AND     #%00001111      ;else look at 4 lsbs
        PHA                     ;and save
        INY                     ;point to next char
        LDA     cnstxt,y        ;and get it
        CMP     #':'            ;if a colon
        BEQ     drvinp          ;jump and set drive
        PLA                     ;else clear stack
        DEY                     ;backup index
nulchr:
        LDA     dfldsk          ;set automatic
        STA     fcbone,x        ;to default
        BPL     trynme          ;then parse name
drvinp:
        PLA                     ;get number
        STA     tmpdsk          ;set temp flag
        STA     fcbone,x        ;and fcb
        INY                     ;point past colon
trynme:
        LDA     #8              ;set name count
        STA     ccmcount        ;to eight
tstnme:
        JSR     tstlgl          ;test for illegal
        BEQ     flnmsp          ;if illegal jump
        INX                     ;bump pointer
        CMP     #'*'            ;if not *
        BNE     notafn          ;skip ? fill
        LDA     #'?'            ;get a ?
        STA     fcbone,x        ;store
        BNE     nxtout          ;and jump
notafn:
        STA     fcbone,x        ;store char
        INY                     ;bump source
nxtout:
        DEC     ccmcount        ;drop counter down
        BNE     tstnme          ;and loop
skpmre:
        JSR     tstlgl          ;if illegal
        BEQ     trytyp          ;try type
        INY                     ;else bump index
        BNE     skpmre          ;and loop
flnmsp:
        INX                     ;next position
        LDA     #' '            ;get a space
        STA     fcbone,x        ;store
        DEC     ccmcount        ;count down
        BNE     flnmsp          ;and loop
        LDA     cnstxt,y        ;get char again
trytyp:
        PHA                     ;save char
        LDA     #3              ;set count
        STA     ccmcount        ;to three
        PLA                     ;get char
        CMP     #'.'            ;if not .
        BNE     fltysp          ;then fill spaces
        INY                     ;else bump source
tsttyp:
        JSR     tstlgl          ;if not legal
        BEQ     fltysp          ;then fill spaces
        INX                     ;else bump index
        CMP     #'*'            ;if not *
        BNE     notaft          ;then skip fill
        LDA     #'?'            ;else get ?
        STA     fcbone,x        ;move to fcb
        BNE     mrtyfl          ;and loop
notaft:
        STA     fcbone,x        ;move char to fcb
        INY                     ;bump source
mrtyfl:
        DEC     ccmcount        ;count down
        BNE     tsttyp          ;and loop
nttype:
        JSR     tstlgl          ;if illegal
        BEQ     filnul          ;fill out nulls
        INY                     ;else bump source
        BNE     nttype          ;and loop
fltysp:
        INX                     ;bump fcb pointer
        LDA     #' '            ;get space
        STA     fcbone,x        ;put in fcb
        DEC     ccmcount        ;count down
        BNE     fltysp          ;and continue
filnul:
        LDA     #3              ;clear
        STA     ccmcount        ;three
mrnlty:
        INX                     ;bump fcb pointer
        LDA     #0              ;get a zero
        STA     fcbone,x        ;move to fcb
        DEC     ccmcount        ;count down
        BNE     mrnlty          ;loop until done
        STY     cnbfpt          ;update start pointer
        LDA     #0              ;clear
        STA     ccmcount        ;count
        PLA                     ;restore stack
        TAY                     ;move to index
        LDX     #11             ;counter to 11
tstqus:
        INY                     ;point to
        LDA     fcbone,y        ;and get char
        CMP     #'?'            ;if not a ?
        BNE     nxtqus          ;then jump
        INC     ccmcount        ;else bump count
nxtqus:
        DEX                     ;loop until
        BNE     tstqus          ;11 tested
        LDA     ccmcount        ;get count
        RTS                     ;and return
;skip space
skpspc:
        LDA     cnstxt,y        ;get char
        BEQ     extskp          ;jump if null
        CMP     #' '            ;if not space
        BNE     extskp          ;then exit
        INY                     ;else go to next
        BNE     skpspc          ;and test
extskp:
        RTS
;test legal
tstlgl:
        LDA     cnstxt,y        ;get char
        BEQ     extlgl
        CMP     #' '            ;if space
        BCC     badinp          ;ok - less is error
        BEQ     extlgl
        CMP     #'='
        BEQ     extlgl
        CMP     #'.'
        BEQ     extlgl
        CMP     #':'
        BEQ     extlgl
        CMP     #semico
        BEQ     extlgl
        CMP     #'<'
        BEQ     extlgl
        CMP     #'>'
extlgl:
        RTS
badinp:
        JMP     cmderr
;set default buffer address
stdflb:
        LDA     #<dflbuf        ;point to
        LDY     #>dflbuf        ;location
        JMP     setbuf          ;and set
;clear automatic and select
clrslt:
        LDA     #0              ;clear auto
        STA     fcbone          ;select
slttmp:
        LDA     tmpdsk          ;get temp
        BEQ     extsnd          ;if zero exit
        SEC                     ;else subtract
        SBC     #1              ;one
        CMP     dfldsk          ;if same as default
        BEQ     extsnd          ;then quit
        JMP     slctds          ;else set
;send message
sndmsg:
        STY     savy            ;save index
        JSR     ccrlf           ;do cr and lf
        LDY     savy            ;get index
lpesnd:
        LDA     msgtbl,y        ;get char
        BEQ     extsnd          ;if null quit
        JSR     cotsxy          ;else send
        INY                     ;point to next
        BNE     lpesnd          ;and loop
extsnd:
        RTS
;set load start address
setddb:
        LDA     #<tea           ;to tea start
        LDY     #>tea
setdb:
        STA     dskbuf          ;to ay
        STY     dskbuf+1
        RTS
;move first part of fcb to second half
;and move second part to first part.
;only ren depends upon this routine to actually
;swap fcb halves.
;alters:a,x,p
;returns:x=$ff
frssec:
        LDX     #15             ;set index to last
frsclp:
        LDA     fcbone,x        ;get byte
        LDY     fcbone+16,x
        STA     fcbone+16,x     ;move it
        TYA
        STA     fcbone,x
        DEX
        BPL     frsclp          ;until 16 moved
        RTS
;move second part of fcb to first half
;restore tmpdsk from save location
;alters:a,x,p
;returns:x=$ff
secfrs:
        LDX     #15             ;set index to last
scfrlp:
        LDA     fcbone+16,x     ;get byte
        STA     fcbone,x        ;move it
        DEX
        BPL     scfrlp          ;loop until done
        LDA     oldtmp          ;get old flag
        STA     tmpdsk          ;and set
        RTS
;build a number from command line and leave in num
;will handle either decimal (e.g., 578) or hexadecimal (e.g., $3f2)
;move parse index past number
;modifies:all
;returns:a,y set to low and high of number
;	 flags set according to y which is high part of number
bldnum:
        LDA     #9              ;preset to decimal
        STA     moduls
        JSR     prslin          ;put in fcb
        LDA     tmpdsk          ;if temp
        BNE     numerr          ;is error
        STA     num             ;else clear num
        STA     num+1
        TAY                     ;and index
        LDA     fcbone+1,y      ;get first char
        CMP     #'$'            ;see if hex signal
        BNE     bnumlp          ;skip if not
        LDA     #15             ;set for modulus
        STA     moduls
        INY                     ;bump past $
bnumlp:
        INY                     ;next char
        LDA     fcbone,y        ;get digit
        CMP     #' '            ;see if space
        BEQ     endnlp          ;done if is
        JSR     tstdec          ;see if decimal
        BCC     usedig          ;use if is
        JSR     tsthex          ;see if hex
        BCS     numerr          ;error if not
        SBC     #6              ;remove offset
        LDX     #15             ;test for hex modulus
        CPX     moduls
        BNE     numerr          ;error if not
usedig:
        AND     #%00001111      ;eliminate ascii bias
        PHA                     ;save result
        LDA     num             ;move number to temp
        STA     tnum
        LDA     num+1
        STA     tnum+1
        LDX     moduls          ;get modulus
        CLC
addlpe:
        LDA     num             ;add number to itself
        ADC     tnum
        STA     num
        LDA     num+1           ;modulus times
        ADC     tnum+1
        STA     num+1
        BCS     numerr          ;error if carry out
        DEX
        BNE     addlpe          ;loop if more
        PLA                     ;get input back
        ADC     num             ;add in
        STA     num
        BCC     bnumlp          ;loop if no carry
        INC     num+1           ;else bump high
        BNE     bnumlp          ;and loop for more
;error in bldnum - handle and quit
numerr:
        JMP     cmderr          ;do general error
;end of use of name part - check type
endnlp:
        LDA     fcbone+9        ;get first
        CMP     #' '            ;see if space
        BNE     numerr          ;error if not
        LDA     num             ;return with result
        LDY     num+1
        RTS
;relocatable vectors
        .BYTE   $4c
cnsbvc:
        .WORD   cnsbuf
        .BYTE   $4c
extcvc:
        .WORD   extcmd-1
        .BYTE   $4c
ccmvc:
        .WORD   ccm
        .BYTE   $4c
fcb1vc:
        .WORD   fcbone
;function entry vector
xqfntb:
        JMP     dir
        JMP     save
        JMP     era
        JMP     type
        JMP     ren
        JMP     go
        JMP     load
        JMP     trns
;terminator for relocation
        .BYTE   $ff
;messages
msgtbl:
        .BYTE   0
nospms          = *-msgtbl
        .BYTE   "NO SPACE",0
ntclms          = *-msgtbl
        .BYTE   "CAN NOT CLOSE",0
alflms          = *-msgtbl
        .BYTE   "ALL FILES (Y/N)?",0
rderms          = *-msgtbl
        .BYTE   "READ ERROR",0
ntfnms          = *-msgtbl
        .BYTE   "NOT FOUND",0
flexms          = *-msgtbl
        .BYTE   "FILE EXISTS",0
lderms          = *-msgtbl
        .BYTE   "LOAD ERROR",0
cnnoms          = *-msgtbl
        .BYTE   "CAN NOT OPEN",0
wrerms          = *-msgtbl
        .BYTE   "WRITE ERROR",0
;function name table
fnctbl:
        .BYTE   "DIR ",0
        .BYTE   "SAVE ",0
        .BYTE   "ERA ",0
        .BYTE   "TYPE ",0
        .BYTE   "REN ",0
        .BYTE   "GO ",0
        .BYTE   "LOAD ",0
;input buffer
cnsbuf:
cnsmax:
        .BYTE   127
cnslng:
        .BYTE   0
cnstxt:
        .RES    127
;fcb one
fcbone:
        .RES    33
;com type field
typcom:
        .BYTE   "CO6"
;variable storage
cnbfpt:
        .BYTE   0               ;buffer index
dfldsk:
        .BYTE   0               ;default drive
tmpdsk:
        .BYTE   0               ;temporary dvive
;align vector on word boundary
        .ALIGN  2
vector:
        .WORD   0               ;execution vector
ccmcount:
        .BYTE   0               ;counter
curpnt:
        .BYTE   0               ;input parse start
diradd:
        .BYTE   0               ;directory number
savx:
        .BYTE   0               ;save x location
savy:
        .BYTE   0               ;save y location
length:
        .BYTE   0               ;number tages to save
oldtmp:
        .BYTE   0               ;temp drive in ren
dskbuf:
        .WORD   tea             ;disk buffer start
across:
        .BYTE   0               ;dir count on line
sixten:
        .BYTE   0               ;line length div 16
moduls:
        .BYTE   9               ;modulus-1 for number input
num:
        .WORD   0               ;input number
tnum:
        .WORD   0               ;temp in bldnum
sadr:
        .WORD   tea             ;save start address
