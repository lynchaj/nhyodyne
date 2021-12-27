	.org $0000
	LD	A,%00000011
LOOP:	OUT	($70),A	; turn on USERLED0 and USERLED1
	JR	LOOP
	.end

