;________________________________________________________________________________________________________________________________
;
;	Nhyodyne dos/65 primitive execution module (pem)
;
;  DWERNER 02/19/2022   Strip off Most significant bit of file name in dir to
;			make filesystem compatible with ROMWBW
;________________________________________________________________________________________________________________________________

;zero page data storage
addinp          = $02           ;initialized to a,y
bufadd          = $04           ;buffer address
alcpnt          = $06           ;allocation map pointer
chkpnt          = $08           ;checksum map pointer
numvar          = 8             ;eight bytes
;main program
; input:x=command,a=value,a&y=address
; returns:a=value,a&y=address
; alters:all
pem:
        CLD                     ;set binary mode
        STA     bytinp          ;save input
        STA     lowin           ;value and
        STY     bytinp+1        ;save high
        STY     lowin+1         ;address
        STX     cmdinp          ;and command
        CPX     #numcmd         ;if invalid
        BCS     extpem          ;then exit
        LDA     swctbl,x        ;if flag zero
        BEQ     noswin          ;skip switch
        LDA     #255            ;else set
        STA     swcflg          ;memory switch flag
        JSR     switch          ;move data to page zero
noswin:
        LDA     #0              ;clear drive
        STA     tmpdrv          ;switch flag
        LDA     cmdinp          ;get command
        ASL     a               ;multiply by two
        ADC     cmdinp          ;then add to get x3
        TAX                     ;and make a pointer
        INX                     ;bump to pass jmp
        LDA     cmdtbl,x        ;get command
        LDY     cmdtbl+1,x      ;address
        STA     xqtvec          ;and put
        STY     xqtvec+1        ;in vector
        LDA     extevc+1        ;get return
        PHA                     ;address
        LDA     extevc          ;and push
        PHA                     ;as return
        LDA     bytinp          ;get input value
        LDY     bytinp+1
        JMP     (xqtvec)        ;then execute
extexq:
        STA     bytout          ;save value
        STY     addout+1        ;and address
        LDA     tmpdrv          ;get temp drive
        BEQ     extpem          ;if zero skip switch
        LDY     #0              ;else
        STA     (addinp),y      ;put back in fcb
        LDA     olddrv          ;get old drive number
        STA     bytinp          ;set input value
        JSR     chgdrv          ;then switch back
extpem:
        BIT     swcflg          ;test memory switch
        BPL     noswot          ;if not set skip
        JSR     switch          ;else do memory switch
        LDA     #0              ;clear
        STA     swcflg          ;flag
noswot:
        LDY     addout+1        ;get address
        LDA     bytout          ;and value (address low)
        RTS
;command vector table
cmdtbl:
        JMP     xwboot          ;warm boot
        JMP     xcnsin          ;console input with echo
        JMP     sndchr          ;console output
        JMP     sim+21          ;tape reader
        JMP     sim+18          ;tape punch
        JMP     sim+15          ;printer output
        JMP     getcon          ;console input w/o echo
        JMP     xgtios          ;read i/o status
        JMP     xstios          ;set i/o status
        JMP     sndstr          ;print buffer
        JMP     bufinp          ;read buffer
        JMP     kbdsts          ;test console ready
        JMP     sim+45          ;read list status
        JMP     xintds          ;initialize system
        JMP     chgdrv          ;log in drive
        JMP     xopen           ;open file
        JMP     xclose          ;close file
        JMP     xfndfr          ;find first match
        JMP     xfndnx          ;find next match
        JMP     xdltfl          ;delete file
        JMP     xread           ;read record
        JMP     xwrite          ;write record
        JMP     xmake           ;create file
        JMP     xrenme          ;rename file
        JMP     xintlg          ;interrogate log in status
        JMP     xintdr          ;interrogate current drive
        JMP     chgdma          ;set buffer address
        JMP     xrdalv          ;read allocation map start
        JMP     setron          ;set r/w status
        JMP     xrdros          ;read r/w status
        JMP     setlst          ;set list echo status
        JMP     lststs          ;read list echo status
        JMP     xrtclo          ;read low clock
        JMP     xrtchi          ;read high clock
        JMP     xrddcb          ;read dcb address
        JMP     sim+51          ;translate sector
;set list echo status
setlst:
        STA     lstflg          ;set flag
        RTS
;read list echo status
lststs:
        LDA     lstflg          ;read flag
        RTS
;execute warm boot
; ***this command does not return to pem***
; ***instead it jumps to sim, resets	***
; ***system and stack and jumps to ccm. ***
xwboot:
        BIT     swcflg          ;test memory switch flag
        BPL     dowmbt          ;if clear do not
        JSR     switch          ;switch memory
        LDA     #0              ;clear
        STA     swcflg          ;flag
dowmbt:
        JMP     sim+3           ;go to sim

;execute read real time clock
xrtclo:
        JSR     sim+48          ;read clock

        STA     rtclk           ;save low
        STY     rtclk+1         ;middle
        STX     rtclk+2         ;high
        TXA
        AND     #%10000000      ;test for valid
        TAY
        LDA     rtclk           ;get low
        RTS
;execute read real time clock high
xrtchi:
        LDA     rtclk+2         ;get high
        AND     #%01111111      ;clear status
        TAY
        LDA     rtclk+1         ;get middle
        RTS
;execute read dcb address
xrddcb:
        LDA     cptdcb+1        ;get address
        LDY     cptdcb+2
        RTS
;execute read i/o status
xgtios:
        LDA     iostat          ;get status byte
        RTS
;execute read allocation map starting address
xrdalv:
        LDA     alcmap          ;get
        LDY     alcmap+1        ;starting address
        RTS                     ;then return
;execute set i/o status
xstios:
        STA     iostat          ;set status
        RTS
;execute interrogate current drive
xintdr:
        LDA     curdrv          ;get number
        RTS
;execute read log in status
xintlg:
        LDA     lginvc          ;get status
        RTS
;execute read read/write status
xrdros:
        LDA     ronlst          ;get status
        RTS
;execute find next match
xfndnx:
        JSR     autodr          ;auto drive select
        LDA     #13             ;match including
        JMP     search          ;extent
;execute read next record
xread:
        JSR     autodr          ;auto drive select
        JSR     inrcct          ;initialize record counters
        LDA     nxtrec          ;if next record less
        CMP     numrec          ;then number records
        BCC     tryrde          ;then try to read
        CMP     #128            ;but if not and
        BEQ     tryext          ;is max try to extend
rdeeof:
        LDA     #1              ;else set eof
        RTS                     ;code and return
tryext:
        LDX     #1              ;try for a read
        JSR     extend          ;file extension
        CMP     #0              ;if not ok exit eof
        BNE     rdeeof          ;with jump back
        STA     nxtrec          ;clear next record
tryrde:
        JSR     getblk          ;and get block
        LDA     blknum          ;if block not zero
        ORA     blknum+1
        BNE     dorde           ;do the read
        LDA     #2              ;else set unwritten
        RTS                     ;code and exit
dorde:
        JSR     calrcn          ;calculate record number
        JSR     sttrsc          ;set track and sector
        JSR     rdesec          ;do sector read
        JSR     updtrc          ;update counters
        LDA     #0              ;return w/o error
extrde:
        RTS
;execute file rename
xrenme:
        JSR     autodr          ;automatic drive select
        JSR     tstron          ;test for r/o
        LDA     #12             ;match name
        JSR     frstsr          ;and type
        BMI     extren          ;exit if not found
