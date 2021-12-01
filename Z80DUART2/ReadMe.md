# Dual Serial Board for Z80 Modular Backplane Computer

Uses Texas Instruments TL16C2552FN Asynchronous Communication Adapter (ACE) derivative Dual Universal Asynchronous Receiver Transmitter (UART)

44 Pin PLCC format TL16C2552F or compatible

Two Real RS-232 level serial port

Two TTL level serial port for USB adapters with optional power supplies

External experimental connector with spare GPIO pins

Power LED

Chip Select LED

Interrupt LED

Receive and Transmit LEDs

Default IO port $80-$8F

# Jumpers

JP1 is connector for External Recovery Button (on-momentary close).  Do not jumper, default is none


J7 is TTL Level Serial Port A Power select, close 1-2 for TTL serial port Power, Open for none, default is none

J11 is TTL Level Serial Port B Power select, close 1-2 for TTL serial port Power, Open for none, default is none


J8 is TTL Serial Port A option CTS# or DSR#. Depending on TTL Serial to USB adaptor can go either way. Pins 1-2 closed is CTS# (default), pins 2-3 closed is DSR#, no jumper is none.

J12 is TTL Serial Port B option CTS# or DSR#. Depending on TTL Serial to USB adaptor can go either way. Pins 1-2 closed is CTS# (default), pins 2-3 closed is DSR#, no jumper is none.


J2 is Ring Indicator input Serial Port A option. Pins 1-2 closed (default) for RI# set to VCC (inactive) as default. Pins 2-3 closed to export RI# to experiment connector J9

J9 is Ring Indicator input Serial Port B option. Pins 1-2 closed (default) for RI# set to VCC (inactive) as default. Pins 2-3 closed to export RI# to experiment connector J9


J3 is Carrier Detect input Serial Port A option. Pins 1-2 closed (default) for DCD# set to GND (active) as default. Pins 2-3 closed to export DCD# to experiment connector J9

J10 is Carrier Detect input Serial Port B option. Pins 1-2 closed (default) for DCD# set to GND (active) as default. Pins 2-3 closed to export DCD# to experiment connector J9


J5 is External DMA connector with DUART Interrupts channels A & B.  Do not apply Jumpers to these pins.
