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



# BOM

Ref|Value|Part|
--- | --- | ---
C1|	10u|	Electrolytic Capacitor
C2|	0.1u|	Capacitor
C3|	0.1u|	Capacitor
C4|	0.1u|	Capacitor
C5|	0.1u|	Capacitor
C6|	0.1u|	Capacitor
C7|	0.1u|	Capacitor
C8|	0.1u|	Capacitor
C9|	0.1u|	Capacitor
C10|	0.1u|	Capacitor
C11|	0.1u|	Capacitor
C12|	10u|	Electrolytic Capacitor
C13|	10u|	Electrolytic Capacitor
C14|	0.1u|	Capacitor
C15|	0.1u|	Capacitor
C16|	0.1u|	Capacitor
D1|	1N4148|	Diode
D2|	POWER|	LED
D3|	VP|	LED
D4|	ML|	LED
D5|	INT|	LED
D6|	NMI|	LED
D7|	6502|	LED
J1|	6502 ONLY|	Pin header 01x03
J2|	CLOCK DIVIDER|	Pin header 02x05
J3|	MBC Bus Connector|	Pin header Right Angle 02x25
J4|	6502 RESET|	Pin header 01x03
JP1|	RESET|	Pin header 0x02
R1|	10|	Resistor
R2|	10K|	Resistor
R3|	470|	Resistor
R4|	470|	Resistor
R5|	470|	Resistor
R6|	470|	Resistor
R7|	470|	Resistor
R8|	470|	Resistor
RN1|	4700|	Resistor Network 09
RN2|	1K|	Resistor Network 08
RN3|	1K|	Resistor Network 08
SW1|	IO PAGE SELECT|	Switch DIP x08
SW2|	RESET	|Switch Push
SW3|	IO ADDRESS SELECT|	Switch DIP x08
U1|	74LS93|	74LS93
U2|	74LS244|	74LS244
U3|	74LS07|	74LS07
U4|	74LS04|	74LS04
U5|	74LS688|	74LS688
U6|	W65C02SxP|	65C02 WDC or Rockwell
U7|	74LS245|	74LS245
U8|	74LS244|	74LS244
U9|	74LS688|	74LS688
U10|	74LS244|	74LS244
U11|	74LS74|	74LS74
U12|	74LS32|	74LS32
U13|	74LS04|	74LS04

# SOFTWARE
### HI
This is a quick program that will print a "Hi" message to the UART then return control to the Z80.  It does not require the stack to be available and is pretty much the simplest code imaginable. :)   "Hi" requires that the UART is properly initialized.

This requires the SBC to be secondary to a Z80 SBC.

the HI.hex file can be loaded from the monitor. Ensure that jumpers J1 and J4 are set for 2&3, the 6502 toggle IO address is set for $FF and the 65C02 board is set for IOPage 03.
        * remember that bit A15 is inverted on the board so the dip switch is set to $83.


To run from the MBC Z80 monitor

first set the MPCL to allow RAM in the low bank
```
>O 7C 80
>O 78 80
```
Then load the .HEX file.
```
>L
```

Finally transfer control to the 65C02 by reading the toggle register
```
>I FF
```


### MONITOR
This is a simple monitor program, see the "monitor" section of this document for usage instructions. "Monitor" requires that the UART is properly initialized.

It assumes that the 65C02 board is set for IOPage 03.
        * remember that bit A15 is inverted on the board so the dip switch is set to $83.

If the SBC is the only CPU in the system, ensure that jumpers J1 and J4 are set for 1&2, then burn monrom.hex into EPROM. (note that this monitor does not initialize the UART yet, so this is broken at the moment)


If the SBC is secondary to a Z80, the monitor.com file can be run from CP/M or the monitor.hex file can be loaded from the monitor. Ensure that jumpers J1 and J4 are set for 2&3, the 6502 toggle IO address is set for $FF and the 65C02 board is set for IOPage 03.
        * remember that bit A15 is inverted on the board so the dip switch is set to $83.


To run from the MBC Z80 monitor

first set the MPCL to allow RAM in the low bank
```
>O 7C 80
>O 78 80
```
Then load the .HEX file.
```
>L
```

Finally transfer control to the 65C02 by reading the toggle register
```
>I FF
```

### SCREAM
This is a quick program that can be put on a ROM to test the 65C02 board. It will output a continuous stream of "A" at 9600 baud from the UART. It does not require the stack to be available and is pretty much the simplest code imaginable. :)
"SCREAM" initializes the UART for 9600,n,8,1.

It assumes that the 65C02 board is set for IOPage 03.
        * remember that bit A15 is inverted on the board so the dip switch is set to $83.

If the SBC is the only CPU in the system, ensure that jumpers J1 and J4 are set for 1&2, then burn scrmrom.hex into EPROM.

If the SBC is secondary to a Z80, the scrm.com file can be run from CP/M or the scream.hex file can be loaded from the monitor. Ensure that jumpers J1 and J4 are set for 2&3, the 6502 toggle IO address is set for $FF and the 65C02 board is set for IOPage 03.
        * remember that bit A15 is inverted on the board so the dip switch is set to $83.

 ** Note that this program will change the baud rate to 9600.


To run from the MBC Z80 monitor

first set the MPCL to allow RAM in the low bank
```
>O 7C 80
>O 78 80
```
Then load the .HEX file.
```
>L
```

Finally transfer control to the 65C02 by reading the toggle register
```
>I FF
```

The '02 should reset and run this program


## MONITOR Program

Monitor is a simple machine language monitor that will allow you to view and manipulate the 6502 operating environment.

Monitor Supports the following Commands:

```
        * REGISTER - Display the 6502 internal Registers
 	* DUMP XXXX YYYY - Dump memory from XXXX to YYYY
 	* ENTER XXXX YY  - update the ram at XXXX with value YY
        * GO XXXX - Execute program at XXXX
        * LOAD - Load a S19 file into RAM
        * Z80 - return to Z80 mode
        * DISASSEMBLE XXXX - Disassemble program at XXXX
	* ASSEMBLE XXXX - Begin Assembling a program from XXXX
```

# DOS65
        TODO: Real DOS/65 docs -- this is here as a reminder

        DOS/65 is provided as the operating system for the Nhyodyne 65C02 board

        The CP/M program DOS65.com will load DOS/65 and transition control from Z80 CP/M to 65c02 DOS/65.

        DOS/65 will recognize Old style ROMWBW slices and CP/M images.
        Rather than running .COM files, DOS/65 will run .CO6 files.

        currently DOS/65 supports PPIDE, serial, and DSKYNG devices

        DOS/65 utility programs:
        CPM.CO6 - return control to the Z80 and Boot CPM into a sane state.
        ASSIGN.CO6 - dynamically adjust drive mapping
        SEDIT.CO6 - Text editor (only partially working)
        DBASIC.CO6 - ehBasic for DOS/65

        The following utilities are from the DOS/65 distribution and are documented in the DOS/65 documentation.
        alloc.CO6 - DOS/65 drive utility
        compare.CO6- DOS/65 compare utility
        debug.CO6- DOS/65 debugger
        edit.CO6- DOS/65 line editor
        asm.CO6- DOS/65 assembler
        bcompile.CO6- DOS/65 Basic-E compiler
        copy.CO6- DOS/65 file copy utility
        run.CO6- DOS/65 Basic-E run time

# Items left on the DOS/65 To Do list:
        * clean up the make file
        * correct bugs in sedit
        * get autodetection of new/old slices working and decline to mount new
        * Hardware support for RTC
        * Hardware support for Floppy Drive
        * Hardware Support for VDC/Keyboard
        * Hardware support for Dual Serial