doren:
        LDA     #0              ;clear drive select
        LDY     #16             ;in new name
        STA     (addinp),y      ;part of fcb
        LDA     #12             ;then move
        LDX     #16             ;new name
        JSR     dirchg          ;to directory
        LDA     #12             ;see if
        JSR     search          ;another match
        BPL     doren           ;loop if found
extren:
        RTS                     ;number
;execute delete file
xdltfl:
        JSR     autodr          ;automatic drive select
        JSR     tstron          ;test for r/o
        LDA     #12             ;match name
        JSR     frstsr          ;and type
        BMI     extdlt          ;done if not found
dodlt:
        LDX     #0              ;else do a
        JSR     mapdir          ;delete
        LDY     subrec          ;then change
        LDA     empty           ;byte zero to
        STA     (bufadd),y      ;empty code
        JSR     updtck          ;then update directory
        LDA     #12             ;search
        JSR     search          ;for next
        BPL     dodlt           ;loop if found
extdlt:
        RTS                     ;exit
;execute write next record
xwrite:
        JSR     autodr          ;automatic drive select
        JSR     tstron          ;test for r/o
        JSR     inrcct          ;initialize counters
        LDA     nxtrec          ;get next record
        CMP     #128            ;compare to max
        BCC     ntexte          ;continue if less
        LDA     #1              ;else flag as extend
        RTS                     ;error and exit
ntexte:
        JSR     getblk          ;calculate block num
        LDA     #0              ;say normal write
        STA     pemwrtype       ;for now
        LDA     blknum          ;get it and if
        ORA     blknum+1
        BEQ     *+5             ;zero then get number
        JMP     blkopn          ;else go write
        LDA     #2              ;say unalloc write
        STA     pemwrtype
        LDA     fcbind          ;get index from prior
        PHA                     ;and save
        CMP     #16             ;if first block
        BEQ     isfrst          ;then don't change
        TAY                     ;else make an index
        DEY                     ;point to last
        BIT     blmode          ;test mode
        BPL     *+3             ;done if byte
        DEY                     ;else drop for word
        LDA     (addinp),y      ;and get that number
        STA     blknum          ;store as starting
        INY                     ;bump for word
        LDA     #0              ;preset for byte
        BIT     blmode          ;test mode
        BPL     *+4             ;done if byte
        LDA     (addinp),y      ;else get high
        STA     blknum+1        ;then set high
isfrst:
        LDA     blknum          ;get block
        STA     lkdown          ;set lower and
        STA     lookup          ;upper pointers
        LDA     blknum+1        ;now set high part
        STA     lkdown+1
        STA     lookup+1
srblag:
        LDA     lookup          ;if upper pointer
        CMP     maxblk          ;not at max
        BNE     upnemx          ;then keep going
        LDY     lookup+1        ;now check high
        CPY     maxblk+1
        BEQ     tstdwn          ;go test down
upnemx:
        INC     lookup          ;else bump upper
        BNE     *+5
        INC     lookup+1
        LDA     lkdown          ;then if lower
        ORA     lkdown+1
        BEQ     dotest          ;is zero start test
        BNE     dcdown          ;else drop lower
tstdwn:
        LDA     lkdown          ;if upper & lower at
        ORA     lkdown+1
        BNE     dcdown          ;drop if not zero
        TAY                     ;also set y
        BEQ     extsbl          ;then exit
dcdown:
        LDA     lkdown          ;drop lower
        BNE     *+5
        DEC     lkdown+1
        DEC     lkdown
dotest:
        LDA     lkdown          ;get lower
        LDY     lkdown+1
        JSR     tstblk          ;and test
        BNE     trylup          ;if full try upper
        LDA     lkdown          ;else use lower
        LDY     lkdown+1
        JMP     extsbl          ;as result
trylup:
        LDA     lookup          ;get upper
        LDY     lookup+1
        JSR     tstblk          ;if full
        BNE     srblag          ;then loop
        LDA     lookup          ;else use upper
        LDY     lookup+1
extsbl:
        STA     blknum          ;then save number
        STY     blknum+1
        ORA     blknum+1        ;see if zero
        BNE     gtgood          ;then proceed
        PLA                     ;clear stack
        LDA     #2              ;set end
        RTS                     ;of data return
gtgood:
        LDA     blknum          ;get low again
        JSR     setblk          ;set allocation map
        PLA                     ;get block
        TAY                     ;pointer back
        LDA     blknum          ;get number
        STA     (addinp),y      ;and put in fcb
        LDA     blknum+1        ;get high
        INY
        BIT     blmode          ;test mode
        BPL     *+4             ;done if byte
        STA     (addinp),y      ;else set high
blkopn:
        JSR     calrcn          ;calculate record num
        JSR     sttrsc          ;set track and sector
        JSR     wrtsec          ;do write
        LDX     nxtrec          ;get next record
        CPX     numrec          ;if less than max
        BCC     notful          ;then ok
        INX                     ;else bump count
        STX     numrec          ;and save
        DEX                     ;back down
notful:
        CPX     #127            ;if not at max
        BNE     noawex          ;skip extending
        JSR     updtrc          ;update record counters
        LDX     #0              ;do write
        JSR     extend          ;file extension
        CMP     #0              ;if not ok
        BNE     extwrt          ;exit
        LDA     #255            ;else start counter
        STA     nxtrec          ;at one short
noawex:
        JSR     updtrc          ;then update counters
        LDA     #0              ;good return
extwrt:
        RTS                     ;exit
;execute console input
xcnsin:
        JSR     getcon          ;get input
        JSR     tstchr          ;test it and
        BCC     extxci          ;if control exit
        PHA                     ;else save
        JSR     sndchr          ;echo
        PLA                     ;restore
extxci:
        RTS                     ;return
;switch memory
;page zero block begins at $02 and is numvar bytes long.
switch:
        LDX     #numvar-1       ;get number to switch
nxtswh:
        LDA     2,x             ;get zero page
        LDY     varblk,x        ;and save area
        STA     varblk,x        ;save zero
        STY     2,x             ;and high
        DEX                     ;count down
        BPL     nxtswh          ;and loop until done
drvsme:
        RTS                     ;then return
;change dma address
; input:addinp=address
; returns:none
; alters:all
chgdma:
        LDA     addinp          ;get low
        LDY     addinp+1        ;and high address
        STA     bufadd          ;then store
        STY     bufadd+1        ;in address
        JMP     sim+36          ;then go to sim

;change drive
; input:bytinp
; returns:none
; alters:all
chgdrv:
        LDA     bytinp          ;get input
        CMP     curdrv          ;if same as current
        BEQ     drvsme          ;do nothing
        STA     curdrv          ;else change current
        JMP     mapdrv          ;then log it in
;automatic drive select
; input:(addinp) 0=no change
; 1-8 or 'A'-'H' = change
; returns:none
; alters:all
autodr:
        LDY     #0              ;get
        LDA     (addinp),y      ;first byte of fcb
        BEQ     qtatdr          ;if zero quit
        SEC                     ;set carry for
        SBC     #1              ;subtract one
        AND     #%00000111      ;look at three lsbs
        STA     bytinp          ;make parameter
        LDA     curdrv          ;get current
        STA     olddrv          ;and save
        LDA     (addinp),y      ;get fcb entry
        STA     tmpdrv          ;and save as flag
        TYA                     ;set a to 0
        STA     (addinp),y      ;clear byte zero in fcb
        JSR     chgdrv          ;then select new drive
qtatdr:
        RTS                     ;and return
