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
L Z80GDCA-rescue:74LS245-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue U2
U 1 1 637504C8
P 2100 4400
F 0 "U2" H 2200 4975 60  0000 L BNN
F 1 "74LS245" H 2000 3950 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2100 4400 60  0001 C CNN
F 3 "" H 2100 4400 60  0001 C CNN
	1    2100 4400
	1    0    0    -1  
$EndComp
Text Label 1100 5800 0    60   ~ 0
WR#
Text Label 1100 5600 0    60   ~ 0
IORQ#
Text Label 1100 4000 0    60   ~ 0
D1
Text Label 1100 4100 0    60   ~ 0
D2
Text Label 1100 4200 0    60   ~ 0
D3
Text Label 1100 3900 0    60   ~ 0
D0
Text Label 1100 4400 0    60   ~ 0
D5
Text Label 1100 4500 0    60   ~ 0
D6
Text Label 1100 4600 0    60   ~ 0
D7
Text Label 1100 4300 0    60   ~ 0
D4
NoConn ~ 2800 5400
Text Label 1100 5700 0    60   ~ 0
M1#
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 6044C0E0
P 4600 3800
F 0 "SW1" H 4600 4350 50  0000 C CNN
F 1 "IO PORT ADDR" H 4600 3350 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Slide_9.78x22.5mm_W7.62mm_P2.54mm" H 4600 3800 50  0001 C CNN
F 3 "" H 4600 3800 50  0001 C CNN
	1    4600 3800
	1    0    0    1   
$EndComp
$Comp
L Z80GDCA-rescue:RR8-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue RR1
U 1 1 6044D2F4
P 5350 4750
F 0 "RR1" H 5400 5350 70  0000 C CNN
F 1 "10K" V 5380 4750 70  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" H 5350 4750 60  0001 C CNN
F 3 "" H 5350 4750 60  0001 C CNN
	1    5350 4750
	0    1    1    0   
$EndComp
Text Notes 1150 2300 0    60   ~ 0
Z80 BUS INTERFACE
Text Label 1100 5200 0    60   ~ 0
RESET#
$Comp
L Z80GDCA-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR06
U 1 1 604651AE
P 5800 4400
F 0 "#PWR06" H 5800 4500 30  0001 C CNN
F 1 "VCC" H 5800 4500 30  0000 C CNN
F 2 "" H 5800 4400 60  0001 C CNN
F 3 "" H 5800 4400 60  0001 C CNN
	1    5800 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5600 1400 5600
Wire Wire Line
	1000 5800 1400 5800
Wire Wire Line
	1000 3900 1400 3900
Wire Wire Line
	1000 4000 1400 4000
Wire Wire Line
	1000 4100 1400 4100
Wire Wire Line
	1000 4200 1400 4200
Wire Wire Line
	1000 4300 1400 4300
Wire Wire Line
	1000 4400 1400 4400
Wire Wire Line
	1000 4500 1400 4500
Wire Wire Line
	1000 4600 1400 4600
Wire Wire Line
	1000 4800 1400 4800
Wire Wire Line
	1000 5700 1400 5700
Connection ~ 4300 3900
Connection ~ 4300 4000
Connection ~ 4300 4100
Connection ~ 4300 4200
Wire Wire Line
	4900 3800 5400 3800
Wire Wire Line
	4900 3900 5300 3900
Wire Wire Line
	4900 4000 5200 4000
Wire Wire Line
	4900 4100 5100 4100
Wire Wire Line
	4900 4200 5000 4200
Wire Wire Line
	5000 4400 5000 4200
Connection ~ 5000 4200
Wire Wire Line
	5100 4400 5100 4100
Connection ~ 5100 4100
Wire Wire Line
	5200 4400 5200 4000
Connection ~ 5200 4000
Wire Wire Line
	5300 4400 5300 3900
Connection ~ 5300 3900
Wire Wire Line
	5400 4400 5400 3800
Connection ~ 5400 3800
Wire Wire Line
	5500 4400 5500 3700
Wire Wire Line
	5600 4400 5600 3600
Wire Wire Line
	5700 4400 5700 3500
Wire Wire Line
	2800 5800 3900 5800
Wire Wire Line
	3900 5800 3900 2150
Wire Wire Line
	3800 5900 3800 2050
Wire Wire Line
	2900 3900 2800 3900
Wire Wire Line
	3000 4000 2800 4000
Wire Wire Line
	3000 1250 3000 4000
Wire Wire Line
	3100 4100 2800 4100
Wire Wire Line
	3100 1350 3100 4100
Wire Wire Line
	3200 4200 2800 4200
Wire Wire Line
	3200 1450 3200 4200
Wire Wire Line
	3300 4300 2800 4300
Wire Wire Line
	3300 1550 3300 4300
Wire Wire Line
	3400 4400 2800 4400
Wire Wire Line
	3400 1650 3400 4400
Wire Wire Line
	3500 4500 2800 4500
Wire Wire Line
	3500 1750 3500 4500
Wire Wire Line
	2800 4600 3600 4600
Wire Wire Line
	3600 4600 3600 1850
Wire Wire Line
	6200 4400 6200 5600
Wire Wire Line
	1000 5200 1400 5200
Wire Wire Line
	2800 5200 3700 5200
Wire Wire Line
	3700 5200 3700 1950
$Comp
L Z80GDCA-rescue:GND-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR04
U 1 1 60465D86
P 4300 4400
F 0 "#PWR04" H 4300 4400 30  0001 C CNN
F 1 "GND" H 4300 4330 30  0001 C CNN
F 2 "" H 4300 4400 60  0001 C CNN
F 3 "" H 4300 4400 60  0001 C CNN
	1    4300 4400
	1    0    0    -1  
$EndComp
Text Label 2850 5700 0    60   ~ 0
bM1#
Text Label 2850 5600 0    60   ~ 0
bIORQ#
Text Label 2850 5800 0    60   ~ 0
bWR#
Text Notes 4950 2400 0    60   ~ 0
IO SELECTION CIRCUIT
Text Notes 4200 4650 0    60   ~ 0
SET IO PORT
Wire Wire Line
	4300 3800 4300 3900
Wire Wire Line
	4300 3900 4300 4000
Wire Wire Line
	4300 4000 4300 4100
Wire Wire Line
	4300 4100 4300 4200
Wire Wire Line
	4300 4200 4300 4400
Wire Wire Line
	5000 4200 6200 4200
Wire Wire Line
	5100 4100 6200 4100
Wire Wire Line
	5200 4000 6200 4000
Wire Wire Line
	5300 3900 6200 3900
Wire Wire Line
	5400 3800 6200 3800
Wire Wire Line
	5500 3700 6200 3700
Wire Wire Line
	5600 3600 6200 3600
Wire Wire Line
	5700 3500 6200 3500
$Comp
L Z80GDCA-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue U3
U 1 1 603971B6
P 2100 5700
F 0 "U3" H 2150 5500 60  0000 C CNN
F 1 "74LS244" H 2200 5300 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2100 5700 60  0001 C CNN
F 3 "" H 2100 5700 60  0001 C CNN
	1    2100 5700
	1    0    0    -1  
$EndComp
NoConn ~ 1400 5400
Text Label 1050 5050 0    60   ~ 0
CS_GDC#
Wire Wire Line
	3900 2150 8600 2150
Wire Wire Line
	3800 2050 8600 2050
Wire Wire Line
	3700 1950 8600 1950
Wire Wire Line
	3500 1750 8600 1750
Wire Wire Line
	3000 1250 8600 1250
Wire Wire Line
	2900 1150 8600 1150
Wire Wire Line
	3600 1850 8600 1850
Wire Wire Line
	3400 1650 8600 1650
Wire Wire Line
	3300 1550 8600 1550
Wire Wire Line
	3200 1450 8600 1450
Wire Wire Line
	3100 1350 8600 1350
Text Label 1100 4800 0    60   ~ 0
RD#
Text Label 1100 2900 0    60   ~ 0
A3
Text Label 1100 3100 0    60   ~ 0
A5
Text Label 1100 3200 0    60   ~ 0
A6
Text Label 1100 3300 0    60   ~ 0
A7
Text Label 1100 3000 0    60   ~ 0
A4
Text Label 1100 2600 0    60   ~ 0
A0
Text Label 1100 2800 0    60   ~ 0
A2
Text Label 1100 2700 0    60   ~ 0
A1
Wire Wire Line
	1000 2900 1400 2900
Wire Wire Line
	1000 3000 1400 3000
Wire Wire Line
	1000 3100 1400 3100
Wire Wire Line
	1000 3200 1400 3200
Wire Wire Line
	1000 3300 1400 3300
Wire Wire Line
	1000 2600 1400 2600
Wire Wire Line
	1000 2700 1400 2700
Wire Wire Line
	1000 2800 1400 2800
Wire Wire Line
	2900 1150 2900 3900
Wire Wire Line
	2800 3300 6200 3300
Wire Wire Line
	2800 3200 6200 3200
Wire Wire Line
	2800 3100 6200 3100
Wire Wire Line
	2800 3000 6200 3000
Wire Wire Line
	2800 2900 6200 2900
Text Label 4000 2800 0    60   ~ 0
bA2
Text Label 4000 3000 0    60   ~ 0
bA4
Text Label 4000 3300 0    60   ~ 0
bA7
Text Label 4000 3200 0    60   ~ 0
bA6
Text Label 4000 3100 0    60   ~ 0
bA5
Text Label 4000 2900 0    60   ~ 0
bA3
$Comp
L Z80GDCA-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue U1
U 1 1 60BC80C2
P 2100 3100
F 0 "U1" H 2200 3675 60  0000 L BNN
F 1 "74LS244" H 2000 2650 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2100 3100 60  0001 C CNN
F 3 "" H 2100 3100 60  0001 C CNN
	1    2100 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  6100 800  3500
