EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr C 22000 17000
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
L Z80PRINT-rescue:74LS245-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue U2
U 1 1 637504C8
P 2400 6750
F 0 "U2" H 2500 7325 60  0000 L BNN
F 1 "74LS245" H 2300 6300 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2400 6750 60  0001 C CNN
F 3 "" H 2400 6750 60  0001 C CNN
	1    2400 6750
	1    0    0    -1  
$EndComp
Text Label 1400 8150 0    60   ~ 0
WR#
Text Label 1400 7950 0    60   ~ 0
IORQ#
Text Label 1400 6350 0    60   ~ 0
D1
Text Label 1400 6450 0    60   ~ 0
D2
Text Label 1400 6550 0    60   ~ 0
D3
Text Label 1400 6250 0    60   ~ 0
D0
Text Label 1400 6750 0    60   ~ 0
D5
Text Label 1400 6850 0    60   ~ 0
D6
Text Label 1400 6950 0    60   ~ 0
D7
Text Label 1400 6650 0    60   ~ 0
D4
NoConn ~ 3100 7750
Text Label 1400 8050 0    60   ~ 0
M1#
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 6044C0E0
P 4900 6150
F 0 "SW1" H 4900 6700 50  0000 C CNN
F 1 "IO PORT ADDR" H 4900 5700 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Slide_9.78x22.5mm_W7.62mm_P2.54mm" H 4900 6150 50  0001 C CNN
F 3 "" H 4900 6150 50  0001 C CNN
	1    4900 6150
	1    0    0    1   
$EndComp
$Comp
L Z80PRINT-rescue:RR8-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue RR1
U 1 1 6044D2F4
P 5650 7100
F 0 "RR1" H 5700 7700 70  0000 C CNN
F 1 "10K" V 5680 7100 70  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" H 5650 7100 60  0001 C CNN
F 3 "" H 5650 7100 60  0001 C CNN
	1    5650 7100
	0    1    1    0   
$EndComp
Text Notes 1450 4650 0    60   ~ 0
Z80 BUS INTERFACE
Text Label 1400 7550 0    60   ~ 0
RESET#
$Comp
L Z80PRINT-rescue:VCC-power #PWR06
U 1 1 604651AE
P 6100 6750
F 0 "#PWR06" H 6100 6850 30  0001 C CNN
F 1 "VCC" H 6100 6850 30  0000 C CNN
F 2 "" H 6100 6750 60  0001 C CNN
F 3 "" H 6100 6750 60  0001 C CNN
	1    6100 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 7950 1700 7950
Wire Wire Line
	1300 8150 1700 8150
Wire Wire Line
	1300 6250 1700 6250
Wire Wire Line
	1300 6350 1700 6350
Wire Wire Line
	1300 6450 1700 6450
Wire Wire Line
	1300 6550 1700 6550
Wire Wire Line
	1300 6650 1700 6650
Wire Wire Line
	1300 6750 1700 6750
Wire Wire Line
	1300 6850 1700 6850
Wire Wire Line
	1300 6950 1700 6950
Wire Wire Line
	1300 7150 1700 7150
Wire Wire Line
	1300 8050 1700 8050
Connection ~ 4600 6250
Connection ~ 4600 6350
Connection ~ 4600 6450
Connection ~ 4600 6550
Wire Wire Line
	5200 6150 5700 6150
Wire Wire Line
	5200 6250 5600 6250
Wire Wire Line
	5200 6350 5500 6350
Wire Wire Line
	5200 6450 5400 6450
Wire Wire Line
	5200 6550 5300 6550
Wire Wire Line
	5300 6750 5300 6550
Connection ~ 5300 6550
Wire Wire Line
	5400 6750 5400 6450
Connection ~ 5400 6450
Wire Wire Line
	5500 6750 5500 6350
Connection ~ 5500 6350
Wire Wire Line
	5600 6750 5600 6250
Connection ~ 5600 6250
Wire Wire Line
	5700 6750 5700 6150
Connection ~ 5700 6150
Wire Wire Line
	5800 6750 5800 6050
Wire Wire Line
	5900 6750 5900 5950
Wire Wire Line
	6000 6750 6000 5850
Wire Wire Line
	3100 8150 4200 8150
Wire Wire Line
	4200 8150 4200 4500
Wire Wire Line
	4100 8250 4100 4400
Wire Wire Line
	3200 6250 3100 6250
Wire Wire Line
	3300 6350 3100 6350
Wire Wire Line
	3300 3600 3300 6350
Wire Wire Line
	3400 6450 3100 6450
Wire Wire Line
	3400 3700 3400 6450
Wire Wire Line
	3500 6550 3100 6550
Wire Wire Line
	3500 3800 3500 6550
Wire Wire Line
	3600 6650 3100 6650
Wire Wire Line
	3600 3900 3600 6650
Wire Wire Line
	3700 6750 3100 6750
Wire Wire Line
	3700 4000 3700 6750
Wire Wire Line
	3800 6850 3100 6850
Wire Wire Line
	3800 4100 3800 6850
Wire Wire Line
	3100 6950 3900 6950
Wire Wire Line
	3900 6950 3900 4200
Wire Wire Line
	6500 6750 6500 7950
Wire Wire Line
	1300 7550 1700 7550
Wire Wire Line
	3100 7550 4000 7550
Wire Wire Line
	4000 7550 4000 4300
$Comp
L Z80PRINT-rescue:GND-power #PWR04
U 1 1 60465D86
P 4600 6750
F 0 "#PWR04" H 4600 6750 30  0001 C CNN
F 1 "GND" H 4600 6680 30  0001 C CNN
F 2 "" H 4600 6750 60  0001 C CNN
F 3 "" H 4600 6750 60  0001 C CNN
	1    4600 6750
	1    0    0    -1  
$EndComp
Text Label 3150 8050 0    60   ~ 0
bM1#
Text Label 3150 7950 0    60   ~ 0
bIORQ#
Text Label 3150 8150 0    60   ~ 0
bWR#
Text Notes 5250 4750 0    60   ~ 0
IO SELECTION CIRCUIT
Text Notes 4500 7000 0    60   ~ 0
SET IO PORT
Wire Wire Line
	4600 6150 4600 6250
Wire Wire Line
	4600 6250 4600 6350
Wire Wire Line
	4600 6350 4600 6450
Wire Wire Line
	4600 6450 4600 6550
Wire Wire Line
	4600 6550 4600 6750
Wire Wire Line
	5300 6550 6500 6550
Wire Wire Line
	5400 6450 6500 6450
Wire Wire Line
	5500 6350 6500 6350
Wire Wire Line
	5600 6250 6500 6250
Wire Wire Line
	5700 6150 6500 6150
Wire Wire Line
	5800 6050 6500 6050
Wire Wire Line
	5900 5950 6500 5950
Wire Wire Line
	6000 5850 6500 5850
$Comp
L Z80PRINT-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue U3
U 1 1 603971B6
P 2400 8050
F 0 "U3" H 2450 7850 60  0000 C CNN
F 1 "74LS244" H 2500 7650 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2400 8050 60  0001 C CNN
F 3 "" H 2400 8050 60  0001 C CNN
	1    2400 8050
	1    0    0    -1  
$EndComp
NoConn ~ 1700 7750
Text Label 1350 7400 0    60   ~ 0
CS_PAR#
Wire Wire Line
	4200 4500 8900 4500
Wire Wire Line
	4100 4400 8900 4400
Wire Wire Line
	4000 4300 8900 4300
Wire Wire Line
	3800 4100 8900 4100
Wire Wire Line
	3300 3600 8900 3600
Wire Wire Line
	3200 3500 8900 3500
Wire Wire Line
	3900 4200 8900 4200
Wire Wire Line
	3700 4000 8900 4000
Wire Wire Line
	3600 3900 8900 3900
Wire Wire Line
	3500 3800 8900 3800
Wire Wire Line
	3400 3700 8900 3700
Text Label 1400 7150 0    60   ~ 0
RD#
Text Label 1400 5250 0    60   ~ 0
A3
Text Label 1400 5450 0    60   ~ 0
A5
Text Label 1400 5550 0    60   ~ 0
A6
Text Label 1400 5650 0    60   ~ 0
A7
Text Label 1400 5350 0    60   ~ 0
A4
Text Label 1400 4950 0    60   ~ 0
A0
Text Label 1400 5150 0    60   ~ 0
A2
Text Label 1400 5050 0    60   ~ 0
A1
Wire Wire Line
	1300 5250 1700 5250
Wire Wire Line
	1300 5350 1700 5350
Wire Wire Line
	1300 5450 1700 5450
Wire Wire Line
	1300 5550 1700 5550
Wire Wire Line
	1300 5650 1700 5650
Wire Wire Line
	1300 4950 1700 4950
Wire Wire Line
	1300 5050 1700 5050
Wire Wire Line
	1300 5150 1700 5150
Wire Wire Line
	3200 3500 3200 6250
Wire Wire Line
	3100 5650 6500 5650
Wire Wire Line
	3100 5550 6500 5550
Wire Wire Line
	3100 5450 6500 5450
Wire Wire Line
	3100 5350 6500 5350
Wire Wire Line
	3100 5250 6500 5250
Text Label 4300 5150 0    60   ~ 0
bA2
Text Label 4300 5350 0    60   ~ 0
bA4
Text Label 4300 5650 0    60   ~ 0
bA7
Text Label 4300 5550 0    60   ~ 0
bA6
Text Label 4300 5450 0    60   ~ 0
bA5
Text Label 4300 5250 0    60   ~ 0
bA3
$Comp
L Z80PRINT-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue U1
U 1 1 60BC80C2
P 2400 5450
F 0 "U1" H 2500 6025 60  0000 L BNN
F 1 "74LS244" H 2300 5000 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2400 5450 60  0001 C CNN
F 3 "" H 2400 5450 60  0001 C CNN
	1    2400 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 8450 1100 5850
Wire Wire Line
	1100 5850 1700 5850
Wire Wire Line
	1700 5950 1700 5850
Connection ~ 1700 5850
Text Label 3150 7550 0    60   ~ 0
bRESET#
Wire Wire Line
	1200 7400 1200 7650
Wire Wire Line
	1200 7650 1700 7650
Wire Wire Line
	3100 7650 4000 7650
Wire Wire Line
	4000 7650 4000 9350
NoConn ~ 5200 5850
Text Label 4300 4950 0    60   ~ 0
bA0
Text Label 4300 5050 0    60   ~ 0
bA1
Wire Wire Line
	1200 7250 1200 7400
Connection ~ 1200 7400
Wire Wire Line
	1200 7250 1700 7250
Wire Wire Line
	1200 7400 7600 7400
