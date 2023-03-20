# MBC65C02
65C02 processor board (hardware and software) for the Nhyodyne computer system

## BUGS
* the WDC 65C02 cannot be used in the board, it needs to be an older chip.  I recently found a document from a builder that was working on a PET clone that (I believe) may give a clue to resolving this issue.

> . . . s. Additionally, although for all
practical purposes here the W65C02 is, functionally, entirely equivalent to the original 6502,
it is not a direct drop-in replacement. It has slightly different pin functions, different, more
stringent timing requirements due to its ability to run several times faster than the original
NMOS 6502 and it is a CMOS part with CMOS-level, rather than TTL-level compatible I/O
thresholds. The potential timing incompatibility mostly relates to memory write operations and how
briefly (only 10 ns) valid data is guaranteed to remain on the data bus upon the falling edge of
the system clock (time THW). If your memory write strobe decoding doesn’t have time to react
before the data disappears from the data bus you’re going to have trouble with memory write
operations! If you peruse my circuit diagrams you’ll notice that a pair of 74HCT244 driver
chips directly buffer the W65C02S’s data I/O pins to the systems data bus. These chips
provide CMOS-level to TTL-level threshold conversion and add critical, delayed time
extension to THW. To doubly ensure that the memory write strobe is available well ahead of
schedule, it is decoded by a super-fast 74AC family device. . . . .



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



# BOM (V1.4)

Qty|Reference(s)|Value
--- | --- | ---
5|C1, C2, C16, C17, C18|10�F electrolytic
13|C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15|0.1�F
1|D1|Device:LED
1|D2|1N4148
1|D3|Device:LED
1|D4|Device:LED
1|D5|Device:LED
1|D6|Device:LED
1|D7|Device:LED
1|J1|Connector 01x03 Male  Rt angle
1|J2|Connector 02x04 Male  Rt angle
1|J3|Connector  01x03 Male  Rt angle
1|J4|Connector 02x25 Male Rt angle
1|JP1|Jumperx2
1|R1|3.3K
1|R2|10
6|R3, R5, R6, R7, R8, R9|470
1|R4|10K
1|RN1|4700 Network 09
2|RN2, RN5|1K Network 08
1|RN3|1K Network 05
1|RN4|2.2K Network 09
1|SW1|Switch:SW_DIP_x08
1|SW2|Switch:SW_DIP_x08
1|SW3|Switch:SW_Push
3|U1, U8, U9|74LS244
1|U2|74LS93
1|U3|74LS32
1|U4|74LS04
2|U5, U10|74LS688
1|U6|65CE02
1|U7|74LS245
1|U11|74LS74
1|U12|74LS07


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


### SCREAM
This is a quick program that can be put on a ROM to test the 65C02 board. It will output a continuous stream of "A" at 9600 baud from the UART. It does not require the stack to be available and is pretty much the simplest code imaginable. :)
"SCREAM" initializes the UART for 9600,n,8,1.

It assumes that the 65C02 board is set for IOPage 03.
        * remember that bit A15 is inverted on the board so the dip switch is set to $83.

The scrm.com file can be run from CP/M or the scream.hex file can be loaded from the monitor. Ensure that jumpers J1 and J4 are set for 2&3, the 6502 toggle IO address is set for $FF and the 65C02 board is set for IOPage 03.
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

### MONITOR
This is a simple monitor program, see the "monitor" section of this document for usage instructions. "Monitor" requires that the UART is properly initialized as it would be when the SBC is secondary to the Z80 proc board.  If you are running this board as the primary CPU, see the Firmware section.

It assumes that the 65C02 board is set for IOPage 03.
        * remember that bit A15 is inverted on the board so the dip switch is set to $83.

The monitor.com file can be run from CP/M or the monitor.hex file can be loaded from the Z80 monitor. Ensure that jumpers J1 and J4 are set for 2&3, the 6502 toggle IO address is set for $FF and the 65C02 board is set for IOPage 03.
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



## Using the 6502 MONITOR
The Nhyodyne system now uses the SuperMON monitor.  It is a powerful machine language monitor that will allow you to view and manipulate the 6502 operating environment.


```
 INSERT SUPERMON DOCS HERE
```

## Using DOS65
        DOS/65 is provided as the operating system for the Nhyodyne 65C02 board.  See the DOS/65 documentation for more information on how to use DOS/65.

        If you are running the 6502 board as a secondary CPU, the CP/M program DOS65.com will load DOS/65 and transition control from Z80 CP/M to 65c02 DOS/65.  DOS65.COM also requires DOS65DRV.SYS on the same drive as it contains all of the device drivers that are loaded into another RAM bank.

        DOS/65 will read and write from HD_512 style ROMWBW slices and CP/M images. HD_1024 images are not supported.

        Rather than running .COM files, DOS/65 will run .CO6 files.

        currently DOS/65 supports PPIDE, serial, and DSKYNG devices

        DOS/65 utility programs:
        CPM.CO6 - return control to the Z80 and Boot CPM into a sane state.
        ASSIGN.CO6 - dynamically adjust drive mapping
        SEDIT.CO6 - Text editor (only partially working)
        DBASIC.CO6 - ehBasic for DOS/65
        FORMAT.CO6 - Utility to format floppy disks for DOS/65

        The following utilities are from the DOS/65 distribution and are documented in the DOS/65 documentation.
        alloc.CO6 - DOS/65 drive utility
        compare.CO6- DOS/65 compare utility
        debug.CO6- DOS/65 debugger
        edit.CO6- DOS/65 line editor
        asm.CO6- DOS/65 assembler
        bcompile.CO6- DOS/65 Basic-E compiler
        copy.CO6- DOS/65 file copy utility
        run.CO6- DOS/65 Basic-E run time

# 6502 ROM
If the 6502 processor board is the only CPU board in your Nhyodyne system ensure J1 is set for 1&2 (Only CPU) and J4 is set for 1&2 (Only CPU).   The ROM.BIN file can be placed in ROM (starting at 0000) to bring the system up to the ROM monitor.
TO BOOT DOS/65 FROM A PRIMARY 6502 CPU:
   L (SEND FILE LOWMON.S19)
   G 1000 ( TO RUN LOWMON)
   >037C 80
   >0378 8E
   L (SEND FILE DOS65.S19)
   G D000 (OR W XX to write os to a specified device)

   TODO:
        * COMPLETE DOS/65 STORE AND BOOT FUNCTIONS FOR FLOPPY.




# Items left on the DOS/65 To Do list:
        * Hardware support for RTC
        * Hardware support for ORIGINAL DSKY
        * Hardware Support for VDC/Keyboard
        * Hardware support for Dual Serial
        * XMODEM
        * DOCUMENTATION
        * TEST HOSTED AND STAND ALONE (ALL FUNCTIONS, WITH ONE BUILD)