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
Text Label 1200 1100 0    60   ~ 0
A9
Text Label 1200 1000 0    60   ~ 0
A10
Text Label 2200 1000 0    60   ~ 0
A11
Text Label 1200 1200 0    60   ~ 0
A8
Text Label 2200 1200 0    60   ~ 0
A13
Text Label 2200 1300 0    60   ~ 0
A14
Text Label 2200 1400 0    60   ~ 0
A15
Text Label 2200 1100 0    60   ~ 0
A12
Wire Wire Line
	1100 1200 1600 1200
Wire Wire Line
	1100 1100 1600 1100
Wire Wire Line
	1100 1000 1600 1000
Wire Wire Line
	2100 1000 2600 1000
Wire Wire Line
	2100 1100 2600 1100
Wire Wire Line
	2100 1200 2600 1200
Wire Wire Line
	2100 1300 2600 1300
Wire Wire Line
	2100 1400 2600 1400
Text Label 1200 1900 0    60   ~ 0
A1
Text Label 1200 1800 0    60   ~ 0
A2
Text Label 1200 1700 0    60   ~ 0
A3
Text Label 1200 2000 0    60   ~ 0
A0
Text Label 1200 1500 0    60   ~ 0
A5
Text Label 1200 1400 0    60   ~ 0
A6
Text Label 1200 1300 0    60   ~ 0
A7
Text Label 1200 1600 0    60   ~ 0
A4
Wire Wire Line
	1100 2000 1600 2000
Wire Wire Line
	1100 1900 1600 1900
Wire Wire Line
	1100 1800 1600 1800
Wire Wire Line
	1100 1700 1600 1700
Wire Wire Line
	1100 1600 1600 1600
Wire Wire Line
	1100 1500 1600 1500
Wire Wire Line
	1100 1400 1600 1400
Wire Wire Line
	1100 1300 1600 1300
Wire Wire Line
	1100 2100 1600 2100
Text Label 1200 2100 0    60   ~ 0
GND
Text Label 1200 2200 0    60   ~ 0
~RFSH
Text Label 2200 2700 0    60   ~ 0
~HALT
Text Label 1200 2700 0    60   ~ 0
~BUSACK
Text Label 1200 2300 0    60   ~ 0
~M1
Wire Wire Line
	1100 2300 1600 2300
Wire Wire Line
	1100 2200 1600 2200
Wire Wire Line
	2100 2700 2600 2700
Wire Wire Line
	1100 2700 1600 2700
Text Label 1200 2500 0    60   ~ 0
~BUSRQ
Text Label 2200 2600 0    60   ~ 0
~NMI
Text Label 2200 2500 0    60   ~ 0
~INT0
Text Label 1200 2600 0    60   ~ 0
~WAIT
Text Label 1200 2400 0    60   ~ 0
~RESET
Wire Wire Line
	1100 2400 1600 2400
Wire Wire Line
	2100 2600 2600 2600
Wire Wire Line
	2100 2500 2600 2500
Wire Wire Line
	1100 2600 1600 2600
Wire Wire Line
	1100 2500 1600 2500
Text Label 2200 2800 0    60   ~ 0
~MREQ
Text Label 1200 2800 0    60   ~ 0
~WR
Text Label 1200 2900 0    60   ~ 0
~RD
Text Label 2200 2900 0    60   ~ 0
~IORQ
Wire Wire Line
	2100 2900 2600 2900
Wire Wire Line
	2100 2800 2600 2800
Wire Wire Line
	1100 2800 1600 2800
Wire Wire Line
	1100 2900 1600 2900
Text Label 2200 2400 0    60   ~ 0
D1
Text Label 2200 2100 0    60   ~ 0
D2
Text Label 2200 1700 0    60   ~ 0
D3
Text Label 2200 2300 0    60   ~ 0
D0
Text Label 2200 1800 0    60   ~ 0
D5
Text Label 2200 1900 0    60   ~ 0
D6
Text Label 2200 2200 0    60   ~ 0
D7
Text Label 2200 1600 0    60   ~ 0
D4
Wire Wire Line
	2100 2300 2600 2300
Wire Wire Line
	2100 2400 2600 2400
Wire Wire Line
	2100 2100 2600 2100
Wire Wire Line
	2100 1700 2600 1700
Wire Wire Line
	2100 1600 2600 1600
Wire Wire Line
	2100 1800 2600 1800
Wire Wire Line
	2100 1900 2600 1900
Wire Wire Line
	2100 2200 2600 2200
Wire Wire Line
	2100 2000 2600 2000
Text Label 2200 2000 0    60   ~ 0
VCC
Wire Wire Line
	2100 1500 2600 1500
Text Label 2200 1500 0    60   ~ 0
CLK
$Comp
L Z80BCKPLN2-rescue:GND-power #PWR03
U 1 1 603A93CE
P 3600 12150
F 0 "#PWR03" H 3600 12150 30  0001 C CNN
F 1 "GND" H 3600 12080 30  0001 C CNN
F 2 "" H 3600 12150 60  0001 C CNN
F 3 "" H 3600 12150 60  0001 C CNN
	1    3600 12150
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 603A949A
P 3300 12100
F 0 "#FLG02" H 3300 12195 30  0001 C CNN
F 1 "PWR_FLAG" H 3300 12280 30  0000 C CNN
F 2 "" H 3300 12100 60  0001 C CNN
F 3 "" H 3300 12100 60  0001 C CNN
	1    3300 12100
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C1
U 1 1 6039BD2A
P 4350 11900
F 0 "C1" H 4400 12000 50  0000 L CNN
F 1 "22u" H 4400 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4350 11900 60  0001 C CNN
F 3 "" H 4350 11900 60  0001 C CNN
	1    4350 11900
	1    0    0    -1  
$EndComp
$Comp
L device:LED D1
U 1 1 603A5584
P 3600 11900
F 0 "D1" H 3600 12000 50  0000 C CNN
F 1 "LED" H 3600 11800 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 3600 11900 60  0001 C CNN
F 3 "" H 3600 11900 60  0001 C CNN
	1    3600 11900
	0    -1   -1   0   
$EndComp
Connection ~ 3300 12100
Wire Wire Line
	2700 11200 3300 11200
Text Notes 9050 6300 0    60   ~ 0
Note: female 2x25 2.54mm straight PCB connectors
$Comp
L Z80BCKPLN2-rescue:CONN_1-conn P3
U 1 1 603C3AC0
P 950 10950
F 0 "P3" H 1030 10950 40  0000 L CNN
F 1 "CONN_1" H 950 11005 30  0001 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 950 10950 60  0001 C CNN
F 3 "" H 950 10950 60  0001 C CNN
	1    950  10950
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CONN_1-conn P4
U 1 1 603C3BC6
P 950 11050
F 0 "P4" H 1030 11050 40  0000 L CNN
F 1 "CONN_1" H 950 11105 30  0001 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 950 11050 60  0001 C CNN
F 3 "" H 950 11050 60  0001 C CNN
	1    950  11050
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CONN_1-conn P5
U 1 1 603C3BFA
P 950 11150
F 0 "P5" H 1030 11150 40  0000 L CNN
F 1 "CONN_1" H 950 11205 30  0001 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 950 11150 60  0001 C CNN
F 3 "" H 950 11150 60  0001 C CNN
	1    950  11150
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CONN_1-conn P6
U 1 1 603C3C00
P 950 11250
F 0 "P6" H 1030 11250 40  0000 L CNN
F 1 "CONN_1" H 950 11305 30  0001 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 950 11250 60  0001 C CNN
F 3 "" H 950 11250 60  0001 C CNN
	1    950  11250
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  10950 800  11050
$Comp
L Z80BCKPLN2-rescue:GND-power #PWR02
U 1 1 603C3DAD
P 800 11350
F 0 "#PWR02" H 800 11350 30  0001 C CNN
F 1 "GND" H 800 11280 30  0001 C CNN
F 2 "" H 800 11350 60  0001 C CNN
F 3 "" H 800 11350 60  0001 C CNN
	1    800  11350
	1    0    0    -1  
$EndComp
Connection ~ 800  11150
Connection ~ 800  11250
Connection ~ 800  11050
Text Notes 600  10650 0    60   ~ 0
Mounting Holes\n3.7mm diameter
$Comp
L conn:CONN_02X25 J1
U 1 1 61CF2807
P 1850 2200
F 0 "J1" H 1850 3500 60  0000 C CNN
F 1 "Z80-BUS" V 1850 2200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 1850 2200 60  0001 C CNN
F 3 "" H 1850 2200 60  0001 C CNN
	1    1850 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 3200 1600 3200
Text Label 1200 3300 0    60   ~ 0
~IEI-1
Text Label 1200 3100 0    60   ~ 0
GND
Wire Wire Line
	1100 3100 1600 3100
Wire Wire Line
	1100 3000 1600 3000
Text Label 1200 3200 0    60   ~ 0
~TEND0
Wire Wire Line
	1100 3300 1600 3300
Wire Wire Line
	2100 3200 2600 3200
Text Label 2200 3000 0    60   ~ 0
VCC
Wire Wire Line
	2100 3100 2600 3100
Wire Wire Line
	2100 3000 2600 3000
Text Label 2200 3200 0    60   ~ 0
~BAO-1
Wire Wire Line
	2100 3300 2600 3300
Wire Wire Line
	2100 3400 2600 3400
Text Label 1200 3750 0    60   ~ 0
A9
Text Label 1200 3650 0    60   ~ 0
A10
Text Label 2200 3650 0    60   ~ 0
A11
Text Label 1200 3850 0    60   ~ 0
A8
Text Label 2200 3850 0    60   ~ 0
A13
Text Label 2200 3950 0    60   ~ 0
A14
Text Label 2200 4050 0    60   ~ 0
A15
Text Label 2200 3750 0    60   ~ 0
A12
Wire Wire Line
	1100 3850 1600 3850
Wire Wire Line
	1100 3750 1600 3750
Wire Wire Line
	1100 3650 1600 3650
Wire Wire Line
	2100 3650 2600 3650
Wire Wire Line
	2100 3750 2600 3750
Wire Wire Line
	2100 3850 2600 3850
Wire Wire Line
	2100 3950 2600 3950
Wire Wire Line
	2100 4050 2600 4050
Text Label 1200 4550 0    60   ~ 0
A1
Text Label 1200 4450 0    60   ~ 0
A2
Text Label 1200 4350 0    60   ~ 0
A3
Text Label 1200 4650 0    60   ~ 0
A0
Text Label 1200 4150 0    60   ~ 0
A5
Text Label 1200 4050 0    60   ~ 0
A6
Text Label 1200 3950 0    60   ~ 0
A7
Text Label 1200 4250 0    60   ~ 0
A4
Wire Wire Line
	1100 4650 1600 4650
Wire Wire Line
	1100 4550 1600 4550
Wire Wire Line
	1100 4450 1600 4450
Wire Wire Line
	1100 4350 1600 4350
Wire Wire Line
	1100 4250 1600 4250
Wire Wire Line
	1100 4150 1600 4150
Wire Wire Line
	1100 4050 1600 4050
Wire Wire Line
	1100 3950 1600 3950
Wire Wire Line
	1100 4750 1600 4750
Text Label 1200 4750 0    60   ~ 0
GND
Text Label 1200 4850 0    60   ~ 0
~RFSH
Text Label 2200 5350 0    60   ~ 0
~HALT
Text Label 1200 5350 0    60   ~ 0
~BUSACK
Text Label 1200 4950 0    60   ~ 0
~M1
Wire Wire Line
	1100 4950 1600 4950
Wire Wire Line
	1100 4850 1600 4850
Wire Wire Line
	2100 5350 2600 5350
Wire Wire Line
	1100 5350 1600 5350
Text Label 1200 5150 0    60   ~ 0
~BUSRQ
Text Label 2200 5250 0    60   ~ 0
~NMI
Text Label 2200 5150 0    60   ~ 0
~INT0
Text Label 1200 5250 0    60   ~ 0
~WAIT
Text Label 1200 5050 0    60   ~ 0
~RESET
Wire Wire Line
	1100 5050 1600 5050
Wire Wire Line
	2100 5250 2600 5250
Wire Wire Line
	2100 5150 2600 5150
Wire Wire Line
	1100 5250 1600 5250
Wire Wire Line
	1100 5150 1600 5150
Text Label 2200 5450 0    60   ~ 0
~MREQ
Text Label 1200 5450 0    60   ~ 0
~WR
Text Label 1200 5550 0    60   ~ 0
~RD
Text Label 2200 5550 0    60   ~ 0
~IORQ
Wire Wire Line
	2100 5550 2600 5550
Wire Wire Line
	2100 5450 2600 5450
Wire Wire Line
	1100 5450 1600 5450
Wire Wire Line
	1100 5550 1600 5550
Text Label 2200 5050 0    60   ~ 0
D1
Text Label 2200 4750 0    60   ~ 0
D2
Text Label 2200 4350 0    60   ~ 0
D3
Text Label 2200 4950 0    60   ~ 0
D0
Text Label 2200 4450 0    60   ~ 0
D5
Text Label 2200 4550 0    60   ~ 0
D6
Text Label 2200 4850 0    60   ~ 0
D7
Text Label 2200 4250 0    60   ~ 0
D4
Wire Wire Line
	2100 4950 2600 4950
Wire Wire Line
	2100 5050 2600 5050
Wire Wire Line
	2100 4750 2600 4750
Wire Wire Line
	2100 4350 2600 4350
Wire Wire Line
	2100 4250 2600 4250
Wire Wire Line
	2100 4450 2600 4450
Wire Wire Line
	2100 4550 2600 4550
Wire Wire Line
	2100 4850 2600 4850
Wire Wire Line
	2100 4650 2600 4650
Text Label 2200 4650 0    60   ~ 0
VCC
Wire Wire Line
	2100 4150 2600 4150
Text Label 2200 4150 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J9
U 1 1 61CF2808
P 1850 4850
F 0 "J9" H 1850 6150 60  0000 C CNN
F 1 "Z80-BUS" V 1850 4850 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 1850 4850 60  0001 C CNN
F 3 "" H 1850 4850 60  0001 C CNN
	1    1850 4850
	1    0    0    -1  
$EndComp
Text Label 3600 1100 0    60   ~ 0
A9
Text Label 3600 1000 0    60   ~ 0
A10
Text Label 3600 1200 0    60   ~ 0
A8
Wire Wire Line
	3500 1200 4000 1200
Wire Wire Line
	3500 1100 4000 1100
Wire Wire Line
	3500 1000 4000 1000
Text Label 3600 1900 0    60   ~ 0
A1
Text Label 3600 1800 0    60   ~ 0
A2
Text Label 3600 1700 0    60   ~ 0
A3
Text Label 3600 2000 0    60   ~ 0
A0
Text Label 3600 1500 0    60   ~ 0
A5
Text Label 3600 1400 0    60   ~ 0
A6
Text Label 3600 1300 0    60   ~ 0
A7
Text Label 3600 1600 0    60   ~ 0
A4
Wire Wire Line
	3500 2000 4000 2000
Wire Wire Line
	3500 1900 4000 1900
Wire Wire Line
	3500 1800 4000 1800
Wire Wire Line
	3500 1700 4000 1700
Wire Wire Line
	3500 1600 4000 1600
Wire Wire Line
	3500 1500 4000 1500
Wire Wire Line
	3500 1400 4000 1400
Wire Wire Line
	3500 1300 4000 1300
Wire Wire Line
	3500 2100 4000 2100
Text Label 3600 2100 0    60   ~ 0
GND
Text Label 3600 2200 0    60   ~ 0
~RFSH
Text Label 3600 2700 0    60   ~ 0
~BUSACK
Text Label 3600 2300 0    60   ~ 0
~M1
Wire Wire Line
	3500 2300 4000 2300
Wire Wire Line
	3500 2200 4000 2200
Wire Wire Line
	3500 2700 4000 2700
Text Label 3600 2500 0    60   ~ 0
~BUSRQ
Text Label 3600 2600 0    60   ~ 0
~WAIT
Text Label 3600 2400 0    60   ~ 0
~RESET
Wire Wire Line
	3500 2400 4000 2400
Wire Wire Line
	3500 2600 4000 2600
Wire Wire Line
	3500 2500 4000 2500
Text Label 3600 2800 0    60   ~ 0
~WR
Text Label 3600 2900 0    60   ~ 0
~RD
Wire Wire Line
	3500 2800 4000 2800
Wire Wire Line
	3500 2900 4000 2900
$Comp
L conn:CONN_02X25 J2
U 1 1 61CF2809
P 4250 2200
F 0 "J2" H 4250 3500 60  0000 C CNN
F 1 "Z80-BUS" V 4250 2200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 4250 2200 60  0001 C CNN
F 3 "" H 4250 2200 60  0001 C CNN
	1    4250 2200
	1    0    0    -1  
$EndComp
Text Label 3600 3750 0    60   ~ 0
A9
Text Label 3600 3650 0    60   ~ 0
A10
Text Label 4600 3650 0    60   ~ 0
A11
Text Label 3600 3850 0    60   ~ 0
A8
Text Label 4600 3850 0    60   ~ 0
A13
Text Label 4600 3950 0    60   ~ 0
A14
Text Label 4600 4050 0    60   ~ 0
A15
Text Label 4600 3750 0    60   ~ 0
A12
Wire Wire Line
	3500 3850 4000 3850
Wire Wire Line
	3500 3750 4000 3750
Wire Wire Line
	3500 3650 4000 3650
Wire Wire Line
	4500 3650 5000 3650
Wire Wire Line
	4500 3750 5000 3750
Wire Wire Line
	4500 3850 5000 3850
Wire Wire Line
	4500 3950 5000 3950
Wire Wire Line
	4500 4050 5000 4050
