EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
Text Label 750  750  0    60   ~ 0
A9
Text Label 750  650  0    60   ~ 0
A10
Text Label 2050 650  0    60   ~ 0
A11
Text Label 750  850  0    60   ~ 0
A8
Text Label 2050 850  0    60   ~ 0
A13
Text Label 2050 950  0    60   ~ 0
A14
Text Label 2050 1050 0    60   ~ 0
A15
Text Label 2050 750  0    60   ~ 0
A12
Wire Wire Line
	650  850  1150 850 
Wire Wire Line
	650  750  1150 750 
Wire Wire Line
	650  650  1150 650 
Wire Wire Line
	1950 650  2450 650 
Wire Wire Line
	1950 750  2450 750 
Wire Wire Line
	1950 850  2450 850 
Wire Wire Line
	1950 950  2450 950 
Wire Wire Line
	1950 1050 2450 1050
Text Label 750  1550 0    60   ~ 0
A1
Text Label 750  1450 0    60   ~ 0
A2
Text Label 750  1350 0    60   ~ 0
A3
Text Label 750  1650 0    60   ~ 0
A0
Text Label 750  1150 0    60   ~ 0
A5
Text Label 750  1050 0    60   ~ 0
A6
Text Label 750  950  0    60   ~ 0
A7
Text Label 750  1250 0    60   ~ 0
A4
Wire Wire Line
	650  1650 1150 1650
Wire Wire Line
	650  1550 1150 1550
Wire Wire Line
	650  1450 1150 1450
Wire Wire Line
	650  1350 1150 1350
Wire Wire Line
	650  1250 1150 1250
Wire Wire Line
	650  1150 1150 1150
Wire Wire Line
	650  1050 1150 1050
Wire Wire Line
	650  950  1150 950 
Wire Wire Line
	650  1750 1150 1750
Text Label 750  1750 0    60   ~ 0
GND
Text Label 750  1850 0    60   ~ 0
/RFSH
Text Label 2050 2350 0    60   ~ 0
/HALT
Text Label 750  2350 0    60   ~ 0
/BUSACK
Text Label 750  1950 0    60   ~ 0
/M1
Wire Wire Line
	650  1950 1150 1950
Wire Wire Line
	650  1850 1150 1850
Wire Wire Line
	1950 2350 2450 2350
Wire Wire Line
	650  2350 1150 2350
Text Label 750  2150 0    60   ~ 0
/BUSRQ
Text Label 2050 2250 0    60   ~ 0
/NMI
Text Label 2050 2150 0    60   ~ 0
/INT
Text Label 750  2250 0    60   ~ 0
/WAIT
Text Label 750  2050 0    60   ~ 0
/RESET
Wire Wire Line
	650  2050 1150 2050
Wire Wire Line
	1950 2250 2450 2250
Wire Wire Line
	1950 2150 2450 2150
Wire Wire Line
	650  2250 1150 2250
Wire Wire Line
	650  2150 1150 2150
Text Label 2050 2450 0    60   ~ 0
/MREQ
Text Label 750  2450 0    60   ~ 0
/WR
Text Label 750  2550 0    60   ~ 0
/RD
Text Label 2050 2550 0    60   ~ 0
/IORQ
Wire Wire Line
	1950 2550 2450 2550
Wire Wire Line
	1950 2450 2450 2450
Wire Wire Line
	650  2450 1150 2450
Wire Wire Line
	650  2550 1150 2550
Text Label 2050 2050 0    60   ~ 0
D1
Text Label 2050 1750 0    60   ~ 0
D2
Text Label 2050 1350 0    60   ~ 0
D3
Text Label 2050 1950 0    60   ~ 0
D0
Text Label 2050 1450 0    60   ~ 0
D5
Text Label 2050 1550 0    60   ~ 0
D6
Text Label 2050 1850 0    60   ~ 0
D7
Text Label 2050 1250 0    60   ~ 0
D4
Wire Wire Line
	1950 1950 2450 1950
Wire Wire Line
	1950 2050 2450 2050
Wire Wire Line
	1950 1750 2450 1750
Wire Wire Line
	1950 1350 2450 1350
Wire Wire Line
	1950 1250 2450 1250
Wire Wire Line
	1950 1450 2450 1450
Wire Wire Line
	1950 1550 2450 1550
Wire Wire Line
	1950 1850 2450 1850
Wire Wire Line
	1950 1650 2450 1650
Text Label 2050 1650 0    60   ~ 0
VCC
Wire Wire Line
	1950 1150 2450 1150
Text Label 2050 1150 0    60   ~ 0
CLK
Wire Wire Line
	4100 7150 4350 7150
Connection ~ 4350 7150
Connection ~ 4350 7550
Wire Wire Line
	4350 7550 4350 7600
$Comp
L power:GND #PWR01
U 1 1 603A93CE
P 4350 7600
F 0 "#PWR01" H 4350 7600 30  0001 C CNN
F 1 "GND" H 4350 7530 30  0001 C CNN
F 2 "" H 4350 7600 60  0001 C CNN
F 3 "" H 4350 7600 60  0001 C CNN
	1    4350 7600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 603A9412
P 3600 6650
F 0 "#PWR02" H 3600 6750 30  0001 C CNN
F 1 "VCC" H 3600 6750 30  0000 C CNN
F 2 "" H 3600 6650 60  0001 C CNN
F 3 "" H 3600 6650 60  0001 C CNN
	1    3600 6650
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG03
U 1 1 603A9456
P 4600 7150
F 0 "#FLG03" H 4600 7245 30  0001 C CNN
F 1 "PWR_FLAG" H 4600 7330 30  0000 C CNN
F 2 "" H 4600 7150 60  0001 C CNN
F 3 "" H 4600 7150 60  0001 C CNN
	1    4600 7150
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG04
U 1 1 603A949A
P 3300 7550
F 0 "#FLG04" H 3300 7645 30  0001 C CNN
F 1 "PWR_FLAG" H 3300 7730 30  0000 C CNN
F 2 "" H 3300 7550 60  0001 C CNN
F 3 "" H 3300 7550 60  0001 C CNN
	1    3300 7550
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN-rescue:CP-device C1
U 1 1 6039BD2A
P 4350 7350
F 0 "C1" H 4400 7450 50  0000 L CNN
F 1 "10u" H 4400 7250 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Axial_L10.0mm_D4.5mm_P15.00mm_Horizontal" H 4350 7350 60  0001 C CNN
F 3 "" H 4350 7350 60  0001 C CNN
	1    4350 7350
	1    0    0    -1  
$EndComp
$Comp
L device:LED D1
U 1 1 603A5584
P 3600 7350
F 0 "D1" H 3600 7450 50  0000 C CNN
F 1 "LED" H 3600 7250 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm_Horizontal_O3.81mm_Z3.0mm" H 3600 7350 60  0001 C CNN
F 3 "" H 3600 7350 60  0001 C CNN
	1    3600 7350
	0    -1   -1   0   
$EndComp
$Comp
L Z80BCKPLN-rescue:R-device R5
U 1 1 603A596D
P 3600 6900
F 0 "R5" V 3680 6900 50  0000 C CNN
F 1 "470" V 3600 6900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3600 6900 60  0001 C CNN
F 3 "" H 3600 6900 60  0001 C CNN
	1    3600 6900
	-1   0    0    1   