;execute initialize system
; input:none
; returns:none
; alters:all,curdrv,lginvc,bufadd
xintds:
        LDA     #DEFDRV         ;set current
        STA     curdrv          ;drive to a
        STA     lginvc          ;clear log in status
        LDA     #<dflbuf        ;get default buffer
        LDY     #>dflbuf        ;address
        STA     addinp          ;and set up
        STY     addinp+1        ;parameters
        JSR     chgdma          ;change address

;log in drive and set pointers and maps
; input:curdrv
; returns:none
; alters:all
mapdrv:
        LDA     curdrv          ;if current drive
        CMP     #8              ;is 0 to 7
        BCC     vlddrv          ;then log it in
drserr:
        JSR     errout          ;send error message
        LDA     sltmvc          ;point to
        LDY     sltmvc+1        ;select message
        JSR     sndstr          ;and send it

        JMP     xwboot          ;and abort

vlddrv:
        JSR     sim+27          ;go to sim to set
        STA     cptdcb+1        ;save
        STY     cptdcb+2
        ORA     cptdcb+2        ;see if invalid
        BEQ     drserr          ;error if is
;capture dcb
        LDY     #14-1           ;do 14 bytes
cptdcb:
        LDA     $ffff,y         ;get value from sim
        STA     dcb,y           ;store it
        DEY
        BPL     cptdcb          ;loop for more
        LDA     blkscd          ;get block size code
        TAY                     ;save in y
        CLC
        ADC     #3              ;convert to sxb
        STA     sxb             ;and save
        LDA     sabtbl,y        ;get sab
        STA     sab             ;and set
        LDA     maxdir          ;get max dir
        STA     maxdrc          ;set max dir record
        LDA     maxdir+1
        LSR     a               ;divide by 4
        ROR     maxdrc
        LSR     a
        ROR     maxdrc
        STA     maxdrc+1        ;then save high
        LDA     #0              ;set mode to byte
        STA     blmode
        LDA     maxblk+1        ;branch if max block
        BEQ     ntm255          ;not over 255
;if y=0 when the following line is executed it means
;that the user has put an illegal combination into
;the disk definition table. may want to consider
;putting some error checking here in the future if
;there is space in pem.
        DEY                     ;back up index
        SEC                     ;else set mode to word
        ROR     blmode
ntm255:
        LDA     exmtbl,y        ;get extent mask
        STA     exm

        SEC                     ;now calculate cexm1f
        LDA     #31
        SBC     exmtbl,y
        STA     cexm1f
        LDX     curdrv          ;get drive as pointer
        LDA     bitmap,x        ;get bit
        AND     lginvc          ;if logged in
        BNE     extstm          ;then exit
        LDA     bitmap,x        ;get bit back
        ORA     lginvc          ;set in log-in
        STA     lginvc          ;and update
        JMP     flinal          ;then fill in maps

extstm:
        RTS                     ;and return
;fill in allocation map
flinal:
        JSR     setrw           ;set to read/write
        LDA     maxblk          ;divide max block by
        STA     gpcnt           ;eight to get max
        LDA     maxblk+1
        LDX     #3
clcnab:
        LSR     a               ;use a for speed
        ROR     gpcnt
        DEX
        BNE     clcnab          ;loop if more
        STA     gpcnt+1         ;save high
        INC     gpcnt           ;bump by one
        BNE     *+5
        INC     gpcnt+1         ;with carry
        LDA     alcmap          ;get map start
        LDY     alcmap+1
        STA     alcpnt          ;set pointer to start
        STY     alcpnt+1
        LDY     #0              ;clear index
clraml:
        LDA     #0              ;clear byte
        STA     (alcpnt),y      ;put in map
        INC     alcpnt          ;bump pointer
        BNE     *+4
        INC     alcpnt+1        ;with carry
        LDA     gpcnt           ;get low of count
        BNE     *+5             ;skip if not zero
        DEC     gpcnt+1         ;else drop high
        DEC     gpcnt           ;always drop low
        LDA     gpcnt           ;test for zero
        ORA     gpcnt+1
        BNE     clraml          ;loop if more
;at this point complete map is cleared
        LDA     maxdrc          ;get low of max dir record
        STA     gpcnt
        LDA     maxdrc+1        ;high in a
        LDX     sxb             ;set x according to block size
clcmdb:
        LSR     a               ;do division
        ROR     gpcnt
        DEX
        BNE     clcmdb          ;until x is zero
        STA     gpcnt+1         ;set high
        INC     gpcnt           ;then bump by one
        BNE     *+5
        INC     gpcnt+1
        STX     blknum          ;clear block number
        STX     blknum+1
fildal:
        LDA     blknum          ;get block number
        LDY     blknum+1
        JSR     setblk          ;set bit
        INC     blknum          ;bump block number
        BNE     *+5
        INC     blknum+1
        LDA     gpcnt           ;get low of count
        BNE     *+5             ;skip if not zero
        DEC     gpcnt+1         ;else drop high
        DEC     gpcnt           ;always do low
        LDA     gpcnt           ;test for zero
        ORA     gpcnt+1
        BNE     fildal          ;loop if more
;at this point directory space is mapped
        JSR     intdrv          ;initialize drive
        JSR     cldrnm          ;clear directory number
fillpe:
        LDX     #1              ;parameter for fill
        JSR     nxtdir          ;execute for next directory
        BMI     extfil          ;done if invalid
        LDY     subrec          ;get offset
        LDA     (bufadd),y      ;get empty/valid flag
        CMP     #$e5            ;if empty
        BEQ     fillpe          ;try next
        LDX     #1              ;parameter for fill in
        JSR     mapdir          ;do directory map
        JMP     fillpe          ;then loop
extfil:
        RTS                     ;return
;initialize drive
; input:nsystr
; returns:none
; alters:all
intdrv:
        JSR     sim+24          ;home then

        LDA     nsystr          ;get number of system tracks
        LDY     nsystr+1
        JMP     sim+30          ;and set in sim

;directory record set up
; input:dirnum
; returns:none
; alters:all,recnum,dirrec
drrcsu:
        LDA     dirnum+1        ;move high dir number
        STA     recnum+1        ;to record number
        LDA     dirnum          ;divide
        LSR     recnum+1        ;directory by four
        ROR     a
        LSR     recnum+1
        ROR     a
        STA     dirrec          ;and save
        STA     recnum          ;set low record number
        LDA     recnum+1        ;get high
        STA     dirrec+1        ;and set
        LDA     #0              ;clear top byte
        STA     recnum+2
;set track and sector
; input:recnum
; returns:none
; alters:all,countr,trkctr
sttrsc:
        LDX     #0              ;clear track counter
        STX     trkctr
        STX     countr          ;and record
        STX     countr+1        ;counter
        STX     countr+2
trnxtr:
        LDA     recnum          ;from
        CMP     countr          ;record number
        LDA     recnum+1        ;and if a
        SBC     countr+1        ;borrow then
        LDA     recnum+2
        SBC     countr+2
        BCC     higher          ;gone too far
        CLC                     ;else
        LDA     countr          ;get counter
        ADC     sectrk          ;add sectors per track
        STA     countr          ;sectors per track
        LDA     countr+1
        ADC     sectrk+1
        STA     countr+1
        BCC     bumptr          ;done if no carry
        INC     countr+2        ;else bump high
bumptr:
        INX                     ;increase track count
        BNE     trnxtr          ;with carry
        INC     trkctr
        JMP     trnxtr          ;then loop
