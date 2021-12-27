	.org $0000
	LD	A,$00
LOOP:
	OUT	($78),A		; RAM MPCL
	OUT	($7C),A		; ROM MPCL
	JR	LOOP
	.end

