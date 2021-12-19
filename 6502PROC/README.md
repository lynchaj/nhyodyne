# MBC65C02
65C02 processor board (hardware and software) for the Nhyodyne computer system

# JUMPER SETTINGS
## General
        J1 - Enable
                1&2 Only CPU
                2&3 Secondary CPU

        J2 - Clock Divider
                1&2 CLK/2
                3&4 CLK/4
                5&6 CLK/8
                7&8 CLK/16
                9&10 CLK

        J4 - Reset
                1&2 Only CPU
                2&3 Secondary CPU

        JP1 - External Reset Switch

        SW1 - IO Page select
                This maps the IO addresses $00-$FF into the 6502 memory space.  Note that
                the 6502 has address line A15 inverted in order to maintain compatibility
                with the Nhyodyne ROM and RAM cards.   Therefore the MSB (SW8) is inverted.  Most test applications for this board expect an IO page of $03 ($0300-$03FF).Leading to a default setting of:
                1-off
                2-off
                3-on
                4-on
                5-on
                6-on
                7-on
                8-off

        SW2 - Reset

        SW2 - 6502 toggle address
                This setting sets the IO port that toggles the 6502 in and out of control when it is a secondary CPU.  When it is the only CPU in the system this setting has no effect. Most test applications for this board expect an IO address of $FF ($0300-$03FF).   Reading this IO port will toggle the 6502 active/inactive.
                Leading to a default setting of:
                1-off
                2-off
                3-off
                4-off
                5-off
                6-off
                7-off
                8-off



#BOM

"Ref"|"Value"|"Part"|
--- | --- | ---
"C1"|	"10u"|	"Electrolytic Capacitor"
"C2"|	"0.1u"|	"Capacitor"
"C3"|	"0.1u"|	"Capacitor"
"C4"|	"0.1u"|	"Capacitor"
"C5"|	"0.1u"|	"Capacitor"
"C6"|	"0.1u"|	"Capacitor"
"C7"|	"0.1u"|	"Capacitor"
"C8"|	"0.1u"|	"Capacitor"
"C9"|	"0.1u"|	"Capacitor"
"C10"|	"0.1u"|	"Capacitor"
"C11"|	"0.1u"|	"Capacitor"
"C12"|	"10u"|	"Electrolytic Capacitor"
"C13"|	"10u"|	"Electrolytic Capacitor"
"C14"|	"0.1u"|	"Capacitor"
"D1"|	"1N4148"|	"Diode"
"D2"|	"POWER"|	"LED"
"D3"|	"VP"|	"LED"
"D4"|	"ML"|	"LED"
"D5"|	"INT"|	"LED"
"D6"|	"NMI"|	"LED"
"D7"|	"6502"|	"LED"
"J1"|	"6502 ONLY"|	"Pin header 01x03"
"J2"|	"CLOCK DIVIDER"|	"Pin header 02x05"
"J3"|	"MBC Bus Connector"|	"Pin header Right Angle 02x25"
"J4"|	"6502 RESET"|	"Pin header 01x03"
"JP1"|	"RESET"|	"Pin header 0x02"
"R1"|	"10"|	"Resistor"
"R2"|	"10K"|	"Resistor"
"R3"|	"470"|	"Resistor"
"R4"|	"470"|	"Resistor"
"R5"|	"470"|	"Resistor"
"R6"|	"470"|	"Resistor"
"R7"|	"470"|	"Resistor"
"R8"|	"470"|	"Resistor"
"RN1"|	"4700"|	"Resistor Network 09"
"RN2"|	"1K"|	"Resistor Network 08"
"RN3"|	"1K"|	"Resistor Network 08"
"SW1"|	"IO PAGE SELECT"|	"Switch DIP x08"
"SW2"|	"RESET"	|"Switch Push"
"SW3"|	"IO ADDRESS SELECT"|	"Switch DIP x08"
"U1"|	"74LS93"|	"74LS93"
"U2"|	"74LS244"|	"74LS244"
"U3"|	"74LS07"|	"74LS07"
"U4"|	"74LS04"|	"74LS04"
"U5"|	"74LS688"|	"74LS688"
"U6"|	"W65C02SxP"|	"65C02 WDC or Rockwell"
"U7"|	"74LS245"|	"74LS245"
"U8"|	"74LS244"|	"74LS244"
"U9"|	"74LS688"|	"74LS688"
"U10"|	"74LS244"|	"74LS244"
"U11"|	"74LS74"|	"74LS74"
"U12"|	"74LS32"|	"74LS32"

