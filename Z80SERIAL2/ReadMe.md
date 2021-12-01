# Serial Board for Z80 Modular Backplane Computer

Uses Intel 8250 Asynchronous Communication Adapter (ACE) derivative Universal Asynchronous Receiver Transmitter (UART)

40 Pin DIP format (8250, 16C550, etc.)

Real RS-232 level serial port

TTL level serial port for USB adapters with optional power supply

External experimental connector with spare GPIO pins

Power LED

Chip Select LED

Interrupt LED

Receive and Transmit LEDs

Default IO port $68-$6F

# Jumpers

J1 Interrupt Select, connect 1-2 for INT# default, connect 2-3 for NMI#, none for no interrupt
Note: can connect J1 pin 2 via flying lead to Z80 processor IM2 connector

J2 is Ring Indicator input option.  Pins 1-2 closed (default) for RI# set to VCC (inactive) as default.  Pins 2-3 closed to export RI# to experiment connector J9

J3 is Carrier Detect input option.  Pins 1-2 closed (default) for DCD# set to GND (active) as default.  Pins 2-3 closed to export DCD# to experiment connector J9

J7 TTL Level Serial Ports Power, connect 1-2 for Port Power, default is none

J8 is TTL Serial port option CTS# or DSR#.  Depending on TTL Serial to USB adaptor can go either way.  Pins 1-2 closed is CTS# (default), pins 2-3 closed is DSR#, no jumper is none.

JP1 is connector for external recovery switch (on-momentary) not a jumper.  Do not install jumper

J5 is External DMA interface circuit connector.  Do not install jumpers on J5 as it is meant for external cable.
