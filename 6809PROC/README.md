# MBC6809
6809 processor board (hardware and software) for the Nhyodyne computer system

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
                This maps the IO addresses $00-$FF into the 6809 memory space.  Note that
                the 6809 has address line A15 inverted in order to maintain compatibility
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

        SW2 - 6809 toggle address
                This setting sets the IO port that toggles the 6809 in and out of control when it is a secondary CPU.  When it is the only CPU in the system this setting has no effect. Most test applications for this board expect an IO address of $FF ($0300-$03FF).   Reading this IO port will toggle the 6809 active/inactive.
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
5|C1, C2, C16, C17, C18|10uf Electrolytic
11|C3, C4, C5, C6, C7, C8, C9, C10, C12, C13, C14|0.1uf
1|D1|1N4148
1|D2|LED
1|D3|LED
1|D4|LED
1|D5|LED
1|D6|LED
1|D7|LED
1|J1|Header 1x3  (Right Angle)
1|J2|Header 2x4  (Right Angle)
1|J3|Header 1x3  (Right Angle)
1|J4|Header 2x25 (Right Angle)
1|JP1|Header 1x2  (Right Angle)
1|R1|10ohm
1|R2|10Kohm
5|R3, R4, R5, R6, R13|1Kohm
6|R7, R8, R9, R10, R11, R12|470ohm
1|RN1|4700ohm Bussed 9 resistors
2|RN2, RN3|1Kohm Bussed 8 resistors
1|RN4|2.2kohm Bussed 9 resistors
1|SW1|8 pos dip switch
1|SW2|Tact Switch
1|SW3|8 pos dip switch
1|U1|74LS93
3|U2, U12, U13|74LS244
1|U3|74LS00
2|U4, U11|74LS688
1|U6|74LS07
1|U7|74LS04
1|U8|74LS74
1|U9|74LS245
1|U10|MC6809 (or 68B09 preferred)


# SOFTWARE


### MONITOR
This is a simple monitor program, see the "monitor" section of this document for usage instructions. "Monitor" requires that the UART is properly initialized.

It assumes that the 6809 board is set for IOPage 03.
        * remember that bit A15 is inverted on the board so the dip switch is set to $83.

If the SBC is the only CPU in the system, ensure that jumpers J1 and J4 are set for 1&2, then burn monitor.hex into EPROM. (note that this monitor does not initialize the UART yet, so this is broken at the moment)


If the SBC is secondary to a Z80, the monitor.com file can be run from CP/M or the monitor.hex file can be loaded from the monitor. Ensure that jumpers J1 and J4 are set for 2&3, the 6809 toggle IO address is set for $FF and the 6809 board is set for IOPage 03.
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

Finally transfer control to the 6809 by reading the toggle register
```
>I FF
```

### SCREAM
This is a quick program that can be put on a ROM to test the 6809 board. It will output a continuous stream of "A"s from the UART. It does not require the stack to be available and is pretty much the simplest code imaginable. :)

It assumes that the 6809 board is set for IOPage 03.
        * remember that bit A15 is inverted on the board so the dip switch is set to $83.

If the SBC is the only CPU in the system, ensure that jumpers J1 and J4 are set for 1&2, then burn scream.hex into EPROM.  (note that this monitor does not initialize the UART yet, so this is broken at the moment)

If the SBC is secondary to a Z80, the scrm.com file can be run from CP/M or the scream.hex file can be loaded from the monitor. Ensure that jumpers J1 and J4 are set for 2&3, the 6809 toggle IO address is set for $FF and the 6809 board is set for IOPage 03.
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

Finally transfer control to the 6809 by reading the toggle register
```
>I FF
```

The '09 should reset and run this program


## MONITOR Program

Monitor is a simple machine language monitor that will allow you to view and manipulate the 6809 operating environment.

Monitor Supports the following Commands:

```
	* D -  XXXX YYYY - Dump memory from XXXX to YYYY
        * L - Load a S19 file into RAM
       	* M XXXX YY  - update the ram at XXXX with value YY
        * G XXXX - Execute program at XXXX
        * P - PRINT CONTENTS OF STACK
```
