EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Z80ENET-rescue:74LS245-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue U2
U 1 1 637504C8
P 1900 3950
F 0 "U2" H 2000 4525 60  0000 L BNN
F 1 "74LS245" H 1800 3500 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 1900 3950 60  0001 C CNN
F 3 "" H 1900 3950 60  0001 C CNN
	1    1900 3950
	1    0    0    -1  
$EndComp
Text Label 900  5350 0    60   ~ 0
WR#
Text Label 900  5150 0    60   ~ 0
IORQ#
Text Label 900  3550 0    60   ~ 0
D1
Text Label 900  3650 0    60   ~ 0
D2
Text Label 900  3750 0    60   ~ 0
D3
Text Label 900  3450 0    60   ~ 0
D0
Text Label 900  3950 0    60   ~ 0
D5
Text Label 900  4050 0    60   ~ 0
D6
Text Label 900  4150 0    60   ~ 0
D7
Text Label 900  3850 0    60   ~ 0
D4
NoConn ~ 2600 4950
Text Label 900  5250 0    60   ~ 0
M1#
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 6044C0E0
P 4400 3350
F 0 "SW1" H 4400 3900 50  0000 C CNN
F 1 "IO PORT ADDR" H 4400 2900 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Slide_9.78x22.5mm_W7.62mm_P2.54mm" H 4400 3350 50  0001 C CNN
F 3 "" H 4400 3350 50  0001 C CNN
	1    4400 3350
	1    0    0    1   
$EndComp
$Comp
L Z80ENET-rescue:RR8-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue RR1
U 1 1 6044D2F4
P 5150 4300
F 0 "RR1" H 5200 4900 70  0000 C CNN
F 1 "10K" V 5180 4300 70  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" H 5150 4300 60  0001 C CNN
F 3 "" H 5150 4300 60  0001 C CNN
	1    5150 4300
	0    1    1    0   
$EndComp
Text Notes 950  1850 0    60   ~ 0
Z80 BUS INTERFACE
Text Label 900  4750 0    60   ~ 0
RESET#
$Comp
L Z80ENET-rescue:VCC-power-Z80KBDMSE2-rescue #PWR06
U 1 1 604651AE
P 5600 3950
F 0 "#PWR06" H 5600 4050 30  0001 C CNN
F 1 "VCC" H 5600 4050 30  0000 C CNN
F 2 "" H 5600 3950 60  0001 C CNN
F 3 "" H 5600 3950 60  0001 C CNN
	1    5600 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  5150 1200 5150
Wire Wire Line
	800  5350 1200 5350
Wire Wire Line
	800  3450 1200 3450
Wire Wire Line
	800  3550 1200 3550
Wire Wire Line
	800  3650 1200 3650
Wire Wire Line
	800  3750 1200 3750
Wire Wire Line
	800  3850 1200 3850
Wire Wire Line
	800  3950 1200 3950
Wire Wire Line
	800  4050 1200 4050
Wire Wire Line
	800  4150 1200 4150
Wire Wire Line
	800  4350 1200 4350
Wire Wire Line
	800  5250 1200 5250
Connection ~ 4100 3650
Connection ~ 4100 3750
Wire Wire Line
	4700 3550 5000 3550
Wire Wire Line
	4700 3650 4900 3650
Wire Wire Line
	4700 3750 4800 3750
Wire Wire Line
	4800 3950 4800 3750
Connection ~ 4800 3750
Wire Wire Line
	4900 3950 4900 3650
Connection ~ 4900 3650
Wire Wire Line
	5000 3950 5000 3550
Connection ~ 5000 3550
Wire Wire Line
	5100 3950 5100 3450
Wire Wire Line
	5200 3950 5200 3350
Wire Wire Line
	5300 3950 5300 3250
Wire Wire Line
	5400 3950 5400 3150
Wire Wire Line
	5500 3950 5500 3050
Wire Wire Line
	2600 5350 3700 5350
Wire Wire Line
	3700 5350 3700 1700
Wire Wire Line
	3600 5450 3600 1600
Wire Wire Line
	2700 3450 2600 3450
Wire Wire Line
	2800 3550 2600 3550
Wire Wire Line
	2800 800  2800 3550
Wire Wire Line
	2900 3650 2600 3650
Wire Wire Line
	2900 900  2900 3650
Wire Wire Line
	3000 3750 2600 3750
Wire Wire Line
	3000 1000 3000 3750
Wire Wire Line
	3100 3850 2600 3850
Wire Wire Line
	3100 1100 3100 3850
Wire Wire Line
	3200 3950 2600 3950
Wire Wire Line
	3200 1200 3200 3950
Wire Wire Line
	3300 4050 2600 4050
Wire Wire Line
	3300 1300 3300 4050
Wire Wire Line
	2600 4150 3400 4150
Wire Wire Line
	3400 4150 3400 1400
Wire Wire Line
	6000 3950 6000 5150
Wire Wire Line
	800  4750 1200 4750
Wire Wire Line
	2600 4750 3500 4750
Wire Wire Line
	3500 4750 3500 1500
$Comp
L Z80ENET-rescue:GND-power-Z80KBDMSE2-rescue #PWR04
U 1 1 60465D86
P 4100 3950
F 0 "#PWR04" H 4100 3950 30  0001 C CNN
F 1 "GND" H 4100 3880 30  0001 C CNN
F 2 "" H 4100 3950 60  0001 C CNN
F 3 "" H 4100 3950 60  0001 C CNN
	1    4100 3950
	1    0    0    -1  
$EndComp
Text Label 2650 5250 0    60   ~ 0
bM1#
Text Label 2650 5150 0    60   ~ 0
bIORQ#
Text Label 2650 5350 0    60   ~ 0
bWR#
Text Notes 4750 1950 0    60   ~ 0
IO SELECTION CIRCUIT
Text Notes 4000 4200 0    60   ~ 0
SET IO PORT
Wire Wire Line
	4100 3550 4100 3650
Wire Wire Line
	4100 3650 4100 3750
Wire Wire Line
	4100 3750 4100 3950
Wire Wire Line
	4800 3750 6000 3750
Wire Wire Line
	4900 3650 6000 3650
Wire Wire Line
	5000 3550 6000 3550
Wire Wire Line
	5100 3450 6000 3450
Wire Wire Line
	5200 3350 6000 3350
Wire Wire Line
	5300 3250 6000 3250
Wire Wire Line
	5400 3150 6000 3150
Wire Wire Line
	5500 3050 6000 3050
$Comp
L Z80ENET-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue U3
U 1 1 603971B6
P 1900 5250
F 0 "U3" H 1950 5050 60  0000 C CNN
F 1 "74LS244" H 2000 4850 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 1900 5250 60  0001 C CNN
F 3 "" H 1900 5250 60  0001 C CNN
	1    1900 5250
	1    0    0    -1  
$EndComp
NoConn ~ 1200 4950
Text Label 850  4600 0    60   ~ 0
CS_ENET#
Wire Wire Line
	3700 1700 8400 1700
Wire Wire Line
	3600 1600 8400 1600
Wire Wire Line
	3500 1500 8400 1500
Wire Wire Line
	3300 1300 8400 1300
Wire Wire Line
	2800 800  8400 800 
Wire Wire Line
	2700 700  8400 700 
Wire Wire Line
	3400 1400 8400 1400
Wire Wire Line
	3200 1200 8400 1200
Wire Wire Line
	3100 1100 8400 1100
Wire Wire Line
	3000 1000 8400 1000
Wire Wire Line
	2900 900  8400 900 
Text Label 900  4350 0    60   ~ 0
RD#
Text Label 900  2450 0    60   ~ 0
A3
Text Label 900  2650 0    60   ~ 0
A5
Text Label 900  2750 0    60   ~ 0
A6
Text Label 900  2850 0    60   ~ 0
A7
Text Label 900  2550 0    60   ~ 0
A4
Text Label 900  2150 0    60   ~ 0
A0
Text Label 900  2350 0    60   ~ 0
A2
Text Label 900  2250 0    60   ~ 0
A1
Wire Wire Line
	800  2450 1200 2450
Wire Wire Line
	800  2550 1200 2550
Wire Wire Line
	800  2650 1200 2650
Wire Wire Line
	800  2750 1200 2750
