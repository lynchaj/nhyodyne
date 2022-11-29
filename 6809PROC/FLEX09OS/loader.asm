    PRAGMA CD

;__LOADER_______________________________________________________
;
; This is a module that will wrap flex09 in a cp/m .COM program
; that will launce FLEX09 on the 6809 board.
;
;_______________________________________________________________


; this is Z80 code that is used to be able to run this as a .COM file.  It is truncated
; when the various .HEX files are generated
;
              ORG	$C3E0
		FCB		$F3 				;DI - DISABLE INTERRUPTS
		FCB		$01,$00,$3C    		;LD	BC,$3C00 -BYTES TO MOVE
		FCB		$11,$00,$44    		;LD	DE,$4400 -DESTINATION ADDRESS (6809 IS !A15)
		FCB		$21,$20,$01	    	;LD	HL,$0120 -SOURCE ADDRESS
		FCB		$ED,$B0       		;LDIR  		 -COPY RAM
		FCB		$DB,$F0       		;IN 	A,$F0    -ENABLE 6809
		FCB		$0E,$00       		;LD	C,00H    -CP/M SYSTEM RESET CALL
		FCB		$CD,$05,$00			;CALL	0005H	 -RETURN TO PROMPT
;
;
;

		END