$EndComp
$Comp
L conn:BARREL_JACK CON1
U 1 1 603ADBB5
P 1200 7450
F 0 "CON1" H 1200 7700 60  0000 C CNN
F 1 "BARREL_JACK" H 1200 7250 60  0000 C CNN
F 2 "Connectors:JACK_ALIM" H 1200 7450 60  0001 C CNN
F 3 "" H 1200 7450 60  0001 C CNN
	1    1200 7450
	1    0    0    -1  
$EndComp
Connection ~ 3300 7550
Wire Wire Line
	2700 6650 3600 6650
Wire Wire Line
	4100 6650 4100 7150
Connection ~ 3600 6650
Text Notes 4850 7550 0    60   ~ 0
Note: 2.1mm DC Power Jack Male \nSolder Eyelet (Panel Mount Groove)\nJameco Part no.: 101178\nManufacturer: Jameco Valuepro\nManufacturer p/n: GCD014
Wire Wire Line
	1500 7450 1500 7550
Connection ~ 1500 7550
Text Notes 2250 5850 0    60   ~ 0
Note: female 2x25 2.54mm straight PCB connectors
Text Notes 4850 7000 0    60   ~ 0
Note: Capacitor Axial 10 uF 16v 20% 85c\nIncrements Of 10\nJameco Part no.: 1946199\nManufacturer: Jameco Valuepro\nManufacturer p/n: A10/16
Text Notes 900  7000 0    60   ~ 0
Note: CON1 mounted on reverse \nfor PCB clearance
$Comp
L conn:CONN_1 P1
U 1 1 603C3AC0
P 950 6200
F 0 "P1" H 1030 6200 40  0000 L CNN
F 1 "CONN_1" H 950 6255 30  0001 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 950 6200 60  0001 C CNN
F 3 "" H 950 6200 60  0001 C CNN
	1    950  6200
	1    0    0    -1  
$EndComp
$Comp
L conn:CONN_1 P2
U 1 1 603C3BC6
P 950 6300
F 0 "P2" H 1030 6300 40  0000 L CNN
F 1 "CONN_1" H 950 6355 30  0001 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 950 6300 60  0001 C CNN
F 3 "" H 950 6300 60  0001 C CNN
	1    950  6300
	1    0    0    -1  
$EndComp
$Comp
L conn:CONN_1 P3
U 1 1 603C3BFA
P 950 6400
F 0 "P3" H 1030 6400 40  0000 L CNN
F 1 "CONN_1" H 950 6455 30  0001 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 950 6400 60  0001 C CNN
F 3 "" H 950 6400 60  0001 C CNN
	1    950  6400
	1    0    0    -1  
$EndComp
$Comp
L conn:CONN_1 P4
U 1 1 603C3C00
P 950 6500
F 0 "P4" H 1030 6500 40  0000 L CNN
F 1 "CONN_1" H 950 6555 30  0001 C CNN
F 2 "Mounting_Holes:MountingHole_3.2mm_M3_Pad" H 950 6500 60  0001 C CNN
F 3 "" H 950 6500 60  0001 C CNN
	1    950  6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  6200 800  6300
$Comp
L power:GND #PWR05
U 1 1 603C3DAD
P 800 6600
F 0 "#PWR05" H 800 6600 30  0001 C CNN
F 1 "GND" H 800 6530 30  0001 C CNN
F 2 "" H 800 6600 60  0001 C CNN
F 3 "" H 800 6600 60  0001 C CNN
	1    800  6600
	1    0    0    -1  
$EndComp
Connection ~ 800  6400
Connection ~ 800  6500
Connection ~ 800  6300
Text Notes 600  6100 0    60   ~ 0
Mounting Holes\n3.7mm diameter
$Comp
L conn:CONN_25X2 J1
U 1 1 603D86FB
P 1550 1850
F 0 "J1" H 1550 3150 60  0000 C CNN
F 1 "CONN_25X2" V 1550 1850 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x25_Pitch2.54mm" H 1550 1850 60  0001 C CNN
F 3 "" H 1550 1850 60  0001 C CNN
	1    1550 1850
	1    0    0    -1  
$EndComp
Text Label 750  2850 0    60   ~ 0
SPARE7
Wire Wire Line
	650  2850 1150 2850
Text Label 750  2650 0    60   ~ 0
SPARE9
Text Label 750  2750 0    60   ~ 0
SPARE8
Wire Wire Line
	650  2750 1150 2750
Wire Wire Line
	650  2650 1150 2650
Text Label 750  2950 0    60   ~ 0
SPARE6
Text Label 750  3050 0    60   ~ 0
SPARE5
Wire Wire Line
	650  2950 1150 2950
Wire Wire Line
	650  3050 1150 3050
Text Label 2050 2850 0    60   ~ 0
SPARE2
Wire Wire Line
	1950 2850 2450 2850
Text Label 2050 2650 0    60   ~ 0
SPARE0
Text Label 2050 2750 0    60   ~ 0
SPARE1
Wire Wire Line
	1950 2750 2450 2750
Wire Wire Line
	1950 2650 2450 2650
Text Label 2050 2950 0    60   ~ 0
SPARE3
Text Label 2050 3050 0    60   ~ 0
SPARE4
Wire Wire Line
	1950 2950 2450 2950
Wire Wire Line
	1950 3050 2450 3050
Text Label 750  3400 0    60   ~ 0
A9
Text Label 750  3300 0    60   ~ 0
A10
Text Label 2050 3300 0    60   ~ 0
A11
Text Label 750  3500 0    60   ~ 0
A8
Text Label 2050 3500 0    60   ~ 0
A13
Text Label 2050 3600 0    60   ~ 0
A14
Text Label 2050 3700 0    60   ~ 0
A15
Text Label 2050 3400 0    60   ~ 0
A12
Wire Wire Line
	650  3500 1150 3500
Wire Wire Line
	650  3400 1150 3400
Wire Wire Line
	650  3300 1150 3300
Wire Wire Line
	1950 3300 2450 3300
Wire Wire Line
	1950 3400 2450 3400
Wire Wire Line
	1950 3500 2450 3500
Wire Wire Line
	1950 3600 2450 3600
Wire Wire Line
	1950 3700 2450 3700
Text Label 750  4200 0    60   ~ 0
A1
Text Label 750  4100 0    60   ~ 0
A2
Text Label 750  4000 0    60   ~ 0
A3
Text Label 750  4300 0    60   ~ 0
A0
Text Label 750  3800 0    60   ~ 0
A5
Text Label 750  3700 0    60   ~ 0
A6
Text Label 750  3600 0    60   ~ 0
A7
Text Label 750  3900 0    60   ~ 0
A4
Wire Wire Line
	650  4300 1150 4300
Wire Wire Line
	650  4200 1150 4200
Wire Wire Line
	650  4100 1150 4100
Wire Wire Line
	650  4000 1150 4000
Wire Wire Line
	650  3900 1150 3900
Wire Wire Line
	650  3800 1150 3800
Wire Wire Line
	650  3700 1150 3700
Wire Wire Line
	650  3600 1150 3600
Wire Wire Line
	650  4400 1150 4400
Text Label 750  4400 0    60   ~ 0
GND
Text Label 750  4500 0    60   ~ 0
/RFSH
Text Label 2050 5000 0    60   ~ 0
/HALT
Text Label 750  5000 0    60   ~ 0
/BUSACK
Text Label 750  4600 0    60   ~ 0
/M1
Wire Wire Line
	650  4600 1150 4600
