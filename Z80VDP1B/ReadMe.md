Z80 VPD1B is a board for V9938/V9958 using CXA1645 for video output stage

The following patches are needed (per Dan's build. Mine are similar but slightly different):
- HSYNC (pin 5, U12) needs to be low, not floating I tied it to pin U12,Pin 1 with a jumper
- SCIN (U5) needs the CLK signal, and this is disabled when JP1 is off (which it typically must be off in order to not conflict with the system clock Wink
-- I clipped pin 12 on the bus connector and installed JP1
- R, G, and B need 470 ohm pull downs to ground from pins 22,23 & 24 on the VDP (U3)
- jumper VRESET/VDS (U12, pin 4) to +5 VCC
