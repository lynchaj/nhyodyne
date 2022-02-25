# Z80 PSG V1

Provides GI AY-3-8910 Programmable Sound Generator with three channel FM synthesis

Atari or MSX compatible joysticks or paddles

Power and chip select LEDs

IO ports $E8-$EB

# Jumpers

JP1 AY-3-8910 test input pins 1-2, default is none

J5 Pins 1-2 all channels merged into channel C, Pins 3-4 all channels merged into channel A, default is none

pins 5-7 audio oscillator /2
pins 7-9 audio oscillator /8
pins 6-8 audio oscillator /1
pins 8-10 audio oscillator /4

default is pins 5-7 closed assuming a 3.57595 MHz audio oscillator

J1 POT/VCC pins 1-2-3, default is none
J2 JOYBG/VCC pins 1-2-3, default is none

need to select Atari or MSX compatible joystick, use J1 and J2 to enable one or the other or leave empty for neither
