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
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J3
U 1 1 618C372A
P 10200 1950
F 0 "J3" H 10250 3367 50  0000 C CNN
F 1 "MBC Bus Connector" H 10250 3276 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x25_P2.54mm_Horizontal" H 10200 1950 50  0001 C CNN
F 3 "~" H 10200 1950 50  0001 C CNN
	1    10200 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 750  9900 750 
Wire Wire Line
	10000 850  9900 850 
Wire Wire Line
	10000 950  9900 950 
Wire Wire Line
	10000 1050 9900 1050
Wire Wire Line
	10000 1150 9900 1150
Wire Wire Line
	10000 1250 9900 1250
Wire Wire Line
	10000 1350 9900 1350
Wire Wire Line
	10000 1450 9900 1450
Wire Wire Line
	10000 1550 9900 1550
Wire Wire Line
	10000 1650 9900 1650
Wire Wire Line
	10000 1750 9900 1750
Wire Wire Line
	10000 1950 9900 1950
Wire Wire Line
	10000 2050 9900 2050
Wire Wire Line
	10000 2150 9900 2150
Wire Wire Line
	10000 2250 9900 2250
Wire Wire Line
	10000 2350 9900 2350
Wire Wire Line
	10000 2450 9900 2450
Wire Wire Line
	10000 2550 9900 2550
Wire Wire Line
	10000 2650 9900 2650
Wire Wire Line
	10500 2650 10600 2650
Wire Wire Line
	10500 2550 10600 2550
Wire Wire Line
	10500 2450 10600 2450
Wire Wire Line
	10500 2350 10600 2350
Wire Wire Line
	10500 2250 10600 2250
Wire Wire Line
	10500 2150 10600 2150
Wire Wire Line
	10500 2050 10600 2050
Wire Wire Line
	10500 1950 10600 1950
Wire Wire Line
	10500 1850 10600 1850
Wire Wire Line
	10500 1650 10600 1650
Wire Wire Line
	10500 1550 10600 1550
Wire Wire Line
	10500 1450 10600 1450
Wire Wire Line
	10500 1350 10600 1350
Wire Wire Line
	10500 1250 10600 1250
Wire Wire Line
	10500 1150 10600 1150
Wire Wire Line
	10500 1050 10600 1050
Wire Wire Line
	10500 950  10600 950 
Wire Wire Line
	10500 850  10600 850 
Wire Wire Line
	10500 750  10600 750 
Text GLabel 9900 750  0    50   Input ~ 0
A10
Text GLabel 9900 850  0    50   Input ~ 0
A9
Text GLabel 9900 950  0    50   Input ~ 0
A8
Text GLabel 9900 1050 0    50   Input ~ 0
A7
Text GLabel 9900 1150 0    50   Input ~ 0
A6
Text GLabel 9900 1250 0    50   Input ~ 0
A5
Text GLabel 9900 1350 0    50   Input ~ 0
A4
Text GLabel 9900 1450 0    50   Input ~ 0
A3
Text GLabel 9900 1550 0    50   Input ~ 0
A2
Text GLabel 9900 1650 0    50   Input ~ 0
A1
Text GLabel 9900 1750 0    50   Input ~ 0
A0
Wire Wire Line
	9650 1850 10000 1850
$Comp
L power:GND #PWR0101
U 1 1 618E1627
P 9550 1800
F 0 "#PWR0101" H 9550 1550 50  0001 C CNN
F 1 "GND" H 9555 1627 50  0000 C CNN
F 2 "" H 9550 1800 50  0001 C CNN
F 3 "" H 9550 1800 50  0001 C CNN
	1    9550 1800
	1    0    0    -1  
$EndComp
Text GLabel 9900 1950 0    50   Input ~ 0
_RFSH
Wire Wire Line
	9650 1850 9650 1800
Wire Wire Line
	9650 1800 9550 1800
Text GLabel 9900 2050 0    50   Input ~ 0
_M1
Text GLabel 9900 2150 0    50   Input ~ 0
_RESET
Text GLabel 9900 2250 0    50   Input ~ 0
_BUSRQ
Text GLabel 9900 2350 0    50   Input ~ 0
_WAIT
Text GLabel 9900 2450 0    50   Input ~ 0
_BUSACK
Text GLabel 9900 2550 0    50   Input ~ 0
_WR
Text GLabel 9900 2650 0    50   Input ~ 0
_RD
$Comp
L power:VCC #PWR0102
U 1 1 618E4DD4
P 11050 2750
F 0 "#PWR0102" H 11050 2600 50  0001 C CNN
F 1 "VCC" H 11065 2923 50  0000 C CNN
F 2 "" H 11050 2750 50  0001 C CNN
F 3 "" H 11050 2750 50  0001 C CNN
	1    11050 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 2750 11050 2750
Wire Wire Line
	9400 2850 10000 2850
$Comp
L power:GND #PWR0103
U 1 1 618E7E03
P 9400 2850
F 0 "#PWR0103" H 9400 2600 50  0001 C CNN
F 1 "GND" H 9405 2677 50  0000 C CNN
F 2 "" H 9400 2850 50  0001 C CNN
F 3 "" H 9400 2850 50  0001 C CNN
	1    9400 2850
	1    0    0    -1  
$EndComp
Text GLabel 10600 2650 2    50   Input ~ 0
_IORQ
Text GLabel 10600 2550 2    50   Input ~ 0
_MREQ
Text GLabel 10600 2450 2    50   Input ~ 0
_HALT
Text GLabel 10600 2350 2    50   Input ~ 0
_NMI
Text GLabel 10600 2250 2    50   Input ~ 0
_INT
Text GLabel 10600 2150 2    50   Input ~ 0
D1
Text GLabel 10600 2050 2    50   Input ~ 0
D0
Text GLabel 10600 1950 2    50   Input ~ 0
D7
Text GLabel 10600 1850 2    50   Input ~ 0
D2
Text GLabel 10600 1650 2    50   Input ~ 0
D6
Text GLabel 10600 1550 2    50   Input ~ 0
D5
Text GLabel 10600 1450 2    50   Input ~ 0
D3
Text GLabel 10600 1350 2    50   Input ~ 0
D4
Text GLabel 10600 1250 2    50   Input ~ 0
CLK
Text GLabel 10600 1150 2    50   Input ~ 0
A15
Text GLabel 10600 1050 2    50   Input ~ 0
A14
Text GLabel 10600 950  2    50   Input ~ 0
A13
Text GLabel 10600 850  2    50   Input ~ 0
A12
Text GLabel 10600 750  2    50   Input ~ 0
A11
$Comp
L Device:C C11
U 1 1 618E9D5C
P 10050 6250
F 0 "C11" H 10000 6450 50  0000 L CNN
F 1 "0.1u" H 9950 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 10088 6100 50  0001 C CNN
F 3 "~" H 10050 6250 50  0001 C CNN
	1    10050 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Polarized C12
U 1 1 618EA57A
P 10800 6250
F 0 "C12" H 10750 6450 50  0000 L CNN
F 1 "10u" H 10800 6050 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 10838 6100 50  0001 C CNN
F 3 "~" H 10800 6250 50  0001 C CNN
	1    10800 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Polarized C13
U 1 1 618EAC34
P 11050 6250
F 0 "C13" H 11000 6450 50  0000 L CNN
F 1 "10u" H 11050 6050 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 11088 6100 50  0001 C CNN
F 3 "~" H 11050 6250 50  0001 C CNN
	1    11050 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 618ED63D
P 7000 6250
F 0 "D2" H 6950 6350 50  0000 L CNN
F 1 "POWER" H 7000 6200 50  0000 C TNN
F 2 "LED_THT:LED_D3.0mm" H 7000 6250 50  0001 C CNN
F 3 "~" H 7000 6250 50  0001 C CNN
	1    7000 6250
	0    1    -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 618EF0FC
P 7150 6100
F 0 "R3" V 7050 6100 50  0000 C CNN
F 1 "470" V 7150 6100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7080 6100 50  0001 C CNN
F 3 "~" H 7150 6100 50  0001 C CNN
	1    7150 6100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Network09_US RN1
U 1 1 618F3E0F
P 850 1150
F 0 "RN1" V 233 1150 50  0000 C CNN
F 1 "4700" V 324 1150 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP10" V 1425 1150 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 850 1150 50  0001 C CNN
	1    850  1150
	0    -1   1    0   
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 618F8B5C
P 600 750
F 0 "#PWR0104" H 600 600 50  0001 C CNN
F 1 "VCC" H 615 923 50  0000 C CNN
F 2 "" H 600 750 50  0001 C CNN
F 3 "" H 600 750 50  0001 C CNN
	1    600  750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  750  600  750 
Wire Wire Line
	1050 750  1200 750 
Wire Wire Line
	1050 850  1200 850 
Wire Wire Line
	1050 950  1200 950 
Wire Wire Line
	1050 1050 1200 1050
Wire Wire Line
	1050 1150 1200 1150
Wire Wire Line
	1050 1250 1200 1250
Wire Wire Line
	1050 1350 1200 1350
Wire Wire Line
	1050 1450 1200 1450
Wire Wire Line
	1050 1550 1200 1550
Text GLabel 1200 850  2    50   Input ~ 0
_6502NMI
Text GLabel 1200 950  2    50   Input ~ 0
_6502INT
Text GLabel 1200 1050 2    50   Input ~ 0
_WAIT
Text GLabel 1200 1150 2    50   Input ~ 0
_BUSRQ
Text GLabel 1200 1250 2    50   Input ~ 0
_M1
Text GLabel 1200 1350 2    50   Input ~ 0
_RFSH
Text GLabel 1200 1450 2    50   Input ~ 0
_HALT
Text GLabel 1200 1550 2    50   Input ~ 0
_BUSACK
Text GLabel 3550 950  2    50   Input ~ 0
_RESET
$Comp
L 74xx:74LS07 U3
U 1 1 6190F538
P 3250 950
F 0 "U3" H 3200 950 50  0000 C CNN
F 1 "74LS07" H 3450 1050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3250 950 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 3250 950 50  0001 C CNN
	1    3250 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 61913472
