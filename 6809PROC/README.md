# MBC6809
6809 processor board (hardware and software) for the Nhyodyne computer system


# Bugs
* I AM SURE THERE ARE SOME . . . .

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
                with the Nhyodyne ROM and RAM cards.   Therefore the MSB (SW8) is inverted.  Most applications for this board expect an IO page of $FE ($FE00-$FEFF).Leading to a default setting of:
                1-on
                2-off
                3-off
                4-off
                5-off
                6-off
                7-off
                8-on

        SW2 - Reset

        SW2 - 6809 toggle address
                This setting sets the IO port that toggles the 6809 in and out of control when it is a secondary CPU.  When it is the only CPU in the system this setting has no effect. Most test applications for this board expect an IO address of $F0.   Reading this IO port will toggle the 6809 active/inactive.
                Leading to a default setting of:
                1-on
                2-on
                3-on
                4-on
                5-off
                6-off
                7-off
                8-off



# BOM

Qty|Reference(s)|Value
--- | --- | ---
5|C1, C14, C15, C16, C17|10µf electrolytic
12|C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13|0.1µf
1|D1|Device:LED
1|D2|Device:LED
1|D3|Device:LED
1|D4|Device:LED
1|D5|Device:LED
1|D6|Device:LED
1|D7|1N4148
1|J1|Connecto 02x04 Male Right Angle
1|J2|Connector 01x03  Male Right Angle
1|J3|Connector 01x03  Male Right Angle
1|J4|Connector 02x25  Male Right Angle
1|JP1|Jumper  01x02 Male Right Angle
6|R1, R2, R3, R4, R6, R7|470 ohm
1|R5|10 ohm
1|R8|10K ohm
1|RN1|4700 ohm Network 9
2|RN2, RN4|1K ohm Network 8
1|RN3|1k ohm Network 9
1|RN5|2.2k ohm Network 9
1|SW1|Switch:SW_DIP_x08
1|SW2|Switch:SW_DIP_x08
1|SW3|Switch:SW_Push
1|U1|74LS93
3|U2, U8, U10|74LS244
1|U3|74LS04
2|U4, U7|74LS688
1|U5|74LS245
1|U6|MC6809 (68B09 Preferred)
1|U9|74LS00
1|U11|74LS74
1|U12|74LS07


# SOFTWARE


### MONITOR
This is a simple monitor program, see the "monitor" section of this document for usage instructions. "Monitor" requires that the UART is properly initialized.

It assumes that the 6809 board is set for IOPage $FE.
        * remember that bit A15 is inverted on the board

If the SBC is the only CPU in the system, ensure that jumpers J1 and J4 are set for 1&2, then burn monitor.hex into EPROM. (note that this monitor does not initialize the UART yet, so this is broken at the moment)


If the SBC is secondary to a Z80, the monitor.com file can be run from CP/M or the monitor.hex file can be loaded from the monitor. Ensure that jumpers J1 and J4 are set for 2&3, the 6809 toggle IO address is set for $F0 and the 6809 board is set for IOPage $FE.
        * remember that bit A15 is inverted on the board


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
>I F0
```

### SCREAM
This is a quick program that can be put on a ROM to test the 6809 board. It will output a continuous stream of "A"s from the UART. It does not require the stack to be available and is pretty much the simplest code imaginable. :)

It assumes that the 6809 board is set for IOPage $FE.
        * remember that bit A15 is inverted on the board

If the SBC is the only CPU in the system, ensure that jumpers J1 and J4 are set for 1&2, then burn scream.hex into EPROM.  (note that this monitor does not initialize the UART yet, so this is broken at the moment)

If the SBC is secondary to a Z80, the scrm.com file can be run from CP/M or the scream.hex file can be loaded from the monitor. Ensure that jumpers J1 and J4 are set for 2&3, the 6809 toggle IO address is set for $F0 and the 6809 board is set for IOPage $FE.
        * remember that bit A15 is inverted on the board


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
>I F0
```

The '09 should reset and run this program


### MONITOR Program

