# Read Only Memory (ROM) board for Z80 Modular Backplane Computer

Uses standard 28 pin or 32 pin ROMs such as EPROM and Flash ROMs

32KB through 2MB ROM capacity

ROM Memory Page Configuration Latch for switchable lower 32KB memory page or none

Boot jumper for multiple ROM boards in system, only one must be bootable

Power LED

ROM0 and ROM1 Chip Select LEDs

Default IO port $78

# Jumpers

JP1 is Boot ROM Option.  Pins 1-2 closed (default) for Boot enable assuming single ROM board present in system.  Will cause lower 32KB ROM page to be present at power on or after reset.  Only one ROM board per system can be boot enabled.  Multiple ROM boards can be present but only one can be boot enabled and rest must have JP1 open or bus contention.

K2 is ROM size option.  Pins 1-2 closed for 512KB ROMs (both ROM0 and ROM1) (default).  Pins 2-3 closed for 1MB EPROMs.

K1 is ROM0 for pins 1-2 closed (default) 32 pin EPROM or pins 2-3 closed for 28 pin EPROM. One or the other must be selected.

K6 is ROM0 for pins 1-2 closed for 1MB EPROM or pins 2-3 closed (default) for 512KB Flash ROM. One or the other must be selected.

K8 is ROM0 for pins 1-2 closed for 1MB EPROM or pins 2-3 closed (default) for 512KB Flash ROM. One or the other must be selected.

K3 is ROM1 for pins 1-2 closed (default) 32 pin EPROM or pins 2-3 closed for 28 pin EPROM. One or the other must be selected.

K4 is ROM1 for pins 1-2 closed for 1MB EPROM or pins 2-3 closed (default) for 512KB Flash ROM. One or the other must be selected.

K5 is ROM1 for pins 1-2 closed for 1MB EPROM or pins 2-3 closed (default) for 512KB Flash ROM. One or the other must be selected.