NoConn ~ 1700 7850
NoConn ~ 3100 7850
Text Label 6500 7850 1    60   ~ 0
688SEL#
$Comp
L 74xx:74LS32 U5
U 1 1 60CE86CB
P 9550 13100
F 0 "U5" H 9550 13150 50  0000 C CNN
F 1 "74LS32" H 9550 13050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9550 13100 50  0001 C CNN
F 3 "" H 9550 13100 50  0001 C CNN
	1    9550 13100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS688 U6
U 1 1 604A100F
P 7000 5850
F 0 "U6" H 6700 6900 50  0000 C CNN
F 1 "74LS688" H 6700 4800 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 7000 5850 50  0001 C CNN
F 3 "" H 7000 5850 50  0001 C CNN
	1    7000 5850
	1    0    0    -1  
$EndComp
NoConn ~ 4600 5850
Wire Wire Line
	6350 11150 6800 11150
Connection ~ 1700 8450
$Comp
L 74xx:74LS32 U5
U 2 1 60CEB3F0
P 9550 13450
F 0 "U5" H 9550 13500 50  0000 C CNN
F 1 "74LS32" H 9550 13400 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9550 13450 50  0001 C CNN
F 3 "" H 9550 13450 50  0001 C CNN
	2    9550 13450
	1    0    0    -1  
$EndComp
NoConn ~ 9250 13000
NoConn ~ 9250 13200
NoConn ~ 9850 13100
NoConn ~ 6100 9500
NoConn ~ 6100 9400
NoConn ~ 6100 9300
NoConn ~ 6100 9200
Wire Wire Line
	6100 9500 6750 9500
Wire Wire Line
	6100 9400 6750 9400
Wire Wire Line
	6100 9300 6750 9300
Wire Wire Line
	6100 9200 6750 9200
Text Label 6150 9500 0    60   ~ 0
IEO
Text Label 6150 9200 0    60   ~ 0
BAI#
Text Label 6150 9300 0    60   ~ 0
BAO#
Text Label 6150 9400 0    60   ~ 0
IEI
$Comp
L Z80PRINT-rescue:CONN_4-conn P3
U 1 1 637504D4
P 7100 9350
F 0 "P3" V 7050 9350 60  0000 C CNN
F 1 "DAISY CHAIN" V 7150 9350 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 7100 9350 60  0001 C CNN
F 3 "" H 7100 9350 60  0001 C CNN
	1    7100 9350
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:GND-00JRCsch #PWR016
U 1 1 610CFA90
P 4900 9500
F 0 "#PWR016" H 4900 9500 30  0001 C CNN
F 1 "GND" H 4900 9430 30  0001 C CNN
F 2 "" H 4900 9500 60  0000 C CNN
F 3 "" H 4900 9500 60  0000 C CNN
	1    4900 9500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 9450 5150 9450
Connection ~ 4900 9450
Wire Wire Line
	4900 9450 4900 9500
Wire Wire Line
	4650 9450 4900 9450
$Comp
L mechanical:MountingHole_Pad H2
U 1 1 61081B3A
P 5150 9350
F 0 "H2" H 5250 9399 50  0000 L CNN
F 1 "BRACKET" H 5250 9308 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 5150 9350 50  0001 C CNN
F 3 "~" H 5150 9350 50  0001 C CNN
	1    5150 9350
	1    0    0    -1  
$EndComp
$Comp
L mechanical:MountingHole_Pad H1
U 1 1 637504D2
P 4650 9350
F 0 "H1" H 4750 9399 50  0000 L CNN
F 1 "BRACKET" H 4750 9308 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 4650 9350 50  0001 C CNN
F 3 "~" H 4650 9350 50  0001 C CNN
	1    4650 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 10300 4900 10300
Connection ~ 4150 10300
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C9
U 1 1 610E21C8
P 4150 10100
F 0 "C9" H 4200 10200 50  0000 L CNN
F 1 "0.1u" H 4200 10000 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4150 10100 60  0001 C CNN
F 3 "" H 4150 10100 60  0001 C CNN
	1    4150 10100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 11550 5950 11550
Connection ~ 5650 11550
Connection ~ 5650 10550
$Comp
L 74xx:74LS32 U5
U 5 1 60CF4F38
P 5650 11050
F 0 "U5" H 5550 11100 50  0000 L CNN
F 1 "74LS32" H 5500 11000 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5650 11050 50  0001 C CNN
F 3 "" H 5650 11050 50  0001 C CNN
	5    5650 11050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 4 1 60CF14BD
P 9200 5900
F 0 "U5" H 9200 5950 50  0000 C CNN
F 1 "74LS32" H 9200 5850 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9200 5900 50  0001 C CNN
F 3 "" H 9200 5900 50  0001 C CNN
	4    9200 5900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 3 1 60CEDDF6
P 9200 5050
F 0 "U5" H 9200 5100 50  0000 C CNN
F 1 "74LS32" H 9200 5000 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9200 5050 50  0001 C CNN
F 3 "" H 9200 5050 50  0001 C CNN
	3    9200 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 9350 3750 9300
Wire Wire Line
	3750 9000 3750 8950
Wire Wire Line
	5950 10750 5950 11550
Wire Wire Line
	5950 10450 5950 10400
Wire Wire Line
	3900 10300 4150 10300
Wire Wire Line
	4150 9900 4900 9900
Text Notes 4000 9200 1    60   ~ 0
IO CHIP SELECT
Wire Wire Line
	4000 9350 3750 9350
$Comp
L Z80PRINT-rescue:VCC-power #PWR03
U 1 1 637504D1
P 3750 8450
F 0 "#PWR03" H 3750 8550 30  0001 C CNN
F 1 "VCC" H 3750 8550 30  0000 C CNN
F 2 "" H 3750 8450 60  0001 C CNN
F 3 "" H 3750 8450 60  0001 C CNN
	1    3750 8450
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue R12
U 1 1 6068F201
P 3750 8700
F 0 "R12" V 3830 8700 50  0000 C CNN
F 1 "470" V 3750 8700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3750 8700 60  0001 C CNN
F 3 "" H 3750 8700 60  0001 C CNN
	1    3750 8700
	-1   0    0    1   
$EndComp
$Comp
L device:LED D1
U 1 1 6068F1F7
P 3750 9150
F 0 "D1" H 3750 9250 50  0000 C CNN
F 1 "LED" H 3750 9050 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 3750 9150 60  0001 C CNN
F 3 "" H 3750 9150 60  0001 C CNN
	1    3750 9150
	0    -1   -1   0   
$EndComp
Connection ~ 3900 10300
Wire Wire Line
	3900 9900 4150 9900
Connection ~ 3900 9900
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C8
U 1 1 60B4CA7D
P 3900 10100
F 0 "C8" H 3950 10200 50  0000 L CNN
F 1 "0.1u" H 3950 10000 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3900 10100 60  0001 C CNN
F 3 "" H 3900 10100 60  0001 C CNN
	1    3900 10100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 10300 3900 10300
Connection ~ 3650 10300
Wire Wire Line
	3650 9900 3900 9900
Connection ~ 3650 9900
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C7
U 1 1 637B9E5A
P 3650 10100
F 0 "C7" H 3700 10200 50  0000 L CNN
F 1 "0.1u" H 3700 10000 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3650 10100 60  0001 C CNN
F 3 "" H 3650 10100 60  0001 C CNN
	1    3650 10100
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C6
U 1 1 637B9E50
P 3400 10100
F 0 "C6" H 3450 10200 50  0000 L CNN
F 1 "0.1u" H 3450 10000 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3400 10100 60  0001 C CNN
F 3 "" H 3400 10100 60  0001 C CNN
	1    3400 10100
	1    0    0    -1  
$EndComp
Text Label 7700 4950 0    60   ~ 0
CS_PAR#
Wire Wire Line
	7600 4950 8900 4950
Connection ~ 7600 4950
Wire Wire Line
	5150 9900 5650 9900
Wire Wire Line
	3400 10300 3650 10300
Wire Wire Line
	3400 9900 3650 9900
Wire Wire Line
	1100 8450 1700 8450
Text Label 8400 3500 0    60   ~ 0
bD0
Text Label 8400 3600 0    60   ~ 0
bD1
Text Label 8400 4100 0    60   ~ 0
bD6
Text Label 8400 3700 0    60   ~ 0
bD2
Text Label 8400 3800 0    60   ~ 0
bD3
Text Label 8400 3900 0    60   ~ 0
bD4
Text Label 8400 4000 0    60   ~ 0
bD5
Text Label 8400 4200 0    60   ~ 0
bD7
Text Label 8400 4300 0    60   ~ 0
bRESET#
Text Label 8400 4400 0    60   ~ 0
bRD#
Text Label 8400 4500 0    60   ~ 0
bWR#
Wire Wire Line
	5650 9900 5950 9900
Wire Wire Line
	3150 9900 3400 9900
Wire Wire Line
	4900 10300 5150 10300
Wire Wire Line
	4900 9900 5150 9900
Wire Wire Line
	3150 10300 3400 10300
Wire Wire Line
	1700 8450 1700 8550
Wire Wire Line
	7600 7400 7600 5800
Text Label 3150 8250 0    60   ~ 0
bRD#
Text Label 1400 8450 0    60   ~ 0
GND
Wire Wire Line
	6350 11050 6800 11050
Wire Wire Line
	6350 10950 6800 10950
Wire Wire Line
	6350 10850 6800 10850
Wire Wire Line
	6350 10750 6800 10750
Wire Wire Line
	6350 10650 6800 10650
Wire Wire Line
	6350 10550 6800 10550
Wire Wire Line
	6350 10450 6800 10450
Wire Wire Line
	6350 10350 6800 10350
Wire Wire Line
	6350 10250 6800 10250
Connection ~ 2900 10300
Connection ~ 2400 10300
Connection ~ 2150 10300
Connection ~ 2400 9900
Connection ~ 2650 9900
Connection ~ 2900 9900
Connection ~ 5650 9900
Wire Wire Line
	5650 10550 5650 9900
Wire Wire Line
	1900 10300 1900 10950
Connection ~ 1900 10300
Connection ~ 5150 9900
Wire Wire Line
	3100 8250 4100 8250
Wire Wire Line
	7500 4950 7600 4950
Connection ~ 3150 9900
Connection ~ 2650 10300
Connection ~ 4900 10300
Connection ~ 4900 9900
Connection ~ 3150 10300
Wire Wire Line
	3400 10300 3400 10350
Connection ~ 3400 10300
Connection ~ 3400 9900
Connection ~ 4150 9900
Wire Wire Line
	1900 10300 2150 10300
Wire Wire Line
	1300 8250 1700 8250