Text Label 3600 4550 0    60   ~ 0
A1
Text Label 3600 4450 0    60   ~ 0
A2
Text Label 3600 4350 0    60   ~ 0
A3
Text Label 3600 4650 0    60   ~ 0
A0
Text Label 3600 4150 0    60   ~ 0
A5
Text Label 3600 4050 0    60   ~ 0
A6
Text Label 3600 3950 0    60   ~ 0
A7
Text Label 3600 4250 0    60   ~ 0
A4
Wire Wire Line
	3500 4650 4000 4650
Wire Wire Line
	3500 4550 4000 4550
Wire Wire Line
	3500 4450 4000 4450
Wire Wire Line
	3500 4350 4000 4350
Wire Wire Line
	3500 4250 4000 4250
Wire Wire Line
	3500 4150 4000 4150
Wire Wire Line
	3500 4050 4000 4050
Wire Wire Line
	3500 3950 4000 3950
Wire Wire Line
	3500 4750 4000 4750
Text Label 3600 4750 0    60   ~ 0
GND
Text Label 3600 4850 0    60   ~ 0
~RFSH
Text Label 4600 5350 0    60   ~ 0
~HALT
Text Label 3600 5350 0    60   ~ 0
~BUSACK
Text Label 3600 4950 0    60   ~ 0
~M1
Wire Wire Line
	3500 4950 4000 4950
Wire Wire Line
	3500 4850 4000 4850
Wire Wire Line
	4500 5350 5000 5350
Wire Wire Line
	3500 5350 4000 5350
Text Label 3600 5150 0    60   ~ 0
~BUSRQ
Text Label 4600 5250 0    60   ~ 0
~NMI
Text Label 4600 5150 0    60   ~ 0
~INT0
Text Label 3600 5250 0    60   ~ 0
~WAIT
Text Label 3600 5050 0    60   ~ 0
~RESET
Wire Wire Line
	3500 5050 4000 5050
Wire Wire Line
	4500 5250 5000 5250
Wire Wire Line
	4500 5150 5000 5150
Wire Wire Line
	3500 5250 4000 5250
Wire Wire Line
	3500 5150 4000 5150
Text Label 4600 5450 0    60   ~ 0
~MREQ
Text Label 3600 5450 0    60   ~ 0
~WR
Text Label 3600 5550 0    60   ~ 0
~RD
Text Label 4600 5550 0    60   ~ 0
~IORQ
Wire Wire Line
	4500 5550 5000 5550
Wire Wire Line
	4500 5450 5000 5450
Wire Wire Line
	3500 5450 4000 5450
Wire Wire Line
	3500 5550 4000 5550
Text Label 4600 5050 0    60   ~ 0
D1
Text Label 4600 4750 0    60   ~ 0
D2
Text Label 4600 4350 0    60   ~ 0
D3
Text Label 4600 4950 0    60   ~ 0
D0
Text Label 4600 4450 0    60   ~ 0
D5
Text Label 4600 4550 0    60   ~ 0
D6
Text Label 4600 4850 0    60   ~ 0
D7
Text Label 4600 4250 0    60   ~ 0
D4
Wire Wire Line
	4500 4950 5000 4950
Wire Wire Line
	4500 5050 5000 5050
Wire Wire Line
	4500 4750 5000 4750
Wire Wire Line
	4500 4350 5000 4350
Wire Wire Line
	4500 4250 5000 4250
Wire Wire Line
	4500 4450 5000 4450
Wire Wire Line
	4500 4550 5000 4550
Wire Wire Line
	4500 4850 5000 4850
Wire Wire Line
	4500 4650 5000 4650
Text Label 4600 4650 0    60   ~ 0
VCC
Wire Wire Line
	4500 4150 5000 4150
Text Label 4600 4150 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J10
U 1 1 61CF280A
P 4250 4850
F 0 "J10" H 4250 6150 60  0000 C CNN
F 1 "Z80-BUS" V 4250 4850 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 4250 4850 60  0001 C CNN
F 3 "" H 4250 4850 60  0001 C CNN
	1    4250 4850
	1    0    0    -1  
$EndComp
Text Label 6000 1100 0    60   ~ 0
A9
Text Label 6000 1000 0    60   ~ 0
A10
Text Label 7000 1000 0    60   ~ 0
A11
Text Label 6000 1200 0    60   ~ 0
A8
Text Label 7000 1200 0    60   ~ 0
A13
Text Label 7000 1300 0    60   ~ 0
A14
Text Label 7000 1400 0    60   ~ 0
A15
Text Label 7000 1100 0    60   ~ 0
A12
Wire Wire Line
	5900 1200 6400 1200
Wire Wire Line
	5900 1100 6400 1100
Wire Wire Line
	5900 1000 6400 1000
Wire Wire Line
	6900 1000 7400 1000
Wire Wire Line
	6900 1100 7400 1100
Wire Wire Line
	6900 1200 7400 1200
Wire Wire Line
	6900 1300 7400 1300
Wire Wire Line
	6900 1400 7400 1400
Text Label 6000 1900 0    60   ~ 0
A1
Text Label 6000 1800 0    60   ~ 0
A2
Text Label 6000 1700 0    60   ~ 0
A3
Text Label 6000 2000 0    60   ~ 0
A0
Text Label 6000 1500 0    60   ~ 0
A5
Text Label 6000 1400 0    60   ~ 0
A6
Text Label 6000 1300 0    60   ~ 0
A7
Text Label 6000 1600 0    60   ~ 0
A4
Wire Wire Line
	5900 2000 6400 2000
Wire Wire Line
	5900 1900 6400 1900
Wire Wire Line
	5900 1800 6400 1800
Wire Wire Line
	5900 1700 6400 1700
Wire Wire Line
	5900 1600 6400 1600
Wire Wire Line
	5900 1500 6400 1500
Wire Wire Line
	5900 1400 6400 1400
Wire Wire Line
	5900 1300 6400 1300
Wire Wire Line
	5900 2100 6400 2100
Text Label 6000 2100 0    60   ~ 0
GND
Text Label 6000 2200 0    60   ~ 0
~RFSH
Text Label 7000 2700 0    60   ~ 0
~HALT
Text Label 6000 2700 0    60   ~ 0
~BUSACK
Text Label 6000 2300 0    60   ~ 0
~M1
Wire Wire Line
	5900 2300 6400 2300
Wire Wire Line
	5900 2200 6400 2200
Wire Wire Line
	6900 2700 7400 2700
Wire Wire Line
	5900 2700 6400 2700
Text Label 6000 2500 0    60   ~ 0
~BUSRQ
Text Label 7000 2600 0    60   ~ 0
~NMI
Text Label 7000 2500 0    60   ~ 0
~INT0
Text Label 6000 2600 0    60   ~ 0
~WAIT
Text Label 6000 2400 0    60   ~ 0
~RESET
Wire Wire Line
	5900 2400 6400 2400
Wire Wire Line
	6900 2600 7400 2600
Wire Wire Line
	6900 2500 7400 2500
Wire Wire Line
	5900 2600 6400 2600
Wire Wire Line
	5900 2500 6400 2500
Text Label 7000 2800 0    60   ~ 0
~MREQ
Text Label 6000 2800 0    60   ~ 0
~WR
Text Label 6000 2900 0    60   ~ 0
~RD
Text Label 7000 2900 0    60   ~ 0
~IORQ
Wire Wire Line
	6900 2900 7400 2900
Wire Wire Line
	6900 2800 7400 2800
Wire Wire Line
	5900 2800 6400 2800
Wire Wire Line
	5900 2900 6400 2900
Text Label 7000 2400 0    60   ~ 0
D1
Text Label 7000 2100 0    60   ~ 0
D2
Text Label 7000 1700 0    60   ~ 0
D3
Text Label 7000 2300 0    60   ~ 0
D0
Text Label 7000 1800 0    60   ~ 0
D5
Text Label 7000 1900 0    60   ~ 0
D6
Text Label 7000 2200 0    60   ~ 0
D7
Text Label 7000 1600 0    60   ~ 0
D4
Wire Wire Line
	6900 2300 7400 2300
Wire Wire Line
	6900 2400 7400 2400
Wire Wire Line
	6900 2100 7400 2100
Wire Wire Line
	6900 1700 7400 1700
Wire Wire Line
	6900 1600 7400 1600
Wire Wire Line
	6900 1800 7400 1800
Wire Wire Line
	6900 1900 7400 1900
Wire Wire Line
	6900 2200 7400 2200
Wire Wire Line
	6900 2000 7400 2000
Text Label 7000 2000 0    60   ~ 0
VCC
Wire Wire Line
	6900 1500 7400 1500
Text Label 7000 1500 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J3
U 1 1 61CF280B
P 6650 2200
F 0 "J3" H 6650 3500 60  0000 C CNN
F 1 "Z80-BUS" V 6650 2200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 6650 2200 60  0001 C CNN
F 3 "" H 6650 2200 60  0001 C CNN
	1    6650 2200
	1    0    0    -1  
$EndComp
Text Label 6000 3750 0    60   ~ 0
A9
Text Label 6000 3650 0    60   ~ 0
A10
Text Label 7000 3650 0    60   ~ 0
A11
Text Label 6000 3850 0    60   ~ 0
A8
Text Label 7000 3850 0    60   ~ 0
A13
Text Label 7000 3950 0    60   ~ 0
A14
Text Label 7000 4050 0    60   ~ 0
A15
Text Label 7000 3750 0    60   ~ 0
A12
Wire Wire Line
	5900 3850 6400 3850
Wire Wire Line
	5900 3750 6400 3750
Wire Wire Line
	5900 3650 6400 3650
Wire Wire Line
	6900 3650 7400 3650
Wire Wire Line
	6900 3750 7400 3750
Wire Wire Line
	6900 3850 7400 3850
Wire Wire Line
	6900 3950 7400 3950
Wire Wire Line
	6900 4050 7400 4050
Text Label 6000 4550 0    60   ~ 0
A1
Text Label 6000 4450 0    60   ~ 0
A2
Text Label 6000 4350 0    60   ~ 0
A3
Text Label 6000 4650 0    60   ~ 0
A0
Text Label 6000 4150 0    60   ~ 0
A5
Text Label 6000 4050 0    60   ~ 0
A6
Text Label 6000 3950 0    60   ~ 0
A7
Text Label 6000 4250 0    60   ~ 0
A4
Wire Wire Line
	5900 4650 6400 4650
Wire Wire Line
	5900 4550 6400 4550
Wire Wire Line
	5900 4450 6400 4450
Wire Wire Line
	5900 4350 6400 4350
Wire Wire Line
	5900 4250 6400 4250
Wire Wire Line
	5900 4150 6400 4150
Wire Wire Line
	5900 4050 6400 4050
Wire Wire Line
	5900 3950 6400 3950
Wire Wire Line
	5900 4750 6400 4750
Text Label 6000 4750 0    60   ~ 0
GND
Text Label 6000 4850 0    60   ~ 0
~RFSH
Text Label 7000 5350 0    60   ~ 0
~HALT
Text Label 6000 5350 0    60   ~ 0
~BUSACK
Text Label 6000 4950 0    60   ~ 0
~M1
Wire Wire Line
	5900 4950 6400 4950
Wire Wire Line
	5900 4850 6400 4850
Wire Wire Line
	6900 5350 7400 5350
Wire Wire Line
	5900 5350 6400 5350
Text Label 6000 5150 0    60   ~ 0
~BUSRQ
Text Label 7000 5250 0    60   ~ 0
~NMI
Text Label 7000 5150 0    60   ~ 0
~INT0
Text Label 6000 5250 0    60   ~ 0
~WAIT
Text Label 6000 5050 0    60   ~ 0
~RESET
Wire Wire Line
	5900 5050 6400 5050
Wire Wire Line
	6900 5250 7400 5250
Wire Wire Line
	6900 5150 7400 5150
Wire Wire Line
	5900 5250 6400 5250
Wire Wire Line
	5900 5150 6400 5150
Text Label 7000 5450 0    60   ~ 0
~MREQ
Text Label 6000 5450 0    60   ~ 0
~WR
Text Label 6000 5550 0    60   ~ 0
~RD
Text Label 7000 5550 0    60   ~ 0
~IORQ
Wire Wire Line
	6900 5550 7400 5550
Wire Wire Line
	6900 5450 7400 5450
Wire Wire Line
	5900 5450 6400 5450
Wire Wire Line
	5900 5550 6400 5550
Text Label 7000 5050 0    60   ~ 0
D1
Text Label 7000 4750 0    60   ~ 0
D2
Text Label 7000 4350 0    60   ~ 0
D3
Text Label 7000 4950 0    60   ~ 0
D0
Text Label 7000 4450 0    60   ~ 0
D5
Text Label 7000 4550 0    60   ~ 0
D6
Text Label 7000 4850 0    60   ~ 0
D7
Text Label 7000 4250 0    60   ~ 0
D4
Wire Wire Line
	6900 4950 7400 4950
Wire Wire Line
	6900 5050 7400 5050
Wire Wire Line
	6900 4750 7400 4750
Wire Wire Line
	6900 4350 7400 4350
Wire Wire Line
	6900 4250 7400 4250
Wire Wire Line
	6900 4450 7400 4450
Wire Wire Line
	6900 4550 7400 4550
Wire Wire Line
	6900 4850 7400 4850
Wire Wire Line
	6900 4650 7400 4650
Text Label 7000 4650 0    60   ~ 0
VCC
Wire Wire Line
	6900 4150 7400 4150
Text Label 7000 4150 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J11
U 1 1 61CF280C
P 6650 4850
F 0 "J11" H 6650 6150 60  0000 C CNN
F 1 "Z80-BUS" V 6650 4850 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 6650 4850 60  0001 C CNN
F 3 "" H 6650 4850 60  0001 C CNN
	1    6650 4850
	1    0    0    -1  
$EndComp
Text Label 8400 1100 0    60   ~ 0
A9
Text Label 8400 1000 0    60   ~ 0
A10
Text Label 9400 1000 0    60   ~ 0
A11
Text Label 8400 1200 0    60   ~ 0
A8
Text Label 9400 1200 0    60   ~ 0
A13
Text Label 9400 1300 0    60   ~ 0
A14
Text Label 9400 1400 0    60   ~ 0
A15
Text Label 9400 1100 0    60   ~ 0
A12
Wire Wire Line
	8300 1200 8800 1200
Wire Wire Line
	8300 1100 8800 1100
Wire Wire Line
	8300 1000 8800 1000
Wire Wire Line
	9300 1000 9800 1000
Wire Wire Line
	9300 1100 9800 1100
Wire Wire Line
	9300 1200 9800 1200
Wire Wire Line
	9300 1300 9800 1300
Wire Wire Line
	9300 1400 9800 1400
Text Label 8400 1900 0    60   ~ 0
A1
Text Label 8400 1800 0    60   ~ 0
A2
Text Label 8400 1700 0    60   ~ 0
A3
Text Label 8400 2000 0    60   ~ 0
A0
Text Label 8400 1500 0    60   ~ 0
A5
Text Label 8400 1400 0    60   ~ 0
A6
Text Label 8400 1300 0    60   ~ 0
A7
Text Label 8400 1600 0    60   ~ 0
A4
Wire Wire Line
	8300 2000 8800 2000
Wire Wire Line
	8300 1900 8800 1900
Wire Wire Line
	8300 1800 8800 1800
Wire Wire Line
	8300 1700 8800 1700
Wire Wire Line
	8300 1600 8800 1600
Wire Wire Line
	8300 1500 8800 1500
Wire Wire Line
	8300 1400 8800 1400
Wire Wire Line
	8300 1300 8800 1300
Wire Wire Line
	8300 2100 8800 2100
Text Label 8400 2100 0    60   ~ 0
GND
Text Label 8400 2200 0    60   ~ 0
~RFSH
Text Label 9400 2700 0    60   ~ 0
~HALT
Text Label 8400 2700 0    60   ~ 0
~BUSACK
Text Label 8400 2300 0    60   ~ 0
~M1
Wire Wire Line
	8300 2300 8800 2300
Wire Wire Line
	8300 2200 8800 2200
Wire Wire Line
	9300 2700 9800 2700
Wire Wire Line
	8300 2700 8800 2700
Text Label 8400 2500 0    60   ~ 0
~BUSRQ
Text Label 9400 2600 0    60   ~ 0
~NMI
Text Label 9400 2500 0    60   ~ 0
~INT0
Text Label 8400 2600 0    60   ~ 0
~WAIT
Text Label 8400 2400 0    60   ~ 0
~RESET
Wire Wire Line
	8300 2400 8800 2400
Wire Wire Line
	9300 2600 9800 2600
Wire Wire Line
	9300 2500 9800 2500
Wire Wire Line
	8300 2600 8800 2600
Wire Wire Line
	8300 2500 8800 2500
Text Label 9400 2800 0    60   ~ 0
~MREQ
Text Label 8400 2800 0    60   ~ 0
~WR
Text Label 8400 2900 0    60   ~ 0
~RD
Text Label 9400 2900 0    60   ~ 0
~IORQ
Wire Wire Line
	9300 2900 9800 2900
Wire Wire Line
	9300 2800 9800 2800
Wire Wire Line
	8300 2800 8800 2800
Wire Wire Line
	8300 2900 8800 2900
Text Label 9400 2400 0    60   ~ 0
D1
Text Label 9400 2100 0    60   ~ 0
D2
Text Label 9400 1700 0    60   ~ 0
D3
Text Label 9400 2300 0    60   ~ 0
D0
Text Label 9400 1800 0    60   ~ 0
D5
Text Label 9400 1900 0    60   ~ 0
D6
Text Label 9400 2200 0    60   ~ 0
D7
Text Label 9400 1600 0    60   ~ 0
D4
Wire Wire Line
	9300 2300 9800 2300