Wire Wire Line
	650  4500 1150 4500
Wire Wire Line
	1950 5000 2450 5000
Wire Wire Line
	650  5000 1150 5000
Text Label 750  4800 0    60   ~ 0
/BUSRQ
Text Label 2050 4900 0    60   ~ 0
/NMI
Text Label 2050 4800 0    60   ~ 0
/INT
Text Label 750  4900 0    60   ~ 0
/WAIT
Text Label 750  4700 0    60   ~ 0
/RESET
Wire Wire Line
	650  4700 1150 4700
Wire Wire Line
	1950 4900 2450 4900
Wire Wire Line
	1950 4800 2450 4800
Wire Wire Line
	650  4900 1150 4900
Wire Wire Line
	650  4800 1150 4800
Text Label 2050 5100 0    60   ~ 0
/MREQ
Text Label 750  5100 0    60   ~ 0
/WR
Text Label 750  5200 0    60   ~ 0
/RD
Text Label 2050 5200 0    60   ~ 0
/IORQ
Wire Wire Line
	1950 5200 2450 5200
Wire Wire Line
	1950 5100 2450 5100
Wire Wire Line
	650  5100 1150 5100
Wire Wire Line
	650  5200 1150 5200
Text Label 2050 4700 0    60   ~ 0
D1
Text Label 2050 4400 0    60   ~ 0
D2
Text Label 2050 4000 0    60   ~ 0
D3
Text Label 2050 4600 0    60   ~ 0
D0
Text Label 2050 4100 0    60   ~ 0
D5
Text Label 2050 4200 0    60   ~ 0
D6
Text Label 2050 4500 0    60   ~ 0
D7
Text Label 2050 3900 0    60   ~ 0
D4
Wire Wire Line
	1950 4600 2450 4600
Wire Wire Line
	1950 4700 2450 4700
Wire Wire Line
	1950 4400 2450 4400
Wire Wire Line
	1950 4000 2450 4000
Wire Wire Line
	1950 3900 2450 3900
Wire Wire Line
	1950 4100 2450 4100
Wire Wire Line
	1950 4200 2450 4200
Wire Wire Line
	1950 4500 2450 4500
Wire Wire Line
	1950 4300 2450 4300
Text Label 2050 4300 0    60   ~ 0
VCC
Wire Wire Line
	1950 3800 2450 3800
Text Label 2050 3800 0    60   ~ 0
CLK
$Comp
L conn:CONN_25X2 J2
U 1 1 603D8E31
P 1550 4500
F 0 "J2" H 1550 5800 60  0000 C CNN
F 1 "CONN_25X2" V 1550 4500 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x25_Pitch2.54mm" H 1550 4500 60  0001 C CNN
F 3 "" H 1550 4500 60  0001 C CNN
	1    1550 4500
	1    0    0    -1  
$EndComp
Text Label 2750 750  0    60   ~ 0
A9
Text Label 2750 650  0    60   ~ 0
A10
Text Label 4050 650  0    60   ~ 0
A11
Text Label 2750 850  0    60   ~ 0
A8
Text Label 4050 850  0    60   ~ 0
A13
Text Label 4050 950  0    60   ~ 0
A14
Text Label 4050 1050 0    60   ~ 0
A15
Text Label 4050 750  0    60   ~ 0
A12
Wire Wire Line
	2650 850  3150 850 
Wire Wire Line
	2650 750  3150 750 
Wire Wire Line
	2650 650  3150 650 
Wire Wire Line
	3950 650  4450 650 
Wire Wire Line
	3950 750  4450 750 
Wire Wire Line
	3950 850  4450 850 
Wire Wire Line
	3950 950  4450 950 
Wire Wire Line
	3950 1050 4450 1050
Text Label 2750 1550 0    60   ~ 0
A1
Text Label 2750 1450 0    60   ~ 0
A2
Text Label 2750 1350 0    60   ~ 0
A3
Text Label 2750 1650 0    60   ~ 0
A0
Text Label 2750 1150 0    60   ~ 0
A5
Text Label 2750 1050 0    60   ~ 0
A6
Text Label 2750 950  0    60   ~ 0
A7
Text Label 2750 1250 0    60   ~ 0
A4
Wire Wire Line
	2650 1650 3150 1650
Wire Wire Line
	2650 1550 3150 1550
Wire Wire Line
	2650 1450 3150 1450
Wire Wire Line
	2650 1350 3150 1350
Wire Wire Line
	2650 1250 3150 1250
Wire Wire Line
	2650 1150 3150 1150
Wire Wire Line
	2650 1050 3150 1050
Wire Wire Line
	2650 950  3150 950 
Wire Wire Line
	2650 1750 3150 1750
Text Label 2750 1750 0    60   ~ 0
GND
Text Label 2750 1850 0    60   ~ 0
/RFSH
Text Label 4050 2350 0    60   ~ 0
/HALT
Text Label 2750 2350 0    60   ~ 0
/BUSACK
Text Label 2750 1950 0    60   ~ 0
/M1
Wire Wire Line
	2650 1950 3150 1950
Wire Wire Line
	2650 1850 3150 1850
Wire Wire Line
	3950 2350 4450 2350
Wire Wire Line
	2650 2350 3150 2350
Text Label 2750 2150 0    60   ~ 0
/BUSRQ
Text Label 4050 2250 0    60   ~ 0
/NMI
Text Label 4050 2150 0    60   ~ 0
/INT
Text Label 2750 2250 0    60   ~ 0
/WAIT
Text Label 2750 2050 0    60   ~ 0
/RESET
Wire Wire Line
	2650 2050 3150 2050
Wire Wire Line
	3950 2250 4450 2250
Wire Wire Line
	3950 2150 4450 2150
Wire Wire Line
	2650 2250 3150 2250
Wire Wire Line
	2650 2150 3150 2150
Text Label 4050 2450 0    60   ~ 0
/MREQ
Text Label 2750 2450 0    60   ~ 0
/WR
Text Label 2750 2550 0    60   ~ 0
/RD
Text Label 4050 2550 0    60   ~ 0
/IORQ
Wire Wire Line
	3950 2550 4450 2550
Wire Wire Line
	3950 2450 4450 2450
Wire Wire Line
	2650 2450 3150 2450
Wire Wire Line
	2650 2550 3150 2550
Text Label 4050 2050 0    60   ~ 0
D1
Text Label 4050 1750 0    60   ~ 0
D2
Text Label 4050 1350 0    60   ~ 0
D3
Text Label 4050 1950 0    60   ~ 0
D0
Text Label 4050 1450 0    60   ~ 0
D5
Text Label 4050 1550 0    60   ~ 0
D6
Text Label 4050 1850 0    60   ~ 0
D7
Text Label 4050 1250 0    60   ~ 0
D4
Wire Wire Line
	3950 1950 4450 1950
Wire Wire Line
	3950 2050 4450 2050
Wire Wire Line
	3950 1750 4450 1750
Wire Wire Line
	3950 1350 4450 1350
Wire Wire Line
	3950 1250 4450 1250
Wire Wire Line
	3950 1450 4450 1450
Wire Wire Line
	3950 1550 4450 1550
Wire Wire Line
	3950 1850 4450 1850
Wire Wire Line
	3950 1650 4450 1650
Text Label 4050 1650 0    60   ~ 0
VCC
Wire Wire Line
	3950 1150 4450 1150
