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

Default IO Address Port $B0-B7; IO port address is set using SW1-SW5
SW1=1-2 - A7 (high)
SW2=2-3 - A6 (low)
SW3=1-2 - A5 (high)
SW4=1-2 - A4 (high)
SW5=2-3 - A3 (low)

# Jumpers

J1 Interrupt Select, connect 1-2 for INT# default, connect 2-3 for NMI#, none for no interrupt
Note: can connect J1 pin 2 via flying lead to Z80 processor IM2 connector

J2 TTL Level Serial Ports Power, connect 1-2 for Port A Power, connect 3-4 for Port B Power, default is none

P4 connect 1-2 for system timer 2, none for no system timer, default is 1-2.

P10 connect 1-2 for system timer 3, none for no system timer, default is 1-2

# Notes

There is a problem with the bus transceiver logic and a patch to fix it.  The IO port decoder/data_dir design for CTCDART & DUALPIO does not share a common 16 byte IO address space as planned.  The fix has been tested on Z80 CTCDART V2 and Z80 DUALPIO V2 boards and works as intended using only 8 IO port addresses with no interference.  Both CTCDART and DUALPIO boards have this problem and need the patch.

It is an easy patch to make.  No trace cuts and just one jumper on copper side and another on the component side.  The fix is optional because the board works fine unmodified but requires an entire 16 byte block to not interfere with another board.  For example, $B0-$BF & $A0-AF unmodified or $B0-B7 & $B8-BF modified.

Placing the CTCDART at $B0-$B7 and DUALPIO at $B8-$BF and they coexist peaceably. TIMER/C runs no problem as does 2PIOTST generates the right responses. No more annoying interference between the two boards.

The patch is the same for both boards:

U17, pin 2 (74LS138) to U5, pin 13 (74LS14); jumper on copper side
U5, pin 12 (74LS14) to U1A, pin 5 (74LS20); lift pins & jumper on component side

The board is close enough now for some extended testing to shake out any other possible bugs. These problems will be fixed in the next PCB respin.
