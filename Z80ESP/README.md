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

To install platformio core for your operating system see the directions [HERE](https://platformio.org/install/cli)
Make sure you follow the additional directions to install the shell commands.

On linux systems it may be necessary to update permissions for the device that is autocreated for the ESP32. [More details](https://docs.platformio.org/en/latest/core/installation/udev-rules.html)

Once platformio is properly setup on your system, you should be able to build and deploy the firmware to the ESP32.

###To build and install the ESP firmware:
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

# ESP32 Opcode Reference
See the Z80ESP commands spread sheet and the cpm test program located in the cpm_test folder



## TO DO
* Write Docs
