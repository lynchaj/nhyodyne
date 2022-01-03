EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
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
Wire Wire Line
	9800 5900 9800 6100
Wire Wire Line
	9800 5600 9800 5550
Wire Wire Line
	8900 5450 9150 5450
Wire Wire Line
	8400 5450 8650 5450
Wire Wire Line
	8150 5450 8400 5450
Wire Wire Line
	8400 5050 8650 5050
Wire Wire Line
	8650 5050 8900 5050
Wire Wire Line
	8900 5050 9150 5050
Wire Wire Line
	9150 5050 9400 5050
Wire Wire Line
	8650 5450 8900 5450
Wire Wire Line
	9150 5450 9400 5450
Connection ~ 8900 5450
Connection ~ 8400 5450
Connection ~ 8150 5450
Connection ~ 8400 5050
Connection ~ 8650 5050
Connection ~ 8900 5050
Connection ~ 7900 5450
Connection ~ 9150 5050
Connection ~ 8650 5450
Connection ~ 9150 5450
Wire Wire Line
	9400 5450 9400 5500
Connection ~ 9400 5050
Connection ~ 9700 5050
Wire Wire Line
	7900 5450 8150 5450
Wire Wire Line
	8150 5050 8400 5050
$Comp
L Z80GDCB-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue R13
U 1 1 6EC23FE1
P 9800 5300
F 0 "R13" V 9880 5300 50  0000 C CNN
F 1 "470" V 9800 5300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 9800 5300 60  0001 C CNN
F 3 "" H 9800 5300 60  0001 C CNN
	1    9800 5300
	-1   0    0    1   
$EndComp
$Comp
L device:LED D2
U 1 1 603A5584
P 9800 5750
F 0 "D2" H 9800 5850 50  0000 C CNN
F 1 "LED" H 9800 5650 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 9800 5750 60  0001 C CNN
F 3 "" H 9800 5750 60  0001 C CNN
	1    9800 5750
	0    -1   -1   0   
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 603A949A
P 7900 5450
F 0 "#FLG01" H 7900 5545 30  0001 C CNN
F 1 "PWR_FLAG" H 7900 5630 30  0000 C CNN
F 2 "" H 7900 5450 60  0001 C CNN
F 3 "" H 7900 5450 60  0001 C CNN
	1    7900 5450
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 6EC23FE8
P 9700 5050
F 0 "#FLG02" H 9700 5145 30  0001 C CNN
F 1 "PWR_FLAG" H 9700 5230 30  0000 C CNN
F 2 "" H 9700 5050 60  0001 C CNN
F 3 "" H 9700 5050 60  0001 C CNN
	1    9700 5050
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR01
U 1 1 6EC23FE7
P 9400 5050
F 0 "#PWR01" H 9400 5150 30  0001 C CNN
F 1 "VCC" H 9400 5150 30  0000 C CNN
F 2 "" H 9400 5050 60  0001 C CNN
F 3 "" H 9400 5050 60  0001 C CNN
	1    9400 5050
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:GND-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR02
U 1 1 6EC23FE6
P 9400 5500
F 0 "#PWR02" H 9400 5500 30  0001 C CNN
F 1 "GND" H 9400 5430 30  0001 C CNN
F 2 "" H 9400 5500 60  0001 C CNN
F 3 "" H 9400 5500 60  0001 C CNN
	1    9400 5500
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C5
U 1 1 6EC23FE5
P 9150 5250
F 0 "C5" H 9200 5350 50  0000 L CNN
F 1 "0.1u" H 9200 5150 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 9150 5250 60  0001 C CNN
F 3 "" H 9150 5250 60  0001 C CNN
	1    9150 5250
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C4
U 1 1 6EC23FE4
P 8900 5250
F 0 "C4" H 8950 5350 50  0000 L CNN
F 1 "0.1u" H 8950 5150 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 8900 5250 60  0001 C CNN
F 3 "" H 8900 5250 60  0001 C CNN
	1    8900 5250
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C3
U 1 1 603A8F23
P 8650 5250
F 0 "C3" H 8700 5350 50  0000 L CNN
F 1 "0.1u" H 8700 5150 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 8650 5250 60  0001 C CNN
F 3 "" H 8650 5250 60  0001 C CNN
	1    8650 5250
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C2
U 1 1 603A8ED5
P 8400 5250
F 0 "C2" H 8450 5350 50  0000 L CNN
F 1 "0.1u" H 8450 5150 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 8400 5250 60  0001 C CNN
F 3 "" H 8400 5250 60  0001 C CNN
	1    8400 5250
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80VDC-rescue-Z80KBDMSE-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue C1
U 1 1 637504CA
P 8150 5250
F 0 "C1" H 8200 5350 50  0000 L CNN
F 1 "0.1u" H 8200 5150 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 8150 5250 60  0001 C CNN
F 3 "" H 8150 5250 60  0001 C CNN
	1    8150 5250
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:GND-RESCUE-ColorVDU-ColorVDU-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR?
U 1 1 6244BBF7
P 8500 6600
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
F 0 "#PWR011" H 8500 6600 30  0001 C CNN
F 1 "GND" H 8500 6530 30  0001 C CNN
F 2 "" H 8500 6600 60  0001 C CNN
F 3 "" H 8500 6600 60  0001 C CNN
	1    8500 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 6500 8500 6600
