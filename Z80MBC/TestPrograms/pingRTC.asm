	.org $0000
	LD	A,$00
LOOP:	OUT	($70),A
	JR	LOOP
	.end

