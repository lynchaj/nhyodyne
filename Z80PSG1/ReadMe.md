# Z80 PSG V1

Provides GI AY-3-8910 Programmable Sound Generator with three channel FM synthesis

Atari or MSX compatible joysticks or paddles

Power, chip select, and status LEDs

IO ports $E8-$EB

# Jumpers

JP1 AY-3-8910 test input pins 1-2, default is none

J5 Pins 1-2 all channels merged into channel C, Pins 3-4 all channels merged into channel A, default is none

pins 5-7 audio oscillator /2
pins 7-9 audio oscillator /8
pins 6-8 audio oscillator /1
pins 8-10 audio oscillator /4

default is pins 5-7 closed assuming a 3.5795 MHz audio oscillator

J1 POT/VCC pins 1-2-3, default is none
J2 JOYBG/VCC pins 1-2-3, default is none

need to select Atari or MSX compatible joystick, use J1 and J2 to enable one or the other or leave empty for neither

# Notes

Found an error in the schematic, the audio oscillator should be 3.5795 MHz not 3.57595 MHz.  Updated the tech data to reflect change however PCB will have 3.57595 MHz on silkscreen.  Just ignore it and use the proper frequency oscillator.  It will become obvious once you try to purchase a oscillator that the 3.57595 MHz does not exist.  Will update on the next revision of the PCB but not worth a respin on this alone

Another error is the STATUS LED D3 only is reversed so it must be installed *opposite* of the silkscreen indication.  This is a result of an import error from an older version of the KiCAD schematic.  The other LEDs are OK