Wire Wire Line
	800  2850 1200 2850
Wire Wire Line
	800  2150 1200 2150
Wire Wire Line
	800  2250 1200 2250
Wire Wire Line
	800  2350 1200 2350
Wire Wire Line
	2700 700  2700 3450
Wire Wire Line
	2600 2850 6000 2850
Wire Wire Line
	2600 2750 6000 2750
Wire Wire Line
	2600 2650 6000 2650
Text Label 3800 2350 0    60   ~ 0
bA2
Text Label 3800 2550 0    60   ~ 0
bA4
Text Label 3800 2850 0    60   ~ 0
bA7
Text Label 3800 2750 0    60   ~ 0
bA6
Text Label 3800 2650 0    60   ~ 0
bA5
Text Label 3800 2450 0    60   ~ 0
bA3
$Comp
L Z80ENET-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue U1
U 1 1 60BC80C2
P 1900 2650
F 0 "U1" H 2000 3225 60  0000 L BNN
F 1 "74LS244" H 1800 2200 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 1900 2650 60  0001 C CNN
F 3 "" H 1900 2650 60  0001 C CNN
	1    1900 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	600  5650 600  3050
Wire Wire Line
	600  3050 1200 3050
Wire Wire Line
	1200 3150 1200 3050
Connection ~ 1200 3050
Text Label 2650 4750 0    60   ~ 0
bRESET#
Wire Wire Line
	700  4600 700  4850
Wire Wire Line
	700  4850 1200 4850
Wire Wire Line
	2600 4850 3500 4850
Wire Wire Line
	3500 4850 3500 6550
NoConn ~ 4700 3050
Text Label 3800 2150 0    60   ~ 0
bA0
Text Label 3800 2250 0    60   ~ 0
bA1
Wire Wire Line
	700  4450 700  4600
Connection ~ 700  4600
Wire Wire Line
	700  4450 1200 4450
Wire Wire Line
	700  4600 7100 4600
NoConn ~ 1200 5050
NoConn ~ 2600 5050
Text Label 6000 5050 1    60   ~ 0
688SEL#
$Comp
L 74xx:74LS688 U6
U 1 1 604A100F
P 6500 3050
F 0 "U6" H 6200 4100 50  0000 C CNN
F 1 "74LS688" H 6200 2000 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6500 3050 50  0001 C CNN
F 3 "" H 6500 3050 50  0001 C CNN
	1    6500 3050
	1    0    0    -1  
$EndComp
NoConn ~ 4100 3050
Wire Wire Line
	5850 8350 6300 8350
Connection ~ 1200 5650
NoConn ~ 5600 6700
NoConn ~ 5600 6600
NoConn ~ 5600 6500
NoConn ~ 5600 6400
Wire Wire Line
	5600 6700 6250 6700
Wire Wire Line
	5600 6600 6250 6600
Wire Wire Line
	5600 6500 6250 6500
Wire Wire Line
	5600 6400 6250 6400
Text Label 5650 6700 0    60   ~ 0
IEO
Text Label 5650 6400 0    60   ~ 0
BAI#
Text Label 5650 6500 0    60   ~ 0
BAO#
Text Label 5650 6600 0    60   ~ 0
IEI
$Comp
L Z80ENET-rescue:CONN_4-conn-Z80KBDMSE2-rescue P3
U 1 1 637504D4
P 6600 6550
F 0 "P3" V 6550 6550 60  0000 C CNN
F 1 "DAISY CHAIN" V 6650 6550 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6600 6550 60  0001 C CNN
F 3 "" H 6600 6550 60  0001 C CNN
	1    6600 6550
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:GND-00JRCsch-Z80KBDMSE2-rescue #PWR016
U 1 1 610CFA90
P 4400 6700
F 0 "#PWR016" H 4400 6700 30  0001 C CNN
F 1 "GND" H 4400 6630 30  0001 C CNN
F 2 "" H 4400 6700 60  0000 C CNN
F 3 "" H 4400 6700 60  0000 C CNN
	1    4400 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 6650 4650 6650
Connection ~ 4400 6650
Wire Wire Line
	4400 6650 4400 6700
Wire Wire Line
	4150 6650 4400 6650
$Comp
L mechanical:MountingHole_Pad H2
U 1 1 61081B3A
P 4650 6550
F 0 "H2" H 4750 6599 50  0000 L CNN
F 1 "BRACKET" H 4750 6508 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 4650 6550 50  0001 C CNN
F 3 "~" H 4650 6550 50  0001 C CNN
	1    4650 6550
	1    0    0    -1  
$EndComp
$Comp
L mechanical:MountingHole_Pad H1
U 1 1 637504D2
P 4150 6550
F 0 "H1" H 4250 6599 50  0000 L CNN
F 1 "BRACKET" H 4250 6508 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 4150 6550 50  0001 C CNN
F 3 "~" H 4150 6550 50  0001 C CNN
	1    4150 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 6550 3250 6500
Wire Wire Line
	3250 6200 3250 6150
Wire Wire Line
	5450 7950 5450 8750
Wire Wire Line
	5450 7650 5450 7600
Wire Wire Line
	3650 7100 4400 7100
Text Notes 3500 6400 1    60   ~ 0
IO CHIP SELECT
Wire Wire Line
	3500 6550 3250 6550
$Comp
L Z80ENET-rescue:VCC-power-Z80KBDMSE2-rescue #PWR03
U 1 1 637504D1
P 3250 5650
F 0 "#PWR03" H 3250 5750 30  0001 C CNN
F 1 "VCC" H 3250 5750 30  0000 C CNN
F 2 "" H 3250 5650 60  0001 C CNN
F 3 "" H 3250 5650 60  0001 C CNN
	1    3250 5650
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue R12
U 1 1 6068F201
P 3250 5900
F 0 "R12" V 3330 5900 50  0000 C CNN
F 1 "470" V 3250 5900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3250 5900 60  0001 C CNN
F 3 "" H 3250 5900 60  0001 C CNN
	1    3250 5900
	-1   0    0    1   
$EndComp
$Comp
L device:LED D1
U 1 1 6068F1F7
P 3250 6350
F 0 "D1" H 3250 6450 50  0000 C CNN
F 1 "LED" H 3250 6250 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 3250 6350 60  0001 C CNN
F 3 "" H 3250 6350 60  0001 C CNN
	1    3250 6350
	0    -1   -1   0   
$EndComp
$Comp
L Z80ENET-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue C6
U 1 1 637B9E50
P 2900 7300
F 0 "C6" H 2950 7400 50  0000 L CNN
F 1 "0.1u" H 2950 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2900 7300 60  0001 C CNN
F 3 "" H 2900 7300 60  0001 C CNN
	1    2900 7300
	1    0    0    -1  
$EndComp
Text Label 7200 2150 0    60   ~ 0
CS_ENET#
Wire Wire Line
	7100 2150 8400 2150
Connection ~ 7100 2150
Wire Wire Line
	4650 7100 5150 7100
Wire Wire Line
	600  5650 1200 5650
Text Label 7900 700  0    60   ~ 0
bD0
Text Label 7900 800  0    60   ~ 0
bD1
Text Label 7900 1300 0    60   ~ 0
bD6
Text Label 7900 900  0    60   ~ 0
bD2
Text Label 7900 1000 0    60   ~ 0
bD3
Text Label 7900 1100 0    60   ~ 0
bD4
Text Label 7900 1200 0    60   ~ 0
bD5
Text Label 7900 1400 0    60   ~ 0
bD7
Text Label 7900 1500 0    60   ~ 0
bRESET#
Text Label 7900 1600 0    60   ~ 0
bRD#
Text Label 7900 1700 0    60   ~ 0
bWR#
Wire Wire Line
	2400 7500 2650 7500
Wire Wire Line
	1900 7500 2150 7500
Wire Wire Line
	1650 7500 1900 7500
Wire Wire Line
	1900 7100 2150 7100
Wire Wire Line
	2150 7100 2400 7100
Wire Wire Line
	2400 7100 2650 7100
Wire Wire Line
	5150 7100 5450 7100
Wire Wire Line
	2650 7100 2900 7100
Wire Wire Line
	2150 7500 2400 7500
Wire Wire Line
	4400 7500 4650 7500
