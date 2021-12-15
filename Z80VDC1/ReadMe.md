# Terminal Video Board for Z80 Modular Backplane Computer

Based on MOS 6568 Video Display Controller (same as Commodore 128D 80 column mode)

External TTL RGB connector

Up to 64KB dedicated video RAM using two 41464 DRAM chips

Intended for Video Terminal Console, 80 column mode

Some graphics and color capability as well

Default IO ports $E4-$E5

Demostrated working with GBS-8200 VGA upscaler device however requires custom interface with analog color signals from pseudo-VGA interface (no not install VGA-F connector) and CSYNC signal.  Route wire jumper from U7, pin 9 to U3, pin 6 and wire jumper from U3, pin 14 to CSYNC on connector (replaces HSYNC signal) to feed GBS-8200.  Issues will be resolved in future Z80 VDC V2 PCB respin.

# Jumpers

K1 is Interrupt Selection.  Pins 1-2 closed for INT# and pins 2-3 closed for NMI#.  No jumper for none (default).  Note pin 2 can be connected to the IM2 connector on the processor board via flying lead.

JP1 and JP2 are not really option jumpers but PCB debugging tools due to conflicting technical data on MOS 8568 VDC.  JP1 connects #RES to bRESET# and is 1-2 closed (default).  JP2 connects INIT to GND and is 1-2 closed (default).  These are solid assumptions but if prove incorrect can be fixed with wire wrap connections rather than cuts and jumpers.

NOTE: JP1 and JP2 proved useful as the conflict between MOS technical data and Commodore C128D schematic was resolved and the Commodore C128D schematic was correct.  Do not install jumpers JP1 and JP2 and instead solder wires between Pin 1 of JP1 footprint and Pin 2 of JP2 footprint.  Likewise Pin 1 of JP2 footprint to Pin 2 of JP1 footprint.  Be sure to use insulated wires so there are not inadvertent short circuits between jumpers or rest of board circuitry. 

P4 is VGA connector sync selection.  Pins 1-3 closed for HSYNC (default) and pins 3-5 closed for HSYNC#.  Pins 2-4 closed for VSYNC (default) and pins 4-6 closed for VSYNC#.  Polarity of HSYNC and VSYNC varies depending on monitor although most use HSYNC and VSYNC by default.  One or the other must be selected or monitor display will not work.  VSYNC and HSYNC are active high.  VSYNC# and HSYNC# are active low.