P 2850 800
F 0 "D1" H 2800 700 50  0000 L CNN
F 1 "1N4148" V 2750 500 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 2850 800 50  0001 C CNN
F 3 "~" H 2850 800 50  0001 C CNN
	1    2850 800 
	0    -1   1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 61913587
P 2650 800
F 0 "R2" V 2550 850 50  0000 R CNN
F 1 "10K" V 2650 850 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2580 800 50  0001 C CNN
F 3 "~" H 2650 800 50  0001 C CNN
	1    2650 800 
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Polarized C1
U 1 1 619138E2
P 2650 1100
F 0 "C1" H 2532 1146 50  0000 R CNN
F 1 "10u" H 2532 1055 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 2688 950 50  0001 C CNN
F 3 "~" H 2650 1100 50  0001 C CNN
	1    2650 1100
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61913D49
P 2300 950
F 0 "R1" V 2400 950 50  0000 C CNN
F 1 "10" V 2300 950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2230 950 50  0001 C CNN
F 3 "~" H 2300 950 50  0001 C CNN
	1    2300 950 
	0    1    -1   0   
$EndComp
Wire Wire Line
	2950 950  2850 950 
Wire Wire Line
	2850 950  2650 950 
Connection ~ 2850 950 
Connection ~ 2650 950 
Wire Wire Line
	2650 950  2450 950 
$Comp
L power:VCC #PWR0105
U 1 1 61928C1F
P 3950 850
F 0 "#PWR0105" H 3950 700 50  0001 C CNN
F 1 "VCC" H 3965 1023 50  0000 C CNN
F 2 "" H 3950 850 50  0001 C CNN
F 3 "" H 3950 850 50  0001 C CNN
	1    3950 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 850  3950 850 
Wire Wire Line
	3950 850  3750 850 
Wire Wire Line
	3750 850  3750 650 
Wire Wire Line
	3750 650  2850 650 
Connection ~ 3950 850 
Wire Wire Line
	2850 650  2650 650 
Connection ~ 2850 650 
$Comp
L power:GND #PWR0106
U 1 1 619332FF
P 2650 1300
F 0 "#PWR0106" H 2650 1050 50  0001 C CNN
F 1 "GND" H 2655 1127 50  0000 C CNN
F 2 "" H 2650 1300 50  0001 C CNN
F 3 "" H 2650 1300 50  0001 C CNN
	1    2650 1300
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_2_Bridged JP1
U 1 1 6193395B
P 2150 1200
F 0 "JP1" H 2400 1300 50  0000 C CNN
F 1 "RESET" H 2150 1304 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2150 1200 50  0001 C CNN
F 3 "~" H 2150 1200 50  0001 C CNN
	1    2150 1200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 6193476E
P 2150 1350
F 0 "SW2" H 2150 1200 50  0000 C CNN
F 1 "RESET" H 2150 1300 50  0000 C CNN
F 2 "Button_Switch_THT:SW_Tactile_SPST_Angled_PTS645Vx31-2LFS" H 2150 1550 50  0001 C CNN
F 3 "~" H 2150 1550 50  0001 C CNN
	1    2150 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 1300 2650 1250
Wire Wire Line
	2650 1250 2450 1250
Wire Wire Line
	2450 1250 2450 1200
Wire Wire Line
	2450 1200 2350 1200
Connection ~ 2650 1250
Wire Wire Line
	2350 1350 2450 1350
Wire Wire Line
	2450 1350 2450 1250
Connection ~ 2450 1250
Wire Wire Line
	1950 1350 1950 1200
Wire Wire Line
	1950 1200 1950 950 
Wire Wire Line
	1950 950  2150 950 
Connection ~ 1950 1200
$Comp
L 74xx:74LS93 U1
U 1 1 619462E8
P 1300 2400
F 0 "U1" H 1500 2750 50  0000 C CNN
F 1 "74LS93" H 1150 2400 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 1300 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS93" H 1300 2400 50  0001 C CNN
	1    1300 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 6194840F
P 850 2900
F 0 "#PWR0107" H 850 2650 50  0001 C CNN
F 1 "GND" H 855 2727 50  0000 C CNN
F 2 "" H 850 2900 50  0001 C CNN
F 3 "" H 850 2900 50  0001 C CNN
	1    850  2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2900 850  2900
Wire Wire Line
	850  2900 800  2900
Wire Wire Line
	800  2900 800  2600
Connection ~ 850  2900
Wire Wire Line
	800  2600 800  2500
Connection ~ 800  2600
$Comp
L power:VCC #PWR0108
U 1 1 6195373B
P 1300 1850
F 0 "#PWR0108" H 1300 1700 50  0001 C CNN
F 1 "VCC" H 1150 1850 50  0000 C CNN
F 2 "" H 1300 1850 50  0001 C CNN
F 3 "" H 1300 1850 50  0001 C CNN
	1    1300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1900 1300 1850
Wire Wire Line
	1800 2200 1800 1700
Wire Wire Line
	1800 1700 500  1700
Wire Wire Line
	500  1700 500  2300
Wire Wire Line
	500  2300 800  2300
Wire Wire Line
	800  2200 750  2200
Text GLabel 750  2200 0    50   Input ~ 0
CLK
Wire Wire Line
	11050 1750 11050 1700
Wire Wire Line
	10500 1750 11050 1750
$Comp
L power:VCC #PWR0109
U 1 1 619655DD
P 11050 1700
F 0 "#PWR0109" H 11050 1550 50  0001 C CNN
F 1 "VCC" H 11065 1873 50  0000 C CNN
F 2 "" H 11050 1700 50  0001 C CNN
F 3 "" H 11050 1700 50  0001 C CNN
	1    11050 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2200 1900 2200
Connection ~ 1800 2200
Wire Wire Line
	1800 2300 1900 2300
Wire Wire Line
	1800 2400 1900 2400
Wire Wire Line
	1800 2500 1900 2500
Text GLabel 2400 2100 2    50   Input ~ 0
CLKO
Wire Wire Line
	3700 1500 3600 1500
Text GLabel 3600 1500 0    50   Input ~ 0
CLKO
$Comp
L 74xx:74LS244 U8
U 1 1 61990AC3
P 6300 1450
F 0 "U8" H 6100 2100 50  0000 C CNN
F 1 "74LS244" H 6400 1100 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 6300 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls244.pdf" H 6300 1450 50  0001 C CNN
	1    6300 1450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244 U10
U 1 1 61992E5C
P 7000 2850
F 0 "U10" H 7100 3500 50  0000 C CNN
F 1 "74LS244" H 7100 2500 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 7000 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls244.pdf" H 7000 2850 50  0001 C CNN
	1    7000 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 619CF662
P 6750 2000
F 0 "#PWR0110" H 6750 1750 50  0001 C CNN
F 1 "GND" H 6755 1827 50  0000 C CNN
F 2 "" H 6750 2000 50  0001 C CNN
F 3 "" H 6750 2000 50  0001 C CNN
	1    6750 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 2000 6750 2000
Wire Wire Line
	6350 2250 6350 2100
Wire Wire Line
	6350 2100 6650 2100
Wire Wire Line
	6650 2100 6650 2000
$Comp
L power:VCC #PWR0111
U 1 1 619E5A8E
P 6300 600
F 0 "#PWR0111" H 6300 450 50  0001 C CNN
F 1 "VCC" H 6450 600 50  0000 C CNN
F 2 "" H 6300 600 50  0001 C CNN
F 3 "" H 6300 600 50  0001 C CNN
	1    6300 600 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 600  6300 650 
Wire Wire Line
	6300 2250 6350 2250
$Comp
L power:VCC #PWR0112
U 1 1 61AAD36C
P 7000 2050
F 0 "#PWR0112" H 7000 1900 50  0001 C CNN
F 1 "VCC" H 7015 2223 50  0000 C CNN
F 2 "" H 7000 2050 50  0001 C CNN
F 3 "" H 7000 2050 50  0001 C CNN
	1    7000 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 61AAD84D
P 7000 3650
F 0 "#PWR0113" H 7000 3400 50  0001 C CNN
F 1 "GND" H 7005 3477 50  0000 C CNN
F 2 "" H 7000 3650 50  0001 C CNN
F 3 "" H 7000 3650 50  0001 C CNN
	1    7000 3650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS245 U7
U 1 1 61AADE30
P 5850 4350
F 0 "U7" H 5950 5000 50  0000 C CNN
F 1 "74LS245" H 5950 4050 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 5850 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 5850 4350 50  0001 C CNN
	1    5850 4350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6400 2400 6400 2450
Wire Wire Line
	6400 2450 6500 2450
Wire Wire Line
	6350 2450 6350 2550
Wire Wire Line
	6350 2550 6500 2550
Wire Wire Line
	6300 2500 6300 2650
Wire Wire Line
	6300 2650 6500 2650
Wire Wire Line
	6250 2550 6250 2750
Wire Wire Line
	6250 2750 6500 2750
Wire Wire Line
	6200 2600 6200 2850
Wire Wire Line
	6200 2850 6500 2850
Wire Wire Line
	6150 2650 6150 2950
Wire Wire Line
	6150 2950 6500 2950
Wire Wire Line
	6100 3050 6500 3050
Wire Wire Line
	4900 1200 4900 950 
Wire Wire Line
	4900 950  5800 950 
Wire Wire Line
	4900 1300 4950 1300
Wire Wire Line
	4950 1300 4950 1050
Wire Wire Line
	4950 1050 5800 1050
Wire Wire Line
	4900 1400 5000 1400
Wire Wire Line
	5000 1400 5000 1150
Wire Wire Line
	5000 1150 5800 1150
Wire Wire Line
	4900 1500 5050 1500
Wire Wire Line
	5050 1500 5050 1250
Wire Wire Line
	5050 1250 5800 1250
Wire Wire Line
	5100 1600 5100 1350
Wire Wire Line
	5100 1350 5800 1350
