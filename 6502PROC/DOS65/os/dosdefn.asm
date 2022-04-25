;________________________________________________________________________________________________________________________________
;
;	Nhyodyne dos/65 base addresses and definitions
;
;  DWERNER 04/24/2022 	Initial
;________________________________________________________________________________________________________________________________

;base addresses and definitions
btejmp	=	$100		;warm boot jump
pemjmp	=	$103		;jump to pem
iostat	=	$106		;i/o status
dflfcb	=	$107		;default fcb
dflbuf	=	$128		;default buffer
memmovr =	$200		;subr to move data from ram/rom disks
tea	=	$800		;tea start

;zero page for setup
trknum	=	$02			;current track
dcbadd	=	$04			;dcb address
nmsstr	=	$06			;number system tracks
nsectr	=	$08			;number sectors per track
ttlsec	=	$0A			;total sectors to write
trkcnt	=	ttlsec
size	=	$0B			;ascii size
lokim	=	$0D			;low kim limit
hikim	=	$0F			;high kim limit
offset	=	$11			;relocation offset
kimcnt	=	$13			;kim counter
pointr	=	$14			;pointer
lengt	=	$16			;inst length
point	=	$17			;relocate pointer
adjust	=	$19			;relocate distance
kimpnt	=	$1B			;kim file index
savex	=	$1C			;save for x
savey	=	$1D			;save for y
number	=	$1E			;input pack buffer
dstdrv	=	$20			;destination drive
defalt	=	$21			;default drive
seccnt	=	$22			;sector count
secnum	=	$24			;sector number
curccm	=	$26			;start of current ccm
simlng	=	$28			;length of sim
room	=	$2A			;memory needed for sysgen
stksav	=	$2C			;save stack register
frstsc	=	$2D			;first sector number of disk
dskcfpc	=	$2E			;pointer to disk configuration table
cmdlnp	=	$30			;pointer to command line buffer
farfunct=       $32                     ;function to call in driver area
farpointer=     $33                     ;WORD POINTER to call in driver area
lastzp	=	$35
;fixed parameters
lf	=	$a		;linefeeed
cr	=	$d		;return
eof	=	$1a		;end of file
null	=	0		;null
ctlc	=	3		;abort
ctle	=	5		;physical cr lf
ctli	=	9		;tab character
ctlp	=	$10		;toggle printer
ctlr	=	$12		;repeat line
ctls	=	$13		;freeze
ctlx	=	$18		;cancel
semico	=	$3b		;semicolon
delete	=	$08		;delete character
numcmd	=	36		;number commands

BANKED_DRIVER_DISPATCHER=$8800  ; LOCATION OF DRIVER DISPATCHER
DEBUG	=	0		; assemble with debug information on