Text Label 9050 6500 0    60   ~ 0
ZERO
$Comp
L Z80GDCB-rescue:R-RESCUE-ColorVDU-ColorVDU-rescue-Z80KBDMSE2-rescue-Z80GDC-rescue R11
U 1 1 6259FFCF
P 8750 6500
F 0 "R11" V 8830 6500 50  0000 C CNN
F 1 "0" V 8750 6500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 8750 6500 60  0001 C CNN
F 3 "" H 8750 6500 60  0001 C CNN
	1    8750 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	9000 6500 9350 6500
Wire Wire Line
	7900 6100 9800 6100
$Comp
L 74xx:74LS374 U8
U 1 1 6A27DAAE
P 1900 3800
F 0 "U8" H 1900 3900 50  0000 C CNN
F 1 "74LS374" H 1900 3750 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 1900 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS374" H 1900 3800 50  0001 C CNN
	1    1900 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 4300 1400 4300
Text Label 1150 4200 0    60   ~ 0
ALE#
Text Label 1150 4300 0    60   ~ 0
ZERO
$Comp
L 74xx:74LS374 U7
U 1 1 6A993D95
P 1900 1750
F 0 "U7" H 1900 1850 50  0000 C CNN
F 1 "74LS374" H 1900 1700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 1900 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS374" H 1900 1750 50  0001 C CNN
	1    1900 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1450 1400 1450
Wire Wire Line
	1100 1350 1400 1350
Wire Wire Line
	1100 1250 1400 1250
Wire Wire Line
	1100 1550 1400 1550
Wire Wire Line
	1100 1850 1400 1850
Wire Wire Line
	1100 1750 1400 1750
Wire Wire Line
	1100 1650 1400 1650
Wire Wire Line
	1100 1950 1400 1950
Wire Wire Line
	1100 2250 1400 2250
Wire Wire Line
	2400 1450 2700 1450
Wire Wire Line
	2400 1350 2700 1350
Wire Wire Line
	2400 1250 2700 1250
Wire Wire Line
	2400 1550 2700 1550
Wire Wire Line
	2400 1850 2700 1850
Wire Wire Line
	2400 1750 2700 1750
Wire Wire Line
	2400 1650 2700 1650
Wire Wire Line
	2400 1950 2700 1950