Wire Wire Line
	9300 2400 9800 2400
Wire Wire Line
	9300 2100 9800 2100
Wire Wire Line
	9300 1700 9800 1700
Wire Wire Line
	9300 1600 9800 1600
Wire Wire Line
	9300 1800 9800 1800
Wire Wire Line
	9300 1900 9800 1900
Wire Wire Line
	9300 2200 9800 2200
Wire Wire Line
	9300 2000 9800 2000
Text Label 9400 2000 0    60   ~ 0
VCC
Wire Wire Line
	9300 1500 9800 1500
Text Label 9400 1500 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J4
U 1 1 00000603
P 9050 2200
F 0 "J4" H 9050 3500 60  0000 C CNN
F 1 "Z80-BUS" V 9050 2200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 9050 2200 60  0001 C CNN
F 3 "" H 9050 2200 60  0001 C CNN
	1    9050 2200
	1    0    0    -1  
$EndComp
Text Label 8400 3750 0    60   ~ 0
A9
Text Label 8400 3650 0    60   ~ 0
A10
Text Label 9400 3650 0    60   ~ 0
A11
Text Label 8400 3850 0    60   ~ 0
A8
Text Label 9400 3850 0    60   ~ 0
A13
Text Label 9400 3950 0    60   ~ 0
A14
Text Label 9400 4050 0    60   ~ 0
A15
Text Label 9400 3750 0    60   ~ 0
A12
Wire Wire Line
	8300 3850 8800 3850
Wire Wire Line
	8300 3750 8800 3750
Wire Wire Line
	8300 3650 8800 3650
Wire Wire Line
	9300 3650 9800 3650
Wire Wire Line
	9300 3750 9800 3750
Wire Wire Line
	9300 3850 9800 3850
Wire Wire Line
	9300 3950 9800 3950
Wire Wire Line
	9300 4050 9800 4050
Text Label 8400 4550 0    60   ~ 0
A1
Text Label 8400 4450 0    60   ~ 0
A2
Text Label 8400 4350 0    60   ~ 0
A3
Text Label 8400 4650 0    60   ~ 0
A0
Text Label 8400 4150 0    60   ~ 0
A5
Text Label 8400 4050 0    60   ~ 0
A6
Text Label 8400 3950 0    60   ~ 0
A7
Text Label 8400 4250 0    60   ~ 0
A4
Wire Wire Line
	8300 4650 8800 4650
Wire Wire Line
	8300 4550 8800 4550
Wire Wire Line
	8300 4450 8800 4450
Wire Wire Line
	8300 4350 8800 4350
Wire Wire Line
	8300 4250 8800 4250
Wire Wire Line
	8300 4150 8800 4150
Wire Wire Line
	8300 4050 8800 4050
Wire Wire Line
	8300 3950 8800 3950
Wire Wire Line
	8300 4750 8800 4750
Text Label 8400 4750 0    60   ~ 0
GND
Text Label 8400 4850 0    60   ~ 0
~RFSH
Text Label 9400 5350 0    60   ~ 0
~HALT
Text Label 8400 5350 0    60   ~ 0
~BUSACK
Text Label 8400 4950 0    60   ~ 0
~M1
Wire Wire Line
	8300 4950 8800 4950
Wire Wire Line
	8300 4850 8800 4850
Wire Wire Line
	9300 5350 9800 5350
Wire Wire Line
	8300 5350 8800 5350
Text Label 8400 5150 0    60   ~ 0
~BUSRQ
Text Label 9400 5250 0    60   ~ 0
~NMI
Text Label 9400 5150 0    60   ~ 0
~INT0
Text Label 8400 5250 0    60   ~ 0
~WAIT
Text Label 8400 5050 0    60   ~ 0
~RESET
Wire Wire Line
	8300 5050 8800 5050
Wire Wire Line
	9300 5250 9800 5250
Wire Wire Line
	9300 5150 9800 5150
Wire Wire Line
	8300 5250 8800 5250
Wire Wire Line
	8300 5150 8800 5150
Text Label 9400 5450 0    60   ~ 0
~MREQ
Text Label 8400 5450 0    60   ~ 0
~WR
Text Label 8400 5550 0    60   ~ 0
~RD
Text Label 9400 5550 0    60   ~ 0
~IORQ
Wire Wire Line
	9300 5550 9800 5550
Wire Wire Line
	9300 5450 9800 5450
Wire Wire Line
	8300 5450 8800 5450
Wire Wire Line
	8300 5550 8800 5550
Text Label 9400 5050 0    60   ~ 0
D1
Text Label 9400 4750 0    60   ~ 0
D2
Text Label 9400 4350 0    60   ~ 0
D3
Text Label 9400 4950 0    60   ~ 0
D0
Text Label 9400 4450 0    60   ~ 0
D5
Text Label 9400 4550 0    60   ~ 0
D6
Text Label 9400 4850 0    60   ~ 0
D7
Text Label 9400 4250 0    60   ~ 0
D4
Wire Wire Line
	9300 4950 9800 4950
Wire Wire Line
	9300 5050 9800 5050
Wire Wire Line
	9300 4750 9800 4750
Wire Wire Line
	9300 4350 9800 4350
Wire Wire Line
	9300 4250 9800 4250
Wire Wire Line
	9300 4450 9800 4450
Wire Wire Line
	9300 4550 9800 4550
Wire Wire Line
	9300 4850 9800 4850
Wire Wire Line
	9300 4650 9800 4650
Text Label 9400 4650 0    60   ~ 0
VCC
Wire Wire Line
	9300 4150 9800 4150
Text Label 9400 4150 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J12
U 1 1 61CF2806
P 9050 4850
F 0 "J12" H 9050 6150 60  0000 C CNN
F 1 "Z80-BUS" V 9050 4850 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 9050 4850 60  0001 C CNN
F 3 "" H 9050 4850 60  0001 C CNN
	1    9050 4850
	1    0    0    -1  
$EndComp
Text Label 3600 3300 0    60   ~ 0
~IEI-2
Wire Wire Line
	3500 3200 4000 3200
Text Label 3600 3000 0    60   ~ 0
~DREQ0
Text Label 3600 3100 0    60   ~ 0
GND
Wire Wire Line
	3500 3100 4000 3100
Wire Wire Line
	3500 3000 4000 3000
Text Label 3600 3200 0    60   ~ 0
~TEND0
Text Label 3600 3400 0    60   ~ 0
~IEO-2
Wire Wire Line
	3500 3300 4000 3300
Wire Wire Line
	3500 3400 4000 3400
Text Label 6000 3200 0    60   ~ 0
~TEND0
Wire Wire Line
	5900 3200 6400 3200
Text Label 6000 3000 0    60   ~ 0
~DREQ0
Text Label 6000 3100 0    60   ~ 0
GND
Wire Wire Line
	5900 3100 6400 3100
Wire Wire Line
	5900 3000 6400 3000
Text Label 6000 3300 0    60   ~ 0
~IEI-3
Text Label 6000 3400 0    60   ~ 0
~IEO-3
Wire Wire Line
	5900 3300 6400 3300
Wire Wire Line
	5900 3400 6400 3400
Text Label 8400 3200 0    60   ~ 0
~TEND0
Wire Wire Line
	8300 3200 8800 3200
Text Label 8400 3000 0    60   ~ 0
~DREQ0
Text Label 8400 3100 0    60   ~ 0
GND
Wire Wire Line
	8300 3100 8800 3100
Wire Wire Line
	8300 3000 8800 3000
Text Label 8400 3300 0    60   ~ 0
~IEI-4
Text Label 8400 3400 0    60   ~ 0
~IEO-4
Wire Wire Line
	8300 3300 8800 3300
Wire Wire Line
	8300 3400 8800 3400
Text Label 1200 5850 0    60   ~ 0
~TEND0
Wire Wire Line
	1100 5850 1600 5850
Text Label 1200 5650 0    60   ~ 0
~DREQ0
Text Label 1200 5750 0    60   ~ 0
GND
Wire Wire Line
	1100 5750 1600 5750
Wire Wire Line
	1100 5650 1600 5650
Wire Wire Line
	1100 5950 1600 5950
Wire Wire Line
	1100 6050 1600 6050
Text Label 3600 5850 0    60   ~ 0
~TEND0
Wire Wire Line
	3500 5850 4000 5850
Text Label 3600 5650 0    60   ~ 0
~DREQ0
Text Label 3600 5750 0    60   ~ 0
GND
Wire Wire Line
	3500 5750 4000 5750
Wire Wire Line
	3500 5650 4000 5650
Wire Wire Line
	3500 5950 4000 5950
Wire Wire Line
	3500 6050 4000 6050
Text Label 6000 5850 0    60   ~ 0
~TEND0
Wire Wire Line
	5900 5850 6400 5850
Text Label 6000 5650 0    60   ~ 0
~DREQ0
Text Label 6000 5750 0    60   ~ 0
GND
Wire Wire Line
	5900 5750 6400 5750
Wire Wire Line
	5900 5650 6400 5650
Text Label 6000 5950 0    60   ~ 0
~IEI-11
Text Label 6000 6050 0    60   ~ 0
~IEO-11
Wire Wire Line
	5900 5950 6400 5950
Wire Wire Line
	5900 6050 6400 6050
Text Label 8400 5850 0    60   ~ 0
~TEND0
Wire Wire Line
	8300 5850 8800 5850
Text Label 8400 5650 0    60   ~ 0
~DREQ0
Text Label 8400 5750 0    60   ~ 0
GND
Wire Wire Line
	8300 5750 8800 5750
Wire Wire Line
	8300 5650 8800 5650
Text Label 8400 5950 0    60   ~ 0
~IEI-12
Text Label 8400 6050 0    60   ~ 0
~IEO-12
Wire Wire Line
	8300 5950 8800 5950
Wire Wire Line
	8300 6050 8800 6050
Text Label 7000 3200 0    60   ~ 0
~BAO-3
Wire Wire Line
	6900 3200 7400 3200
Text Label 7000 3000 0    60   ~ 0
VCC
Text Label 7000 3100 0    60   ~ 0
~BAI-3
Wire Wire Line
	6900 3100 7400 3100
Wire Wire Line
	6900 3000 7400 3000
Text Label 7000 3300 0    60   ~ 0
I2C_RX
Text Label 7000 3400 0    60   ~ 0
I2C_TX
Wire Wire Line
	6900 3300 7400 3300
Wire Wire Line
	6900 3400 7400 3400
Text Label 9400 3200 0    60   ~ 0
~BAO-4
Wire Wire Line
	9300 3200 9800 3200
Text Label 9400 3000 0    60   ~ 0
VCC
Text Label 9400 3100 0    60   ~ 0
~BAI-4
Wire Wire Line
	9300 3100 9800 3100
Wire Wire Line
	9300 3000 9800 3000
Text Label 9400 3300 0    60   ~ 0
I2C_RX
Text Label 9400 3400 0    60   ~ 0
I2C_TX
Wire Wire Line
	9300 3300 9800 3300
Wire Wire Line
	9300 3400 9800 3400
Wire Wire Line
	2100 5850 2600 5850
Text Label 2200 5650 0    60   ~ 0
VCC
Wire Wire Line
	2100 5750 2600 5750
Wire Wire Line
	2100 5650 2600 5650
Text Label 2200 5950 0    60   ~ 0
I2C_RX
Text Label 2200 6050 0    60   ~ 0
I2C_TX
Wire Wire Line
	2100 5950 2600 5950
Wire Wire Line
	2100 6050 2600 6050
Wire Wire Line
	4500 5850 5000 5850
Text Label 4600 5650 0    60   ~ 0
VCC
Wire Wire Line
	4500 5750 5000 5750
Wire Wire Line
	4500 5650 5000 5650
Text Label 4600 5950 0    60   ~ 0
I2C_RX
Text Label 4600 6050 0    60   ~ 0
I2C_TX
Wire Wire Line
	4500 5950 5000 5950
Wire Wire Line
	4500 6050 5000 6050
Text Label 7000 5850 0    60   ~ 0
~BAO-11
Wire Wire Line
	6900 5850 7400 5850
Text Label 7000 5650 0    60   ~ 0
VCC
Text Label 7000 5750 0    60   ~ 0
~BAI-11
Wire Wire Line
	6900 5750 7400 5750
Wire Wire Line
	6900 5650 7400 5650
Text Label 7000 5950 0    60   ~ 0
I2C_RX
Text Label 7000 6050 0    60   ~ 0
I2C_TX
Wire Wire Line
	6900 5950 7400 5950
Wire Wire Line
	6900 6050 7400 6050
Text Label 9400 5850 0    60   ~ 0
~BAO-12
Wire Wire Line
	9300 5850 9800 5850
Text Label 9400 5650 0    60   ~ 0
VCC
Text Label 9400 5750 0    60   ~ 0
~BAI-12
Wire Wire Line
	9300 5750 9800 5750
Wire Wire Line
	9300 5650 9800 5650
Text Label 9400 5950 0    60   ~ 0
I2C_RX
Text Label 9400 6050 0    60   ~ 0
I2C_TX
Wire Wire Line
	9300 5950 9800 5950
Wire Wire Line
	9300 6050 9800 6050
Wire Wire Line
	800  11150 800  11250
Wire Wire Line
	800  11250 800  11350
Wire Wire Line
	800  11050 800  11150
Wire Wire Line
	3300 12100 3600 12100
Wire Wire Line
	3600 11750 3600 11700
Wire Wire Line
	3600 12100 3600 12050
Connection ~ 3600 12100
Wire Wire Line
	3600 12100 4350 12100
Text Label 10800 1100 0    60   ~ 0
A9
Text Label 10800 1000 0    60   ~ 0
A10
Text Label 11800 1000 0    60   ~ 0
A11
Text Label 10800 1200 0    60   ~ 0
A8
Text Label 11800 1200 0    60   ~ 0
A13
Text Label 11800 1300 0    60   ~ 0
A14
Text Label 11800 1400 0    60   ~ 0
A15
Text Label 11800 1100 0    60   ~ 0
A12
Wire Wire Line
	10700 1200 11200 1200
Wire Wire Line
	10700 1100 11200 1100
Wire Wire Line
	10700 1000 11200 1000
Wire Wire Line
	11700 1000 12200 1000
Wire Wire Line
	11700 1100 12200 1100
Wire Wire Line
	11700 1200 12200 1200
Wire Wire Line
	11700 1300 12200 1300
Wire Wire Line
	11700 1400 12200 1400
Text Label 10800 1900 0    60   ~ 0
A1
Text Label 10800 1800 0    60   ~ 0
A2
Text Label 10800 1700 0    60   ~ 0
A3
Text Label 10800 2000 0    60   ~ 0
A0
Text Label 10800 1500 0    60   ~ 0
A5
Text Label 10800 1400 0    60   ~ 0
A6
Text Label 10800 1300 0    60   ~ 0
A7
Text Label 10800 1600 0    60   ~ 0
A4
Wire Wire Line
	10700 2000 11200 2000
Wire Wire Line
	10700 1900 11200 1900
Wire Wire Line
	10700 1800 11200 1800
Wire Wire Line
	10700 1700 11200 1700
Wire Wire Line
	10700 1600 11200 1600
Wire Wire Line
	10700 1500 11200 1500
Wire Wire Line
	10700 1400 11200 1400
Wire Wire Line
	10700 1300 11200 1300
Wire Wire Line
	10700 2100 11200 2100
Text Label 10800 2100 0    60   ~ 0
GND
Text Label 10800 2200 0    60   ~ 0
~RFSH
Text Label 11800 2700 0    60   ~ 0
~HALT
Text Label 10800 2700 0    60   ~ 0
~BUSACK
Text Label 10800 2300 0    60   ~ 0
~M1
Wire Wire Line
	10700 2300 11200 2300
Wire Wire Line
	10700 2200 11200 2200
Wire Wire Line
	11700 2700 12200 2700
Wire Wire Line
	10700 2700 11200 2700
Text Label 10800 2500 0    60   ~ 0
~BUSRQ
Text Label 11800 2600 0    60   ~ 0
~NMI
Text Label 11800 2500 0    60   ~ 0
~INT0
Text Label 10800 2600 0    60   ~ 0
~WAIT
Text Label 10800 2400 0    60   ~ 0
~RESET
Wire Wire Line
	10700 2400 11200 2400
Wire Wire Line
	11700 2600 12200 2600
Wire Wire Line
	11700 2500 12200 2500
Wire Wire Line
	10700 2600 11200 2600
Wire Wire Line
	10700 2500 11200 2500
Text Label 11800 2800 0    60   ~ 0
~MREQ
Text Label 10800 2800 0    60   ~ 0
~WR
Text Label 10800 2900 0    60   ~ 0
~RD
Text Label 11800 2900 0    60   ~ 0
~IORQ
Wire Wire Line
	11700 2900 12200 2900
Wire Wire Line
	11700 2800 12200 2800
Wire Wire Line
	10700 2800 11200 2800
Wire Wire Line
	10700 2900 11200 2900
Text Label 11800 2400 0    60   ~ 0
D1
Text Label 11800 2100 0    60   ~ 0
D2
Text Label 11800 1700 0    60   ~ 0
D3
Text Label 11800 2300 0    60   ~ 0
D0
Text Label 11800 1800 0    60   ~ 0
D5
Text Label 11800 1900 0    60   ~ 0
D6
Text Label 11800 2200 0    60   ~ 0
D7
Text Label 11800 1600 0    60   ~ 0
D4
Wire Wire Line
	11700 2300 12200 2300
Wire Wire Line
	11700 2400 12200 2400
Wire Wire Line
	11700 2100 12200 2100
Wire Wire Line
	11700 1700 12200 1700
Wire Wire Line
	11700 1600 12200 1600
Wire Wire Line
	11700 1800 12200 1800
Wire Wire Line
	11700 1900 12200 1900