Text Notes 9500 12800 0    60   ~ 0
Spare Components
Text Notes 1300 8850 0    60   ~ 0
Note: Buffers/Transceivers\nrespond to IO and MEM cycles
Text Notes 4600 8650 0    60   ~ 0
Note: Inhibit Board Operation\nDuring Interrupts\nM1# = low, IORQ# = low
Text Notes 7900 7450 0    60   ~ 0
Note: IO Address Port $E8-$EB\nS1=off - A7 (high)\nS2=off - A6 (high)\nS3=off - A5 (high)\nS4=on - A4 (low)\nS5=off - A3 (high)\nS6=on - A2 (low)\nS7=x - A1 (no effect)\nS8=x - A0 (no effect)
$Comp
L Z80PRINT-rescue:GND-power #PWR08
U 1 1 6044E58D
P 7000 7050
F 0 "#PWR08" H 7000 7050 30  0001 C CNN
F 1 "GND" H 7000 6980 30  0001 C CNN
F 2 "" H 7000 7050 60  0001 C CNN
F 3 "" H 7000 7050 60  0001 C CNN
	1    7000 7050
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:VCC-power #PWR07
U 1 1 6044E13A
P 7000 4650
F 0 "#PWR07" H 7000 4750 30  0001 C CNN
F 1 "VCC" H 7000 4750 30  0000 C CNN
F 2 "" H 7000 4650 60  0001 C CNN
F 3 "" H 7000 4650 60  0001 C CNN
	1    7000 4650
	1    0    0    -1  
$EndComp
Text Label 6400 10650 0    60   ~ 0
SPARE4
Text Label 6400 10550 0    60   ~ 0
SPARE3
Text Label 6400 10250 0    60   ~ 0
SPARE0
Text Label 6400 10350 0    60   ~ 0
SPARE1
Text Label 6400 10450 0    60   ~ 0
SPARE2
Text Label 6400 10750 0    60   ~ 0
SPARE5
Text Label 6400 10850 0    60   ~ 0
SPARE6
Text Label 6400 11150 0    60   ~ 0
SPARE9
Text Label 6400 11050 0    60   ~ 0
SPARE8
Text Label 6400 10950 0    60   ~ 0
SPARE7
$Comp
L Z80PRINT-rescue:CONN_10-conn P1
U 1 1 637504CB
P 7150 10700
F 0 "P1" V 7100 10700 60  0000 C CNN
F 1 "SPARES" V 7200 10700 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 7150 10700 60  0001 C CNN
F 3 "" H 7150 10700 60  0001 C CNN
	1    7150 10700
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue R13
U 1 1 603A596D
P 5950 10150
F 0 "R13" V 6030 10150 50  0000 C CNN
F 1 "470" V 5950 10150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5950 10150 60  0001 C CNN
F 3 "" H 5950 10150 60  0001 C CNN
	1    5950 10150
	-1   0    0    1   
$EndComp
$Comp
L device:LED D2
U 1 1 603A5584
P 5950 10600
F 0 "D2" H 5950 10700 50  0000 C CNN
F 1 "LED" H 5950 10500 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5950 10600 60  0001 C CNN
F 3 "" H 5950 10600 60  0001 C CNN
	1    5950 10600
	0    -1   -1   0   
$EndComp
$Comp
L Z80PRINT-rescue:CP-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C11
U 1 1 603A3D80
P 5150 10100
F 0 "C11" H 5200 10200 50  0000 L CNN
F 1 "10u" H 5200 10000 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5150 10100 60  0001 C CNN
F 3 "" H 5150 10100 60  0001 C CNN
	1    5150 10100
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:CP-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C10
U 1 1 6039BD2A
P 4900 10100
F 0 "C10" H 4950 10200 50  0000 L CNN
F 1 "10u" H 4950 10000 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4900 10100 60  0001 C CNN
F 3 "" H 4900 10100 60  0001 C CNN
	1    4900 10100
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 603A949A
P 1900 10300
F 0 "#FLG01" H 1900 10395 30  0001 C CNN
F 1 "PWR_FLAG" H 1900 10480 30  0000 C CNN
F 2 "" H 1900 10300 60  0001 C CNN
F 3 "" H 1900 10300 60  0001 C CNN
	1    1900 10300
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 603A9456
P 4150 9900
F 0 "#FLG02" H 4150 9995 30  0001 C CNN
F 1 "PWR_FLAG" H 4150 10080 30  0000 C CNN
F 2 "" H 4150 9900 60  0001 C CNN
F 3 "" H 4150 9900 60  0001 C CNN
	1    4150 9900
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:VCC-power #PWR01
U 1 1 603A9412
P 3400 9900
F 0 "#PWR01" H 3400 10000 30  0001 C CNN
F 1 "VCC" H 3400 10000 30  0000 C CNN
F 2 "" H 3400 9900 60  0001 C CNN
F 3 "" H 3400 9900 60  0001 C CNN
	1    3400 9900
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:GND-power #PWR02
U 1 1 603A93CE
P 3400 10350
F 0 "#PWR02" H 3400 10350 30  0001 C CNN
F 1 "GND" H 3400 10280 30  0001 C CNN
F 2 "" H 3400 10350 60  0001 C CNN
F 3 "" H 3400 10350 60  0001 C CNN
	1    3400 10350
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C5
U 1 1 603A8FA5
P 3150 10100
F 0 "C5" H 3200 10200 50  0000 L CNN
F 1 "0.1u" H 3200 10000 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3150 10100 60  0001 C CNN
F 3 "" H 3150 10100 60  0001 C CNN
	1    3150 10100
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C4
U 1 1 603A8F29
P 2900 10100
F 0 "C4" H 2950 10200 50  0000 L CNN
F 1 "0.1u" H 2950 10000 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2900 10100 60  0001 C CNN
F 3 "" H 2900 10100 60  0001 C CNN
	1    2900 10100
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C3
U 1 1 603A8F23
P 2650 10100
F 0 "C3" H 2700 10200 50  0000 L CNN
F 1 "0.1u" H 2700 10000 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2650 10100 60  0001 C CNN
F 3 "" H 2650 10100 60  0001 C CNN
	1    2650 10100
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C2
U 1 1 603A8ED5
P 2400 10100
F 0 "C2" H 2450 10200 50  0000 L CNN
F 1 "0.1u" H 2450 10000 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2400 10100 60  0001 C CNN
F 3 "" H 2400 10100 60  0001 C CNN
	1    2400 10100
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C1
U 1 1 637504CA
P 2150 10100
F 0 "C1" H 2200 10200 50  0000 L CNN
F 1 "0.1u" H 2200 10000 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2150 10100 60  0001 C CNN
F 3 "" H 2150 10100 60  0001 C CNN
	1    2150 10100
	1    0    0    -1  
$EndComp
Text Label 1400 8250 0    60   ~ 0
RD#
NoConn ~ 10650 13100
NoConn ~ 10050 13200
NoConn ~ 10050 13000
Wire Wire Line
	14150 10700 13700 10700
Wire Wire Line
	11350 10200 10900 10200
Wire Wire Line
	10900 10200 10900 10000
Wire Wire Line
	11300 12900 11850 12900
Wire Wire Line
	14150 12650 12450 12650
Wire Wire Line
	12450 12650 12450 12900
Wire Wire Line
	14150 9800 14150 9900
Wire Wire Line
	14150 7950 13700 7950
Wire Wire Line
	14150 8050 13700 8050
Wire Wire Line
	10950 5600 10500 5600
Wire Wire Line
	10950 5800 10500 5800
Wire Wire Line
	10950 4950 10500 4950
Wire Wire Line
	10950 4750 10500 4750
Wire Wire Line
	10950 4850 10500 4850
Wire Wire Line
	13700 11700 14150 11700
Wire Wire Line
	14150 9900 13700 9900
Wire Wire Line
	13700 13550 14150 13550
Wire Wire Line
	14150 11700 14150 11600
Wire Wire Line
	15050 4500 15450 4500
Wire Wire Line
	15050 4400 15450 4400
Wire Wire Line
	15050 4000 15450 4000
Wire Wire Line
	15050 4200 15450 4200
Wire Wire Line
	15050 4100 15450 4100
Wire Wire Line
	15050 3900 15450 3900
Wire Wire Line
	13850 3400 14250 3400
Wire Wire Line
	15050 3400 15450 3400
Wire Wire Line
	15050 3700 15450 3700
Wire Wire Line
	15050 3600 15450 3600
Wire Wire Line
	13850 4200 14250 4200
Wire Wire Line
	13850 4100 14250 4100
Wire Wire Line
	13850 3500 14250 3500
Wire Wire Line
	13850 3600 14250 3600
Wire Wire Line
	13850 3700 14250 3700
Wire Wire Line
	13850 3800 14250 3800
Wire Wire Line
	13850 3900 14250 3900
Wire Wire Line
	13850 4000 14250 4000
Wire Wire Line
	15050 4300 15450 4300
Wire Wire Line
	15050 3800 15450 3800
Wire Wire Line
	13850 4600 14250 4600
Wire Wire Line
	13850 4400 14250 4400
Wire Wire Line
	15050 3500 15450 3500
Wire Wire Line
	14250 4500 13850 4500
Wire Wire Line
	13850 4300 14250 4300
Wire Wire Line
	14150 12550 12450 12550
Wire Wire Line
	12450 13250 12550 13250
Wire Wire Line
	12550 13250 12550 12850
Wire Wire Line
	12550 12850 14150 12850
Wire Wire Line
	11850 13250 11450 13250
Wire Wire Line
	14150 12750 13650 12750
Wire Wire Line
	12400 11400 12800 11400
Wire Wire Line
	13750 11000 14150 11000
Wire Wire Line
	13750 11100 14150 11100
Wire Wire Line
	14150 11200 13750 11200
Wire Wire Line
	13750 11300 14150 11300
Wire Wire Line
	13750 9400 14150 9400
Wire Wire Line
	13750 9300 14150 9300
Wire Wire Line
	13750 9200 14150 9200
Wire Wire Line
	13750 9100 14150 9100
Wire Wire Line
	13750 9000 14150 9000
Wire Wire Line
	13750 8900 14150 8900
Wire Wire Line
	13750 9500 14150 9500
Wire Wire Line
	13750 9600 14150 9600
Wire Wire Line
	14150 12950 13750 12950
Wire Wire Line
	9000 9800 9400 9800
Wire Wire Line
	8400 10100 8800 10100
Wire Wire Line
	12900 14250 13350 14250
Wire Wire Line
	12900 14650 13350 14650
Wire Wire Line
	12900 14550 13350 14550
Wire Wire Line
	12900 14450 13350 14450
Wire Wire Line
	12900 14350 13350 14350
Wire Wire Line
	11350 12550 11850 12550
