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
L Z80KBDMSE-rescue:74LS245-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue U2
U 1 1 637504C8
P 2150 4200
F 0 "U2" H 2250 4775 60  0000 L BNN
F 1 "74LS245" H 2050 3750 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2150 4200 60  0001 C CNN
F 3 "" H 2150 4200 60  0001 C CNN
	1    2150 4200
	1    0    0    -1  
$EndComp
Text Label 1150 5600 0    60   ~ 0
WR#
Text Label 1150 5400 0    60   ~ 0
IORQ#
Text Label 1150 3800 0    60   ~ 0
D1
Text Label 1150 3900 0    60   ~ 0
D2
Text Label 1150 4000 0    60   ~ 0
D3
Text Label 1150 3700 0    60   ~ 0
D0
Text Label 1150 4200 0    60   ~ 0
D5
Text Label 1150 4300 0    60   ~ 0
D6
Text Label 1150 4400 0    60   ~ 0
D7
Text Label 1150 4100 0    60   ~ 0
D4
NoConn ~ 2850 5200
Text Label 1150 5500 0    60   ~ 0
M1#
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 6044C0E0
P 4650 3600
F 0 "SW1" H 4650 4150 50  0000 C CNN
F 1 "IO PORT ADDR" H 4650 3150 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Slide_9.78x22.5mm_W7.62mm_P2.54mm" H 4650 3600 50  0001 C CNN
F 3 "" H 4650 3600 50  0001 C CNN
	1    4650 3600
	1    0    0    1   
$EndComp
$Comp
L Z80KBDMSE-rescue:RR8-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue RR1
U 1 1 6044D2F4
P 5400 4550
F 0 "RR1" H 5450 5150 70  0000 C CNN
F 1 "10K" V 5430 4550 70  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" H 5400 4550 60  0001 C CNN
F 3 "" H 5400 4550 60  0001 C CNN
	1    5400 4550
	0    1    1    0   
$EndComp
Text Notes 1200 2100 0    60   ~ 0
Z80 BUS INTERFACE
Text Label 1150 5000 0    60   ~ 0
RESET#
$Comp
L power:VCC #PWR06
U 1 1 604651AE
P 5850 4200
F 0 "#PWR06" H 5850 4300 30  0001 C CNN
F 1 "VCC" H 5850 4300 30  0000 C CNN
F 2 "" H 5850 4200 60  0001 C CNN
F 3 "" H 5850 4200 60  0001 C CNN
	1    5850 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 5400 1450 5400
Wire Wire Line
	1050 5600 1450 5600
Wire Wire Line
	1050 3700 1450 3700
Wire Wire Line
	1050 3800 1450 3800
Wire Wire Line
	1050 3900 1450 3900
Wire Wire Line
	1050 4000 1450 4000
Wire Wire Line
	1050 4100 1450 4100
Wire Wire Line
	1050 4200 1450 4200
Wire Wire Line
	1050 4300 1450 4300
Wire Wire Line
	1050 4400 1450 4400
Wire Wire Line
	1050 4600 1450 4600
Wire Wire Line
	1050 5500 1450 5500
Connection ~ 4350 3700
Connection ~ 4350 3800
Connection ~ 4350 3900
Connection ~ 4350 4000
Wire Wire Line
	4950 3600 5450 3600
Wire Wire Line
	4950 3700 5350 3700
Wire Wire Line
	4950 3800 5250 3800
Wire Wire Line
	4950 3900 5150 3900
Wire Wire Line
	4950 4000 5050 4000
Wire Wire Line
	5050 4200 5050 4000
Connection ~ 5050 4000
Wire Wire Line
	5150 4200 5150 3900
Connection ~ 5150 3900
Wire Wire Line
	5250 4200 5250 3800
Connection ~ 5250 3800
Wire Wire Line
	5350 4200 5350 3700
Connection ~ 5350 3700
Wire Wire Line
	5450 4200 5450 3600
Connection ~ 5450 3600
Wire Wire Line
	5550 4200 5550 3500
Wire Wire Line
	5650 4200 5650 3400
Wire Wire Line
	5750 4200 5750 3300
Wire Wire Line
	2850 5600 3950 5600
Wire Wire Line
	3950 5600 3950 1950
Wire Wire Line
	3850 5700 3850 1850
Wire Wire Line
	2950 3700 2850 3700
Wire Wire Line
	3050 3800 2850 3800
Wire Wire Line
	3050 1050 3050 3800
Wire Wire Line
	3150 3900 2850 3900
Wire Wire Line
	3150 1150 3150 3900
Wire Wire Line
	3250 4000 2850 4000
Wire Wire Line
	3250 1250 3250 4000
Wire Wire Line
	3350 4100 2850 4100
Wire Wire Line
	3350 1350 3350 4100
Wire Wire Line
	3450 4200 2850 4200
Wire Wire Line
	3450 1450 3450 4200
Wire Wire Line
	3550 4300 2850 4300
Wire Wire Line
	3550 1550 3550 4300
Wire Wire Line
	2850 4400 3650 4400
Wire Wire Line
	3650 4400 3650 1650
Wire Wire Line
	6250 4200 6250 5400
Wire Wire Line
	1050 5000 1450 5000
Wire Wire Line
	2850 5000 3750 5000
Wire Wire Line
	3750 5000 3750 1750
$Comp
L power:GND #PWR04
U 1 1 60465D86
P 4350 4200
F 0 "#PWR04" H 4350 4200 30  0001 C CNN
F 1 "GND" H 4350 4130 30  0001 C CNN
F 2 "" H 4350 4200 60  0001 C CNN
F 3 "" H 4350 4200 60  0001 C CNN
	1    4350 4200
	1    0    0    -1  
$EndComp
Text Label 2900 5500 0    60   ~ 0
bM1#
Text Label 2900 5400 0    60   ~ 0
bIORQ#
Text Label 2900 5600 0    60   ~ 0
bWR#
Text Notes 5000 2200 0    60   ~ 0
IO SELECTION CIRCUIT
Text Notes 4250 4450 0    60   ~ 0
SET IO PORT
Wire Wire Line
	4350 3600 4350 3700
Wire Wire Line
	4350 3700 4350 3800
Wire Wire Line
	4350 3800 4350 3900
Wire Wire Line
	4350 3900 4350 4000
Wire Wire Line
	4350 4000 4350 4200
Wire Wire Line
	5050 4000 6250 4000
Wire Wire Line
	5150 3900 6250 3900
Wire Wire Line
	5250 3800 6250 3800
Wire Wire Line
	5350 3700 6250 3700
Wire Wire Line
	5450 3600 6250 3600
Wire Wire Line
	5550 3500 6250 3500
Wire Wire Line
	5650 3400 6250 3400
Wire Wire Line
	5750 3300 6250 3300