Wire Wire Line
	11700 2200 12200 2200
Wire Wire Line
	11700 2000 12200 2000
Text Label 11800 2000 0    60   ~ 0
VCC
Wire Wire Line
	11700 1500 12200 1500
Text Label 11800 1500 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J5
U 1 1 00061717
P 11450 2200
F 0 "J5" H 11450 3500 60  0000 C CNN
F 1 "Z80-BUS" V 11450 2200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 11450 2200 60  0001 C CNN
F 3 "" H 11450 2200 60  0001 C CNN
	1    11450 2200
	1    0    0    -1  
$EndComp
Text Label 10800 3200 0    60   ~ 0
~TEND0
Wire Wire Line
	10700 3200 11200 3200
Text Label 10800 3000 0    60   ~ 0
~DREQ0
Text Label 10800 3100 0    60   ~ 0
GND
Wire Wire Line
	10700 3100 11200 3100
Wire Wire Line
	10700 3000 11200 3000
Text Label 10800 3300 0    60   ~ 0
~IEI-5
Text Label 10800 3400 0    60   ~ 0
~IEO-5
Wire Wire Line
	10700 3300 11200 3300
Wire Wire Line
	10700 3400 11200 3400
Text Label 11800 3200 0    60   ~ 0
~BAO-5
Wire Wire Line
	11700 3200 12200 3200
Text Label 11800 3000 0    60   ~ 0
VCC
Text Label 11800 3100 0    60   ~ 0
~BAI-5
Wire Wire Line
	11700 3100 12200 3100
Wire Wire Line
	11700 3000 12200 3000
Text Label 11800 3300 0    60   ~ 0
I2C_RX
Text Label 11800 3400 0    60   ~ 0
I2C_TX
Wire Wire Line
	11700 3300 12200 3300
Wire Wire Line
	11700 3400 12200 3400
Text Label 10800 3750 0    60   ~ 0
A9
Text Label 10800 3650 0    60   ~ 0
A10
Text Label 11800 3650 0    60   ~ 0
A11
Text Label 10800 3850 0    60   ~ 0
A8
Text Label 11800 3850 0    60   ~ 0
A13
Text Label 11800 3950 0    60   ~ 0
A14
Text Label 11800 4050 0    60   ~ 0
A15
Text Label 11800 3750 0    60   ~ 0
A12
Wire Wire Line
	10700 3850 11200 3850
Wire Wire Line
	10700 3750 11200 3750
Wire Wire Line
	10700 3650 11200 3650
Wire Wire Line
	11700 3650 12200 3650
Wire Wire Line
	11700 3750 12200 3750
Wire Wire Line
	11700 3850 12200 3850
Wire Wire Line
	11700 3950 12200 3950
Wire Wire Line
	11700 4050 12200 4050
Text Label 10800 4550 0    60   ~ 0
A1
Text Label 10800 4450 0    60   ~ 0
A2
Text Label 10800 4350 0    60   ~ 0
A3
Text Label 10800 4650 0    60   ~ 0
A0
Text Label 10800 4150 0    60   ~ 0
A5
Text Label 10800 4050 0    60   ~ 0
A6
Text Label 10800 3950 0    60   ~ 0
A7
Text Label 10800 4250 0    60   ~ 0
A4
Wire Wire Line
	10700 4650 11200 4650
Wire Wire Line
	10700 4550 11200 4550
Wire Wire Line
	10700 4450 11200 4450
Wire Wire Line
	10700 4350 11200 4350
Wire Wire Line
	10700 4250 11200 4250
Wire Wire Line
	10700 4150 11200 4150
Wire Wire Line
	10700 4050 11200 4050
Wire Wire Line
	10700 3950 11200 3950
Wire Wire Line
	10700 4750 11200 4750
Text Label 10800 4750 0    60   ~ 0
GND
Text Label 10800 4850 0    60   ~ 0
~RFSH
Text Label 11800 5350 0    60   ~ 0
~HALT
Text Label 10800 5350 0    60   ~ 0
~BUSACK
Text Label 10800 4950 0    60   ~ 0
~M1
Wire Wire Line
	10700 4950 11200 4950
Wire Wire Line
	10700 4850 11200 4850
Wire Wire Line
	11700 5350 12200 5350
Wire Wire Line
	10700 5350 11200 5350
Text Label 10800 5150 0    60   ~ 0
~BUSRQ
Text Label 11800 5250 0    60   ~ 0
~NMI
Text Label 11800 5150 0    60   ~ 0
~INT0
Text Label 10800 5250 0    60   ~ 0
~WAIT
Text Label 10800 5050 0    60   ~ 0
~RESET
Wire Wire Line
	10700 5050 11200 5050
Wire Wire Line
	11700 5250 12200 5250
Wire Wire Line
	11700 5150 12200 5150
Wire Wire Line
	10700 5250 11200 5250
Wire Wire Line
	10700 5150 11200 5150
Text Label 11800 5450 0    60   ~ 0
~MREQ
Text Label 10800 5450 0    60   ~ 0
~WR
Text Label 10800 5550 0    60   ~ 0
~RD
Text Label 11800 5550 0    60   ~ 0
~IORQ
Wire Wire Line
	11700 5550 12200 5550
Wire Wire Line
	11700 5450 12200 5450
Wire Wire Line
	10700 5450 11200 5450
Wire Wire Line
	10700 5550 11200 5550
Text Label 11800 5050 0    60   ~ 0
D1
Text Label 11800 4750 0    60   ~ 0
D2
Text Label 11800 4350 0    60   ~ 0
D3
Text Label 11800 4950 0    60   ~ 0
D0
Text Label 11800 4450 0    60   ~ 0
D5
Text Label 11800 4550 0    60   ~ 0
D6
Text Label 11800 4850 0    60   ~ 0
D7
Text Label 11800 4250 0    60   ~ 0
D4
Wire Wire Line
	11700 4950 12200 4950
Wire Wire Line
	11700 5050 12200 5050
Wire Wire Line
	11700 4750 12200 4750
Wire Wire Line
	11700 4350 12200 4350
Wire Wire Line
	11700 4250 12200 4250
Wire Wire Line
	11700 4450 12200 4450
Wire Wire Line
	11700 4550 12200 4550
Wire Wire Line
	11700 4850 12200 4850
Wire Wire Line
	11700 4650 12200 4650
Text Label 11800 4650 0    60   ~ 0
VCC
Wire Wire Line
	11700 4150 12200 4150
Text Label 11800 4150 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J13
U 1 1 61717DF6
P 11450 4850
F 0 "J13" H 11450 6150 60  0000 C CNN
F 1 "Z80-BUS" V 11450 4850 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 11450 4850 60  0001 C CNN
F 3 "" H 11450 4850 60  0001 C CNN
	1    11450 4850
	1    0    0    -1  
$EndComp
Text Label 13200 1100 0    60   ~ 0
A9
Text Label 13200 1000 0    60   ~ 0
A10
Text Label 14200 1000 0    60   ~ 0
A11
Text Label 13200 1200 0    60   ~ 0
A8
Text Label 14200 1200 0    60   ~ 0
A13
Text Label 14200 1300 0    60   ~ 0
A14
Text Label 14200 1400 0    60   ~ 0
A15
Text Label 14200 1100 0    60   ~ 0
A12
Wire Wire Line
	13100 1200 13600 1200
Wire Wire Line
	13100 1100 13600 1100
Wire Wire Line
	13100 1000 13600 1000
Wire Wire Line
	14100 1000 14600 1000
Wire Wire Line
	14100 1100 14600 1100
Wire Wire Line
	14100 1200 14600 1200
Wire Wire Line
	14100 1300 14600 1300
Wire Wire Line
	14100 1400 14600 1400
Text Label 13200 1900 0    60   ~ 0
A1
Text Label 13200 1800 0    60   ~ 0
A2
Text Label 13200 1700 0    60   ~ 0
A3
Text Label 13200 2000 0    60   ~ 0
A0
Text Label 13200 1500 0    60   ~ 0
A5
Text Label 13200 1400 0    60   ~ 0
A6
Text Label 13200 1300 0    60   ~ 0
A7
Text Label 13200 1600 0    60   ~ 0
A4
Wire Wire Line
	13100 2000 13600 2000
Wire Wire Line
	13100 1900 13600 1900
Wire Wire Line
	13100 1800 13600 1800
Wire Wire Line
	13100 1700 13600 1700
Wire Wire Line
	13100 1600 13600 1600
Wire Wire Line
	13100 1500 13600 1500
Wire Wire Line
	13100 1400 13600 1400
Wire Wire Line
	13100 1300 13600 1300
Wire Wire Line
	13100 2100 13600 2100
Text Label 13200 2100 0    60   ~ 0
GND
Text Label 13200 2200 0    60   ~ 0
~RFSH
Text Label 14200 2700 0    60   ~ 0
~HALT
Text Label 13200 2700 0    60   ~ 0
~BUSACK
Text Label 13200 2300 0    60   ~ 0
~M1
Wire Wire Line
	13100 2300 13600 2300
Wire Wire Line
	13100 2200 13600 2200
Wire Wire Line
	14100 2700 14600 2700
Wire Wire Line
	13100 2700 13600 2700
Text Label 13200 2500 0    60   ~ 0
~BUSRQ
Text Label 14200 2600 0    60   ~ 0
~NMI
Text Label 14200 2500 0    60   ~ 0
~INT0
Text Label 13200 2600 0    60   ~ 0
~WAIT
Text Label 13200 2400 0    60   ~ 0
~RESET
Wire Wire Line
	13100 2400 13600 2400
Wire Wire Line
	14100 2600 14600 2600
Wire Wire Line
	14100 2500 14600 2500
Wire Wire Line
	13100 2600 13600 2600
Wire Wire Line
	13100 2500 13600 2500
Text Label 14200 2800 0    60   ~ 0
~MREQ
Text Label 13200 2800 0    60   ~ 0
~WR
Text Label 13200 2900 0    60   ~ 0
~RD
Text Label 14200 2900 0    60   ~ 0
~IORQ
Wire Wire Line
	14100 2900 14600 2900
Wire Wire Line
	14100 2800 14600 2800
Wire Wire Line
	13100 2800 13600 2800
Wire Wire Line
	13100 2900 13600 2900
Text Label 14200 2400 0    60   ~ 0
D1
Text Label 14200 2100 0    60   ~ 0
D2
Text Label 14200 1700 0    60   ~ 0
D3
Text Label 14200 2300 0    60   ~ 0
D0
Text Label 14200 1800 0    60   ~ 0
D5
Text Label 14200 1900 0    60   ~ 0
D6
Text Label 14200 2200 0    60   ~ 0
D7
Text Label 14200 1600 0    60   ~ 0
D4
Wire Wire Line
	14100 2300 14600 2300
Wire Wire Line
	14100 2400 14600 2400
Wire Wire Line
	14100 2100 14600 2100
Wire Wire Line
	14100 1700 14600 1700
Wire Wire Line
	14100 1600 14600 1600
Wire Wire Line
	14100 1800 14600 1800
Wire Wire Line
	14100 1900 14600 1900
Wire Wire Line
	14100 2200 14600 2200
Wire Wire Line
	14100 2000 14600 2000
Text Label 14200 2000 0    60   ~ 0
VCC
Wire Wire Line
	14100 1500 14600 1500
Text Label 14200 1500 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J6
U 1 1 61717E50
P 13850 2200
F 0 "J6" H 13850 3500 60  0000 C CNN
F 1 "Z80-BUS" V 13850 2200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 13850 2200 60  0001 C CNN
F 3 "" H 13850 2200 60  0001 C CNN
	1    13850 2200
	1    0    0    -1  
$EndComp
Text Label 13200 3750 0    60   ~ 0
A9
Text Label 13200 3650 0    60   ~ 0
A10
Text Label 14200 3650 0    60   ~ 0
A11
Text Label 13200 3850 0    60   ~ 0
A8
Text Label 14200 3850 0    60   ~ 0
A13
Text Label 14200 3950 0    60   ~ 0
A14
Text Label 14200 4050 0    60   ~ 0
A15
Text Label 14200 3750 0    60   ~ 0
A12
Wire Wire Line
	13100 3850 13600 3850
Wire Wire Line
	13100 3750 13600 3750
Wire Wire Line
	13100 3650 13600 3650
Wire Wire Line
	14100 3650 14600 3650
Wire Wire Line
	14100 3750 14600 3750
Wire Wire Line
	14100 3850 14600 3850
Wire Wire Line
	14100 3950 14600 3950
Wire Wire Line
	14100 4050 14600 4050
Text Label 13200 4550 0    60   ~ 0
A1
Text Label 13200 4450 0    60   ~ 0
A2
Text Label 13200 4350 0    60   ~ 0
A3
Text Label 13200 4650 0    60   ~ 0
A0
Text Label 13200 4150 0    60   ~ 0
A5
Text Label 13200 4050 0    60   ~ 0
A6
Text Label 13200 3950 0    60   ~ 0
A7
Text Label 13200 4250 0    60   ~ 0
A4
Wire Wire Line
	13100 4650 13600 4650
Wire Wire Line
	13100 4550 13600 4550
Wire Wire Line
	13100 4450 13600 4450
Wire Wire Line
	13100 4350 13600 4350
Wire Wire Line
	13100 4250 13600 4250
Wire Wire Line
	13100 4150 13600 4150
Wire Wire Line
	13100 4050 13600 4050
Wire Wire Line
	13100 3950 13600 3950
Wire Wire Line
	13100 4750 13600 4750
Text Label 13200 4750 0    60   ~ 0
GND
Text Label 13200 4850 0    60   ~ 0
~RFSH
Text Label 14200 5350 0    60   ~ 0
~HALT
Text Label 13200 5350 0    60   ~ 0
~BUSACK
Text Label 13200 4950 0    60   ~ 0
~M1
Wire Wire Line
	13100 4950 13600 4950
Wire Wire Line
	13100 4850 13600 4850
Wire Wire Line
	14100 5350 14600 5350
Wire Wire Line
	13100 5350 13600 5350
Text Label 13200 5150 0    60   ~ 0
~BUSRQ
Text Label 14200 5250 0    60   ~ 0
~NMI
Text Label 14200 5150 0    60   ~ 0
~INT0
Text Label 13200 5250 0    60   ~ 0
~WAIT
Text Label 13200 5050 0    60   ~ 0
~RESET
Wire Wire Line
	13100 5050 13600 5050
Wire Wire Line
	14100 5250 14600 5250
Wire Wire Line
	14100 5150 14600 5150
Wire Wire Line
	13100 5250 13600 5250
Wire Wire Line
	13100 5150 13600 5150
Text Label 14200 5450 0    60   ~ 0
~MREQ
Text Label 13200 5450 0    60   ~ 0
~WR
Text Label 13200 5550 0    60   ~ 0
~RD
Text Label 14200 5550 0    60   ~ 0
~IORQ
Wire Wire Line
	14100 5550 14600 5550
Wire Wire Line
	14100 5450 14600 5450
Wire Wire Line
	13100 5450 13600 5450
Wire Wire Line
	13100 5550 13600 5550
Text Label 14200 5050 0    60   ~ 0
D1
Text Label 14200 4750 0    60   ~ 0
D2
Text Label 14200 4350 0    60   ~ 0
D3
Text Label 14200 4950 0    60   ~ 0
D0
Text Label 14200 4450 0    60   ~ 0
D5
Text Label 14200 4550 0    60   ~ 0
D6
Text Label 14200 4850 0    60   ~ 0
D7
Text Label 14200 4250 0    60   ~ 0
D4
Wire Wire Line
	14100 4950 14600 4950
Wire Wire Line
	14100 5050 14600 5050
Wire Wire Line
	14100 4750 14600 4750
Wire Wire Line
	14100 4350 14600 4350
Wire Wire Line
	14100 4250 14600 4250
Wire Wire Line
	14100 4450 14600 4450
Wire Wire Line
	14100 4550 14600 4550
Wire Wire Line
	14100 4850 14600 4850
Wire Wire Line
	14100 4650 14600 4650
Text Label 14200 4650 0    60   ~ 0
VCC
Wire Wire Line
	14100 4150 14600 4150
Text Label 14200 4150 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J14
U 1 1 61717EAA
P 13850 4850
F 0 "J14" H 13850 6150 60  0000 C CNN
F 1 "Z80-BUS" V 13850 4850 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 13850 4850 60  0001 C CNN
F 3 "" H 13850 4850 60  0001 C CNN
	1    13850 4850
	1    0    0    -1  
$EndComp
Text Label 15600 1100 0    60   ~ 0
A9
Text Label 15600 1000 0    60   ~ 0
A10
Text Label 16600 1000 0    60   ~ 0
A11
Text Label 15600 1200 0    60   ~ 0
A8
Text Label 16600 1200 0    60   ~ 0
A13
Text Label 16600 1300 0    60   ~ 0
A14
Text Label 16600 1400 0    60   ~ 0
A15
Text Label 16600 1100 0    60   ~ 0
A12
Wire Wire Line
	15500 1200 16000 1200
Wire Wire Line
	15500 1100 16000 1100
Wire Wire Line
	15500 1000 16000 1000
Wire Wire Line
	16500 1000 17000 1000
Wire Wire Line
	16500 1100 17000 1100
Wire Wire Line
	16500 1200 17000 1200
Wire Wire Line
	16500 1300 17000 1300
Wire Wire Line
	16500 1400 17000 1400
Text Label 15600 1900 0    60   ~ 0
A1
Text Label 15600 1800 0    60   ~ 0
A2
Text Label 15600 1700 0    60   ~ 0
A3
Text Label 15600 2000 0    60   ~ 0
A0
Text Label 15600 1500 0    60   ~ 0
A5
Text Label 15600 1400 0    60   ~ 0
A6
Text Label 15600 1300 0    60   ~ 0
A7
Text Label 15600 1600 0    60   ~ 0
A4
Wire Wire Line
	15500 2000 16000 2000