Wire Wire Line
	4400 7100 4650 7100
Wire Wire Line
	2650 7500 2900 7500
Wire Wire Line
	1200 5650 1200 5750
Wire Wire Line
	7100 4600 7100 2150
Text Label 2650 5450 0    60   ~ 0
bRD#
Text Label 900  5650 0    60   ~ 0
ZERO
Wire Wire Line
	5850 8250 6300 8250
Wire Wire Line
	5850 8150 6300 8150
Wire Wire Line
	5850 8050 6300 8050
Wire Wire Line
	5850 7950 6300 7950
Wire Wire Line
	5850 7850 6300 7850
Wire Wire Line
	5850 7750 6300 7750
Wire Wire Line
	5850 7650 6300 7650
Wire Wire Line
	5850 7550 6300 7550
Wire Wire Line
	5850 7450 6300 7450
Connection ~ 2400 7500
Connection ~ 1900 7500
Connection ~ 1650 7500
Connection ~ 1900 7100
Connection ~ 2150 7100
Connection ~ 2400 7100
Connection ~ 5150 7100
Wire Wire Line
	5150 7750 5150 7100
Wire Wire Line
	1400 7500 1400 8750
Connection ~ 1400 7500
Connection ~ 4650 7100
Wire Wire Line
	2600 5450 3600 5450
Wire Wire Line
	7000 2150 7100 2150
Connection ~ 2650 7100
Connection ~ 2150 7500
Connection ~ 4400 7500
Connection ~ 4400 7100
Connection ~ 2650 7500
Wire Wire Line
	2900 7500 2900 7550
Connection ~ 2900 7500
Connection ~ 2900 7100
Connection ~ 3650 7100
Wire Wire Line
	1400 7500 1650 7500
Wire Wire Line
	1650 7100 1900 7100
Wire Wire Line
	800  5450 1200 5450
Text Notes 10300 9100 0    60   ~ 0
Spare Components
Text Notes 800  6050 0    60   ~ 0
Note: Buffers/Transceivers\nrespond to IO and MEM cycles
Text Notes 4100 5850 0    60   ~ 0
Note: Inhibit Board Operation\nDuring Interrupts\nM1# = low, IORQ# = low
Text Notes 7400 4650 0    60   ~ 0
Note: IO Address Ports $C0-$DF\nS1=off - A7 (high)\nS2=off - A6 (high)\nS3=on - A5 (low)\nS4=x - A4 (no effect)\nS5=x - A3 (no effect)\nS6=x - A2 (no effect)\nS7=x - A1 (no effect)\nS8=x - A0 (no effect)
$Comp
L Z80ENET-rescue:GND-power-Z80KBDMSE2-rescue #PWR08
U 1 1 6044E58D
P 6500 4250
F 0 "#PWR08" H 6500 4250 30  0001 C CNN
F 1 "GND" H 6500 4180 30  0001 C CNN
F 2 "" H 6500 4250 60  0001 C CNN
F 3 "" H 6500 4250 60  0001 C CNN
	1    6500 4250
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:VCC-power-Z80KBDMSE2-rescue #PWR07
U 1 1 6044E13A
P 6500 1850
F 0 "#PWR07" H 6500 1950 30  0001 C CNN
F 1 "VCC" H 6500 1950 30  0000 C CNN
F 2 "" H 6500 1850 60  0001 C CNN
F 3 "" H 6500 1850 60  0001 C CNN
	1    6500 1850
	1    0    0    -1  
$EndComp
Text Label 5900 7850 0    60   ~ 0
SPARE4
Text Label 5900 7750 0    60   ~ 0
SPARE3
Text Label 5900 7450 0    60   ~ 0
SPARE0
Text Label 5900 7550 0    60   ~ 0
SPARE1
Text Label 5900 7650 0    60   ~ 0
SPARE2
Text Label 5900 7950 0    60   ~ 0
SPARE5
Text Label 5900 8050 0    60   ~ 0
SPARE6
Text Label 5900 8350 0    60   ~ 0
SPARE9
Text Label 5900 8250 0    60   ~ 0
SPARE8
Text Label 5900 8150 0    60   ~ 0
SPARE7
$Comp
L Z80ENET-rescue:CONN_10-conn-Z80KBDMSE2-rescue P1
U 1 1 637504CB
P 6650 7900
F 0 "P1" V 6600 7900 60  0000 C CNN
F 1 "SPARES" V 6700 7900 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 6650 7900 60  0001 C CNN
F 3 "" H 6650 7900 60  0001 C CNN
	1    6650 7900
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue R13
U 1 1 603A596D
P 5450 7350
F 0 "R13" V 5530 7350 50  0000 C CNN
F 1 "470" V 5450 7350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5450 7350 60  0001 C CNN
F 3 "" H 5450 7350 60  0001 C CNN
	1    5450 7350
	-1   0    0    1   
$EndComp
$Comp
L device:LED D2
U 1 1 603A5584
P 5450 7800
F 0 "D2" H 5450 7900 50  0000 C CNN
F 1 "LED" H 5450 7700 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5450 7800 60  0001 C CNN
F 3 "" H 5450 7800 60  0001 C CNN
	1    5450 7800
	0    -1   -1   0   
$EndComp
$Comp
L Z80ENET-rescue:CP-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue C11
U 1 1 603A3D80
P 4650 7300
F 0 "C11" H 4700 7400 50  0000 L CNN
F 1 "10u" H 4700 7200 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4650 7300 60  0001 C CNN
F 3 "" H 4650 7300 60  0001 C CNN
	1    4650 7300
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:CP-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue C10
U 1 1 6039BD2A
P 4400 7300
F 0 "C10" H 4450 7400 50  0000 L CNN
F 1 "10u" H 4450 7200 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4400 7300 60  0001 C CNN
F 3 "" H 4400 7300 60  0001 C CNN
	1    4400 7300
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 603A949A
P 1400 7500
F 0 "#FLG01" H 1400 7595 30  0001 C CNN
F 1 "PWR_FLAG" H 1400 7680 30  0000 C CNN
F 2 "" H 1400 7500 60  0001 C CNN
F 3 "" H 1400 7500 60  0001 C CNN
	1    1400 7500
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 603A9456
P 3650 7100
F 0 "#FLG02" H 3650 7195 30  0001 C CNN
F 1 "PWR_FLAG" H 3650 7280 30  0000 C CNN
F 2 "" H 3650 7100 60  0001 C CNN
F 3 "" H 3650 7100 60  0001 C CNN
	1    3650 7100
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:VCC-power-Z80KBDMSE2-rescue #PWR01
U 1 1 603A9412
P 2900 7100
F 0 "#PWR01" H 2900 7200 30  0001 C CNN
F 1 "VCC" H 2900 7200 30  0000 C CNN
F 2 "" H 2900 7100 60  0001 C CNN
F 3 "" H 2900 7100 60  0001 C CNN
	1    2900 7100
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:GND-power-Z80KBDMSE2-rescue #PWR02
U 1 1 603A93CE
P 2900 7550
F 0 "#PWR02" H 2900 7550 30  0001 C CNN
F 1 "GND" H 2900 7480 30  0001 C CNN
F 2 "" H 2900 7550 60  0001 C CNN
F 3 "" H 2900 7550 60  0001 C CNN
	1    2900 7550
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue C5
U 1 1 603A8FA5
P 2650 7300
F 0 "C5" H 2700 7400 50  0000 L CNN
F 1 "0.1u" H 2700 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2650 7300 60  0001 C CNN
F 3 "" H 2650 7300 60  0001 C CNN
	1    2650 7300
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue C4
U 1 1 603A8F29
P 2400 7300
F 0 "C4" H 2450 7400 50  0000 L CNN
F 1 "0.1u" H 2450 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2400 7300 60  0001 C CNN
F 3 "" H 2400 7300 60  0001 C CNN
	1    2400 7300
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue C3
U 1 1 603A8F23
P 2150 7300
F 0 "C3" H 2200 7400 50  0000 L CNN
F 1 "0.1u" H 2200 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2150 7300 60  0001 C CNN
F 3 "" H 2150 7300 60  0001 C CNN
	1    2150 7300
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue C2
U 1 1 603A8ED5
P 1900 7300
F 0 "C2" H 1950 7400 50  0000 L CNN
F 1 "0.1u" H 1950 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1900 7300 60  0001 C CNN
F 3 "" H 1900 7300 60  0001 C CNN
	1    1900 7300
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue C1
U 1 1 637504CA
P 1650 7300
F 0 "C1" H 1700 7400 50  0000 L CNN
F 1 "0.1u" H 1700 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1650 7300 60  0001 C CNN
F 3 "" H 1650 7300 60  0001 C CNN
	1    1650 7300
	1    0    0    -1  