Wire Wire Line
	4900 1600 5100 1600
Wire Wire Line
	4900 1700 5150 1700
Wire Wire Line
	5150 1700 5150 1450
Wire Wire Line
	5150 1450 5800 1450
Wire Wire Line
	4900 1800 5200 1800
Wire Wire Line
	5200 1800 5200 1550
Wire Wire Line
	5200 1550 5800 1550
Wire Wire Line
	5250 1900 5250 1650
Wire Wire Line
	5250 1650 5800 1650
Wire Wire Line
	4900 1900 5250 1900
Wire Wire Line
	4900 2600 4950 2600
Wire Wire Line
	4950 2600 4950 2650
Wire Wire Line
	4950 2650 6150 2650
Wire Wire Line
	4900 2500 5000 2500
Wire Wire Line
	5000 2500 5000 2600
Wire Wire Line
	5000 2600 6200 2600
Wire Wire Line
	4900 2400 5050 2400
Wire Wire Line
	5050 2400 5050 2550
Wire Wire Line
	5050 2550 6250 2550
Wire Wire Line
	4900 2300 5100 2300
Wire Wire Line
	5100 2300 5100 2500
Wire Wire Line
	5100 2500 6300 2500
Wire Wire Line
	4900 2200 5150 2200
Wire Wire Line
	5150 2200 5150 2450
Wire Wire Line
	5150 2450 6350 2450
Wire Wire Line
	4900 2100 5200 2100
Wire Wire Line
	5200 2100 5200 2400
Wire Wire Line
	5200 2400 6400 2400
Wire Wire Line
	4900 2000 5250 2000
Wire Wire Line
	5250 2000 5250 2350
Wire Wire Line
	5250 2350 6500 2350
Wire Wire Line
	4900 2900 5350 2900
Wire Wire Line
	5350 2900 5350 3850
Wire Wire Line
	4900 3000 5300 3000
Wire Wire Line
	5300 3000 5300 3950
Wire Wire Line
	5300 3950 5350 3950
Wire Wire Line
	4900 3100 5250 3100
Wire Wire Line
	5250 3100 5250 4050
Wire Wire Line
	5250 4050 5350 4050
Wire Wire Line
	4900 3200 5200 3200
Wire Wire Line
	5200 3200 5200 4150
Wire Wire Line
	5200 4150 5350 4150
Wire Wire Line
	4900 3300 5150 3300
Wire Wire Line
	5150 3300 5150 4250
Wire Wire Line
	5150 4250 5350 4250
Wire Wire Line
	4900 3400 5100 3400
Wire Wire Line
	5100 3400 5100 4350
Wire Wire Line
	5100 4350 5200 4350
Wire Wire Line
	4900 3500 5050 3500
Wire Wire Line
	5050 3500 5050 4450
Wire Wire Line
	5050 4450 5250 4450
Wire Wire Line
	4900 3600 5000 3600
Wire Wire Line
	5000 3600 5000 4550
Wire Wire Line
	5000 4550 5300 4550
Wire Wire Line
	6800 950  6900 950 
Wire Wire Line
	6800 1050 6900 1050
Wire Wire Line
	6800 1150 6900 1150
Wire Wire Line
	6800 1250 6900 1250
Wire Wire Line
	6800 1350 6900 1350
Wire Wire Line
	6800 1450 6900 1450
Wire Wire Line
	6800 1550 6900 1550
Wire Wire Line
	6800 1650 6900 1650
Text GLabel 6900 950  2    50   Input ~ 0
A0
Text GLabel 6900 1050 2    50   Input ~ 0
A1
Text GLabel 6900 1150 2    50   Input ~ 0
A2
Text GLabel 6900 1250 2    50   Input ~ 0
A3
Text GLabel 6900 1350 2    50   Input ~ 0
A4
Text GLabel 6900 1450 2    50   Input ~ 0
A5
Text GLabel 6900 1550 2    50   Input ~ 0
A6
Text GLabel 6900 1650 2    50   Input ~ 0
A7
Wire Wire Line
	7500 2350 7550 2350
Wire Wire Line
	7500 2450 7550 2450
Wire Wire Line
	7500 2550 7550 2550
Wire Wire Line
	7500 2650 7550 2650
Wire Wire Line
	7500 2750 7550 2750
Wire Wire Line
	7500 2850 7550 2850
Wire Wire Line
	7500 2950 7550 2950
Text GLabel 7550 2350 2    50   Input ~ 0
A8
Text GLabel 7550 2450 2    50   Input ~ 0
A9
Text GLabel 7550 2550 2    50   Input ~ 0
A10
Text GLabel 7550 2650 2    50   Input ~ 0
A11
Text GLabel 7550 2750 2    50   Input ~ 0
A12
Text GLabel 7550 2850 2    50   Input ~ 0
A13
Text GLabel 7550 2950 2    50   Input ~ 0
A14
Text GLabel 7550 3050 2    50   Input ~ 0
A15
$Comp
L power:VCC #PWR0114
U 1 1 61DD94F6
P 5850 3550
F 0 "#PWR0114" H 5850 3400 50  0001 C CNN
F 1 "VCC" H 5865 3723 50  0000 C CNN
F 2 "" H 5850 3550 50  0001 C CNN
F 3 "" H 5850 3550 50  0001 C CNN
	1    5850 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 61DD9A2A
P 5850 5150
F 0 "#PWR0115" H 5850 4900 50  0001 C CNN
F 1 "GND" H 5855 4977 50  0000 C CNN
F 2 "" H 5850 5150 50  0001 C CNN
F 3 "" H 5850 5150 50  0001 C CNN
	1    5850 5150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 U3
U 2 1 61E19C26
P 8000 5450
F 0 "U3" H 7950 5450 50  0000 C CNN
F 1 "74LS07" H 8150 5550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8000 5450 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 8000 5450 50  0001 C CNN
	2    8000 5450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 1 1 61E1B61F
P 3000 3450
F 0 "U4" H 2950 3450 50  0000 C CNN
F 1 "74LS04" H 3050 3300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3000 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3000 3450 50  0001 C CNN
	1    3000 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	2900 2400 3150 2400
$Comp
L 74xx:74LS244 U2
U 1 1 61E544B9
P 1500 4100
F 0 "U2" H 1600 4750 50  0000 C CNN
F 1 "74LS244" H 1600 3800 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 1500 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls244.pdf" H 1500 4100 50  0001 C CNN
	1    1500 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2050 3700 2000 3700
Wire Wire Line
	1000 3600 900  3600
Wire Wire Line
	1000 3700 900  3700
Text GLabel 900  3600 0    50   Input ~ 0
_WR
Text GLabel 900  3700 0    50   Input ~ 0
_RD
Wire Wire Line
	1000 3800 900  3800
Wire Wire Line
	1000 3900 900  3900
Text GLabel 900  3800 0    50   Input ~ 0
_MREQ
Text GLabel 900  3900 0    50   Input ~ 0
_IORQ
$Comp
L power:GND #PWR0116
U 1 1 61EBD528
P 4300 3950
F 0 "#PWR0116" H 4300 3700 50  0001 C CNN
F 1 "GND" H 4305 3777 50  0000 C CNN
F 2 "" H 4300 3950 50  0001 C CNN
F 3 "" H 4300 3950 50  0001 C CNN
	1    4300 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 2 1 61EBDFD8
P 5800 3050
F 0 "U4" H 5950 3150 50  0000 C CNN
F 1 "74LS04" H 5850 2900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 5800 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5800 3050 50  0001 C CNN
	2    5800 3050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS688 U5
U 1 1 61ED1547
P 2950 6300
F 0 "U5" H 3050 7350 50  0000 L CNN
F 1 "74LS688" H 2900 6300 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 2950 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS688" H 2950 6300 50  0001 C CNN
	1    2950 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 61ED32A3
P 1500 4900
F 0 "#PWR0117" H 1500 4650 50  0001 C CNN
F 1 "GND" H 1505 4727 50  0000 C CNN
F 2 "" H 1500 4900 50  0001 C CNN
F 3 "" H 1500 4900 50  0001 C CNN
	1    1500 4900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0118
U 1 1 61ED3D8A
P 1500 3300
F 0 "#PWR0118" H 1500 3150 50  0001 C CNN
F 1 "VCC" H 1515 3473 50  0000 C CNN
F 2 "" H 1500 3300 50  0001 C CNN
F 3 "" H 1500 3300 50  0001 C CNN
	1    1500 3300
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 61ED4B4B
P 1650 6700
F 0 "SW1" H 1650 7367 50  0000 C CNN
F 1 "IO PAGE SELECT" H 1650 7276 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Slide_6.7x21.88mm_W7.62mm_P2.54mm_LowProfile" H 1650 6700 50  0001 C CNN
F 3 "~" H 1650 6700 50  0001 C CNN
	1    1650 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 61ED93AD
P 3350 7150
F 0 "#PWR0119" H 3350 6900 50  0001 C CNN
F 1 "GND" H 3450 7250 50  0000 C CNN
F 2 "" H 3350 7150 50  0001 C CNN
F 3 "" H 3350 7150 50  0001 C CNN
	1    3350 7150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0120
U 1 1 61ED9ED7
P 2950 5100
F 0 "#PWR0120" H 2950 4950 50  0001 C CNN
F 1 "VCC" H 2850 5100 50  0000 C CNN
F 2 "" H 2950 5100 50  0001 C CNN
F 3 "" H 2950 5100 50  0001 C CNN
	1    2950 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 6300 2000 6300
Wire Wire Line
	1950 6400 2050 6400
Wire Wire Line
	1950 6500 2100 6500
Wire Wire Line
	1950 6600 2150 6600
Wire Wire Line
	1950 6700 2200 6700
Wire Wire Line
	1950 6800 2250 6800
Wire Wire Line
	1950 6900 2300 6900
Wire Wire Line
	1950 7000 2350 7000
Wire Wire Line
	1350 6300 1350 6400
Wire Wire Line
	1350 6400 1350 6500