Wire Wire Line
	800  3500 1400 3500
Wire Wire Line
	1400 3600 1400 3500
Connection ~ 1400 3500
Text Label 2850 5200 0    60   ~ 0
bRESET#
Wire Wire Line
	900  5050 900  5300
Wire Wire Line
	900  5300 1400 5300
Wire Wire Line
	2800 5300 3700 5300
Wire Wire Line
	3700 5300 3700 7000
NoConn ~ 4900 3500
Text Label 4000 2600 0    60   ~ 0
bA0
Text Label 4000 2700 0    60   ~ 0
bA1
Wire Wire Line
	900  4900 900  5050
Connection ~ 900  5050
Wire Wire Line
	900  4900 1400 4900
Wire Wire Line
	900  5050 7300 5050
NoConn ~ 1400 5500
NoConn ~ 2800 5500
Text Label 6200 5500 1    60   ~ 0
688SEL#
$Comp
L 74xx:74LS688 U6
U 1 1 604A100F
P 6700 3500
F 0 "U6" H 6400 4550 50  0000 C CNN
F 1 "74LS688" H 6400 2450 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6700 3500 50  0001 C CNN
F 3 "" H 6700 3500 50  0001 C CNN
	1    6700 3500
	1    0    0    -1  
$EndComp
NoConn ~ 4300 3500
Wire Wire Line
	6050 8800 6500 8800
Connection ~ 1400 6100
NoConn ~ 5800 7150
NoConn ~ 5800 7050
NoConn ~ 5800 6950
NoConn ~ 5800 6850
Wire Wire Line
	5800 7150 6450 7150
Wire Wire Line
	5800 7050 6450 7050
Wire Wire Line
	5800 6950 6450 6950
Wire Wire Line
	5800 6850 6450 6850
Text Label 5850 7150 0    60   ~ 0
IEO
Text Label 5850 6850 0    60   ~ 0
BAI#
Text Label 5850 6950 0    60   ~ 0
BAO#
Text Label 5850 7050 0    60   ~ 0
IEI
$Comp
L Z80GDCA-rescue:CONN_4-conn-Z80KBDMSE2-rescue-Z80GDC-rescue P3
U 1 1 637504D4
P 6800 7000
F 0 "P3" V 6750 7000 60  0000 C CNN
F 1 "DAISY CHAIN" V 6950 7000 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6800 7000 60  0001 C CNN
F 3 "" H 6800 7000 60  0001 C CNN
	1    6800 7000
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:GND-00JRCsch-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR016
U 1 1 610CFA90
P 4600 7150
F 0 "#PWR016" H 4600 7150 30  0001 C CNN
F 1 "GND" H 4600 7080 30  0001 C CNN
F 2 "" H 4600 7150 60  0000 C CNN
F 3 "" H 4600 7150 60  0000 C CNN
	1    4600 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 7100 4850 7100
Connection ~ 4600 7100
Wire Wire Line
	4600 7100 4600 7150
Wire Wire Line
	4350 7100 4600 7100
$Comp
L mechanical:MountingHole_Pad H2
U 1 1 61081B3A
P 4850 7000
F 0 "H2" H 4950 7049 50  0000 L CNN
F 1 "BRACKET" H 4950 6958 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 4850 7000 50  0001 C CNN
F 3 "~" H 4850 7000 50  0001 C CNN
	1    4850 7000
	1    0    0    -1  
$EndComp
$Comp
L mechanical:MountingHole_Pad H1
U 1 1 637504D2
P 4350 7000
F 0 "H1" H 4450 7049 50  0000 L CNN
F 1 "BRACKET" H 4450 6958 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 4350 7000 50  0001 C CNN
F 3 "~" H 4350 7000 50  0001 C CNN
	1    4350 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 7000 3450 6950
Wire Wire Line
	3450 6650 3450 6600
Wire Wire Line
	5650 8400 5650 9200
Wire Wire Line
	5650 8100 5650 8050
Text Notes 3700 6850 1    60   ~ 0
IO CHIP SELECT
Wire Wire Line
	3700 7000 3450 7000
$Comp
L Z80GDCA-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR03
U 1 1 637504D1
P 3450 6100
F 0 "#PWR03" H 3450 6200 30  0001 C CNN
F 1 "VCC" H 3450 6200 30  0000 C CNN
F 2 "" H 3450 6100 60  0001 C CNN
F 3 "" H 3450 6100 60  0001 C CNN
	1    3450 6100
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue R12
U 1 1 6068F201
P 3450 6350
F 0 "R12" V 3530 6350 50  0000 C CNN
F 1 "470" V 3450 6350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3450 6350 60  0001 C CNN
F 3 "" H 3450 6350 60  0001 C CNN
	1    3450 6350
	-1   0    0    1   
$EndComp
$Comp
L device:LED D1
U 1 1 6068F1F7
P 3450 6800
F 0 "D1" H 3450 6900 50  0000 C CNN
F 1 "LED" H 3450 6700 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 3450 6800 60  0001 C CNN
F 3 "" H 3450 6800 60  0001 C CNN
	1    3450 6800
	0    -1   -1   0   
$EndComp
Connection ~ 3600 7950
Wire Wire Line
	3600 7550 3850 7550
Connection ~ 3600 7550
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C8
U 1 1 60B4CA7D
P 3600 7750
F 0 "C8" H 3650 7850 50  0000 L CNN
F 1 "0.1u" H 3650 7650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3600 7750 60  0001 C CNN
F 3 "" H 3600 7750 60  0001 C CNN
	1    3600 7750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 7950 3600 7950
Connection ~ 3350 7950
Wire Wire Line
	3350 7550 3600 7550
Connection ~ 3350 7550
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C7
U 1 1 637B9E5A
P 3350 7750
F 0 "C7" H 3400 7850 50  0000 L CNN
F 1 "0.1u" H 3400 7650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3350 7750 60  0001 C CNN
F 3 "" H 3350 7750 60  0001 C CNN
	1    3350 7750
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C6
U 1 1 637B9E50
P 3100 7750
F 0 "C6" H 3150 7850 50  0000 L CNN
F 1 "0.1u" H 3150 7650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3100 7750 60  0001 C CNN
F 3 "" H 3100 7750 60  0001 C CNN
	1    3100 7750
	1    0    0    -1  
$EndComp
Text Label 7400 2600 0    60   ~ 0
CS_GDC#
Connection ~ 7300 2600
Wire Wire Line
	3100 7950 3350 7950
Wire Wire Line
	3100 7550 3350 7550
Wire Wire Line
	800  6100 1400 6100
Text Label 8100 1150 0    60   ~ 0
bD0
Text Label 8100 1250 0    60   ~ 0
bD1
Text Label 8100 1750 0    60   ~ 0
bD6
Text Label 8100 1350 0    60   ~ 0
bD2
Text Label 8100 1450 0    60   ~ 0
bD3
Text Label 8100 1550 0    60   ~ 0
bD4
Text Label 8100 1650 0    60   ~ 0
bD5
Text Label 8100 1850 0    60   ~ 0
bD7
Text Label 8100 1950 0    60   ~ 0
bRESET#
Text Label 8100 2050 0    60   ~ 0
bRD#
Text Label 8100 2150 0    60   ~ 0
bWR#
Wire Wire Line
	2600 7950 2850 7950
Wire Wire Line
	2100 7950 2350 7950
Wire Wire Line
	1850 7950 2100 7950
Wire Wire Line
	2100 7550 2350 7550
Wire Wire Line
	2350 7550 2600 7550
Wire Wire Line
	2600 7550 2850 7550
Wire Wire Line
	2850 7550 3100 7550
Wire Wire Line
	2350 7950 2600 7950
Wire Wire Line
	4600 7950 4850 7950
Wire Wire Line
	4600 7550 4850 7550
Wire Wire Line
	2850 7950 3100 7950
Wire Wire Line
	1400 6100 1400 6200
Wire Wire Line
	7300 5050 7300 2600
Text Label 2850 5900 0    60   ~ 0
bRD#
Text Label 1100 6100 0    60   ~ 0
ZERO
Wire Wire Line
	6050 8700 6500 8700
Wire Wire Line
	6050 8600 6500 8600
Wire Wire Line
	6050 8500 6500 8500
Wire Wire Line
	6050 8400 6500 8400
Wire Wire Line
	6050 8300 6500 8300
Wire Wire Line
	6050 8200 6500 8200
Wire Wire Line
	6050 8100 6500 8100
Wire Wire Line
	6050 8000 6500 8000
Wire Wire Line
	6050 7900 6500 7900
Connection ~ 2600 7950
Connection ~ 2100 7950
Connection ~ 1850 7950
Connection ~ 2100 7550
Connection ~ 2350 7550
Connection ~ 2600 7550
Wire Wire Line
	1600 7950 1600 8650
Connection ~ 1600 7950
Connection ~ 4850 7550
Wire Wire Line
	2800 5900 3800 5900
Wire Wire Line
	7200 2600 7300 2600
Connection ~ 2850 7550
Connection ~ 2350 7950
Connection ~ 4600 7950
Connection ~ 4600 7550
Connection ~ 2850 7950
Wire Wire Line
	3100 7950 3100 8000
Connection ~ 3100 7950
Connection ~ 3100 7550
Connection ~ 3850 7550
Wire Wire Line
	1600 7950 1850 7950
Wire Wire Line
	1850 7550 2100 7550
Wire Wire Line
	1000 5900 1400 5900