higher:
        DEX                     ;back up track
        CPX     #$ff            ;see if wrap around
        BNE     *+5             ;wasn't
        DEC     trkctr          ;else drop high
        TXA                     ;move to a
        CLC                     ;add starting track
        ADC     nsystr
        TAX                     ;save in x
        LDA     trkctr
        ADC     nsystr+1
        TAY                     ;move to correct registers
        TXA
        JSR     sim+30          ;then set in sim

        SEC                     ;back
        LDA     countr          ;counter down
        SBC     sectrk          ;by sectors per track
        STA     countr          ;and save
        LDA     countr+1
        SBC     sectrk+1
        STA     countr+1
        SEC                     ;now
        LDA     recnum          ;find difference
        SBC     countr          ;as sector
        TAX                     ;save in x
        LDA     recnum+1
        SBC     countr+1
        TAY                     ;move to correct registers
        TXA
        JSR     sim+51          ;translate

        JMP     sim+33          ;and set through sim

;get block bit mask and index
; input:a&y=block number
; returns:a=bit mask and y=0
; alters:all and alcpnt
blkmsk:
        PHA                     ;save block number
        STY     alcpnt+1        ;including high
        LDY     #3              ;divide by eight
blkmlp:
        LSR     alcpnt+1        ;shift high
        ROR     a
        DEY                     ;loop until done
        BNE     blkmlp
        CLC                     ;now add map start
        ADC     alcmap
        STA     alcpnt
        LDA     alcpnt+1
        ADC     alcmap+1
        STA     alcpnt+1
        PLA                     ;get number back
        AND     #%00000111      ;look at 3 lsbs
        TAX                     ;get
        LDA     bitmsk,x        ;mask
        RTS                     ;and return
;test block
; input:a&y=block number
; returns:z=1 if unassigned
; 	   =0 if assigned and bit in a is set
; alters:all
tstblk:
        JSR     blkmsk          ;get mask and index
        AND     (alcpnt),y      ;mask with map entry
        RTS                     ;then return
;alter block status
; input:a&y=block number,x=1 if set
;		   	  =0 if reset
; returns:none
; alters:all and allocation map
altalc:
        CPX     #1              ;if set
        BEQ     setblk          ;go do it
clrblk:
        JSR     blkmsk          ;else get mask
        EOR     #$ff            ;and complement
        AND     (alcpnt),y      ;preserve others
        STA     (alcpnt),y      ;and save
        RTS                     ;then return
setblk:
        JSR     blkmsk          ;get mask
        ORA     (alcpnt),y      ;set bit
        STA     (alcpnt),y      ;and put back
        RTS                     ;then return
;set current drive to read only
; input:curdrv,ronlst,bitmap
; returns:none
; alters:a,x,p and ronlst
setron:
        LDX     curdrv          ;get number
        LDA     bitmap,x        ;and get mask
        ORA     ronlst          ;or with status
        STA     ronlst          ;and put back
        RTS                     ;then return
;calculate checksum of buffer @ bufadd
; input: buffer@(bufadd)
; returns:a=checksum
; alters:a,y,p
clcchk:
        LDA     #0              ;clear accumulator
        LDY     #127            ;start at end
chkmre:
        CLC                     ;no carry
        ADC     (bufadd),y      ;add byte
        DEY                     ;count down
        BPL     chkmre          ;and loop until done
        RTS                     ;then return
;check read/write status
; input:curdrv,ronlst
; returns:z=0 if r/o or z=1 if r/w
; alters:a,x,p
chkron:
        LDX     curdrv          ;get current drive
        LDA     bitmap,x        ;get mask
        AND     ronlst          ;and test status
        RTS
;initialize record counters from fcb
; input:fcb@(addinp)
; returns:none
; alters:a,y,p,nxtrec,numrec
inrcct:
        LDY     #32             ;next record offset
        LDA     (addinp),y      ;get next record
        STA     nxtrec          ;and save
        LDY     #15             ;number records offset
        LDA     (addinp),y      ;get number
        STA     numrec          ;and save
        RTS                     ;and return
;update record counters in fcb
; input:nxtrec,numrec
; returns:none
; alters:all,fcb@(addinp)
updtrc:
        LDX     nxtrec          ;get next record
        INX                     ;bump it
        TXA                     ;transfer
        LDY     #32             ;set offset
        STA     (addinp),y      ;and store in fcb
        LDA     numrec          ;get number
        LDY     #15             ;and its offset
        STA     (addinp),y      ;and store
        RTS                     ;then return
;execute open file
xopen:
        JSR     autodr          ;auto drive select
;open file
; input:fcb @ (addinp)
; returns:n=1 if not found,a=dirmod (255 if not found)
; alters:all
opnfle:
        JSR     fndf13          ;match all including extent
        BMI     extopn          ;done if not found
        LDA     #12             ;point to first char
        ORA     subrec          ;add offset
        TAY                     ;make it a pointer
nxopmv:
        LDA     (bufadd),y      ;get buffer contents
        TAX                     ;and save
        TYA                     ;save index
        AND     #%00011111      ;remove offset
        TAY                     ;back to index
        TXA                     ;get byte back
        STA     (addinp),y      ;and store in fcb
        TYA                     ;get index
        ORA     subrec          ;add offset back
        TAY                     ;and make index again
        INY                     ;next position
        TYA                     ;if index
        AND     #%00011111      ;not gone past
        BNE     nxopmv          ;end then loop
;now correct extent and max records
        LDY     #12             ;point at extent in fcb
        LDA     savext          ;get save from search
        CMP     (addinp),y      ;compare
        BEQ     extsme          ;jump ahead if same
        STA     (addinp),y      ;else change extent
        LDA     #128            ;assume fcb ext < dir ext
        BCC     fcbxls          ;jump ahead if true
        ASL     a               ;clear a
fcbxls:
        LDY     #15             ;point to max
        STA     (addinp),y      ;and set
extsme:
        LDA     dirmod          ;else get number
extopn:
        RTS                     ;and return
;execute close file
xclose:
        JSR     autodr          ;auto drive select
;close file
;if file is r/o then no actual close
;operation is performed.
; input:fcb @ (addinp)
; returns:n=1 if not valid,a=dirmod (255 if invalid)
; alters:all
clsfle:
        JSR     fndf13          ;match including extent
        BMI     extcls          ;exit if not found
        JSR     chkron          ;see if r/o
        BNE     noclse          ;branch if is
;now set flag to ensure directory extent and number of
;records fields are only changed if necessary.
;The decision to change is determined by whether or
;not the system is closing an extent less than the
;maximum extent in the directory entry. If that is
;the case, the directory extent and number of record
;fields are not changed.
        LDY     #12             ;get extent
        LDA     (addinp),y
        PHA                     ;save it
        TYA                     ;now look in directory
        ORA     subrec
        TAY
        PLA                     ;get extent back
        CMP     (bufadd),y
        ROR     skpdir          ;save result
;now go do it
        JSR     updtdr          ;update directory
noclse:
        LDA     dirmod          ;get directory number
extcls:
        RTS                     ;and return
;execute find first match
xfndfr:
        JSR     autodr          ;auto drive select
fndf13:
        LDA     #13             ;match including extent
;search for first match
; input:a=number char to match
; returns:n=1 if invalid,a=dirmod (255 if invalid)
; alters:all
frstsr:
        PHA                     ;save number to match
        JSR     cldrnm          ;clear directory number to -1
        JSR     intdrv          ;and drive
        PLA                     ;get number to match
;search for directory match
; input:a=number char to match
; returns:n=1 if not found,a=dirmod (255 if invalid)
; alters:all
search:
        STA     chrcnt          ;save number
newtry:
        LDX     #0              ;set for search
        STX     cmppnt          ;clear pointer
        JSR     nxtdir          ;get next entry
        BMI     exitsr          ;exit if not found
        LDX     chrcnt          ;get count