Wire Wire Line
	13400 11400 14150 11400
Wire Wire Line
	12900 14750 13350 14750
Wire Wire Line
	13250 8200 13250 6200
Wire Wire Line
	11350 9600 10900 9600
Wire Wire Line
	10900 9600 10900 9800
Wire Wire Line
	13750 13050 14150 13050
Text Label 13750 10700 0    60   ~ 0
/PARIN1
Text Label 13750 13050 0    60   ~ 0
/PDENBL
Text Label 13750 6200 0    60   ~ 0
/PDENBL
NoConn ~ 13350 15150
$Comp
L 74xx:74LS06 U30
U 1 1 4EDACCAE
P 13100 11400
F 0 "U30" H 13295 11515 60  0000 C CNN
F 1 "74LS06" H 13290 11275 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 13100 11400 60  0001 C CNN
F 3 "" H 13100 11400 60  0001 C CNN
	1    13100 11400
	1    0    0    -1  
$EndComp
Text Label 10950 10200 0    60   ~ 0
NMI#
Text Label 10950 9600 0    60   ~ 0
INT#
$Comp
L Z80PRINT-rescue:CONN_3-conn K1
U 1 1 4EDACBBD
P 11250 9900
F 0 "K1" V 11200 9900 50  0000 C CNN
F 1 "INT SEL" V 11300 9900 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 11250 9900 60  0001 C CNN
F 3 "" H 11250 9900 60  0001 C CNN
	1    11250 9900
	1    0    0    -1  
$EndComp
Text Label 12950 14750 0    60   ~ 0
BUSY
Text Label 13450 11400 0    60   ~ 0
BUSY
NoConn ~ 10650 13450
$Comp
L 74xx:74LS08 U32
U 3 1 4ED11C2D
P 10350 13100
F 0 "U32" H 10350 13150 60  0000 C CNN
F 1 "74LS08" H 10350 13050 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10350 13100 60  0001 C CNN
F 3 "" H 10350 13100 60  0001 C CNN
	3    10350 13100
	1    0    0    -1  
$EndComp
Text Notes 16300 3950 0    60   ~ 0
PARALLEL PORT BASED ON SCHEMATIC AT\nhttp://www.linux-cae.net/Projects/Parallel/Dage/parport.html
Text Label 12950 14350 0    60   ~ 0
/STROBE
Text Label 12950 14450 0    60   ~ 0
/LINEFEED
Text Label 12950 14550 0    60   ~ 0
P-RESET
Text Label 12950 14650 0    60   ~ 0
/SEL
$Comp
L Z80PRINT-rescue:RR9-ColorVDU-rescue RR3
U 1 1 4ED11869
P 13700 14750
F 0 "RR3" H 13750 15350 70  0000 C CNN
F 1 "4700" V 13730 14750 70  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP10" H 13700 14750 60  0001 C CNN
F 3 "" H 13700 14750 60  0001 C CNN
	1    13700 14750
	1    0    0    -1  
$EndComp
Text Label 12950 14250 0    60   ~ 0
VCC
Text Label 8450 10100 0    60   ~ 0
ACK
Text Label 13792 12950 0    60   ~ 0
PARINT
Text Label 13800 9600 0    60   ~ 0
PD7
Text Label 13800 9500 0    60   ~ 0
PD6
Text Label 13800 9400 0    60   ~ 0
PD5
Text Label 13800 9300 0    60   ~ 0
PD4
Text Label 13800 9200 0    60   ~ 0
PD3
Text Label 13800 9100 0    60   ~ 0
PD2
Text Label 13800 9000 0    60   ~ 0
PD1
Text Label 13800 8900 0    60   ~ 0
PD0
Text Label 13800 11300 0    60   ~ 0
ACK
Text Label 13800 11200 0    60   ~ 0
PAPEROUT
Text Label 13800 11100 0    60   ~ 0
SELECT
Text Label 13800 11000 0    60   ~ 0
ERROR
Text Label 12450 11400 0    60   ~ 0
/BUSY
Text Label 11398 12550 0    60   ~ 0
/STROBE
Text Label 11324 12900 0    60   ~ 0
/LINEFEED
Text Label 13696 12750 0    60   ~ 0
P-RESET
Text Label 11578 13250 0    60   ~ 0
/SEL
$Comp
L Z80PRINT-rescue:CONN_13X2-conn P31
U 1 1 4ED10F38
P 14650 4000
F 0 "P31" H 14650 4700 60  0000 C CNN
F 1 "PARALLEL" V 14650 4000 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x13_P2.54mm_Horizontal" H 14650 4000 60  0001 C CNN
F 3 "" H 14650 4000 60  0001 C CNN
	1    14650 4000
	1    0    0    -1  
$EndComp
Text Label 13900 4300 0    60   ~ 0
ACK
Text Label 15100 4500 0    60   ~ 0
GND
Text Label 15100 4400 0    60   ~ 0
GND
Text Label 15100 4000 0    60   ~ 0
GND
Text Label 15100 4200 0    60   ~ 0
GND
Text Label 15100 4100 0    60   ~ 0
GND
Text Label 15100 3900 0    60   ~ 0
GND
Text Label 13900 4400 0    60   ~ 0
/BUSY
Text Label 13900 4600 0    60   ~ 0
SELECT
Text Label 15100 3500 0    60   ~ 0
ERROR
Text Label 13900 4500 0    60   ~ 0
PAPEROUT
Text Label 15100 3800 0    60   ~ 0
GND
Text Label 15100 4300 0    60   ~ 0
GND
Text Label 13900 3500 0    60   ~ 0
PD0
Text Label 13900 3600 0    60   ~ 0
PD1
Text Label 13900 3700 0    60   ~ 0
PD2
Text Label 13900 3800 0    60   ~ 0
PD3
Text Label 13900 3900 0    60   ~ 0
PD4
Text Label 13900 4000 0    60   ~ 0
PD5
Text Label 13900 4100 0    60   ~ 0
PD6
Text Label 13900 4200 0    60   ~ 0
PD7
Text Label 13900 3400 0    60   ~ 0
/STROBE
Text Label 15100 3400 0    60   ~ 0
/LINEFEED
Text Label 15100 3700 0    60   ~ 0
/SEL
Text Label 15100 3600 0    60   ~ 0
P-RESET
Text Label 13750 13550 0    60   ~ 0
/PARIN2
Text Label 13750 9900 0    60   ~ 0
/PARIN0
Text Label 13750 11700 0    60   ~ 0
/PARIN1
$Comp
L 74xx:74LS244 U29
U 1 1 4ED10E7A
P 14650 13050
F 0 "U29" H 14700 12850 60  0000 C CNN
F 1 "74LS244" H 14750 12700 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 14650 13050 60  0001 C CNN
F 3 "" H 14650 13050 60  0001 C CNN
	1    14650 13050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244 U28
U 1 1 4ED10E71
P 14650 11200
F 0 "U28" H 14700 11000 60  0000 C CNN
F 1 "74LS244" H 14750 10850 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 14650 11200 60  0001 C CNN
F 3 "" H 14650 11200 60  0001 C CNN
	1    14650 11200
	1    0    0    -1  
$EndComp
Text Label 10550 4850 0    60   ~ 0
/PARIN1
Text Label 10550 4750 0    60   ~ 0
/PARIN0
Text Label 10550 4950 0    60   ~ 0
/PARIN2
Text Label 10550 5800 0    60   ~ 0
/PAROUT2
Text Label 10550 5600 0    60   ~ 0
/PAROUT0
Text Label 13750 7950 0    60   ~ 0
/PAROUT2
$Comp
L 74xx:74LS374 U26
U 1 1 4ED10C44
P 14650 7550
F 0 "U26" H 14650 7550 60  0000 C CNN
F 1 "74LS374" H 14700 7200 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 14650 7550 60  0001 C CNN
F 3 "" H 14650 7550 60  0001 C CNN
	1    14650 7550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244 U27
U 1 1 4ED10C38
P 14650 9400
F 0 "U27" H 14700 9200 60  0000 C CNN
F 1 "74LS244" H 14750 9050 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 14650 9400 60  0001 C CNN
F 3 "" H 14650 9400 60  0001 C CNN
	1    14650 9400
	1    0    0    -1  
$EndComp
Text Label 13750 8050 0    60   ~ 0
GND
Text Label 13750 6100 0    60   ~ 0
/PAROUT0
$Comp
L 74xx:74LS04 U21
U 1 2 4ED0FF17
P 9550 13800
F 0 "U21" H 9500 13850 60  0000 C CNN
F 1 "74LS04" H 9500 13750 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9550 13800 60  0001 C CNN
F 3 "" H 9550 13800 60  0001 C CNN
	1    9550 13800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U21
U 2 1 4ED0FF15
P 9100 10100
F 0 "U21" H 9295 10215 60  0000 C CNN
F 1 "74LS04" H 9290 9975 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9100 10100 60  0001 C CNN
F 3 "" H 9100 10100 60  0001 C CNN
	2    9100 10100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U21
U 6 1 4ED0FF05
P 12150 13250
F 0 "U21" H 12345 13365 60  0000 C CNN
F 1 "74LS04" H 12340 13125 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12150 13250 60  0001 C CNN
F 3 "" H 12150 13250 60  0001 C CNN
	6    12150 13250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U21
U 5 1 4ED0FF02
P 12150 12900
F 0 "U21" H 12345 13015 60  0000 C CNN
F 1 "74LS04" H 12340 12775 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12150 12900 60  0001 C CNN
F 3 "" H 12150 12900 60  0001 C CNN
	5    12150 12900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U21
U 4 1 4ED0FF00
P 12150 12550
F 0 "U21" H 12345 12665 60  0000 C CNN
F 1 "74LS04" H 12340 12425 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12150 12550 60  0001 C CNN
F 3 "" H 12150 12550 60  0001 C CNN
	4    12150 12550
	1    0    0    -1  
$EndComp
Wire Wire Line
	14150 10700 14150 10800
Wire Wire Line
	6500 5050 6500 4950
NoConn ~ 4600 5950
NoConn ~ 5200 5950
Wire Wire Line
	3100 5050 4500 5050
Wire Wire Line
	3100 4950 4500 4950
Text Label 9300 4850 0    60   ~ 0
bA0
Text Label 9300 4750 0    60   ~ 0
bA1
$Comp
L 74xx:74LS04 U21
U 7 1 632D80D2
P 4750 11050
F 0 "U21" H 4750 11100 60  0000 C CNN
F 1 "74LS04" H 4750 11000 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4750 11050 60  0001 C CNN
F 3 "" H 4750 11050 60  0001 C CNN
	7    4750 11050
	1    0    0    -1  