$EndComp
Text Label 900  5450 0    60   ~ 0
RD#
$Comp
L 74xx:74LS06N U?
U 6 1 4ED0F583
P 10750 9400
AR Path="/4ED0F562" Ref="U?"  Part="1" 
AR Path="/4ED0F566" Ref="U?"  Part="1" 
AR Path="/4ED0F583" Ref="U18"  Part="6" 
F 0 "U18" H 10850 9525 50  0000 L BNN
F 1 "74LS06N" H 10850 9200 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10750 9550 50  0001 C CNN
F 3 "" H 10750 9400 60  0001 C CNN
	6    10750 9400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06N U?
U 3 1 4ED0F580
P 9500 5400
AR Path="/4ED0F562" Ref="U?"  Part="1" 
AR Path="/4ED0F580" Ref="U18"  Part="3" 
F 0 "U18" H 9450 5550 50  0000 L BNN
F 1 "74LS06N" H 9350 5200 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9500 5550 50  0001 C CNN
F 3 "" H 9500 5400 60  0001 C CNN
	3    9500 5400
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS06N U?
U 4 1 4ED0F57F
P 10100 5400
AR Path="/4ED0F562" Ref="U?"  Part="1" 
AR Path="/4ED0F566" Ref="U?"  Part="1" 
AR Path="/4ED0F57F" Ref="U18"  Part="4" 
F 0 "U18" H 10050 5550 50  0000 L BNN
F 1 "74LS06N" H 9950 5200 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10100 5550 50  0001 C CNN
F 3 "" H 10100 5400 60  0001 C CNN
	4    10100 5400
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS06N IC?
U 2 1 4ED0F566
P 12850 4400
AR Path="/4ED0F562" Ref="IC?"  Part="1" 
AR Path="/4ED0F566" Ref="U18"  Part="2" 
F 0 "U18" H 12750 4550 50  0000 L BNN
F 1 "74LS06N" H 12750 4200 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12850 4550 50  0001 C CNN
F 3 "" H 12850 4400 60  0001 C CNN
	2    12850 4400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06N U18
U 1 1 4ED0F562
P 8700 1500
F 0 "U18" H 8600 1650 50  0000 L BNN
F 1 "74LS06N" H 8600 1300 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8700 1650 50  0001 C CNN
F 3 "" H 8700 1500 60  0001 C CNN
	1    8700 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2150 4000 2150
$Comp
L Z80ENET-rescue:GND-RESCUE-ColorVDU-ColorVDU-rescue-Z80KBDMSE2-rescue #PWR?
U 1 1 6244BBF7
P 5950 9350
AR Path="/23D9B06244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/394433326244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/6244BBF7" Ref="#PWR011"  Part="1" 
AR Path="/96244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/25E6244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/FFFFFFF06244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/306244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/5AD7153D6244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/A6244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/16244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/23C6386244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/DCBAABCD6244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/755D912A6244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/A86244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/23D9306244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/402488B46244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/3FEFFFFF6244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/23D8D46244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/5AD73C006244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/3D8EA0006244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/3D7E00006244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/3D6CC0006244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/3FE90E566244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/402708B46244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/3FEEF1A96244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/2600006244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/4026BBE76244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/23C7006244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/40263BE76244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/23CC706244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/6FE901F76244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/402988B46244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/4029D5816244BBF7" Ref="#PWR?"  Part="1" 
AR Path="/23BC886244BBF7" Ref="#PWR?"  Part="1" 
F 0 "#PWR011" H 5950 9350 30  0001 C CNN
F 1 "GND" H 5950 9280 30  0001 C CNN
F 2 "" H 5950 9350 60  0001 C CNN
F 3 "" H 5950 9350 60  0001 C CNN
	1    5950 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 9250 5950 9350
Text Label 6500 9250 0    60   ~ 0
ZERO
$Comp
L Z80ENET-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue-Z80KBDMSE2-rescue R11
U 1 1 6259FFCF
P 6200 9250
F 0 "R11" V 6280 9250 50  0000 C CNN
F 1 "0" V 6200 9250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6200 9250 60  0001 C CNN
F 3 "" H 6200 9250 60  0001 C CNN
	1    6200 9250
	0    1    1    0   
$EndComp
Wire Wire Line
	6450 9250 6800 9250
Text Label 7700 7350 0    60   ~ 0
A9
Text Label 7700 7250 0    60   ~ 0
A10
Text Label 9000 7250 0    60   ~ 0
A11
Text Label 7700 7450 0    60   ~ 0
A8
Text Label 9000 7450 0    60   ~ 0
A13
Text Label 9000 7550 0    60   ~ 0
A14
Text Label 9000 7650 0    60   ~ 0
A15
Text Label 9000 7350 0    60   ~ 0
A12
Text Label 7700 8150 0    60   ~ 0
A1
Text Label 7700 8050 0    60   ~ 0
A2
Text Label 7700 7950 0    60   ~ 0
A3
Text Label 7700 8250 0    60   ~ 0
A0
Text Label 7700 7750 0    60   ~ 0
A5
Text Label 7700 7650 0    60   ~ 0
A6
Text Label 7700 7550 0    60   ~ 0
A7
Text Label 7700 7850 0    60   ~ 0
A4
Text Label 7700 8350 0    60   ~ 0
GND
Text Label 7700 8450 0    60   ~ 0
RFSH#
Text Label 9000 8950 0    60   ~ 0
HALT#
Text Label 7700 8950 0    60   ~ 0
BUSACK#
Text Label 7700 8550 0    60   ~ 0
M1#
Text Label 7700 8750 0    60   ~ 0
BUSRQ#
Text Label 9000 8850 0    60   ~ 0
NMI#
Text Label 9000 8750 0    60   ~ 0
INT#
Text Label 7700 8850 0    60   ~ 0
WAIT#
Text Label 7700 8650 0    60   ~ 0
RESET#
Text Label 9000 9050 0    60   ~ 0
MREQ#
Text Label 7700 9050 0    60   ~ 0
WR#
Text Label 7700 9150 0    60   ~ 0
RD#
Text Label 9000 9150 0    60   ~ 0
IORQ#
Text Label 9000 8650 0    60   ~ 0
D1
Text Label 9000 8350 0    60   ~ 0
D2
Text Label 9000 7950 0    60   ~ 0
D3
Text Label 9000 8550 0    60   ~ 0
D0
Text Label 9000 8050 0    60   ~ 0
D5
Text Label 9000 8150 0    60   ~ 0
D6
Text Label 9000 8450 0    60   ~ 0
D7
Text Label 9000 7850 0    60   ~ 0
D4
Text Label 9000 8250 0    60   ~ 0
VCC
Text Label 9000 7750 0    60   ~ 0
CLK
$Comp
L Z80ENET-rescue:CONN_25X2-conn-Z80KBDMSE2-rescue P2
U 1 1 6136A704
P 8500 8450
F 0 "P2" H 8500 9750 60  0000 C CNN
F 1 "Z80 BUS BACKPLANE" V 8500 8450 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x25_P2.54mm_Horizontal" H 8500 8450 60  0001 C CNN
F 3 "" H 8500 8450 60  0001 C CNN
	1    8500 8450
	1    0    0    -1  