$Comp
L Z80KBDMSE-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue U3
U 1 1 603971B6
P 2150 5500
F 0 "U3" H 2200 5300 60  0000 C CNN
F 1 "74LS244" H 2250 5100 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2150 5500 60  0001 C CNN
F 3 "" H 2150 5500 60  0001 C CNN
	1    2150 5500
	1    0    0    -1  
$EndComp
NoConn ~ 1450 5200
Text Label 1100 4850 0    60   ~ 0
CS_KM#
Wire Wire Line
	3950 1950 8650 1950
Wire Wire Line
	3850 1850 8650 1850
Wire Wire Line
	3750 1750 8650 1750
Wire Wire Line
	3550 1550 8650 1550
Wire Wire Line
	3050 1050 8650 1050
Wire Wire Line
	2950 950  8650 950 
Wire Wire Line
	3650 1650 8650 1650
Wire Wire Line
	3450 1450 8650 1450
Wire Wire Line
	3350 1350 8650 1350
Wire Wire Line
	3250 1250 8650 1250
Wire Wire Line
	3150 1150 8650 1150
Text Label 1150 4600 0    60   ~ 0
RD#
Text Label 1150 2700 0    60   ~ 0
A3
Text Label 1150 2900 0    60   ~ 0
A5
Text Label 1150 3000 0    60   ~ 0
A6
Text Label 1150 3100 0    60   ~ 0
A7
Text Label 1150 2800 0    60   ~ 0
A4
Text Label 1150 2400 0    60   ~ 0
A0
Text Label 1150 2600 0    60   ~ 0
A2
Text Label 1150 2500 0    60   ~ 0
A1
Wire Wire Line
	1050 2700 1450 2700
Wire Wire Line
	1050 2800 1450 2800
Wire Wire Line
	1050 2900 1450 2900
Wire Wire Line
	1050 3000 1450 3000
Wire Wire Line
	1050 3100 1450 3100
Wire Wire Line
	1050 2400 1450 2400
Wire Wire Line
	1050 2500 1450 2500
Wire Wire Line
	1050 2600 1450 2600
Wire Wire Line
	2950 950  2950 3700
Wire Wire Line
	2850 3100 6250 3100
Wire Wire Line
	2850 3000 6250 3000
Wire Wire Line
	2850 2900 6250 2900
Wire Wire Line
	2850 2800 6250 2800
Wire Wire Line
	2850 2700 6250 2700
Text Label 4050 2600 0    60   ~ 0
bA2
Text Label 4050 2800 0    60   ~ 0
bA4
Text Label 4050 3100 0    60   ~ 0
bA7
Text Label 4050 3000 0    60   ~ 0
bA6
Text Label 4050 2900 0    60   ~ 0
bA5
Text Label 4050 2700 0    60   ~ 0
bA3
$Comp
L Z80KBDMSE-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue U1
U 1 1 60BC80C2
P 2150 2900
F 0 "U1" H 2250 3475 60  0000 L BNN
F 1 "74LS244" H 2050 2450 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2150 2900 60  0001 C CNN
F 3 "" H 2150 2900 60  0001 C CNN
	1    2150 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  5900 850  3300
Wire Wire Line
	850  3300 1450 3300
Wire Wire Line
	1450 3400 1450 3300
Connection ~ 1450 3300
Text Label 2900 5000 0    60   ~ 0
bRESET#
Wire Wire Line
	950  4850 950  5100
Wire Wire Line
	950  5100 1450 5100
Wire Wire Line
	2850 5100 3750 5100
Wire Wire Line
	3750 5100 3750 6800
NoConn ~ 4950 3300
Text Label 4050 2400 0    60   ~ 0
bA0
Text Label 4050 2500 0    60   ~ 0
bA1
Wire Wire Line
	950  4700 950  4850
Connection ~ 950  4850
Wire Wire Line
	950  4700 1450 4700
Wire Wire Line
	950  4850 7350 4850
NoConn ~ 1450 5300
NoConn ~ 2850 5300
Text Label 6250 5300 1    60   ~ 0
688SEL#
$Comp
L 74xx:74LS32 U5
U 1 1 60CE86CB
P 14300 8350
F 0 "U5" H 14300 8400 50  0000 C CNN
F 1 "74LS32" H 14300 8300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 14300 8350 50  0001 C CNN
F 3 "" H 14300 8350 50  0001 C CNN
	1    14300 8350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS688 U6
U 1 1 604A100F
P 6750 3300
F 0 "U6" H 6450 4350 50  0000 C CNN
F 1 "74LS688" H 6450 2250 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6750 3300 50  0001 C CNN
F 3 "" H 6750 3300 50  0001 C CNN
	1    6750 3300
	1    0    0    -1  
$EndComp
NoConn ~ 4350 3300
Wire Wire Line
	6100 8600 6550 8600
Connection ~ 1450 5900
NoConn ~ 14600 8000
NoConn ~ 14600 7650
NoConn ~ 14000 8100
NoConn ~ 14000 7900
NoConn ~ 14000 7750
NoConn ~ 14000 7550
$Comp
L 74xx:74LS32 U5
U 2 1 60CEB3F0
P 12400 6550
F 0 "U5" H 12400 6600 50  0000 C CNN
F 1 "74LS32" H 12400 6500 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12400 6550 50  0001 C CNN
F 3 "" H 12400 6550 50  0001 C CNN
	2    12400 6550
	1    0    0    -1  
$EndComp
NoConn ~ 5850 6950
NoConn ~ 5850 6850
NoConn ~ 5850 6750
NoConn ~ 5850 6650
Wire Wire Line
	5850 6950 6500 6950
Wire Wire Line
	5850 6850 6500 6850
Wire Wire Line
	5850 6750 6500 6750
Wire Wire Line
	5850 6650 6500 6650
Text Label 5900 6950 0    60   ~ 0
IEO
Text Label 5900 6650 0    60   ~ 0
BAI#
Text Label 5900 6750 0    60   ~ 0
BAO#
Text Label 5900 6850 0    60   ~ 0
IEI
$Comp
L conn:CONN_4 P3
U 1 1 637504D4
P 6850 6800
F 0 "P3" V 6800 6800 60  0000 C CNN
F 1 "DAISY CHAIN" V 6900 6800 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6850 6800 60  0001 C CNN
F 3 "" H 6850 6800 60  0001 C CNN
	1    6850 6800
	1    0    0    -1  
$EndComp
$Comp
L 00JRCsch:GND #PWR016
U 1 1 610CFA90
P 4650 6950
F 0 "#PWR016" H 4650 6950 30  0001 C CNN
F 1 "GND" H 4650 6880 30  0001 C CNN
F 2 "" H 4650 6950 60  0000 C CNN
F 3 "" H 4650 6950 60  0000 C CNN
	1    4650 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 6900 4900 6900
Connection ~ 4650 6900
Wire Wire Line
	4650 6900 4650 6950
Wire Wire Line
	4400 6900 4650 6900
