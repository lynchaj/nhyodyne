# CAUTION: Initial build and test revealed problems with this board handling IM2 interrupts.  Likely will need a PCB respin for corrections.

Instructions on how to modify Z80 DUALPIO V1 to work with IM2 interrupts:

1.	Completely bypassed the '245 by removing it and bridging all of the data lines.
2.	Removed the /M1 qualification from the '688 by lifting pins 2,4, and 6.  I then bridged pins 2-3, 4-5, and 6-7.
3.	Removed the IA qualification from '688 by lifting pin 12 of the '32 and bridging it to pin 13 of the '32.

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