Text Label 4050 1150 0    60   ~ 0
CLK
$Comp
L conn:CONN_25X2 J3
U 1 1 603D8EEC
P 3550 1850
F 0 "J3" H 3550 3150 60  0000 C CNN
F 1 "CONN_25X2" V 3550 1850 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x25_Pitch2.54mm" H 3550 1850 60  0001 C CNN
F 3 "" H 3550 1850 60  0001 C CNN
	1    3550 1850
	1    0    0    -1  
$EndComp
Text Label 2750 3400 0    60   ~ 0
A9
Text Label 2750 3300 0    60   ~ 0
A10
Text Label 4050 3300 0    60   ~ 0
A11
Text Label 2750 3500 0    60   ~ 0
A8
Text Label 4050 3500 0    60   ~ 0
A13
Text Label 4050 3600 0    60   ~ 0
A14
Text Label 4050 3700 0    60   ~ 0
A15
Text Label 4050 3400 0    60   ~ 0
A12
Wire Wire Line
	2650 3500 3150 3500
Wire Wire Line
	2650 3400 3150 3400
Wire Wire Line
	2650 3300 3150 3300
Wire Wire Line
	3950 3300 4450 3300
Wire Wire Line
	3950 3400 4450 3400
Wire Wire Line
	3950 3500 4450 3500
Wire Wire Line
	3950 3600 4450 3600
Wire Wire Line
	3950 3700 4450 3700
Text Label 2750 4200 0    60   ~ 0
A1
Text Label 2750 4100 0    60   ~ 0
A2
Text Label 2750 4000 0    60   ~ 0
A3
Text Label 2750 4300 0    60   ~ 0
A0
Text Label 2750 3800 0    60   ~ 0
A5
Text Label 2750 3700 0    60   ~ 0
A6
Text Label 2750 3600 0    60   ~ 0
A7
Text Label 2750 3900 0    60   ~ 0
A4
Wire Wire Line
	2650 4300 3150 4300
Wire Wire Line
	2650 4200 3150 4200
Wire Wire Line
	2650 4100 3150 4100
Wire Wire Line
	2650 4000 3150 4000
Wire Wire Line
	2650 3900 3150 3900
Wire Wire Line
	2650 3800 3150 3800
Wire Wire Line
	2650 3700 3150 3700
Wire Wire Line
	2650 3600 3150 3600
Wire Wire Line
	2650 4400 3150 4400
Text Label 2750 4400 0    60   ~ 0
GND
Text Label 2750 4500 0    60   ~ 0
/RFSH
Text Label 4050 5000 0    60   ~ 0
/HALT
Text Label 2750 5000 0    60   ~ 0
/BUSACK
Text Label 2750 4600 0    60   ~ 0
/M1
Wire Wire Line
	2650 4600 3150 4600
Wire Wire Line
	2650 4500 3150 4500
Wire Wire Line
	3950 5000 4450 5000
Wire Wire Line
	2650 5000 3150 5000
Text Label 2750 4800 0    60   ~ 0
/BUSRQ
Text Label 4050 4900 0    60   ~ 0
/NMI
Text Label 4050 4800 0    60   ~ 0
/INT
Text Label 2750 4900 0    60   ~ 0
/WAIT
Text Label 2750 4700 0    60   ~ 0
/RESET
Wire Wire Line
	2650 4700 3150 4700
Wire Wire Line
	3950 4900 4450 4900
Wire Wire Line
	3950 4800 4450 4800
Wire Wire Line
	2650 4900 3150 4900
Wire Wire Line
	2650 4800 3150 4800
Text Label 4050 5100 0    60   ~ 0
/MREQ
Text Label 2750 5100 0    60   ~ 0
/WR
Text Label 2750 5200 0    60   ~ 0
/RD
Text Label 4050 5200 0    60   ~ 0
/IORQ
Wire Wire Line
	3950 5200 4450 5200
Wire Wire Line
	3950 5100 4450 5100
Wire Wire Line
	2650 5100 3150 5100
Wire Wire Line
	2650 5200 3150 5200
Text Label 4050 4700 0    60   ~ 0
D1
Text Label 4050 4400 0    60   ~ 0
D2
Text Label 4050 4000 0    60   ~ 0
D3
Text Label 4050 4600 0    60   ~ 0
D0
Text Label 4050 4100 0    60   ~ 0
D5
Text Label 4050 4200 0    60   ~ 0
D6
Text Label 4050 4500 0    60   ~ 0
D7
Text Label 4050 3900 0    60   ~ 0
D4
Wire Wire Line
	3950 4600 4450 4600
Wire Wire Line
	3950 4700 4450 4700
Wire Wire Line
	3950 4400 4450 4400
Wire Wire Line
	3950 4000 4450 4000
Wire Wire Line
	3950 3900 4450 3900
Wire Wire Line
	3950 4100 4450 4100
Wire Wire Line
	3950 4200 4450 4200
Wire Wire Line
	3950 4500 4450 4500
Wire Wire Line
	3950 4300 4450 4300
Text Label 4050 4300 0    60   ~ 0
VCC
Wire Wire Line
	3950 3800 4450 3800
Text Label 4050 3800 0    60   ~ 0
CLK
$Comp
L conn:CONN_25X2 J4
U 1 1 603D8F7E
P 3550 4500
F 0 "J4" H 3550 5800 60  0000 C CNN
F 1 "CONN_25X2" V 3550 4500 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x25_Pitch2.54mm" H 3550 4500 60  0001 C CNN
F 3 "" H 3550 4500 60  0001 C CNN
	1    3550 4500
	1    0    0    -1  
$EndComp
Text Label 4750 750  0    60   ~ 0
A9
Text Label 4750 650  0    60   ~ 0
A10
Text Label 6050 650  0    60   ~ 0
A11
Text Label 4750 850  0    60   ~ 0
A8
Text Label 6050 850  0    60   ~ 0
A13
Text Label 6050 950  0    60   ~ 0
A14
Text Label 6050 1050 0    60   ~ 0
A15
Text Label 6050 750  0    60   ~ 0
A12
Wire Wire Line
	4650 850  5150 850 
Wire Wire Line
	4650 750  5150 750 
Wire Wire Line
	4650 650  5150 650 
Wire Wire Line
	5950 650  6450 650 
Wire Wire Line
	5950 750  6450 750 
Wire Wire Line
	5950 850  6450 850 
Wire Wire Line
	5950 950  6450 950 
Wire Wire Line
	5950 1050 6450 1050
Text Label 4750 1550 0    60   ~ 0
A1
Text Label 4750 1450 0    60   ~ 0
A2
Text Label 4750 1350 0    60   ~ 0
A3
Text Label 4750 1650 0    60   ~ 0
A0
Text Label 4750 1150 0    60   ~ 0
A5
Text Label 4750 1050 0    60   ~ 0
A6
Text Label 4750 950  0    60   ~ 0
A7
Text Label 4750 1250 0    60   ~ 0
A4
Wire Wire Line
	4650 1650 5150 1650
Wire Wire Line
	4650 1550 5150 1550
Wire Wire Line
	4650 1450 5150 1450
Wire Wire Line
	4650 1350 5150 1350
Wire Wire Line
	4650 1250 5150 1250
Wire Wire Line
	4650 1150 5150 1150
Wire Wire Line
	4650 1050 5150 1050
Wire Wire Line
	4650 950  5150 950 