$Comp
L mechanical:MountingHole_Pad H2
U 1 1 61081B3A
P 4900 6800
F 0 "H2" H 5000 6849 50  0000 L CNN
F 1 "BRACKET" H 5000 6758 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 4900 6800 50  0001 C CNN
F 3 "~" H 4900 6800 50  0001 C CNN
	1    4900 6800
	1    0    0    -1  
$EndComp
$Comp
L mechanical:MountingHole_Pad H1
U 1 1 637504D2
P 4400 6800
F 0 "H1" H 4500 6849 50  0000 L CNN
F 1 "BRACKET" H 4500 6758 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 4400 6800 50  0001 C CNN
F 3 "~" H 4400 6800 50  0001 C CNN
	1    4400 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 9000 5700 9000
Connection ~ 5400 9000
Connection ~ 5400 8000
$Comp
L 74xx:74LS32 U5
U 5 1 60CF4F38
P 5400 8500
F 0 "U5" H 5300 8550 50  0000 L CNN
F 1 "74LS32" H 5250 8450 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5400 8500 50  0001 C CNN
F 3 "" H 5400 8500 50  0001 C CNN
	5    5400 8500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 4 1 60CF14BD
P 14300 7650
F 0 "U5" H 14300 7700 50  0000 C CNN
F 1 "74LS32" H 14300 7600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 14300 7650 50  0001 C CNN
F 3 "" H 14300 7650 50  0001 C CNN
	4    14300 7650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 3 1 60CEDDF6
P 14300 8000
F 0 "U5" H 14300 8050 50  0000 C CNN
F 1 "74LS32" H 14300 7950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 14300 8000 50  0001 C CNN
F 3 "" H 14300 8000 50  0001 C CNN
	3    14300 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 6800 3500 6750
Wire Wire Line
	3500 6450 3500 6400
Wire Wire Line
	5700 8200 5700 9000
Wire Wire Line
	5700 7900 5700 7850
Wire Wire Line
	3900 7350 4650 7350
Text Notes 3750 6650 1    60   ~ 0
IO CHIP SELECT
Wire Wire Line
	3750 6800 3500 6800
$Comp
L power:VCC #PWR03
U 1 1 637504D1
P 3500 5900
F 0 "#PWR03" H 3500 6000 30  0001 C CNN
F 1 "VCC" H 3500 6000 30  0000 C CNN
F 2 "" H 3500 5900 60  0001 C CNN
F 3 "" H 3500 5900 60  0001 C CNN
	1    3500 5900
	1    0    0    -1  
$EndComp
$Comp
L Z80KBDMSE-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue R12
U 1 1 6068F201
P 3500 6150
F 0 "R12" V 3580 6150 50  0000 C CNN
F 1 "470" V 3500 6150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3500 6150 60  0001 C CNN
F 3 "" H 3500 6150 60  0001 C CNN
	1    3500 6150
	-1   0    0    1   
$EndComp
$Comp
L device:LED D1
U 1 1 6068F1F7
P 3500 6600
F 0 "D1" H 3500 6700 50  0000 C CNN
F 1 "LED" H 3500 6500 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 3500 6600 60  0001 C CNN
F 3 "" H 3500 6600 60  0001 C CNN
	1    3500 6600
	0    -1   -1   0   
$EndComp
Connection ~ 3650 7750
Wire Wire Line
	3650 7350 3900 7350
Connection ~ 3650 7350
$Comp
L Z80KBDMSE-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue C8
U 1 1 60B4CA7D
P 3650 7550
F 0 "C8" H 3700 7650 50  0000 L CNN
F 1 "0.1u" H 3700 7450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3650 7550 60  0001 C CNN
F 3 "" H 3650 7550 60  0001 C CNN
	1    3650 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 7750 3650 7750
Connection ~ 3400 7750
Wire Wire Line
	3400 7350 3650 7350
Connection ~ 3400 7350
$Comp
L Z80KBDMSE-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue C7
U 1 1 637B9E5A
P 3400 7550
F 0 "C7" H 3450 7650 50  0000 L CNN
F 1 "0.1u" H 3450 7450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3400 7550 60  0001 C CNN
F 3 "" H 3400 7550 60  0001 C CNN
	1    3400 7550
	1    0    0    -1  
$EndComp
$Comp
L Z80KBDMSE-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue C6
U 1 1 637B9E50
P 3150 7550
F 0 "C6" H 3200 7650 50  0000 L CNN
F 1 "0.1u" H 3200 7450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3150 7550 60  0001 C CNN
F 3 "" H 3150 7550 60  0001 C CNN
	1    3150 7550
	1    0    0    -1  
$EndComp
Text Label 7450 2400 0    60   ~ 0
CS_KM#
Wire Wire Line
	7350 2400 8650 2400
Connection ~ 7350 2400
Wire Wire Line
	4900 7350 5400 7350
Wire Wire Line
	3150 7750 3400 7750
Wire Wire Line
	3150 7350 3400 7350
Wire Wire Line
	850  5900 1450 5900
Text Label 8150 950  0    60   ~ 0
bD0
Text Label 8150 1050 0    60   ~ 0
bD1
Text Label 8150 1550 0    60   ~ 0
bD6
Text Label 8150 1150 0    60   ~ 0
bD2
Text Label 8150 1250 0    60   ~ 0
bD3
Text Label 8150 1350 0    60   ~ 0
bD4
Text Label 8150 1450 0    60   ~ 0
bD5
Text Label 8150 1650 0    60   ~ 0
bD7
Text Label 8150 1750 0    60   ~ 0
bRESET#
Text Label 8150 1850 0    60   ~ 0
bRD#
Text Label 8150 1950 0    60   ~ 0
bWR#
Wire Wire Line
	2650 7750 2900 7750
Wire Wire Line
	2150 7750 2400 7750
Wire Wire Line
	1900 7750 2150 7750
Wire Wire Line
	2150 7350 2400 7350
Wire Wire Line
	2400 7350 2650 7350
Wire Wire Line
	2650 7350 2900 7350
Wire Wire Line
	5400 7350 5700 7350
Wire Wire Line
	2900 7350 3150 7350
Wire Wire Line
	2400 7750 2650 7750
Wire Wire Line
	4650 7750 4900 7750
Wire Wire Line
	4650 7350 4900 7350
Wire Wire Line
	2900 7750 3150 7750
Wire Wire Line
	1450 5900 1450 6000
Wire Wire Line
	7350 4850 7350 2400
Text Label 2900 5700 0    60   ~ 0
bRD#
Text Label 1150 5900 0    60   ~ 0
ZERO
Wire Wire Line
	6100 8500 6550 8500
Wire Wire Line
	6100 8400 6550 8400
Wire Wire Line
	6100 8300 6550 8300
Wire Wire Line
	6100 8200 6550 8200
Wire Wire Line
	6100 8100 6550 8100
Wire Wire Line
	6100 8000 6550 8000
Wire Wire Line
	6100 7900 6550 7900
Wire Wire Line
	6100 7800 6550 7800
