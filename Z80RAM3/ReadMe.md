# Z80 RAM board for Z80 Modular Backplane Computer

Provides Random Access Memory (RAM) for Z80 MBC

128KB to 1MB capacity

Uses 32 pin SRAMs 128KB or 512KB

Uses two DS1210 Non-Volatile Memory Controllers with CR2032 for battery backed NVRAM

RAM Memory Page Configuration Latch for 32KB Upper and/or Lower memory pages

Boot jumper, capacity for multiple RAM boards in system, only one must be bootable

Power LED

RAM0 and RAM1 Chip Select LEDs

Default IO port $7C

# Jumpers

JP1 is Boot RAM Option. Pins 1-2 closed (default) for Boot enable assuming single RAM board present in system. Will cause upper 32KB RAM page to be present at power on or after reset. Only one RAM board per system can be boot enabled. Multiple RAM boards can be present but only one can be boot enabled and rest must have JP1 open or bus contention.

K2 is RAM size option. Pins 1-2 closed for 128KB RAMs (both RAM0 and RAM1) (default). Pins 2-3 closed for 512KB RAMs.

K7 is for 32 pin 128KB RAM0 or 512KB RAM0.  Pins 1-2 closed for 512KB RAM (default). Pins 2-3 closed for 128KB RAM.  One or the other must be selected.

K9 is for select Upper 32KB of RAM to be fixed, Lower 32KB of RAM to be switchable Pins 2-3 closed (default) or both to be switchable pins 1-2 closed.  Note: software needs to support latter feature.  RomWBW assumes default of pins 2-3 closed. One or the other must be selected.

K6 is to select whether fixed top of RAM to be 32KB pins 1-2 closed (default) or 16KB pins 2-3 closed.  One or the other must be selected. 

JP2 is battery select jumper option supports both RAM0 and RAM1. Pins 1-2 closed for onboard CR2032 battery (default).  Pins 3-4 must be closed also if CR2032 is used (default).  Optionally pins 3-4 can be used as external battery connector with pin 4 is positive terminal, pin 3 is negative (ground).  

JP3 and JP4 for U16 DS1210 installed pin 1-2 open (default).  Closed both pins 1-2 to bypass.  Default is both open.  Note, if pins 1-2 closed U16 must be removed or unreliable operation.

K3 DS1210 RAM0 power sag tolerance feature, pins 1-2 closed 10% power sag (default), pins 2-3 closed 5%. One or the other must be selected or NVRAM will not work. If experiencing random lockups try 10% power sag setting or diagnose power supply issues.

JP5 and JP6 for U9 DS1210 installed pin 1-2 open (default).  Closed both pins 1-2 to bypass.  Default is both open.  Note, if pins 1-2 closed U9 must be removed or unreliable operation.

K1 DS1210 RAM1 power sag tolerance feature, pins 1-2 closed 10% power sag (default), pins 2-3 closed 5%. One or the other must be selected or NVRAM will not work. If experiencing random lockups try 10% power sag setting or diagnose power supply issues.