Connection ~ 1350 6400
Wire Wire Line
	1350 6500 1350 6600
Connection ~ 1350 6500
Wire Wire Line
	1350 6600 1350 6700
Connection ~ 1350 6600
Wire Wire Line
	1350 6700 1350 6800
Connection ~ 1350 6700
Wire Wire Line
	1350 6800 1350 6900
Connection ~ 1350 6800
Wire Wire Line
	1350 6900 1350 7000
Connection ~ 1350 6900
Wire Wire Line
	1350 7000 1350 7100
Connection ~ 1350 7000
$Comp
L power:GND #PWR0121
U 1 1 6200CDBB
P 1350 7100
F 0 "#PWR0121" H 1350 6850 50  0001 C CNN
F 1 "GND" H 1355 6927 50  0000 C CNN
F 2 "" H 1350 7100 50  0001 C CNN
F 3 "" H 1350 7100 50  0001 C CNN
	1    1350 7100
	1    0    0    -1  
$EndComp
Connection ~ 2350 7000
Wire Wire Line
	2350 7000 2450 7000
Connection ~ 2300 6900
Wire Wire Line
	2300 6900 2450 6900
Connection ~ 2250 6800
Wire Wire Line
	2250 6800 2450 6800
Connection ~ 2200 6700
Wire Wire Line
	2200 6700 2450 6700
Connection ~ 2150 6600
Wire Wire Line
	2150 6600 2450 6600
Connection ~ 2100 6500
Wire Wire Line
	2100 6500 2450 6500
Connection ~ 2050 6400
Wire Wire Line
	2050 6400 2450 6400
Connection ~ 2000 6300
Wire Wire Line
	2000 6300 2450 6300
$Comp
L Device:R_Network08_US RN2
U 1 1 620E22BC
P 1100 6600
F 0 "RN2" V 483 6600 50  0000 C CNN
F 1 "1K" V 574 6600 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 1575 6600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 1100 6600 50  0001 C CNN
	1    1100 6600
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0122
U 1 1 620E3834
P 1300 6200
F 0 "#PWR0122" H 1300 6050 50  0001 C CNN
F 1 "VCC" H 1315 6373 50  0000 C CNN
F 2 "" H 1300 6200 50  0001 C CNN
F 3 "" H 1300 6200 50  0001 C CNN
	1    1300 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  6900 900  7350
Wire Wire Line
	900  7350 2000 7350
Wire Wire Line
	2000 6300 2000 7350
Wire Wire Line
	2050 7400 850  7400
Wire Wire Line
	850  7400 850  6800
Wire Wire Line
	850  6800 900  6800
Wire Wire Line
	2050 6400 2050 7400
Wire Wire Line
	900  6700 800  6700
Wire Wire Line
	800  6700 800  7450
Wire Wire Line
	800  7450 2100 7450
Wire Wire Line
	2100 6500 2100 7450
Wire Wire Line
	2150 7500 750  7500
Wire Wire Line
	750  7500 750  6600
Wire Wire Line
	750  6600 900  6600
Wire Wire Line
	2150 6600 2150 7500
Wire Wire Line
	900  6500 700  6500
Wire Wire Line
	700  6500 700  7550
Wire Wire Line
	700  7550 2200 7550
Wire Wire Line
	2200 6700 2200 7550
Wire Wire Line
	2250 7600 650  7600
Wire Wire Line
	650  7600 650  6400
Wire Wire Line
	650  6400 900  6400
Wire Wire Line
	2250 6800 2250 7600
Wire Wire Line
	2300 7650 600  7650
Wire Wire Line
	600  7650 600  6300
Wire Wire Line
	600  6300 900  6300
Wire Wire Line
	2300 6900 2300 7650
Wire Wire Line
	2350 7700 550  7700
Wire Wire Line
	550  7700 550  6200
Wire Wire Line
	550  6200 900  6200
Wire Wire Line
	2350 7000 2350 7700
Wire Wire Line
	2450 5400 2300 5400
Wire Wire Line
	2450 5500 2300 5500
Wire Wire Line
	2450 5600 2300 5600
Wire Wire Line
	2450 5700 2300 5700
Wire Wire Line
	2450 5800 2300 5800
Wire Wire Line
	2450 5900 2300 5900
Wire Wire Line
	2450 6000 2300 6000
Wire Wire Line
	2450 6100 2300 6100
Text GLabel 2300 5400 0    50   Input ~ 0
A8
Text GLabel 2300 5500 0    50   Input ~ 0
A9
Text GLabel 2300 5600 0    50   Input ~ 0
A10
Text GLabel 2300 5700 0    50   Input ~ 0
A11
Text GLabel 2300 5800 0    50   Input ~ 0
A12
Text GLabel 2300 5900 0    50   Input ~ 0
A13
Text GLabel 2300 6000 0    50   Input ~ 0
A14
Text GLabel 2300 6100 0    50   Input ~ 0
A15
Wire Wire Line
	3450 5400 3600 5400
Text GLabel 3600 5400 2    50   Input ~ 0
_6502IO
Wire Wire Line
	2000 3900 2150 3900
Text GLabel 2150 3900 2    50   Input ~ 0
_6502IO
Wire Wire Line
	2000 3800 2500 3800
Text GLabel 2900 4800 0    50   Input ~ 0
_6502IO
Wire Wire Line
	6350 3850 6400 3850
Wire Wire Line
	6350 3950 6400 3950
Wire Wire Line
	6350 4050 6400 4050
Wire Wire Line
	6350 4150 6400 4150
Wire Wire Line
	6350 4250 6400 4250
Wire Wire Line
	6350 4350 6400 4350
Wire Wire Line
	6350 4450 6400 4450
Wire Wire Line
	6350 4550 6400 4550
Text GLabel 6400 3850 2    50   Input ~ 0
D0
Text GLabel 6400 3950 2    50   Input ~ 0
D1
Text GLabel 6400 4050 2    50   Input ~ 0
D2
Text GLabel 6400 4150 2    50   Input ~ 0
D3
Text GLabel 6400 4250 2    50   Input ~ 0
D4
Text GLabel 6400 4350 2    50   Input ~ 0
D5
Text GLabel 6400 4450 2    50   Input ~ 0
D6
Text GLabel 6400 4550 2    50   Input ~ 0
D7
$Comp
L Device:C C10
U 1 1 624A94F0
P 9850 6250
F 0 "C10" H 9800 6450 50  0000 L CNN
F 1 "0.1u" H 9750 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 9888 6100 50  0001 C CNN
F 3 "~" H 9850 6250 50  0001 C CNN
	1    9850 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 624A9F7D
P 9650 6250
F 0 "C9" H 9600 6450 50  0000 L CNN
F 1 "0.1u" H 9550 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 9688 6100 50  0001 C CNN
F 3 "~" H 9650 6250 50  0001 C CNN
	1    9650 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 624AA472
P 9450 6250
F 0 "C8" H 9400 6450 50  0000 L CNN
F 1 "0.1u" H 9350 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 9488 6100 50  0001 C CNN
F 3 "~" H 9450 6250 50  0001 C CNN
	1    9450 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 624AA6A8
P 9250 6250
F 0 "C7" H 9200 6450 50  0000 L CNN
F 1 "0.1u" H 9150 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 9288 6100 50  0001 C CNN
F 3 "~" H 9250 6250 50  0001 C CNN
	1    9250 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 624AA975
P 9050 6250
F 0 "C6" H 9000 6450 50  0000 L CNN
F 1 "0.1u" H 8950 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 9088 6100 50  0001 C CNN
F 3 "~" H 9050 6250 50  0001 C CNN
	1    9050 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 624AACAB
P 8850 6250
F 0 "C5" H 8800 6450 50  0000 L CNN
F 1 "0.1u" H 8750 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 8888 6100 50  0001 C CNN
F 3 "~" H 8850 6250 50  0001 C CNN
	1    8850 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 624AAFB1
P 8650 6250
F 0 "C4" H 8600 6450 50  0000 L CNN
F 1 "0.1u" H 8550 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 8688 6100 50  0001 C CNN
F 3 "~" H 8650 6250 50  0001 C CNN
	1    8650 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 4000 2150 4000
Wire Wire Line
	2000 4100 2150 4100
Text GLabel 2150 4000 2    50   Input ~ 0
_INT
Text GLabel 2150 4100 2    50   Input ~ 0
_NMI
Wire Wire Line
	1000 4000 900  4000
Wire Wire Line
	1000 4100 900  4100
Text GLabel 900  4000 0    50   Input ~ 0
_6502INT
Text GLabel 900  4100 0    50   Input ~ 0
_6502NMI
Wire Wire Line
	3700 2000 3500 2000
Wire Wire Line
	3700 2100 3500 2100
Text GLabel 3500 2000 0    50   Input ~ 0
_6502INT
Text GLabel 3500 2100 0    50   Input ~ 0
_6502NMI
NoConn ~ 3700 3100
NoConn ~ 3700 1700
Text GLabel 2900 4450 0    50   Input ~ 0
_6502EN
$Comp
L power:GND #PWR0123
U 1 1 6277E8F9
P 950 5450
F 0 "#PWR0123" H 950 5200 50  0001 C CNN
F 1 "GND" H 955 5277 50  0000 C CNN
F 2 "" H 950 5450 50  0001 C CNN
F 3 "" H 950 5450 50  0001 C CNN
	1    950  5450
	1    0    0    -1  
$EndComp
Text GLabel 950  5350 0    50   Input ~ 0
_6502EN
$Comp
L 74xx:74LS74 U11
U 1 1 627A6319
P 10400 4000
F 0 "U11" H 10200 4250 50  0000 C CNN
F 1 "74LS74" H 10600 4250 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 10400 4000 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 10400 4000 50  0001 C CNN
	1    10400 4000
	1    0    0    1   
$EndComp
Text GLabel 10700 4300 2    50   Input ~ 0
_RESET
Wire Wire Line
	10400 4300 10700 4300
