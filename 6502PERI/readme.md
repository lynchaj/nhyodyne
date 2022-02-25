README
February 25, 2022 at 10:45:13 AM EST


This board (hopefully) will provide a CPU6502-specific multi-IO capability consisting of
a 65C22 VIA, 65C51 ACIA, and a 6581 SID sound device.


Open Items
==========

1.	Actual design has not yet been tested, but is based on existing designs, so
	there should be no reason why it wouldn't work.
	
2.	Regarding the I/O port allocation, depending on which functions remain in the 
	final design, there may be an opportunity to remove the DIP switches and replace
	with two jumpers. The SID requires a 32-byte block of port addresses, the VIA 
	requires 16, and the ACIA requires 4. Thus, blocks are allocated in 64-byte 
	chunks. Using this board will likely limit the number of other MBC boards that 
	can co-exist with it and/or greatly change the port allocations such that changes
	to RomWBW might be needed.

3.	Board real estate is exceedingly tight and there's no room for the additional
	circuitry required to derive the PHI1 clock from the main system clock.
	All of the spare pins on the main buss connector have been allocated, so for this
	development version, there's a tie point next to the 65C22 which should
	connect with a "flying lead" to the clock on the MBC6502 CPU card. As such,
	these cards should be kept next to each other. If chip functions are removed
	from the board (i.e., eliminating the 65C51 or the SID), then there would be
	room for an on-board clock divider. Since the 6502-specific software already 
	utilizes the console board, there may be limited use for this function and
	eliminating it would create the necessary room.
	
4.	Again, due to board space, the serial output of the 65C51 is brought out to a
	1x6 0.1" header for use with a TTL-to-USB converter.
	

	
