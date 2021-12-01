# Z80 Processor Board V3 for Z80 MBC
includes fully buffered Z80 processor (up to 20 MHz CMOS or legacy NMOS)

Wait state generator for Memory Reads (0-7), Memory Writes (0-7), IO Reads (1-8), IO Writes (1-8) with enable jumper

Interrupt Mode 2 "over the top" connector with 8 priority vector interrupts with enable jumper

Onboard Reset button

Local CPU oscillator option; can transmit CPU clock signal to bus backplane. Oscillator can be half or full size package.

Diagnostic LEDs for power, WAIT, interrupt, and non-maskable interrupt

#  Jumpers

JP1 is connector for external reset switch (on-momentary), not for jumper.  default is open

JP4 is CPU oscillator select.  1-2 closed (default) is use CPU clock from bus.  2-3 closed is local oscillator on Z80 processor board.

JP3 is export local CPU clock to bus.  1-2 closed exports local oscillator to CPU clock signal on bus.  1-2 open prevents (default).  Note if CPU clock signal is present on bus from other source then JP3 must be open or bus contention.  Note: system bus can have no CPU clock or one source of CPU clock only.  Some boards will not work without CPU clock present.

JP2 is WAIT state enable.  1-2 open (default) disables WAIT state generator.  1-2 closed enables WAIT state generator.

J1-J4 are settings for various WAIT states.  Assumes JP2 closed to enable WAIT state generator.

J1 0-7 WAIT states for memory read
J2 0-7 WAIT states for memory write
J3 1-8 WAIT states for IO reads
J4 1-8 WAIT states for IO writes
note: Z80 processor has 1 WAIT state for IO reads/writes by default.  J3 & J4 IO WAIT states are not additive but represent total number.

JP5 Interrupt Mode 2 enable.  1-2 open (default) disables IM2 mode interrupts. 1-2 closed enables IM2 mode interrupts.  Note software must be configured for IM2 for this to work due to vector ISRs.