$Comp
L power:VCC #PWR0124
U 1 1 628182FA
P 10400 3700
F 0 "#PWR0124" H 10400 3550 50  0001 C CNN
F 1 "VCC" H 10415 3873 50  0000 C CNN
F 2 "" H 10400 3700 50  0001 C CNN
F 3 "" H 10400 3700 50  0001 C CNN
	1    10400 3700
	1    0    0    -1  
$EndComp
Text GLabel 10850 4100 2    50   Input ~ 0
_BUSRQ
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 6283E9F1
P 1250 5350
F 0 "J1" H 1222 5282 50  0000 R CNN
F 1 "6502 ONLY" H 1222 5373 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 1250 5350 50  0001 C CNN
F 3 "~" H 1250 5350 50  0001 C CNN
	1    1250 5350
	-1   0    0    1   
$EndComp
Wire Wire Line
	950  5350 1050 5350
Text GLabel 950  5250 0    50   Input ~ 0
_BUSACK
Wire Wire Line
	950  5250 1050 5250
Wire Wire Line
	950  5450 1050 5450
Wire Wire Line
	10800 3450 10800 3900
Wire Wire Line
	10800 3900 10700 3900
Wire Wire Line
	9600 3450 9600 4100
Wire Wire Line
	9600 4100 10100 4100
Wire Wire Line
	9600 3450 10800 3450
$Comp
L Device:C C3
U 1 1 629937D7
P 8450 6250
F 0 "C3" H 8400 6450 50  0000 L CNN
F 1 "0.1u" H 8350 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 8488 6100 50  0001 C CNN
F 3 "~" H 8450 6250 50  0001 C CNN
	1    8450 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 62993D15
P 8250 6250
F 0 "C2" H 8200 6450 50  0000 L CNN
F 1 "0.1u" H 8150 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 8288 6100 50  0001 C CNN
F 3 "~" H 8250 6250 50  0001 C CNN
	1    8250 6250
	1    0    0    -1  
$EndComp
Text GLabel 10050 4000 0    50   Input ~ 0
65TOGGLE
Wire Wire Line
	10050 4000 10100 4000
$Comp
L 74xx:74LS688 U9
U 1 1 62A0B07C
P 6350 6350
F 0 "U9" H 6450 7400 50  0000 L CNN
F 1 "74LS688" H 6300 6350 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 6350 6350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS688" H 6350 6350 50  0001 C CNN
	1    6350 6350
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x08 SW3
U 1 1 62A0B086
P 5050 6750
F 0 "SW3" H 5050 7417 50  0000 C CNN
F 1 "IO ADDRESS SELECT" H 5150 7300 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Slide_6.7x21.88mm_W7.62mm_P2.54mm_LowProfile" H 5050 6750 50  0001 C CNN
F 3 "~" H 5050 6750 50  0001 C CNN
	1    5050 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 62A0B090
P 6350 7550
F 0 "#PWR0125" H 6350 7300 50  0001 C CNN
F 1 "GND" H 6450 7650 50  0000 C CNN
F 2 "" H 6350 7550 50  0001 C CNN
F 3 "" H 6350 7550 50  0001 C CNN
	1    6350 7550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0126
U 1 1 62A0B09A
P 6350 5150
F 0 "#PWR0126" H 6350 5000 50  0001 C CNN
F 1 "VCC" H 6250 5150 50  0000 C CNN
F 2 "" H 6350 5150 50  0001 C CNN
F 3 "" H 6350 5150 50  0001 C CNN
	1    6350 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 6350 5400 6350
Wire Wire Line
	5350 6450 5450 6450
Wire Wire Line
	5350 6550 5500 6550
Wire Wire Line
	5350 6650 5550 6650
Wire Wire Line
	5350 6750 5600 6750
Wire Wire Line
	5350 6850 5650 6850
Wire Wire Line
	5350 6950 5700 6950
Wire Wire Line
	5350 7050 5750 7050
Wire Wire Line
	4750 6350 4750 6450
Wire Wire Line
	4750 6450 4750 6550
Connection ~ 4750 6450
Wire Wire Line
	4750 6550 4750 6650
Connection ~ 4750 6550
Wire Wire Line
	4750 6650 4750 6750
Connection ~ 4750 6650
Wire Wire Line
	4750 6750 4750 6850
Connection ~ 4750 6750
Wire Wire Line
	4750 6850 4750 6950
Connection ~ 4750 6850
Wire Wire Line
	4750 6950 4750 7050
Connection ~ 4750 6950
Wire Wire Line
	4750 7050 4750 7150
Connection ~ 4750 7050
$Comp
L power:GND #PWR0127
U 1 1 62A0B0BB
P 4750 7150
F 0 "#PWR0127" H 4750 6900 50  0001 C CNN
F 1 "GND" H 4755 6977 50  0000 C CNN
F 2 "" H 4750 7150 50  0001 C CNN
F 3 "" H 4750 7150 50  0001 C CNN
	1    4750 7150
	1    0    0    -1  
$EndComp
Connection ~ 5750 7050
Wire Wire Line
	5750 7050 5850 7050
Connection ~ 5700 6950
Wire Wire Line
	5700 6950 5850 6950
Connection ~ 5650 6850
Wire Wire Line
	5650 6850 5850 6850
Connection ~ 5600 6750
Wire Wire Line
	5600 6750 5850 6750
Connection ~ 5550 6650
Wire Wire Line
	5550 6650 5850 6650
Connection ~ 5500 6550
Wire Wire Line
	5500 6550 5850 6550
Connection ~ 5450 6450
Wire Wire Line
	5450 6450 5850 6450
Connection ~ 5400 6350
Wire Wire Line
	5400 6350 5850 6350
$Comp
L Device:R_Network08_US RN3
U 1 1 62A0B0D5
P 4500 6650
F 0 "RN3" V 3883 6650 50  0000 C CNN
F 1 "1K" V 3974 6650 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4975 6650 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4500 6650 50  0001 C CNN
	1    4500 6650
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0128
U 1 1 62A0B0DF
P 4700 6250
F 0 "#PWR0128" H 4700 6100 50  0001 C CNN
F 1 "VCC" H 4715 6423 50  0000 C CNN
F 2 "" H 4700 6250 50  0001 C CNN
F 3 "" H 4700 6250 50  0001 C CNN
	1    4700 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 6950 4300 7400
Wire Wire Line
	4300 7400 5400 7400
Wire Wire Line
	5400 6350 5400 7400
Wire Wire Line
	5450 7450 4250 7450
Wire Wire Line
	4250 7450 4250 6850
Wire Wire Line
	4250 6850 4300 6850
Wire Wire Line
	5450 6450 5450 7450
Wire Wire Line
	4300 6750 4200 6750
Wire Wire Line
	4200 6750 4200 7500
Wire Wire Line
	4200 7500 5500 7500
Wire Wire Line
	5500 6550 5500 7500
Wire Wire Line
	5550 7550 4150 7550
Wire Wire Line
	4150 7550 4150 6650
Wire Wire Line
	4150 6650 4300 6650
Wire Wire Line
	5550 6650 5550 7550
Wire Wire Line
	4300 6550 4100 6550
Wire Wire Line
	4100 6550 4100 7600
Wire Wire Line
	4100 7600 5600 7600
Wire Wire Line
	5600 6750 5600 7600
Wire Wire Line
	5650 7650 4050 7650
Wire Wire Line
	4050 7650 4050 6450
Wire Wire Line
	4050 6450 4300 6450
Wire Wire Line
	5650 6850 5650 7650
Wire Wire Line
	5700 7700 4000 7700
Wire Wire Line
	4000 7700 4000 6350
Wire Wire Line
	4000 6350 4300 6350
Wire Wire Line
	5700 6950 5700 7700
Wire Wire Line
	5750 7750 3950 7750
Wire Wire Line
	3950 7750 3950 6250
Wire Wire Line
	3950 6250 4300 6250
Wire Wire Line
	5750 7050 5750 7750
Wire Wire Line
	5850 5450 5700 5450
Wire Wire Line
	5850 5550 5700 5550
Wire Wire Line
	5850 5650 5700 5650
Wire Wire Line
	5850 5750 5700 5750
Wire Wire Line
	5850 5850 5700 5850
Wire Wire Line
	5850 5950 5700 5950
Wire Wire Line
	5850 6050 5700 6050
Wire Wire Line
	5850 6150 5700 6150
Text GLabel 5700 5450 0    50   Input ~ 0
A0
Text GLabel 5700 5550 0    50   Input ~ 0
A1
Text GLabel 5700 5650 0    50   Input ~ 0
A2
Text GLabel 5700 5750 0    50   Input ~ 0
A3
Text GLabel 5700 5850 0    50   Input ~ 0
A4
Text GLabel 5700 5950 0    50   Input ~ 0
A5
Text GLabel 5700 6050 0    50   Input ~ 0
A6
Text GLabel 5700 6150 0    50   Input ~ 0
A7
$Comp
L 74xx:74LS04 U4
U 5 1 62A524B6
P 7300 5450
F 0 "U4" H 7300 5767 50  0000 C CNN
F 1 "74LS04" H 7300 5676 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 7300 5450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7300 5450 50  0001 C CNN
	5    7300 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 5450 7700 5450
Text GLabel 8550 5450 2    50   Input ~ 0
65TOGGLE
Connection ~ 9050 6100
Wire Wire Line
	11050 6100 10950 6100
Connection ~ 10800 6100
Wire Wire Line
	11050 6400 10950 6400
Connection ~ 9050 6400
Connection ~ 10800 6400
$Comp
L power:GND #PWR0129
U 1 1 62B61353
P 7000 6400
F 0 "#PWR0129" H 7000 6150 50  0001 C CNN
F 1 "GND" H 7150 6300 50  0000 C CNN
F 2 "" H 7000 6400 50  0001 C CNN
F 3 "" H 7000 6400 50  0001 C CNN
	1    7000 6400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0130