Wire Wire Line
	4650 1750 5150 1750
Text Label 4750 1750 0    60   ~ 0
GND
Text Label 4750 1850 0    60   ~ 0
/RFSH
Text Label 6050 2350 0    60   ~ 0
/HALT
Text Label 4750 2350 0    60   ~ 0
/BUSACK
Text Label 4750 1950 0    60   ~ 0
/M1
Wire Wire Line
	4650 1950 5150 1950
Wire Wire Line
	4650 1850 5150 1850
Wire Wire Line
	5950 2350 6450 2350
Wire Wire Line
	4650 2350 5150 2350
Text Label 4750 2150 0    60   ~ 0
/BUSRQ
Text Label 6050 2250 0    60   ~ 0
/NMI
Text Label 6050 2150 0    60   ~ 0
/INT
Text Label 4750 2250 0    60   ~ 0
/WAIT
Text Label 4750 2050 0    60   ~ 0
/RESET
Wire Wire Line
	4650 2050 5150 2050
Wire Wire Line
	5950 2250 6450 2250
Wire Wire Line
	5950 2150 6450 2150
Wire Wire Line
	4650 2250 5150 2250
Wire Wire Line
	4650 2150 5150 2150
Text Label 6050 2450 0    60   ~ 0
/MREQ
Text Label 4750 2450 0    60   ~ 0
/WR
Text Label 4750 2550 0    60   ~ 0
/RD
Text Label 6050 2550 0    60   ~ 0
/IORQ
Wire Wire Line
	5950 2550 6450 2550
Wire Wire Line
	5950 2450 6450 2450
Wire Wire Line
	4650 2450 5150 2450
Wire Wire Line
	4650 2550 5150 2550
Text Label 6050 2050 0    60   ~ 0
D1
Text Label 6050 1750 0    60   ~ 0
D2
Text Label 6050 1350 0    60   ~ 0
D3
Text Label 6050 1950 0    60   ~ 0
D0
Text Label 6050 1450 0    60   ~ 0
D5
Text Label 6050 1550 0    60   ~ 0
D6
Text Label 6050 1850 0    60   ~ 0
D7
Text Label 6050 1250 0    60   ~ 0
D4
Wire Wire Line
	5950 1950 6450 1950
Wire Wire Line
	5950 2050 6450 2050
Wire Wire Line
	5950 1750 6450 1750
Wire Wire Line
	5950 1350 6450 1350
Wire Wire Line
	5950 1250 6450 1250
Wire Wire Line
	5950 1450 6450 1450
Wire Wire Line
	5950 1550 6450 1550
Wire Wire Line
	5950 1850 6450 1850
Wire Wire Line
	5950 1650 6450 1650
Text Label 6050 1650 0    60   ~ 0
VCC
Wire Wire Line
	5950 1150 6450 1150
Text Label 6050 1150 0    60   ~ 0
CLK
$Comp
L conn:CONN_25X2 J5
U 1 1 603D91C4
P 5550 1850
F 0 "J5" H 5550 3150 60  0000 C CNN
F 1 "CONN_25X2" V 5550 1850 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x25_Pitch2.54mm" H 5550 1850 60  0001 C CNN
F 3 "" H 5550 1850 60  0001 C CNN
	1    5550 1850
	1    0    0    -1  
$EndComp
Text Label 4750 3400 0    60   ~ 0
A9
Text Label 4750 3300 0    60   ~ 0
A10
Text Label 6050 3300 0    60   ~ 0
A11
Text Label 4750 3500 0    60   ~ 0
A8
Text Label 6050 3500 0    60   ~ 0
A13
Text Label 6050 3600 0    60   ~ 0
A14
Text Label 6050 3700 0    60   ~ 0
A15
Text Label 6050 3400 0    60   ~ 0
A12
Wire Wire Line
	4650 3500 5150 3500
Wire Wire Line
	4650 3400 5150 3400
Wire Wire Line
	4650 3300 5150 3300
Wire Wire Line
	5950 3300 6450 3300
Wire Wire Line
	5950 3400 6450 3400
Wire Wire Line
	5950 3500 6450 3500
Wire Wire Line
	5950 3600 6450 3600
Wire Wire Line
	5950 3700 6450 3700
Text Label 4750 4200 0    60   ~ 0
A1
Text Label 4750 4100 0    60   ~ 0
A2
Text Label 4750 4000 0    60   ~ 0
A3
Text Label 4750 4300 0    60   ~ 0
A0
Text Label 4750 3800 0    60   ~ 0
A5
Text Label 4750 3700 0    60   ~ 0
A6
Text Label 4750 3600 0    60   ~ 0
A7
Text Label 4750 3900 0    60   ~ 0
A4
Wire Wire Line
	4650 4300 5150 4300
Wire Wire Line
	4650 4200 5150 4200
Wire Wire Line
	4650 4100 5150 4100
Wire Wire Line
	4650 4000 5150 4000
Wire Wire Line
	4650 3900 5150 3900
Wire Wire Line
	4650 3800 5150 3800
Wire Wire Line
	4650 3700 5150 3700
Wire Wire Line
	4650 3600 5150 3600
Wire Wire Line
	4650 4400 5150 4400
Text Label 4750 4400 0    60   ~ 0
GND
Text Label 4750 4500 0    60   ~ 0
/RFSH
Text Label 6050 5000 0    60   ~ 0
/HALT
Text Label 4750 5000 0    60   ~ 0
/BUSACK
Text Label 4750 4600 0    60   ~ 0
/M1
Wire Wire Line
	4650 4600 5150 4600
Wire Wire Line
	4650 4500 5150 4500
Wire Wire Line
	5950 5000 6450 5000
Wire Wire Line
	4650 5000 5150 5000
Text Label 4750 4800 0    60   ~ 0
/BUSRQ
Text Label 6050 4900 0    60   ~ 0
/NMI
Text Label 6050 4800 0    60   ~ 0
/INT
Text Label 4750 4900 0    60   ~ 0
/WAIT
Text Label 4750 4700 0    60   ~ 0
/RESET
Wire Wire Line
	4650 4700 5150 4700
Wire Wire Line
	5950 4900 6450 4900
Wire Wire Line
	5950 4800 6450 4800
Wire Wire Line
	4650 4900 5150 4900
Wire Wire Line
	4650 4800 5150 4800
Text Label 6050 5100 0    60   ~ 0
/MREQ
Text Label 4750 5100 0    60   ~ 0
/WR
Text Label 4750 5200 0    60   ~ 0
/RD
Text Label 6050 5200 0    60   ~ 0
/IORQ
Wire Wire Line
	5950 5200 6450 5200
Wire Wire Line
	5950 5100 6450 5100
Wire Wire Line
	4650 5100 5150 5100
Wire Wire Line
	4650 5200 5150 5200
Text Label 6050 4700 0    60   ~ 0
D1
Text Label 6050 4400 0    60   ~ 0
D2
Text Label 6050 4000 0    60   ~ 0
D3
Text Label 6050 4600 0    60   ~ 0
D0
Text Label 6050 4100 0    60   ~ 0
D5
Text Label 6050 4200 0    60   ~ 0
D6
Text Label 6050 4500 0    60   ~ 0
D7
Text Label 6050 3900 0    60   ~ 0
D4
Wire Wire Line
	5950 4600 6450 4600
Wire Wire Line
	5950 4700 6450 4700
Wire Wire Line
	5950 4400 6450 4400
