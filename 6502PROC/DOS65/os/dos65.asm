;sysgen
;version 2.15-a
;released:	30 november 1985 (2.10)
;last revised:	2 may 1996 (2.11)
;			eliminated word mode for 1024 blocks
;			made extent a single byte
;		3 may 1996 (2.12)
;			added initial exm related code
;		11 may 1996 (2.13)
;			added use of exm in getblk
;			added code to set exm & cexm1f
;			corrected errors
;		19 may 1996 (2.14)
;			changed ccm ren to "to from" syntax
;			allowed _ in file names
;		13 march 2008 (2.15)
;			reformatted for TASM & ASM210+
;			eliminated dependence on "IBM" format
;			  by reading first sector # using SIM+51
;			  TRANSLATE code. If translate
;			  does not have first physical sector in first
;			  position this approach may not work.
;			  SIM can also perform no translation at all.
;			  Also assumes BOOT & SIM both know correct
;			  starting sector for cold & warm boot. It
;			  should work regardless of physical sector
;			  size as long as existing SIM is configured
;			  correctly for destination drive. BOOT
;			  must correctly handle sectors > 128 bytes
;			  as must WARM BOOT in SIM.
;			  In any case BOOT and WARM BOOT must
;			  read sectors in sequential order, i.e.,
;			  no interleave.
;this program contains the complete dos/65 operating
;system except for the boot and sim.
;when used by the system operator this program
;provides the capability to construct a new
;operating system including the users boot and sim.
;the system is relocated to fit the memory size
;specified by the user and is written onto
;the system tracks of the specified drive.
;improvements over version 2.0 include:
;	use of "from to" syntax for ren
;	addition of go command
;	addition of load command
;	ability to enter numbers as decimal or hex
;	address parameter added to save
;	error checking in sysgen (write)
;	write type for deblocking added
;	page zero 0 & 1 not used
;	allow _ in file names
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
lastzp	=	$32
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

DEBUG	=	0		; assemble with debug information on

; for Nhyodyne:
; RAM BANK $0C is RAM area for Drivers
; RAM BANK $0D is RAM area for Drivers
; RAM BANK $0E is operating bank for DOS/65 $8000-$FFFF
; RAM BANK $0F is fixed bank $0000-$7FFF
; ROM BANKS $00 and $0C-$0F are reserved for ROMWBW code

 		.segment "LOADER"
		.ORG $b7E0
		.BYTE 		$F3 			;DI - DISABLE INTERRUPTS
		.BYTE 		$01,$00,$48    		;LD	BC,$3E00 -BYTES TO MOVE
		.BYTE 		$11,$00,$38    		;LD	DE,$3800 -DESTINATION ADDRESS (6502 IS !A15)
		.BYTE 		$21,$20,$01	    	;LD	HL,$0120 -SOURCE ADDRESS
		.BYTE 		$ED,$B0       		;LDIR  	-COPY RAM
		.BYTE 		$21,$FC,$7F	    	;LD	HL,$7FFC -VECTOR
		.BYTE		$3E,<boot		;LD 	A,<BOOT
		.BYTE 		$77			;LD 	(HL),A
		.BYTE 		$21,$FD,$7F	    	;LD	HL,$7FFD -VECTOR
		.BYTE		$3E,>boot		;LD 	A,<BOOT
		.BYTE 		$77			;LD 	(HL),A
		.BYTE		$DB,$FF       		;IN 	A,$FF    -ENABLE 6502
;
;
		.PC02
                .segment "OS"
		.ORG $B800
		.include "ccmnhy.asm"
		.include "pemnhy.asm"
		.include "simnhy.asm"

	.end