Text Notes 1000 6500 0    60   ~ 0
Note: Buffers/Transceivers\nrespond to IO and MEM cycles
Text Notes 4300 6300 0    60   ~ 0
Note: Inhibit Board Operation\nDuring Interrupts\nM1# = low, IORQ# = low
Text Notes 6350 6000 0    60   ~ 0
Note: IO Address Ports $E2-$E3\nS1=off - A7 (high)\nS2=off - A6 (high)\nS3=off - A5 (high)\nS4=on - A4 (low)\nS5=on - A3 (low)\nS6=on - A2 (low)\nS7=off - A1 (high)\nS8=x - A0 (no effect)
$Comp
L Z80GDCA-rescue:GND-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR08
U 1 1 6044E58D
P 6700 4700
F 0 "#PWR08" H 6700 4700 30  0001 C CNN
F 1 "GND" H 6700 4630 30  0001 C CNN
F 2 "" H 6700 4700 60  0001 C CNN
F 3 "" H 6700 4700 60  0001 C CNN
	1    6700 4700
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR07
U 1 1 6044E13A
P 6700 2300
F 0 "#PWR07" H 6700 2400 30  0001 C CNN
F 1 "VCC" H 6700 2400 30  0000 C CNN
F 2 "" H 6700 2300 60  0001 C CNN
F 3 "" H 6700 2300 60  0001 C CNN
	1    6700 2300
	1    0    0    -1  
$EndComp
Text Label 6100 8300 0    60   ~ 0
SPARE4
Text Label 6100 8200 0    60   ~ 0
SPARE3
Text Label 6100 7900 0    60   ~ 0
SPARE0
Text Label 6100 8000 0    60   ~ 0
SPARE1
Text Label 6100 8100 0    60   ~ 0
SPARE2
Text Label 6100 8400 0    60   ~ 0
SPARE5
Text Label 6100 8500 0    60   ~ 0
SPARE6
Text Label 6100 8800 0    60   ~ 0
SPARE9
Text Label 6100 8700 0    60   ~ 0
SPARE8
Text Label 6100 8600 0    60   ~ 0
SPARE7
$Comp
L Z80GDCA-rescue:CONN_10-conn-Z80KBDMSE2-rescue-Z80GDC-rescue P1
U 1 1 637504CB
P 6850 8350
F 0 "P1" V 6800 8350 60  0000 C CNN
F 1 "SPARES" V 6900 8350 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 6850 8350 60  0001 C CNN
F 3 "" H 6850 8350 60  0001 C CNN
	1    6850 8350
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue R13
U 1 1 603A596D
P 5650 7800
F 0 "R13" V 5730 7800 50  0000 C CNN
F 1 "470" V 5650 7800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5650 7800 60  0001 C CNN
F 3 "" H 5650 7800 60  0001 C CNN
	1    5650 7800
	-1   0    0    1   
$EndComp
$Comp
L device:LED D2
U 1 1 603A5584
P 5650 8250
F 0 "D2" H 5650 8350 50  0000 C CNN
F 1 "LED" H 5650 8150 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5650 8250 60  0001 C CNN
F 3 "" H 5650 8250 60  0001 C CNN
	1    5650 8250
	0    -1   -1   0   
$EndComp
$Comp
L Z80GDCA-rescue:CP-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C11
U 1 1 603A3D80
P 4850 7750
F 0 "C11" H 4900 7850 50  0000 L CNN
F 1 "10u" H 4900 7650 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4850 7750 60  0001 C CNN
F 3 "" H 4850 7750 60  0001 C CNN
	1    4850 7750
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:CP-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C10
U 1 1 6039BD2A
P 4600 7750
F 0 "C10" H 4650 7850 50  0000 L CNN
F 1 "10u" H 4650 7650 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4600 7750 60  0001 C CNN
F 3 "" H 4600 7750 60  0001 C CNN
	1    4600 7750
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 603A949A
P 1600 7950
F 0 "#FLG01" H 1600 8045 30  0001 C CNN
F 1 "PWR_FLAG" H 1600 8130 30  0000 C CNN
F 2 "" H 1600 7950 60  0001 C CNN
F 3 "" H 1600 7950 60  0001 C CNN
	1    1600 7950
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 603A9456
P 3850 7550
F 0 "#FLG02" H 3850 7645 30  0001 C CNN
F 1 "PWR_FLAG" H 3850 7730 30  0000 C CNN
F 2 "" H 3850 7550 60  0001 C CNN
F 3 "" H 3850 7550 60  0001 C CNN
	1    3850 7550
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR01
U 1 1 603A9412
P 3100 7550
F 0 "#PWR01" H 3100 7650 30  0001 C CNN
F 1 "VCC" H 3100 7650 30  0000 C CNN
F 2 "" H 3100 7550 60  0001 C CNN
F 3 "" H 3100 7550 60  0001 C CNN
	1    3100 7550
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:GND-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR02
U 1 1 603A93CE
P 3100 8000
F 0 "#PWR02" H 3100 8000 30  0001 C CNN
F 1 "GND" H 3100 7930 30  0001 C CNN
F 2 "" H 3100 8000 60  0001 C CNN
F 3 "" H 3100 8000 60  0001 C CNN
	1    3100 8000
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C5
U 1 1 603A8FA5
P 2850 7750
F 0 "C5" H 2900 7850 50  0000 L CNN
F 1 "0.1u" H 2900 7650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2850 7750 60  0001 C CNN
F 3 "" H 2850 7750 60  0001 C CNN
	1    2850 7750
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C4
U 1 1 603A8F29
P 2600 7750
F 0 "C4" H 2650 7850 50  0000 L CNN
F 1 "0.1u" H 2650 7650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2600 7750 60  0001 C CNN
F 3 "" H 2600 7750 60  0001 C CNN
	1    2600 7750
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C3
U 1 1 603A8F23
P 2350 7750
F 0 "C3" H 2400 7850 50  0000 L CNN
F 1 "0.1u" H 2400 7650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2350 7750 60  0001 C CNN
F 3 "" H 2350 7750 60  0001 C CNN
	1    2350 7750
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C2
U 1 1 603A8ED5
P 2100 7750
F 0 "C2" H 2150 7850 50  0000 L CNN
F 1 "0.1u" H 2150 7650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2100 7750 60  0001 C CNN
F 3 "" H 2100 7750 60  0001 C CNN
	1    2100 7750
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C1
U 1 1 637504CA
P 1850 7750
F 0 "C1" H 1900 7850 50  0000 L CNN
F 1 "0.1u" H 1900 7650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1850 7750 60  0001 C CNN
F 3 "" H 1850 7750 60  0001 C CNN
	1    1850 7750
	1    0    0    -1  
$EndComp
Text Label 1100 5900 0    60   ~ 0
RD#
Text Label 6700 9350 0    60   ~ 0
ONE
Wire Wire Line
	2800 2600 4200 2600
$Comp
L Z80GDCA-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue R10
U 1 1 62191C56
P 6400 9350
F 0 "R10" V 6480 9350 50  0000 C CNN
F 1 "0" V 6400 9350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6400 9350 60  0001 C CNN
F 3 "" H 6400 9350 60  0001 C CNN
	1    6400 9350
	0    1    1    0   
$EndComp
$Comp
L Z80GDCA-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR010
U 1 1 621A0AE0
P 6150 9350
F 0 "#PWR010" H 6150 9450 30  0001 C CNN
F 1 "VCC" H 6150 9450 30  0000 C CNN
F 2 "" H 6150 9350 60  0001 C CNN
F 3 "" H 6150 9350 60  0001 C CNN
	1    6150 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 9350 7000 9350
$Comp
L Z80GDCA-rescue:GND-RESCUE-ColorVDU-ColorVDU-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR?
U 1 1 6244BBF7
P 6150 9800
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
F 0 "#PWR011" H 6150 9800 30  0001 C CNN
F 1 "GND" H 6150 9730 30  0001 C CNN
F 2 "" H 6150 9800 60  0001 C CNN
F 3 "" H 6150 9800 60  0001 C CNN
	1    6150 9800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 9700 6150 9800
Text Label 6700 9700 0    60   ~ 0
ZERO
$Comp
L Z80GDCA-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue R11
U 1 1 6259FFCF
P 6400 9700
F 0 "R11" V 6480 9700 50  0000 C CNN
F 1 "0" V 6400 9700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6400 9700 60  0001 C CNN
F 3 "" H 6400 9700 60  0001 C CNN
	1    6400 9700
	0    1    1    0   
$EndComp
Wire Wire Line
	6650 9700 7000 9700