Wire Wire Line
	5950 4000 6450 4000
Wire Wire Line
	5950 3900 6450 3900
Wire Wire Line
	5950 4100 6450 4100
Wire Wire Line
	5950 4200 6450 4200
Wire Wire Line
	5950 4500 6450 4500
Wire Wire Line
	5950 4300 6450 4300
Text Label 6050 4300 0    60   ~ 0
VCC
Wire Wire Line
	5950 3800 6450 3800
Text Label 6050 3800 0    60   ~ 0
CLK
$Comp
L conn:CONN_25X2 J6
U 1 1 603D922E
P 5550 4500
F 0 "J6" H 5550 5800 60  0000 C CNN
F 1 "CONN_25X2" V 5550 4500 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x25_Pitch2.54mm" H 5550 4500 60  0001 C CNN
F 3 "" H 5550 4500 60  0001 C CNN
	1    5550 4500
	1    0    0    -1  
$EndComp
Text Label 6750 750  0    60   ~ 0
A9
Text Label 6750 650  0    60   ~ 0
A10
Text Label 8050 650  0    60   ~ 0
A11
Text Label 6750 850  0    60   ~ 0
A8
Text Label 8050 850  0    60   ~ 0
A13
Text Label 8050 950  0    60   ~ 0
A14
Text Label 8050 1050 0    60   ~ 0
A15
Text Label 8050 750  0    60   ~ 0
A12
Wire Wire Line
	6650 850  7150 850 
Wire Wire Line
	6650 750  7150 750 
Wire Wire Line
	6650 650  7150 650 
Wire Wire Line
	7950 650  8450 650 
Wire Wire Line
	7950 750  8450 750 
Wire Wire Line
	7950 850  8450 850 
Wire Wire Line
	7950 950  8450 950 
Wire Wire Line
	7950 1050 8450 1050
Text Label 6750 1550 0    60   ~ 0
A1
Text Label 6750 1450 0    60   ~ 0
A2
Text Label 6750 1350 0    60   ~ 0
A3
Text Label 6750 1650 0    60   ~ 0
A0
Text Label 6750 1150 0    60   ~ 0
A5
Text Label 6750 1050 0    60   ~ 0
A6
Text Label 6750 950  0    60   ~ 0
A7
Text Label 6750 1250 0    60   ~ 0
A4
Wire Wire Line
	6650 1650 7150 1650
Wire Wire Line
	6650 1550 7150 1550
Wire Wire Line
	6650 1450 7150 1450
Wire Wire Line
	6650 1350 7150 1350
Wire Wire Line
	6650 1250 7150 1250
Wire Wire Line
	6650 1150 7150 1150
Wire Wire Line
	6650 1050 7150 1050
Wire Wire Line
	6650 950  7150 950 
Wire Wire Line
	6650 1750 7150 1750
Text Label 6750 1750 0    60   ~ 0
GND
Text Label 6750 1850 0    60   ~ 0
/RFSH
Text Label 8050 2350 0    60   ~ 0
/HALT
Text Label 6750 2350 0    60   ~ 0
/BUSACK
Text Label 6750 1950 0    60   ~ 0
/M1
Wire Wire Line
	6650 1950 7150 1950
Wire Wire Line
	6650 1850 7150 1850
Wire Wire Line
	7950 2350 8450 2350
Wire Wire Line
	6650 2350 7150 2350
Text Label 6750 2150 0    60   ~ 0
/BUSRQ
Text Label 8050 2250 0    60   ~ 0
/NMI
Text Label 8050 2150 0    60   ~ 0
/INT
Text Label 6750 2250 0    60   ~ 0
/WAIT
Text Label 6750 2050 0    60   ~ 0
/RESET
Wire Wire Line
	6650 2050 7150 2050
Wire Wire Line
	7950 2250 8450 2250
Wire Wire Line
	7950 2150 8450 2150
Wire Wire Line
	6650 2250 7150 2250
Wire Wire Line
	6650 2150 7150 2150
Text Label 8050 2450 0    60   ~ 0
/MREQ
Text Label 6750 2450 0    60   ~ 0
/WR
Text Label 6750 2550 0    60   ~ 0
/RD
Text Label 8050 2550 0    60   ~ 0
/IORQ
Wire Wire Line
	7950 2550 8450 2550
Wire Wire Line
	7950 2450 8450 2450
Wire Wire Line
	6650 2450 7150 2450
Wire Wire Line
	6650 2550 7150 2550
Text Label 8050 2050 0    60   ~ 0
D1
Text Label 8050 1750 0    60   ~ 0
D2
Text Label 8050 1350 0    60   ~ 0
D3
Text Label 8050 1950 0    60   ~ 0
D0
Text Label 8050 1450 0    60   ~ 0
D5
Text Label 8050 1550 0    60   ~ 0
D6
Text Label 8050 1850 0    60   ~ 0
D7
Text Label 8050 1250 0    60   ~ 0
D4
Wire Wire Line
	7950 1950 8450 1950
Wire Wire Line
	7950 2050 8450 2050
Wire Wire Line
	7950 1750 8450 1750
Wire Wire Line
	7950 1350 8450 1350
Wire Wire Line
	7950 1250 8450 1250
Wire Wire Line
	7950 1450 8450 1450
Wire Wire Line
	7950 1550 8450 1550
Wire Wire Line
	7950 1850 8450 1850
Wire Wire Line
	7950 1650 8450 1650
Text Label 8050 1650 0    60   ~ 0
VCC
Wire Wire Line
	7950 1150 8450 1150
Text Label 8050 1150 0    60   ~ 0
CLK
$Comp
L conn:CONN_25X2 J7
U 1 1 603D9298
P 7550 1850
F 0 "J7" H 7550 3150 60  0000 C CNN
F 1 "CONN_25X2" V 7550 1850 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x25_Pitch2.54mm" H 7550 1850 60  0001 C CNN
F 3 "" H 7550 1850 60  0001 C CNN
	1    7550 1850
	1    0    0    -1  
$EndComp
Text Label 6750 3400 0    60   ~ 0
A9
Text Label 6750 3300 0    60   ~ 0
A10
Text Label 8050 3300 0    60   ~ 0
A11
Text Label 6750 3500 0    60   ~ 0
A8
Text Label 8050 3500 0    60   ~ 0
A13
Text Label 8050 3600 0    60   ~ 0
A14
Text Label 8050 3700 0    60   ~ 0
A15
Text Label 8050 3400 0    60   ~ 0
A12
Wire Wire Line
	6650 3500 7150 3500
Wire Wire Line
	6650 3400 7150 3400
Wire Wire Line
	6650 3300 7150 3300
Wire Wire Line
	7950 3300 8450 3300
Wire Wire Line
	7950 3400 8450 3400
Wire Wire Line
	7950 3500 8450 3500
Wire Wire Line
	7950 3600 8450 3600
Wire Wire Line
	7950 3700 8450 3700
Text Label 6750 4200 0    60   ~ 0
A1
Text Label 6750 4100 0    60   ~ 0
A2
Text Label 6750 4000 0    60   ~ 0
A3
Text Label 6750 4300 0    60   ~ 0
A0
Text Label 6750 3800 0    60   ~ 0
A5
Text Label 6750 3700 0    60   ~ 0
A6
Text Label 6750 3600 0    60   ~ 0
A7
Text Label 6750 3900 0    60   ~ 0
A4
Wire Wire Line
	6650 4300 7150 4300