Wire Wire Line
	6100 7700 6550 7700
Connection ~ 2650 7750
Connection ~ 2150 7750
Connection ~ 1900 7750
Connection ~ 2150 7350
Connection ~ 2400 7350
Connection ~ 2650 7350
Connection ~ 5400 7350
Wire Wire Line
	5400 8000 5400 7350
Wire Wire Line
	1650 7750 1650 9000
Connection ~ 1650 7750
Connection ~ 4900 7350
Wire Wire Line
	2850 5700 3850 5700
Wire Wire Line
	7250 2400 7350 2400
Connection ~ 2900 7350
Connection ~ 2400 7750
Connection ~ 4650 7750
Connection ~ 4650 7350
Connection ~ 2900 7750
Wire Wire Line
	3150 7750 3150 7800
Connection ~ 3150 7750
Connection ~ 3150 7350
Connection ~ 3900 7350
Wire Wire Line
	1650 7750 1900 7750
Wire Wire Line
	1900 7350 2150 7350
Wire Wire Line
	1050 5700 1450 5700
Text Notes 14200 7350 0    60   ~ 0
Spare Components
Text Notes 1050 6300 0    60   ~ 0
Note: Buffers/Transceivers\nrespond to IO and MEM cycles
Text Notes 4350 6100 0    60   ~ 0
Note: Inhibit Board Operation\nDuring Interrupts\nM1# = low, IORQ# = low
Text Notes 7650 4900 0    60   ~ 0
Note: IO Address Ports $E2-$E3\nS1=off - A7 (high)\nS2=off - A6 (high)\nS3=off - A5 (high)\nS4=on - A4 (low)\nS5=on - A3 (low)\nS6=on - A2 (low)\nS7=off - A1 (high)\nS8=x - A0 (no effect)
$Comp
L power:GND #PWR08
U 1 1 6044E58D
P 6750 4500
F 0 "#PWR08" H 6750 4500 30  0001 C CNN
F 1 "GND" H 6750 4430 30  0001 C CNN
F 2 "" H 6750 4500 60  0001 C CNN
F 3 "" H 6750 4500 60  0001 C CNN
	1    6750 4500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR07
U 1 1 6044E13A
P 6750 2100
F 0 "#PWR07" H 6750 2200 30  0001 C CNN
F 1 "VCC" H 6750 2200 30  0000 C CNN
F 2 "" H 6750 2100 60  0001 C CNN
F 3 "" H 6750 2100 60  0001 C CNN
	1    6750 2100
	1    0    0    -1  
$EndComp
Text Label 6150 8100 0    60   ~ 0
SPARE4
Text Label 6150 8000 0    60   ~ 0
SPARE3
Text Label 6150 7700 0    60   ~ 0
SPARE0
Text Label 6150 7800 0    60   ~ 0
SPARE1
Text Label 6150 7900 0    60   ~ 0
SPARE2
Text Label 6150 8200 0    60   ~ 0
SPARE5
Text Label 6150 8300 0    60   ~ 0
SPARE6
Text Label 6150 8600 0    60   ~ 0
SPARE9
Text Label 6150 8500 0    60   ~ 0
SPARE8
Text Label 6150 8400 0    60   ~ 0
SPARE7
$Comp
L conn:CONN_10 P1
U 1 1 637504CB
P 6900 8150
F 0 "P1" V 6850 8150 60  0000 C CNN
F 1 "SPARES" V 6950 8150 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 6900 8150 60  0001 C CNN
F 3 "" H 6900 8150 60  0001 C CNN
	1    6900 8150
	1    0    0    -1  
$EndComp
$Comp
L Z80KBDMSE-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue R13
U 1 1 603A596D
P 5700 7600
F 0 "R13" V 5780 7600 50  0000 C CNN
F 1 "470" V 5700 7600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5700 7600 60  0001 C CNN
F 3 "" H 5700 7600 60  0001 C CNN
	1    5700 7600
	-1   0    0    1   
$EndComp
$Comp
L device:LED D2
U 1 1 603A5584
P 5700 8050
F 0 "D2" H 5700 8150 50  0000 C CNN
F 1 "LED" H 5700 7950 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5700 8050 60  0001 C CNN
F 3 "" H 5700 8050 60  0001 C CNN
	1    5700 8050
	0    -1   -1   0   
$EndComp
$Comp
L Z80KBDMSE-rescue:CP-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue C11
U 1 1 603A3D80
P 4900 7550
F 0 "C11" H 4950 7650 50  0000 L CNN
F 1 "10u" H 4950 7450 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4900 7550 60  0001 C CNN
F 3 "" H 4900 7550 60  0001 C CNN
	1    4900 7550
	1    0    0    -1  
$EndComp
$Comp
L Z80KBDMSE-rescue:CP-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue C10
U 1 1 6039BD2A
P 4650 7550
F 0 "C10" H 4700 7650 50  0000 L CNN
F 1 "10u" H 4700 7450 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4650 7550 60  0001 C CNN
F 3 "" H 4650 7550 60  0001 C CNN
	1    4650 7550
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 603A949A
P 1650 7750
F 0 "#FLG01" H 1650 7845 30  0001 C CNN
F 1 "PWR_FLAG" H 1650 7930 30  0000 C CNN
F 2 "" H 1650 7750 60  0001 C CNN
F 3 "" H 1650 7750 60  0001 C CNN
	1    1650 7750
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 603A9456
P 3900 7350
F 0 "#FLG02" H 3900 7445 30  0001 C CNN
F 1 "PWR_FLAG" H 3900 7530 30  0000 C CNN
F 2 "" H 3900 7350 60  0001 C CNN
F 3 "" H 3900 7350 60  0001 C CNN
	1    3900 7350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 603A9412
P 3150 7350
F 0 "#PWR01" H 3150 7450 30  0001 C CNN
F 1 "VCC" H 3150 7450 30  0000 C CNN
F 2 "" H 3150 7350 60  0001 C CNN
F 3 "" H 3150 7350 60  0001 C CNN
	1    3150 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 603A93CE
P 3150 7800
F 0 "#PWR02" H 3150 7800 30  0001 C CNN
F 1 "GND" H 3150 7730 30  0001 C CNN
F 2 "" H 3150 7800 60  0001 C CNN
F 3 "" H 3150 7800 60  0001 C CNN
	1    3150 7800
	1    0    0    -1  
$EndComp
$Comp
L Z80KBDMSE-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue C5
U 1 1 603A8FA5
P 2900 7550
F 0 "C5" H 2950 7650 50  0000 L CNN
F 1 "0.1u" H 2950 7450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2900 7550 60  0001 C CNN
F 3 "" H 2900 7550 60  0001 C CNN
	1    2900 7550
	1    0    0    -1  
$EndComp
$Comp
L Z80KBDMSE-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue C4
U 1 1 603A8F29
P 2650 7550
F 0 "C4" H 2700 7650 50  0000 L CNN
F 1 "0.1u" H 2700 7450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2650 7550 60  0001 C CNN
F 3 "" H 2650 7550 60  0001 C CNN
	1    2650 7550
	1    0    0    -1  