mremch:
        LDY     cmppnt          ;get pointer
        INC     cmppnt          ;and bump
        LDA     (addinp),y      ;get fcb entry
        CPY     #12             ;see if at extent
        BNE     notaex          ;jump if not
        STA     savext          ;save for later use
        PHA                     ;save extent
        TYA                     ;change to directory
        ORA     subrec          ;coordinates
        TAY
        PLA                     ;get extent back
        EOR     (bufadd),y      ;exclusive or with dir
        AND     cexm1f          ;and with exm complement + 1f
        BEQ     trynxt          ;ok if zero
        BNE     newtry          ;else get next directory
notaex:
        CMP     #'?'            ;if a ? then
        BEQ     trynxt          ;is a match
        PHA                     ;save char
        TYA                     ;then add
        ORA     subrec          ;offset to
        TAY                     ;make pointer
        PLA                     ;get char back
;        sta     savex
;        lda	(bufadd),y	;if not same
;        and     #$7F            ; strip off high bit for ROMWBW Read only filesystem
;	cmp	savex	        ;if not same
        CMP     (bufadd),y      ;if not same
        BNE     newtry          ;try next directory
trynxt:
        DEX                     ;else count number down
        BNE     mremch          ;and loop if more
        LDA     dirmod          ;return with directory
exitsr:
        RTS                     ;number mod 4
;calculate logical record number
; input:blknum
; returns:none
; alters:a,x,p,recnum
calrcn:
        LDX     sxb             ;set x according to blkscd
mulmre:
        ASL     blknum          ;multiply block
        ROL     blknum+1        ;number
        ROL     blknum+2
        DEX                     ;by code
        BNE     mulmre
        LDA     sab             ;set mask in a
        AND     nxtrec          ;and with next record
        ORA     recnum          ;or with number
        STA     recnum          ;and save
        RTS
;update directory
updtdr:
        LDA     #32             ;change all
        LDX     #0              ;from start
;change directory entry
; input:a=number char to change,x=starting position,fcb@(addinp)
; returns:none
; alters:all,directory,checksums
dirchg:
        STA     chrcnt          ;save count
        DEC     chrcnt          ;back up
mrechg:
        CLC                     ;clear carry
        TXA                     ;get offset
        ADC     chrcnt          ;compute index
        TAY                     ;and set
        CPY     #12             ;see if at extent
        BEQ     docare          ;if so do special
        CPY     #15             ;see if at number rec
        BNE     dntcar          ;if not skip
docare:
        BIT     skpdir          ;check flag
        BPL     nochng          ;skip if ok
dntcar:
        LDA     (addinp),y      ;get char
        PHA                     ;save it
        LDA     chrcnt          ;get count
        ORA     subrec          ;add offset
        TAY                     ;make an index
        PLA                     ;get char back
        STA     (bufadd),y      ;and put in buffer
nochng:
        DEC     chrcnt          ;count down
        BPL     mrechg          ;and loop
        JSR     drrcsu          ;set it up
        JMP     updtck          ;and do change
;execute create file
xmake:
        JSR     autodr          ;auto drive select
;create file
; input:fcb@(addinp)
; returns:n=1 if not valid,a=dirmod (255 if not valid)
; alters:dirnum,dirmod,fcb@(addinp)
mkefle:
        JSR     tstron          ;test for r/o
        LDA     addinp          ;save fcb
        PHA                     ;address
        LDA     addinp+1        ;on
        PHA                     ;stack
        LDA     empdvc          ;then point
        LDY     empdvc+1        ;to empty
        STA     addinp          ;dummy
        STY     addinp+1        ;fcb
        LDA     #1              ;match only
        JSR     frstsr          ;first char
        PLA                     ;restore
        STA     addinp+1        ;fcb
        PLA                     ;address
        STA     addinp          ;from stack
        LDA     dirmod          ;get number mod 4
        BMI     extmke          ;quit if not found
        LDY     #13             ;else set up
        LDA     #0              ;to clear
mkeagn:
        STA     (addinp),y      ;rest of
        INY                     ;fcb
        CPY     #33             ;including next
        BNE     mkeagn          ;record
;the next two lines ensure that the extent and
;number of records fields are updated
        SEC
        ROR     skpdir
        JSR     updtdr          ;update directory
        LDA     dirmod          ;get number
extmke:
        RTS                     ;and quit
;extend file
; input:fcb@(addinp), x=1 read
;		        0 write
extend:
        STX     exrwfl          ;save parameter
        JSR     clsfle          ;close current extent
        BMI     extext          ;exit if not found
        LDY     #12             ;else
        LDA     (addinp),y      ;get extent
        CLC                     ;and
        ADC     #1              ;add one
        AND     #%00011111      ;see if overflow
        BEQ     exteof          ;eof if so
        STA     (addinp),y      ;and save
        JSR     fndf13          ;see if next extent exists
        BPL     opnext          ;if so open
        LDA     exrwfl          ;if not and is write then create
        BNE     extext          ;else return as eof
dwrtex:
        JSR     mkefle          ;create file
        JMP     tstext          ;and test
opnext:
        JSR     opnfle          ;open
tstext:
        BPL     extnok          ;continue if ok
exteof:
        LDA     #1              ;else set eof
        RTS                     ;and return
extnok:
        JSR     inrcct          ;initialize counters
        LDA     #0              ;good
extext:
        RTS                     ;return
;set up next directory block
; input:dirnum,x=1 for update checksum
; returns:a=dirmod (255 if invalid),n=1 if invalid
; alters:alll,dirnum,dirmod
nxtdir:
        TXA                     ;save operation
        PHA                     ;on stack
        INC     dirnum          ;bump directory
        BNE     *+5
        INC     dirnum+1
        LDA     maxdir          ;if not at limit continue
        CMP     dirnum
        LDA     maxdir+1
        SBC     dirnum+1
        BCS     gtnxdr          ;then continue
        PLA                     ;else clear stack
        TAX                     ;and set x
        JMP     cldrnm          ;set to invalid
gtnxdr:
        LDA     dirnum          ;get low again
        AND     #%00000011      ;look at 2 lsbs
        STA     dirmod          ;save mod 4
        ASL     a               ;multiply
        ASL     a               ;by
        ASL     a               ;32 to
        ASL     a               ;get pointer
        ASL     a               ;offset
        STA     subrec          ;and save
        BEQ     getdir          ;if zero read new
        PLA                     ;else clear stack
        TAX                     ;set x
        JMP     gotdir          ;and exit
getdir:
        JSR     drrcsu          ;set up to read
        JSR     rdesec          ;do read
        PLA                     ;get operation
        TAX                     ;code
;;;;;;	jsr	chksop		;do it
gotdir:
        LDA     dirmod          ;and return
exnxdr:
        RTS                     ;with number
;checksum operation
;this routine assumes calling routine has checked for
;valid dirnum and hence valid dirrec
; input:chkflg,dirrec,x (1=update else check)
; returns:none
; alters:map@(chkmap)
chksop:
        BIT     chkflg          ;check flag
        BMI     exnxdr          ;done if set
        DEX                     ;dec code
        BNE     tstchk          ;if not zero test
        JSR     clcchk          ;else calculate
        JSR     clcckp          ;calculate pointer
        STA     (chkpnt),y      ;and save
        RTS                     ;then return
tstchk:
        JSR     clcchk          ;do calculation
        JSR     clcckp          ;calculate pointer
        CMP     (chkpnt),y      ;compare to old
        BEQ     exnxdr          ;if equal ok
        JMP     setron          ;else set to r/o