Text Label 5000 10850 0    60   ~ 0
A9
Text Label 5000 10750 0    60   ~ 0
A10
Text Label 6300 10750 0    60   ~ 0
A11
Text Label 5000 10950 0    60   ~ 0
A8
Text Label 6300 10950 0    60   ~ 0
A13
Text Label 6300 11050 0    60   ~ 0
A14
Text Label 6300 11150 0    60   ~ 0
A15
Text Label 6300 10850 0    60   ~ 0
A12
Text Label 5000 11650 0    60   ~ 0
A1
Text Label 5000 11550 0    60   ~ 0
A2
Text Label 5000 11450 0    60   ~ 0
A3
Text Label 5000 11750 0    60   ~ 0
A0
Text Label 5000 11250 0    60   ~ 0
A5
Text Label 5000 11150 0    60   ~ 0
A6
Text Label 5000 11050 0    60   ~ 0
A7
Text Label 5000 11350 0    60   ~ 0
A4
Text Label 5000 11850 0    60   ~ 0
GND
Text Label 5000 11950 0    60   ~ 0
RFSH#
Text Label 6300 12450 0    60   ~ 0
HALT#
Text Label 5000 12450 0    60   ~ 0
BUSACK#
Text Label 5000 12050 0    60   ~ 0
M1#
Text Label 5000 12250 0    60   ~ 0
BUSRQ#
Text Label 6300 12350 0    60   ~ 0
NMI#
Text Label 6300 12250 0    60   ~ 0
INT#
Text Label 5000 12350 0    60   ~ 0
WAIT#
Text Label 5000 12150 0    60   ~ 0
RESET#
Text Label 6300 12550 0    60   ~ 0
MREQ#
Text Label 5000 12550 0    60   ~ 0
WR#
Text Label 5000 12650 0    60   ~ 0
RD#
Text Label 6300 12650 0    60   ~ 0
IORQ#
Text Label 6300 12150 0    60   ~ 0
D1
Text Label 6300 11850 0    60   ~ 0
D2
Text Label 6300 11450 0    60   ~ 0
D3
Text Label 6300 12050 0    60   ~ 0
D0
Text Label 6300 11550 0    60   ~ 0
D5
Text Label 6300 11650 0    60   ~ 0
D6
Text Label 6300 11950 0    60   ~ 0
D7
Text Label 6300 11350 0    60   ~ 0
D4
Text Label 6300 11750 0    60   ~ 0
VCC
Text Label 6300 11250 0    60   ~ 0
CLK
$Comp
L Z80GDCA-rescue:CONN_25X2-conn-Z80KBDMSE2-rescue-Z80GDC-rescue P2
U 1 1 6136A704
P 5800 11950
F 0 "P2" H 5800 13250 60  0000 C CNN
F 1 "Z80 BUS BACKPLANE" V 5800 11950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x25_P2.54mm_Horizontal" H 5800 11950 60  0001 C CNN
F 3 "" H 5800 11950 60  0001 C CNN
	1    5800 11950
	1    0    0    -1  
$EndComp
Text Label 6300 12950 0    60   ~ 0
SPARE2
Text Label 6300 12850 0    60   ~ 0
SPARE1
Text Label 6300 12750 0    60   ~ 0
SPARE0
Text Label 6300 13050 0    60   ~ 0
SPARE3
Text Label 6300 13150 0    60   ~ 0
SPARE4
Text Label 5000 12950 0    60   ~ 0
SPARE7
Text Label 5000 12850 0    60   ~ 0
SPARE8
Text Label 5000 12750 0    60   ~ 0
SPARE9
Text Label 5000 13050 0    60   ~ 0
SPARE6
Text Label 5000 13150 0    60   ~ 0
SPARE5
Text Notes 4850 10550 0    60   ~ 0
Note: Bus connector is mirror image of Z80\nCPU pin out to mate to backplane whose\nconnectors reflect Z80 CPU pin out.
NoConn ~ 4900 10750
NoConn ~ 4900 10850
NoConn ~ 4900 10950
NoConn ~ 6700 10750
NoConn ~ 6700 10850
NoConn ~ 6700 10950
NoConn ~ 6700 11050
NoConn ~ 6700 11150
NoConn ~ 4900 11950
NoConn ~ 4900 12250
NoConn ~ 4900 12450
NoConn ~ 4900 12350
Wire Wire Line
	4900 10950 5400 10950
Wire Wire Line
	4900 10850 5400 10850
Wire Wire Line
	4900 10750 5400 10750
Wire Wire Line
	6200 10750 6700 10750
Wire Wire Line
	6200 10850 6700 10850
Wire Wire Line
	6200 10950 6700 10950
Wire Wire Line
	6200 11050 6700 11050
Wire Wire Line
	6200 11150 6700 11150
Wire Wire Line
	4900 11750 5400 11750
Wire Wire Line
	4900 11650 5400 11650
Wire Wire Line
	4900 11550 5400 11550
Wire Wire Line
	4900 11450 5400 11450
Wire Wire Line
	4900 11350 5400 11350
Wire Wire Line
	4900 11250 5400 11250
Wire Wire Line
	4900 11150 5400 11150
Wire Wire Line
	4900 11050 5400 11050
Wire Wire Line
	4900 11850 5400 11850
Wire Wire Line
	4900 12050 5400 12050
Wire Wire Line
	4900 11950 5400 11950
Wire Wire Line
	6200 12450 6700 12450
Wire Wire Line
	4900 12450 5400 12450
Wire Wire Line
	4900 12150 5400 12150
Wire Wire Line
	4900 12350 5400 12350
Wire Wire Line
	4900 12250 5400 12250
Wire Wire Line
	6200 12650 6700 12650
Wire Wire Line
	6200 12550 6700 12550
Wire Wire Line
	4900 12550 5400 12550
Wire Wire Line
	4900 12650 5400 12650
Wire Wire Line
	6200 12050 6700 12050
Wire Wire Line
	6200 12150 6700 12150
Wire Wire Line
	6200 11850 6700 11850
Wire Wire Line
	6200 11450 6700 11450
Wire Wire Line
	6200 11350 6700 11350
Wire Wire Line
	6200 11550 6700 11550
Wire Wire Line
	6200 11650 6700 11650
Wire Wire Line
	6200 11950 6700 11950
Wire Wire Line
	6200 11750 6700 11750
Wire Wire Line
	6200 11250 6700 11250
Wire Wire Line
	4900 12850 5400 12850
Wire Wire Line
	4900 12750 5400 12750
Wire Wire Line
	6200 12750 6700 12750
Wire Wire Line
	4900 13050 5400 13050
Wire Wire Line
	4900 12950 5400 12950
Wire Wire Line
	6200 13050 6700 13050
Wire Wire Line
	6200 12950 6700 12950
Wire Wire Line
	6200 12850 6700 12850
Wire Wire Line
	4900 13150 5400 13150
Wire Wire Line
	6200 13150 6700 13150
NoConn ~ 6700 12550
NoConn ~ 6700 11250
NoConn ~ 6700 12450
Wire Wire Line
	6200 12350 6700 12350
Wire Wire Line
	6200 12250 6700 12250
Wire Wire Line
	6200 2600 6100 2600
Wire Wire Line
	4300 3600 4300 3700
Connection ~ 4300 3800
Connection ~ 4300 3700
Wire Wire Line
	4300 3700 4300 3800
Wire Wire Line
	4900 3700 5500 3700
Connection ~ 5500 3700
Wire Wire Line
	4900 3600 5600 3600
Connection ~ 5600 3600
Wire Wire Line
	2800 2800 6200 2800
Wire Wire Line
	2800 2700 6200 2700
Wire Wire Line
	2800 5600 6200 5600
Wire Wire Line
	6100 5700 6100 2600
Wire Wire Line
	2800 5700 6100 5700
Wire Wire Line
	3600 7950 3850 7950
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C9
U 1 1 63030E18
P 3850 7750
F 0 "C9" H 3900 7850 50  0000 L CNN
F 1 "0.1u" H 3900 7650 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3850 7750 60  0001 C CNN
F 3 "" H 3850 7750 60  0001 C CNN
	1    3850 7750
	1    0    0    -1  
$EndComp
Connection ~ 3850 7950
Wire Wire Line
	3850 7950 4600 7950
$Comp
L Z80GDCA-rescue:uPD7220-updgfx_r0-rescue U5
U 1 1 59D2C4D1
P 11850 900
F 0 "U5" H 11850 -500 60  0000 C CNN
F 1 "uPD7220" H 11800 -650 60  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 11850 900 60  0001 C CNN
F 3 "" H 11850 900 60  0001 C CNN
	1    11850 900 
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS32-74xx1 U17
U 2 1 59D2D2EA
P 9800 1400
F 0 "U17" H 9800 1450 50  0000 C CNN
F 1 "74LS32" H 9800 1350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9800 1400 50  0001 C CNN
F 3 "" H 9800 1400 50  0000 C CNN
	2    9800 1400
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS32-74xx1 U17
U 3 1 59D2D33F
P 9800 1900
F 0 "U17" H 9800 1950 50  0000 C CNN
F 1 "74LS32" H 9800 1850 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9800 1900 50  0001 C CNN
F 3 "" H 9800 1900 50  0000 C CNN
	3    9800 1900
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS32-74xx1 U17
U 4 1 59D2D380
P 16600 9700
F 0 "U17" H 16600 9750 50  0000 C CNN
F 1 "74LS32" H 16600 9650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 16600 9700 50  0001 C CNN
F 3 "" H 16600 9700 50  0000 C CNN
	4    16600 9700
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS32-74xx1 U17
U 1 1 59D2D3D9
P 9600 3300
F 0 "U17" H 9600 3350 50  0000 C CNN
F 1 "74LS32" H 9600 3250 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9600 3300 50  0001 C CNN
F 3 "" H 9600 3300 50  0000 C CNN
	1    9600 3300
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:R_Small-updgfx_r0-rescue R1
U 1 1 59D2D97D
P 10400 2200
F 0 "R1" V 10500 2150 50  0000 L CNN
F 1 "10k" V 10300 2150 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 10400 2200 50  0001 C CNN
F 3 "" H 10400 2200 50  0000 C CNN
	1    10400 2200
	0    1    1    0   
$EndComp
NoConn ~ 11200 3200
$Comp
L Z80GDCA-rescue:GND-updgfx_r0-rescue #PWR0107
U 1 1 59D34757
P 9250 5300
F 0 "#PWR0107" H 9250 5050 50  0001 C CNN
F 1 "GND" H 9250 5150 50  0000 C CNN
F 2 "" H 9250 5300 50  0000 C CNN
F 3 "" H 9250 5300 50  0000 C CNN
	1    9250 5300
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS74-74xx1 U4
U 1 1 59D348B4
P 9600 6500
F 0 "U4" H 9750 6800 50  0000 C CNN
F 1 "74LS74" H 9900 6205 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9600 6500 50  0001 C CNN
F 3 "" H 9600 6500 50  0000 C CNN
	1    9600 6500
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS74-74xx1 U4
U 2 1 59D34A15
P 9600 8000
F 0 "U4" H 9750 8300 50  0000 C CNN
F 1 "74LS74" H 9900 7705 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9600 8000 50  0001 C CNN
F 3 "" H 9600 8000 50  0000 C CNN
	2    9600 8000
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS04-74xx1 U18
U 3 1 59D360F7
P 10100 11000
F 0 "U18" H 10295 11115 50  0000 C CNN
F 1 "74LS04" H 10290 10875 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10100 11000 50  0001 C CNN
F 3 "" H 10100 11000 50  0000 C CNN
	3    10100 11000
	-1   0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS04-74xx1 U18