$EndComp
$Comp
L Z80KBDMSE-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue C3
U 1 1 603A8F23
P 2400 7550
F 0 "C3" H 2450 7650 50  0000 L CNN
F 1 "0.1u" H 2450 7450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2400 7550 60  0001 C CNN
F 3 "" H 2400 7550 60  0001 C CNN
	1    2400 7550
	1    0    0    -1  
$EndComp
$Comp
L Z80KBDMSE-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue C2
U 1 1 603A8ED5
P 2150 7550
F 0 "C2" H 2200 7650 50  0000 L CNN
F 1 "0.1u" H 2200 7450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2150 7550 60  0001 C CNN
F 3 "" H 2150 7550 60  0001 C CNN
	1    2150 7550
	1    0    0    -1  
$EndComp
$Comp
L Z80KBDMSE-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue C1
U 1 1 637504CA
P 1900 7550
F 0 "C1" H 1950 7650 50  0000 L CNN
F 1 "0.1u" H 1950 7450 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1900 7550 60  0001 C CNN
F 3 "" H 1900 7550 60  0001 C CNN
	1    1900 7550
	1    0    0    -1  
$EndComp
Text Label 1150 5700 0    60   ~ 0
RD#
NoConn ~ 8900 6200
Wire Wire Line
	12100 5150 12400 5150
Wire Wire Line
	11800 5250 12400 5250
Wire Wire Line
	13500 5250 13200 5250
Wire Wire Line
	11800 5350 12400 5350
Wire Wire Line
	12100 4950 12400 4950
Wire Wire Line
	8900 5800 8450 5800
Wire Wire Line
	8900 5700 8450 5700
Wire Wire Line
	8900 5600 8450 5600
Wire Wire Line
	8900 5500 8450 5500
Wire Wire Line
	8450 5400 8900 5400
Wire Wire Line
	11800 2200 11350 2200
Wire Wire Line
	12700 1200 12700 950 
Wire Wire Line
	12100 1200 12100 1000
Wire Wire Line
	15200 3050 14850 3050
Wire Wire Line
	14850 3050 14850 3000
Wire Wire Line
	14850 3000 13700 3000
Wire Wire Line
	15200 2450 14650 2450
Wire Wire Line
	14650 2450 14650 2800
Wire Wire Line
	14650 2800 13700 2800
Wire Wire Line
	15200 1600 14450 1600
Wire Wire Line
	14450 1600 14450 2600
Wire Wire Line
	14450 2600 13700 2600
Wire Wire Line
	11800 2400 11350 2400
Wire Wire Line
	11800 2500 11350 2500
Wire Wire Line
	11350 2300 11800 2300
Wire Wire Line
	11800 2100 11350 2100
Wire Wire Line
	11800 3600 11350 3600
Wire Wire Line
	11800 3200 11350 3200
Wire Wire Line
	11800 3100 11350 3100
Wire Wire Line
	11800 3300 11350 3300
Wire Wire Line
	11800 3400 11350 3400
Wire Wire Line
	11800 3000 11350 3000
Wire Wire Line
	11800 2900 11350 2900
Wire Wire Line
	11800 2700 11350 2700
Wire Wire Line
	11800 2800 11350 2800
Wire Wire Line
	11800 1300 11350 1300
Wire Wire Line
	11800 1800 11350 1800
Wire Wire Line
	11800 1600 10750 1600
Wire Wire Line
	9950 1600 9850 1600
Wire Wire Line
	11800 1900 11350 1900
Wire Wire Line
	11800 2000 11350 2000
Wire Wire Line
	16250 1600 15800 1600
Wire Wire Line
	16250 3050 15800 3050
Wire Wire Line
	16250 2050 15800 2050
Wire Wire Line
	16250 3500 15800 3500
Wire Wire Line
	14150 1600 13700 1600
Wire Wire Line
	14150 1500 13700 1500
Wire Wire Line
	13700 2700 14550 2700
Wire Wire Line
	14550 2700 14550 2050
Wire Wire Line
	14550 2050 15200 2050
Wire Wire Line
	13700 2900 14750 2900
Wire Wire Line
	14750 2900 14750 2650
Wire Wire Line
	14750 2650 15200 2650
Wire Wire Line
	13700 3100 14750 3100
Wire Wire Line
	14750 3100 14750 3500
Wire Wire Line
	14750 3500 15200 3500
Wire Wire Line
	12100 3700 11350 3700
Wire Wire Line
	12700 950  13300 950 
Wire Wire Line
	13700 1300 14150 1300
Wire Wire Line
	8450 5900 8900 5900
Wire Wire Line
	14150 2500 13700 2500
Wire Wire Line
	14150 2400 13700 2400
Wire Wire Line
	14150 2100 13700 2100
Wire Wire Line
	14150 2200 13700 2200
Wire Wire Line
	14150 2000 13700 2000
Wire Wire Line
	14150 1900 13700 1900
Wire Wire Line
	14150 1700 13700 1700
Wire Wire Line
	14150 1800 13700 1800
Wire Wire Line
	12400 4200 11950 4200
Wire Wire Line
	12400 4100 11950 4100
Wire Wire Line
	12400 4300 11950 4300
Wire Wire Line
	12400 4400 11950 4400
Wire Wire Line
	13650 4400 13200 4400
Wire Wire Line
	13650 4500 13200 4500
Wire Wire Line
	13650 4300 13200 4300
Wire Wire Line
	13650 4200 13200 4200
Wire Wire Line
	12400 4500 11950 4500
Wire Wire Line
	13200 4100 13650 4100
Wire Wire Line
	13500 5350 13200 5350
Wire Wire Line
	13800 4950 13200 4950
Wire Wire Line
	12100 5050 12400 5050
Wire Wire Line
	13800 5050 13200 5050
Wire Wire Line
	13500 5150 13200 5150
Text Notes 11900 6050 0    60   ~ 0
Interrupt outputs from the\n8042/82C42 controller
Text Label 11650 6650 0    60   ~ 0
P25-BF
Text Label 11650 6450 0    60   ~ 0
P24-OB
Text Label 12850 6550 0    60   ~ 0
INT
Text Label 15050 2650 0    60   ~ 0
P25-BF
Text Label 15050 2450 0    60   ~ 0
P24-OB
Text Notes 12250 5700 0    60   ~ 0
Keyboard and Mouse\nreversible header
Text Label 12150 5150 0    60   ~ 0
VCC
Text Label 13300 5150 0    60   ~ 0
VCC
Text Label 11850 5250 0    60   ~ 0
MSEDAT
Text Label 13400 5050 0    60   ~ 0
KBDDAT
Text Label 12150 5050 0    60   ~ 0
GND
Text Label 13300 5250 0    60   ~ 0
GND
Text Label 11850 5350 0    60   ~ 0
MSECLK
Text Label 13400 4950 0    60   ~ 0
KBDCLK
Text Label 12150 4950 0    60   ~ 0
GND
Text Label 13300 5350 0    60   ~ 0
GND
$Comp
L conn:CONN_5X2 P27
U 1 1 4EE4E050
P 12800 5150
F 0 "P27" H 12800 5450 60  0000 C CNN
F 1 "KBDMSE" V 12800 5150 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Horizontal" H 12800 5150 60  0001 C CNN
F 3 "" H 12800 5150 60  0001 C CNN
	1    12800 5150
	1    0    0    -1  
