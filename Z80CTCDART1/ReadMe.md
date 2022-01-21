# CAUTION: Initial build and test revealed problems with this board handling IM2 interrupts.  Likely will need a PCB respin for corrections.

Instructions on how to modify Z80 CTCDART V1 to work with IM2 interrupts:

1.	Completely bypassed the '245 by removing it and bridging all of the data lines.
2.	Removed the /M1 qualification from the '688 by lifting pins 2,4, and 6.  I then bridged pins 2-3, 4-5, and 6-7.
3.	Removed the IA qualification from '688 by lifting pin 12 of the '32 and bridging it to pin 13 of the '32.


# Counter / Timer Channels (CTC) and Dual Asynchronous Receiver Transmitter (DART) board for Z80 Modular Backplane Computer

Adds CTC system timer and DART dual serial ports

External interrupts with Zilog compatible interrupt priority modes

Fully configurable CTC settings for multiple timers and system ticks

Uses built in 4.9152 MHz clock or system CPU clock

Clock dividers for system ticker at selected tick frequencies

Dual RS-232 level serial ports plus dual TTL level serial ports for USB adapters

Power LED

Chip Select LED

Interrupt LED

Default IO ports $B0-$B7

# Jumpers

J1 Interrupt Select, connect 1-2 for INT# default, connect 2-3 for NMI#, none for no interrupt
Note: can connect J1 pin 2 via flying lead to Z80 processor IM2 connector

J2 TTL Level Serial Ports Power, connect 1-2 for Port A Power, connect 3-4 for Port B Power, default is none

P10 connect 1-2 for system timer, none for no system timer, default is 1-2
