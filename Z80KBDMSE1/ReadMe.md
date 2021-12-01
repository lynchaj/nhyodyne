# Keyboard and Mouse Controller for Z80 Modular Backplane Computer

Uses Intel 8042 or VT82C42 integrated keyboard and mouse controller (same as IBM AT)

External GPIO connector

External Interrupt selection connector

Power LED

Chip Select LED

Default IO ports $E2-$E3

# Jumpers

K3 is Interrupt Selection Jumper, pins 1-2 closed for INT#, pins 2-3 closed for NMI#, none for no interrupt, default is none
NOTE: pin 2 can be connected to Z80 Processor IM2 connector via flying lead