Wire Wire Line
	6650 4200 7150 4200
Wire Wire Line
	6650 4100 7150 4100
Wire Wire Line
	6650 4000 7150 4000
Wire Wire Line
	6650 3900 7150 3900
Wire Wire Line
	6650 3800 7150 3800
Wire Wire Line
	6650 3700 7150 3700
Wire Wire Line
	6650 3600 7150 3600
Wire Wire Line
	6650 4400 7150 4400
Text Label 6750 4400 0    60   ~ 0
GND
Text Label 6750 4500 0    60   ~ 0
/RFSH
Text Label 8050 5000 0    60   ~ 0
/HALT
Text Label 6750 5000 0    60   ~ 0
/BUSACK
Text Label 6750 4600 0    60   ~ 0
/M1
Wire Wire Line
	6650 4600 7150 4600
Wire Wire Line
	6650 4500 7150 4500
Wire Wire Line
	7950 5000 8450 5000
Wire Wire Line
	6650 5000 7150 5000
Text Label 6750 4800 0    60   ~ 0
/BUSRQ
Text Label 8050 4900 0    60   ~ 0
/NMI
Text Label 8050 4800 0    60   ~ 0
/INT
Text Label 6750 4900 0    60   ~ 0
/WAIT
Text Label 6750 4700 0    60   ~ 0
/RESET
Wire Wire Line
	6650 4700 7150 4700
Wire Wire Line
	7950 4900 8450 4900
Wire Wire Line
	7950 4800 8450 4800
Wire Wire Line
	6650 4900 7150 4900
Wire Wire Line
	6650 4800 7150 4800
Text Label 8050 5100 0    60   ~ 0
/MREQ
Text Label 6750 5100 0    60   ~ 0
/WR
Text Label 6750 5200 0    60   ~ 0
/RD
Text Label 8050 5200 0    60   ~ 0
/IORQ
Wire Wire Line
	7950 5200 8450 5200
Wire Wire Line
	7950 5100 8450 5100
Wire Wire Line
	6650 5100 7150 5100
Wire Wire Line
	6650 5200 7150 5200
Text Label 8050 4700 0    60   ~ 0
D1
Text Label 8050 4400 0    60   ~ 0
D2
Text Label 8050 4000 0    60   ~ 0
D3
Text Label 8050 4600 0    60   ~ 0
D0
Text Label 8050 4100 0    60   ~ 0
D5
Text Label 8050 4200 0    60   ~ 0
D6
Text Label 8050 4500 0    60   ~ 0
D7
Text Label 8050 3900 0    60   ~ 0
D4
Wire Wire Line
	7950 4600 8450 4600
Wire Wire Line
	7950 4700 8450 4700
Wire Wire Line
	7950 4400 8450 4400
Wire Wire Line
	7950 4000 8450 4000
Wire Wire Line
	7950 3900 8450 3900
Wire Wire Line
	7950 4100 8450 4100
Wire Wire Line
	7950 4200 8450 4200
Wire Wire Line
	7950 4500 8450 4500
Wire Wire Line
	7950 4300 8450 4300
Text Label 8050 4300 0    60   ~ 0
VCC
Wire Wire Line
	7950 3800 8450 3800
Text Label 8050 3800 0    60   ~ 0
CLK
$Comp
L conn:CONN_25X2 J8
U 1 1 603D9302
P 7550 4500
F 0 "J8" H 7550 5800 60  0000 C CNN
F 1 "CONN_25X2" V 7550 4500 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x25_Pitch2.54mm" H 7550 4500 60  0001 C CNN
F 3 "" H 7550 4500 60  0001 C CNN
	1    7550 4500
	1    0    0    -1  
$EndComp
$Comp
L regul:LM7805 U1
U 1 1 603E7F07
P 2300 7200
F 0 "U1" H 2450 7004 60  0000 C CNN
F 1 "LM7805" H 2300 7400 60  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 2300 7200 60  0001 C CNN
F 3 "" H 2300 7200 60  0001 C CNN
	1    2300 7200
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN-rescue:CP-device C2
U 1 1 603E7F70
P 1900 7350
F 0 "C2" H 1950 7450 50  0000 L CNN
F 1 "0.22u" H 1950 7250 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_Tantal_D5.0mm_P5.00mm" H 1900 7350 60  0001 C CNN
F 3 "" H 1900 7350 60  0001 C CNN
	1    1900 7350
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN-rescue:C-device C3
U 1 1 603E8001
P 2700 7350
F 0 "C3" H 2750 7450 50  0000 L CNN
F 1 "0.1u" H 2750 7250 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2700 7350 60  0001 C CNN
F 3 "" H 2700 7350 60  0001 C CNN
	1    2700 7350
	1    0    0    -1  
$EndComp
Connection ~ 2700 7150
Connection ~ 1900 7150
Wire Wire Line
	1500 7550 1900 7550
Wire Wire Line
	2300 7450 2300 7550
Connection ~ 2300 7550
Wire Wire Line
	1500 7350 1500 7150
Wire Wire Line
	1500 7150 1900 7150
Connection ~ 1900 7550
Wire Wire Line
	2700 6650 2700 7150
Connection ~ 2700 7550
Text Notes 4850 6450 0    60   ~ 0
Note: AC to DC Wall Transformer Single Output \n9 Volt 1 Amp 9 Watt, Center Positive\nJameco Part no.: 364576\nManufacturer: Jameco Reliapro\nManufacturer p/n: DDU090100J0490
Text Label 2750 2850 0    60   ~ 0
SPARE7
Wire Wire Line
	2650 2850 3150 2850
Text Label 2750 2650 0    60   ~ 0
SPARE9
Text Label 2750 2750 0    60   ~ 0
SPARE8
Wire Wire Line
	2650 2750 3150 2750
Wire Wire Line
	2650 2650 3150 2650
Text Label 2750 2950 0    60   ~ 0
SPARE6
Text Label 2750 3050 0    60   ~ 0
SPARE5
Wire Wire Line
	2650 2950 3150 2950
Wire Wire Line
	2650 3050 3150 3050
Text Label 4750 2850 0    60   ~ 0
SPARE7
Wire Wire Line
	4650 2850 5150 2850
Text Label 4750 2650 0    60   ~ 0
SPARE9
Text Label 4750 2750 0    60   ~ 0
SPARE8
Wire Wire Line
	4650 2750 5150 2750
Wire Wire Line
	4650 2650 5150 2650
Text Label 4750 2950 0    60   ~ 0
SPARE6
Text Label 4750 3050 0    60   ~ 0
SPARE5
Wire Wire Line
	4650 2950 5150 2950
Wire Wire Line
	4650 3050 5150 3050
Text Label 6750 2850 0    60   ~ 0
SPARE7
Wire Wire Line
	6650 2850 7150 2850
Text Label 6750 2650 0    60   ~ 0
SPARE9
Text Label 6750 2750 0    60   ~ 0
SPARE8
Wire Wire Line
	6650 2750 7150 2750
Wire Wire Line
	6650 2650 7150 2650
Text Label 6750 2950 0    60   ~ 0
SPARE6
Text Label 6750 3050 0    60   ~ 0
SPARE5
Wire Wire Line
	6650 2950 7150 2950
Wire Wire Line
	6650 3050 7150 3050
Text Label 750  5500 0    60   ~ 0
SPARE7
Wire Wire Line
	650  5500 1150 5500