Text Label 1150 2150 0    60   ~ 0
ALE#
Text Label 1150 2250 0    60   ~ 0
ZERO
Text Label 2600 1250 2    60   ~ 0
xA0
Text Label 2600 1350 2    60   ~ 0
xA1
Text Label 2600 1450 2    60   ~ 0
xA2
Text Label 2600 1550 2    60   ~ 0
xA3
Text Label 2600 1650 2    60   ~ 0
xA4
Text Label 2600 1750 2    60   ~ 0
xA5
Text Label 2600 1850 2    60   ~ 0
xA6
Text Label 2600 1950 2    60   ~ 0
xA7
Text Label 1350 1250 2    60   ~ 0
AD0
Text Label 1350 1350 2    60   ~ 0
AD1
Text Label 1350 1450 2    60   ~ 0
AD2
Text Label 1350 1550 2    60   ~ 0
AD3
Text Label 1350 1650 2    60   ~ 0
AD4
Text Label 1350 1750 2    60   ~ 0
AD5
Text Label 1350 1850 2    60   ~ 0
AD6
Text Label 1350 1950 2    60   ~ 0
AD7
Text Label 1350 3300 2    60   ~ 0
AD8
Text Label 1350 3400 2    60   ~ 0
AD9
Text Label 1350 3500 2    60   ~ 0
AD10
Text Label 1350 3600 2    60   ~ 0
AD11
Text Label 1350 3700 2    60   ~ 0
AD12
Text Label 1350 3800 2    60   ~ 0
AD13
Text Label 1350 3900 2    60   ~ 0
AD14
Text Label 1350 4000 2    60   ~ 0
AD15
Wire Wire Line
	1100 3600 1400 3600
Wire Wire Line
	1100 3700 1400 3700
Wire Wire Line
	1100 3800 1400 3800
Wire Wire Line
	1100 3900 1400 3900
Wire Wire Line
	1100 4000 1400 4000
Wire Wire Line
	1100 3300 1400 3300
Wire Wire Line
	1100 3400 1400 3400
Wire Wire Line
	1100 3500 1400 3500
Text Label 2450 3300 0    60   ~ 0
xA8
Text Label 2450 3400 0    60   ~ 0
xA9
Text Label 2450 3500 0    60   ~ 0
xA10
Text Label 2450 3600 0    60   ~ 0
xA11
Text Label 2450 3700 0    60   ~ 0
xA12
Text Label 2450 3800 0    60   ~ 0
xA13
Text Label 2450 3900 0    60   ~ 0
xA14
Wire Wire Line
	2400 3600 2700 3600
Wire Wire Line
	2400 3700 2700 3700
Wire Wire Line
	2400 3800 2700 3800
Wire Wire Line
	2400 3900 2700 3900
Wire Wire Line
	2400 3300 2700 3300
Wire Wire Line
	2400 3400 2700 3400
Wire Wire Line
	2400 3500 2700 3500
Text Label 2450 4000 0    60   ~ 0
xA15
Wire Wire Line
	2400 4000 2700 4000
$Comp
L 74xx:74LS374 U9
U 1 1 6AF45D1A
P 1900 5850
F 0 "U9" H 1900 5950 50  0000 C CNN
F 1 "74LS374" H 1900 5800 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 1900 5850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS374" H 1900 5850 50  0001 C CNN
	1    1900 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 6350 1400 6350
Text Label 1150 6250 0    60   ~ 0
ALE#
Text Label 1150 6350 0    60   ~ 0
ZERO
Text Label 1350 5350 2    60   ~ 0
A16
Text Label 1350 5450 2    60   ~ 0
A17
Wire Wire Line
	1100 5350 1400 5350
Wire Wire Line
	1100 5450 1400 5450
Text Label 2450 5350 0    60   ~ 0
xA16
Wire Wire Line
	2400 5350 2700 5350
Text Label 2450 5450 0    60   ~ 0
xA17
Wire Wire Line
	2400 5450 2700 5450
NoConn ~ 1400 5550
NoConn ~ 1400 5650
NoConn ~ 1400 5750
NoConn ~ 1400 5850
NoConn ~ 1400 5950
NoConn ~ 1400 6050
NoConn ~ 2400 5550
NoConn ~ 2400 5650
NoConn ~ 2400 5750
NoConn ~ 2400 5850
NoConn ~ 2400 5950
NoConn ~ 2400 6050
$Comp
L Z80GDCB-rescue:GND-updgfx_r0-rescue #PWR0103
U 1 1 6B868D35
P 1900 2550
F 0 "#PWR0103" H 1900 2300 50  0001 C CNN
F 1 "GND" H 1900 2400 50  0000 C CNN
F 2 "" H 1900 2550 50  0000 C CNN
F 3 "" H 1900 2550 50  0000 C CNN
	1    1900 2550
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:GND-updgfx_r0-rescue #PWR0106
U 1 1 6B86A906
P 1900 4600
F 0 "#PWR0106" H 1900 4350 50  0001 C CNN
F 1 "GND" H 1900 4450 50  0000 C CNN
F 2 "" H 1900 4600 50  0000 C CNN
F 3 "" H 1900 4600 50  0000 C CNN
	1    1900 4600
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:GND-updgfx_r0-rescue #PWR0109
U 1 1 6B86ADFF
P 1900 6650
F 0 "#PWR0109" H 1900 6400 50  0001 C CNN
F 1 "GND" H 1900 6500 50  0000 C CNN
F 2 "" H 1900 6650 50  0000 C CNN
F 3 "" H 1900 6650 50  0000 C CNN
	1    1900 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 2150 1400 2150