$EndComp
Connection ~ 4750 11550
Text Label 4550 13200 0    60   ~ 0
A9
Text Label 4550 13100 0    60   ~ 0
A10
Text Label 5850 13100 0    60   ~ 0
A11
Text Label 4550 13300 0    60   ~ 0
A8
Text Label 5850 13300 0    60   ~ 0
A13
Text Label 5850 13400 0    60   ~ 0
A14
Text Label 5850 13500 0    60   ~ 0
A15
Text Label 5850 13200 0    60   ~ 0
A12
Text Label 4550 14000 0    60   ~ 0
A1
Text Label 4550 13900 0    60   ~ 0
A2
Text Label 4550 13800 0    60   ~ 0
A3
Text Label 4550 14100 0    60   ~ 0
A0
Text Label 4550 13600 0    60   ~ 0
A5
Text Label 4550 13500 0    60   ~ 0
A6
Text Label 4550 13400 0    60   ~ 0
A7
Text Label 4550 13700 0    60   ~ 0
A4
Text Label 4550 14200 0    60   ~ 0
GND
Text Label 4550 14300 0    60   ~ 0
RFSH#
Text Label 5850 14800 0    60   ~ 0
HALT#
Text Label 4550 14800 0    60   ~ 0
BUSACK#
Text Label 4550 14400 0    60   ~ 0
M1#
Text Label 4550 14600 0    60   ~ 0
BUSRQ#
Text Label 5850 14700 0    60   ~ 0
NMI#
Text Label 5850 14600 0    60   ~ 0
INT#
Text Label 4550 14700 0    60   ~ 0
WAIT#
Text Label 4550 14500 0    60   ~ 0
RESET#
Text Label 5850 14900 0    60   ~ 0
MREQ#
Text Label 4550 14900 0    60   ~ 0
WR#
Text Label 4550 15000 0    60   ~ 0
RD#
Text Label 5850 15000 0    60   ~ 0
IORQ#
Text Label 5850 14500 0    60   ~ 0
D1
Text Label 5850 14200 0    60   ~ 0
D2
Text Label 5850 13800 0    60   ~ 0
D3
Text Label 5850 14400 0    60   ~ 0
D0
Text Label 5850 13900 0    60   ~ 0
D5
Text Label 5850 14000 0    60   ~ 0
D6
Text Label 5850 14300 0    60   ~ 0
D7
Text Label 5850 13700 0    60   ~ 0
D4
Text Label 5850 14100 0    60   ~ 0
VCC
Text Label 5850 13600 0    60   ~ 0
CLK
$Comp
L Z80PRINT-rescue:CONN_25X2-conn P2
U 1 1 6136A704
P 5350 14300
F 0 "P2" H 5350 15600 60  0000 C CNN
F 1 "Z80 BUS BACKPLANE" V 5350 14300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x25_P2.54mm_Horizontal" H 5350 14300 60  0001 C CNN
F 3 "" H 5350 14300 60  0001 C CNN
	1    5350 14300
	1    0    0    -1  
$EndComp
Text Label 5850 15300 0    60   ~ 0
SPARE2
Text Label 5850 15200 0    60   ~ 0
SPARE1
Text Label 5850 15100 0    60   ~ 0
SPARE0
Text Label 5850 15400 0    60   ~ 0
SPARE3
Text Label 5850 15500 0    60   ~ 0
SPARE4
Text Label 4550 15300 0    60   ~ 0
SPARE7
Text Label 4550 15200 0    60   ~ 0
SPARE8
Text Label 4550 15100 0    60   ~ 0
SPARE9
Text Label 4550 15400 0    60   ~ 0
SPARE6
Text Label 4550 15500 0    60   ~ 0
SPARE5
Text Notes 4400 12900 0    60   ~ 0
Note: Bus connector is mirror image of Z80\nCPU pin out to mate to backplane whose\nconnectors reflect Z80 CPU pin out.
NoConn ~ 4450 13100
NoConn ~ 4450 13200
NoConn ~ 4450 13300
NoConn ~ 6250 13100
NoConn ~ 6250 13200
NoConn ~ 6250 13300
NoConn ~ 6250 13400
NoConn ~ 6250 13500
NoConn ~ 4450 14300
NoConn ~ 4450 14600
NoConn ~ 4450 14800
NoConn ~ 4450 14700
Wire Wire Line
	4450 13300 4950 13300
Wire Wire Line
	4450 13200 4950 13200
Wire Wire Line
	4450 13100 4950 13100
Wire Wire Line
	5750 13100 6250 13100
Wire Wire Line
	5750 13200 6250 13200
Wire Wire Line
	5750 13300 6250 13300
Wire Wire Line
	5750 13400 6250 13400
Wire Wire Line
	5750 13500 6250 13500
Wire Wire Line
	4450 14100 4950 14100
Wire Wire Line
	4450 14000 4950 14000
Wire Wire Line
	4450 13900 4950 13900
Wire Wire Line
	4450 13800 4950 13800
Wire Wire Line
	4450 13700 4950 13700
Wire Wire Line
	4450 13600 4950 13600
Wire Wire Line
	4450 13500 4950 13500
Wire Wire Line
	4450 13400 4950 13400
Wire Wire Line
	4450 14200 4950 14200
Wire Wire Line
	4450 14400 4950 14400
Wire Wire Line
	4450 14300 4950 14300
Wire Wire Line
	5750 14800 6250 14800
Wire Wire Line
	4450 14800 4950 14800
Wire Wire Line
	4450 14500 4950 14500
Wire Wire Line
	4450 14700 4950 14700
Wire Wire Line
	4450 14600 4950 14600
Wire Wire Line
	5750 15000 6250 15000
Wire Wire Line
	5750 14900 6250 14900
Wire Wire Line
	4450 14900 4950 14900
Wire Wire Line
	4450 15000 4950 15000
Wire Wire Line
	5750 14400 6250 14400
Wire Wire Line
	5750 14500 6250 14500
Wire Wire Line
	5750 14200 6250 14200
Wire Wire Line
	5750 13800 6250 13800
Wire Wire Line
	5750 13700 6250 13700
Wire Wire Line
	5750 13900 6250 13900
Wire Wire Line
	5750 14000 6250 14000
Wire Wire Line
	5750 14300 6250 14300
Wire Wire Line
	5750 14100 6250 14100
Wire Wire Line
	5750 13600 6250 13600
Wire Wire Line
	4450 15200 4950 15200
Wire Wire Line
	4450 15100 4950 15100
Wire Wire Line
	5750 15100 6250 15100
Wire Wire Line
	4450 15400 4950 15400
Wire Wire Line
	4450 15300 4950 15300
Wire Wire Line
	5750 15400 6250 15400
Wire Wire Line
	5750 15300 6250 15300
Wire Wire Line
	5750 15200 6250 15200
Wire Wire Line
	4450 15500 4950 15500
Wire Wire Line
	5750 15500 6250 15500
NoConn ~ 6250 14900
NoConn ~ 6250 13600
NoConn ~ 6250 14800
Wire Wire Line
	5750 14700 6250 14700
Wire Wire Line
	5750 14600 6250 14600
Wire Wire Line
	9400 10100 9400 10000
Wire Wire Line
	14150 7550 13700 7550
Wire Wire Line
	14150 7450 13700 7450
Wire Wire Line
	14150 7650 13700 7650
Wire Wire Line
	14150 7750 13700 7750
Wire Wire Line
	14150 7350 13700 7350
Wire Wire Line
	14150 7250 13700 7250
Wire Wire Line
	14150 7050 13700 7050
Wire Wire Line
	14150 7150 13700 7150
Text Label 13750 7750 0    60   ~ 0
bD7
Text Label 13750 7650 0    60   ~ 0
bD6
Text Label 13750 7550 0    60   ~ 0
bD5
Text Label 13750 7450 0    60   ~ 0
bD4
Text Label 13750 7350 0    60   ~ 0
bD3
Text Label 13750 7250 0    60   ~ 0
bD2
Text Label 13750 7150 0    60   ~ 0
bD1
Text Label 13750 7050 0    60   ~ 0
bD0
Text Label 13750 5900 0    60   ~ 0
bD7
Text Label 13750 5800 0    60   ~ 0
bD6
Text Label 13750 5700 0    60   ~ 0
bD5
Text Label 13750 5600 0    60   ~ 0
bD4
Text Label 13750 5500 0    60   ~ 0
bD3
Text Label 13750 5400 0    60   ~ 0
bD2
Text Label 13750 5300 0    60   ~ 0
bD1
Text Label 13750 5200 0    60   ~ 0
bD0
Wire Wire Line
	15600 9400 15150 9400
Wire Wire Line
	15600 9300 15150 9300
Wire Wire Line
	15600 9500 15150 9500
Wire Wire Line
	15600 9600 15150 9600
Wire Wire Line
	15600 9200 15150 9200
Wire Wire Line
	15600 9100 15150 9100
Wire Wire Line
	15600 8900 15150 8900
Wire Wire Line
	15600 9000 15150 9000
Text Label 15200 9600 0    60   ~ 0
bD7
Text Label 15200 9500 0    60   ~ 0
bD6
Text Label 15200 9400 0    60   ~ 0
bD5
Text Label 15200 9300 0    60   ~ 0
bD4
Text Label 15200 9200 0    60   ~ 0
bD3
Text Label 15200 9100 0    60   ~ 0
bD2
Text Label 15200 9000 0    60   ~ 0
bD1
Text Label 15200 8900 0    60   ~ 0
bD0
$Comp
L Z80PRINT-rescue:VCC-power #PWR017
U 1 1 64B135B8
P 14650 6750
F 0 "#PWR017" H 14650 6850 30  0001 C CNN
F 1 "VCC" H 14650 6850 30  0000 C CNN
F 2 "" H 14650 6750 60  0001 C CNN
F 3 "" H 14650 6750 60  0001 C CNN
	1    14650 6750
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:GND-power #PWR018
U 1 1 64B14076
P 14650 8350
F 0 "#PWR018" H 14650 8350 30  0001 C CNN
F 1 "GND" H 14650 8280 30  0001 C CNN
F 2 "" H 14650 8350 60  0001 C CNN
F 3 "" H 14650 8350 60  0001 C CNN
	1    14650 8350
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:VCC-power #PWR019
U 1 1 64B1521A
P 14650 8600
F 0 "#PWR019" H 14650 8700 30  0001 C CNN
F 1 "VCC" H 14650 8700 30  0000 C CNN
F 2 "" H 14650 8600 60  0001 C CNN
F 3 "" H 14650 8600 60  0001 C CNN
	1    14650 8600
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:GND-power #PWR020
U 1 1 64B162AF
P 14650 10200
F 0 "#PWR020" H 14650 10200 30  0001 C CNN
F 1 "GND" H 14650 10130 30  0001 C CNN
F 2 "" H 14650 10200 60  0001 C CNN
F 3 "" H 14650 10200 60  0001 C CNN
	1    14650 10200
	1    0    0    -1  