$EndComp
Text Label 13250 4100 0    60   ~ 0
VCC
Text Label 12000 4500 0    60   ~ 0
GND
Text Label 13250 4200 0    60   ~ 0
P21
Text Label 13250 4300 0    60   ~ 0
P20
Text Label 13250 4500 0    60   ~ 0
P16
Text Label 13250 4400 0    60   ~ 0
P17
Text Label 12000 4400 0    60   ~ 0
P15
Text Label 12000 4300 0    60   ~ 0
P14
Text Label 12000 4100 0    60   ~ 0
P12
Text Label 12000 4200 0    60   ~ 0
P13
Text Label 13750 1800 0    60   ~ 0
P13
Text Label 13750 1700 0    60   ~ 0
P12
Text Label 13750 1900 0    60   ~ 0
P14
Text Label 13750 2000 0    60   ~ 0
P15
Text Label 13750 2200 0    60   ~ 0
P17
Text Label 13750 2100 0    60   ~ 0
P16
Text Label 13750 2400 0    60   ~ 0
P20
Text Label 13750 2500 0    60   ~ 0
P21
$Comp
L conn:CONN_5X2 P32
U 1 1 4ED2D55C
P 12800 4300
F 0 "P32" H 12800 4600 60  0000 C CNN
F 1 "EXPANSION" V 12800 4300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Horizontal" H 12800 4300 60  0001 C CNN
F 3 "" H 12800 4300 60  0001 C CNN
	1    12800 4300
	1    0    0    -1  
$EndComp
Text Label 6750 9150 0    60   ~ 0
ONE
Text Notes 9900 650  0    60   ~ 0
KEYBOARD AND MOUSE
Text Label 8500 5900 0    60   ~ 0
PROG
Text Label 13750 1300 0    60   ~ 0
PROG
Text Label 8500 5800 0    60   ~ 0
KBDDAT
Text Label 8500 5700 0    60   ~ 0
MSEDAT
Text Label 8500 5500 0    60   ~ 0
MSECLK
Text Label 8500 5600 0    60   ~ 0
KBDCLK
Text Label 8500 5400 0    60   ~ 0
VCC
$Comp
L Z80KBDMSE-rescue:RR8-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue RR2
U 1 1 4ED10290
P 9250 5850
F 0 "RR2" H 9300 6450 70  0000 C CNN
F 1 "4700" V 9280 5850 70  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" H 9250 5850 60  0001 C CNN
F 3 "" H 9250 5850 60  0001 C CNN
	1    9250 5850
	1    0    0    -1  
$EndComp
Text Label 12750 950  0    60   ~ 0
GND
NoConn ~ 10650 1200
NoConn ~ 10650 1100
NoConn ~ 9950 1200
NoConn ~ 9950 1100
NoConn ~ 9950 1000
Text Label 11400 3700 0    60   ~ 0
GND
NoConn ~ 13700 3300
Text Label 13750 1500 0    60   ~ 0
KBDDAT
Text Label 13750 1600 0    60   ~ 0
MSEDAT
Text Label 15850 3500 0    60   ~ 0
KBDDAT
Text Label 15850 2050 0    60   ~ 0
MSECLK
Text Label 15850 3050 0    60   ~ 0
KBDCLK
Text Label 15850 1600 0    60   ~ 0
MSEDAT
Text Label 11400 2000 0    60   ~ 0
MSECLK
Text Label 11400 1900 0    60   ~ 0
KBDCLK
Text Label 11400 2400 0    60   ~ 0
bRD#
Text Label 11400 2500 0    60   ~ 0
bWR#
Text Label 11400 2300 0    60   ~ 0
ONE
Text Label 11400 2100 0    60   ~ 0
bA0
Text Label 11400 3600 0    60   ~ 0
ZERO
Text Label 11400 3400 0    60   ~ 0
bD7
Text Label 11400 3300 0    60   ~ 0
bD6
Text Label 11400 3200 0    60   ~ 0
bD5
Text Label 11400 3100 0    60   ~ 0
bD4
Text Label 11400 3000 0    60   ~ 0
bD3
Text Label 11400 2900 0    60   ~ 0
bD2
Text Label 11400 2800 0    60   ~ 0
bD1
Text Label 11400 2700 0    60   ~ 0
bD0
Text Label 11400 1300 0    60   ~ 0
ZERO
Text Label 11400 1800 0    60   ~ 0
bRESET#
$Comp
L conn:DIL14 U4
U 1 1 4ED0F5D4
P 10300 1300
F 0 "U4" H 10300 1700 60  0000 C CNN
F 1 "8 MHz" V 10300 1300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10300 1300 60  0001 C CNN
F 3 "" H 10300 1300 60  0001 C CNN
	1    10300 1300
	1    0    0    -1  
$EndComp
Text Label 9550 1600 0    60   ~ 0
GND
$Comp
L 74xx:74LS06N U?
U 6 1 4ED0F583
P 13350 6550
AR Path="/4ED0F562" Ref="U?"  Part="1" 
AR Path="/4ED0F566" Ref="U?"  Part="1" 
AR Path="/4ED0F583" Ref="U18"  Part="6" 
F 0 "U18" H 13450 6675 50  0000 L BNN
F 1 "74LS06N" H 13450 6350 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 13350 6700 50  0001 C CNN
F 3 "" H 13350 6550 60  0001 C CNN
	6    13350 6550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06N U?
U 3 1 4ED0F580
P 15500 1600
AR Path="/4ED0F562" Ref="U?"  Part="1" 
AR Path="/4ED0F580" Ref="U18"  Part="3" 
F 0 "U18" H 15600 1725 50  0000 L BNN
F 1 "74LS06N" H 15600 1400 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 15500 1750 50  0001 C CNN
F 3 "" H 15500 1600 60  0001 C CNN
	3    15500 1600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06N U?
U 4 1 4ED0F57F
P 15500 2050
AR Path="/4ED0F562" Ref="U?"  Part="1" 
AR Path="/4ED0F566" Ref="U?"  Part="1" 
AR Path="/4ED0F57F" Ref="U18"  Part="4" 
F 0 "U18" H 15600 2175 50  0000 L BNN
F 1 "74LS06N" H 15600 1850 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 15500 2200 50  0001 C CNN
F 3 "" H 15500 2050 60  0001 C CNN
	4    15500 2050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06N IC?