;get block number
; input:nxtrec,blmode,fcb@(addinp),sxb,exm
; returns:none
; alters:all,blknum
getblk:
        LDX     sxb             ;set x according to blkscd
        LDA     nxtrec          ;get next record
gblp:
        LSR     a               ;divide by 2 x times
        DEX
        BNE     gblp
        STA     blknum          ;save previous as temp
;use extent as offset but first use sxb to create param
        SEC
        LDA     #8
        SBC     sxb
        TAX
;now get extent from fcb
        LDY     #12
        LDA     (addinp),y
        AND     exm             ;and with mask
        LSR     a               ;shift with lsb to c
gbxlp:
        ROL     a               ;now go other way
        DEX
        BNE     gbxlp
        CLC                     ;now add saved value
        ADC     blknum          ;back
        BIT     blmode          ;test mode
        BPL     *+3             ;skip if byte
        ASL     a               ;else times two
        CLC                     ;then add
        ADC     #16             ;offset into fcb
        STA     fcbind          ;save for later
        TAY                     ;set index
        LDA     (addinp),y      ;get number
        STA     blknum          ;store
        INY
        LDA     #0              ;clear
        BIT     blmode          ;test mode
        BPL     *+4             ;skip if byte
        LDA     (addinp),y      ;else get high
        STA     blknum+1        ;high byte
        RTS                     ;and return
;calculate chkpnt as function of dirrec and chkmap
; input:dirrec,chkmap
; returns:y=0
; alters:y,p,chkpnt
clcckp:
        PHA                     ;save a
        CLC
        LDA     dirrec          ;add record number
        ADC     chkmap          ;to start
        STA     chkpnt
        LDA     dirrec+1
        ADC     chkmap+1
        STA     chkpnt+1
        LDY     #0
        PLA                     ;get a back
        RTS
;clear directory number to $ffff
; input:none
; returns:a=$ff,n=1,z=0
; alters:a,p,dirnum,dirmod
cldrnm:
        LDA     #$ff            ;set to $ff
        STA     dirnum
        STA     dirnum+1
        STA     dirmod
        RTS
;change allocation map
; input:subrec,directory record @ (bufadd)
; returns:none
; alters:all,allocation map
mapdir:
        CLC                     ;add 16 to
        LDA     subrec          ;to subrec to point
        ADC     #16             ;to block number field
        TAY                     ;make index
lpmpdr:
        STY     mpdrsy          ;save index
        TXA                     ;save x
        PHA                     ;operation
        LDA     (bufadd),y      ;get block number
        STA     mpdrtm          ;save in temp
        INY                     ;bump index for word
        JSR     gthibn          ;get high part of number
mpdrnw:
        ORA     mpdrtm          ;see if zero
        BEQ     skpedr          ;skip if zero
        JSR     gthibn          ;get high again
        TAY                     ;move to y
        LDA     mpdrtm          ;get low again
        JSR     altalc          ;else alter map
skpedr:
        PLA                     ;get operation
        TAX                     ;back
        LDY     mpdrsy          ;get index back
        INY                     ;bump it
        TYA                     ;if still
        AND     #%00001111      ;in field
        BNE     lpmpdr          ;then loop
        RTS                     ;else quit
;test r/w status
;does warm boot if r/o
; input:curdrv,ronlst
; returns:none
; alters:a,x,p
tstron:
        JSR     chkron          ;test bit
        BEQ     exttro          ;exit if r/w
        JSR     errout          ;else send error
        LDA     rommvc          ;point to r/o
        LDY     rommvc+1        ;message
        JSR     sndstr          ;send it
        JMP     xwboot          ;then abort
;set current drive to r/w
; input:curdrv,ronlst
; returns:ronlst
; alters:a,x,p,ronlst
setrw:
        LDX     curdrv          ;get drive
        LDA     bitmap,x        ;and mask
        EOR     #$ff            ;complement
        AND     ronlst          ;and with status
        STA     ronlst          ;save
exttro:
        RTS                     ;return
;read sector
rdesec:
        JSR     sim+39          ;do read

        JMP     chkrwe          ;check for error
;update checksum and directory
updtck:
        LDX     #1              ;set for update
;;;;;	jsr	chksop		;do it
        LDA     #1              ;say is directory op
        BNE     secwrt          ;do it
;write sector
wrtsec:
        LDA     pemwrtype       ;get write type
secwrt:
        JSR     sim+42          ;do write

chkrwe:
        CMP     #0              ;if not ok
        BEQ     exttro          ;done if zero
;read/write error
rwerrt:
        JSR     errout          ;send error message
        LDA     bdsmvc          ;point to
        LDY     bdsmvc+1        ;bad sector message
        JSR     sndstr          ;and send
        JSR     getcon          ;get input
        CMP     #cr             ;if a cr
        BEQ     ignerr          ;then continue
        JMP     xwboot          ;else abort
ignerr:
        JMP     pcrlf           ;crlf and return
;error output routine
; input:curdrv,pemmvc
; returns:none
; alters:all
errout:
        LDA     pemmvc          ;point to
        LDY     pemmvc+1        ;error message
        JSR     sndstr          ;send it
        LDA     curdrv          ;get drive number
        CLC                     ;add
        ADC     #'A'            ;ascii a
        JMP     sndchr          ;and send it
;get high part of block number if word (zero if byte)
; input:y=index to high,blmode,directory@(bufadd)+subrec
; returns:a=high part of block number
; alters:a,p,mpdrsy iff word
gthibn:
        LDA     #0              ;preset for byte
        BIT     blmode          ;test mode
        BPL     gthiex          ;done if byte
        LDA     (bufadd),y      ;get high
        STY     mpdrsy          ;alter y
gthiex:
        RTS
;get console input
; input:pndkey
; returns:a=character
; alters:all,pndkey
getcon:
        LDA     pndkey          ;get pending
        PHA                     ;save it
        LDA     #0              ;clear
        STA     pndkey          ;pending
        PLA                     ;restore
        BNE     extget          ;exit if not null
        JSR     sim+9           ;else get new

extget:
        RTS                     ;and return
;check keyboard status
;handles <ctl-s> for freeze and <ctl-c> for boot
; input:pndkey
; returns:a=0 if no input or <>0 if input
; alters:all,pndkey
kbdsts:
        LDA     pndkey          ;get pending
        BNE     extkbd          ;if there quit
        JSR     sim+6           ;else test
        CMP     #$00            ;if zero
        BEQ     extkbd          ;exit
        JSR     sim+9           ;else get input
        CMP     #ctls           ;if not freeze
        BNE     newpnd          ;save input
        JSR     sim+9           ;else wait for more
        CMP     #ctlc           ;if not abort
        BNE     nowarm          ;then jump
        JMP     xwboot          ;else do warm boot
nowarm:
        LDA     #0              ;clear
        RTS                     ;and return
newpnd:
        STA     pndkey          ;save
        LDA     #$ff            ;set ready
extkbd:
        RTS                     ;and return
;test character
; input:a=character
; returns:c=0 if control or c=1 if printing
; alters:p
tstchr:
        CMP     #cr             ;if cr
        BEQ     chtext          ;quit
        CMP     #lf             ;if linefeed
        BEQ     chtext          ;quit
        CMP     #ctli           ;if tab
        BEQ     chtext          ;quit
        CMP     #' '            ;see if control
chtext:
        RTS                     ;and return
;send string ending in $
; input:ay=string address
; returns:none
; alters:all,index,sndlpe+1 and +2
sndstr:
        STA     sndlpe+1        ;set pointer
        STY     sndlpe+2
        LDY     #0