U 1 1 59D361A6
P 3300 11000
F 0 "U18" H 3495 11115 50  0000 C CNN
F 1 "74LS04" H 3490 10875 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3300 11000 50  0001 C CNN
F 3 "" H 3300 11000 50  0000 C CNN
	1    3300 11000
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS04-74xx1 U18
U 6 1 59D36304
P 13850 1550
F 0 "U18" H 14045 1665 50  0000 C CNN
F 1 "74LS04" H 14040 1425 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 13850 1550 50  0001 C CNN
F 3 "" H 13850 1550 50  0000 C CNN
	6    13850 1550
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS04-74xx1 U18
U 2 1 59D363A4
P 9750 2800
F 0 "U18" H 9945 2915 50  0000 C CNN
F 1 "74LS04" H 9940 2675 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9750 2800 50  0001 C CNN
F 3 "" H 9750 2800 50  0000 C CNN
	2    9750 2800
	-1   0    0    1   
$EndComp
$Comp
L Z80GDCA-rescue:7400-74xx1 U19
U 2 1 59D3745B
P 12450 7800
F 0 "U19" H 12450 7850 50  0000 C CNN
F 1 "74LS00" H 12450 7700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12450 7800 50  0001 C CNN
F 3 "" H 12450 7800 50  0000 C CNN
	2    12450 7800
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:7400-74xx1 U19
U 3 1 59D376A8
P 16600 7900
F 0 "U19" H 16600 7950 50  0000 C CNN
F 1 "74LS00" H 16600 7800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 16600 7900 50  0001 C CNN
F 3 "" H 16600 7900 50  0000 C CNN
	3    16600 7900
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS74-74xx1 U20
U 1 1 59D38613
P 12400 10100
F 0 "U20" H 12550 10400 50  0000 C CNN
F 1 "74LS74" H 12700 9805 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12400 10100 50  0001 C CNN
F 3 "" H 12400 10100 50  0000 C CNN
	1    12400 10100
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS74-74xx1 U20
U 2 1 59D3889B
P 14200 10100
F 0 "U20" H 14350 10400 50  0000 C CNN
F 1 "74LS74" H 14500 9805 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 14200 10100 50  0001 C CNN
F 3 "" H 14200 10100 50  0000 C CNN
	2    14200 10100
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:7400-74xx1 U19
U 4 1 59D42F5C
P 16600 10400
F 0 "U19" H 16600 10450 50  0000 C CNN
F 1 "74LS00" H 16600 10300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 16600 10400 50  0001 C CNN
F 3 "" H 16600 10400 50  0000 C CNN
	4    16600 10400
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:7400-74xx1 U19
U 1 1 59D42FEF
P 2100 11000
F 0 "U19" H 2100 11050 50  0000 C CNN
F 1 "74LS00" H 2100 10900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2100 11000 50  0001 C CNN
F 3 "" H 2100 11000 50  0000 C CNN
	1    2100 11000
	1    0    0    -1  
$EndComp
NoConn ~ 13000 10300
NoConn ~ 14800 9900
Text Label 12650 1200 2    60   ~ 0
HS
Text Label 12650 1300 2    60   ~ 0
VS
Text Label 12800 1400 2    60   ~ 0
BLANK
$Comp
L Z80GDCA-rescue:74LS195-74xx1 U13
U 1 1 59D4F099
P 16350 1500
F 0 "U13" H 16350 1600 50  0000 C CNN
F 1 "74LS195" H 16350 1400 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 16350 1500 50  0001 C CNN
F 3 "" H 16350 1500 50  0000 C CNN
	1    16350 1500
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS195-74xx1 U14
U 1 1 59D4F1EE
P 16350 2550
F 0 "U14" H 16350 2650 50  0000 C CNN
F 1 "74LS195" H 16350 2450 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 16350 2550 50  0001 C CNN
F 3 "" H 16350 2550 50  0000 C CNN
	1    16350 2550
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:74LS195-74xx1 U16
U 1 1 59D4F30C
P 16350 4650
F 0 "U16" H 16350 4750 50  0000 C CNN
F 1 "74LS195" H 16350 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 16350 4650 50  0001 C CNN
F 3 "" H 16350 4650 50  0000 C CNN
	1    16350 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 1100 11200 1100
Wire Wire Line
	10750 2100 11200 2100
Wire Wire Line
	8800 2000 9200 2000
Wire Wire Line
	10500 2200 11200 2200
Wire Wire Line
	10200 6700 10250 6700
Wire Wire Line
	10250 6700 10250 6150
Wire Wire Line
	10250 6150 9000 6150
Wire Wire Line
	9000 6150 9000 6300
Wire Wire Line
	10650 1000 11200 1000
Wire Wire Line
	8950 6500 9000 6500
Wire Wire Line
	9600 7050 9600 7100
Wire Wire Line
	10200 8200 10300 8200
Wire Wire Line
	10300 8200 10300 7350
Wire Wire Line
	10300 7350 9000 7350
Wire Wire Line
	9000 7350 9000 7800
Wire Wire Line
	9000 8000 8950 8000
Wire Wire Line
	11850 7900 11800 7900
Wire Wire Line
	11800 5250 11800 7900
Connection ~ 9600 7100
Wire Wire Line
	11800 5250 13050 5250
Wire Wire Line
	13050 5250 13050 1000
Wire Wire Line
	13050 1000 12500 1000
Wire Wire Line
	13600 9900 13000 9900
Connection ~ 11800 7900
Wire Wire Line
	13600 10750 13600 10100
Connection ~ 13600 10750
Wire Wire Line
	17850 10400 17200 10400
Wire Wire Line
	17850 9700 17200 9700
Wire Wire Line
	16000 9600 15100 9600
Wire Wire Line
	15100 4700 15650 4700
Wire Wire Line
	15100 3650 15650 3650
Wire Wire Line
	15100 2600 15650 2600
Wire Wire Line
	15100 1550 15650 1550
Wire Wire Line
	15650 1450 15150 1450
Wire Wire Line
	15150 1650 15650 1650
Wire Wire Line
	15150 2500 15650 2500
Wire Wire Line
	15150 2700 15650 2700
Wire Wire Line
	15150 3550 15650 3550
Wire Wire Line
	15150 3750 15650 3750
Wire Wire Line
	15150 4600 15650 4600
Wire Wire Line
	15150 4800 15650 4800
Wire Wire Line
	15650 4950 15100 4950
Wire Wire Line
	15100 3900 15650 3900
Wire Wire Line
	15100 2850 15650 2850
Wire Wire Line
	15100 1800 15650 1800
Wire Wire Line
	15650 1900 15250 1900
Wire Wire Line
	15250 2950 15650 2950
Wire Wire Line
	15250 4000 15650 4000
Wire Wire Line
	15250 5050 15650 5050
$Comp
L Z80GDCA-rescue:R_Small-updgfx_r0-rescue R2
U 1 1 59D53643
P 17300 1300
F 0 "R2" V 17400 1250 50  0000 L CNN
F 1 "1k" V 17200 1250 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 17300 1300 50  0001 C CNN
F 3 "" H 17300 1300 50  0000 C CNN
	1    17300 1300
	0    1    1    0   
$EndComp
$Comp
L Z80GDCA-rescue:R_Small-updgfx_r0-rescue R3
U 1 1 59D536FC
P 17300 2350
F 0 "R3" V 17400 2300 50  0000 L CNN
F 1 "1k" V 17200 2300 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 17300 2350 50  0001 C CNN
F 3 "" H 17300 2350 50  0000 C CNN
	1    17300 2350
	0    1    1    0   
$EndComp
$Comp
L Z80GDCA-rescue:R_Small-updgfx_r0-rescue R5
U 1 1 59D537DE
P 17300 4450
F 0 "R5" V 17400 4400 50  0000 L CNN
F 1 "820" V 17200 4350 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 17300 4450 50  0001 C CNN
F 3 "" H 17300 4450 50  0000 C CNN
	1    17300 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	18500 2400 18500 2350
$Comp
L Z80GDCA-rescue:VGA-updgfx_r0-rescue J1
U 1 1 59D552D4
P 20500 1750
F 0 "J1" H 20250 2550 60  0000 C CNN
F 1 "VGA" H 20500 1000 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Horizontal" H 20500 1750 60  0001 C CNN
F 3 "" H 20500 1750 60  0001 C CNN
	1    20500 1750
	0    -1   1    0   
$EndComp
Wire Wire Line
	20950 1050 20950 1150
Wire Wire Line
	19550 1050 20050 1050
Wire Wire Line
	20750 1050 20750 1150
Wire Wire Line
	20550 1050 20550 1150
Connection ~ 20750 1050
Wire Wire Line
	20150 1050 20150 1150
Connection ~ 20550 1050
Wire Wire Line
	20050 1150 20050 1050
Connection ~ 20150 1050
Wire Wire Line
	20450 1150 20450 1000
Wire Wire Line
	20450 1000 19150 1000
Wire Wire Line
	20650 950  20650 1150
Wire Wire Line
	20850 1150 20850 900 
Wire Wire Line
	20850 900  18850 900 
