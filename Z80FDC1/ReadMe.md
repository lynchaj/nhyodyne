# Floppy Drive Controller for Z80 Modular Backplane Computer

Integrated WD37C65 Floppy Drive Controller

34 pin connector for standard IBM PC compatible 34 pin IDC floppy drive cable

1.44MB compatible with 8MHz or faster CPU

Polling or Interrupt modes supported

Selectable Interrupt connector

External DMA connector

Power LED

Chip Select LED

Default IO ports $30-$37

# Jumpers

P5 is Optional Secondary FDC Clock Enable, pins 1-2 CLOSED TO ENABLE; pins 2-3 CLOSED to disable, DEFAULT IS 2-3 CLOSED
NOTE: U12 OPTIONAL SECONDARY CLOCK FOR 150/300 KBPS DRIVES controlled by P5

P4 is External Interrupt Selection, close 1-2 for INT#, close 2-3 for NMI#, leave open for none, default is none
NOTE: pin 2 can be connected to Z80 Processor IM2 connector via flying lead

P3: External DMA connector, do not jumper, default is none