U 2 1 4ED0F566
P 15500 3050
AR Path="/4ED0F562" Ref="IC?"  Part="1" 
AR Path="/4ED0F566" Ref="U18"  Part="2" 
F 0 "U18" H 15600 3175 50  0000 L BNN
F 1 "74LS06N" H 15600 2850 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 15500 3200 50  0001 C CNN
F 3 "" H 15500 3050 60  0001 C CNN
	2    15500 3050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06N U18
U 1 1 4ED0F562
P 15500 3500
F 0 "U18" H 15600 3625 50  0000 L BNN
F 1 "74LS06N" H 15600 3300 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 15500 3650 50  0001 C CNN
F 3 "" H 15500 3500 60  0001 C CNN
	1    15500 3500
	1    0    0    -1  
$EndComp
$Comp
L Z80KBDMSE-rescue:8042-ColorVDU-cache U19
U 1 1 4ED0F4F9
P 12750 2450
F 0 "U19" H 12920 3750 60  0000 C CNN
F 1 "8042" H 12750 1150 60  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 12750 2450 60  0001 C CNN
F 3 "" H 12750 2450 60  0001 C CNN
	1    12750 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2400 4250 2400
$Comp
L ColorVDU-rescue:R-RESCUE-ColorVDU R10
U 1 1 62191C56
P 6450 9150
F 0 "R10" V 6530 9150 50  0000 C CNN
F 1 "0" V 6450 9150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6450 9150 60  0001 C CNN
F 3 "" H 6450 9150 60  0001 C CNN
	1    6450 9150
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR010
U 1 1 621A0AE0
P 6200 9150
F 0 "#PWR010" H 6200 9250 30  0001 C CNN
F 1 "VCC" H 6200 9250 30  0000 C CNN
F 2 "" H 6200 9150 60  0001 C CNN
F 3 "" H 6200 9150 60  0001 C CNN
	1    6200 9150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 9150 7050 9150
$Comp
L ColorVDU-rescue:GND-RESCUE-ColorVDU #PWR?
U 1 1 6244BBF7
P 6200 9600
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
F 0 "#PWR011" H 6200 9600 30  0001 C CNN
F 1 "GND" H 6200 9530 30  0001 C CNN
F 2 "" H 6200 9600 60  0001 C CNN
F 3 "" H 6200 9600 60  0001 C CNN
	1    6200 9600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 9500 6200 9600
Text Label 6750 9500 0    60   ~ 0
ZERO
$Comp
L ColorVDU-rescue:R-RESCUE-ColorVDU R11
U 1 1 6259FFCF
P 6450 9500
F 0 "R11" V 6530 9500 50  0000 C CNN
F 1 "0" V 6450 9500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6450 9500 60  0001 C CNN
F 3 "" H 6450 9500 60  0001 C CNN
	1    6450 9500
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 9500 7050 9500
Text Label 7950 7600 0    60   ~ 0
A9
Text Label 7950 7500 0    60   ~ 0
A10
Text Label 9250 7500 0    60   ~ 0
A11
Text Label 7950 7700 0    60   ~ 0
A8
Text Label 9250 7700 0    60   ~ 0
A13
Text Label 9250 7800 0    60   ~ 0
A14
Text Label 9250 7900 0    60   ~ 0
A15
Text Label 9250 7600 0    60   ~ 0
A12
Text Label 7950 8400 0    60   ~ 0
A1
Text Label 7950 8300 0    60   ~ 0
A2
Text Label 7950 8200 0    60   ~ 0
A3
Text Label 7950 8500 0    60   ~ 0
A0
Text Label 7950 8000 0    60   ~ 0
A5
Text Label 7950 7900 0    60   ~ 0
A6
Text Label 7950 7800 0    60   ~ 0
A7
Text Label 7950 8100 0    60   ~ 0
A4
Text Label 7950 8600 0    60   ~ 0
GND
Text Label 7950 8700 0    60   ~ 0
RFSH#
Text Label 9250 9200 0    60   ~ 0
HALT#
Text Label 7950 9200 0    60   ~ 0
BUSACK#
Text Label 7950 8800 0    60   ~ 0
M1#
Text Label 7950 9000 0    60   ~ 0
BUSRQ#
Text Label 9250 9100 0    60   ~ 0
NMI#
Text Label 9250 9000 0    60   ~ 0
INT#
Text Label 7950 9100 0    60   ~ 0
WAIT#
Text Label 7950 8900 0    60   ~ 0
RESET#
Text Label 9250 9300 0    60   ~ 0
MREQ#
Text Label 7950 9300 0    60   ~ 0
WR#
Text Label 7950 9400 0    60   ~ 0
RD#
Text Label 9250 9400 0    60   ~ 0
IORQ#
Text Label 9250 8900 0    60   ~ 0
D1
Text Label 9250 8600 0    60   ~ 0
D2
Text Label 9250 8200 0    60   ~ 0
D3
Text Label 9250 8800 0    60   ~ 0
D0
Text Label 9250 8300 0    60   ~ 0
D5
Text Label 9250 8400 0    60   ~ 0
D6
Text Label 9250 8700 0    60   ~ 0
D7
Text Label 9250 8100 0    60   ~ 0
D4
Text Label 9250 8500 0    60   ~ 0
VCC
Text Label 9250 8000 0    60   ~ 0
CLK
$Comp
L conn:CONN_25X2 P2
U 1 1 6136A704
P 8750 8700
F 0 "P2" H 8750 10000 60  0000 C CNN
F 1 "Z80 BUS BACKPLANE" V 8750 8700 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x25_P2.54mm_Horizontal" H 8750 8700 60  0001 C CNN
F 3 "" H 8750 8700 60  0001 C CNN
	1    8750 8700
	1    0    0    -1  
$EndComp
Text Label 9250 9700 0    60   ~ 0
SPARE2
Text Label 9250 9600 0    60   ~ 0
SPARE1
Text Label 9250 9500 0    60   ~ 0
SPARE0
Text Label 9250 9800 0    60   ~ 0
SPARE3
Text Label 9250 9900 0    60   ~ 0
SPARE4
Text Label 7950 9700 0    60   ~ 0
SPARE7
Text Label 7950 9600 0    60   ~ 0
SPARE8
Text Label 7950 9500 0    60   ~ 0
SPARE9
Text Label 7950 9800 0    60   ~ 0
SPARE6
Text Label 7950 9900 0    60   ~ 0
SPARE5
Text Notes 7800 7300 0    60   ~ 0
Note: Bus connector is mirror image of Z80\nCPU pin out to mate to backplane whose\nconnectors reflect Z80 CPU pin out.
NoConn ~ 7850 7500
NoConn ~ 7850 7600
NoConn ~ 7850 7700
NoConn ~ 9650 7500
NoConn ~ 9650 7600
NoConn ~ 9650 7700
NoConn ~ 9650 7800
NoConn ~ 9650 7900
NoConn ~ 7850 8700
NoConn ~ 7850 9000
NoConn ~ 7850 9200
NoConn ~ 7850 9100
Wire Wire Line
	7850 7700 8350 7700