NoConn ~ 20250 1150
NoConn ~ 20350 1150
NoConn ~ 20050 2350
NoConn ~ 20650 2350
NoConn ~ 20850 2350
Connection ~ 20050 1050
Text Label 15400 1000 0    60   ~ 0
AD0
Text Label 15400 1100 0    60   ~ 0
AD1
Text Label 15400 1200 0    60   ~ 0
AD2
Text Label 15400 1300 0    60   ~ 0
AD3
Text Label 15400 2050 0    60   ~ 0
AD4
Text Label 15400 2150 0    60   ~ 0
AD5
Text Label 15400 2250 0    60   ~ 0
AD6
Text Label 15400 2350 0    60   ~ 0
AD7
Text Label 15400 3100 0    60   ~ 0
AD8
Text Label 15400 3200 0    60   ~ 0
AD9
Text Label 15400 3300 0    60   ~ 0
AD10
Text Label 15400 3400 0    60   ~ 0
AD11
Text Label 15400 4150 0    60   ~ 0
AD12
Text Label 15400 4250 0    60   ~ 0
AD13
Text Label 15400 4350 0    60   ~ 0
AD14
Text Label 15400 4450 0    60   ~ 0
AD15
NoConn ~ 17050 1100
NoConn ~ 17050 1200
NoConn ~ 17050 1400
NoConn ~ 17050 2150
NoConn ~ 17050 2250
NoConn ~ 17050 2050
NoConn ~ 17050 2450
NoConn ~ 17050 3200
NoConn ~ 17050 3300
NoConn ~ 17050 3500
NoConn ~ 17050 4250
NoConn ~ 17050 4350
NoConn ~ 17050 4550
NoConn ~ 1500 10900
NoConn ~ 1500 11100
NoConn ~ 2700 11000
NoConn ~ 3750 11000
NoConn ~ 2850 11000
Wire Wire Line
	12500 1100 13000 1100
Text Notes 17600 5350 0    120  ~ 0
Based On\nuPD7220 Graphics V2\nBy Dylan Brophy (NTI)\nHackaday.IO
Wire Wire Line
	9600 7100 9600 7450
Wire Wire Line
	11800 7900 11800 9900
Wire Wire Line
	20750 1050 20950 1050
Wire Wire Line
	20550 1050 20750 1050
Wire Wire Line
	20150 1050 20550 1050
Wire Wire Line
	20050 1050 20150 1050
Text Notes 2400 10600 0    50   ~ 0
Spare Components
Text Label 10950 1100 0    50   ~ 0
bA0
Text Label 10950 1200 0    50   ~ 0
bD0
Text Label 10950 1300 0    50   ~ 0
bD1
Text Label 10950 1400 0    50   ~ 0
bD2
Text Label 10950 1500 0    50   ~ 0
bD3
Text Label 10950 1600 0    50   ~ 0
bD4
Text Label 10950 1700 0    50   ~ 0
bD5
Text Label 10950 1800 0    50   ~ 0
bD6
Text Label 10950 1900 0    50   ~ 0
bD7
Text Label 8850 1300 0    50   ~ 0
bRD#
Text Label 8850 2000 0    50   ~ 0
bWR#
Wire Wire Line
	10900 1200 11200 1200
Wire Wire Line
	10900 1300 11200 1300
Wire Wire Line
	10900 1400 11200 1400
Wire Wire Line
	10900 1500 11200 1500
Wire Wire Line
	10900 1600 11200 1600
Wire Wire Line
	10900 1700 11200 1700
Wire Wire Line
	10900 1800 11200 1800
Wire Wire Line
	10900 1900 11200 1900
Wire Wire Line
	1600 9200 5650 9200
Wire Wire Line
	4850 7550 5650 7550
NoConn ~ 6700 12250
NoConn ~ 6700 12350
NoConn ~ 8600 1950
$Comp
L Oscillator:CXO_DIP8 X1
U 1 1 64EAFD16
P 9250 5000
F 0 "X1" H 9594 5046 50  0000 L CNN
F 1 "CXO_DIP8" H 9594 4955 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-8" H 9700 4650 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 9150 5000 50  0001 C CNN
	1    9250 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 5300 8950 5300
Wire Wire Line
	8950 5300 8950 5000
Connection ~ 9250 5300
Wire Wire Line
	9550 5000 10050 5000
Wire Wire Line
	13600 10750 15100 10750
Wire Wire Line
	15100 9400 15100 9600
Wire Wire Line
	13300 9550 13300 10650
Connection ~ 13300 9550
Wire Wire Line
	13300 9550 14200 9550
Connection ~ 13300 10650
Wire Wire Line
	13300 10650 14200 10650
Wire Wire Line
	12400 9550 13300 9550
Wire Wire Line
	12400 10650 13300 10650
Wire Wire Line
	13000 9400 13150 9400
Wire Wire Line
	13000 1100 13000 9400
Wire Wire Line
	10550 11000 13150 11000
Wire Wire Line
	13150 11000 13150 9400
Connection ~ 13150 9400
Wire Wire Line
	13150 9400 15100 9400
Wire Wire Line
	9650 11000 9600 11000
Wire Wire Line
	9600 11000 9600 8550
Wire Wire Line
	8800 1300 9200 1300
Wire Wire Line
	10650 4700 11550 4700
Wire Wire Line
	10650 1000 10650 4700
$Comp
L Z80GDCA-rescue:74LS04-74xx1 U18
U 4 1 59D36359
P 13850 1900
F 0 "U18" H 14045 2015 50  0000 C CNN
F 1 "74LS04" H 14040 1775 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 13850 1900 50  0001 C CNN
F 3 "" H 13850 1900 50  0000 C CNN
	4    13850 1900
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:GND-updgfx_r0-rescue #PWR0102
U 1 1 59D2D855
P 11850 3450
F 0 "#PWR0102" H 11850 3200 50  0001 C CNN
F 1 "GND" H 11850 3300 50  0000 C CNN
F 2 "" H 11850 3450 50  0000 C CNN
F 3 "" H 11850 3450 50  0000 C CNN
	1    11850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	15350 1300 15650 1300
Wire Wire Line
	15350 2050 15650 2050
Wire Wire Line
	15350 2150 15650 2150
Wire Wire Line
	15350 2250 15650 2250
Wire Wire Line
	15350 2350 15650 2350
Wire Wire Line
	15350 1000 15650 1000
Wire Wire Line
	15350 1100 15650 1100
Wire Wire Line
	15350 1200 15650 1200
Wire Wire Line
	15350 3400 15650 3400
Wire Wire Line
	15350 4150 15650 4150
Wire Wire Line
	15350 4250 15650 4250
Wire Wire Line
	15350 4350 15650 4350
Wire Wire Line
	15350 4450 15650 4450
Wire Wire Line
	15350 3100 15650 3100
Wire Wire Line
	15350 3200 15650 3200
Wire Wire Line
	15350 3300 15650 3300
Wire Wire Line
	17050 4450 17200 4450
$Comp
L Z80GDCA-rescue:R_Small-updgfx_r0-rescue R4
U 1 1 59D53771
P 17300 3400
F 0 "R4" V 17400 3350 50  0000 L CNN
F 1 "1k" V 17200 3350 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 17300 3400 50  0001 C CNN
F 3 "" H 17300 3400 50  0000 C CNN
	1    17300 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	17050 3400 17200 3400
Wire Wire Line
	17050 2350 17200 2350
Wire Wire Line
	17050 1300 17200 1300
Wire Wire Line
	17400 1300 18850 1300
Wire Wire Line
	20250 2750 20250 2350
$Comp
L Z80GDCA-rescue:74LS04-74xx1 U18
U 5 1 59D362A1
P 13850 1200
F 0 "U18" H 14045 1315 50  0000 C CNN
F 1 "74LS04" H 14040 1075 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 13850 1200 50  0001 C CNN
F 3 "" H 13850 1200 50  0000 C CNN
	5    13850 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	20450 2750 20450 2350
Wire Wire Line
	8950 7200 8950 8000
Wire Wire Line
	8950 7200 11550 7200
Wire Wire Line
	10400 5950 10400 7100
Wire Wire Line
	9600 5950 10400 5950
Wire Wire Line
	9600 7100 10400 7100
Wire Wire Line
	8950 5750 8950 6500
Wire Wire Line
	10400 1900 10750 1900
Wire Wire Line
	10750 2100 10750 1900
Text Label 8850 1800 0    50   ~ 0
CS_GDC#
Text Label 12550 1100 0    60   ~ 0
ALE
Text Label 12550 1000 0    60   ~ 0
DBIN#
Text Label 10950 1000 0    60   ~ 0
CKx2
Text Label 20250 2650 1    60   ~ 0
VS#
Text Label 20450 2650 1    60   ~ 0
HS#
Text Label 17450 1300 0    60   ~ 0
RED
Text Label 17450 2350 0    60   ~ 0
GREEN
Text Label 17450 3400 0    60   ~ 0
BLUE
Text Label 17550 4450 0    60   ~ 0
INTENSITY
Wire Wire Line
	18150 3450 18150 3400
Text Label 9050 5750 0    60   ~ 0
PIXELCLK
Text Notes 9500 4800 0    60   ~ 0
8 MHz OR GREATER\nPIXEL CLOCK
Text Label 17300 10400 0    60   ~ 0
VRAM_WR#
Text Label 17300 9700 0    60   ~ 0
VRAM_RD#
Text Label 10450 7800 0    60   ~ 0
CKx4
Text Label 10450 6300 0    60   ~ 0
CKx2
Text Label 11800 10750 0    60   ~ 0
CKx2
Text Label 13350 9400 0    60   ~ 0
ALE
Text Label 11800 9250 1    60   ~ 0
DBIN#
Text Label 9600 9800 1    60   ~ 0
ALE#
Text Label 17250 7900 0    60   ~ 0
PAR_LOAD#
Wire Wire Line
	10950 7800 10200 7800
Wire Wire Line
	11550 10750 11550 10100