Wire Wire Line
	15500 1900 16000 1900
Wire Wire Line
	15500 1800 16000 1800
Wire Wire Line
	15500 1700 16000 1700
Wire Wire Line
	15500 1600 16000 1600
Wire Wire Line
	15500 1500 16000 1500
Wire Wire Line
	15500 1400 16000 1400
Wire Wire Line
	15500 1300 16000 1300
Wire Wire Line
	15500 2100 16000 2100
Text Label 15600 2100 0    60   ~ 0
GND
Text Label 15600 2200 0    60   ~ 0
~RFSH
Text Label 16600 2700 0    60   ~ 0
~HALT
Text Label 15600 2700 0    60   ~ 0
~BUSACK
Text Label 15600 2300 0    60   ~ 0
~M1
Wire Wire Line
	15500 2300 16000 2300
Wire Wire Line
	15500 2200 16000 2200
Wire Wire Line
	16500 2700 17000 2700
Wire Wire Line
	15500 2700 16000 2700
Text Label 15600 2500 0    60   ~ 0
~BUSRQ
Text Label 16600 2600 0    60   ~ 0
~NMI
Text Label 16600 2500 0    60   ~ 0
~INT0
Text Label 15600 2600 0    60   ~ 0
~WAIT
Text Label 15600 2400 0    60   ~ 0
~RESET
Wire Wire Line
	15500 2400 16000 2400
Wire Wire Line
	16500 2600 17000 2600
Wire Wire Line
	16500 2500 17000 2500
Wire Wire Line
	15500 2600 16000 2600
Wire Wire Line
	15500 2500 16000 2500
Text Label 16600 2800 0    60   ~ 0
~MREQ
Text Label 15600 2800 0    60   ~ 0
~WR
Text Label 15600 2900 0    60   ~ 0
~RD
Text Label 16600 2900 0    60   ~ 0
~IORQ
Wire Wire Line
	16500 2900 17000 2900
Wire Wire Line
	16500 2800 17000 2800
Wire Wire Line
	15500 2800 16000 2800
Wire Wire Line
	15500 2900 16000 2900
Text Label 16600 2400 0    60   ~ 0
D1
Text Label 16600 2100 0    60   ~ 0
D2
Text Label 16600 1700 0    60   ~ 0
D3
Text Label 16600 2300 0    60   ~ 0
D0
Text Label 16600 1800 0    60   ~ 0
D5
Text Label 16600 1900 0    60   ~ 0
D6
Text Label 16600 2200 0    60   ~ 0
D7
Text Label 16600 1600 0    60   ~ 0
D4
Wire Wire Line
	16500 2300 17000 2300
Wire Wire Line
	16500 2400 17000 2400
Wire Wire Line
	16500 2100 17000 2100
Wire Wire Line
	16500 1700 17000 1700
Wire Wire Line
	16500 1600 17000 1600
Wire Wire Line
	16500 1800 17000 1800
Wire Wire Line
	16500 1900 17000 1900
Wire Wire Line
	16500 2200 17000 2200
Wire Wire Line
	16500 2000 17000 2000
Text Label 16600 2000 0    60   ~ 0
VCC
Wire Wire Line
	16500 1500 17000 1500
Text Label 16600 1500 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J7
U 1 1 61717F04
P 16250 2200
F 0 "J7" H 16250 3500 60  0000 C CNN
F 1 "Z80-BUS" V 16250 2200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 16250 2200 60  0001 C CNN
F 3 "" H 16250 2200 60  0001 C CNN
	1    16250 2200
	1    0    0    -1  
$EndComp
Text Label 15600 3750 0    60   ~ 0
A9
Text Label 15600 3650 0    60   ~ 0
A10
Text Label 16600 3650 0    60   ~ 0
A11
Text Label 15600 3850 0    60   ~ 0
A8
Text Label 16600 3850 0    60   ~ 0
A13
Text Label 16600 3950 0    60   ~ 0
A14
Text Label 16600 4050 0    60   ~ 0
A15
Text Label 16600 3750 0    60   ~ 0
A12
Wire Wire Line
	15500 3850 16000 3850
Wire Wire Line
	15500 3750 16000 3750
Wire Wire Line
	15500 3650 16000 3650
Wire Wire Line
	16500 3650 17000 3650
Wire Wire Line
	16500 3750 17000 3750
Wire Wire Line
	16500 3850 17000 3850
Wire Wire Line
	16500 3950 17000 3950
Wire Wire Line
	16500 4050 17000 4050
Text Label 15600 4550 0    60   ~ 0
A1
Text Label 15600 4450 0    60   ~ 0
A2
Text Label 15600 4350 0    60   ~ 0
A3
Text Label 15600 4650 0    60   ~ 0
A0
Text Label 15600 4150 0    60   ~ 0
A5
Text Label 15600 4050 0    60   ~ 0
A6
Text Label 15600 3950 0    60   ~ 0
A7
Text Label 15600 4250 0    60   ~ 0
A4
Wire Wire Line
	15500 4650 16000 4650
Wire Wire Line
	15500 4550 16000 4550
Wire Wire Line
	15500 4450 16000 4450
Wire Wire Line
	15500 4350 16000 4350
Wire Wire Line
	15500 4250 16000 4250
Wire Wire Line
	15500 4150 16000 4150
Wire Wire Line
	15500 4050 16000 4050
Wire Wire Line
	15500 3950 16000 3950
Wire Wire Line
	15500 4750 16000 4750
Text Label 15600 4750 0    60   ~ 0
GND
Text Label 15600 4850 0    60   ~ 0
~RFSH
Text Label 16600 5350 0    60   ~ 0
~HALT
Text Label 15600 5350 0    60   ~ 0
~BUSACK
Text Label 15600 4950 0    60   ~ 0
~M1
Wire Wire Line
	15500 4950 16000 4950
Wire Wire Line
	15500 4850 16000 4850
Wire Wire Line
	16500 5350 17000 5350
Wire Wire Line
	15500 5350 16000 5350
Text Label 15600 5150 0    60   ~ 0
~BUSRQ
Text Label 16600 5250 0    60   ~ 0
~NMI
Text Label 16600 5150 0    60   ~ 0
~INT0
Text Label 15600 5250 0    60   ~ 0
~WAIT
Text Label 15600 5050 0    60   ~ 0
~RESET
Wire Wire Line
	15500 5050 16000 5050
Wire Wire Line
	16500 5250 17000 5250
Wire Wire Line
	16500 5150 17000 5150
Wire Wire Line
	15500 5250 16000 5250
Wire Wire Line
	15500 5150 16000 5150
Text Label 16600 5450 0    60   ~ 0
~MREQ
Text Label 15600 5450 0    60   ~ 0
~WR
Text Label 15600 5550 0    60   ~ 0
~RD
Text Label 16600 5550 0    60   ~ 0
~IORQ
Wire Wire Line
	16500 5550 17000 5550
Wire Wire Line
	16500 5450 17000 5450
Wire Wire Line
	15500 5450 16000 5450
Wire Wire Line
	15500 5550 16000 5550
Text Label 16600 5050 0    60   ~ 0
D1
Text Label 16600 4750 0    60   ~ 0
D2
Text Label 16600 4350 0    60   ~ 0
D3
Text Label 16600 4950 0    60   ~ 0
D0
Text Label 16600 4450 0    60   ~ 0
D5
Text Label 16600 4550 0    60   ~ 0
D6
Text Label 16600 4850 0    60   ~ 0
D7
Text Label 16600 4250 0    60   ~ 0
D4
Wire Wire Line
	16500 4950 17000 4950
Wire Wire Line
	16500 5050 17000 5050
Wire Wire Line
	16500 4750 17000 4750
Wire Wire Line
	16500 4350 17000 4350
Wire Wire Line
	16500 4250 17000 4250
Wire Wire Line
	16500 4450 17000 4450
Wire Wire Line
	16500 4550 17000 4550
Wire Wire Line
	16500 4850 17000 4850
Wire Wire Line
	16500 4650 17000 4650
Text Label 16600 4650 0    60   ~ 0
VCC
Wire Wire Line
	16500 4150 17000 4150
Text Label 16600 4150 0    60   ~ 0
CLK
$Comp
L conn:CONN_02X25 J15
U 1 1 61717F5E
P 16250 4850
F 0 "J15" H 16250 6150 60  0000 C CNN
F 1 "Z80-BUS" V 16250 4850 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 16250 4850 60  0001 C CNN
F 3 "" H 16250 4850 60  0001 C CNN
	1    16250 4850
	1    0    0    -1  
$EndComp
Text Label 13200 3200 0    60   ~ 0
~TEND0
Wire Wire Line
	13100 3200 13600 3200
Text Label 13200 3000 0    60   ~ 0
~DREQ0
Text Label 13200 3100 0    60   ~ 0
GND
Wire Wire Line
	13100 3100 13600 3100
Wire Wire Line
	13100 3000 13600 3000
Text Label 13200 3300 0    60   ~ 0
~IEI-6
Text Label 13200 3400 0    60   ~ 0
~IEO-6
Wire Wire Line
	13100 3300 13600 3300
Wire Wire Line
	13100 3400 13600 3400
Text Label 15600 3200 0    60   ~ 0
~TEND0
Wire Wire Line
	15500 3200 16000 3200
Text Label 15600 3000 0    60   ~ 0
~DREQ0
Text Label 15600 3100 0    60   ~ 0
GND
Wire Wire Line
	15500 3100 16000 3100
Wire Wire Line
	15500 3000 16000 3000
Text Label 15600 3300 0    60   ~ 0
~IEI-7
Text Label 15600 3400 0    60   ~ 0
~IEO-7
Wire Wire Line
	15500 3300 16000 3300
Wire Wire Line
	15500 3400 16000 3400
Text Label 10800 5850 0    60   ~ 0
~TEND0
Wire Wire Line
	10700 5850 11200 5850
Text Label 10800 5650 0    60   ~ 0
~DREQ0
Text Label 10800 5750 0    60   ~ 0
GND
Wire Wire Line
	10700 5750 11200 5750
Wire Wire Line
	10700 5650 11200 5650
Text Label 10800 5950 0    60   ~ 0
~IEI-13
Text Label 10800 6050 0    60   ~ 0
~IEO-13
Wire Wire Line
	10700 5950 11200 5950
Wire Wire Line
	10700 6050 11200 6050
Text Label 13200 5850 0    60   ~ 0
~TEND0
Wire Wire Line
	13100 5850 13600 5850
Text Label 13200 5650 0    60   ~ 0
~DREQ0
Text Label 13200 5750 0    60   ~ 0
GND
Wire Wire Line
	13100 5750 13600 5750
Wire Wire Line
	13100 5650 13600 5650
Text Label 13200 5950 0    60   ~ 0
~IEI-14
Text Label 13200 6050 0    60   ~ 0
~IEO-14
Wire Wire Line
	13100 5950 13600 5950
Wire Wire Line
	13100 6050 13600 6050
Text Label 15600 5850 0    60   ~ 0
~TEND0
Wire Wire Line
	15500 5850 16000 5850
Text Label 15600 5650 0    60   ~ 0
~DREQ0
Text Label 15600 5750 0    60   ~ 0
GND
Wire Wire Line
	15500 5750 16000 5750
Wire Wire Line
	15500 5650 16000 5650
Text Label 15600 5950 0    60   ~ 0
~IEI-15
Text Label 15600 6050 0    60   ~ 0
~IEO-15
Wire Wire Line
	15500 5950 16000 5950
Wire Wire Line
	15500 6050 16000 6050
Text Label 14200 3200 0    60   ~ 0
~BAO-6
Wire Wire Line
	14100 3200 14600 3200
Text Label 14200 3000 0    60   ~ 0
VCC
Text Label 14200 3100 0    60   ~ 0
~BAI-6
Wire Wire Line
	14100 3100 14600 3100
Wire Wire Line
	14100 3000 14600 3000
Text Label 14200 3300 0    60   ~ 0
I2C_RX
Text Label 14200 3400 0    60   ~ 0
I2C_TX
Wire Wire Line
	14100 3300 14600 3300
Wire Wire Line
	14100 3400 14600 3400
Text Label 16600 3200 0    60   ~ 0
~BAO-7
Wire Wire Line
	16500 3200 17000 3200
Text Label 16600 3000 0    60   ~ 0
VCC
Text Label 16600 3100 0    60   ~ 0
~BAI-7
Wire Wire Line
	16500 3100 17000 3100
Wire Wire Line
	16500 3000 17000 3000
Text Label 16600 3300 0    60   ~ 0
I2C_RX
Text Label 16600 3400 0    60   ~ 0
I2C_TX
Wire Wire Line
	16500 3300 17000 3300
Wire Wire Line
	16500 3400 17000 3400
Text Label 11800 5850 0    60   ~ 0
~BAO-13
Wire Wire Line
	11700 5850 12200 5850
Text Label 11800 5650 0    60   ~ 0
VCC
Text Label 11800 5750 0    60   ~ 0
~BAI-13
Wire Wire Line
	11700 5750 12200 5750
Wire Wire Line
	11700 5650 12200 5650
Text Label 11800 5950 0    60   ~ 0
I2C_RX
Text Label 11800 6050 0    60   ~ 0
I2C_TX
Wire Wire Line
	11700 5950 12200 5950
Wire Wire Line
	11700 6050 12200 6050
Text Label 14200 5850 0    60   ~ 0
~BAO-14
Wire Wire Line
	14100 5850 14600 5850
Text Label 14200 5650 0    60   ~ 0
VCC
Text Label 14200 5750 0    60   ~ 0
~BAI-14
Wire Wire Line
	14100 5750 14600 5750
Wire Wire Line
	14100 5650 14600 5650
Text Label 14200 5950 0    60   ~ 0
I2C_RX
Text Label 14200 6050 0    60   ~ 0
I2C_TX
Wire Wire Line
	14100 5950 14600 5950
Wire Wire Line
	14100 6050 14600 6050
Text Label 16600 5850 0    60   ~ 0
~BAO-15
Wire Wire Line
	16500 5850 17000 5850
Text Label 16600 5650 0    60   ~ 0
VCC
Text Label 16600 5750 0    60   ~ 0
~BAI-15
Wire Wire Line
	16500 5750 17000 5750
Wire Wire Line
	16500 5650 17000 5650
Text Label 16600 5950 0    60   ~ 0
I2C_RX
Text Label 16600 6050 0    60   ~ 0
I2C_TX
Wire Wire Line
	16500 5950 17000 5950
Wire Wire Line
	16500 6050 17000 6050
$Comp
L conn:Screw_Terminal_1x02 T1
U 1 1 6183FD16
P 1300 12000
F 0 "T1" H 1382 12342 50  0000 C CNN
F 1 "Screw_Terminal_1x02" H 1382 12251 50  0000 C CNN
F 2 "TerminalBlock_MetzConnect:TerminalBlock_MetzConnect_Type101_RT01602HBWC_1x02_P5.08mm_Horizontal" H 1300 11775 50  0001 C CNN
F 3 "" H 1275 12000 50  0001 C CNN
	1    1300 12000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 12100 3300 12100
Connection ~ 3300 11200
$Comp
L Z80BCKPLN2-rescue:CONN_1-conn P1
U 1 1 61B7A80A
P 950 10750
F 0 "P1" H 1030 10750 40  0000 L CNN
F 1 "CONN_1" H 950 10805 30  0001 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 950 10750 60  0001 C CNN
F 3 "" H 950 10750 60  0001 C CNN
	1    950  10750
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CONN_1-conn P2
U 1 1 61B7A814
P 950 10850
F 0 "P2" H 1030 10850 40  0000 L CNN
F 1 "CONN_1" H 950 10905 30  0001 C CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad" H 950 10850 60  0001 C CNN
F 3 "" H 950 10850 60  0001 C CNN
	1    950  10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  10750 800  10850
Connection ~ 800  10850
Wire Wire Line
	800  10850 800  10950
Connection ~ 800  10950
Wire Wire Line
	3600 12150 3600 12100
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C2
U 1 1 00000061
P 4650 11900
F 0 "C2" H 4700 12000 50  0000 L CNN
F 1 "22u" H 4700 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4650 11900 60  0001 C CNN
F 3 "" H 4650 11900 60  0001 C CNN
	1    4650 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C3
U 1 1 61CF2805
P 4950 11900
F 0 "C3" H 5000 12000 50  0000 L CNN
F 1 "22u" H 5000 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4950 11900 60  0001 C CNN
F 3 "" H 4950 11900 60  0001 C CNN
	1    4950 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C4
U 1 1 61CF2804
P 5250 11900
F 0 "C4" H 5300 12000 50  0000 L CNN
F 1 "22u" H 5300 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5250 11900 60  0001 C CNN
F 3 "" H 5250 11900 60  0001 C CNN
	1    5250 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C5
U 1 1 61EA1260
P 5550 11900
F 0 "C5" H 5600 12000 50  0000 L CNN
F 1 "22u" H 5600 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5550 11900 60  0001 C CNN
F 3 "" H 5550 11900 60  0001 C CNN
	1    5550 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C6
U 1 1 61EA126A
P 5850 11900
F 0 "C6" H 5900 12000 50  0000 L CNN
F 1 "22u" H 5900 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5850 11900 60  0001 C CNN
F 3 "" H 5850 11900 60  0001 C CNN
	1    5850 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C7
U 1 1 61EA1274
P 6150 11900
F 0 "C7" H 6200 12000 50  0000 L CNN
F 1 "22u" H 6200 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6150 11900 60  0001 C CNN
F 3 "" H 6150 11900 60  0001 C CNN
	1    6150 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C8