Wire Wire Line
	7850 7600 8350 7600
Wire Wire Line
	7850 7500 8350 7500
Wire Wire Line
	9150 7500 9650 7500
Wire Wire Line
	9150 7600 9650 7600
Wire Wire Line
	9150 7700 9650 7700
Wire Wire Line
	9150 7800 9650 7800
Wire Wire Line
	9150 7900 9650 7900
Wire Wire Line
	7850 8500 8350 8500
Wire Wire Line
	7850 8400 8350 8400
Wire Wire Line
	7850 8300 8350 8300
Wire Wire Line
	7850 8200 8350 8200
Wire Wire Line
	7850 8100 8350 8100
Wire Wire Line
	7850 8000 8350 8000
Wire Wire Line
	7850 7900 8350 7900
Wire Wire Line
	7850 7800 8350 7800
Wire Wire Line
	7850 8600 8350 8600
Wire Wire Line
	7850 8800 8350 8800
Wire Wire Line
	7850 8700 8350 8700
Wire Wire Line
	9150 9200 9650 9200
Wire Wire Line
	7850 9200 8350 9200
Wire Wire Line
	7850 8900 8350 8900
Wire Wire Line
	7850 9100 8350 9100
Wire Wire Line
	7850 9000 8350 9000
Wire Wire Line
	9150 9400 9650 9400
Wire Wire Line
	9150 9300 9650 9300
Wire Wire Line
	7850 9300 8350 9300
Wire Wire Line
	7850 9400 8350 9400
Wire Wire Line
	9150 8800 9650 8800
Wire Wire Line
	9150 8900 9650 8900
Wire Wire Line
	9150 8600 9650 8600
Wire Wire Line
	9150 8200 9650 8200
Wire Wire Line
	9150 8100 9650 8100
Wire Wire Line
	9150 8300 9650 8300
Wire Wire Line
	9150 8400 9650 8400
Wire Wire Line
	9150 8700 9650 8700
Wire Wire Line
	9150 8500 9650 8500
Wire Wire Line
	9150 8000 9650 8000
Wire Wire Line
	7850 9600 8350 9600
Wire Wire Line
	7850 9500 8350 9500
Wire Wire Line
	9150 9500 9650 9500
Wire Wire Line
	7850 9800 8350 9800
Wire Wire Line
	7850 9700 8350 9700
Wire Wire Line
	9150 9800 9650 9800
Wire Wire Line
	9150 9700 9650 9700
Wire Wire Line
	9150 9600 9650 9600
Wire Wire Line
	7850 9900 8350 9900
Wire Wire Line
	9150 9900 9650 9900
NoConn ~ 9650 9300
NoConn ~ 9650 8000
NoConn ~ 9650 9200
Wire Wire Line
	9150 9100 9650 9100
Wire Wire Line
	9150 9000 9650 9000
Wire Wire Line
	9950 1300 9850 1300
Wire Wire Line
	9850 1300 9850 1600
Connection ~ 9850 1600
Wire Wire Line
	9850 1600 9500 1600
Wire Wire Line
	10650 1300 10750 1300
Wire Wire Line
	10750 1300 10750 1600
Connection ~ 10750 1600
Wire Wire Line
	10750 1600 10650 1600
NoConn ~ 9950 1400
NoConn ~ 9950 1500
NoConn ~ 10650 1400
NoConn ~ 10650 1500
$Comp
L 74xx:74LS06N U?
U 5 1 4ED0F582
P 15100 7650
AR Path="/4ED0F562" Ref="U?"  Part="1" 
AR Path="/4ED0F582" Ref="U18"  Part="5" 
F 0 "U18" H 15200 7775 50  0000 L BNN
F 1 "74LS06N" H 15200 7450 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 15100 7800 50  0001 C CNN
F 3 "" H 15100 7650 60  0001 C CNN
	5    15100 7650
	1    0    0    -1  
$EndComp
NoConn ~ 8900 6100
Wire Wire Line
	6250 2400 6150 2400
Wire Wire Line
	12700 6550 13050 6550
$Comp
L 74xx:74LS06N U18
U 7 1 6688EF83
P 4950 8500
F 0 "U18" H 4850 8550 50  0000 L BNN
F 1 "74LS06N" H 4800 8450 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4950 8650 50  0001 C CNN
F 3 "" H 4950 8500 60  0001 C CNN
	7    4950 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3400 4350 3500
Connection ~ 4350 3600
Connection ~ 4350 3500
Wire Wire Line
	4350 3500 4350 3600
Wire Wire Line
	4950 3500 5550 3500
Connection ~ 5550 3500
Wire Wire Line
	4950 3400 5650 3400
Connection ~ 5650 3400
Wire Wire Line
	2850 2600 6250 2600
Wire Wire Line
	2850 2500 6250 2500
Text Label 11400 2200 0    60   ~ 0
CS_KM#
Wire Wire Line
	11650 6650 12100 6650
Wire Wire Line
	11650 6450 12100 6450
NoConn ~ 15400 7650
NoConn ~ 14800 7650
Text Label 14150 6450 0    60   ~ 0
INT#
$Comp
L conn:CONN_3 K3
U 1 1 4EDACDB9
P 14750 6550
F 0 "K3" V 14700 6550 50  0000 C CNN
F 1 "INT SEL" V 14800 6550 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 14750 6550 60  0001 C CNN
F 3 "" H 14750 6550 60  0001 C CNN
	1    14750 6550
	1    0    0    -1  
$EndComp
Text Label 14150 6650 0    60   ~ 0
NMI#
Wire Wire Line
	14400 6650 14050 6650
Wire Wire Line
	14400 6550 13650 6550
Wire Wire Line
	14050 6450 14400 6450
Wire Wire Line
	10650 1000 12100 1000
$Comp
L power:VCC #PWR0101
U 1 1 6289F512
P 10650 1000
F 0 "#PWR0101" H 10650 1100 30  0001 C CNN
F 1 "VCC" H 10650 1100 30  0000 C CNN
F 2 "" H 10650 1000 60  0001 C CNN
F 3 "" H 10650 1000 60  0001 C CNN
	1    10650 1000
	1    0    0    -1  
$EndComp
Connection ~ 10650 1000
Wire Wire Line
	4950 8000 5400 8000
Connection ~ 4950 9000
Wire Wire Line
	4950 9000 5400 9000
Wire Wire Line
	2850 5400 6250 5400
Wire Wire Line
	6150 5500 6150 2400
Wire Wire Line
	2850 5500 6150 5500
Wire Wire Line
	1650 9000 4950 9000
NoConn ~ 14000 8250
NoConn ~ 14000 8450
NoConn ~ 14600 8350
NoConn ~ 8900 6000
Wire Wire Line
	3650 7750 4650 7750
$EndSCHEMATC