Monitor is a simple machine language monitor that will allow you to view and manipulate the 6809 operating environment.

Monitor Supports the following Commands:

```
	* D -  XXXX YYYY - Dump memory from XXXX to YYYY
        * L - Load a S19 file into RAM
       	* M XXXX YY  - update the ram at XXXX with value YY
        * G XXXX - Execute program at XXXX
        * P - PRINT CONTENTS OF STACK
```

### FLEX09 OPERATING SYSTEM

MEMORY MAP:

```
 C000  -------
          I     System Stack
 C080  -------
          I     Input Buffer
 C100  -------
          I
          I     Utility Area
          I
 C400  -------  Startup Code
          I
          I
 C700  -------
          I     Printer Spooler Stub
 C71C  -------
          I     Open Space
          I
 C840  -------
          I
          I     System/User FCB
          I
 C980  -------
          I
          I     System I/O FCB's
          I     (FLEX Initialize at CA00)
          I
 CC00  -------
          I
          I     Flex CCP
          I
 CD00  -------
          I
          I
          I     Disk Operating System
          I
          I
 D3E1  -------
          I     Driver Vector Table
                D3E1 ADDDEV      * add an IRQ handler to table
                D3E3 DELDEV      * delete an IRQ handler from table
                D3E5 INCHNE      * INPUT CHARACTER W/O ECHO
                D3E7 IHNDLR      * IRQ INTERRUPT HANDLER
                D3E9 SWIVEC      * SWI3 VECTOR LOCATION
                D3EB IRQVEC      * IRQ VECTOR LOCATION
                D3ED TMOFF       * TIMER OFF ROUTINE
                D3EF TMON        * TIMER ON ROUTINE
                D3F1 TMINT       * TIMER INITIALIZATION
                D3F3 MONITR      * MONITOR ENTRY ADDRESS
                D3F5 TINIT       * TERMINAL INITIALIZATION
                D3F7 STAT        * CHECK TERMINAL STATUS
                D3F9 VOUTCH      * OUTPUT CHARACTER
                D3FB VINCH       * INPUT CHARACTER W/ ECHO
          I
 D400  -------
          I
          I
          I     File Management-System
          I
          I
          I
 DE00  -------
          I     DISK DRIVER ROUTINE JUMP TABLE
                DE00 READ      Read a single sector
                DE03 WRITE     Write a single sector
                DE06 VERIFY    Verify last sector written
                DE09 RESTORE   Restore head to track #0
                DE0C DRIVE     Select the specified drive
                DE0F CHKRDY    Check for drive ready
                DE12 QUICK     Quick check for drive ready
                DE15 INIT      Driver initialize (cold start)
                DE18 WARM      Driver initialize (warm start)
                DE1B SEEK      Seek to specified track
          I
          I     Disk Drivers
          I
 FE00  -------
          I    I/O Area
 FF00  -------
          I    Work RAM
 FFEF  -------
                FFF0    RESERVED
                FFF2    SWI3 VECTOR
                FFF4    SWI2 VECTOR
                FFF6    FIRQ VECTOR
                FFF8    IRQ VECTOR
                FFFA    SWI VECTOR
                FFFC    NMI VECTOR
                FFFE    RESET VECTOR
 FFFF  -------
```

### FLEX09 OPERATING SYSTEM TODO LIST
* PPIDE WRITE IS SORTA BROKEN (needs read following write to work?!?!?)
* ADD CPM COMMAND
* INSTRUCTIONS FOR DRIVE AND DSKY CONFIGURATION
* FLOPPY DRIVERS
* RTC
* VIDEO/KB SUPPORT
* DOCUMENTATION
* ALLOW MULTIPLE IMAGES ON CF
* Document slices and drives
* write assign program
* C compiler?
* CODE CLEANUP
* SUPPORT FOR STAND ALONE FLEX
* WRITE PRINTER DRIVER
0145 CCC0 39         PINIT     RTS (jmp Printerinit)
0149 CCD8 39         PCHK      RTS (jmp Check Printer)
0153 CCE4 39         POUT      RTS (jmp output to Printer)