U 1 1 62B6235A
P 7300 6100
F 0 "#PWR0130" H 7300 5950 50  0001 C CNN
F 1 "VCC" H 7450 6150 50  0000 C CNN
F 2 "" H 7300 6100 50  0001 C CNN
F 3 "" H 7300 6100 50  0001 C CNN
	1    7300 6100
	1    0    0    -1  
$EndComp
Text GLabel 5700 1950 0    50   Input ~ 0
_6502EN
Text GLabel 6400 3350 0    50   Input ~ 0
_6502EN
Wire Wire Line
	5700 1950 5800 1950
Wire Wire Line
	5800 1950 5800 1850
Connection ~ 5800 1950
Wire Wire Line
	6400 3350 6500 3350
Wire Wire Line
	6500 3350 6500 3250
Connection ~ 6500 3350
Text GLabel 2150 4600 2    50   Input ~ 0
_6502EN
Wire Wire Line
	2150 4600 2000 4600
Wire Wire Line
	2000 4600 2000 4500
Connection ~ 2000 4600
Text GLabel 6500 4850 2    50   Input ~ 0
_6502EN
NoConn ~ 2000 4200
NoConn ~ 2000 4300
NoConn ~ 1000 4300
NoConn ~ 1000 4200
Text GLabel 3500 7400 2    50   Input ~ 0
_6502EN
Wire Wire Line
	5850 7250 5850 7700
Wire Wire Line
	5850 7700 5950 7700
Text GLabel 5950 7700 2    50   Input ~ 0
_IORQ
$Comp
L 74xx:74LS04 U4
U 4 1 62F3177C
P 3300 4450
F 0 "U4" H 3250 4450 50  0000 C CNN
F 1 "74LS04" H 3450 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3300 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3300 4450 50  0001 C CNN
	4    3300 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4450 2900 4450
Wire Wire Line
	3600 4450 3700 4450
Text GLabel 3700 4450 2    50   Input ~ 0
6502EN
NoConn ~ 10000 2750
NoConn ~ 10000 2950
NoConn ~ 10000 3050
NoConn ~ 10000 3150
NoConn ~ 10500 3150
NoConn ~ 10500 3050
NoConn ~ 10500 2950
NoConn ~ 10500 2850
$Comp
L 74xx:74LS07 U3
U 4 1 634558DF
P 8500 1250
F 0 "U3" H 8450 1250 50  0000 C CNN
F 1 "74LS07" H 8550 1100 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8500 1250 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 8500 1250 50  0001 C CNN
	4    8500 1250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 U3
U 5 1 63457A48
P 8500 1600
F 0 "U3" H 8450 1600 50  0000 C CNN
F 1 "74LS07" H 8600 1450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8500 1600 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 8500 1600 50  0001 C CNN
	5    8500 1600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS07 U3
U 6 1 63458E82
P 8500 1950
F 0 "U3" H 8450 1950 50  0000 C CNN
F 1 "74LS07" H 8600 1800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8500 1950 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 8500 1950 50  0001 C CNN
	6    8500 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D6
U 1 1 6345E0CA
P 8950 1950
F 0 "D6" H 8900 2050 50  0000 L CNN
F 1 "NMI" H 8950 1900 50  0000 C TNN
F 2 "LED_THT:LED_D3.0mm" H 8950 1950 50  0001 C CNN
F 3 "~" H 8950 1950 50  0001 C CNN
	1    8950 1950
	1    0    0    1   
$EndComp
$Comp
L Device:LED D5
U 1 1 6345E83D
P 8950 1600
F 0 "D5" H 8900 1700 50  0000 L CNN
F 1 "INT" H 8950 1550 50  0000 C TNN
F 2 "LED_THT:LED_D3.0mm" H 8950 1600 50  0001 C CNN
F 3 "~" H 8950 1600 50  0001 C CNN
	1    8950 1600
	1    0    0    1   
$EndComp
$Comp
L Device:R R7
U 1 1 6345F946
P 9250 1950
F 0 "R7" V 9150 1950 50  0000 C CNN
F 1 "470" V 9250 1950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9180 1950 50  0001 C CNN
F 3 "~" H 9250 1950 50  0001 C CNN
	1    9250 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 6345FE30
P 9250 1600
F 0 "R6" V 9150 1600 50  0000 C CNN
F 1 "470" V 9250 1600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9180 1600 50  0001 C CNN
F 3 "~" H 9250 1600 50  0001 C CNN
	1    9250 1600
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 6346026E
P 9250 1250
F 0 "R5" V 9150 1250 50  0000 C CNN
F 1 "470" V 9250 1250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9180 1250 50  0001 C CNN
F 3 "~" H 9250 1250 50  0001 C CNN
	1    9250 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 1250 9400 1600
Connection ~ 9400 1600
Wire Wire Line
	9400 1600 9400 1950
Wire Wire Line
	8050 1600 8200 1600
Wire Wire Line
	8050 1950 8200 1950
$Comp
L 74xx:74LS07 U3
U 7 1 6361F0CC
P 10550 5150
F 0 "U3" H 10500 5200 50  0000 L CNN
F 1 "74LS07" H 10450 5100 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 10550 5150 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 10550 5150 50  0001 C CNN
	7    10550 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 6362099C
P 10550 5650
F 0 "#PWR0132" H 10550 5400 50  0001 C CNN
F 1 "GND" H 10555 5477 50  0000 C CNN
F 2 "" H 10550 5650 50  0001 C CNN
F 3 "" H 10550 5650 50  0001 C CNN
	1    10550 5650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0133
U 1 1 63621914
P 10550 4650
F 0 "#PWR0133" H 10550 4500 50  0001 C CNN
F 1 "VCC" H 10565 4823 50  0000 C CNN
F 2 "" H 10550 4650 50  0001 C CNN
F 3 "" H 10550 4650 50  0001 C CNN
	1    10550 4650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U11
U 2 1 63624957
P 8850 4250
F 0 "U11" H 8850 4731 50  0000 C CNN
F 1 "74LS74" H 8850 4640 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8850 4250 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 8850 4250 50  0001 C CNN
	2    8850 4250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS74 U11
U 3 1 63626612
P 10100 5150
F 0 "U11" H 10000 5200 50  0000 L CNN
F 1 "74LS74" H 9950 5100 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 10100 5150 50  0001 C CNN
F 3 "74xx/74hc_hct74.pdf" H 10100 5150 50  0001 C CNN
	3    10100 5150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0134
U 1 1 63629036
P 10100 4750
F 0 "#PWR0134" H 10100 4600 50  0001 C CNN
F 1 "VCC" H 10115 4923 50  0000 C CNN
F 2 "" H 10100 4750 50  0001 C CNN
F 3 "" H 10100 4750 50  0001 C CNN
	1    10100 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 63629FBB
P 10100 5550
F 0 "#PWR0135" H 10100 5300 50  0001 C CNN
F 1 "GND" H 10105 5377 50  0000 C CNN
F 2 "" H 10100 5550 50  0001 C CNN
F 3 "" H 10100 5550 50  0001 C CNN
	1    10100 5550
	1    0    0    -1  
$EndComp
NoConn ~ 8550 4250
NoConn ~ 8550 4150
$Comp
L 74xx:74LS04 U4
U 7 1 63791A5B
P 9650 5150
F 0 "U4" H 9550 5250 50  0000 L CNN
F 1 "74LS04" H 9500 5150 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 9650 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 9650 5150 50  0001 C CNN
	7    9650 5150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0136
U 1 1 63792413
P 9650 4650
F 0 "#PWR0136" H 9650 4500 50  0001 C CNN
F 1 "VCC" H 9665 4823 50  0000 C CNN
F 2 "" H 9650 4650 50  0001 C CNN
F 3 "" H 9650 4650 50  0001 C CNN
	1    9650 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0137
U 1 1 637928C7
P 9650 5650
F 0 "#PWR0137" H 9650 5400 50  0001 C CNN
F 1 "GND" H 9655 5477 50  0000 C CNN
F 2 "" H 9650 5650 50  0001 C CNN
F 3 "" H 9650 5650 50  0001 C CNN
	1    9650 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D7
U 1 1 6379702B
P 8950 2350
F 0 "D7" H 8900 2450 50  0000 L CNN
F 1 "6502" H 8950 2300 50  0000 C TNN
F 2 "LED_THT:LED_D3.0mm" H 8950 2350 50  0001 C CNN
F 3 "~" H 8950 2350 50  0001 C CNN
	1    8950 2350
	1    0    0    1   
$EndComp
$Comp
L Device:R R8
U 1 1 63797342
P 9250 2350
F 0 "R8" V 9150 2350 50  0000 C CNN
F 1 "470" V 9250 2350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9180 2350 50  0001 C CNN
F 3 "~" H 9250 2350 50  0001 C CNN
	1    9250 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 2350 9400 1950
Connection ~ 9400 1950
Text GLabel 8050 1600 0    50   Input ~ 0
_6502INT
Text GLabel 8050 1950 0    50   Input ~ 0
_6502NMI
$Comp
L Device:C C14
U 1 1 6381B6E5
P 8050 6250
F 0 "C14" H 8000 6450 50  0000 L CNN
F 1 "0.1u" H 7950 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 8088 6100 50  0001 C CNN
F 3 "~" H 8050 6250 50  0001 C CNN
	1    8050 6250
	1    0    0    -1  
$EndComp
Connection ~ 8050 6100
Wire Wire Line
	8050 6100 8250 6100
Connection ~ 8050 6400
Wire Wire Line
	8050 6400 8250 6400
$Comp
L 74xx:74LS04 U4
U 3 1 623070A1
P 3300 4800
F 0 "U4" H 3250 4800 50  0000 C CNN
F 1 "74LS04" H 3450 4700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3300 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3300 4800 50  0001 C CNN
	3    3300 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 4100 10850 4100
Text GLabel 2900 1650 2    50   Input ~ 0
_RESET
Wire Wire Line
	2750 1650 2900 1650
Wire Wire Line
	2750 1850 2900 1850
Wire Wire Line
	2750 1750 3250 1750
Wire Wire Line
	3250 1750 3250 1400