Wire Wire Line
	1100 4200 1400 4200
Wire Wire Line
	1100 6250 1400 6250
Text Label 6000 1200 2    60   ~ 0
AD0
Text Label 6000 1300 2    60   ~ 0
AD1
Text Label 6000 1400 2    60   ~ 0
AD2
Text Label 6000 1500 2    60   ~ 0
AD3
Text Label 6000 1600 2    60   ~ 0
AD4
Text Label 6000 1700 2    60   ~ 0
AD5
Text Label 6000 1800 2    60   ~ 0
AD6
Text Label 6000 1900 2    60   ~ 0
AD7
Text Label 6000 4250 2    60   ~ 0
AD8
Text Label 6000 4350 2    60   ~ 0
AD9
Text Label 6000 4450 2    60   ~ 0
AD10
Text Label 6000 4550 2    60   ~ 0
AD11
Text Label 6000 4650 2    60   ~ 0
AD12
Text Label 6000 4750 2    60   ~ 0
AD13
Text Label 6000 4850 2    60   ~ 0
AD14
Text Label 6000 4950 2    60   ~ 0
AD15
Wire Wire Line
	5750 1500 6050 1500
Wire Wire Line
	5750 1600 6050 1600
Wire Wire Line
	5750 1700 6050 1700
Wire Wire Line
	5750 1800 6050 1800
Wire Wire Line
	5750 1900 6050 1900
Wire Wire Line
	5750 1200 6050 1200
Wire Wire Line
	5750 1300 6050 1300
Wire Wire Line
	5750 1400 6050 1400
Wire Wire Line
	5750 4550 6050 4550
Wire Wire Line
	5750 4650 6050 4650
Wire Wire Line
	5750 4750 6050 4750
Wire Wire Line
	5750 4850 6050 4850
Wire Wire Line
	5750 4950 6050 4950
Wire Wire Line
	5750 4250 6050 4250
Wire Wire Line
	5750 4350 6050 4350
Wire Wire Line
	5750 4450 6050 4450
Text Label 4100 1200 0    60   ~ 0
xA0
Text Label 4100 1300 0    60   ~ 0
xA1
Text Label 4100 1400 0    60   ~ 0
xA2
Text Label 4100 1500 0    60   ~ 0
xA3
Text Label 4100 1600 0    60   ~ 0
xA4
Text Label 4100 1700 0    60   ~ 0
xA5
Text Label 4100 1800 0    60   ~ 0
xA6
Text Label 4100 1900 0    60   ~ 0
xA7
Text Label 4100 2000 0    60   ~ 0
xA8
Text Label 4100 2100 0    60   ~ 0
xA9
Text Label 4100 2200 0    60   ~ 0
xA10
Text Label 4100 2300 0    60   ~ 0
xA11
Text Label 4100 2400 0    60   ~ 0
xA12
Text Label 4100 2500 0    60   ~ 0
xA13
Text Label 4100 2600 0    60   ~ 0
xA14
Wire Wire Line
	4050 1500 4350 1500
Wire Wire Line
	4050 1600 4350 1600
Wire Wire Line
	4050 1700 4350 1700
Wire Wire Line
	4050 1800 4350 1800
Wire Wire Line
	4050 1900 4350 1900
Wire Wire Line
	4050 1200 4350 1200
Wire Wire Line
	4050 1300 4350 1300
Wire Wire Line
	4050 1400 4350 1400
Wire Wire Line
	4050 2300 4350 2300
Wire Wire Line
	4050 2400 4350 2400
Wire Wire Line
	4050 2500 4350 2500
Wire Wire Line
	4050 2600 4350 2600