sndlpe:
        LDA     $ffff,y         ;get char
        CMP     #'$'            ;if terminator
        BEQ     sndext          ;then exit
        INY                     ;else bump
        STY     index           ;and save
        JSR     sndchr          ;send char
        LDY     index           ;get index
        BNE     sndlpe          ;and loop
sndext:
        RTS                     ;return
;send char to printer if enabled
; input:a=character,lstflg
; returns:a=character
; alters:x,y,p
lstout:
        BIT     lstflg          ;test flag
        BPL     extlst          ;exit if off
        BIT     outflg          ;test output flag
        BMI     extlst          ;done if set
        PHA                     ;save char
        JSR     sim+15          ;send
        PLA                     ;get char
extlst:
        RTS                     ;and done
;output a character
; input:a=character,console definition block in sim
; returns:none
; alters:all,positn
output:
        JSR     tstchr          ;test it
        BCS     sndchr          ;if not control jump
        PHA                     ;else save
        LDA     sysdef+4        ;get invert
        JSR     nolist          ;send to console
        LDA     #'^'            ;get arrow
        JSR     lstout          ;send to printer
        PLA                     ;get character
        ORA     #'A'-1          ;convert to ascii
        JSR     pchrot          ;send to all
        LDA     sysdef+3        ;get normal
        JMP     nolist          ;to console
sndchr:
        CMP     #ctli           ;if not tab
        BNE     pchrot          ;send
tabspc:
        LDA     #' '            ;else get space
        JSR     pchrot          ;send
        LDA     positn          ;get count
        AND     #7              ;if not mod 8
        BNE     tabspc          ;loop
        RTS                     ;else exit
pchrot:
        PHA                     ;save char
        JSR     kbdsts          ;test input
        PLA                     ;restore
        JSR     lstout          ;to printer if on
nolist:
        PHA                     ;save again
        BIT     outflg          ;test flag
        BMI     *+5             ;done if set
        JSR     sim+12          ;to console
        PLA                     ;restore
        INC     positn          ;bump col
        CMP     #' '            ;if space or more
        BCS     extchr          ;is ok
        CMP     sysdef+2        ;also ok
        BEQ     extchr          ;if forward
        DEC     positn          ;else drop back
        CMP     sysdef+0        ;see if bs
        BNE     tryotr          ;branch if not
        DEC     positn          ;else drop again
        BMI     zrocol          ;zero if <0
        RTS                     ;else ok
tryotr:
        CMP     #cr             ;if a cr
        BEQ     zrocol          ;clear col
        CMP     sysdef+7        ;if a formfeed
        BEQ     zrocol          ;also clear
        CMP     sysdef+8        ;if not home
        BNE     extchr          ;then done
zrocol:
        LDA     #0              ;clear
        STA     positn          ;column
extchr:
        RTS                     ;and exit
;go to left and space past prompt
; input:frscol,positn
; returns:none
; alters:positn
spcovr:
        LDA     #cr             ;get cr
        JSR     pchrot          ;send to all
        LDA     #lf             ;send lf
        JSR     lstout          ;only to printer
mreovr:
        LDA     frscol          ;get first
        CMP     positn          ;see if there
        BEQ     extchr          ;done if is
        LDA     sysdef+2        ;get forward
        JSR     nolist          ;send it
        JMP     mreovr          ;and loop
;buffered read
; input:buffer@(addinp)
; returns:none
; alters:all,buffer@(addinp)
bufinp:
        LDA     #0              ;clear
        LDY     #1              ;length
        STA     (addinp),y      ;position in buffer
        STY     bufpsn          ;set point to 1
        LDA     positn          ;get current
        STA     frscol          ;and save
nxtinp:
        JSR     getcon          ;get input
        LDY     bufpsn          ;get index
        CMP     #cr             ;if not a cr
        BNE     notcr           ;then jump
        JMP     endlin          ;else done
notcr:
        CMP     #delete         ;if not delete
        BNE     ntdelt          ;then jump
        CPY     #1              ;else if start
        BEQ     nxtinp          ;then loop
        LDA     (addinp),y      ;get last
        PHA                     ;save char
        LDY     #1              ;point to count
        SEC                     ;set carry
        LDA     (addinp),y      ;get count
        SBC     #1              ;decrement
        STA     (addinp),y      ;then save
        PLA                     ;restore char
        DEC     bufpsn          ;backup pointer
        CMP     #' '            ;if space or more
        BCS     nrmbs           ;just backspace
        CMP     #ctli           ;see if tab
        BNE     ctlbs           ;if not is control
        SEC                     ;set flag
        ROR     outflg
        LDA     positn          ;get position and save
        STA     lstcol
        JSR     spcovr          ;else go back
        JSR     rptlne          ;and retype
        LDA     positn          ;get new last position
        PHA                     ;save on stack
        SEC                     ;subtract to get delta
        LDA     lstcol
        SBC     positn
        STA     lstcol          ;and save
        ASL     outflg          ;clear flag
bstab:
        JSR     dobs            ;do one
        DEC     lstcol          ;drop count
        BNE     bstab           ;loop if more
        PLA                     ;get position
        STA     positn          ;and set
        JMP     nxtinp          ;then loop
ctlbs:
        LDA     sysdef+3        ;get normal
        JSR     chkbs           ;bs if printing
        LDA     sysdef+4        ;same for invert
        JSR     chkbs           ;then delete char itself
nrmbs:
        JSR     dobs            ;do a backspace
        JMP     nxtinp          ;and loop
ntdelt:
        CMP     #ctlp           ;if not ctl-p
        BNE     ntctlp          ;then jump
        LDA     lstflg          ;else get printer flag
        EOR     #$ff            ;complement
        STA     lstflg          ;save
        JMP     nxtinp          ;and loop
ntctlp:
        CMP     #ctlx           ;if not ctl-x
        BNE     ntctlx          ;then jump
        JSR     spcovr          ;restart
        LDA     sysdef+1        ;get clear to eol
        JSR     nolist          ;send it
        JMP     bufinp          ;and start over
ntctlx:
        CMP     #ctlr           ;if not ctl-r
        BNE     ntctlr          ;then jump
        JSR     spcovr          ;restart
        JSR     rptlne          ;retype line
        JMP     nxtinp          ;and start over
ntctlr:
        INY                     ;next position
        STA     (addinp),y      ;store char
        PHA                     ;and save
        STY     bufpsn          ;index
        LDY     #1              ;point to count
        TYA                     ;set a to 1
        CLC                     ;then
        ADC     (addinp),y      ;add count
        STA     (addinp),y      ;and save
        PLA                     ;restore char
dontsv:
        JSR     output          ;send char
        LDY     bufpsn          ;get index
        LDA     (addinp),y      ;get char
        CMP     #ctlc           ;if not ctl-c
        BNE     ignrcc          ;ignore
        LDY     #1              ;get count
        LDA     (addinp),y      ;from buffer
        CMP     #1              ;if not at start
        BNE     ignrcc          ;ignore
        JMP     xwboot          ;else do warm boot
ignrcc:
        LDY     #1              ;get
        LDA     (addinp),y      ;count
        DEY                     ;point to max
        CMP     (addinp),y      ;if length
        BCS     lineen          ;at max jump
        JMP     nxtinp          ;else loop
lineen:
        LDA     #cr             ;get a cr
endlin:
        JMP     pchrot          ;and send
;cr and lf
pcrlf:
        LDA     #cr             ;then a
        JSR     pchrot          ;cr
        LDA     #lf             ;and a
        JMP     pchrot          ;lf