U 1 1 61EA127E
P 6450 11900
F 0 "C8" H 6500 12000 50  0000 L CNN
F 1 "22u" H 6500 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6450 11900 60  0001 C CNN
F 3 "" H 6450 11900 60  0001 C CNN
	1    6450 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C9
U 1 1 61FAE23C
P 6750 11900
F 0 "C9" H 6800 12000 50  0000 L CNN
F 1 "22u" H 6800 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6750 11900 60  0001 C CNN
F 3 "" H 6750 11900 60  0001 C CNN
	1    6750 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C10
U 1 1 61FAE246
P 7050 11900
F 0 "C10" H 7100 12000 50  0000 L CNN
F 1 "22u" H 7100 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 7050 11900 60  0001 C CNN
F 3 "" H 7050 11900 60  0001 C CNN
	1    7050 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C11
U 1 1 61FAE250
P 7350 11900
F 0 "C11" H 7400 12000 50  0000 L CNN
F 1 "22u" H 7400 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 7350 11900 60  0001 C CNN
F 3 "" H 7350 11900 60  0001 C CNN
	1    7350 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C12
U 1 1 61FAE25A
P 7650 11900
F 0 "C12" H 7700 12000 50  0000 L CNN
F 1 "22u" H 7700 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 7650 11900 60  0001 C CNN
F 3 "" H 7650 11900 60  0001 C CNN
	1    7650 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C13
U 1 1 61FAE264
P 7950 11900
F 0 "C13" H 8000 12000 50  0000 L CNN
F 1 "22u" H 8000 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 7950 11900 60  0001 C CNN
F 3 "" H 7950 11900 60  0001 C CNN
	1    7950 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C14
U 1 1 61FAE26E
P 8250 11900
F 0 "C14" H 8300 12000 50  0000 L CNN
F 1 "22u" H 8300 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 8250 11900 60  0001 C CNN
F 3 "" H 8250 11900 60  0001 C CNN
	1    8250 11900
	1    0    0    -1  
$EndComp
$Comp
L Z80BCKPLN2-rescue:CP-device-Z80BCKPLN-rescue C15
U 1 1 61FAE278
P 8550 11900
F 0 "C15" H 8600 12000 50  0000 L CNN
F 1 "22u" H 8600 11800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 8550 11900 60  0001 C CNN
F 3 "" H 8550 11900 60  0001 C CNN
	1    8550 11900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 11700 4650 11700
Connection ~ 4350 11700
Connection ~ 4650 11700
Wire Wire Line
	4650 11700 4950 11700
Connection ~ 4950 11700
Wire Wire Line
	4950 11700 5250 11700
Connection ~ 5250 11700
Wire Wire Line
	5250 11700 5550 11700
Connection ~ 5550 11700
Wire Wire Line
	5550 11700 5850 11700
Connection ~ 5850 11700
Wire Wire Line
	5850 11700 6150 11700
Connection ~ 6150 11700
Wire Wire Line
	6150 11700 6450 11700
Connection ~ 6450 11700
Wire Wire Line
	6450 11700 6750 11700
Connection ~ 6750 11700
Wire Wire Line
	6750 11700 7050 11700
Connection ~ 7050 11700
Wire Wire Line
	7050 11700 7350 11700
Connection ~ 7350 11700
Wire Wire Line
	7350 11700 7650 11700
Connection ~ 7650 11700
Wire Wire Line
	7650 11700 7950 11700
Connection ~ 7950 11700
Wire Wire Line
	7950 11700 8250 11700
Connection ~ 8250 11700
Wire Wire Line
	8250 11700 8550 11700
Wire Wire Line
	4350 12100 4650 12100
Connection ~ 4350 12100
Connection ~ 4650 12100
Wire Wire Line
	4650 12100 4950 12100
Connection ~ 4950 12100
Wire Wire Line
	4950 12100 5250 12100
Connection ~ 5250 12100
Wire Wire Line
	5250 12100 5550 12100
Connection ~ 5550 12100
Wire Wire Line
	5550 12100 5850 12100
Connection ~ 5850 12100
Wire Wire Line
	5850 12100 6150 12100
Connection ~ 6150 12100
Wire Wire Line
	6150 12100 6450 12100
Connection ~ 6450 12100
Wire Wire Line
	6450 12100 6750 12100
Connection ~ 6750 12100
Wire Wire Line
	6750 12100 7050 12100
Connection ~ 7050 12100
Wire Wire Line
	7050 12100 7350 12100
Connection ~ 7350 12100
Wire Wire Line
	7350 12100 7650 12100
Connection ~ 7650 12100
Wire Wire Line
	7650 12100 7950 12100
Connection ~ 7950 12100
Wire Wire Line
	7950 12100 8250 12100
Connection ~ 8250 12100
Wire Wire Line
	8250 12100 8550 12100
Text Label 1850 11900 0    60   ~ 0
5V
Text Label 1850 12100 0    60   ~ 0
GND
Wire Wire Line
	3300 11200 3600 11200
Wire Wire Line
	3800 11700 3800 11200
Wire Wire Line
	3800 11700 4350 11700
$Comp
L device:R R1
U 1 1 62814086
P 3600 11550
F 0 "R1" V 3500 11500 50  0000 C CNN
F 1 "470" V 3500 11650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3530 11550 50  0001 C CNN
F 3 "~" H 3600 11550 50  0001 C CNN
	1    3600 11550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 11400 3600 11200
Connection ~ 3600 11200
Wire Wire Line
	3600 11200 3800 11200
Text Label 1200 3400 0    60   ~ 0
~IEO-1
Text Label 1200 3000 0    60   ~ 0
~DREQ0
Text Label 2200 3100 0    60   ~ 0
~BAI-1
Text Label 2200 3300 0    60   ~ 0
I2C_RX
Text Label 2200 3400 0    60   ~ 0
I2C_TX
Text Label 18900 4650 0    60   ~ 0
VCC
Wire Wire Line
	18800 6050 19300 6050
Wire Wire Line
	18800 5950 19300 5950
Text Label 18900 6050 0    60   ~ 0
I2C_TX
Text Label 18900 5950 0    60   ~ 0
I2C_RX
Wire Wire Line
	18800 5650 19300 5650
Wire Wire Line
	18800 5750 19300 5750
Text Label 18900 5750 0    60   ~ 0
~BAI-16
Text Label 18900 5650 0    60   ~ 0
VCC
Wire Wire Line
	18800 5850 19300 5850
Text Label 18900 5850 0    60   ~ 0
~BAO-16
Wire Wire Line
	18800 3400 19300 3400
Wire Wire Line
	18800 3300 19300 3300
Text Label 18900 3400 0    60   ~ 0
I2C_TX
Text Label 18900 3300 0    60   ~ 0
I2C_RX
Wire Wire Line
	18800 3000 19300 3000
Wire Wire Line
	18800 3100 19300 3100
Text Label 18900 3100 0    60   ~ 0
~BAI-8
Text Label 18900 3000 0    60   ~ 0
VCC
Wire Wire Line
	18800 3200 19300 3200
Text Label 18900 3200 0    60   ~ 0
~BAO-8
Wire Wire Line
	17800 6050 18300 6050
Wire Wire Line
	17800 5950 18300 5950
Text Label 17900 6050 0    60   ~ 0
~IEO-16
Text Label 17900 5950 0    60   ~ 0
~IEI-16
Wire Wire Line
	17800 5650 18300 5650
Wire Wire Line
	17800 5750 18300 5750
Text Label 17900 5750 0    60   ~ 0
GND
Text Label 17900 5650 0    60   ~ 0
~DREQ0
Wire Wire Line
	17800 5850 18300 5850
Text Label 17900 5850 0    60   ~ 0
~TEND0
Wire Wire Line
	17800 3400 18300 3400
Wire Wire Line
	17800 3300 18300 3300
Text Label 17900 3400 0    60   ~ 0
~IEO-8
Text Label 17900 3300 0    60   ~ 0
~IEI-8
Wire Wire Line
	17800 3000 18300 3000
Wire Wire Line
	17800 3100 18300 3100
Text Label 17900 3100 0    60   ~ 0
GND
Text Label 17900 3000 0    60   ~ 0
~DREQ0
Wire Wire Line
	17800 3200 18300 3200
Text Label 17900 3200 0    60   ~ 0
~TEND0
$Comp
L conn:CONN_02X25 J16
U 1 1 617186C8
P 18550 4850
F 0 "J16" H 18550 6150 60  0000 C CNN
F 1 "Z80-BUS" V 18550 4850 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 18550 4850 60  0001 C CNN
F 3 "" H 18550 4850 60  0001 C CNN
	1    18550 4850
	1    0    0    -1  
$EndComp
Text Label 18900 4150 0    60   ~ 0
CLK
Wire Wire Line
	18800 4150 19300 4150
Wire Wire Line
	18800 4650 19300 4650
Wire Wire Line
	18800 4850 19300 4850
Wire Wire Line
	18800 4550 19300 4550
Wire Wire Line
	18800 4450 19300 4450
Wire Wire Line
	18800 4250 19300 4250
Wire Wire Line
	18800 4350 19300 4350
Wire Wire Line
	18800 4750 19300 4750
Wire Wire Line
	18800 5050 19300 5050
Wire Wire Line
	18800 4950 19300 4950
Text Label 18900 4250 0    60   ~ 0
D4
Text Label 18900 4850 0    60   ~ 0
D7
Text Label 18900 4550 0    60   ~ 0
D6
Text Label 18900 4450 0    60   ~ 0
D5
Text Label 18900 4950 0    60   ~ 0
D0
Text Label 18900 4350 0    60   ~ 0
D3
Text Label 18900 4750 0    60   ~ 0
D2
Text Label 18900 5050 0    60   ~ 0
D1
Wire Wire Line
	17800 5550 18300 5550
Wire Wire Line
	17800 5450 18300 5450
Wire Wire Line
	18800 5450 19300 5450
Wire Wire Line
	18800 5550 19300 5550
Text Label 18900 5550 0    60   ~ 0
~IORQ
Text Label 17900 5550 0    60   ~ 0
~RD
Text Label 17900 5450 0    60   ~ 0
~WR
Text Label 18900 5450 0    60   ~ 0
~MREQ
Wire Wire Line
	17800 5150 18300 5150
Wire Wire Line
	17800 5250 18300 5250
Wire Wire Line
	18800 5150 19300 5150
Wire Wire Line
	18800 5250 19300 5250
Wire Wire Line
	17800 5050 18300 5050
Text Label 17900 5050 0    60   ~ 0
~RESET
Text Label 17900 5250 0    60   ~ 0
~WAIT
Text Label 18900 5150 0    60   ~ 0
~INT0
Text Label 18900 5250 0    60   ~ 0
~NMI
Text Label 17900 5150 0    60   ~ 0
~BUSRQ
Wire Wire Line
	17800 5350 18300 5350
Wire Wire Line
	18800 5350 19300 5350
Wire Wire Line
	17800 4850 18300 4850
Wire Wire Line
	17800 4950 18300 4950
Text Label 17900 4950 0    60   ~ 0
~M1
Text Label 17900 5350 0    60   ~ 0
~BUSACK
Text Label 18900 5350 0    60   ~ 0
~HALT
Text Label 17900 4850 0    60   ~ 0
~RFSH
Text Label 17900 4750 0    60   ~ 0
GND
Wire Wire Line
	17800 4750 18300 4750
Wire Wire Line
	17800 3950 18300 3950
Wire Wire Line
	17800 4050 18300 4050
Wire Wire Line
	17800 4150 18300 4150
Wire Wire Line
	17800 4250 18300 4250
Wire Wire Line
	17800 4350 18300 4350
Wire Wire Line
	17800 4450 18300 4450
Wire Wire Line
	17800 4550 18300 4550
Wire Wire Line
	17800 4650 18300 4650
Text Label 17900 4250 0    60   ~ 0
A4
Text Label 17900 3950 0    60   ~ 0
A7
Text Label 17900 4050 0    60   ~ 0
A6
Text Label 17900 4150 0    60   ~ 0
A5
Text Label 17900 4650 0    60   ~ 0
A0
Text Label 17900 4350 0    60   ~ 0
A3
Text Label 17900 4450 0    60   ~ 0
A2
Text Label 17900 4550 0    60   ~ 0
A1
Wire Wire Line
	18800 4050 19300 4050
Wire Wire Line
	18800 3950 19300 3950
Wire Wire Line
	18800 3850 19300 3850
Wire Wire Line
	18800 3750 19300 3750
Wire Wire Line
	18800 3650 19300 3650
Wire Wire Line
	17800 3650 18300 3650
Wire Wire Line
	17800 3750 18300 3750
Wire Wire Line
	17800 3850 18300 3850
Text Label 18900 3750 0    60   ~ 0
A12
Text Label 18900 4050 0    60   ~ 0
A15
Text Label 18900 3950 0    60   ~ 0
A14
Text Label 18900 3850 0    60   ~ 0
A13
Text Label 17900 3850 0    60   ~ 0
A8
Text Label 18900 3650 0    60   ~ 0
A11
Text Label 17900 3650 0    60   ~ 0
A10
Text Label 17900 3750 0    60   ~ 0
A9
$Comp
L conn:CONN_02X25 J8
U 1 1 6171866E
P 18550 2200
F 0 "J8" H 18550 3500 60  0000 C CNN
F 1 "Z80-BUS" V 18550 2200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x25_P2.54mm_Vertical" H 18550 2200 60  0001 C CNN
F 3 "" H 18550 2200 60  0001 C CNN
	1    18550 2200
	1    0    0    -1  
$EndComp
Text Label 18900 1500 0    60   ~ 0
CLK
Wire Wire Line
	18800 1500 19300 1500
Text Label 18900 2000 0    60   ~ 0
VCC
Wire Wire Line
	18800 2000 19300 2000
Wire Wire Line
	18800 2200 19300 2200
Wire Wire Line
	18800 1900 19300 1900
Wire Wire Line
	18800 1800 19300 1800
Wire Wire Line
	18800 1600 19300 1600
Wire Wire Line
	18800 1700 19300 1700
Wire Wire Line
	18800 2100 19300 2100
Wire Wire Line
	18800 2400 19300 2400
Wire Wire Line
	18800 2300 19300 2300
Text Label 18900 1600 0    60   ~ 0
D4
Text Label 18900 2200 0    60   ~ 0
D7
Text Label 18900 1900 0    60   ~ 0
D6
Text Label 18900 1800 0    60   ~ 0
D5
Text Label 18900 2300 0    60   ~ 0
D0
Text Label 18900 1700 0    60   ~ 0
D3
Text Label 18900 2100 0    60   ~ 0
D2
Text Label 18900 2400 0    60   ~ 0
D1
Wire Wire Line
	17800 2900 18300 2900
Wire Wire Line
	17800 2800 18300 2800
Wire Wire Line
	18800 2800 19300 2800
Wire Wire Line
	18800 2900 19300 2900
Text Label 18900 2900 0    60   ~ 0
~IORQ
Text Label 17900 2900 0    60   ~ 0
~RD
Text Label 17900 2800 0    60   ~ 0
~WR
Text Label 18900 2800 0    60   ~ 0
~MREQ
Wire Wire Line
	17800 2500 18300 2500
Wire Wire Line
	17800 2600 18300 2600
Wire Wire Line
	18800 2500 19300 2500
Wire Wire Line
	18800 2600 19300 2600
Wire Wire Line
	17800 2400 18300 2400
Text Label 17900 2400 0    60   ~ 0
~RESET
Text Label 17900 2600 0    60   ~ 0
~WAIT
Text Label 18900 2500 0    60   ~ 0
~INT0
Text Label 18900 2600 0    60   ~ 0
~NMI
Text Label 17900 2500 0    60   ~ 0
~BUSRQ
Wire Wire Line
	17800 2700 18300 2700
Wire Wire Line
	18800 2700 19300 2700
Wire Wire Line
	17800 2200 18300 2200
Wire Wire Line
	17800 2300 18300 2300
Text Label 17900 2300 0    60   ~ 0
~M1
Text Label 17900 2700 0    60   ~ 0
~BUSACK
Text Label 18900 2700 0    60   ~ 0
~HALT
Text Label 17900 2200 0    60   ~ 0
~RFSH
Text Label 17900 2100 0    60   ~ 0
GND
Wire Wire Line
	17800 2100 18300 2100
Wire Wire Line
	17800 1300 18300 1300
Wire Wire Line
	17800 1400 18300 1400
Wire Wire Line
	17800 1500 18300 1500
Wire Wire Line
	17800 1600 18300 1600
Wire Wire Line
	17800 1700 18300 1700
Wire Wire Line
	17800 1800 18300 1800
Wire Wire Line
	17800 1900 18300 1900
Wire Wire Line
	17800 2000 18300 2000
Text Label 17900 1600 0    60   ~ 0
A4
Text Label 17900 1300 0    60   ~ 0
A7
Text Label 17900 1400 0    60   ~ 0
A6
Text Label 17900 1500 0    60   ~ 0
A5
Text Label 17900 2000 0    60   ~ 0
A0
Text Label 17900 1700 0    60   ~ 0
A3
Text Label 17900 1800 0    60   ~ 0
A2
Text Label 17900 1900 0    60   ~ 0
A1
Wire Wire Line
	18800 1400 19300 1400
Wire Wire Line
	18800 1300 19300 1300
Wire Wire Line
	18800 1200 19300 1200
Wire Wire Line
	18800 1100 19300 1100
Wire Wire Line
	18800 1000 19300 1000
Wire Wire Line
	17800 1000 18300 1000
Wire Wire Line
	17800 1100 18300 1100
Wire Wire Line
	17800 1200 18300 1200