Wire Wire Line
	4050 2000 4350 2000
Wire Wire Line
	4050 2100 4350 2100
Wire Wire Line
	4050 2200 4350 2200
Text Label 4100 4250 0    60   ~ 0
xA0
Text Label 4100 4350 0    60   ~ 0
xA1
Text Label 4100 4450 0    60   ~ 0
xA2
Text Label 4100 4550 0    60   ~ 0
xA3
Text Label 4100 4650 0    60   ~ 0
xA4
Text Label 4100 4750 0    60   ~ 0
xA5
Text Label 4100 4850 0    60   ~ 0
xA6
Text Label 4100 4950 0    60   ~ 0
xA7
Text Label 4100 5050 0    60   ~ 0
xA8
Text Label 4100 5150 0    60   ~ 0
xA9
Text Label 4100 5250 0    60   ~ 0
xA10
Text Label 4100 5350 0    60   ~ 0
xA11
Text Label 4100 5450 0    60   ~ 0
xA12
Text Label 4100 5550 0    60   ~ 0
xA13
Text Label 4100 5650 0    60   ~ 0
xA14
Wire Wire Line
	4050 4550 4350 4550
Wire Wire Line
	4050 4650 4350 4650
Wire Wire Line
	4050 4750 4350 4750
Wire Wire Line
	4050 4850 4350 4850
Wire Wire Line
	4050 4950 4350 4950
Wire Wire Line
	4050 4250 4350 4250
Wire Wire Line
	4050 4350 4350 4350
Wire Wire Line
	4050 4450 4350 4450
Wire Wire Line
	4050 5350 4350 5350
Wire Wire Line
	4050 5450 4350 5450
Wire Wire Line
	4050 5550 4350 5550
Wire Wire Line
	4050 5650 4350 5650
Wire Wire Line
	4050 5050 4350 5050
Wire Wire Line
	4050 5150 4350 5150
Wire Wire Line
	4050 5250 4350 5250
$Comp
L memory:SRAM_512Ko U10
U 1 1 6C199851
P 5050 2300
F 0 "U10" H 5050 2300 50  0000 C CNN
F 1 "SRAM_512Ko" H 5050 2150 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 5050 2300 50  0001 C CNN
F 3 "" H 5050 2300 50  0001 C CNN
	1    5050 2300
	1    0    0    -1  
$EndComp
$Comp
L memory:SRAM_512Ko U11
U 1 1 6C19C485
P 5050 5350
F 0 "U11" H 5050 5350 50  0000 C CNN
F 1 "SRAM_512Ko" H 5050 5200 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 5050 5350 50  0001 C CNN
F 3 "" H 5050 5350 50  0001 C CNN
	1    5050 5350
	1    0    0    -1  
$EndComp
Text Label 4100 2700 0    60   ~ 0
xA15
Wire Wire Line
	4050 2700 4350 2700
Text Label 4100 2800 0    60   ~ 0
xA16
Wire Wire Line
	4050 2800 4350 2800
Text Label 4100 2900 0    60   ~ 0
xA17
Wire Wire Line
	4050 2900 4350 2900
Text Label 4100 5750 0    60   ~ 0
xA15
Wire Wire Line
	4050 5750 4350 5750
Text Label 4100 5850 0    60   ~ 0
xA16
Wire Wire Line
	4050 5850 4350 5850
Text Label 4100 5950 0    60   ~ 0
xA17
Wire Wire Line
	4050 5950 4350 5950
Wire Wire Line
	4050 6450 4350 6450
Wire Wire Line
	4050 3400 4350 3400
Text Label 3850 3300 0    60   ~ 0
VRAM_WR#
Text Label 3850 6350 0    60   ~ 0
VRAM_WR#
Text Label 3850 3200 0    60   ~ 0
VRAM_RD#
Text Label 3850 6250 0    60   ~ 0
VRAM_RD#
$Comp
L Z80GDCB-rescue:GND-updgfx_r0-rescue #PWR0114
U 1 1 6C7077BA
P 5050 3600
F 0 "#PWR0114" H 5050 3350 50  0001 C CNN
F 1 "GND" H 5050 3450 50  0000 C CNN
F 2 "" H 5050 3600 50  0000 C CNN
F 3 "" H 5050 3600 50  0000 C CNN
	1    5050 3600
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:GND-updgfx_r0-rescue #PWR0116
U 1 1 6C70D0B0
P 5050 6650
F 0 "#PWR0116" H 5050 6400 50  0001 C CNN
F 1 "GND" H 5050 6500 50  0000 C CNN
F 2 "" H 5050 6650 50  0000 C CNN
F 3 "" H 5050 6650 50  0000 C CNN
	1    5050 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3200 4350 3200