Text Label 750  5300 0    60   ~ 0
SPARE9
Text Label 750  5400 0    60   ~ 0
SPARE8
Wire Wire Line
	650  5400 1150 5400
Wire Wire Line
	650  5300 1150 5300
Text Label 750  5600 0    60   ~ 0
SPARE6
Text Label 750  5700 0    60   ~ 0
SPARE5
Wire Wire Line
	650  5600 1150 5600
Wire Wire Line
	650  5700 1150 5700
Text Label 2750 5500 0    60   ~ 0
SPARE7
Wire Wire Line
	2650 5500 3150 5500
Text Label 2750 5300 0    60   ~ 0
SPARE9
Text Label 2750 5400 0    60   ~ 0
SPARE8
Wire Wire Line
	2650 5400 3150 5400
Wire Wire Line
	2650 5300 3150 5300
Text Label 2750 5600 0    60   ~ 0
SPARE6
Text Label 2750 5700 0    60   ~ 0
SPARE5
Wire Wire Line
	2650 5600 3150 5600
Wire Wire Line
	2650 5700 3150 5700
Text Label 4750 5500 0    60   ~ 0
SPARE7
Wire Wire Line
	4650 5500 5150 5500
Text Label 4750 5300 0    60   ~ 0
SPARE9
Text Label 4750 5400 0    60   ~ 0
SPARE8
Wire Wire Line
	4650 5400 5150 5400
Wire Wire Line
	4650 5300 5150 5300
Text Label 4750 5600 0    60   ~ 0
SPARE6
Text Label 4750 5700 0    60   ~ 0
SPARE5
Wire Wire Line
	4650 5600 5150 5600
Wire Wire Line
	4650 5700 5150 5700
Text Label 6750 5500 0    60   ~ 0
SPARE7
Wire Wire Line
	6650 5500 7150 5500
Text Label 6750 5300 0    60   ~ 0
SPARE9
Text Label 6750 5400 0    60   ~ 0
SPARE8
Wire Wire Line
	6650 5400 7150 5400
Wire Wire Line
	6650 5300 7150 5300
Text Label 6750 5600 0    60   ~ 0
SPARE6
Text Label 6750 5700 0    60   ~ 0
SPARE5
Wire Wire Line
	6650 5600 7150 5600
Wire Wire Line
	6650 5700 7150 5700
Text Label 4050 2850 0    60   ~ 0
SPARE2
Wire Wire Line
	3950 2850 4450 2850
Text Label 4050 2650 0    60   ~ 0
SPARE0
Text Label 4050 2750 0    60   ~ 0
SPARE1
Wire Wire Line
	3950 2750 4450 2750
Wire Wire Line
	3950 2650 4450 2650
Text Label 4050 2950 0    60   ~ 0
SPARE3
Text Label 4050 3050 0    60   ~ 0
SPARE4
Wire Wire Line
	3950 2950 4450 2950
Wire Wire Line
	3950 3050 4450 3050
Text Label 6050 2850 0    60   ~ 0
SPARE2
Wire Wire Line
	5950 2850 6450 2850
Text Label 6050 2650 0    60   ~ 0
SPARE0
Text Label 6050 2750 0    60   ~ 0
SPARE1
Wire Wire Line
	5950 2750 6450 2750
Wire Wire Line
	5950 2650 6450 2650
Text Label 6050 2950 0    60   ~ 0
SPARE3
Text Label 6050 3050 0    60   ~ 0
SPARE4
Wire Wire Line
	5950 2950 6450 2950
Wire Wire Line
	5950 3050 6450 3050
Text Label 8050 2850 0    60   ~ 0
SPARE2
Wire Wire Line
	7950 2850 8450 2850
Text Label 8050 2650 0    60   ~ 0
SPARE0
Text Label 8050 2750 0    60   ~ 0
SPARE1
Wire Wire Line
	7950 2750 8450 2750
Wire Wire Line
	7950 2650 8450 2650
Text Label 8050 2950 0    60   ~ 0
SPARE3
Text Label 8050 3050 0    60   ~ 0
SPARE4
Wire Wire Line
	7950 2950 8450 2950
Wire Wire Line
	7950 3050 8450 3050
Text Label 2050 5500 0    60   ~ 0
SPARE2
Wire Wire Line
	1950 5500 2450 5500
Text Label 2050 5300 0    60   ~ 0
SPARE0
Text Label 2050 5400 0    60   ~ 0
SPARE1
Wire Wire Line
	1950 5400 2450 5400
Wire Wire Line
	1950 5300 2450 5300
Text Label 2050 5600 0    60   ~ 0
SPARE3
Text Label 2050 5700 0    60   ~ 0
SPARE4
Wire Wire Line
	1950 5600 2450 5600
Wire Wire Line
	1950 5700 2450 5700
Text Label 4050 5500 0    60   ~ 0
SPARE2
Wire Wire Line
	3950 5500 4450 5500
Text Label 4050 5300 0    60   ~ 0
SPARE0
Text Label 4050 5400 0    60   ~ 0
SPARE1
Wire Wire Line
	3950 5400 4450 5400
Wire Wire Line
	3950 5300 4450 5300
Text Label 4050 5600 0    60   ~ 0
SPARE3
Text Label 4050 5700 0    60   ~ 0
SPARE4
Wire Wire Line
	3950 5600 4450 5600
Wire Wire Line
	3950 5700 4450 5700
Text Label 6050 5500 0    60   ~ 0
SPARE2
Wire Wire Line
	5950 5500 6450 5500
Text Label 6050 5300 0    60   ~ 0
SPARE0
Text Label 6050 5400 0    60   ~ 0
SPARE1
Wire Wire Line
	5950 5400 6450 5400
Wire Wire Line
	5950 5300 6450 5300
Text Label 6050 5600 0    60   ~ 0
SPARE3
Text Label 6050 5700 0    60   ~ 0
SPARE4
Wire Wire Line
	5950 5600 6450 5600
Wire Wire Line
	5950 5700 6450 5700
Text Label 8050 5500 0    60   ~ 0
SPARE2
Wire Wire Line
	7950 5500 8450 5500
Text Label 8050 5300 0    60   ~ 0
SPARE0
Text Label 8050 5400 0    60   ~ 0
SPARE1
Wire Wire Line
	7950 5400 8450 5400
Wire Wire Line
	7950 5300 8450 5300
Text Label 8050 5600 0    60   ~ 0
SPARE3
Text Label 8050 5700 0    60   ~ 0
SPARE4
Wire Wire Line
	7950 5600 8450 5600
Wire Wire Line
	7950 5700 8450 5700
Text Label 1550 7150 0    60   ~ 0
VIN
Wire Wire Line
	4350 7150 4600 7150
Wire Wire Line
	3600 6650 4100 6650
Wire Wire Line
	800  6400 800  6500
Wire Wire Line
	800  6500 800  6600
Wire Wire Line
	800  6300 800  6400
Wire Wire Line
	2300 7550 2700 7550
Wire Wire Line
	1900 7550 2300 7550
Wire Wire Line
	2700 7550 3300 7550
Wire Wire Line
	3300 7550 3600 7550
Wire Wire Line
	3600 7200 3600 7150
Wire Wire Line
	3600 7550 3600 7500
Connection ~ 3600 7550
Wire Wire Line
	3600 7550 4350 7550
$EndSCHEMATC
