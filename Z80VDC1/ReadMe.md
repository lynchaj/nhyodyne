# Terminal Video Board for Z80 Modular Backplane Computer

Based on MOS 6568 Video Display Controller (same as Commodore 128D 80 column mode)

External TTL RGB connector

Up to 64KB dedicated video RAM using two 41464 DRAM chips

Intended for Video Terminal Console, 80 column mode

Some graphics and color capability as well

Default IO ports $E4-$E5

# Jumpers

K1 is Interrupt Selection.  Pins 1-2 closed for INT# and pins 2-3 closed for NMI#.  No jumper for none (default).  Note pin 2 can be connected to the IM2 connector on the processor board via flying lead.

JP1 and JP2 are not really option jumpers but PCB debugging tools due to conflicting technical data on MOS 8568 VDC.  JP1 connects #RES to bRESET# and is 1-2 closed (default).  JP2 connects INIT to GND and is 1-2 closed (default).  These are solid assumptions but if prove incorrect can be fixed with wire wrap connections rather than cuts and jumpers.

P4 is VGA connector sync selection.  Pins 1-3 closed for HSYNC (default) and pins 3-5 closed for HSYNC#.  Pins 2-4 closed for VSYNC (default) and pins 4-6 closed for VSYNC#.  Polarity of HSYNC and VSYNC varies depending on monitor although most use HSYNC and VSYNC by default.  One or the other must be selected or monitor display will not work.  VSYNC and HSYNC are active high.  VSYNC# and HSYNC# are active low.