$EndComp
Text Label 9000 9450 0    60   ~ 0
SPARE2
Text Label 9000 9350 0    60   ~ 0
SPARE1
Text Label 9000 9250 0    60   ~ 0
SPARE0
Text Label 9000 9550 0    60   ~ 0
SPARE3
Text Label 9000 9650 0    60   ~ 0
SPARE4
Text Label 7700 9450 0    60   ~ 0
SPARE7
Text Label 7700 9350 0    60   ~ 0
SPARE8
Text Label 7700 9250 0    60   ~ 0
SPARE9
Text Label 7700 9550 0    60   ~ 0
SPARE6
Text Label 7700 9650 0    60   ~ 0
SPARE5
Text Notes 7550 7050 0    60   ~ 0
Note: Bus connector is mirror image of Z80\nCPU pin out to mate to backplane whose\nconnectors reflect Z80 CPU pin out.
NoConn ~ 7600 7250
NoConn ~ 7600 7350
NoConn ~ 7600 7450
NoConn ~ 9400 7250
NoConn ~ 9400 7350
NoConn ~ 9400 7450
NoConn ~ 9400 7550
NoConn ~ 9400 7650
NoConn ~ 7600 8450
NoConn ~ 7600 8750
NoConn ~ 7600 8950
Wire Wire Line
	7600 7450 8100 7450
Wire Wire Line
	7600 7350 8100 7350
Wire Wire Line
	7600 7250 8100 7250
Wire Wire Line
	8900 7250 9400 7250
Wire Wire Line
	8900 7350 9400 7350
Wire Wire Line
	8900 7450 9400 7450
Wire Wire Line
	8900 7550 9400 7550
Wire Wire Line
	8900 7650 9400 7650
Wire Wire Line
	7600 8250 8100 8250
Wire Wire Line
	7600 8150 8100 8150
Wire Wire Line
	7600 8050 8100 8050
Wire Wire Line
	7600 7950 8100 7950
Wire Wire Line
	7600 7850 8100 7850
Wire Wire Line
	7600 7750 8100 7750
Wire Wire Line
	7600 7650 8100 7650
Wire Wire Line
	7600 7550 8100 7550
Wire Wire Line
	7600 8350 8100 8350
Wire Wire Line
	7600 8550 8100 8550
Wire Wire Line
	7600 8450 8100 8450
Wire Wire Line
	8900 8950 9400 8950
Wire Wire Line
	7600 8950 8100 8950
Wire Wire Line
	7600 8650 8100 8650
Wire Wire Line
	7600 8850 8100 8850
Wire Wire Line
	7600 8750 8100 8750
Wire Wire Line
	8900 9150 9400 9150
Wire Wire Line
	8900 9050 9400 9050
Wire Wire Line
	7600 9050 8100 9050
Wire Wire Line
	7600 9150 8100 9150
Wire Wire Line
	8900 8550 9400 8550
Wire Wire Line
	8900 8650 9400 8650
Wire Wire Line
	8900 8350 9400 8350
Wire Wire Line
	8900 7950 9400 7950
Wire Wire Line
	8900 7850 9400 7850
Wire Wire Line
	8900 8050 9400 8050
Wire Wire Line
	8900 8150 9400 8150
Wire Wire Line
	8900 8450 9400 8450
Wire Wire Line
	8900 8250 9400 8250
Wire Wire Line
	8900 7750 9400 7750
Wire Wire Line
	7600 9350 8100 9350
Wire Wire Line
	7600 9250 8100 9250
Wire Wire Line
	8900 9250 9400 9250
Wire Wire Line
	7600 9550 8100 9550
Wire Wire Line
	7600 9450 8100 9450
Wire Wire Line
	8900 9550 9400 9550
Wire Wire Line
	8900 9450 9400 9450
Wire Wire Line
	8900 9350 9400 9350
Wire Wire Line
	7600 9650 8100 9650
Wire Wire Line
	8900 9650 9400 9650
NoConn ~ 9400 9050
NoConn ~ 9400 7750
NoConn ~ 9400 8950
Wire Wire Line
	8900 8850 9400 8850
Wire Wire Line
	8900 8750 9400 8750
$Comp
L 74xx:74LS06N U?
U 5 1 4ED0F582
P 10750 9900
AR Path="/4ED0F562" Ref="U?"  Part="1" 
AR Path="/4ED0F582" Ref="U18"  Part="5" 
F 0 "U18" H 10650 10100 50  0000 L BNN
F 1 "74LS06N" H 10600 9650 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10750 10050 50  0001 C CNN
F 3 "" H 10750 9900 60  0001 C CNN
	5    10750 9900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2150 5900 2150
$Comp
L 74xx:74LS06N U18
U 7 1 6688EF83
P 5150 8250
F 0 "U18" H 5050 8300 50  0000 L BNN
F 1 "74LS06N" H 5000 8200 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5150 8400 50  0001 C CNN
F 3 "" H 5150 8250 60  0001 C CNN
	7    5150 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 5150 6000 5150
Wire Wire Line
	5900 5250 5900 2550
Wire Wire Line
	2600 5250 5900 5250
NoConn ~ 10450 9400
NoConn ~ 10450 9900
NoConn ~ 11050 9400
NoConn ~ 11050 9900
$Comp
L rtl8019as:RTL8019AS U22
U 1 1 575EAC71
P 11650 3650
F 0 "U22" H 11050 6250 60  0000 C CNN
F 1 "RTL8019AS" H 11650 3650 60  0000 C CNN
F 2 "Package_QFP:PQFP-100_14x20mm_P0.65mm" H 11650 2500 60  0001 C CNN
F 3 "" H 11650 2500 60  0000 C CNN
	1    11650 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 1300 10400 1300
Wire Wire Line
	10750 1400 10400 1400
Wire Wire Line
	10750 1500 10400 1500
Wire Wire Line
	10750 1600 10400 1600
Wire Wire Line
	10750 1700 10400 1700
Wire Wire Line
	10750 1800 10400 1800
Wire Wire Line
	10750 1900 10400 1900
Wire Wire Line
	10400 2300 10750 2300
Wire Wire Line
	10400 2400 10750 2400
Wire Wire Line
	10400 2500 10750 2500
Wire Wire Line
	10400 2600 10750 2600
Wire Wire Line
	10400 2700 10750 2700
Wire Wire Line
	10400 2800 10750 2800
Wire Wire Line
	10400 2900 10750 2900
Wire Wire Line
	10400 3000 10750 3000
Wire Wire Line
	10400 3100 10750 3100
Wire Wire Line
	10400 3200 10750 3200
Wire Wire Line
	10750 2100 10400 2100
Wire Wire Line
	10400 2100 10400 2200
Wire Wire Line
	10400 1800 10400 1900
Connection ~ 10400 1900
Connection ~ 10400 2400
Connection ~ 10400 2500
Connection ~ 10400 2600
Connection ~ 10400 2700
Connection ~ 10400 2800
Connection ~ 10400 2900
Connection ~ 10400 3000
Connection ~ 10400 3100
Wire Wire Line
	10750 4100 10400 4100
Wire Wire Line
	10750 4000 10400 4000
Wire Wire Line
	10750 3900 10400 3900
Wire Wire Line
	10750 3800 10400 3800
Wire Wire Line
	10750 3700 10400 3700
Wire Wire Line
	10750 3600 10400 3600
Wire Wire Line
	10750 3500 10400 3500
Wire Wire Line
	10750 3400 10400 3400
NoConn ~ 10750 4200
NoConn ~ 10750 4300
NoConn ~ 10750 4400
NoConn ~ 10750 4500
NoConn ~ 10750 4600
NoConn ~ 10750 4700
NoConn ~ 10750 4800
NoConn ~ 10750 4900
Wire Wire Line
	10750 5400 10400 5400
Wire Wire Line
	10750 5500 10400 5500
Wire Wire Line
	10750 5600 10400 5600
Wire Wire Line
	10750 6000 10400 6000
$Comp
L Jackalope-rescue:R-RESCUE-Jackalope R34
U 1 1 575FE950
P 10400 6250
F 0 "R34" V 10480 6250 50  0000 C CNN
F 1 "27K" V 10400 6250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 10400 6250 60  0001 C CNN
F 3 "" H 10400 6250 60  0000 C CNN
	1    10400 6250
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR0131
U 1 1 575FEB2D
P 10400 6500
F 0 "#PWR0131" H 10400 6500 30  0001 C CNN
F 1 "GND" H 10400 6430 30  0001 C CNN
F 2 "" H 10400 6500 60  0000 C CNN
F 3 "" H 10400 6500 60  0000 C CNN
	1    10400 6500
	1    0    0    -1  
