;
; File generated by cc65 v 2.18 - Ubuntu 2.19-1
;
	.fopt		compiler,"cc65 v 2.18 - Ubuntu 2.19-1"
	.setcpu		"65SC02"
	.smart		on
	.autoimport	on
	.case		on
	.debuginfo	off
	.importzp	sp, sreg, regsave, regbank
	.importzp	tmp1, tmp2, tmp3, tmp4, ptr1, ptr2, ptr3, ptr4
	.macpack	longbranch
	.forceimport	__STARTUP__
	.import		_cputc
	.import		_cputs
	.export		_main

.segment	"RODATA"

L0005:
	.byte	$0A,$0D,$49,$20,$6D,$65,$61,$6E,$2C,$20,$48,$65,$6C,$6C,$6F,$20
	.byte	$57,$6F,$72,$6C,$64,$21,$20,$0A,$0D,$00

; ---------------------------------------------------------------
; int __near__ main (void)
; ---------------------------------------------------------------

.segment	"CODE"

.proc	_main: near

.segment	"CODE"

	lda     #$68
	jsr     _cputc
	lda     #<(L0005)
	ldx     #>(L0005)
	jsr     _cputs
	ldx     #$00
	txa
	rts

.endproc