Wire Wire Line
	3800 6250 4350 6250
Wire Wire Line
	3800 3300 4350 3300
Wire Wire Line
	3800 6350 4350 6350
Wire Wire Line
	4050 3000 4350 3000
Wire Wire Line
	4050 6050 4350 6050
Text Label 4100 6450 0    60   ~ 0
ZERO
Text Label 4100 3000 0    60   ~ 0
ZERO
Wire Wire Line
	7950 1500 8550 1500
Wire Wire Line
	7950 1400 8550 1400
Wire Wire Line
	7950 1300 8550 1300
Wire Wire Line
	7950 1600 8550 1600
Wire Wire Line
	7950 1900 8550 1900
Wire Wire Line
	7950 1800 8550 1800
Wire Wire Line
	7950 1700 8550 1700
Wire Wire Line
	7950 2000 8550 2000
Text Label 8200 1300 2    60   ~ 0
AD0
Text Label 8200 1400 2    60   ~ 0
AD1
Text Label 8200 1500 2    60   ~ 0
AD2
Text Label 8200 1600 2    60   ~ 0
AD3
Text Label 8200 1700 2    60   ~ 0
AD4
Text Label 8200 1800 2    60   ~ 0
AD5
Text Label 8200 1900 2    60   ~ 0
AD6
Text Label 8200 2000 2    60   ~ 0
AD7
Text Label 8200 2100 2    60   ~ 0
AD8
Text Label 8200 2200 2    60   ~ 0
AD9
Text Label 8200 2300 2    60   ~ 0
AD10
Text Label 8200 3000 2    60   ~ 0
AD11
Text Label 8200 3100 2    60   ~ 0
AD12
Text Label 8200 3200 2    60   ~ 0
AD13
Text Label 8200 3300 2    60   ~ 0
AD14
Text Label 8200 3400 2    60   ~ 0
AD15
Wire Wire Line
	7950 3000 8550 3000
Wire Wire Line
	7950 3100 8550 3100
Wire Wire Line
	7950 3200 8550 3200
Wire Wire Line
	7950 3300 8550 3300
Wire Wire Line
	7950 3400 8550 3400
Wire Wire Line
	7950 2100 8550 2100
Wire Wire Line
	7950 2200 8550 2200
Wire Wire Line
	7950 2300 8550 2300
Text Label 8200 3500 2    60   ~ 0
A16
Text Label 8200 3600 2    60   ~ 0
A17
Wire Wire Line
	7950 3500 8550 3500
Wire Wire Line
	7950 3600 8550 3600
Wire Wire Line
	7950 3900 8550 3900
Wire Wire Line
	7950 3800 8550 3800
Wire Wire Line
	7950 3700 8550 3700
Wire Wire Line
	7950 2900 8550 2900
Text Label 8000 3700 0    60   ~ 0
ALE#
Text Label 8000 3800 0    60   ~ 0
VRAM_RD#
Text Label 8000 3900 0    60   ~ 0
VRAM_WR#
Text Label 8000 2900 0    60   ~ 0
VCC
Wire Wire Line
	7950 1200 8550 1200
Wire Wire Line
	7950 2400 8550 2400
Text Label 8000 1200 0    60   ~ 0
GND
Text Label 8000 2400 0    60   ~ 0
VCC
Text Label 8000 4100 0    60   ~ 0
GND
Wire Wire Line
	7950 4100 8550 4100
Wire Wire Line
	7950 4000 8550 4000
Text Label 8000 4000 0    60   ~ 0
RESERVED
$Comp
L conn:CONN_01X13 J2
U 1 1 6DEB0C5F
P 8750 1800
F 0 "J2" H 8828 1841 50  0000 L CNN
F 1 "L_MEZZ" V 8850 1200 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x13_P2.54mm_Vertical" H 8750 1800 50  0001 C CNN
F 3 "" H 8750 1800 50  0001 C CNN
	1    8750 1800
	1    0    0    -1  