Connection ~ 11550 7200
Wire Wire Line
	11550 7200 11550 6300
Wire Wire Line
	11850 7700 11550 7700
Connection ~ 11550 7700
Wire Wire Line
	11550 7700 11550 7200
Connection ~ 11550 10100
Wire Wire Line
	11550 10100 11550 7700
Wire Wire Line
	11550 10100 11800 10100
Wire Wire Line
	11550 10750 13600 10750
Text Label 15300 10500 0    60   ~ 0
CKx2
Text Label 15350 9600 0    60   ~ 0
ALE
Text Label 10450 7200 0    60   ~ 0
CKx2
Text Label 15700 8000 0    60   ~ 0
CKx4
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C18
U 1 1 6A02D6EB
P 3350 8450
F 0 "C18" H 3400 8550 50  0000 L CNN
F 1 "0.1u" H 3400 8350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3350 8450 60  0001 C CNN
F 3 "" H 3350 8450 60  0001 C CNN
	1    3350 8450
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C17
U 1 1 6A02D6F5
P 3100 8450
F 0 "C17" H 3150 8550 50  0000 L CNN
F 1 "0.1u" H 3150 8350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3100 8450 60  0001 C CNN
F 3 "" H 3100 8450 60  0001 C CNN
	1    3100 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 8650 3350 8650
Wire Wire Line
	3100 8250 3350 8250
Wire Wire Line
	2600 8650 2850 8650
Wire Wire Line
	2100 8650 2350 8650
Wire Wire Line
	1850 8650 2100 8650
Wire Wire Line
	2100 8250 2350 8250
Wire Wire Line
	2350 8250 2600 8250
Wire Wire Line
	2600 8250 2850 8250
Wire Wire Line
	2850 8250 3100 8250
Wire Wire Line
	2350 8650 2600 8650
Wire Wire Line
	2850 8650 3100 8650
Connection ~ 2600 8650
Connection ~ 2100 8650
Connection ~ 1850 8650
Connection ~ 2100 8250
Connection ~ 2350 8250
Connection ~ 2600 8250
Connection ~ 2850 8250
Connection ~ 2350 8650
Connection ~ 2850 8650
Wire Wire Line
	3100 8650 3100 8700
Connection ~ 3100 8650
Connection ~ 3100 8250
Wire Wire Line
	1600 8650 1850 8650
Wire Wire Line
	1850 8250 2100 8250
$Comp
L Z80GDCA-rescue:GND-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR09
U 1 1 6A02D72D
P 3100 8700
F 0 "#PWR09" H 3100 8700 30  0001 C CNN
F 1 "GND" H 3100 8630 30  0001 C CNN
F 2 "" H 3100 8700 60  0001 C CNN
F 3 "" H 3100 8700 60  0001 C CNN
	1    3100 8700
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C16
U 1 1 6A02D737
P 2850 8450
F 0 "C16" H 2900 8550 50  0000 L CNN
F 1 "0.1u" H 2900 8350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2850 8450 60  0001 C CNN
F 3 "" H 2850 8450 60  0001 C CNN
	1    2850 8450
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C15
U 1 1 6A02D741
P 2600 8450
F 0 "C15" H 2650 8550 50  0000 L CNN
F 1 "0.1u" H 2650 8350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2600 8450 60  0001 C CNN
F 3 "" H 2600 8450 60  0001 C CNN
	1    2600 8450
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C14
U 1 1 6A02D74B
P 2350 8450
F 0 "C14" H 2400 8550 50  0000 L CNN
F 1 "0.1u" H 2400 8350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2350 8450 60  0001 C CNN
F 3 "" H 2350 8450 60  0001 C CNN
	1    2350 8450
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C13
U 1 1 6A02D755
P 2100 8450
F 0 "C13" H 2150 8550 50  0000 L CNN
F 1 "0.1u" H 2150 8350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2100 8450 60  0001 C CNN
F 3 "" H 2100 8450 60  0001 C CNN
	1    2100 8450
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C12
U 1 1 6A02D75F
P 1850 8450
F 0 "C12" H 1900 8550 50  0000 L CNN
F 1 "0.1u" H 1900 8350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1850 8450 60  0001 C CNN
F 3 "" H 1850 8450 60  0001 C CNN
	1    1850 8450
	1    0    0    -1  
$EndComp
Connection ~ 1600 8650
Wire Wire Line
	1600 8650 1600 9200
Wire Wire Line
	3850 7550 4600 7550
$Comp
L Z80GDCA-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR0105
U 1 1 6A17FC73
P 3100 8250
F 0 "#PWR0105" H 3100 8350 30  0001 C CNN
F 1 "VCC" H 3100 8350 30  0000 C CNN
F 2 "" H 3100 8250 60  0001 C CNN
F 3 "" H 3100 8250 60  0001 C CNN
	1    3100 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	12500 1700 12800 1700
Wire Wire Line
	12500 1600 12800 1600
Wire Wire Line
	12500 1500 12800 1500
Wire Wire Line
	12500 1800 12800 1800
Wire Wire Line
	12500 2100 12800 2100
Wire Wire Line
	12500 2000 12800 2000
Wire Wire Line
	12500 1900 12800 1900
Wire Wire Line
	12500 2200 12800 2200
Text Label 12750 1500 2    60   ~ 0
AD0
Text Label 12750 1600 2    60   ~ 0
AD1
Text Label 12750 1700 2    60   ~ 0
AD2
Text Label 12750 1800 2    60   ~ 0
AD3
Text Label 12750 1900 2    60   ~ 0
AD4
Text Label 12750 2000 2    60   ~ 0
AD5
Text Label 12750 2100 2    60   ~ 0
AD6
Text Label 12750 2200 2    60   ~ 0
AD7
Text Label 12750 2300 2    60   ~ 0
AD8
Text Label 12750 2400 2    60   ~ 0
AD9
Text Label 12750 2500 2    60   ~ 0
AD10
Text Label 12750 2600 2    60   ~ 0
AD11
Text Label 12750 2700 2    60   ~ 0
AD12
Text Label 12750 2800 2    60   ~ 0
AD13
Text Label 12750 2900 2    60   ~ 0
AD14
Text Label 12750 3000 2    60   ~ 0
AD15
Wire Wire Line
	12500 2600 12800 2600
Wire Wire Line
	12500 2700 12800 2700
Wire Wire Line
	12500 2800 12800 2800
Wire Wire Line
	12500 2900 12800 2900
Wire Wire Line
	12500 3000 12800 3000
Wire Wire Line
	12500 2300 12800 2300
Wire Wire Line
	12500 2400 12800 2400
Wire Wire Line
	12500 2500 12800 2500
Text Label 12750 3100 2    60   ~ 0
A16
Text Label 12750 3200 2    60   ~ 0
A17
Wire Wire Line
	12500 3100 12800 3100
Wire Wire Line
	12500 3200 12800 3200
Wire Wire Line
	17200 7900 17850 7900
Wire Wire Line
	10200 6300 11550 6300
Connection ~ 11550 6300
Wire Wire Line
	11550 4700 11550 6300
Text Label 10850 11000 0    60   ~ 0
ALE
$Comp
L diode:1N4148 D4
U 1 1 6CD323D2
P 18500 2550
F 0 "D4" V 18400 2600 50  0000 L CNN
F 1 "1N4148" H 18350 2450 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 18500 2375 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 18500 2550 50  0001 C CNN
	1    18500 2550
	0    1    1    0   
$EndComp
$Comp
L diode:1N4148 D3
U 1 1 6CD37D05
P 18150 3600
F 0 "D3" V 18050 3650 50  0000 L CNN
F 1 "1N4148" H 18000 3500 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 18150 3425 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 18150 3600 50  0001 C CNN
	1    18150 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	17400 4450 18150 4450
$Comp
L diode:1N4148 D5
U 1 1 6CD383FD
P 18850 1500
F 0 "D5" V 18750 1550 50  0000 L CNN
F 1 "1N4148" H 18700 1400 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 18850 1325 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 18850 1500 50  0001 C CNN
	1    18850 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	18850 4450 18850 1650
Wire Wire Line
	17400 2350 18500 2350
Wire Wire Line
	18500 2700 18500 4450
Connection ~ 18500 4450
Wire Wire Line
	18500 4450 18850 4450
Wire Wire Line
	17400 3400 18150 3400
Wire Wire Line
	18150 3750 18150 4450
Wire Wire Line
	18150 4450 18500 4450
Text Label 15400 1450 0    60   ~ 0
ZERO
Text Label 15400 1650 0    60   ~ 0
ZERO
Text Label 15400 2500 0    60   ~ 0
ZERO
Text Label 15400 2700 0    60   ~ 0
ZERO
Text Label 15400 3550 0    60   ~ 0
ZERO
Text Label 15400 3750 0    60   ~ 0
ZERO
Text Label 15400 4600 0    60   ~ 0
ZERO
Text Label 15400 4800 0    60   ~ 0
ZERO
$Comp
L Z80GDCA-rescue:GND-updgfx_r0-rescue #PWR013
U 1 1 59D56654
P 19550 2700
F 0 "#PWR013" H 19550 2450 50  0001 C CNN
F 1 "GND" H 19550 2550 50  0000 C CNN
F 2 "" H 19550 2700 50  0000 C CNN
F 3 "" H 19550 2700 50  0000 C CNN
	1    19550 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	19550 1050 19550 2700
Wire Wire Line
	15150 6400 15750 6400
Wire Wire Line
	15150 6300 15750 6300
Wire Wire Line
	15150 6200 15750 6200
Wire Wire Line
	15150 6500 15750 6500
Wire Wire Line
	15150 6800 15750 6800
Wire Wire Line
	15150 6700 15750 6700
Wire Wire Line
	15150 6600 15750 6600
Wire Wire Line
	15150 6900 15750 6900