Text Label 18900 1100 0    60   ~ 0
A12
Text Label 18900 1400 0    60   ~ 0
A15
Text Label 18900 1300 0    60   ~ 0
A14
Text Label 18900 1200 0    60   ~ 0
A13
Text Label 17900 1200 0    60   ~ 0
A8
Text Label 18900 1000 0    60   ~ 0
A11
Text Label 17900 1000 0    60   ~ 0
A10
Text Label 17900 1100 0    60   ~ 0
A9
Wire Wire Line
	1100 3400 1600 3400
NoConn ~ 1100 3400
$Comp
L conn:CONN_01X04 J17
U 1 1 61844E6F
P 3100 7050
F 0 "J17" H 3178 7091 50  0000 L CNN
F 1 "INT-CHN" H 3178 7000 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3100 7050 50  0001 C CNN
F 3 "" H 3100 7050 50  0001 C CNN
	1    3100 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 6900 2900 6900
Text Label 2500 6900 0    60   ~ 0
~BAI-1
Wire Wire Line
	2400 7000 2900 7000
Text Label 2500 7100 0    60   ~ 0
~IEI-1
Text Label 2500 7200 0    60   ~ 0
~IEO-2
Wire Wire Line
	2400 7200 2900 7200
Text Label 2500 7000 0    60   ~ 0
~BAO-2
Wire Wire Line
	2400 7100 2900 7100
$Comp
L conn:CONN_01X04 J18
U 1 1 61D080A8
P 3100 7600
F 0 "J18" H 3178 7641 50  0000 L CNN
F 1 "INT-CHN" H 3178 7550 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3100 7600 50  0001 C CNN
F 3 "" H 3100 7600 50  0001 C CNN
	1    3100 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 7450 2900 7450
Text Label 2500 7450 0    60   ~ 0
~BAI-9
Wire Wire Line
	2400 7550 2900 7550
Text Label 2500 7650 0    60   ~ 0
~IEI-9
Text Label 2500 7750 0    60   ~ 0
~IEO-10
Wire Wire Line
	2400 7750 2900 7750
Text Label 2500 7550 0    60   ~ 0
~BAO-10
Wire Wire Line
	2400 7650 2900 7650
$Comp
L conn:CONN_01X04 J19
U 1 1 61F6A0F6
P 5500 7050
F 0 "J19" H 5578 7091 50  0000 L CNN
F 1 "INT-CHN" H 5578 7000 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5500 7050 50  0001 C CNN
F 3 "" H 5500 7050 50  0001 C CNN
	1    5500 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 6900 5300 6900
Text Label 4900 6900 0    60   ~ 0
~BAI-2
Wire Wire Line
	4800 7000 5300 7000
Text Label 4900 7100 0    60   ~ 0
~IEI-2
Text Label 4900 7200 0    60   ~ 0
~IEO-3
Wire Wire Line
	4800 7200 5300 7200
Text Label 4900 7000 0    60   ~ 0
~BAO-3
Wire Wire Line
	4800 7100 5300 7100
$Comp
L conn:CONN_01X04 J20
U 1 1 61F6A108
P 5500 7600
F 0 "J20" H 5578 7641 50  0000 L CNN
F 1 "INT-CHN" H 5578 7550 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5500 7600 50  0001 C CNN
F 3 "" H 5500 7600 50  0001 C CNN
	1    5500 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 7450 5300 7450
Text Label 4900 7450 0    60   ~ 0
~BAI-10
Wire Wire Line
	4800 7550 5300 7550
Text Label 4900 7650 0    60   ~ 0
~IEI-10
Text Label 4900 7750 0    60   ~ 0
~IEO-11
Wire Wire Line
	4800 7750 5300 7750
Text Label 4900 7550 0    60   ~ 0
~BAO-11
Wire Wire Line
	4800 7650 5300 7650
NoConn ~ 2600 3200
Text Label 1200 5950 0    60   ~ 0
~IEI-9
Text Label 2200 5750 0    60   ~ 0
~BAI-9
Text Label 1200 6050 0    60   ~ 0
~IEO-9
Text Label 2200 5850 0    60   ~ 0
~BAO-9
Text Label 3600 5950 0    60   ~ 0
~IEI-10
Text Label 4600 5750 0    60   ~ 0
~BAI-10
Text Label 3600 6050 0    60   ~ 0
~IEO-10
Text Label 4600 5850 0    60   ~ 0
~BAO-10
$Comp
L conn:CONN_01X04 J21
U 1 1 61AFFACF
P 7900 7050
F 0 "J21" H 7978 7091 50  0000 L CNN
F 1 "INT-CHN" H 7978 7000 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 7900 7050 50  0001 C CNN
F 3 "" H 7900 7050 50  0001 C CNN
	1    7900 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 6900 7700 6900
Text Label 7300 6900 0    60   ~ 0
~BAI-3
Wire Wire Line
	7200 7000 7700 7000
Text Label 7300 7100 0    60   ~ 0
~IEI-3
Text Label 7300 7200 0    60   ~ 0
~IEO-4
Wire Wire Line
	7200 7200 7700 7200
Text Label 7300 7000 0    60   ~ 0
~BAO-4
Wire Wire Line
	7200 7100 7700 7100
$Comp
L conn:CONN_01X04 J22
U 1 1 61AFFAE1
P 7900 7600
F 0 "J22" H 7978 7641 50  0000 L CNN
F 1 "INT-CHN" H 7978 7550 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 7900 7600 50  0001 C CNN
F 3 "" H 7900 7600 50  0001 C CNN
	1    7900 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 7450 7700 7450
Text Label 7300 7450 0    60   ~ 0
~BAI-11
Wire Wire Line
	7200 7550 7700 7550
Text Label 7300 7650 0    60   ~ 0
~IEI-11
Text Label 7300 7750 0    60   ~ 0
~IEO-12
Wire Wire Line
	7200 7750 7700 7750
Text Label 7300 7550 0    60   ~ 0
~BAO-12
Wire Wire Line
	7200 7650 7700 7650
$Comp
L conn:CONN_01X04 J23
U 1 1 61AFFAF3
P 10300 7050
F 0 "J23" H 10378 7091 50  0000 L CNN
F 1 "INT-CHN" H 10378 7000 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 10300 7050 50  0001 C CNN
F 3 "" H 10300 7050 50  0001 C CNN
	1    10300 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 6900 10100 6900
Text Label 9700 6900 0    60   ~ 0
~BAI-4
Wire Wire Line
	9600 7000 10100 7000
Text Label 9700 7100 0    60   ~ 0
~IEI-4
Text Label 9700 7200 0    60   ~ 0
~IEO-5
Wire Wire Line
	9600 7200 10100 7200
Text Label 9700 7000 0    60   ~ 0
~BAO-5
Wire Wire Line
	9600 7100 10100 7100
$Comp
L conn:CONN_01X04 J24
U 1 1 61AFFB05
P 10300 7600
F 0 "J24" H 10378 7641 50  0000 L CNN
F 1 "INT-CHN" H 10378 7550 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 10300 7600 50  0001 C CNN
F 3 "" H 10300 7600 50  0001 C CNN
	1    10300 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 7450 10100 7450
Text Label 9700 7450 0    60   ~ 0
~BAI-12
Wire Wire Line
	9600 7550 10100 7550
Text Label 9700 7650 0    60   ~ 0
~IEI-12
Text Label 9700 7750 0    60   ~ 0
~IEO-13
Wire Wire Line
	9600 7750 10100 7750
Text Label 9700 7550 0    60   ~ 0
~BAO-13
Wire Wire Line
	9600 7650 10100 7650
$Comp
L conn:CONN_01X04 J25
U 1 1 61C65783
P 12700 7050
F 0 "J25" H 12778 7091 50  0000 L CNN
F 1 "INT-CHN" H 12778 7000 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 12700 7050 50  0001 C CNN
F 3 "" H 12700 7050 50  0001 C CNN
	1    12700 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	12000 6900 12500 6900
Text Label 12100 6900 0    60   ~ 0
~BAI-5
Wire Wire Line
	12000 7000 12500 7000
Text Label 12100 7100 0    60   ~ 0
~IEI-5
Text Label 12100 7200 0    60   ~ 0
~IEO-6
Wire Wire Line
	12000 7200 12500 7200
Text Label 12100 7000 0    60   ~ 0
~BAO-6
Wire Wire Line
	12000 7100 12500 7100
$Comp
L conn:CONN_01X04 J26
U 1 1 61C65795
P 12700 7600
F 0 "J26" H 12778 7641 50  0000 L CNN
F 1 "INT-CHN" H 12778 7550 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 12700 7600 50  0001 C CNN
F 3 "" H 12700 7600 50  0001 C CNN
	1    12700 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	12000 7450 12500 7450
Text Label 12100 7450 0    60   ~ 0
~BAI-13
Wire Wire Line
	12000 7550 12500 7550
Text Label 12100 7650 0    60   ~ 0
~IEI-13
Text Label 12100 7750 0    60   ~ 0
~IEO-14
Wire Wire Line
	12000 7750 12500 7750
Text Label 12100 7550 0    60   ~ 0
~BAO-14
Wire Wire Line
	12000 7650 12500 7650
$Comp
L conn:CONN_01X04 J27
U 1 1 61C657A7
P 15100 7050
F 0 "J27" H 15178 7091 50  0000 L CNN
F 1 "INT-CHN" H 15178 7000 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 15100 7050 50  0001 C CNN
F 3 "" H 15100 7050 50  0001 C CNN
	1    15100 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	14400 6900 14900 6900
Text Label 14500 6900 0    60   ~ 0
~BAI-6
Wire Wire Line
	14400 7000 14900 7000
Text Label 14500 7100 0    60   ~ 0
~IEI-6
Text Label 14500 7200 0    60   ~ 0
~IEO-7
Wire Wire Line
	14400 7200 14900 7200
Text Label 14500 7000 0    60   ~ 0
~BAO-7
Wire Wire Line
	14400 7100 14900 7100
$Comp
L conn:CONN_01X04 J28
U 1 1 61C657B9
P 15100 7600
F 0 "J28" H 15178 7641 50  0000 L CNN
F 1 "INT-CHN" H 15178 7550 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 15100 7600 50  0001 C CNN
F 3 "" H 15100 7600 50  0001 C CNN
	1    15100 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	14400 7450 14900 7450
Text Label 14500 7450 0    60   ~ 0
~BAI-14
Wire Wire Line
	14400 7550 14900 7550
Text Label 14500 7650 0    60   ~ 0
~IEI-14
Text Label 14500 7750 0    60   ~ 0
~IEO-15
Wire Wire Line
	14400 7750 14900 7750
Text Label 14500 7550 0    60   ~ 0
~BAO-15
Wire Wire Line
	14400 7650 14900 7650
$Comp
L conn:CONN_01X04 J29
U 1 1 61C657CB
P 17500 7050
F 0 "J29" H 17578 7091 50  0000 L CNN
F 1 "INT-CHN" H 17578 7000 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 17500 7050 50  0001 C CNN
F 3 "" H 17500 7050 50  0001 C CNN
	1    17500 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	16800 6900 17300 6900
Text Label 16900 6900 0    60   ~ 0
~BAI-7
Wire Wire Line
	16800 7000 17300 7000
Text Label 16900 7100 0    60   ~ 0
~IEI-7
Text Label 16900 7200 0    60   ~ 0
~IEO-8
Wire Wire Line
	16800 7200 17300 7200
Text Label 16900 7000 0    60   ~ 0
~BAO-8
Wire Wire Line
	16800 7100 17300 7100
$Comp
L conn:CONN_01X04 J30
U 1 1 61C657DD
P 17500 7600
F 0 "J30" H 17578 7641 50  0000 L CNN
F 1 "INT-CHN" H 17578 7550 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 17500 7600 50  0001 C CNN
F 3 "" H 17500 7600 50  0001 C CNN
	1    17500 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	16800 7450 17300 7450
Text Label 16900 7450 0    60   ~ 0
~BAI-15
Wire Wire Line
	16800 7550 17300 7550
Text Label 16900 7650 0    60   ~ 0
~IEI-15
Text Label 16900 7750 0    60   ~ 0
~IEO-16
Wire Wire Line
	16800 7750 17300 7750
Text Label 16900 7550 0    60   ~ 0
~BAO-16
Wire Wire Line
	16800 7650 17300 7650
$Comp
L conn:CONN_01X04 J31
U 1 1 61C657EF
P 19900 7050
F 0 "J31" H 19978 7091 50  0000 L CNN
F 1 "INT-CHN" H 19978 7000 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 19900 7050 50  0001 C CNN
F 3 "" H 19900 7050 50  0001 C CNN
	1    19900 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	19200 6900 19700 6900
Text Label 19300 6900 0    60   ~ 0
~BAI-8
Wire Wire Line
	19200 7000 19700 7000
Text Label 19300 7100 0    60   ~ 0
~IEI-8
Text Label 19300 7200 0    60   ~ 0
~IEO-9
Wire Wire Line
	19200 7200 19700 7200
Text Label 19300 7000 0    60   ~ 0
~BAO-9
Wire Wire Line
	19200 7100 19700 7100
NoConn ~ 17800 5950
NoConn ~ 19300 5750
$Comp
L conn:CONN_02X08 J32
U 1 1 623EEDAD
P 1850 8750
F 0 "J32" H 1850 9200 60  0000 C CNN
F 1 "Z180-BUS" V 1850 8750 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x08_P2.54mm_Vertical" H 1850 8750 60  0001 C CNN
F 3 "" H 1850 8750 60  0001 C CNN
	1    1850 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3400 5000 3400
Wire Wire Line
	4500 3300 5000 3300
Text Label 4600 3400 0    60   ~ 0
I2C_TX
Text Label 4600 3200 0    60   ~ 0
~BAO-2
Wire Wire Line
	4500 3000 5000 3000
Wire Wire Line
	4500 3100 5000 3100
Text Label 4600 3100 0    60   ~ 0
~BAI-2
Text Label 4600 3000 0    60   ~ 0
VCC
Wire Wire Line
	4500 3200 5000 3200
Text Label 4600 3300 0    60   ~ 0
I2C_RX
Text Label 4600 1500 0    60   ~ 0
CLK
Wire Wire Line
	4500 1500 5000 1500
Text Label 4600 2000 0    60   ~ 0
VCC
Wire Wire Line
	4500 2000 5000 2000
Wire Wire Line
	4500 2200 5000 2200
Wire Wire Line
	4500 1900 5000 1900
Wire Wire Line
	4500 1800 5000 1800
Wire Wire Line
	4500 1600 5000 1600
Wire Wire Line
	4500 1700 5000 1700
Wire Wire Line
	4500 2100 5000 2100
Wire Wire Line
	4500 2400 5000 2400
Wire Wire Line
	4500 2300 5000 2300
Text Label 4600 1600 0    60   ~ 0
D4
Text Label 4600 2200 0    60   ~ 0
D7
Text Label 4600 1900 0    60   ~ 0
D6
Text Label 4600 1800 0    60   ~ 0
D5
Text Label 4600 2300 0    60   ~ 0
D0
Text Label 4600 1700 0    60   ~ 0
D3
Text Label 4600 2100 0    60   ~ 0
D2
Text Label 4600 2400 0    60   ~ 0
D1
Wire Wire Line
	4500 2800 5000 2800
Wire Wire Line
	4500 2900 5000 2900
Text Label 4600 2900 0    60   ~ 0
~IORQ
Text Label 4600 2800 0    60   ~ 0
~MREQ
Wire Wire Line
	4500 2500 5000 2500
Wire Wire Line
	4500 2600 5000 2600
Text Label 4600 2500 0    60   ~ 0
~INT0
Text Label 4600 2600 0    60   ~ 0
~NMI
Wire Wire Line
	4500 2700 5000 2700
Text Label 4600 2700 0    60   ~ 0
~HALT
Wire Wire Line
	4500 1400 5000 1400
Wire Wire Line
	4500 1300 5000 1300
Wire Wire Line
	4500 1200 5000 1200
Wire Wire Line
	4500 1100 5000 1100
Wire Wire Line
	4500 1000 5000 1000
Text Label 4600 1100 0    60   ~ 0
A12
Text Label 4600 1400 0    60   ~ 0
A15
Text Label 4600 1300 0    60   ~ 0
A14
Text Label 4600 1200 0    60   ~ 0
A13
Text Label 4600 1000 0    60   ~ 0
A11
Text Label 2200 9000 0    60   ~ 0
SPARE1
Text Label 2200 8900 0    60   ~ 0
SPARE0
Text Label 2200 8800 0    60   ~ 0
VCC
Text Label 2200 9100 0    60   ~ 0
SPARE2
Text Label 2200 8600 0    60   ~ 0
A18
Text Label 2200 8500 0    60   ~ 0
A17
Text Label 2200 8400 0    60   ~ 0
A16
Text Label 2200 8700 0    60   ~ 0
A19
Wire Wire Line
	2100 9100 2600 9100
Wire Wire Line
	2100 9000 2600 9000
Wire Wire Line
	2100 8900 2600 8900
Wire Wire Line
	2100 8800 2600 8800
Wire Wire Line
	2100 8700 2600 8700
Wire Wire Line
	2100 8600 2600 8600
Wire Wire Line
	2100 8500 2600 8500
Wire Wire Line
	2100 8400 2600 8400
Text Label 1200 9000 0    60   ~ 0
E
Text Label 1200 8900 0    60   ~ 0
ST
Text Label 1200 8800 0    60   ~ 0
PHI
Text Label 1200 9100 0    60   ~ 0
GND
Text Label 1200 8600 0    60   ~ 0
~TEND1
Text Label 1200 8500 0    60   ~ 0
~INT2
Text Label 1200 8400 0    60   ~ 0
~INT1
Text Label 1200 8700 0    60   ~ 0
~DREQ1
Wire Wire Line
	1100 9100 1600 9100
Wire Wire Line
	1100 9000 1600 9000
Wire Wire Line
	1100 8900 1600 8900