$EndComp
$Comp
L conn:CONN_01X13 J3
U 1 1 6DEB290E
P 8750 3500
F 0 "J3" H 8828 3541 50  0000 L CNN
F 1 "R_MEZZ" V 8850 2900 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x13_P2.54mm_Vertical" H 8750 3500 50  0001 C CNN
F 3 "" H 8750 3500 50  0001 C CNN
	1    8750 3500
	1    0    0    -1  
$EndComp
NoConn ~ 7950 4000
Wire Wire Line
	9400 5050 9700 5050
Wire Wire Line
	9700 5050 9800 5050
Wire Wire Line
	7900 5450 7900 6100
$Comp
L Z80GDCB-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR0102
U 1 1 6EBCF3A1
P 1900 3000
F 0 "#PWR0102" H 1900 3100 30  0001 C CNN
F 1 "VCC" H 1900 3100 30  0000 C CNN
F 2 "" H 1900 3000 60  0001 C CNN
F 3 "" H 1900 3000 60  0001 C CNN
	1    1900 3000
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR0104
U 1 1 6EBD0504
P 5050 4050
F 0 "#PWR0104" H 5050 4150 30  0001 C CNN
F 1 "VCC" H 5050 4150 30  0000 C CNN
F 2 "" H 5050 4050 60  0001 C CNN
F 3 "" H 5050 4050 60  0001 C CNN
	1    5050 4050
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR0105
U 1 1 6EBDB060
P 1900 5050
F 0 "#PWR0105" H 1900 5150 30  0001 C CNN
F 1 "VCC" H 1900 5150 30  0000 C CNN
F 2 "" H 1900 5050 60  0001 C CNN
F 3 "" H 1900 5050 60  0001 C CNN
	1    1900 5050
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR0107
U 1 1 6EBDB908
P 1900 950
F 0 "#PWR0107" H 1900 1050 30  0001 C CNN
F 1 "VCC" H 1900 1050 30  0000 C CNN
F 2 "" H 1900 950 60  0001 C CNN
F 3 "" H 1900 950 60  0001 C CNN
	1    1900 950 
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCB-rescue:VCC-power-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR0108
U 1 1 6EBDBF99
P 5050 1000
F 0 "#PWR0108" H 5050 1100 30  0001 C CNN
F 1 "VCC" H 5050 1100 30  0000 C CNN
F 2 "" H 5050 1000 60  0001 C CNN
F 3 "" H 5050 1000 60  0001 C CNN
	1    5050 1000
	1    0    0    -1  
$EndComp
$Comp
L Z80GDCA-rescue:GND-00JRCsch-Z80KBDMSE2-rescue-Z80GDC-rescue #PWR016
U 1 1 610CFA90
P 7300 6600
F 0 "#PWR016" H 7300 6600 30  0001 C CNN
F 1 "GND" H 7300 6530 30  0001 C CNN
F 2 "" H 7300 6600 60  0000 C CNN
F 3 "" H 7300 6600 60  0000 C CNN
	1    7300 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 6550 7550 6550
Connection ~ 7300 6550
Wire Wire Line
	7300 6550 7300 6600
Wire Wire Line
	7050 6550 7300 6550
$Comp
L mechanical:MountingHole_Pad H2
U 1 1 61081B3A
P 7550 6450
F 0 "H2" H 7650 6499 50  0000 L CNN
F 1 "BRACKET" H 7650 6408 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 7550 6450 50  0001 C CNN
F 3 "~" H 7550 6450 50  0001 C CNN
	1    7550 6450
	1    0    0    -1  
$EndComp
$Comp
L mechanical:MountingHole_Pad H1
U 1 1 637504D2
P 7050 6450
F 0 "H1" H 7150 6499 50  0000 L CNN
F 1 "BRACKET" H 7150 6408 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 7050 6450 50  0001 C CNN
F 3 "~" H 7050 6450 50  0001 C CNN
	1    7050 6450
	1    0    0    -1  
$EndComp
Text Label 4100 3400 0    60   ~ 0
ZERO
$EndSCHEMATC