Text Label 15400 6200 2    60   ~ 0
AD0
Text Label 15400 6300 2    60   ~ 0
AD1
Text Label 15400 6400 2    60   ~ 0
AD2
Text Label 15400 6500 2    60   ~ 0
AD3
Text Label 15400 6600 2    60   ~ 0
AD4
Text Label 15400 6700 2    60   ~ 0
AD5
Text Label 15400 6800 2    60   ~ 0
AD6
Text Label 15400 6900 2    60   ~ 0
AD7
Text Label 15400 7000 2    60   ~ 0
AD8
Text Label 15400 7100 2    60   ~ 0
AD9
Text Label 15400 7200 2    60   ~ 0
AD10
Text Label 16650 6200 2    60   ~ 0
AD11
Text Label 16650 6300 2    60   ~ 0
AD12
Text Label 16650 6400 2    60   ~ 0
AD13
Text Label 16650 6500 2    60   ~ 0
AD14
Text Label 16650 6600 2    60   ~ 0
AD15
Wire Wire Line
	16400 6200 17000 6200
Wire Wire Line
	16400 6300 17000 6300
Wire Wire Line
	16400 6400 17000 6400
Wire Wire Line
	16400 6500 17000 6500
Wire Wire Line
	16400 6600 17000 6600
Wire Wire Line
	15150 7000 15750 7000
Wire Wire Line
	15150 7100 15750 7100
Wire Wire Line
	15150 7200 15750 7200
Text Label 16650 6700 2    60   ~ 0
A16
Text Label 16650 6800 2    60   ~ 0
A17
Wire Wire Line
	16400 6700 17000 6700
Wire Wire Line
	16400 6800 17000 6800
Wire Wire Line
	16400 7100 17000 7100
Wire Wire Line
	16400 7000 17000 7000
Wire Wire Line
	16400 6900 17000 6900
Wire Wire Line
	16400 6100 17000 6100
Text Label 16450 6900 0    60   ~ 0
ALE#
Text Label 16450 7000 0    60   ~ 0
VRAM_RD#
Text Label 16450 7100 0    60   ~ 0
VRAM_WR#
Text Label 16450 6100 0    60   ~ 0
VCC
Wire Wire Line
	15150 6100 15750 6100
Wire Wire Line
	15150 7300 15750 7300
Text Label 15200 6100 0    60   ~ 0
GND
Text Label 15200 7300 0    60   ~ 0
VCC
Text Label 16450 7300 0    60   ~ 0
GND
Wire Wire Line
	16400 7300 17000 7300
Wire Wire Line
	16400 7200 17000 7200
Text Label 16450 7200 0    60   ~ 0
RESERVED
$Comp
L conn:CONN_01X13 J2
U 1 1 6DEB0C5F
P 15950 6700
F 0 "J2" H 16028 6741 50  0000 L CNN
F 1 "L_MEZZ" V 16050 6100 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x13_P2.54mm_Vertical" H 15950 6700 50  0001 C CNN
F 3 "" H 15950 6700 50  0001 C CNN
	1    15950 6700
	1    0    0    -1  
$EndComp
$Comp
L conn:CONN_01X13 J3
U 1 1 6DEB290E
P 17200 6700
F 0 "J3" H 17278 6741 50  0000 L CNN
F 1 "R_MEZZ" V 17300 6100 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x13_P2.54mm_Vertical" H 17200 6700 50  0001 C CNN
F 3 "" H 17200 6700 50  0001 C CNN
	1    17200 6700
	1    0    0    -1  
$EndComp
NoConn ~ 16400 7200
Text Notes 15500 5750 0    60   ~ 0
ADDRESS LATCHES AND VIDEO SRAM\nMOVED TO MEZZANINE BOARD
Wire Wire Line
	12500 1200 13400 1200
Wire Wire Line
	13400 1300 13400 1550
Wire Wire Line
	12500 1300 13400 1300
Text Label 14350 1550 0    60   ~ 0
VS#
Text Label 14350 1200 0    60   ~ 0
HS#
Wire Wire Line
	13300 1400 13300 1900
Wire Wire Line
	13300 1900 13400 1900
Wire Wire Line
	12500 1400 13300 1400
Text Label 14350 1900 0    60   ~ 0
BLANK#
Wire Wire Line
	14750 1900 14300 1900
Wire Wire Line
	14300 1550 14750 1550
Wire Wire Line
	14300 1200 14750 1200
Text Label 15300 5050 0    60   ~ 0
BLANK#
Text Label 15300 4000 0    60   ~ 0
BLANK#
Text Label 15300 2950 0    60   ~ 0
BLANK#
Text Label 15300 1900 0    60   ~ 0
BLANK#
Text Label 15200 4700 0    60   ~ 0
PIXELCLK
Text Label 15200 3650 0    60   ~ 0
PIXELCLK
Text Label 15200 2600 0    60   ~ 0
PIXELCLK
Text Label 15200 1550 0    60   ~ 0
PIXELCLK
Text Label 15150 4950 0    60   ~ 0
PAR_LOAD#
Text Label 15150 3900 0    60   ~ 0
PAR_LOAD#
Text Label 15150 2850 0    60   ~ 0
PAR_LOAD#
Text Label 15150 1800 0    60   ~ 0
PAR_LOAD#
Wire Wire Line
	19000 950  20650 950 
Wire Wire Line
	10050 5000 10050 5750
Wire Wire Line
	8950 5750 10050 5750
Text Label 9700 5950 0    60   ~ 0
ONE
Text Label 12500 9550 0    60   ~ 0
ONE
$Comp
L Z80GDCA-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR0101
U 1 1 62FCF02F
P 10300 2200
F 0 "#PWR0101" H 10300 2300 30  0001 C CNN
F 1 "VCC" H 10300 2300 30  0000 C CNN
F 2 "" H 10300 2200 60  0001 C CNN
F 3 "" H 10300 2200 60  0001 C CNN
	1    10300 2200
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR0103
U 1 1 62FD37F3
P 9250 4700
F 0 "#PWR0103" H 9250 4800 30  0001 C CNN
F 1 "VCC" H 9250 4800 30  0000 C CNN
F 2 "" H 9250 4700 60  0001 C CNN
F 3 "" H 9250 4700 60  0001 C CNN
	1    9250 4700
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR0104
U 1 1 62FDCBC5
P 11850 750
F 0 "#PWR0104" H 11850 850 30  0001 C CNN
F 1 "VCC" H 11850 850 30  0000 C CNN
F 2 "" H 11850 750 60  0001 C CNN
F 3 "" H 11850 750 60  0001 C CNN
	1    11850 750 
	1    0    0    -1  
$EndComp
Connection ~ 18850 1300
Wire Wire Line
	18850 1300 18850 1350
Wire Wire Line
	18850 900  18850 1300
NoConn ~ 17050 1000
Connection ~ 18500 2350
Wire Wire Line
	19000 2350 18500 2350
Wire Wire Line
	19000 950  19000 2350
$Comp
L Z80GDCA-rescue:74LS195-74xx1 U15
U 1 1 59D4F271
P 16350 3600
F 0 "U15" H 16350 3700 50  0000 C CNN
F 1 "74LS195" H 16350 3500 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 16350 3600 50  0001 C CNN
F 3 "" H 16350 3600 50  0000 C CNN
	1    16350 3600
	1    0    0    -1  
$EndComp
Connection ~ 18150 3400
NoConn ~ 17050 3100
NoConn ~ 17050 4150
Connection ~ 18150 4450
Wire Wire Line
	18150 3400 19150 3400
Wire Wire Line
	19150 1000 19150 3400
Text Notes 8500 6450 0    60   ~ 0
CLOCK\nDIVIDE\nBY 2
Text Notes 8500 8000 0    60   ~ 0
CLOCK\nDIVIDE\nBY 2
Wire Wire Line
	10950 8250 14950 8250
Wire Wire Line
	13050 7800 16000 7800
Wire Wire Line
	16000 8000 14950 8000
Wire Wire Line
	14950 8000 14950 8250
Wire Wire Line
	10950 7800 10950 8250
Wire Wire Line
	15100 10500 15100 10750
Wire Wire Line
	15100 10500 16000 10500
Wire Wire Line
	16000 10300 16000 9800
Connection ~ 16000 10300
Wire Wire Line
	14800 10300 16000 10300
Wire Wire Line
	7300 2600 8700 2600
Wire Wire Line
	10800 2000 11200 2000
Wire Wire Line
	10800 2000 10800 1400
Wire Wire Line
	10800 1400 10400 1400
Text Label 10950 2300 0    50   ~ 0
DRQ
Wire Wire Line
	10900 2300 11200 2300
Text Label 10950 2200 0    50   ~ 0
DACK
Wire Wire Line
	9200 1500 9200 1800
Connection ~ 9200 1800
Wire Wire Line
	8700 1800 8700 2600
Wire Wire Line
	8700 1800 9200 1800
$Comp
L conn:CONN_01X03 J4
U 1 1 66032762
P 10400 3050
F 0 "J4" H 10350 3250 50  0000 L CNN
F 1 "EXT DMA" V 10500 2900 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 10400 3050 50  0001 C CNN
F 3 "" H 10400 3050 50  0001 C CNN
	1    10400 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 2950 10200 2800
Wire Wire Line
	9000 2800 9300 2800
Text Label 9050 2800 0    50   ~ 0
DACK
Text Label 9950 3050 0    50   ~ 0
GND
Wire Wire Line
	9900 3050 10200 3050
Text Label 8750 3200 0    50   ~ 0
DRQ
Wire Wire Line
	8700 3200 9000 3200
Wire Wire Line
	10200 3150 10200 3300
Wire Wire Line
	9000 3400 9000 3200
Connection ~ 9000 3200
$EndSCHEMATC