$EndComp
NoConn ~ 12550 4500
NoConn ~ 12550 4600
NoConn ~ 12550 4700
NoConn ~ 12550 4800
NoConn ~ 12550 4900
NoConn ~ 12550 5000
NoConn ~ 12550 5100
$Comp
L Jackalope-rescue:R-RESCUE-Jackalope R28
U 1 1 57603128
P 12700 5750
F 0 "R28" V 12780 5750 50  0000 C CNN
F 1 "1M" V 12700 5750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 12700 5750 60  0001 C CNN
F 3 "" H 12700 5750 60  0000 C CNN
	1    12700 5750
	1    0    0    -1  
$EndComp
$Comp
L device1:CRYSTAL X2
U 1 1 576031CB
P 13050 5750
F 0 "X2" H 13050 5900 60  0000 C CNN
F 1 "20MHz" H 13050 5600 60  0000 C CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 13050 5750 60  0001 C CNN
F 3 "" H 13050 5750 60  0000 C CNN
	1    13050 5750
	0    1    1    0   
$EndComp
$Comp
L Jackalope-rescue:C-RESCUE-Jackalope C29
U 1 1 576035B2
P 13500 5450
AR Path="/576035B2" Ref="C29"  Part="1" 
AR Path="/57549396/576035B2" Ref="C29"  Part="1" 
F 0 "C29" H 13550 5550 50  0000 L CNN
F 1 "10p" H 13550 5350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 13500 5450 60  0001 C CNN
F 3 "" H 13500 5450 60  0000 C CNN
	1    13500 5450
	0    1    1    0   
$EndComp
$Comp
L Jackalope-rescue:C-RESCUE-Jackalope C32
U 1 1 576039BA
P 13500 6050
AR Path="/576039BA" Ref="C32"  Part="1" 
AR Path="/57549396/576039BA" Ref="C32"  Part="1" 
F 0 "C32" H 13550 6150 50  0000 L CNN
F 1 "10p" H 13550 5950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 13500 6050 60  0001 C CNN
F 3 "" H 13500 6050 60  0000 C CNN
	1    13500 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	12550 5500 12700 5500
Wire Wire Line
	12850 5500 12850 5450
Wire Wire Line
	12850 5450 13050 5450
Connection ~ 12700 5500
Connection ~ 13050 5450
Wire Wire Line
	13700 5450 13700 6050
Wire Wire Line
	12850 6050 13050 6050
Wire Wire Line
	12850 6000 12850 6050
Wire Wire Line
	12550 6000 12700 6000
Connection ~ 13050 6050
Connection ~ 12700 6000
$Comp
L power1:GND #PWR0132
U 1 1 576044FC
P 13700 6100
F 0 "#PWR0132" H 13700 6100 30  0001 C CNN
F 1 "GND" H 13700 6030 30  0001 C CNN
F 2 "" H 13700 6100 60  0000 C CNN
F 3 "" H 13700 6100 60  0000 C CNN
	1    13700 6100
	1    0    0    -1  
$EndComp
Connection ~ 13700 6050
NoConn ~ 12550 3700
$Comp
L Jackalope-rescue:R-RESCUE-Jackalope R33
U 1 1 57607BD6
P 13350 3700
F 0 "R33" V 13430 3700 50  0000 C CNN
F 1 "1K" V 13350 3700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 13350 3700 60  0001 C CNN
F 3 "" H 13350 3700 60  0000 C CNN
	1    13350 3700
	0    -1   -1   0   
$EndComp
$Comp
L power1:VCC #PWR0133
U 1 1 5760814C
P 13600 3700
F 0 "#PWR0133" H 13600 3800 30  0001 C CNN
F 1 "VCC" H 13600 3800 30  0000 C CNN
F 2 "" H 13600 3700 60  0000 C CNN
F 3 "" H 13600 3700 60  0000 C CNN
	1    13600 3700
	1    0    0    -1  
$EndComp
$Comp
L Jackalope-rescue:R-RESCUE-Jackalope R29
U 1 1 5760B8C1
P 16100 1650
F 0 "R29" V 16180 1650 50  0000 C CNN
F 1 "1K" V 16100 1650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16100 1650 60  0001 C CNN
F 3 "" H 16100 1650 60  0000 C CNN
	1    16100 1650
	0    -1   1    0   
$EndComp
Wire Wire Line
	12550 3900 15600 3900
Wire Wire Line
	12700 3700 12700 3800
Wire Wire Line
	12700 3800 12550 3800
$Comp
L Jackalope-rescue:R-RESCUE-Jackalope R30
U 1 1 5760D87A
P 16100 1350
F 0 "R30" V 16180 1350 50  0000 C CNN
F 1 "1K" V 16100 1350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16100 1350 60  0001 C CNN
F 3 "" H 16100 1350 60  0000 C CNN
	1    16100 1350
	0    -1   1    0   
$EndComp
$Comp
L power1:VCC #PWR0136
U 1 1 5760D880
P 16350 1350
F 0 "#PWR0136" H 16350 1450 30  0001 C CNN
F 1 "VCC" H 16350 1450 30  0000 C CNN
F 2 "" H 16350 1350 60  0000 C CNN
F 3 "" H 16350 1350 60  0000 C CNN
	1    16350 1350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	15700 4000 12550 4000
$Comp
L Jackalope-rescue:R-RESCUE-Jackalope R32
U 1 1 57611880
P 12800 1450
F 0 "R32" V 12880 1450 50  0000 C CNN
F 1 "200" V 12800 1450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 12800 1450 60  0001 C CNN
F 3 "" H 12800 1450 60  0000 C CNN
	1    12800 1450
	0    1    1    0   
$EndComp
$Comp
L Jackalope-rescue:C-RESCUE-Jackalope C34
U 1 1 576122AD
P 13800 2500
AR Path="/576122AD" Ref="C34"  Part="1" 
AR Path="/57549396/576122AD" Ref="C34"  Part="1" 
F 0 "C34" H 13850 2600 50  0000 L CNN
F 1 "10n" H 13850 2400 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 13800 2500 60  0001 C CNN
F 3 "" H 13800 2500 60  0000 C CNN
	1    13800 2500
	1    0    0    -1  
$EndComp
$Comp
L Jackalope-rescue:C-RESCUE-Jackalope C33
U 1 1 576123CB
P 14100 2500
AR Path="/576123CB" Ref="C33"  Part="1" 
AR Path="/57549396/576123CB" Ref="C33"  Part="1" 
F 0 "C33" H 14150 2600 50  0000 L CNN
F 1 "10n" H 14150 2400 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 14100 2500 60  0001 C CNN
F 3 "" H 14100 2500 60  0000 C CNN
	1    14100 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	13800 2700 14100 2700
$Comp
L power1:GND #PWR0137
U 1 1 57612979
P 14100 2850
F 0 "#PWR0137" H 14100 2850 30  0001 C CNN
F 1 "GND" H 14100 2780 30  0001 C CNN
F 2 "" H 14100 2850 60  0000 C CNN
F 3 "" H 14100 2850 60  0000 C CNN
	1    14100 2850
	1    0    0    -1  
$EndComp
$Comp
L power1:GND #PWR0138
U 1 1 57614581
P 14600 2850
F 0 "#PWR0138" H 14600 2850 30  0001 C CNN
F 1 "GND" H 14600 2780 30  0001 C CNN
F 2 "" H 14600 2850 60  0000 C CNN
F 3 "" H 14600 2850 60  0000 C CNN
	1    14600 2850
	1    0    0    -1  
$EndComp
$Comp
L Jackalope-rescue:R-RESCUE-Jackalope FB1
U 1 1 57619F48
P 14600 2600
F 0 "FB1" V 14680 2600 50  0000 C CNN
F 1 "-" V 14600 2600 50  0000 C CNN
F 2 "Choke_Axial_ThroughHole:Choke_Horizontal_RM10mm" H 14600 2600 60  0001 C CNN
F 3 "" H 14600 2600 60  0000 C CNN
	1    14600 2600
	-1   0    0    1   
$EndComp
$Comp
L tm-kicad-lib:HR911105A P4
U 1 1 57AD1EB2
P 14800 1650
F 0 "P4" H 14400 2200 60  0000 C CNN
F 1 "HR911105A" H 14600 2100 60  0000 C CNN
F 2 "Connector_RJ:RJ45_Hanrun_HR911105A" H 14650 1800 60  0001 C CNN
F 3 "" H 14650 1800 60  0000 C CNN
	1    14800 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	14100 1750 13500 1750
