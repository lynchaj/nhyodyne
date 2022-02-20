# Dual Parallel IO board for Z80 Modular Backplane Computer

Add a pair of PIOs with external connectors, 32 GPIO pins plus 4 strobe pins, 4 ready pins, and power pins 

External interrupts with Zilog compatible interrupt priority modes

Fully configurable PIO settings for wide variety of uses

Power LED

Chip Select LED

Interrupt LED

Default IO ports $B8-$BF

# Jumpers

J1 is Interrupt Selection, close 1-2 for INT#, close 2-3 for NMI#, none for no interrupt.
Note: pin 2 can be connected to Z80 Processor IM2 connector via flying lead

Default IO Address Port $B8-BF; IO port address is set using SW1-SW5
SW1=1-2 - A7 (high)
SW2=2-3 - A6 (low)
SW3=1-2 - A5 (high)
SW4=1-2 - A4 (high)
SW5=1-2 - A3 (high)

# Notes

There is a problem with the bus transceiver logic and a patch to fix it.  The IO port decoder/data_dir design for CTCDART & DUALPIO does not share a common 16 byte IO address space as planned.  The fix has been tested on Z80 CTCDART V2 and Z80 DUALPIO V2 boards and works as intended using only 8 IO port addresses with no interference.  Both CTCDART and DUALPIO boards have this problem and need the patch.

It is an easy patch to make.  No trace cuts and just one jumper on copper side and another on the component side.  The fix is optional because the board works fine unmodified but requires an entire 16 byte block to not interfere with another board.  For example, $B0-$BF & $A0-AF unmodified or $B0-B7 & $B8-BF modified.

Placing the CTCDART at $B0-$B7 and DUALPIO at $B8-$BF and they coexist peaceably. TIMER/C runs no problem as does 2PIOTST generates the right responses. No more annoying interference between the two boards.

The patch is the same for both boards:

U17, pin 2 (74LS138) to U5, pin 13 (74LS14); jumper on copper side
U5, pin 12 (74LS14) to U1A, pin 5 (74LS20); lift pins & jumper on component side

The board is close enough now for some extended testing to shake out any other possible bugs. These problems will be fixed in the next PCB respin.