$EndComp
Connection ~ 14150 9900
$Comp
L Z80PRINT-rescue:VCC-power #PWR021
U 1 1 650D2C14
P 14650 10400
F 0 "#PWR021" H 14650 10500 30  0001 C CNN
F 1 "VCC" H 14650 10500 30  0000 C CNN
F 2 "" H 14650 10400 60  0001 C CNN
F 3 "" H 14650 10400 60  0001 C CNN
	1    14650 10400
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:VCC-power #PWR023
U 1 1 650D350F
P 14650 12250
F 0 "#PWR023" H 14650 12350 30  0001 C CNN
F 1 "VCC" H 14650 12350 30  0000 C CNN
F 2 "" H 14650 12250 60  0001 C CNN
F 3 "" H 14650 12250 60  0001 C CNN
	1    14650 12250
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:GND-power #PWR022
U 1 1 650D3D1C
P 14650 12000
F 0 "#PWR022" H 14650 12000 30  0001 C CNN
F 1 "GND" H 14650 11930 30  0001 C CNN
F 2 "" H 14650 12000 60  0001 C CNN
F 3 "" H 14650 12000 60  0001 C CNN
	1    14650 12000
	1    0    0    -1  
$EndComp
Wire Wire Line
	15600 11200 15150 11200
Wire Wire Line
	15600 11100 15150 11100
Wire Wire Line
	15600 11300 15150 11300
Wire Wire Line
	15600 11400 15150 11400
Wire Wire Line
	15600 11000 15150 11000
Wire Wire Line
	15600 10900 15150 10900
Wire Wire Line
	15600 10700 15150 10700
Wire Wire Line
	15600 10800 15150 10800
Text Label 15200 11400 0    60   ~ 0
bD7
Text Label 15200 11300 0    60   ~ 0
bD6
Text Label 15200 11200 0    60   ~ 0
bD5
Text Label 15200 11100 0    60   ~ 0
bD4
Text Label 15200 11000 0    60   ~ 0
bD3
Text Label 15200 10900 0    60   ~ 0
bD2
Text Label 15200 10800 0    60   ~ 0
bD1
Text Label 15200 10700 0    60   ~ 0
bD0
Wire Wire Line
	15600 13050 15150 13050
Wire Wire Line
	15600 12950 15150 12950
Wire Wire Line
	15600 13150 15150 13150
Wire Wire Line
	15600 13250 15150 13250
Wire Wire Line
	15600 12850 15150 12850
Wire Wire Line
	15600 12750 15150 12750
Wire Wire Line
	15600 12550 15150 12550
Wire Wire Line
	15600 12650 15150 12650
Text Label 15200 13250 0    60   ~ 0
bD7
Text Label 15200 13150 0    60   ~ 0
bD6
Text Label 15200 13050 0    60   ~ 0
bD5
Text Label 15200 12950 0    60   ~ 0
bD4
Text Label 15200 12850 0    60   ~ 0
bD3
Text Label 15200 12750 0    60   ~ 0
bD2
Text Label 15200 12650 0    60   ~ 0
bD1
Text Label 15200 12550 0    60   ~ 0
bD0
Connection ~ 14150 10700
Connection ~ 14150 10800
Wire Wire Line
	14150 10800 14150 10900
Connection ~ 14150 11700
Wire Wire Line
	14150 13450 14150 13550
Connection ~ 14150 13550
$Comp
L Z80PRINT-rescue:GND-power #PWR024
U 1 1 656706D3
P 14650 13850
F 0 "#PWR024" H 14650 13850 30  0001 C CNN
F 1 "GND" H 14650 13780 30  0001 C CNN
F 2 "" H 14650 13850 60  0001 C CNN
F 3 "" H 14650 13850 60  0001 C CNN
	1    14650 13850
	1    0    0    -1  
$EndComp
NoConn ~ 13350 14950
NoConn ~ 13350 15050
Wire Wire Line
	4750 10550 5200 10550
Wire Wire Line
	4750 11550 5200 11550
$Comp
L 74xx:74LS08 U32
U 5 1 66828398
P 5200 11050
F 0 "U32" H 5200 11100 60  0000 C CNN
F 1 "74LS08" H 5200 11000 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5200 11050 60  0001 C CNN
F 3 "" H 5200 11050 60  0001 C CNN
	5    5200 11050
	1    0    0    -1  
$EndComp
Connection ~ 5200 10550
Wire Wire Line
	5200 10550 5650 10550
Connection ~ 5200 11550
Wire Wire Line
	5200 11550 5650 11550
$Comp
L 74xx:74LS06 U30
U 7 1 668B272F
P 3850 11050
F 0 "U30" H 3850 11100 60  0000 C CNN
F 1 "74LS06" H 3850 11000 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3850 11050 60  0001 C CNN
F 3 "" H 3850 11050 60  0001 C CNN
	7    3850 11050
	1    0    0    -1  
$EndComp
Connection ~ 4750 10550
Connection ~ 3850 11550
$Comp
L 74xx:74LS139 U4
U 1 1 617132C0
P 10000 4850
F 0 "U4" H 10000 5217 50  0000 C CNN
F 1 "74LS139" H 10000 5126 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 10000 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 10000 4850 50  0001 C CNN
	1    10000 4850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U4
U 2 1 61713E09
P 10000 5700
F 0 "U4" H 10000 6067 50  0000 C CNN
F 1 "74LS139" H 10000 5976 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 10000 5700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 10000 5700 50  0001 C CNN
	2    10000 5700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U4
U 3 1 61714785
P 4300 11050
F 0 "U4" H 4250 11100 50  0000 L CNN
F 1 "74LS139" H 4150 11000 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 4300 11050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 4300 11050 50  0001 C CNN
	3    4300 11050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 5150 6500 5150
Wire Wire Line
	4600 6050 4600 6150
Connection ~ 4600 6150
Wire Wire Line
	5200 6050 5800 6050
Connection ~ 5800 6050
Wire Wire Line
	9200 4850 9500 4850
Wire Wire Line
	9200 4750 9500 4750
Text Label 9300 5700 0    60   ~ 0
bA0
Text Label 9300 5600 0    60   ~ 0
bA1
Wire Wire Line
	9200 5700 9500 5700
Wire Wire Line
	9200 5600 9500 5600
NoConn ~ 10500 5700
NoConn ~ 10500 5900
Wire Wire Line
	8900 5800 7600 5800
Connection ~ 7600 5800
Wire Wire Line
	7600 5800 7600 4950
NoConn ~ 10500 5050
Text Label 8600 5150 0    60   ~ 0
bRD#
Text Label 8600 6000 0    60   ~ 0
bWR#
Wire Wire Line
	8500 5150 8900 5150
Wire Wire Line
	8500 6000 8900 6000
$Comp
L 74xx:74LS08 U32
U 4 1 4ED11C31
P 10350 13450
F 0 "U32" H 10350 13500 60  0000 C CNN
F 1 "74LS08" H 10350 13400 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10350 13450 60  0001 C CNN
F 3 "" H 10350 13450 60  0001 C CNN
	4    10350 13450
	1    0    0    -1  
$EndComp
NoConn ~ 10050 13350
NoConn ~ 10050 13550
$Comp
L 74xx:74LS08 U32
U 2 1 4ED11C39
P 9700 9900
F 0 "U32" H 9700 9950 60  0000 C CNN
F 1 "74LS08" H 9700 9850 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9700 9900 60  0001 C CNN
F 3 "" H 9700 9900 60  0001 C CNN
	2    9700 9900
	1    0    0    -1  
$EndComp
Text Label 9050 9800 0    60   ~ 0
PARINT
Wire Wire Line
	3850 10550 4300 10550
Wire Wire Line
	3850 11550 4300 11550
$Comp
L 74xx:74LS06 U30
U 6 1 6206FD32
P 10300 9900
F 0 "U30" H 10495 10015 60  0000 C CNN
F 1 "74LS06" H 10490 9775 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10300 9900 60  0001 C CNN
F 3 "" H 10300 9900 60  0001 C CNN
	6    10300 9900
	1    0    0    -1  
$EndComp
Connection ~ 4300 10550
Wire Wire Line
	4300 10550 4750 10550
Connection ~ 4300 11550
Wire Wire Line
	4300 11550 4750 11550
NoConn ~ 8900 4300
Wire Wire Line
	1900 11550 3850 11550
Wire Wire Line
	2900 10300 3150 10300
Wire Wire Line
	2900 9900 3150 9900
Wire Wire Line
	2650 10300 2900 10300
Wire Wire Line
	2650 9900 2900 9900
Wire Wire Line
	2400 10300 2650 10300
Wire Wire Line
	2400 9900 2650 9900
Wire Wire Line
	2150 10300 2400 10300
Wire Wire Line
	2150 9900 2400 9900
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C25
U 1 1 62505574
P 3150 10750
F 0 "C25" H 3200 10850 50  0000 L CNN
F 1 "0.1u" H 3200 10650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3150 10750 60  0001 C CNN
F 3 "" H 3150 10750 60  0001 C CNN
	1    3150 10750
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C15
U 1 1 6250557E
P 2900 10750
F 0 "C15" H 2950 10850 50  0000 L CNN
F 1 "0.1u" H 2950 10650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2900 10750 60  0001 C CNN
F 3 "" H 2900 10750 60  0001 C CNN
	1    2900 10750
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C14
U 1 1 62505588
P 2650 10750
F 0 "C14" H 2700 10850 50  0000 L CNN
F 1 "0.1u" H 2700 10650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2650 10750 60  0001 C CNN
F 3 "" H 2650 10750 60  0001 C CNN
	1    2650 10750
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C13
U 1 1 62505592
P 2400 10750
F 0 "C13" H 2450 10850 50  0000 L CNN
F 1 "0.1u" H 2450 10650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2400 10750 60  0001 C CNN
F 3 "" H 2400 10750 60  0001 C CNN
	1    2400 10750
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue C12
U 1 1 6250559C
P 2150 10750
F 0 "C12" H 2200 10850 50  0000 L CNN
F 1 "0.1u" H 2200 10650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2150 10750 60  0001 C CNN
F 3 "" H 2150 10750 60  0001 C CNN
	1    2150 10750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 10550 3150 10550
Connection ~ 3850 10550
Connection ~ 2400 10550
Wire Wire Line
	2400 10550 2150 10550
Connection ~ 2650 10550
Wire Wire Line
	2650 10550 2400 10550
Connection ~ 2900 10550
Wire Wire Line
	2900 10550 2650 10550