#SOFTWARE
;__HI___________________________________________________________
;
; This is a quick program that can be uploaded to the MBC from
; Z80 mode.  It will print a "Hi" to the UART then return control
; to the Z80.  It does not require the stack to be available and
; is pretty much the simplest code imaginable. :)
;
; This requires the SBC is secondary to a Z80.
; hi.hex file can be loaded from the monitor. Ensure that jumpers J1 and J2
; are set for 2&3, the 6502 toggle IO address is set for $FF and
; the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
; To run from the MBC Z80 monitor
;
; first set the MPCL to allow RAM in the low bank
; >O 7C 80
; >O 78 80
;
; then load the .HEX file.
; >L
;
;
; Finally transfer control to the 65C02 by reading the toggle register
; >I FF
;
; The '02 should reset run this program and return to the Z80 monitor
;
; From CP/M, you can simply execute the hi.com program.
;_______________________________________________________________
;__MONITOR_______________________________________________________
; This is a simple monitor program that can be uploaded to the MBC
; from Z80 mode.
;
; It assumes that the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
; If the SBC is the only CPU in the system, ensure that jumpers
; J1 and J2 are set for 1&2.   Then burn monrom.hex into EPROM.
; (note that this monitor does not initialize the UART yet, so this is broken at the moment)
;
; If the SBC is secondary to a Z80, the monitor.com file can be run from CP/M or the
; monitor.hex file can be loaded from the monitor. Ensure that jumpers J1 and J2
; are set for 2&3, the 6502 toggle IO address is set for $FF and
; the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
;
; to run from the MBC Z80 monitor
;
; first set the MPCL to allow RAM in the low bank
; >O 7C 80
; >O 78 80
;
; then load the .HEX file.
; >L
;
;
; Finally transfer control to the 65C02 by reading the toggle register
; >I FF
;
; The '02 should reset and run this program
;
;__________________________________________________________________________________________________
;__SCREAM_______________________________________________________
;
; This is a quick program that can be put on a ROM to test the
; 65C02 board in "stand alone" mode.  This mode assumes it is the
; only CPU board in the MBC system and will a continuous stream of "A"
; to the UART. It does not require the stack to be available and
; is pretty much the simplest code imaginable. :)
;
; It assumes that the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
;
; If the SBC is the only CPU in the system, ensure that jumpers
; J1 and J2 are set for 1&2.   Then burn scrmrom.hex into EPROM.
;
; If the SBC is secondary to a Z80, the scrm.com file can be run from CP/M or the
; scream.hex file can be loaded from the monitor. Ensure that jumpers J1 and J2
; are set for 2&3, the 6502 toggle IO address is set for $FF and
; the 65C02 board is set for IOPage 03.
; remember that bit A15 is inverted on the board so the dip switch is set to $83.
;
; ** Note that this program will change the baud rate to 9600.
;
;
; to run from the MBC Z80 monitor
;
; first set the MPCL to allow RAM in the low bank
; >O 7C 80
; >O 78 80
;
; then load the .HEX file.
; >L
;
;
; Finally transfer control to the 65C02 by reading the toggle register
; >I FF
;
; The '02 should reset and run this program
;
;_______________________________________________________________

##MONITOR

 		.BYTE "REGISTER",0,<DO_PRINT_REG,>DO_PRINT_REG
 		.BYTE "DUMP",0,<DUMP,>DUMP
 		.BYTE "ENTER",0,<ENTERMEM,>ENTERMEM
 		.BYTE "GO",0,<GO,>GO
 		.BYTE "LOAD",0,<LOAD,>LOAD
 		.BYTE "Z80",0,<Z80,>Z80
		.BYTE "DISASSEMBLE",0,<DISASSEMBLE,>DISASSEMBLE
		.BYTE "ASSEMBLE",0,<ASSEMBLE,>ASSEMBLE
		.BYTE 01,0
