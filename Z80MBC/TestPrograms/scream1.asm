; UART 16C550 SERIAL
UART0:       .EQU    $68            ; DATA IN/OUT
UART1:       .EQU    $69            ; CHECK RX
UART2:       .EQU    $6A            ; INTERRUPTS
UART3:       .EQU    $6B            ; LINE CONTROL
UART4:       .EQU    $6C            ; MODEM CONTROL
UART5:       .EQU    $6D            ; LINE STATUS
UART6:       .EQU    $6E            ; MODEM STATUS
UART7:       .EQU    $6F            ; SCRATCH REG.

	.ORG	$0000



;******************************************************************
;        INIT_UART                                                ;
;        Function....: Init serial port  8250, 16C450, OR 16C550  ;
;                      9600 Baud, 8 bit, 1 stopbit, 0 parity      ;
;        Output......:                                            ;
;        call........: PAUSE                      test 2 Feb 2007 ;
;******************************************************************
INIT_UART:   LD     A,$AA
             OUT    (UART7),A
             IN     A,(UART7)
             CP     $AA           ; TEST IF YOU COULD STORE AA
             JP     NZ,INITUART_FAIL  ; IF NOT, THE UART CAN'T BE FOUND
             LD     A,$55
             OUT    (UART7),A     ; 
             IN     A,(UART7)
             CP     $55           ; 
             JP     NZ,INITUART_FAIL
             LD     A,$01
             JP     UART_OK

INITUART_FAIL:                      ; Handle if initialize UART fails
             LD     A,1
             HALT


UART_OK:
	     LD     A,$80
             OUT    (UART3),A     ; SET DLAB FLAG
             LD     A,12          ; = 1,843,200 / ( 16 x 9600 )
             OUT    (UART0),A     ; Set BAUD rate til 9600
             LD     A,$00
             OUT    (UART1),A     ; Set BAUD rate til 9600
             LD     A,$03
             OUT    (UART3),A     ; Set 8 bit data, 1 stopbit
	
 
MAIN:
	LD	A,$00	; SELECT FIRST SERIAL PORT
	LD	B,$30	; LOAD "0" CHARACTER TO PRINT IN REGISTER B

TX_BUSYLP:   IN     A,(UART5)     ; READ Line Status Register
             BIT    5,A           ; TEST IF UART IS READY TO SEND
             JP     Z,TX_BUSYLP   ; IF NOT REPEAT

             HALT                 ; TEST IF OUTER LOOP EXECUTING

             LD     A,B
             OUT    (UART0),A      ; THEN WRITE THE CHAR TO UART

	
	JP	MAIN	; REPEAT FOREVER


	.END

