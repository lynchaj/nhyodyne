# Direct Memory Adapter for Z80 Modular Backplane Computer system

Optional DMA for Z80 processor

Flash File System support -- requires 39SF040 Flash ROMs

External DMA connector

Power LED

Chip Select LED

DMA transfer LED

DMA Ready LED

Default IO ports $E0-$E1

Note: The Z80 DMA V2 board has not yet gone to PCB production however the differences between it and the Z80 DMA V1 board are very minor.

# Jumpers

K2 Interrupt Selection, connect 1-2 for INT#, connect 2-3 for NMI#, default is none
Note: pin 2 can be connected to Z80 Processor IM2 connector via flying lead

K1 is external DMA connector.  Default is 2-3 closed, otherwise connected to DMA capable IO board

JP2 is source of DMA Address Direction, close 1-2 for BAIb# or close 2-3 for BUSAK#. Default is close 2-3 BUSAK#
