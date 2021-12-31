PEM	        =	$103		;PEM ENTRY


; void cputc (char c);
;
        .PC02
        .export         _cputc
        .export         gotoxy

; Plot a character -- also used as an internal function
_cputc:
        	LDX	#2		        ; print char
	        JSR	PEM
                rts

gotoxy:
                rts