;retype line
rptlne:
        LDA     bufpsn          ;save point
        STA     numcnt          ;as count
        LDA     #1              ;start position
        PHA                     ;save
mrerpt:
        PLA                     ;get position
        DEC     numcnt          ;count down
        BNE     *+3             ;continue if more
        RTS                     ;else done
        TAY                     ;else make index
        INY                     ;and bump
        TYA                     ;save
        PHA                     ;on stack
        LDA     (addinp),y      ;get char
        JSR     output          ;send
        JMP     mrerpt          ;and loop
;check for printing and backspace if needed
chkbs:
        CMP     #' '            ;compare to space
        BCC     extdec          ;not printing so done
;do a backspace
dobs:
        LDA     sysdef+0        ;get backspace
        PHA                     ;save it
        JSR     nolist          ;send
        LDA     #' '            ;get space
        JSR     nolist          ;send
        PLA                     ;get backspace
        JMP     nolist          ;send it
;test for decimal digit
;if decimal then c=0 else c=1
tstdec:
        CMP     #'0'            ;if under 0
        BCC     notdec          ;then not decimal
        CMP     #'9'+1          ;if 9 or under is ok
        BCC     extdec
notdec:
        SEC                     ;else not a match
extdec:
        RTS
;test for hexadecimal digit
;if hex then c=0 else c=1
tsthex:
        JSR     tstdec          ;first try decimal
        BCC     extdec          ;ok if dec
        CMP     #'A'            ;if under A
        BCC     notdec          ;then not hex
        CMP     #'F'+1          ;set c in F compare
        RTS
;bump load address by 128 and return in ay
adjdb:
        LDA     dskbuf          ;get old
        LDY     dskbuf+1        ;address
        CLC                     ;and bump
        ADC     #128            ;by 128
        STA     dskbuf          ;save low
        BCC     *+6             ;then bump
        INY                     ;and save
        STY     dskbuf+1        ;high as needed
        RTS
;move record from disk buffer to default buffer
mv128:
        LDA     dskbuf          ;get address
        LDY     dskbuf+1
        STA     mvfrom+1        ;and set pointer
        STY     mvfrom+2
        LDX     #0              ;clear index
mvfrom:
        LDA     $ffff,x         ;get byte
        STA     dflbuf,x        ;move it
        INX
        BPL     mvfrom          ;loop until done
        RTS

;relocatable vectors
        .BYTE   $4c
extevc:
        .WORD   extexq-1
        .BYTE   $4c
sltmvc:
        .WORD   sltmsg
        .BYTE   $4c
empdvc:
        .WORD   empty
        .BYTE   $4c
rommvc:
        .WORD   romsg
        .BYTE   $4c
bdsmvc:
        .WORD   bdsmsg
        .BYTE   $4c
pemmvc:
        .WORD   pemmsg
        .BYTE   $4c
dcbevc:
        .WORD   dcb
;relocation stopper
        .BYTE   $ff
;messages
romsg:
        .BYTE   " - R/O$"
bdsmsg:
        .BYTE   " - BAD SECTOR"
        .BYTE   cr,lf,"<RET> TO IGNORE -- <OTHER> "
        .BYTE   "TO ABORT$"
pemmsg:
        .BYTE   cr,lf,"PEM ERROR ON $"
sltmsg:
        .BYTE   " - INVALID DRIVE$"

;dummy fcb
empty:
        .BYTE   $e5
;zero page switch enable table
swctbl:
        .BYTE   0,0,0,0,0,0,0,0
        .BYTE   0,0,1,0,0,1,1,1
        .BYTE   1,1,1,1,1,1,1,1
        .BYTE   0,0,1,0,0,0,0,0
        .BYTE   0,0,0,0
;bit mask table
bitmsk:
        .BYTE   128,64,32,16,8,4,2,1
;bit map table
bitmap:
        .BYTE   1,2,4,8,16,32,64,128
;extent mask table (also uses 3 bytes in sabtbl
exmtbl:
        .BYTE   0,1,3
;sab table
sabtbl:
        .BYTE   7,15,31,63,127
;variable storage
skpdir:
        .BYTE   0               ;positive if no change
fcbind:
        .BYTE   0               ;index to block number
savext:
        .BYTE   0               ;save extent
frscol:
        .BYTE   0               ;first col
pndkey:
        .BYTE   0               ;pending input
lstflg:
        .BYTE   0               ;printer flag
positn:
        .BYTE   0               ;print position
swcflg:
        .BYTE   0               ;zero page switch flag
bytinp:
        .WORD   0               ;input value
cmdinp:
        .BYTE   0               ;input command
addout:
        .WORD   0               ;output address
bytout          = addout        ;output value
bufpsn:
        .BYTE   0               ;input buffer position
exrwfl:
        .BYTE   0               ;extend flag
tmpdrv:
        .BYTE   0               ;temporary drive number
;align xqtvec on word boundary
        .ALIGN  2
xqtvec:
        .WORD   0               ;command vector
countr:
        .WORD   0               ;record counter
        .BYTE   0               ;overflow
lkdown:
        .WORD   0               ;down pnt. for block search
lookup:
        .WORD   0               ;up pnt. for block search
olddrv:
        .BYTE   0               ;old drive number
curdrv:
        .BYTE   0               ;current drive
lginvc:
        .BYTE   0               ;log in status
ronlst:
        .BYTE   0               ;read write status
dirnum:
        .WORD   0               ;directory number
subrec:
        .BYTE   0               ;directory offset
recnum:
        .WORD   0               ;record number
blknum          = recnum        ;block number
        .BYTE   0               ;overflow
chrcnt:
        .BYTE   0               ;character count
cmppnt:
        .BYTE   0               ;comparison pointer
nxtrec:
        .BYTE   0               ;next record
numrec:
        .BYTE   0               ;number records
dirrec:
        .WORD   0               ;directory record
dirmod:
        .BYTE   0               ;directory mod 4
index:
        .BYTE   0               ;buffer index
numcnt:
        .BYTE   0               ;counter
outflg:
        .BYTE   0               ;output enable flag
lstcol:
        .BYTE   0               ;last column
mpdrsy:
        .BYTE   0               ;save for y in mapdir
mpdrtm:
        .BYTE   0               ;temp in mapdir
blmode:
        .BYTE   0               ;<128 if byte else word
maxdrc:
        .WORD   0               ;max directory record
sab:
        .BYTE   0               ;mask for block
sxb:
        .BYTE   0               ;shift for block
rtclk:
        .BYTE   0,0,0           ;real time clock
gpcnt:
        .WORD   0               ;gp counter
trkctr:
        .BYTE   0               ;track counter
;following region is used to capture dcb
dcb:
maxblk:
        .WORD   0               ;maximum block number
sectrk:
        .WORD   0               ;sectors per track
nsystr:
        .WORD   0               ;number system tracks
blkscd:
        .BYTE   0               ;block size code
maxdir:
        .WORD   0               ;maximum directory number
alcmap:
        .WORD   0               ;address of allocation map
chkflg:
        .BYTE   0               ;check flag
chkmap:
        .WORD   0               ;address of checksum map
pemwrtype:
        .BYTE   0               ;write type 0=norm,1=dir,2=unalloc
exm:
        .BYTE   0               ;extent mask
cexm1f:
        .BYTE   0               ;exm complemented and 1f
;zero page save block
varblk:
lowin:
        .WORD   0
        .WORD   0               ;save bufadd
        .WORD   0               ;save alcpnt
        .WORD   0               ;save chkpnt
