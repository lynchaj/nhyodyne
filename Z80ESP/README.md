# ESP32 Multi IO
The Nhyodyne ESP32 board provides the following functions for your Nhyodyne computer
* ANSI Console
* Graphics
* Sprites
* Sound
* Dual USB Serial Support
* WiFi
* Keyboard
* Mouse

This board relies heavily on the FabGL library from Fabrizio Di Vittorio.   More innformation can be found [HERE](http://www.fabglib.org/)

# ESP32 BOM
Qty|Reference(s)|Value|Notes
---|------------|-----|-----
12|C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C13, C14|0.1uF
3|C11, C12, C16|10uF
1|C15|100nf
1|D2|LED
2|D3, D6|1N4001
1|J3|Pin Header, right angle 1x2
1|J4|Pin Header, right angle 1x3
1|J5|Pin Header, right angle 1x3
1|J6|DB15 Female High Density PCB VGA Connector
1|J7|Pin Header, right angle 2x5
1|P2|Pin Header Right Angle 2x25
4|R1, R3, R14, R15|120ohm
1|R2|470ohm
2|R4, R6|2Kohm
2|R5, R13|1Kohm
3|R7, R9, R11|400ohm
3|R8, R10, R12|800ohm
1|R16|270ohm
1|R17|150ohm
1|RR1|10Kohm, networked, 9 pin, 8 resistor
1|RR2|1Kohm, networked, 9 pin, 8 resistor
1|SW1|8 position DIP switch
1|U1|74LS04
2|U2, U4|74LS244
1|U3|74LS245
3|U5, U6, U14|74LS32
2|U7, U9|74HC595
2|U8, U11|74HC165
1|U10|74LS688
2|U12, U13|ESP-WROOM-32 Dev Module|Such As: https://www.amazon.com/ESP-WROOM-32-Development-Microcontroller-Integrated-Compatible/dp/B08D5ZD528
1|U15|74LS244
1|U16|74LS07


# ESP32 Firmware Installation
The firmware for this board requires that platformio be installed on your system.

To install platformio core for your operating system see the directions [HERE](https://platformio.org/install/cli).  
Make sure you follow the additional directions to install the shell commands.

On linux systems it may be necessary to update permissions for the device that is autocreated for the ESP32. [More details](https://docs.platformio.org/en/latest/core/installation/udev-rules.html)  
Once platformio is properly setup on your system, you should be able to build and deploy the firmware to the ESP32.  

## To build and install the ESP firmware:
Take the ESP32 device you have designated as ESP0 and with it NOT INSTALLED in the nhyodyne card, plug it into your computer via USB.
change directory to the ESP0Firmware folder on your PC and from the operating system prompt type
```
pio run -t upload
```

Over the next couple of minutes you should see the build and upload process
something like this:

```
dwerner@lserver02:/lserver03/fileserv/Development/Vintage/Projects/nhyodyne/Z80ESP/ESP0Firmware$ pio run -t upload
Processing esp32dev (platform: espressif32; board: esp32dev; framework: arduino)
-----------------------------------------------------------------------------------------------------------------------
Verbose mode can be enabled via `-v, --verbose` option
CONFIGURATION: https://docs.platformio.org/page/boards/espressif32/esp32dev.html
PLATFORM: Espressif 32 (6.3.2) > Espressif ESP32 Dev Module
HARDWARE: ESP32 240MHz, 320KB RAM, 4MB Flash
DEBUG: Current (cmsis-dap) External (cmsis-dap, esp-bridge, esp-prog, iot-bus-jtag, jlink, minimodule, olimex-arm-usb-ocd, olimex-arm-usb-ocd-h, olimex-arm-usb-tiny-h, olimex-jtag-tiny, tumpa)
PACKAGES:
 - framework-arduinoespressif32 @ 3.20009.0 (2.0.9)
 - tool-esptoolpy @ 1.40501.0 (4.5.1)
 - tool-mkfatfs @ 2.0.1
 - tool-mklittlefs @ 1.203.210628 (2.3)
 - tool-mkspiffs @ 2.230.0 (2.30)
 - toolchain-xtensa-esp32 @ 8.4.0+2021r2-patch5
LDF: Library Dependency Finder -> https://bit.ly/configure-pio-ldf
LDF Modes: Finder ~ deep+, Compatibility ~ soft
Found 34 compatible libraries
Scanning dependencies...
Dependency Graph
|-- FabGL @ 1.0.9
|-- SPI @ 2.0.0
|-- Preferences @ 2.0.0
Building in release mode
Retrieving maximum program size .pio/build/esp32dev/firmware.elf
Checking size .pio/build/esp32dev/firmware.elf
Advanced Memory Usage is available via "PlatformIO Home > Project Inspect"
RAM:   [=         ]   9.3% (used 30632 bytes from 327680 bytes)
Flash: [=====     ]  46.4% (used 608561 bytes from 1310720 bytes)
Configuring upload protocol...
AVAILABLE: cmsis-dap, esp-bridge, esp-prog, espota, esptool, iot-bus-jtag, jlink, minimodule, olimex-arm-usb-ocd, olimex-arm-usb-ocd-h, olimex-arm-usb-tiny-h, olimex-jtag-tiny, tumpa
CURRENT: upload_protocol = esptool
Looking for upload port...
Auto-detected: /dev/ttyUSB0
Uploading .pio/build/esp32dev/firmware.bin
esptool.py v4.5.1
Serial port /dev/ttyUSB0
Connecting.....
Chip is ESP32-D0WD-V3 (revision v3.0)
Features: WiFi, BT, Dual Core, 240MHz, VRef calibration in efuse, Coding Scheme None
Crystal is 40MHz
MAC: 08:b6:1f:33:39:fc
Uploading stub...
Running stub...
Stub running...
Changing baud rate to 460800
Changed.
Configuring flash size...
Flash will be erased from 0x00001000 to 0x00005fff...
Flash will be erased from 0x00008000 to 0x00008fff...
Flash will be erased from 0x0000e000 to 0x0000ffff...
Flash will be erased from 0x00010000 to 0x000a4fff...
Compressed 17488 bytes to 12168...
Writing at 0x00001000... (100 %)
Wrote 17488 bytes (12168 compressed) at 0x00001000 in 0.5 seconds (effective 287.3 kbit/s)...
Hash of data verified.
Compressed 3072 bytes to 146...
Writing at 0x00008000... (100 %)
Wrote 3072 bytes (146 compressed) at 0x00008000 in 0.0 seconds (effective 571.2 kbit/s)...
Hash of data verified.
Compressed 8192 bytes to 47...
Writing at 0x0000e000... (100 %)
Wrote 8192 bytes (47 compressed) at 0x0000e000 in 0.1 seconds (effective 829.3 kbit/s)...
Hash of data verified.
Compressed 608928 bytes to 309667...
Writing at 0x00010000... (5 %)
Writing at 0x00020854... (10 %)
Writing at 0x0002f631... (15 %)
Writing at 0x0003b66a... (21 %)
Writing at 0x0004b725... (26 %)
Writing at 0x00050794... (31 %)
Writing at 0x00056585... (36 %)
Writing at 0x0005c2fd... (42 %)
Writing at 0x0006271e... (47 %)
Writing at 0x000684b2... (52 %)
Writing at 0x0006dceb... (57 %)
Writing at 0x00073098... (63 %)
Writing at 0x0007864e... (68 %)
Writing at 0x0007de33... (73 %)
Writing at 0x0008412b... (78 %)
Writing at 0x0008c053... (84 %)
Writing at 0x00094cba... (89 %)
Writing at 0x0009a559... (94 %)
Writing at 0x0009f9b7... (100 %)
Wrote 608928 bytes (309667 compressed) at 0x00010000 in 8.0 seconds (effective 606.6 kbit/s)...
Hash of data verified.

Leaving...
Hard resetting via RTS pin...
============================================ [SUCCESS] Took 22.49 seconds ============================================
```

Once this is done you can install ESP0 into U12 on your nhyodyne board.  Then repeat the process for the ESP1 and install into U13.


# ESP32 Communication Protocol

The ESP32 board communicates with your system via 3 ports, two IO ports and one status port.

The default configuration sets the base IO to $9C.  IO Communication with ESP0 is at base port, ESP1 is at base port +1 and the status register is at base port +2.

```
ESPBASE         EQU $9C         ; Base Port
ESP0:           EQU ESPBASE     ; ESP0 IO PORT

ESP1:           EQU ESPBASE+1   ; ESP1 IO PORT

ESP_STATUS:     EQU ESPBASE+2   ; ESP  STATUS PORT
                                ; MSB XX XX S S S S S
                                ;           | | | | |- ESP0 READY_OUTPUT
                                ;           | | | |--- ESP0 BUSY
                                ;           | | |----- ESP0 SPARE (unused)
                                ;           | |------- ESP1 READY_OUTPUT
                                ;           |--------- ESP1 BUSY
```

The communication process is fairly straight forward.  Upon reset, the ESP will initialize, set BUSY and READY_OUTPUT to low and wait for an opcode.

To send an opcode or data to the ESP:

* wait for ESPx BUSY bit to go low (a timeout is suggested)
* write the opcode or data to the ESPx IO port
* it is a best practice to wait for ESPx BUSY bit to go high then low (a timeout is suggested) before sending the next byte

If an "out of sync" occurrs, where the ESP is waiting for data rather than an opcode and the host driver is unsure of the state of the ESP, it is possible to resync the ESP back to the "waiting for opcode" state by sending a stream of NULL bytes to the IO port. A stream of more than 25 NULLS should always safely return the ESP back to the "waiting for opcode" state.

Some Opcodes will return one or more bytes to the host system.   For those opcodes

* wait for ESPx BUSY bit to go low (a timeout is suggested)
* wait for ESPx READY_OUTPUT bit to go high (a timeout is suggested)
* Read the ESPx IO port
* it is a best practice to wait for ESPx BUSY bit to go high then low (a timeout is suggested) before sending the next byte

Note that the BUSY bit transitions after a command is written or data is read can happen very fast.   On slower systems a timeout is required as it is possible for the host system to miss this transition if it is not polling fast enough.

It is also a best practice to empty the ESP send buffer before sending an opcode that returns data.

For example code, see the ESPTEST.ASM program in this repo.


# ESP32 ESP0 Opcode Reference

## ESP32 Misc Opcodes

OP CODE|Description|Values
-------|-----------|------
00|NO OPERATION|NONE

The NO OPERATION opcode is used to sync the ESP32 communications stream to a known state, "Waiting for opcode".

Input Parameters: None  
Returns: None  



OP CODE|Description|Values
-------|-----------|------
255|DISCOVER|"E" "S" "P" "3" "2" "V" "1"

The DISCOVER opcode is used by host systems to verify the presence and version of the ESP hardware and firmware.

Input Parameters: None  
Returns: 7 bytes - "E" "S" "P" "3" "2" "V" "1"  



## ESP32 Terminal Opcodes
	
OP CODE|Description|Values
-------|-----------|------
1 |VGA ANSI TERM OUT SINGLE CHAR| OUT-BYTE

The VGA ANSI TERM OUT SINGLE CHAR opcode sends a single byte to the ANSI terminal subsystem of the ESP32.  Using the ANSI escape sequence set, this byte is rendered to the VGA terminal console.

Input Parameters: 1 byte - "OUT CHAR"  
Returns: None  


OP CODE|Description|Values
-------|-----------|------
2 |VGA ANSI TERM OUT NULL TERMINATED STRING| OUT-BYTE	OUT-BYTE	OUT-BYTE	OUT-BYTE	OUT-BYTE	OUT-BYTE	…	…	…	…	NULL

The VGA ANSI TERM OUT NULL TERMINATED STRING opcode sends a null terminated string to the ANSI terminal subsystem of the ESP32.  Using the ANSI escape sequence set, this string is rendered to the VGA terminal console.


Input Parameters: X bytes - string terminated by a null  
Returns: None  


OP CODE|Description|Values
-------|-----------|------
3 |VGA ANSI TERM KEYBOARD IN| IN-BYTE	

The VGA ANSI TERM KEYBOARD IN opcode returns a byte from the terminal keyboard buffer.   If there is no keystrokes in the buffer, the opcode will return a null.


Input Parameters: None  
Returns: 1 byte - input keystroke or null  


OP CODE|Description|Values
-------|-----------|------
4 |VGA ANSI TERM KEYBOARD BUFFER LENGTH| IN-BYTE

The VGA ANSI TERM KEYBOARD BUFFER LENGTH opcode returns the numbser of keystrokes in the ANSI terminal keyboard buffer.


Input Parameters: None  
Returns: 1 byte - keystroke buffer length  


OP CODE|Description|Values
-------|-----------|------
5 |VGA ANSI TERM SET CURSOR| OUT-BYTE

The VGA ANSI TERM SET CURSOR opcode sets the visibility of the terminal cursor.
* 0 = cursor off
* 1 = cursor on


Input Parameters: 1 byte - Cursor status  
Returns: None  


## ESP32 Serial Opcodes

OP CODE|Description|Values
-------|-----------|------
6 |Set Baud Rate| OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE

The Set Baud Rate opcode sets the baud rate for the ESP async serial port.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.   Byte order is least signifigant byte to most significant byte.


Input Parameters: 4 bytes - Baud Rate
Returns: None  



OP CODE|Description|Values
-------|-----------|------
7 |Set Serial Mode| OUT-BYTE

The Set Serial Mode opcode sets the serial communication parameters for the ESP async serial port.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.
Parameters are set as follows:
* 0 = 8 data bits, no parity, 1 stop bits
* 1 = 8 data bits, even parity, 1 stop bits
* 2 = 8 data bits, odd parity, 1 stop bits
* 3 = 7 data bits, no parity, 1 stop bits
* 4 = 7 data bits, even parity, 1 stop bits
* 5 = 7 data bits, odd parity, 1 stop bits

Input Parameters: 1 byte - Serial Mode  
Returns: None  



OP CODE|Description|Values
-------|-----------|------
8 |Serial TX Single char| OUT-BYTE

The Serial TX Single char opcode transmits a single byte through the serial communication port.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.

Input Parameters: 1 byte - char  
Returns: None  



OP CODE|Description|Values
-------|-----------|------
9 |Serial TX Null Terminated String| OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE	…	…	…	…	NULL

The Serial TX Null Terminated String opcode transmits a null terminated string through the serial communication port.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.

Input Parameters: X bytes - string terminated by a null  
Returns: None  


OP CODE|Description|Values
-------|-----------|------
10 |Serial RX| IN-BYTE

The Serial RX opcode returns a byte from the serial communication port buffer.  If there are no values in the buffer, the opcode will return a null.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.   

Input Parameters: None  
Returns: 1 byte - input value or null    


OP CODE|Description|Values
-------|-----------|------
11 |Chars in Serial Buffer| IN-BYTE

The Chars in Serial Buffer opcode returns the numbser of keystrokes in the serial communication port buffer.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.   


Input Parameters: None  
Returns: 1 byte - serial buffer length  


## ESP32 Audio Opcodes

OP CODE|Description|Values
-------|-----------|------
12 |Play Null Terminated String| OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE	…	…	…	…	NULL

The Play Null Terminated String opcode intreprets a string as musical notes and plays them with a square wave tone generator through the audio port on the top of the ESP32 card.  The audio port is at line level and requires amplification. 

Example string: "A4 4 2 A4 4 2 A#4 4 2 C5 4 2 C5 4 2 A#4 4 2 A4 4 2 G4 4 2 F4 4 2 F4 4 2 G4 4 2 A4 4 2 A4 2 2 G4 16 2 G4 2 2 P 8 2 "

The string is in the format:  [note (C,D,E,F,G,A,B) + [#,b] + octave (2..7) + space + tempo (99..1)] + [pause (P) + space + tempo (99.1)]
```
    "A4 4 2" 
     |  | |----- Tempo
     |  |------- Octave (2..7)
     |---------- note to play (or P for pause)
```     

Input Parameters: 1 byte - Cursor status  
Returns: None  


OP CODE|Description|Values
-------|-----------|------
13 |Play Sound	| OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  

The Play Sound opcode plays a sound with the specified parameters through the audio port on the top of the ESP32 card.  The audio port is at line level and requires amplification. 

The following parameters need to be specified in the following order:
* Attack, 4 bytes, Byte order is least signifigant byte to most significant byte.
* Decay, 4 bytes, Byte order is least signifigant byte to most significant byte.
* Sustain, 2 bytes, Byte order is least signifigant byte to most significant byte.
* Release, 4 bytes, Byte order is least signifigant byte to most significant byte.
* WaveType, 1 byte,   0=WAVE_SQUARE,1=WAVE_SINE,2=WAVE_TRIANGLE,3=WAVE_SAW,4=WAVE_NOISE
* Volume, 2 bytes,  Byte order is least signifigant byte to most significant byte.  Even though volume is specified as two bytes, only LSB is used.
* Duration, 2 bytes, Byte order is least signifigant byte to most significant byte.  Duration is in MS.
* FreqStart, 2 bytes, Byte order is least signifigant byte to most significant byte.
* FreqEnd, 2 bytes, Byte order is least signifigant byte to most significant byte.
* ModFreqMode, 1 byte,  0=MODFREQ_NONE,1=MODFREQ_TO_END,2=MODFREQ_TO_RELEASE,3=MODFREQ_TO_SUSTAIN

More detailed information about programming the sound generator can be found [HERE](http://www.fabglib.org/classfabgl_1_1_sound_generator.html)


Input Parameters: 24 bytes
Returns: None  


OP CODE|Description|Values
-------|-----------|------
14 |Set Volume| OUT-BYTE

The Set Volume opcode sets the overall volume of the sound generated by the audio port on the top of the ESP32 card.  The audio port is at line level and requires amplification.


Input Parameters: 1 byte - Volume
Returns: None  


## ESP32 Graphics Opcodes
Set resolution	15	BYTE	(see video resolutions tab)			* Takes a second or two to process, leave plenty of time as ESP needs to reset
Load Font	16	BYTE	(See Fonts tab)
Clear	17
copyRect	18	source x	source x	source y	source y	dest x 	dest x	dest y 	dest y	width	width	height	height
drawBitmap	19	x	x	y	y	width	width	height	height	PixelFormat	length	length	byte	byte	byte	…	…	byte		(bitmap size cannot exceed 31.5K)				FORMATS=1:NATIVE DEVICE,2:MASK(1=OPAQUE 0=TRANSP),3: 8 BITS PIXEL aabbggrr, 4:32BITS PIXEL RGBA
drawChar	20	x	x	y	y	char	font
drawEllipse	21	x	x	y	y	width	width	height	height
drawGlyph	22	x	x	y	y	width	width	height	height	index	index	length	length	byte	byte	byte	…	…	byte
drawLine	23	x	x	y	y	end x	end x	end y	end y
drawRectangle	24	x	x	y	y	end x	end x	end y	end y
fillEllipse	25	x	x	y	y	width	width	height	height
fillRectangle	26	x	x	y	y	end x	end x	end y	end y
getPixel	27	x	x	y	y	B 	G	R
invertRectangle	28	x	x	y	y	end x	end x	end y	end y
lineTo	29	x	x	y	y
moveTo	30	x	x	y	y
scroll	31	x	x	y	y
setBrushColor	32	Color
setLineEnds	33	LineEnds		0=NONE, 1=ROUNDED
setPenColor	34	Color
setPenWidth	35	Width
setPixel	36	x	x	y	y
setGlyphOptions	37	blank	bold	doubleWidth	FillBackground	Invert	Italic	Underline
setPaletteItem	38	index	b	g	r
setMouseCursor	39	index
setMouseCursorPosition	40	x	x	y	y
removeSprites	41
setSpriteMap	42	index	width	width	height	height	pixelformat	length	length	byte	byte	byte	…	…	byte		*AWAYS SET THE HIGHEST INDEX SPRITE LAST, AND THE MAX CONFIGURED SPRITE NUMBER IS 31. (0-32)
setSpriteLocation	43	x	x	y	y	index
setSpriteVisibility	44	index	visible



### ESP32 ESP1 Opcode Reference

## ESP32 Misc Opcodes

OP CODE|Description|Values
-------|-----------|------
00|NO OPERATION|NONE

The NO OPERATION opcode is used to sync the ESP32 communications stream to a known state, "Waiting for opcode".

Input Parameters: None  
Returns: None  



OP CODE|Description|Values
-------|-----------|------
255|DISCOVER|"E" "S" "P" "3" "2" "V" "1"

The DISCOVER opcode is used by host systems to verify the presence and version of the ESP hardware and firmware.

Input Parameters: None  
Returns: 7 bytes - "E" "S" "P" "3" "2" "V" "1"  




## ESP32 WiFi Opcodes
WiFi Set SSID	1	BYTE	BYTE	BYTE	BYTE	BYTE	BYTE	…	…	…	…	NULL		(SSID and Password are retained in device flash)
WiFi Set Password	2	BYTE	BYTE	BYTE	BYTE	BYTE	BYTE	…	…	…	…	NULL
WiFi Connect	3	 	(Connect will attempt DHCP, can be overriden manually)
WiFi Get Status	4	BYTE
WiFi Get Signal Strength	5	BYTE

## ESP32 TCP/IP Opcodes
Get IP Address	12	BYTE	BYTE	BYTE	BYTE
Get Subnet Mask	13	BYTE	BYTE	BYTE	BYTE
Get Gateway	14	BYTE	BYTE	BYTE	BYTE
Get Primary DNS	15	BYTE	BYTE	BYTE	BYTE
Get Secondary DNS	16	BYTE	BYTE	BYTE	BYTE
Set IP Address	17	BYTE	BYTE	BYTE	BYTE
Set Subnet Mask	18	BYTE	BYTE	BYTE	BYTE
Set Gateway	19	BYTE	BYTE	BYTE	BYTE
Set Primary DNS	20	BYTE	BYTE	BYTE	BYTE
Set Secondary DNS	21	BYTE	BYTE	BYTE	BYTE
Set Hostname	22	BYTE	BYTE	BYTE	BYTE	BYTE	BYTE	…	…	…	…	NULL
Create Outgoing Connection	23	Conn#	Port	Port	Hostname	Hostname	Hostname	…	…	…	…	NULL		(0 is for incoming connection, 1-63 is outgoing)
Set Incoming Port	24	Port	Port		(sets listen port for connection 0)
Out Byte to Connection#	25	Conn#	BYTE
Out String to Connection#	26	Conn#	BYTE	BYTE	BYTE	BYTE	BYTE	…	…	…	…	NULL
In Byte From Connection#	27	Conn#	BYTE
Chars in Buffer from Connection#	28	Conn#	BYTE	BYTE

## ESP32 Serial Opcodes

OP CODE|Description|Values
-------|-----------|------
6 |Set Baud Rate| OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE

The Set Baud Rate opcode sets the baud rate for the ESP async serial port.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.   Byte order is least signifigant byte to most significant byte.


Input Parameters: 4 bytes - Baud Rate
Returns: None  



OP CODE|Description|Values
-------|-----------|------
7 |Set Serial Mode| OUT-BYTE

The Set Serial Mode opcode sets the serial communication parameters for the ESP async serial port.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.
Parameters are set as follows:
* 0 = 8 data bits, no parity, 1 stop bits
* 1 = 8 data bits, even parity, 1 stop bits
* 2 = 8 data bits, odd parity, 1 stop bits
* 3 = 7 data bits, no parity, 1 stop bits
* 4 = 7 data bits, even parity, 1 stop bits
* 5 = 7 data bits, odd parity, 1 stop bits

Input Parameters: 1 byte - Serial Mode  
Returns: None  



OP CODE|Description|Values
-------|-----------|------
8 |Serial TX Single char| OUT-BYTE

The Serial TX Single char opcode transmits a single byte through the serial communication port.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.

Input Parameters: 1 byte - char  
Returns: None  



OP CODE|Description|Values
-------|-----------|------
9 |Serial TX Null Terminated String| OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE  OUT-BYTE	…	…	…	…	NULL

The Serial TX Null Terminated String opcode transmits a null terminated string through the serial communication port.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.

Input Parameters: X bytes - string terminated by a null  
Returns: None  


OP CODE|Description|Values
-------|-----------|------
10 |Serial RX| IN-BYTE

The Serial RX opcode returns a byte from the serial communication port buffer.  If there are no values in the buffer, the opcode will return a null.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.   

Input Parameters: None  
Returns: 1 byte - input value or null    


OP CODE|Description|Values
-------|-----------|------
11 |Chars in Serial Buffer| IN-BYTE

The Chars in Serial Buffer opcode returns the numbser of keystrokes in the serial communication port buffer.  This port is exposed through the header on the top of the card and through the USB port on the ESP32 module.   


Input Parameters: None  
Returns: 1 byte - serial buffer length  


## ESP32 Mouse Opcodes
GetMouse	29	left btn	middle btn	right btn	Wheel Delta	X	X	Y	Y

### TO DO
* Improve formatting of README file