Wire Wire Line
	1100 8800 1600 8800
Wire Wire Line
	1100 8700 1600 8700
Wire Wire Line
	1100 8600 1600 8600
Wire Wire Line
	1100 8500 1600 8500
Wire Wire Line
	1100 8400 1600 8400
$Comp
L conn:CONN_02X08 J33
U 1 1 65536E12
P 4250 8750
F 0 "J33" H 4250 9200 60  0000 C CNN
F 1 "Z180-BUS" V 4250 8750 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x08_P2.54mm_Vertical" H 4250 8750 60  0001 C CNN
F 3 "" H 4250 8750 60  0001 C CNN
	1    4250 8750
	1    0    0    -1  
$EndComp
Text Label 4600 9000 0    60   ~ 0
SPARE1
Text Label 4600 8900 0    60   ~ 0
SPARE0
Text Label 4600 8800 0    60   ~ 0
VCC
Text Label 4600 9100 0    60   ~ 0
SPARE2
Text Label 4600 8600 0    60   ~ 0
A18
Text Label 4600 8500 0    60   ~ 0
A17
Text Label 4600 8400 0    60   ~ 0
A16
Text Label 4600 8700 0    60   ~ 0
A19
Wire Wire Line
	4500 9100 5000 9100
Wire Wire Line
	4500 9000 5000 9000
Wire Wire Line
	4500 8900 5000 8900
Wire Wire Line
	4500 8800 5000 8800
Wire Wire Line
	4500 8700 5000 8700
Wire Wire Line
	4500 8600 5000 8600
Wire Wire Line
	4500 8500 5000 8500
Wire Wire Line
	4500 8400 5000 8400
Text Label 3600 9000 0    60   ~ 0
E
Text Label 3600 8900 0    60   ~ 0
ST
Text Label 3600 8800 0    60   ~ 0
PHI
Text Label 3600 9100 0    60   ~ 0
GND
Text Label 3600 8600 0    60   ~ 0
~TEND1
Text Label 3600 8500 0    60   ~ 0
~INT2
Text Label 3600 8400 0    60   ~ 0
~INT1
Text Label 3600 8700 0    60   ~ 0
~DREQ1
Wire Wire Line
	3500 9100 4000 9100
Wire Wire Line
	3500 9000 4000 9000
Wire Wire Line
	3500 8900 4000 8900
Wire Wire Line
	3500 8800 4000 8800
Wire Wire Line
	3500 8700 4000 8700
Wire Wire Line
	3500 8600 4000 8600
Wire Wire Line
	3500 8500 4000 8500
Wire Wire Line
	3500 8400 4000 8400
$Comp
L conn:CONN_02X08 J34
U 1 1 658D225B
P 6650 8750
F 0 "J34" H 6650 9200 60  0000 C CNN
F 1 "Z180-BUS" V 6650 8750 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x08_P2.54mm_Vertical" H 6650 8750 60  0001 C CNN
F 3 "" H 6650 8750 60  0001 C CNN
	1    6650 8750
	1    0    0    -1  
$EndComp
Text Label 7000 9000 0    60   ~ 0
SPARE1
Text Label 7000 8900 0    60   ~ 0
SPARE0
Text Label 7000 8800 0    60   ~ 0
VCC
Text Label 7000 9100 0    60   ~ 0
SPARE2
Text Label 7000 8600 0    60   ~ 0
A18
Text Label 7000 8500 0    60   ~ 0
A17
Text Label 7000 8400 0    60   ~ 0
A16
Text Label 7000 8700 0    60   ~ 0
A19
Wire Wire Line
	6900 9100 7400 9100
Wire Wire Line
	6900 9000 7400 9000
Wire Wire Line
	6900 8900 7400 8900
Wire Wire Line
	6900 8800 7400 8800
Wire Wire Line
	6900 8700 7400 8700
Wire Wire Line
	6900 8600 7400 8600
Wire Wire Line
	6900 8500 7400 8500
Wire Wire Line
	6900 8400 7400 8400
Text Label 6000 9000 0    60   ~ 0
E
Text Label 6000 8900 0    60   ~ 0
ST
Text Label 6000 8800 0    60   ~ 0
PHI
Text Label 6000 9100 0    60   ~ 0
GND
Text Label 6000 8600 0    60   ~ 0
~TEND1
Text Label 6000 8500 0    60   ~ 0
~INT2
Text Label 6000 8400 0    60   ~ 0
~INT1
Text Label 6000 8700 0    60   ~ 0
~DREQ1
Wire Wire Line
	5900 9100 6400 9100
Wire Wire Line
	5900 9000 6400 9000
Wire Wire Line
	5900 8900 6400 8900
Wire Wire Line
	5900 8800 6400 8800
Wire Wire Line
	5900 8700 6400 8700
Wire Wire Line
	5900 8600 6400 8600
Wire Wire Line
	5900 8500 6400 8500
Wire Wire Line
	5900 8400 6400 8400
$Comp
L conn:CONN_02X08 J35
U 1 1 658D228D
P 9050 8750
F 0 "J35" H 9050 9200 60  0000 C CNN
F 1 "Z180-BUS" V 9050 8750 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x08_P2.54mm_Vertical" H 9050 8750 60  0001 C CNN
F 3 "" H 9050 8750 60  0001 C CNN
	1    9050 8750
	1    0    0    -1  
$EndComp
Text Label 9400 9000 0    60   ~ 0
SPARE1
Text Label 9400 8900 0    60   ~ 0
SPARE0
Text Label 9400 8800 0    60   ~ 0
VCC
Text Label 9400 9100 0    60   ~ 0
SPARE2
Text Label 9400 8600 0    60   ~ 0
A18
Text Label 9400 8500 0    60   ~ 0
A17
Text Label 9400 8400 0    60   ~ 0
A16
Text Label 9400 8700 0    60   ~ 0
A19
Wire Wire Line
	9300 9100 9800 9100
Wire Wire Line
	9300 9000 9800 9000
Wire Wire Line
	9300 8900 9800 8900
Wire Wire Line
	9300 8800 9800 8800
Wire Wire Line
	9300 8700 9800 8700
Wire Wire Line
	9300 8600 9800 8600
Wire Wire Line
	9300 8500 9800 8500
Wire Wire Line
	9300 8400 9800 8400
Text Label 8400 9000 0    60   ~ 0
E
Text Label 8400 8900 0    60   ~ 0
ST
Text Label 8400 8800 0    60   ~ 0
PHI
Text Label 8400 9100 0    60   ~ 0
GND
Text Label 8400 8600 0    60   ~ 0
~TEND1
Text Label 8400 8500 0    60   ~ 0
~INT2
Text Label 8400 8400 0    60   ~ 0
~INT1
Text Label 8400 8700 0    60   ~ 0
~DREQ1
Wire Wire Line
	8300 9100 8800 9100
Wire Wire Line
	8300 9000 8800 9000
Wire Wire Line
	8300 8900 8800 8900
Wire Wire Line
	8300 8800 8800 8800
Wire Wire Line
	8300 8700 8800 8700
Wire Wire Line
	8300 8600 8800 8600
Wire Wire Line
	8300 8500 8800 8500
Wire Wire Line
	8300 8400 8800 8400
$Comp
L conn:CONN_02X08 J36
U 1 1 65AC2E61
P 11450 8750
F 0 "J36" H 11450 9200 60  0000 C CNN
F 1 "Z180-BUS" V 11450 8750 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x08_P2.54mm_Vertical" H 11450 8750 60  0001 C CNN
F 3 "" H 11450 8750 60  0001 C CNN
	1    11450 8750
	1    0    0    -1  
$EndComp
Text Label 11800 9000 0    60   ~ 0
SPARE1
Text Label 11800 8900 0    60   ~ 0
SPARE0
Text Label 11800 8800 0    60   ~ 0
VCC
Text Label 11800 9100 0    60   ~ 0
SPARE2
Text Label 11800 8600 0    60   ~ 0
A18
Text Label 11800 8500 0    60   ~ 0
A17
Text Label 11800 8400 0    60   ~ 0
A16
Text Label 11800 8700 0    60   ~ 0
A19
Wire Wire Line
	11700 9100 12200 9100
Wire Wire Line
	11700 9000 12200 9000
Wire Wire Line
	11700 8900 12200 8900
Wire Wire Line
	11700 8800 12200 8800
Wire Wire Line
	11700 8700 12200 8700
Wire Wire Line
	11700 8600 12200 8600
Wire Wire Line
	11700 8500 12200 8500
Wire Wire Line
	11700 8400 12200 8400
Text Label 10800 9000 0    60   ~ 0
E
Text Label 10800 8900 0    60   ~ 0
ST
Text Label 10800 8800 0    60   ~ 0
PHI
Text Label 10800 9100 0    60   ~ 0
GND
Text Label 10800 8600 0    60   ~ 0
~TEND1
Text Label 10800 8500 0    60   ~ 0
~INT2
Text Label 10800 8400 0    60   ~ 0
~INT1
Text Label 10800 8700 0    60   ~ 0
~DREQ1
Wire Wire Line
	10700 9100 11200 9100
Wire Wire Line
	10700 9000 11200 9000
Wire Wire Line
	10700 8900 11200 8900
Wire Wire Line
	10700 8800 11200 8800
Wire Wire Line
	10700 8700 11200 8700
Wire Wire Line
	10700 8600 11200 8600
Wire Wire Line
	10700 8500 11200 8500
Wire Wire Line
	10700 8400 11200 8400
$Comp
L conn:CONN_02X08 J37
U 1 1 65AC2E93
P 13850 8750
F 0 "J37" H 13850 9200 60  0000 C CNN
F 1 "Z180-BUS" V 13850 8750 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x08_P2.54mm_Vertical" H 13850 8750 60  0001 C CNN
F 3 "" H 13850 8750 60  0001 C CNN
	1    13850 8750
	1    0    0    -1  
$EndComp
Text Label 14200 9000 0    60   ~ 0
SPARE1
Text Label 14200 8900 0    60   ~ 0
SPARE0
Text Label 14200 8800 0    60   ~ 0
VCC
Text Label 14200 9100 0    60   ~ 0
SPARE2
Text Label 14200 8600 0    60   ~ 0
A18
Text Label 14200 8500 0    60   ~ 0
A17
Text Label 14200 8400 0    60   ~ 0
A16
Text Label 14200 8700 0    60   ~ 0
A19
Wire Wire Line
	14100 9100 14600 9100
Wire Wire Line
	14100 9000 14600 9000
Wire Wire Line
	14100 8900 14600 8900
Wire Wire Line
	14100 8800 14600 8800
Wire Wire Line
	14100 8700 14600 8700
Wire Wire Line
	14100 8600 14600 8600
Wire Wire Line
	14100 8500 14600 8500
Wire Wire Line
	14100 8400 14600 8400
Text Label 13200 9000 0    60   ~ 0
E
Text Label 13200 8900 0    60   ~ 0
ST
Text Label 13200 8800 0    60   ~ 0
PHI
Text Label 13200 9100 0    60   ~ 0
GND
Text Label 13200 8600 0    60   ~ 0
~TEND1
Text Label 13200 8500 0    60   ~ 0
~INT2
Text Label 13200 8400 0    60   ~ 0
~INT1
Text Label 13200 8700 0    60   ~ 0
~DREQ1
Wire Wire Line
	13100 9100 13600 9100
Wire Wire Line
	13100 9000 13600 9000
Wire Wire Line
	13100 8900 13600 8900
Wire Wire Line
	13100 8800 13600 8800
Wire Wire Line
	13100 8700 13600 8700
Wire Wire Line
	13100 8600 13600 8600
Wire Wire Line
	13100 8500 13600 8500
Wire Wire Line
	13100 8400 13600 8400
$Comp
L conn:CONN_02X08 J38
U 1 1 65AC2EC5
P 16250 8750
F 0 "J38" H 16250 9200 60  0000 C CNN
F 1 "Z180-BUS" V 16250 8750 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x08_P2.54mm_Vertical" H 16250 8750 60  0001 C CNN
F 3 "" H 16250 8750 60  0001 C CNN
	1    16250 8750
	1    0    0    -1  
$EndComp
Text Label 16600 9000 0    60   ~ 0
SPARE1
Text Label 16600 8900 0    60   ~ 0
SPARE0
Text Label 16600 8800 0    60   ~ 0
VCC
Text Label 16600 9100 0    60   ~ 0
SPARE2
Text Label 16600 8600 0    60   ~ 0
A18
Text Label 16600 8500 0    60   ~ 0
A17
Text Label 16600 8400 0    60   ~ 0
A16
Text Label 16600 8700 0    60   ~ 0
A19
Wire Wire Line
	16500 9100 17000 9100
Wire Wire Line
	16500 9000 17000 9000
Wire Wire Line
	16500 8900 17000 8900
Wire Wire Line
	16500 8800 17000 8800
Wire Wire Line
	16500 8700 17000 8700
Wire Wire Line
	16500 8600 17000 8600
Wire Wire Line
	16500 8500 17000 8500
Wire Wire Line
	16500 8400 17000 8400
Text Label 15600 9000 0    60   ~ 0
E
Text Label 15600 8900 0    60   ~ 0
ST
Text Label 15600 8800 0    60   ~ 0
PHI
Text Label 15600 9100 0    60   ~ 0
GND
Text Label 15600 8600 0    60   ~ 0
~TEND1
Text Label 15600 8500 0    60   ~ 0
~INT2
Text Label 15600 8400 0    60   ~ 0
~INT1
Text Label 15600 8700 0    60   ~ 0
~DREQ1
Wire Wire Line
	15500 9100 16000 9100
Wire Wire Line
	15500 9000 16000 9000
Wire Wire Line
	15500 8900 16000 8900
Wire Wire Line
	15500 8800 16000 8800
Wire Wire Line
	15500 8700 16000 8700
Wire Wire Line
	15500 8600 16000 8600
Wire Wire Line
	15500 8500 16000 8500
Wire Wire Line
	15500 8400 16000 8400
$Comp
L conn:CONN_02X08 J39
U 1 1 65AC2EF7
P 18650 8750
F 0 "J39" H 18650 9200 60  0000 C CNN
F 1 "Z180-BUS" V 18650 8750 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x08_P2.54mm_Vertical" H 18650 8750 60  0001 C CNN
F 3 "" H 18650 8750 60  0001 C CNN
	1    18650 8750
	1    0    0    -1  
$EndComp
Text Label 19000 9000 0    60   ~ 0
SPARE1
Text Label 19000 8900 0    60   ~ 0
SPARE0
Text Label 19000 8800 0    60   ~ 0
VCC
Text Label 19000 9100 0    60   ~ 0
SPARE2
Text Label 19000 8600 0    60   ~ 0
A18
Text Label 19000 8500 0    60   ~ 0
A17
Text Label 19000 8400 0    60   ~ 0
A16
Text Label 19000 8700 0    60   ~ 0
A19
Wire Wire Line
	18900 9100 19400 9100
Wire Wire Line
	18900 9000 19400 9000
Wire Wire Line
	18900 8900 19400 8900
Wire Wire Line
	18900 8800 19400 8800
Wire Wire Line
	18900 8700 19400 8700
Wire Wire Line
	18900 8600 19400 8600
Wire Wire Line
	18900 8500 19400 8500
Wire Wire Line
	18900 8400 19400 8400
Text Label 18000 9000 0    60   ~ 0
E
Text Label 18000 8900 0    60   ~ 0
ST
Text Label 18000 8800 0    60   ~ 0
PHI
Text Label 18000 9100 0    60   ~ 0
GND
Text Label 18000 8600 0    60   ~ 0
~TEND1
Text Label 18000 8500 0    60   ~ 0
~INT2
Text Label 18000 8400 0    60   ~ 0
~INT1
Text Label 18000 8700 0    60   ~ 0
~DREQ1
Wire Wire Line
	17900 9100 18400 9100
Wire Wire Line
	17900 9000 18400 9000
Wire Wire Line
	17900 8900 18400 8900
Wire Wire Line
	17900 8800 18400 8800
Wire Wire Line
	17900 8700 18400 8700
Wire Wire Line
	17900 8600 18400 8600
Wire Wire Line
	17900 8500 18400 8500
Wire Wire Line
	17900 8400 18400 8400
$Comp
L Switch:SW_SPDT SW1
U 1 1 65E05621
P 2500 11700
F 0 "SW1" H 2500 11985 50  0000 C CNN
F 1 "POWER" H 2500 11894 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_SPDT" H 2500 11700 50  0001 C CNN
F 3 "~" H 2500 11700 50  0001 C CNN
	1    2500 11700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 11600 2700 11200
Wire Wire Line
	2300 11900 2300 11700
NoConn ~ 2700 11800
$Comp
L power:PWR_FLAG #FLG03
U 1 1 663B816D
P 3300 11200
F 0 "#FLG03" H 3300 11295 30  0001 C CNN
F 1 "PWR_FLAG" H 3300 11380 30  0000 C CNN
F 2 "" H 3300 11200 60  0001 C CNN
F 3 "" H 3300 11200 60  0001 C CNN
	1    3300 11200
	1    0    0    -1  
$EndComp
Text Label 2750 11200 0    60   ~ 0
VCC
Wire Wire Line
	1500 11900 2300 11900
Text Notes 1850 12750 0    60   ~ 0
Note: SPDT right angle toggle switch on-on\nJameco Part no.: 2277743\nManufacturer: C&K\nManufacturer p/n: U11P3Y9A2QE
Text Notes 9550 700  0    60   ~ 0
Primary Z80 Bus Interface Connectors
Text Notes 9600 6700 0    60   ~ 0
Zilog Interrupt Priority Bus Jumpers
Text Notes 9800 8200 0    60   ~ 0
Extended Z80180 Bus Interface Connectors
$EndSCHEMATC
