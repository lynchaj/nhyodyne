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

J5 is External DMA connector with DUART Interrupts channels A & B.  Do not apply Jumpers to these pins.
