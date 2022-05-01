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

.include "dosdefn.asm" 		; base addresses and definitions

; for Nhyodyne:
; RAM BANK $0C is RAM area for Drivers
; RAM BANK $0E is operating bank for DOS/65 $8000-$FFFF
; RAM BANK $0F is fixed bank $0000-$7FFF
; ROM BANKS $00 and $0C-$0F are reserved for ROMWBW code

		.PC02
                .segment "OS"
		.ORG $D000
		.include "ccmnhy.asm"
		.include "pemnhy.asm"
		.include "simnhy.asm"

	.end