Connection ~ 3150 10550
Wire Wire Line
	3150 10550 2900 10550
Wire Wire Line
	3150 10950 2900 10950
Connection ~ 1900 10950
Wire Wire Line
	1900 10950 1900 11550
Connection ~ 2150 10950
Wire Wire Line
	2150 10950 1900 10950
Connection ~ 2400 10950
Wire Wire Line
	2400 10950 2150 10950
Connection ~ 2650 10950
Wire Wire Line
	2650 10950 2400 10950
Connection ~ 2900 10950
Wire Wire Line
	2900 10950 2650 10950
Wire Wire Line
	3100 7950 6500 7950
Wire Wire Line
	6400 8050 6400 5050
Wire Wire Line
	6400 5050 6500 5050
Wire Wire Line
	3100 8050 6400 8050
Connection ~ 6500 5050
NoConn ~ 9250 13350
NoConn ~ 9250 13550
NoConn ~ 9850 13450
NoConn ~ 9250 13800
NoConn ~ 9850 13800
NoConn ~ 13350 14850
$Comp
L 74xx:74LS08 U32
U 1 1 4ED11C3A
P 11000 9200
F 0 "U32" H 11000 9250 60  0000 C CNN
F 1 "74LS08" H 11000 9150 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 11000 9200 60  0001 C CNN
F 3 "" H 11000 9200 60  0001 C CNN
	1    11000 9200
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue R10
U 1 1 621E92F9
P 11300 8650
F 0 "R10" V 11380 8650 50  0000 C CNN
F 1 "470" V 11300 8650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 11300 8650 60  0001 C CNN
F 3 "" H 11300 8650 60  0001 C CNN
	1    11300 8650
	-1   0    0    1   
$EndComp
$Comp
L device:LED D3
U 1 1 621E9303
P 11300 9050
F 0 "D3" H 11300 9150 50  0000 C CNN
F 1 "LED" H 11300 8950 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 11300 9050 60  0001 C CNN
F 3 "" H 11300 9050 60  0001 C CNN
	1    11300 9050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10700 9900 10700 9300
Connection ~ 10700 9300
Wire Wire Line
	10700 9300 10700 9100
Connection ~ 10700 9900
Wire Wire Line
	10700 9900 10900 9900
Wire Wire Line
	10600 9900 10700 9900
$Comp
L Z80PRINT-rescue:VCC-power #PWR05
U 1 1 62499FBB
P 11300 8400
F 0 "#PWR05" H 11300 8500 30  0001 C CNN
F 1 "VCC" H 11300 8500 30  0000 C CNN
F 2 "" H 11300 8400 60  0001 C CNN
F 3 "" H 11300 8400 60  0001 C CNN
	1    11300 8400
	1    0    0    -1  
$EndComp
Text Notes 11550 9200 1    60   ~ 0
INTERRUPT LED
Wire Wire Line
	14150 5500 13700 5500
Wire Wire Line
	14150 5400 13700 5400
Wire Wire Line
	14150 5300 13700 5300
Wire Wire Line
	14150 5200 13700 5200
$Comp
L Z80PRINT-rescue:VCC-power #PWR014
U 1 1 64B04B10
P 14650 4900
F 0 "#PWR014" H 14650 5000 30  0001 C CNN
F 1 "VCC" H 14650 5000 30  0000 C CNN
F 2 "" H 14650 4900 60  0001 C CNN
F 3 "" H 14650 4900 60  0001 C CNN
	1    14650 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	14150 5900 13700 5900
Wire Wire Line
	14150 5800 13700 5800
Wire Wire Line
	14150 5700 13700 5700
Wire Wire Line
	14150 5600 13700 5600
Wire Wire Line
	14150 6100 13700 6100
$Comp
L Z80PRINT-rescue:GND-power #PWR015
U 1 1 64B0D3CB
P 14650 6500
F 0 "#PWR015" H 14650 6500 30  0001 C CNN
F 1 "GND" H 14650 6430 30  0001 C CNN
F 2 "" H 14650 6500 60  0001 C CNN
F 3 "" H 14650 6500 60  0001 C CNN
	1    14650 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	13250 6200 14150 6200
$Comp
L 74xx:74LS374 U25
U 1 1 4ED10C2A
P 14650 5700
F 0 "U25" H 14650 5700 60  0000 C CNN
F 1 "74LS374" H 14700 5350 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 14650 5700 60  0001 C CNN
F 3 "" H 14650 5700 60  0001 C CNN
	1    14650 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	16200 8400 17250 8400
Wire Wire Line
	16500 5800 20150 5800
Wire Wire Line
	16500 5600 19650 5600
Wire Wire Line
	16500 5400 19150 5400
Wire Wire Line
	16500 5200 18650 5200
Wire Wire Line
	17000 5700 19900 5700
Wire Wire Line
	17000 5500 19400 5500
Wire Wire Line
	17000 5300 18900 5300
Wire Wire Line
	17000 5900 20400 5900
Text Label 17050 5900 0    60   ~ 0
PD7
Text Label 17050 5800 0    60   ~ 0
PD6
Text Label 17050 5700 0    60   ~ 0
PD5
Text Label 17050 5600 0    60   ~ 0
PD4
Text Label 17050 5500 0    60   ~ 0
PD3
Text Label 17050 5400 0    60   ~ 0
PD2
Text Label 17050 5300 0    60   ~ 0
PD1
Text Label 17050 5200 0    60   ~ 0
PD0
$Comp
L Z80PRINT-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue R3
U 1 1 4ED1130D
P 16250 5600
F 0 "R3" V 16330 5600 50  0000 C CNN
F 1 "27" V 16250 5600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16250 5600 60  0001 C CNN
F 3 "" H 16250 5600 60  0001 C CNN
	1    16250 5600
	0    1    1    0   
$EndComp
$Comp
L Z80PRINT-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue R7
U 1 1 4ED1130C
P 16750 5700
F 0 "R7" V 16830 5700 50  0000 C CNN
F 1 "27" V 16750 5700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16750 5700 60  0001 C CNN
F 3 "" H 16750 5700 60  0001 C CNN
	1    16750 5700
	0    1    1    0   
$EndComp
$Comp
L Z80PRINT-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue R8
U 1 1 4ED1130B
P 16750 5900
F 0 "R8" V 16830 5900 50  0000 C CNN
F 1 "27" V 16750 5900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16750 5900 60  0001 C CNN
F 3 "" H 16750 5900 60  0001 C CNN
	1    16750 5900
	0    1    1    0   
$EndComp
$Comp
L Z80PRINT-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue R4
U 1 1 4ED1130A
P 16250 5800
F 0 "R4" V 16330 5800 50  0000 C CNN
F 1 "27" V 16250 5800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16250 5800 60  0001 C CNN
F 3 "" H 16250 5800 60  0001 C CNN
	1    16250 5800
	0    1    1    0   
$EndComp
$Comp
L Z80PRINT-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue R2
U 1 1 4ED11307
P 16250 5400
F 0 "R2" V 16330 5400 50  0000 C CNN
F 1 "27" V 16250 5400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16250 5400 60  0001 C CNN
F 3 "" H 16250 5400 60  0001 C CNN
	1    16250 5400
	0    1    1    0   
$EndComp
$Comp
L Z80PRINT-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue R6
U 1 1 4ED11306
P 16750 5500
F 0 "R6" V 16830 5500 50  0000 C CNN
F 1 "27" V 16750 5500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16750 5500 60  0001 C CNN
F 3 "" H 16750 5500 60  0001 C CNN
	1    16750 5500
	0    1    1    0   
$EndComp
$Comp
L Z80PRINT-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue R5
U 1 1 4ED11302
P 16750 5300
F 0 "R5" V 16830 5300 50  0000 C CNN
F 1 "27" V 16750 5300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16750 5300 60  0001 C CNN
F 3 "" H 16750 5300 60  0001 C CNN
	1    16750 5300
	0    1    1    0   
$EndComp
$Comp
L Z80PRINT-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue R1
U 1 1 4ED112F6
P 16250 5200
F 0 "R1" V 16330 5200 50  0000 C CNN
F 1 "27" V 16250 5200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16250 5200 60  0001 C CNN
F 3 "" H 16250 5200 60  0001 C CNN
	1    16250 5200
	0    1    1    0   
$EndComp
Connection ~ 20150 5800
Connection ~ 19650 5600
Connection ~ 19400 5500
Connection ~ 19150 5400
Connection ~ 18650 5200
Connection ~ 18900 5300
Connection ~ 19900 5700
Connection ~ 20400 5900
Wire Wire Line
	20400 5900 20500 5900
Wire Wire Line
	19900 5700 20500 5700
Wire Wire Line
	18900 5300 20500 5300
Wire Wire Line
	20150 7100 19900 7100
Wire Wire Line
	19900 7100 19650 7100
Wire Wire Line
	19650 7100 19400 7100
Wire Wire Line
	19400 7100 19150 7100
Wire Wire Line
	19150 7100 18900 7100
Wire Wire Line
	18900 7100 18650 7100
Wire Wire Line
	18650 7100 18400 7100
Wire Wire Line
	18650 5200 20500 5200
Wire Wire Line
	19150 5400 20500 5400
Wire Wire Line
	19400 5500 20500 5500
Wire Wire Line
	19650 5600 20500 5600
Wire Wire Line
	20150 5800 20500 5800
$Comp
L 74xx:74LS04 U21
U 3 1 4ED0FEF7
P 16800 7750
F 0 "U21" H 16995 7865 60  0000 C CNN
F 1 "74LS04" H 16990 7625 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 16800 7750 60  0001 C CNN
F 3 "" H 16800 7750 60  0001 C CNN
	3    16800 7750
	1    0    0    -1  