Wire Wire Line
	3250 1200 3700 1200
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 61B8D79B
P 2550 1750
F 0 "J4" H 2522 1682 50  0000 R CNN
F 1 "6502 RESET" H 2522 1773 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 2550 1750 50  0001 C CNN
F 3 "~" H 2550 1750 50  0001 C CNN
	1    2550 1750
	1    0    0    -1  
$EndComp
Text Notes 2100 2000 0    50   ~ 0
1&2 - stand alone\n2&3 - secondary CPU
Text Notes 1100 5650 0    50   ~ 0
1&2 - stand alone\n2&3 - secondary CPU
Text Notes 2500 2250 0    50   ~ 0
CLK/2
Text Notes 2500 2350 0    50   ~ 0
CLK/4
Text Notes 2500 2450 0    50   ~ 0
CLK/8
Text Notes 2500 2550 0    50   ~ 0
CLK/16
$Comp
L 74xx:74LS32 U12
U 1 1 61C21F81
P 2500 2850
F 0 "U12" H 2900 2800 50  0000 C CNN
F 1 "74LS32" H 2800 2900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2500 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2500 2850 50  0001 C CNN
	1    2500 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	2200 2850 2000 2850
Wire Wire Line
	2900 2400 2900 2750
Wire Wire Line
	2900 2750 2800 2750
Wire Wire Line
	3150 3150 3150 2400
Connection ~ 3150 2400
Wire Wire Line
	3150 2400 3300 2400
Text GLabel 2850 2950 2    50   Input ~ 0
ICLK
Wire Wire Line
	2800 2950 2850 2950
$Comp
L 74xx:74LS32 U12
U 2 1 61E82EEA
P 3200 7600
F 0 "U12" H 3200 7600 50  0000 C CNN
F 1 "74LS32" H 3500 7700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 3200 7600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3200 7600 50  0001 C CNN
	2    3200 7600
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS32 U12
U 3 1 61E85BEE
P 2350 3550
F 0 "U12" H 2350 3550 50  0000 C CNN
F 1 "74LS32" H 2350 3350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 2350 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2350 3550 50  0001 C CNN
	3    2350 3550
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS32 U12
U 4 1 61E88AF0
P 8100 4200
F 0 "U12" H 8300 4350 50  0000 C CNN
F 1 "74LS32" H 8300 4050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8100 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8100 4200 50  0001 C CNN
	4    8100 4200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U12
U 5 1 61E8C467
P 11000 5150
F 0 "U12" H 10950 5200 50  0000 L CNN
F 1 "74LS32" H 10900 5100 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 11000 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 11000 5150 50  0001 C CNN
	5    11000 5150
	1    0    0    -1  
$EndComp
NoConn ~ 7800 4100
NoConn ~ 7800 4300
NoConn ~ 8400 4200
$Comp
L power:VCC #PWR01
U 1 1 6218A1D8
P 11000 4650
F 0 "#PWR01" H 11000 4500 50  0001 C CNN
F 1 "VCC" H 11015 4823 50  0000 C CNN
F 2 "" H 11000 4650 50  0001 C CNN
F 3 "" H 11000 4650 50  0001 C CNN
	1    11000 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 6218A8C3
P 11000 5650
F 0 "#PWR02" H 11000 5400 50  0001 C CNN
F 1 "GND" H 11005 5477 50  0000 C CNN
F 2 "" H 11000 5650 50  0001 C CNN
F 3 "" H 11000 5650 50  0001 C CNN
	1    11000 5650
	1    0    0    -1  
$EndComp
Text GLabel 2900 1850 2    50   Input ~ 0
6502EN
Wire Wire Line
	8200 2350 8150 2350
$Comp
L Device:C C16
U 1 1 623239F5
P 7850 6250
F 0 "C16" H 7800 6450 50  0000 L CNN
F 1 "0.1u" H 7750 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 7888 6100 50  0001 C CNN
F 3 "~" H 7850 6250 50  0001 C CNN
	1    7850 6250
	1    0    0    -1  
$EndComp
Connection ~ 7850 6100
Wire Wire Line
	7850 6100 8050 6100
Connection ~ 7850 6400
Wire Wire Line
	7850 6400 8050 6400
$Comp
L Device:C C15
U 1 1 62323EE6
P 7650 6250
F 0 "C15" H 7600 6450 50  0000 L CNN
F 1 "0.1u" H 7550 6050 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.5mm_W2.5mm_P5.00mm" H 7688 6100 50  0001 C CNN
F 3 "~" H 7650 6250 50  0001 C CNN
	1    7650 6250
	1    0    0    -1  
$EndComp
Connection ~ 7650 6100
Wire Wire Line
	7650 6100 7850 6100
Connection ~ 7650 6400
Wire Wire Line
	7650 6400 7850 6400
Wire Wire Line
	2950 7500 3050 7500
Wire Wire Line
	3050 7500 3050 7350
Wire Wire Line
	3050 7350 3300 7350
Wire Wire Line
	3300 7350 3300 7100
Wire Wire Line
	3300 7100 3350 7100
Wire Wire Line
	3350 7100 3350 7150
Wire Wire Line
	2450 7600 2900 7600
Wire Wire Line
	2450 7200 2450 7600
Wire Wire Line
	3500 7500 3500 7400
Text GLabel 3550 7700 2    50   Input ~ 0
ICLK
Wire Wire Line
	3550 7700 3500 7700
NoConn ~ 8850 3950
NoConn ~ 9150 4150
NoConn ~ 9150 4350
NoConn ~ 8850 4550
Wire Wire Line
	6850 5450 7000 5450
Wire Wire Line
	2900 4800 3000 4800
Text GLabel 3750 4800 2    50   Input ~ 0
6502IO
Wire Wire Line
	3750 4800 3600 4800
Text GLabel 2500 3800 2    50   Input ~ 0
6502IO
Wire Wire Line
	6350 4850 6500 4850
Wire Wire Line
	6350 4750 6500 4750
Text GLabel 3300 2300 0    50   Input ~ 0
_6502WR
Text GLabel 6500 4750 2    50   Input ~ 0
_6502WR
Wire Wire Line
	3300 2300 3300 2400
Connection ~ 3300 2400
Wire Wire Line
	3300 2400 3700 2400
Wire Wire Line
	2000 2850 2000 3600
Wire Wire Line
	2050 3550 2050 3700
Wire Wire Line
	2700 3450 2650 3450
Wire Wire Line
	3300 3450 3300 3150
Wire Wire Line
	3300 3150 3150 3150
Text GLabel 3250 3650 2    50   Input ~ 0
ICLK
Wire Wire Line
	3250 3650 2650 3650
Wire Wire Line
	8300 5450 8400 5450
Wire Notes Line
	9250 4650 7550 4650
Wire Notes Line
	7550 4650 7550 3550
Wire Notes Line
	7550 3550 9250 3550
Wire Notes Line
	9250 3550 9250 4650
Text Notes 7600 4600 0    50   ~ 0
Spares\n
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 62891135
P 10950 6100
F 0 "#FLG0101" H 10950 6175 50  0001 C CNN
F 1 "PWR_FLAG" H 10950 6273 50  0000 C CNN
F 2 "" H 10950 6100 50  0001 C CNN
F 3 "~" H 10950 6100 50  0001 C CNN
	1    10950 6100
	1    0    0    -1  
$EndComp
Connection ~ 10950 6100
Wire Wire Line
	10950 6100 10800 6100
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 62896E97
P 10950 6400
F 0 "#FLG0102" H 10950 6475 50  0001 C CNN
F 1 "PWR_FLAG" H 10950 6573 50  0000 C CNN
F 2 "" H 10950 6400 50  0001 C CNN
F 3 "~" H 10950 6400 50  0001 C CNN
	1    10950 6400
	-1   0    0    1   
$EndComp
Connection ~ 10950 6400
Wire Wire Line
	10950 6400 10800 6400
Text Notes 10500 7300 0    50   ~ 0
V1.1 1/17/2022\n
Wire Wire Line
	3700 2700 3650 2700
$Comp
L power:VCC #PWR0138
U 1 1 62A16BA1
P 3300 2700
F 0 "#PWR0138" H 3300 2550 50  0001 C CNN
F 1 "VCC" H 3315 2873 50  0000 C CNN
F 2 "" H 3300 2700 50  0001 C CNN
F 3 "" H 3300 2700 50  0001 C CNN
	1    3300 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 2700 3300 2700
Wire Wire Line
	3700 3600 3700 3850
$Comp
L power:VCC #PWR0139
U 1 1 62AFBCB1
P 3300 3850
F 0 "#PWR0139" H 3300 3700 50  0001 C CNN
F 1 "VCC" H 3315 4023 50  0000 C CNN
F 2 "" H 3300 3850 50  0001 C CNN
F 3 "" H 3300 3850 50  0001 C CNN
	1    3300 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3400 3850 3300 3850
Wire Wire Line
	2400 2100 2400 2200
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J2
U 1 1 62BEBD9E
P 2100 2300
F 0 "J2" H 2150 2500 50  0000 C CNN
F 1 "Clock Speed" H 2100 2000 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Horizontal" H 2100 2300 50  0001 C CNN
F 3 "~" H 2100 2300 50  0001 C CNN
	1    2100 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2200 2400 2300
Connection ~ 2400 2200
Wire Wire Line
	2400 2300 2400 2400
Connection ~ 2400 2300
Wire Wire Line
	2400 2400 2400 2500
Connection ~ 2400 2400
$Comp
L 65xx:65CE02 U6
U 1 1 61EA9F26
P 4300 2400
F 0 "U6" H 4300 4131 50  0000 C CNN
F 1 "65CE02" H 4300 4040 50  0000 C CIB
F 2 "Package_DIP:DIP-40_W15.24mm_Socket_LongPads" H 4300 4400 50  0001 C CNN
F 3 "http://www.6502.org/documents/datasheets/mos/mos_65ce02_mpu.pdf" H 4300 4300 50  0001 C CNN
	1    4300 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 3950 4300 3950