Wire Wire Line
	15500 1350 15850 1350
Wire Wire Line
	15500 1650 15850 1650
Wire Wire Line
	15500 1450 15700 1450
Wire Wire Line
	15700 1450 15700 4000
Wire Wire Line
	15600 3900 15600 1750
Wire Wire Line
	15600 1750 15500 1750
NoConn ~ 15500 2050
Wire Wire Line
	15000 2350 14900 2350
Wire Wire Line
	10400 2200 10750 2200
Wire Wire Line
	10400 1900 10400 2000
Wire Wire Line
	10400 2300 10400 2400
Wire Wire Line
	10400 2400 10400 2500
Wire Wire Line
	10400 2500 10400 2600
Wire Wire Line
	10400 2600 10400 2700
Wire Wire Line
	10400 2700 10400 2800
Wire Wire Line
	10400 2800 10400 2900
Wire Wire Line
	10400 2900 10400 3000
Wire Wire Line
	10400 3000 10400 3100
Wire Wire Line
	10400 3100 10400 3200
Wire Wire Line
	12700 5500 12850 5500
Wire Wire Line
	13050 5450 13300 5450
Wire Wire Line
	13050 6050 13300 6050
Wire Wire Line
	12700 6000 12850 6000
Wire Wire Line
	13700 6050 13700 6100
Wire Wire Line
	14100 2700 14100 2850
$Comp
L device:LED D3
U 1 1 6249E80A
P 12950 3700
F 0 "D3" H 12950 3800 50  0000 C CNN
F 1 "LED" H 12950 3600 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 12950 3700 60  0001 C CNN
F 3 "" H 12950 3700 60  0001 C CNN
	1    12950 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	12800 3700 12700 3700
Text Label 10450 1300 0    60   ~ 0
bA0
Text Label 10450 1400 0    60   ~ 0
bA1
Text Label 10450 1500 0    60   ~ 0
bA2
Text Label 10450 1600 0    60   ~ 0
bA3
Text Label 10450 1700 0    60   ~ 0
bA4
Text Label 10450 3400 0    60   ~ 0
bD0
Text Label 10450 3500 0    60   ~ 0
bD1
Text Label 10450 3600 0    60   ~ 0
bD2
Text Label 10450 3700 0    60   ~ 0
bD3
Text Label 10450 3800 0    60   ~ 0
bD4
Text Label 10450 3900 0    60   ~ 0
bD5
Text Label 10450 4000 0    60   ~ 0
bD6
Text Label 10450 4100 0    60   ~ 0
bD7
Text Label 10450 5500 0    60   ~ 0
bRD#
Text Label 10450 5600 0    60   ~ 0
bWR#
Text Label 10300 5900 0    60   ~ 0
CS_ENET#
Wire Wire Line
	10250 5900 10750 5900
Wire Wire Line
	9550 1500 9000 1500
Text Label 9100 1500 0    60   ~ 0
bRESET
Wire Wire Line
	10750 5700 10200 5700
Text Label 10250 5700 0    60   ~ 0
bRESET
Wire Wire Line
	13150 4400 13950 4400
$Comp
L conn:CONN_01X03 J1
U 1 1 62745504
P 14150 4400
F 0 "J1" H 14228 4441 50  0000 L CNN
F 1 "INT SEL" H 14228 4350 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 14150 4400 50  0001 C CNN
F 3 "" H 14150 4400 50  0001 C CNN
	1    14150 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	13950 4500 13600 4500
Text Label 13650 4500 0    60   ~ 0
NMI#
Text Label 13650 4300 0    60   ~ 0
INT#
Wire Wire Line
	13950 4300 13600 4300
Wire Wire Line
	8600 5400 8250 5400
Text Label 8300 5400 0    60   ~ 0
WAIT#
$Comp
L Z80ENET-rescue:VCC-power-Z80KBDMSE2-rescue #PWR05
U 1 1 62979906
P 9800 4900
F 0 "#PWR05" H 9800 5000 30  0001 C CNN
F 1 "VCC" H 9800 5000 30  0000 C CNN
F 2 "" H 9800 4900 60  0001 C CNN
F 3 "" H 9800 4900 60  0001 C CNN
	1    9800 4900
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue R1
U 1 1 62979910
P 9800 5150
F 0 "R1" V 9880 5150 50  0000 C CNN
F 1 "4700" V 9800 5150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 9800 5150 60  0001 C CNN
F 3 "" H 9800 5150 60  0001 C CNN
	1    9800 5150
	-1   0    0    1   
$EndComp
Connection ~ 9800 5400
$Comp
L device:Jumper JP1
U 1 1 62A3281D
P 8900 5400
F 0 "JP1" H 8900 5664 50  0000 C CNN
F 1 "WAIT EN" H 8900 5573 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 8900 5400 50  0001 C CNN
F 3 "~" H 8900 5400 50  0001 C CNN
	1    8900 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 2000 10400 2000
Wire Wire Line
	6450 8900 6800 8900
$Comp
L Z80ENET-rescue:VCC-power-Z80KBDMSE2-rescue #PWR010
U 1 1 621A0AE0
P 5950 8900
F 0 "#PWR010" H 5950 9000 30  0001 C CNN
F 1 "VCC" H 5950 9000 30  0000 C CNN
F 2 "" H 5950 8900 60  0001 C CNN
F 3 "" H 5950 8900 60  0001 C CNN
	1    5950 8900
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue-Z80KBDMSE2-rescue R10
U 1 1 62191C56
P 6200 8900
F 0 "R10" V 6280 8900 50  0000 C CNN
F 1 "0" V 6200 8900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6200 8900 60  0001 C CNN
F 3 "" H 6200 8900 60  0001 C CNN
	1    6200 8900
	0    1    1    0   
$EndComp
Text Label 6500 8900 0    60   ~ 0
ONE
Text Label 10100 3200 0    60   ~ 0
ZERO
Wire Wire Line
	10050 3200 10400 3200
Connection ~ 10400 3200
Text Label 10100 2000 0    60   ~ 0
ZERO
Wire Wire Line
	10050 2000 10400 2000
Wire Wire Line
	10050 2200 10400 2200
Text Label 10100 2200 0    60   ~ 0
ONE
Connection ~ 10400 2200
Wire Wire Line
	10400 5100 10750 5100
Text Label 10450 5100 0    60   ~ 0
ONE
Wire Wire Line
	12550 2700 12900 2700
Text Label 12600 2700 0    60   ~ 0
ONE
$Comp
L power:GND #PWR0103
U 1 1 63116482
P 15000 2350
F 0 "#PWR0103" H 15000 2100 50  0001 C CNN
F 1 "GND" H 15005 2177 50  0000 C CNN
F 2 "" H 15000 2350 50  0001 C CNN
F 3 "" H 15000 2350 50  0001 C CNN
	1    15000 2350
	1    0    0    -1  
$EndComp
Connection ~ 15000 2350
$Comp
L power1:GND #PWR012
U 1 1 632CB032
P 13350 7850
F 0 "#PWR012" H 13350 7850 30  0001 C CNN
F 1 "GND" H 13350 7780 30  0001 C CNN
F 2 "" H 13350 7850 60  0000 C CNN
F 3 "" H 13350 7850 60  0000 C CNN
	1    13350 7850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13350 7650 13350 7850
$Comp
L power1:VCC #PWR09
U 1 1 632ECE22
P 13350 6900
F 0 "#PWR09" H 13350 7000 30  0001 C CNN
F 1 "VCC" H 13350 7000 30  0000 C CNN
F 2 "" H 13350 6900 60  0000 C CNN
F 3 "" H 13350 6900 60  0000 C CNN
	1    13350 6900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	13350 6900 13350 7050
Wire Wire Line
	12550 2900 12900 2900
Text Label 12600 2900 0    60   ~ 0
ZERO
Wire Wire Line
	10750 5100 10750 5200
Wire Wire Line
	12550 1450 12550 1600
Connection ~ 10750 5100
Connection ~ 12550 1600
Wire Wire Line
	11400 900  11500 900 