$EndComp
Text Label 17650 7050 0    60   ~ 0
/STROBE
Text Label 17150 7400 0    60   ~ 0
/LINEFEED
Text Label 17750 7750 0    60   ~ 0
P-RESET
Text Label 17150 8100 0    60   ~ 0
/SEL
$Comp
L Z80PRINT-rescue:C-RESCUE-ColorVDU-ColorVDU-rescue C16
U 1 1 4ED118E9
P 18650 6900
F 0 "C16" H 18700 7000 50  0000 L CNN
F 1 "2.2nF" H 18700 6800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 18650 6900 60  0001 C CNN
F 3 "" H 18650 6900 60  0001 C CNN
	1    18650 6900
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-RESCUE-ColorVDU-ColorVDU-rescue C17
U 1 1 4ED11932
P 18900 6900
F 0 "C17" H 18950 7000 50  0000 L CNN
F 1 "2.2nF" H 18950 6800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 18900 6900 60  0001 C CNN
F 3 "" H 18900 6900 60  0001 C CNN
	1    18900 6900
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-RESCUE-ColorVDU-ColorVDU-rescue C19
U 1 1 4ED11937
P 19400 6900
F 0 "C19" H 19450 7000 50  0000 L CNN
F 1 "2.2nF" H 19450 6800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 19400 6900 60  0001 C CNN
F 3 "" H 19400 6900 60  0001 C CNN
	1    19400 6900
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-RESCUE-ColorVDU-ColorVDU-rescue C18
U 1 1 4ED11938
P 19150 6900
F 0 "C18" H 19200 7000 50  0000 L CNN
F 1 "2.2nF" H 19200 6800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 19150 6900 60  0001 C CNN
F 3 "" H 19150 6900 60  0001 C CNN
	1    19150 6900
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-RESCUE-ColorVDU-ColorVDU-rescue C22
U 1 1 4ED1193B
P 20150 6900
F 0 "C22" H 20200 7000 50  0000 L CNN
F 1 "2.2nF" H 20200 6800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 20150 6900 60  0001 C CNN
F 3 "" H 20150 6900 60  0001 C CNN
	1    20150 6900
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-RESCUE-ColorVDU-ColorVDU-rescue C23
U 1 1 4ED1193C
P 20400 6900
F 0 "C23" H 20450 7000 50  0000 L CNN
F 1 "2.2nF" H 20450 6800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 20400 6900 60  0001 C CNN
F 3 "" H 20400 6900 60  0001 C CNN
	1    20400 6900
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-RESCUE-ColorVDU-ColorVDU-rescue C21
U 1 1 4ED1193D
P 19900 6900
F 0 "C21" H 19950 7000 50  0000 L CNN
F 1 "2.2nF" H 19950 6800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 19900 6900 60  0001 C CNN
F 3 "" H 19900 6900 60  0001 C CNN
	1    19900 6900
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:C-RESCUE-ColorVDU-ColorVDU-rescue C20
U 1 1 4ED1193E
P 19650 6900
F 0 "C20" H 19700 7000 50  0000 L CNN
F 1 "2.2nF" H 19700 6800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 19650 6900 60  0001 C CNN
F 3 "" H 19650 6900 60  0001 C CNN
	1    19650 6900
	1    0    0    -1  
$EndComp
$Comp
L Z80PRINT-rescue:GND-RESCUE-ColorVDU-ColorVDU-rescue #PWR09
U 1 1 4ED11947
P 20400 7150
F 0 "#PWR09" H 20400 7150 30  0001 C CNN
F 1 "GND" H 20400 7080 30  0001 C CNN
F 2 "" H 20400 7150 60  0001 C CNN
F 3 "" H 20400 7150 60  0001 C CNN
	1    20400 7150
	1    0    0    -1  
$EndComp
Text Label 16250 8400 0    60   ~ 0
PARINT
$Comp
L Z80PRINT-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue R9
U 1 1 4ED131C0
P 17350 7050
F 0 "R9" V 17430 7050 50  0000 C CNN
F 1 "27" V 17350 7050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 17350 7050 60  0001 C CNN
F 3 "" H 17350 7050 60  0001 C CNN
	1    17350 7050
	0    1    1    0   
$EndComp
$Comp
L Z80PRINT-rescue:C-RESCUE-ColorVDU-ColorVDU-rescue C24
U 1 1 4ED131E1
P 18400 6900
F 0 "C24" H 18450 7000 50  0000 L CNN
F 1 "2.2nF" H 18450 6800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 18400 6900 60  0001 C CNN
F 3 "" H 18400 6900 60  0001 C CNN
	1    18400 6900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U30
U 2 1 4EDACCBA
P 16800 8100
F 0 "U30" H 16995 8215 60  0000 C CNN
F 1 "74LS06" H 16990 7975 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 16800 8100 60  0001 C CNN
F 3 "" H 16800 8100 60  0001 C CNN
	2    16800 8100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U30
U 3 1 4EDACCDC
P 16800 7050
F 0 "U30" H 16995 7165 60  0000 C CNN
F 1 "74LS06" H 16990 6925 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 16800 7050 60  0001 C CNN
F 3 "" H 16800 7050 60  0001 C CNN
	3    16800 7050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U30
U 4 1 4EDACCE2
P 16800 7400
F 0 "U30" H 16995 7515 60  0000 C CNN
F 1 "74LS06" H 16990 7275 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 16800 7400 60  0001 C CNN
F 3 "" H 16800 7400 60  0001 C CNN
	4    16800 7400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U30
U 5 1 4EDACCE9
P 17400 7750
F 0 "U30" H 17595 7865 60  0000 C CNN
F 1 "74LS06" H 17590 7625 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 17400 7750 60  0001 C CNN
F 3 "" H 17400 7750 60  0001 C CNN
	5    17400 7750
	1    0    0    -1  
$EndComp
Wire Wire Line
	16100 7550 16100 8200
Wire Wire Line
	20400 7100 20150 7100
Wire Wire Line
	16200 7450 16200 8400
Wire Wire Line
	20400 6700 20400 5900
Wire Wire Line
	19900 6700 19900 5700
Wire Wire Line
	19400 6700 19400 5500
Wire Wire Line
	19150 6700 19150 5400
Wire Wire Line
	18900 6700 18900 5300
Connection ~ 20400 7100
Connection ~ 20150 7100
Connection ~ 19900 7100
Connection ~ 19650 7100
Connection ~ 19400 7100
Connection ~ 19150 7100
Connection ~ 18900 7100
Connection ~ 18650 7100
Wire Wire Line
	20400 7150 20400 7100
Wire Wire Line
	17100 8100 17500 8100
Wire Wire Line
	17700 7750 18100 7750
Wire Wire Line
	17100 7400 17500 7400
Wire Wire Line
	16300 8100 16500 8100
Wire Wire Line
	16300 7350 16300 8100
Wire Wire Line
	16500 7150 16500 7400
Wire Wire Line
	16400 7750 16400 7250
Wire Wire Line
	16500 7750 16400 7750
Wire Wire Line
	18650 6700 18650 5200
Wire Wire Line
	19650 6700 19650 5600
Wire Wire Line
	20150 6700 20150 5800
Wire Wire Line
	18100 7050 17600 7050
Wire Wire Line
	18100 6700 18100 7050
Wire Wire Line
	18400 6700 18100 6700
Wire Wire Line
	15150 5200 16000 5200
Wire Wire Line
	15150 5300 16500 5300
Wire Wire Line
	15150 5400 16000 5400
Wire Wire Line
	15150 5500 16500 5500
Wire Wire Line
	15150 5600 16000 5600
Wire Wire Line
	15150 5700 16500 5700
Wire Wire Line
	15150 5800 16000 5800
Wire Wire Line
	15150 5900 16500 5900
Wire Wire Line
	15150 7050 16500 7050
Wire Wire Line
	15150 7150 16500 7150
Wire Wire Line
	15150 7250 16400 7250
Wire Wire Line
	15150 7350 16300 7350
Wire Wire Line
	15150 7450 16200 7450
Wire Wire Line
	15150 7550 16100 7550
Wire Wire Line
	13250 8200 16100 8200
Wire Wire Line
	14150 13150 13750 13150
Wire Wire Line
	14150 13250 13750 13250
Text Label 13800 13150 0    60   ~ 0
STATUS0
Text Label 13800 13250 0    60   ~ 0
STATUS1
Text Label 15200 7650 0    60   ~ 0
STATUS0
Text Label 15200 7750 0    60   ~ 0
STATUS1
$Comp
L Z80PRINT-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue R11
U 1 1 6244FC6B
P 16200 8950
F 0 "R11" V 16280 8950 50  0000 C CNN
F 1 "470" V 16200 8950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16200 8950 60  0001 C CNN
F 3 "" H 16200 8950 60  0001 C CNN
	1    16200 8950
	-1   0    0    1   
$EndComp
$Comp
L device:LED D4
U 1 1 6244FC75
P 16200 9350
F 0 "D4" H 16200 9450 50  0000 C CNN
F 1 "LED" H 16200 9250 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 16200 9350 60  0001 C CNN
F 3 "" H 16200 9350 60  0001 C CNN
	1    16200 9350
	0    -1   -1   0   
$EndComp
$Comp
L Z80PRINT-rescue:VCC-power #PWR0101
U 1 1 6244FC7F
P 16200 8700
F 0 "#PWR0101" H 16200 8800 30  0001 C CNN
F 1 "VCC" H 16200 8800 30  0000 C CNN
F 2 "" H 16200 8700 60  0001 C CNN
F 3 "" H 16200 8700 60  0001 C CNN
	1    16200 8700
	1    0    0    -1  
$EndComp
Text Notes 16450 9500 1    60   ~ 0
STATUS0 LED
$Comp
L Z80PRINT-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue R14
U 1 1 624EEE61
P 16800 8950
F 0 "R14" V 16880 8950 50  0000 C CNN
F 1 "470" V 16800 8950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16800 8950 60  0001 C CNN
F 3 "" H 16800 8950 60  0001 C CNN
	1    16800 8950
	-1   0    0    1   
$EndComp
$Comp
L device:LED D5
U 1 1 624EEE6B
P 16800 9350
F 0 "D5" H 16800 9450 50  0000 C CNN
F 1 "LED" H 16800 9250 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 16800 9350 60  0001 C CNN
F 3 "" H 16800 9350 60  0001 C CNN
	1    16800 9350
	0    -1   -1   0   
$EndComp
$Comp
L Z80PRINT-rescue:VCC-power #PWR0102
U 1 1 624EEE75
P 16800 8700
F 0 "#PWR0102" H 16800 8800 30  0001 C CNN
F 1 "VCC" H 16800 8800 30  0000 C CNN
F 2 "" H 16800 8700 60  0001 C CNN
F 3 "" H 16800 8700 60  0001 C CNN
	1    16800 8700
	1    0    0    -1  
$EndComp
Text Notes 17050 9500 1    60   ~ 0
STATUS1 LED
Wire Wire Line
	15900 7650 15900 9500
Wire Wire Line
	15900 9500 16200 9500
Wire Wire Line
	15150 7650 15900 7650
Wire Wire Line
	15800 7750 15800 9600
Wire Wire Line
	15800 9600 16800 9600
Wire Wire Line
	16800 9600 16800 9500
Wire Wire Line
	15150 7750 15800 7750
Wire Wire Line
	15450 4600 15050 4600
Text Label 15100 4600 0    60   ~ 0
STATUS0
Text Notes 15800 4800 0    60   ~ 0
NOTE: STATUS0 WILL NOT APPEAR \nON IBM PC COMPATIBLE DB25 \nFEMALE CONNECTOR
$EndSCHEMATC