Connection ~ 4300 3950
$Comp
L Device:LED D4
U 1 1 6345EBB2
P 8950 1250
F 0 "D4" H 8900 1350 50  0000 L CNN
F 1 "IR" H 8950 1200 50  0000 C TNN
F 2 "LED_THT:LED_D3.0mm" H 8950 1250 50  0001 C CNN
F 3 "~" H 8950 1250 50  0001 C CNN
	1    8950 1250
	1    0    0    1   
$EndComp
Wire Wire Line
	8050 1250 8200 1250
Text GLabel 8050 1250 0    50   Input ~ 0
_IORQ
$Comp
L power:VCC #PWR03
U 1 1 61F9A4C7
P 4250 4450
F 0 "#PWR03" H 4250 4300 50  0001 C CNN
F 1 "VCC" H 4265 4623 50  0000 C CNN
F 2 "" H 4250 4450 50  0001 C CNN
F 3 "" H 4250 4450 50  0001 C CNN
	1    4250 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4450 4250 4450
Wire Wire Line
	4700 5150 5300 5150
Wire Wire Line
	5300 5150 5300 4550
Connection ~ 5300 4550
Wire Wire Line
	5300 4550 5350 4550
Wire Wire Line
	4700 5050 5250 5050
Wire Wire Line
	5250 5050 5250 4450
Connection ~ 5250 4450
Wire Wire Line
	5250 4450 5350 4450
Wire Wire Line
	4700 4950 5200 4950
Wire Wire Line
	5200 4950 5200 4350
Connection ~ 5200 4350
Wire Wire Line
	5200 4350 5350 4350
Wire Wire Line
	4700 4850 5150 4850
Wire Wire Line
	5150 4850 5150 4250
Connection ~ 5150 4250
Wire Wire Line
	4950 4750 4950 4150
Wire Wire Line
	4950 4150 5200 4150
Connection ~ 5200 4150
Wire Wire Line
	4700 4750 4950 4750
Wire Wire Line
	4700 4650 4900 4650
Wire Wire Line
	4900 4650 4900 4050
Wire Wire Line
	4900 4050 5250 4050
Connection ~ 5250 4050
Wire Wire Line
	4700 4550 4850 4550
Wire Wire Line
	4850 4550 4850 3950
Wire Wire Line
	4850 3950 5300 3950
Connection ~ 5300 3950
Wire Wire Line
	4700 4450 4800 4450
Wire Wire Line
	4800 4450 4800 3850
Wire Wire Line
	4800 3850 5350 3850
Connection ~ 5350 3850
$Comp
L Device:R_Network09_US RN4
U 1 1 622B4763
P 4500 4850
F 0 "RN4" V 3883 4850 50  0000 C CNN
F 1 "2.2k" V 3974 4850 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP10" V 5075 4850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4500 4850 50  0001 C CNN
	1    4500 4850
	0    -1   1    0   
$EndComp
Text GLabel 4850 5250 2    50   Input ~ 0
CLKO
Wire Wire Line
	4700 5250 4850 5250
Wire Wire Line
	3700 1600 3600 1600
Text GLabel 3600 1600 0    50   Input ~ 0
ICLK
$Comp
L power:VCC #PWR0131
U 1 1 6349AE32
P 9400 850
F 0 "#PWR0131" H 9400 700 50  0001 C CNN
F 1 "VCC" H 9415 1023 50  0000 C CNN
F 2 "" H 9400 850 50  0001 C CNN
F 3 "" H 9400 850 50  0001 C CNN
	1    9400 850 
	1    0    0    -1  
$EndComp
Connection ~ 9400 1250
Wire Wire Line
	9400 850  9400 1250
Connection ~ 9400 850 
$Comp
L Device:R R4
U 1 1 6346052E
P 9250 850
F 0 "R4" V 9150 850 50  0000 C CNN
F 1 "470" V 9250 850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9180 850 50  0001 C CNN
F 3 "~" H 9250 850 50  0001 C CNN
	1    9250 850 
	0    1    1    0   
$EndComp
$Comp
L Device:LED D3
U 1 1 6345F3DF
P 8950 850
F 0 "D3" H 8900 950 50  0000 L CNN
F 1 "MR" H 8950 800 50  0000 C TNN
F 2 "LED_THT:LED_D3.0mm" H 8950 850 50  0001 C CNN
F 3 "~" H 8950 850 50  0001 C CNN
	1    8950 850 
	1    0    0    1   
$EndComp
Wire Wire Line
	8050 850  8200 850 
Text GLabel 8050 850  0    50   Input ~ 0
_MREQ
Text GLabel 8150 2350 0    50   Input ~ 0
6502EN
$Comp
L 74xx:74LS07 U3
U 3 1 63454DAB
P 8500 850
F 0 "U3" H 8450 850 50  0000 C CNN
F 1 "74LS07" H 8550 700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8500 850 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 8500 850 50  0001 C CNN
	3    8500 850 
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 6 1 63795479
P 8500 2350
F 0 "U4" H 8450 2350 50  0000 C CNN
F 1 "74LS04" H 8600 2200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket_LongPads" H 8500 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 8500 2350 50  0001 C CNN
	6    8500 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Polarized C17
U 1 1 626086CB
P 7450 6250
F 0 "C17" H 7400 6450 50  0000 L CNN
F 1 "10u" H 7450 6050 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 7488 6100 50  0001 C CNN
F 3 "~" H 7450 6250 50  0001 C CNN
	1    7450 6250
	1    0    0    -1  
$EndComp
Connection ~ 7450 6100
Wire Wire Line
	7450 6100 7650 6100
Connection ~ 7450 6400
Wire Wire Line
	7450 6400 7650 6400
Connection ~ 7000 6400
Connection ~ 7300 6100
Wire Wire Line
	7300 6100 7450 6100
Connection ~ 8250 6100
Connection ~ 8250 6400
Wire Wire Line
	8250 6100 8450 6100
Wire Wire Line
	8250 6400 8450 6400
Connection ~ 8450 6100
Connection ~ 8450 6400
Wire Wire Line
	8450 6100 8650 6100
Wire Wire Line
	8450 6400 8650 6400
Connection ~ 8650 6100
Connection ~ 8650 6400
Wire Wire Line
	8650 6100 8850 6100
Wire Wire Line
	8650 6400 8850 6400
Connection ~ 8850 6100
Wire Wire Line
	8850 6100 9050 6100
Connection ~ 8850 6400
Wire Wire Line
	8850 6400 9050 6400
Connection ~ 9250 6100
Wire Wire Line
	9250 6100 9050 6100
Connection ~ 9250 6400
Wire Wire Line
	9250 6400 9050 6400
Connection ~ 9450 6100
Connection ~ 9450 6400
Connection ~ 9650 6100
Connection ~ 9650 6400
Wire Wire Line
	9250 6100 9450 6100
Wire Wire Line
	9250 6400 9450 6400
Wire Wire Line
	9450 6100 9650 6100
Wire Wire Line
	9450 6400 9650 6400
Wire Wire Line
	9650 6100 9850 6100
Wire Wire Line
	9650 6400 9850 6400
Connection ~ 9850 6100
Wire Wire Line
	9850 6100 10050 6100
Connection ~ 9850 6400
Wire Wire Line
	9850 6400 10050 6400
Connection ~ 10050 6100
Connection ~ 10050 6400
Wire Wire Line
	10050 6100 10550 6100
Wire Wire Line
	10050 6400 10550 6400
$Comp
L Device:C_Polarized C18
U 1 1 6264AAB7
P 10550 6250
F 0 "C18" H 10500 6450 50  0000 L CNN
F 1 "10u" H 10550 6050 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P2.00mm" H 10588 6100 50  0001 C CNN
F 3 "~" H 10550 6250 50  0001 C CNN
	1    10550 6250
	1    0    0    -1  
$EndComp
Connection ~ 10550 6100
Wire Wire Line
	10550 6100 10800 6100
Connection ~ 10550 6400
Wire Wire Line
	10550 6400 10800 6400
Wire Wire Line
	7000 6400 7450 6400
Text GLabel 3200 1400 0    50   Input ~ 0
6502RST
Wire Wire Line
	3200 1400 3250 1400
Connection ~ 3250 1400
Wire Wire Line
	3250 1400 3250 1200
Text GLabel 1200 750  2    50   Input ~ 0
6502RST
$Comp
L Device:R R10
U 1 1 62AFB3E8
P 3550 3850
F 0 "R10" V 3550 3900 50  0000 R CNN
F 1 "3.3K" V 3450 3900 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3480 3850 50  0001 C CNN
F 3 "~" H 3550 3850 50  0001 C CNN
	1    3550 3850
	0    1    -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 629C9AB9
P 3500 2700
F 0 "R9" V 3500 2750 50  0000 R CNN
F 1 "3.3K" V 3400 2800 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3430 2700 50  0001 C CNN
F 3 "~" H 3500 2700 50  0001 C CNN
	1    3500 2700
	0    1    -1   0   
$EndComp
Wire Wire Line
	5500 3050 5500 2700
Wire Wire Line
	5500 2700 4900 2700
Wire Wire Line
	7500 3050 7550 3050
$Comp
L Device:R R11
U 1 1 62B3FBA0
P 8400 5300
F 0 "R11" V 8300 5350 50  0000 R CNN
F 1 "1K" V 8400 5350 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8330 5300 50  0001 C CNN
F 3 "~" H 8400 5300 50  0001 C CNN
	1    8400 5300
	-1   0    0    -1  
$EndComp
Connection ~ 8400 5450
Wire Wire Line
	8400 5450 8550 5450
$Comp
L power:VCC #PWR04
U 1 1 62B45542
P 8400 5150
F 0 "#PWR04" H 8400 5000 50  0001 C CNN
F 1 "VCC" H 8300 5150 50  0000 C CNN
F 2 "" H 8400 5150 50  0001 C CNN
F 3 "" H 8400 5150 50  0001 C CNN
	1    8400 5150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