Connection ~ 11500 900 
Wire Wire Line
	11500 900  11600 900 
Connection ~ 11600 900 
Wire Wire Line
	11600 900  11700 900 
Connection ~ 11700 900 
Wire Wire Line
	11700 900  11800 900 
Connection ~ 11800 900 
Wire Wire Line
	11800 900  11900 900 
$Comp
L power1:VCC #PWR0101
U 1 1 63793E1C
P 11900 900
F 0 "#PWR0101" H 11900 1000 30  0001 C CNN
F 1 "VCC" H 11900 1000 30  0000 C CNN
F 2 "" H 11900 900 60  0000 C CNN
F 3 "" H 11900 900 60  0000 C CNN
	1    11900 900 
	-1   0    0    -1  
$EndComp
Connection ~ 11900 900 
Wire Wire Line
	11400 7050 11500 7050
Wire Wire Line
	11900 7050 11900 7150
Connection ~ 11900 7050
Connection ~ 11500 7050
Wire Wire Line
	11500 7050 11600 7050
Connection ~ 11600 7050
Wire Wire Line
	11600 7050 11700 7050
Connection ~ 11700 7050
Wire Wire Line
	11700 7050 11800 7050
Connection ~ 11800 7050
Wire Wire Line
	11800 7050 11900 7050
$Comp
L power1:GND #PWR0102
U 1 1 637B9441
P 11900 7150
F 0 "#PWR0102" H 11900 7150 30  0001 C CNN
F 1 "GND" H 11900 7080 30  0001 C CNN
F 2 "" H 11900 7150 60  0000 C CNN
F 3 "" H 11900 7150 60  0000 C CNN
	1    11900 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	16350 1650 16350 1350
Connection ~ 16350 1350
NoConn ~ 4100 3150
NoConn ~ 4100 3250
NoConn ~ 4100 3350
NoConn ~ 4100 3450
NoConn ~ 4700 3150
NoConn ~ 4700 3250
NoConn ~ 4700 3350
NoConn ~ 4700 3450
Wire Wire Line
	4000 2250 2600 2250
Wire Wire Line
	2600 2350 4000 2350
Wire Wire Line
	4000 2450 2600 2450
Wire Wire Line
	4000 2550 2600 2550
Wire Wire Line
	6000 2250 5900 2250
Connection ~ 5900 2250
Wire Wire Line
	5900 2250 5900 2150
Wire Wire Line
	6000 2350 5900 2350
Connection ~ 5900 2350
Wire Wire Line
	5900 2350 5900 2250
Wire Wire Line
	6000 2450 5900 2450
Connection ~ 5900 2450
Wire Wire Line
	5900 2450 5900 2350
Wire Wire Line
	6000 2550 5900 2550
Connection ~ 5900 2550
Wire Wire Line
	5900 2550 5900 2450
Wire Wire Line
	2900 7100 3650 7100
Wire Wire Line
	2900 7500 4400 7500
$Comp
L Z80ENET-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue C7
U 1 1 63BC1138
P 10150 1100
F 0 "C7" H 10200 1200 50  0000 L CNN
F 1 "0.1u" H 10200 1000 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 10150 1100 60  0001 C CNN
F 3 "" H 10150 1100 60  0001 C CNN
	1    10150 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 63BEC9BE
P 10150 1300
F 0 "#PWR013" H 10150 1050 50  0001 C CNN
F 1 "GND" H 10155 1127 50  0000 C CNN
F 2 "" H 10150 1300 50  0001 C CNN
F 3 "" H 10150 1300 50  0001 C CNN
	1    10150 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 900  11400 900 
Connection ~ 11400 900 
$Comp
L Z80ENET-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue C8
U 1 1 63C24509
P 13200 850
F 0 "C8" H 13250 950 50  0000 L CNN
F 1 "0.1u" H 13250 750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 13200 850 60  0001 C CNN
F 3 "" H 13200 850 60  0001 C CNN
	1    13200 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 63C24513
P 13200 1050
F 0 "#PWR014" H 13200 800 50  0001 C CNN
F 1 "GND" H 13205 877 50  0000 C CNN
F 2 "" H 13200 1050 50  0001 C CNN
F 3 "" H 13200 1050 50  0001 C CNN
	1    13200 1050
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:VCC-power-Z80KBDMSE2-rescue #PWR015
U 1 1 63CA739E
P 9000 1000
F 0 "#PWR015" H 9000 1100 30  0001 C CNN
F 1 "VCC" H 9000 1100 30  0000 C CNN
F 2 "" H 9000 1000 60  0001 C CNN
F 3 "" H 9000 1000 60  0001 C CNN
	1    9000 1000
	1    0    0    -1  
$EndComp
$Comp
L Z80ENET-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue R2
U 1 1 63CA73A8
P 9000 1250
F 0 "R2" V 9080 1250 50  0000 C CNN
F 1 "4700" V 9000 1250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 9000 1250 60  0001 C CNN
F 3 "" H 9000 1250 60  0001 C CNN
	1    9000 1250
	-1   0    0    1   
$EndComp
Connection ~ 9000 1500
Connection ~ 10400 2000
Text Notes 8200 5850 0    60   ~ 0
NOTE: WAIT# RELIES ON\n4700 PULL UP RESISTOR\nON PROCESSOR BOARD
$Comp
L Memory_EEPROM:93CxxC U4
U 1 1 6420284D
P 13350 7350
F 0 "U4" H 13150 7650 50  0000 C CNN
F 1 "93CxxC" H 13550 7650 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 13350 7350 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001749K.pdf" H 13350 7350 50  0001 C CNN
	1    13350 7350
	1    0    0    -1  
$EndComp
Text Notes 12950 8200 0    60   ~ 0
NOTE: USE AT93C46C\n64X16 BIT
Wire Wire Line
	12950 7350 12850 7350
Wire Wire Line
	12850 7350 12850 6900
Wire Wire Line
	12850 6900 13350 6900
Connection ~ 13350 6900
Wire Wire Line
	12950 7250 12750 7250
Wire Wire Line
	12750 7250 12750 6400
Wire Wire Line
	12750 6400 12550 6400
Wire Wire Line
	12550 6500 14050 6500
Wire Wire Line
	14050 6500 14050 7450
Wire Wire Line
	14050 7450 13750 7450
Wire Wire Line
	13750 7350 13950 7350
Wire Wire Line
	13950 7350 13950 6600
Wire Wire Line
	13950 6600 12550 6600
Wire Wire Line
	12550 6700 13850 6700
Wire Wire Line
	13850 6700 13850 7250
Wire Wire Line
	13850 7250 13750 7250
Wire Wire Line
	13400 1650 14100 1650
Wire Wire Line
	13300 1450 14100 1450
Wire Wire Line
	13200 1350 14100 1350
Wire Wire Line
	11900 900  12100 900 
Wire Wire Line
	12100 900  12100 650 
Wire Wire Line
	12100 650  13200 650 
Text Notes 12600 1400 0    60   ~ 0
NOTE: 1%
Wire Wire Line
	14100 2050 14100 2300
Connection ~ 14100 2700
Wire Wire Line
	13500 1750 13500 2300
Wire Wire Line
	12550 2300 13500 2300
Wire Wire Line
	13400 1650 13400 2100
Wire Wire Line
	12550 2100 13400 2100
Wire Wire Line
	13300 1450 13300 1800
Wire Wire Line
	13200 1600 13200 1350
Wire Wire Line
	12550 1600 13200 1600
Connection ~ 13050 1800
Wire Wire Line
	13050 1450 13050 1800
Wire Wire Line
	12550 1800 13050 1800
Wire Wire Line
	13050 1800 13300 1800
Wire Wire Line
	13800 1950 14100 1950
Wire Wire Line
	13800 1950 13800 2300
Text Notes 9950 3300 1    60   ~ 0
INTERNAL DECODE TO IO BASE 0300H
Connection ~ 5150 8750
Wire Wire Line
	5150 8750 5450 8750
Wire Wire Line
	1400 8750 5150 8750
Text Notes 13000 4950 0    60   ~ 0
NOTE: INT# & NMI# RELY ON\n4700 PULL UP RESISTOR\nON PROCESSOR BOARD
$EndSCHEMATC
