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
L Z80FDC-rescue:74LS245-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue U2
U 1 1 603971FD
P 2050 4450
F 0 "U2" H 2150 5025 60  0000 L BNN
F 1 "74LS245" H 1950 4000 60  0000 L TNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 2050 4450 60  0001 C CNN
F 3 "" H 2050 4450 60  0001 C CNN
	1    2050 4450
	1    0    0    -1  
$EndComp
Text Label 1050 5850 0    60   ~ 0
WR#
Text Label 1050 5950 0    60   ~ 0
RD#
Text Label 1050 5650 0    60   ~ 0
IORQ#
Text Label 1050 4050 0    60   ~ 0
D1
Text Label 1050 4150 0    60   ~ 0
D2
Text Label 1050 4250 0    60   ~ 0
D3
Text Label 1050 3950 0    60   ~ 0
D0
Text Label 1050 4450 0    60   ~ 0
D5
Text Label 1050 4550 0    60   ~ 0
D6
Text Label 1050 4650 0    60   ~ 0
D7
Text Label 1050 4350 0    60   ~ 0
D4
Text Label 7450 6750 0    60   ~ 0
A9
Text Label 7450 6650 0    60   ~ 0
A10
Text Label 8750 6650 0    60   ~ 0
A11
Text Label 7450 6850 0    60   ~ 0
A8
Text Label 8750 6850 0    60   ~ 0
A13
Text Label 8750 6950 0    60   ~ 0
A14
Text Label 8750 7050 0    60   ~ 0
A15
Text Label 8750 6750 0    60   ~ 0
A12
Text Label 7450 7550 0    60   ~ 0
A1
Text Label 7450 7450 0    60   ~ 0
A2
Text Label 7450 7350 0    60   ~ 0
A3
Text Label 7450 7650 0    60   ~ 0
A0
Text Label 7450 7150 0    60   ~ 0
A5
Text Label 7450 7050 0    60   ~ 0
A6
Text Label 7450 6950 0    60   ~ 0
A7
Text Label 7450 7250 0    60   ~ 0
A4
Text Label 7450 7750 0    60   ~ 0
GND
Text Label 7450 7850 0    60   ~ 0
RFSH#
Text Label 8750 8350 0    60   ~ 0
HALT#
Text Label 7450 8350 0    60   ~ 0
BUSACK#
Text Label 7450 7950 0    60   ~ 0
M1#
Text Label 7450 8150 0    60   ~ 0
BUSRQ#
Text Label 8750 8250 0    60   ~ 0
NMI#
Text Label 8750 8150 0    60   ~ 0
INT#
Text Label 7450 8250 0    60   ~ 0
WAIT#
Text Label 7450 8050 0    60   ~ 0
RESET#
Text Label 8750 8450 0    60   ~ 0
MREQ#
Text Label 7450 8450 0    60   ~ 0
WR#
Text Label 7450 8550 0    60   ~ 0
RD#
Text Label 8750 8550 0    60   ~ 0
IORQ#
Text Label 8750 8050 0    60   ~ 0
D1
Text Label 8750 7750 0    60   ~ 0
D2
Text Label 8750 7350 0    60   ~ 0
D3
Text Label 8750 7950 0    60   ~ 0
D0
Text Label 8750 7450 0    60   ~ 0
D5
Text Label 8750 7550 0    60   ~ 0
D6
Text Label 8750 7850 0    60   ~ 0
D7
Text Label 8750 7250 0    60   ~ 0
D4
Text Label 8750 7650 0    60   ~ 0
VCC
Text Label 8750 7150 0    60   ~ 0
CLK
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C1
U 1 1 603A8E72
P 3250 7800
F 0 "C1" H 3300 7900 50  0000 L CNN
F 1 "0.1u" H 3300 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3250 7800 60  0001 C CNN
F 3 "" H 3250 7800 60  0001 C CNN
	1    3250 7800
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C2
U 1 1 603A8ED5
P 3500 7800
F 0 "C2" H 3550 7900 50  0000 L CNN
F 1 "0.1u" H 3550 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3500 7800 60  0001 C CNN
F 3 "" H 3500 7800 60  0001 C CNN
	1    3500 7800
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C3
U 1 1 603A8F23
P 3750 7800
F 0 "C3" H 3800 7900 50  0000 L CNN
F 1 "0.1u" H 3800 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3750 7800 60  0001 C CNN
F 3 "" H 3750 7800 60  0001 C CNN
	1    3750 7800
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C4
U 1 1 603A8F29
P 4000 7800
F 0 "C4" H 4050 7900 50  0000 L CNN
F 1 "0.1u" H 4050 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4000 7800 60  0001 C CNN
F 3 "" H 4000 7800 60  0001 C CNN
	1    4000 7800
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C5
U 1 1 603A8FA5
P 4250 7800
F 0 "C5" H 4300 7900 50  0000 L CNN
F 1 "0.1u" H 4300 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4250 7800 60  0001 C CNN
F 3 "" H 4250 7800 60  0001 C CNN
	1    4250 7800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 603A93CE
P 4500 8050
F 0 "#PWR03" H 4500 8050 30  0001 C CNN
F 1 "GND" H 4500 7980 30  0001 C CNN
F 2 "" H 4500 8050 60  0001 C CNN
F 3 "" H 4500 8050 60  0001 C CNN
	1    4500 8050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 603A9412
P 4500 7600
F 0 "#PWR02" H 4500 7700 30  0001 C CNN
F 1 "VCC" H 4500 7700 30  0000 C CNN
F 2 "" H 4500 7600 60  0001 C CNN
F 3 "" H 4500 7600 60  0001 C CNN
	1    4500 7600
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 603A9456
P 5250 7600
F 0 "#FLG02" H 5250 7695 30  0001 C CNN
F 1 "PWR_FLAG" H 5250 7780 30  0000 C CNN
F 2 "" H 5250 7600 60  0001 C CNN
F 3 "" H 5250 7600 60  0001 C CNN
	1    5250 7600
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 603A949A
P 2350 8000
F 0 "#FLG01" H 2350 8095 30  0001 C CNN
F 1 "PWR_FLAG" H 2350 8180 30  0000 C CNN
F 2 "" H 2350 8000 60  0001 C CNN
F 3 "" H 2350 8000 60  0001 C CNN
	1    2350 8000
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:CP-device-Z80GENERIC_IO-rescue C9
U 1 1 6039BD2A
P 6000 7800
F 0 "C9" H 6050 7900 50  0000 L CNN
F 1 "10u" H 6050 7700 50  0000 L CNN
F 2 "Capacitor_THT:CP_Axial_L10.0mm_D4.5mm_P15.00mm_Horizontal" H 6000 7800 60  0001 C CNN
F 3 "" H 6000 7800 60  0001 C CNN
	1    6000 7800
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:CP-device-Z80GENERIC_IO-rescue C10
U 1 1 603A3D80
P 6250 7800
F 0 "C10" H 6300 7900 50  0000 L CNN
F 1 "10u" H 6300 7700 50  0000 L CNN
F 2 "Capacitor_THT:CP_Axial_L10.0mm_D4.5mm_P15.00mm_Horizontal" H 6250 7800 60  0001 C CNN
F 3 "" H 6250 7800 60  0001 C CNN
	1    6250 7800
	1    0    0    -1  
$EndComp
$Comp
L device:LED D1
U 1 1 603A5584
P 7050 8300
F 0 "D1" H 7050 8400 50  0000 C CNN
F 1 "LED" H 7050 8200 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm_Horizontal_O3.81mm_Z3.0mm" H 7050 8300 60  0001 C CNN
F 3 "" H 7050 8300 60  0001 C CNN
	1    7050 8300
	0    -1   -1   0   
$EndComp
$Comp
L Z80FDC-rescue:R-device-Z80GENERIC_IO-rescue R1
U 1 1 603A596D
P 7050 7850
F 0 "R1" V 7130 7850 50  0000 C CNN
F 1 "470" V 7050 7850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 7050 7850 60  0001 C CNN
F 3 "" H 7050 7850 60  0001 C CNN
	1    7050 7850
	-1   0    0    1   
$EndComp
$Comp
L conn:CONN_25X2 P1
U 1 1 603D6D37
P 8250 7850
F 0 "P1" H 8250 9150 60  0000 C CNN
F 1 "CONN_25X2" V 8250 7850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x25_Pitch2.54mm" H 8250 7850 60  0001 C CNN
F 3 "" H 8250 7850 60  0001 C CNN
	1    8250 7850
	1    0    0    -1  
$EndComp
Text Label 8750 8850 0    60   ~ 0
SPARE2
Text Label 8750 8750 0    60   ~ 0
SPARE1
Text Label 8750 8650 0    60   ~ 0
SPARE0
Text Label 8750 8950 0    60   ~ 0
SPARE3
Text Label 8750 9050 0    60   ~ 0
SPARE4
Text Label 7450 8850 0    60   ~ 0
SPARE7
Text Label 7450 8750 0    60   ~ 0
SPARE8
Text Label 7450 8650 0    60   ~ 0
SPARE9
Text Label 7450 8950 0    60   ~ 0
SPARE6
Text Label 7450 9050 0    60   ~ 0
SPARE5
Text Notes 7300 6450 0    60   ~ 0
Note: Bus connector is mirror image of Z80\nCPU pin out to mate to backplane whose\nconnectors reflect Z80 CPU pin out.
$Comp
L conn:CONN_10 P2
U 1 1 603FC724
P 10600 7250
F 0 "P2" V 10550 7250 60  0000 C CNN
F 1 "CONN_10" V 10650 7250 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 10600 7250 60  0001 C CNN
F 3 "" H 10600 7250 60  0001 C CNN
	1    10600 7250
	1    0    0    -1  
$EndComp
Text Label 9850 7500 0    60   ~ 0
SPARE7
Text Label 9850 7600 0    60   ~ 0
SPARE8
Text Label 9850 7700 0    60   ~ 0
SPARE9
Text Label 9850 7400 0    60   ~ 0
SPARE6
Text Label 9850 7300 0    60   ~ 0
SPARE5
Text Label 9850 7000 0    60   ~ 0
SPARE2
Text Label 9850 6900 0    60   ~ 0
SPARE1
Text Label 9850 6800 0    60   ~ 0
SPARE0
Text Label 9850 7100 0    60   ~ 0
SPARE3
Text Label 9850 7200 0    60   ~ 0
SPARE4
NoConn ~ 2750 5550
NoConn ~ 2750 5450
Text Label 1050 5750 0    60   ~ 0
M1#
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 6044C0E0
P 4550 3850
F 0 "SW1" H 4550 4400 50  0000 C CNN
F 1 "SW_DIP_x08" H 4550 3400 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_DIP_x8_W7.62mm_Slide" H 4550 3850 50  0001 C CNN
F 3 "" H 4550 3850 50  0001 C CNN
	1    4550 3850
	1    0    0    1   
$EndComp
$Comp
L Z80FDC-rescue:RR8-device-Z80GENERIC_IO-rescue RR1
U 1 1 6044D2F4
P 5300 4800
F 0 "RR1" H 5350 5400 70  0000 C CNN
F 1 "10000" V 5330 4800 70  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP9" H 5300 4800 60  0001 C CNN
F 3 "" H 5300 4800 60  0001 C CNN
	1    5300 4800
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR05
U 1 1 6044E13A
P 6650 2350
F 0 "#PWR05" H 6650 2450 30  0001 C CNN
F 1 "VCC" H 6650 2450 30  0000 C CNN
F 2 "" H 6650 2350 60  0001 C CNN
F 3 "" H 6650 2350 60  0001 C CNN
	1    6650 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 6044E58D
P 6650 4750
F 0 "#PWR06" H 6650 4750 30  0001 C CNN
F 1 "GND" H 6650 4680 30  0001 C CNN
F 2 "" H 6650 4750 60  0001 C CNN
F 3 "" H 6650 4750 60  0001 C CNN
	1    6650 4750
	1    0    0    -1  
$EndComp
Text Notes 7550 5150 0    60   ~ 0
Note: IO Address Ports $30-$37\nS1=on - A7 (low)\nS2=on - A6 (low)\nS3=off - A5 (high)\nS4=off - A4 (high)\nS5=on - A3 (low)\nS6=xx - A2 (xx)\nS7=xx - A1 (xx)\nS8=xx - A0 (xx)
Text Notes 4450 6350 0    60   ~ 0
Note: Inhibit Board Operation\nDuring Interrupts\nM1# = low, IORQ# = low
$Comp
L 74xx:74LS688 U6
U 1 1 604A100F
P 6650 3550
F 0 "U6" H 6350 4600 50  0000 C CNN
F 1 "74LS688" H 6350 2500 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 6650 3550 50  0001 C CNN
F 3 "" H 6650 3550 50  0001 C CNN
	1    6650 3550
	1    0    0    -1  
$EndComp
Text Notes 950  6500 0    60   ~ 0
Note: Buffers/Transceivers\nrespond to IO and MEM cycles
NoConn ~ 7350 6650
NoConn ~ 7350 6750
NoConn ~ 7350 6850
NoConn ~ 9150 6650
NoConn ~ 9150 6750
NoConn ~ 9150 6850
NoConn ~ 9150 6950
NoConn ~ 9150 7050
NoConn ~ 7350 7850
NoConn ~ 7350 8150
NoConn ~ 7350 8250
Text Notes 10500 8250 0    60   ~ 0
Spare Components
Text Notes 1100 2350 0    60   ~ 0
Z80 BUS INTERFACE
Text Label 1050 5250 0    60   ~ 0
RESET#
$Comp
L power:VCC #PWR04
U 1 1 604651AE
P 5750 4450
F 0 "#PWR04" H 5750 4550 30  0001 C CNN
F 1 "VCC" H 5750 4550 30  0000 C CNN
F 2 "" H 5750 4450 60  0001 C CNN
F 3 "" H 5750 4450 60  0001 C CNN
	1    5750 4450
	1    0    0    -1  
$EndComp
Text Label 1050 6150 0    60   ~ 0
GND
$Comp
L power:GND #PWR01
U 1 1 60465D86
P 4250 4450
F 0 "#PWR01" H 4250 4450 30  0001 C CNN
F 1 "GND" H 4250 4380 30  0001 C CNN
F 2 "" H 4250 4450 60  0001 C CNN
F 3 "" H 4250 4450 60  0001 C CNN
	1    4250 4450
	1    0    0    -1  
$EndComp
Text Label 2800 5750 0    60   ~ 0
bM1#
Text Label 2800 5650 0    60   ~ 0
bIORQ#
Text Label 5700 5750 0    60   ~ 0
688SEL#
Text Label 2800 5850 0    60   ~ 0
bWR#
Text Label 2800 5950 0    60   ~ 0
bRD#
Text Notes 4900 2450 0    60   ~ 0
IO SELECTION CIRCUIT
Text Notes 4150 4700 0    60   ~ 0
SET IO PORT
NoConn ~ 9150 8450
$Comp
L Z80FDC-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue U3
U 1 1 603971B6
P 2050 5750
F 0 "U3" H 2100 5550 60  0000 C CNN
F 1 "74LS244" H 2150 5350 60  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 2050 5750 60  0001 C CNN
F 3 "" H 2050 5750 60  0001 C CNN
	1    2050 5750
	1    0    0    -1  
$EndComp
NoConn ~ 1350 5450
NoConn ~ 1350 5550
Text Label 1000 5100 0    60   ~ 0
CS_FDC#
Text Label 8050 2200 0    60   ~ 0
bWR#
Text Label 8050 2100 0    60   ~ 0
bRD#
Text Label 8050 2000 0    60   ~ 0
bRESET#
Text Label 8050 1900 0    60   ~ 0
bD7
Text Label 8050 1700 0    60   ~ 0
bD5
Text Label 8050 1600 0    60   ~ 0
bD4
Text Label 8050 1500 0    60   ~ 0
bD3
Text Label 8050 1400 0    60   ~ 0
bD2
Text Label 8050 1800 0    60   ~ 0
bD6
Text Label 8050 1300 0    60   ~ 0
bD1
Text Label 8050 1200 0    60   ~ 0
bD0
Text Label 1050 4850 0    60   ~ 0
RD#
NoConn ~ 9150 7150
NoConn ~ 9150 8350
Text Label 1050 2950 0    60   ~ 0
A3
Text Label 1050 3150 0    60   ~ 0
A5
Text Label 1050 3250 0    60   ~ 0
A6
Text Label 1050 3350 0    60   ~ 0
A7
Text Label 1050 3050 0    60   ~ 0
A4
Text Label 1050 2650 0    60   ~ 0
A0
Text Label 1050 2850 0    60   ~ 0
A2
Text Label 1050 2750 0    60   ~ 0
A1
Text Label 3950 2750 0    60   ~ 0
bA1
Text Label 3950 2850 0    60   ~ 0
bA2
Text Label 3950 2650 0    60   ~ 0
bA0
Text Label 3950 3050 0    60   ~ 0
bA4
Text Label 3950 3350 0    60   ~ 0
bA7
Text Label 3950 3250 0    60   ~ 0
bA6
Text Label 3950 3150 0    60   ~ 0
bA5
Text Label 3950 2950 0    60   ~ 0
bA3
$Comp
L Z80FDC-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue U1
U 1 1 60BC80C2
P 2050 3150
F 0 "U1" H 2150 3725 60  0000 L BNN
F 1 "74LS244" H 1950 2700 60  0000 L TNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 2050 3150 60  0001 C CNN
F 3 "" H 2050 3150 60  0001 C CNN
	1    2050 3150
	1    0    0    -1  
$EndComp
Text Label 2800 5250 0    60   ~ 0
bRESET#
$Comp
L 74xx:74LS32 U5
U 3 1 6347E5BD
P 13050 5450
F 0 "U5" H 13050 5500 50  0000 C CNN
F 1 "74LS32" H 13050 5400 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 13050 5450 50  0001 C CNN
F 3 "" H 13050 5450 50  0001 C CNN
	3    13050 5450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 4 1 6347F10F
P 13050 5800
F 0 "U5" H 13050 5850 50  0000 C CNN
F 1 "74LS32" H 13050 5750 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 13050 5800 50  0001 C CNN
F 3 "" H 13050 5800 50  0001 C CNN
	4    13050 5800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 5 1 6347FF24
P 6250 8750
F 0 "U5" H 6150 8800 50  0000 L CNN
F 1 "74LS32" H 6100 8700 50  0000 L CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 6250 8750 50  0001 C CNN
F 3 "" H 6250 8750 50  0001 C CNN
	5    6250 8750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 2 1 63467580
P 5300 5750
F 0 "U5" H 5300 5800 50  0000 C CNN
F 1 "74LS32" H 5300 5700 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 5300 5750 50  0001 C CNN
F 3 "" H 5300 5750 50  0001 C CNN
	2    5300 5750
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C6
U 1 1 637B9E50
P 4500 7800
F 0 "C6" H 4550 7900 50  0000 L CNN
F 1 "0.1u" H 4550 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4500 7800 60  0001 C CNN
F 3 "" H 4500 7800 60  0001 C CNN
	1    4500 7800
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C7
U 1 1 637B9E5A
P 4750 7800
F 0 "C7" H 4800 7900 50  0000 L CNN
F 1 "0.1u" H 4800 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4750 7800 60  0001 C CNN
F 3 "" H 4750 7800 60  0001 C CNN
	1    4750 7800
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C8
U 1 1 60B4CA7D
P 5000 7800
F 0 "C8" H 5050 7900 50  0000 L CNN
F 1 "0.1u" H 5050 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5000 7800 60  0001 C CNN
F 3 "" H 5000 7800 60  0001 C CNN
	1    5000 7800
	1    0    0    -1  
$EndComp
$Comp
L device:LED D10
U 1 1 6068F1F7
P 3400 6850
F 0 "D10" H 3400 6950 50  0000 C CNN
F 1 "LED" H 3400 6750 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm_Horizontal_O3.81mm_Z3.0mm" H 3400 6850 60  0001 C CNN
F 3 "" H 3400 6850 60  0001 C CNN
	1    3400 6850
	0    -1   -1   0   
$EndComp
$Comp
L Z80FDC-rescue:R-device-Z80GENERIC_IO-rescue R2
U 1 1 6068F201
P 3400 6400
F 0 "R2" V 3480 6400 50  0000 C CNN
F 1 "470" V 3400 6400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3400 6400 60  0001 C CNN
F 3 "" H 3400 6400 60  0001 C CNN
	1    3400 6400
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR0101
U 1 1 6071F0FB
P 3400 6150
F 0 "#PWR0101" H 3400 6250 30  0001 C CNN
F 1 "VCC" H 3400 6250 30  0000 C CNN
F 2 "" H 3400 6150 60  0001 C CNN
F 3 "" H 3400 6150 60  0001 C CNN
	1    3400 6150
	1    0    0    -1  
$EndComp
Text Notes 3650 6900 1    60   ~ 0
IO CHIP SELECT
$Comp
L 74xx:74LS32 U5
U 1 1 6346A44C
P 15950 7500
F 0 "U5" H 15950 7550 50  0000 C CNN
F 1 "74LS32" H 15950 7450 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 15950 7500 50  0001 C CNN
F 3 "" H 15950 7500 50  0001 C CNN
	1    15950 7500
	-1   0    0    1   
$EndComp
Text Label 8050 1100 0    60   ~ 0
bA2
Text Label 8050 1000 0    60   ~ 0
bA1
Wire Wire Line
	950  5650 1350 5650
Wire Wire Line
	950  5850 1350 5850
Wire Wire Line
	950  5950 1350 5950
Wire Wire Line
	950  3950 1350 3950
Wire Wire Line
	950  4050 1350 4050
Wire Wire Line
	950  4150 1350 4150
Wire Wire Line
	950  4250 1350 4250
Wire Wire Line
	950  4350 1350 4350
Wire Wire Line
	950  4450 1350 4450
Wire Wire Line
	950  4550 1350 4550
Wire Wire Line
	950  4650 1350 4650
Wire Wire Line
	7350 6850 7850 6850
Wire Wire Line
	7350 6750 7850 6750
Wire Wire Line
	7350 6650 7850 6650
Wire Wire Line
	8650 6650 9150 6650
Wire Wire Line
	8650 6750 9150 6750
Wire Wire Line
	8650 6850 9150 6850
Wire Wire Line
	8650 6950 9150 6950
Wire Wire Line
	8650 7050 9150 7050
Wire Wire Line
	7350 7650 7850 7650
Wire Wire Line
	7350 7550 7850 7550
Wire Wire Line
	7350 7450 7850 7450
Wire Wire Line
	7350 7350 7850 7350
Wire Wire Line
	7350 7250 7850 7250
Wire Wire Line
	7350 7150 7850 7150
Wire Wire Line
	7350 7050 7850 7050
Wire Wire Line
	7350 6950 7850 6950
Wire Wire Line
	7350 7750 7850 7750
Wire Wire Line
	7350 7950 7850 7950
Wire Wire Line
	7350 7850 7850 7850
Wire Wire Line
	8650 8350 9150 8350
Wire Wire Line
	7350 8350 7850 8350
Wire Wire Line
	7350 8050 7850 8050
Wire Wire Line
	8650 8250 9150 8250
Wire Wire Line
	8650 8150 9150 8150
Wire Wire Line
	7350 8250 7850 8250
Wire Wire Line
	7350 8150 7850 8150
Wire Wire Line
	8650 8550 9150 8550
Wire Wire Line
	8650 8450 9150 8450
Wire Wire Line
	7350 8450 7850 8450
Wire Wire Line
	7350 8550 7850 8550
Wire Wire Line
	8650 7950 9150 7950
Wire Wire Line
	8650 8050 9150 8050
Wire Wire Line
	8650 7750 9150 7750
Wire Wire Line
	8650 7350 9150 7350
Wire Wire Line
	8650 7250 9150 7250
Wire Wire Line
	8650 7450 9150 7450
Wire Wire Line
	8650 7550 9150 7550
Wire Wire Line
	8650 7850 9150 7850
Wire Wire Line
	8650 7650 9150 7650
Wire Wire Line
	8650 7150 9150 7150
Wire Wire Line
	3250 7600 3500 7600
Wire Wire Line
	2350 8000 3000 8000
Connection ~ 5250 7600
Connection ~ 4500 7600
Connection ~ 4500 8000
Wire Wire Line
	4500 8000 4500 8050
Connection ~ 4250 8000
Connection ~ 6000 7600
Connection ~ 6000 8000
Connection ~ 3750 8000
Connection ~ 4250 7600
Wire Wire Line
	7350 8750 7850 8750
Wire Wire Line
	7350 8650 7850 8650
Wire Wire Line
	8650 8650 9150 8650
Wire Wire Line
	7350 8950 7850 8950
Wire Wire Line
	7350 8850 7850 8850
Wire Wire Line
	8650 8950 9150 8950
Wire Wire Line
	8650 8850 9150 8850
Wire Wire Line
	8650 8750 9150 8750
Wire Wire Line
	7350 9050 7850 9050
Wire Wire Line
	8650 9050 9150 9050
Wire Wire Line
	950  4850 1350 4850
Wire Wire Line
	2750 5650 5000 5650
Wire Wire Line
	950  5750 1350 5750
Wire Wire Line
	2750 5750 4150 5750
Connection ~ 4250 3650
Connection ~ 4250 3750
Connection ~ 4250 3850
Connection ~ 4250 3950
Connection ~ 4250 4050
Connection ~ 4250 4150
Connection ~ 4250 4250
Wire Wire Line
	4850 3850 5350 3850
Wire Wire Line
	4850 3950 5250 3950
Wire Wire Line
	4850 4050 5150 4050
Wire Wire Line
	4850 4150 5050 4150
Wire Wire Line
	4850 4250 4950 4250
Wire Wire Line
	4950 4450 4950 4250
Connection ~ 4950 4250
Wire Wire Line
	5050 4450 5050 4150
Connection ~ 5050 4150
Wire Wire Line
	5150 4450 5150 4050
Connection ~ 5150 4050
Wire Wire Line
	5250 4450 5250 3950
Connection ~ 5250 3950
Wire Wire Line
	5350 4450 5350 3850
Connection ~ 5350 3850
Wire Wire Line
	5450 4450 5450 3750
Wire Wire Line
	5550 4450 5550 3650
Wire Wire Line
	5650 4450 5650 3550
Wire Wire Line
	7150 2650 7250 2650
Wire Wire Line
	2750 5850 3850 5850
Wire Wire Line
	3850 5850 3850 2200
Wire Wire Line
	2750 5950 3750 5950
Wire Wire Line
	3750 5950 3750 2100
Wire Wire Line
	2850 3950 2750 3950
Wire Wire Line
	2950 4050 2750 4050
Wire Wire Line
	2950 1300 2950 4050
Wire Wire Line
	3050 4150 2750 4150
Wire Wire Line
	3050 1400 3050 4150
Wire Wire Line
	3150 4250 2750 4250
Wire Wire Line
	3150 1500 3150 4250
Wire Wire Line
	3250 4350 2750 4350
Wire Wire Line
	3250 1600 3250 4350
Wire Wire Line
	3350 4450 2750 4450
Wire Wire Line
	3350 1700 3350 4450
Wire Wire Line
	3450 4550 2750 4550
Wire Wire Line
	3450 1800 3450 4550
Wire Wire Line
	2750 4650 3550 4650
Wire Wire Line
	3550 4650 3550 1900
Wire Wire Line
	6150 4450 6150 5750
Wire Wire Line
	4250 3550 4250 3650
Wire Wire Line
	4150 5750 4150 5850
Wire Wire Line
	4150 5850 4400 5850
Wire Wire Line
	6150 5750 5600 5750
Connection ~ 6250 7600
Connection ~ 2350 8000
Wire Wire Line
	2350 8000 2350 9250
Wire Wire Line
	6750 8250 6750 7600
Connection ~ 6750 7600
Connection ~ 4000 7600
Connection ~ 3750 7600
Connection ~ 3500 7600
Connection ~ 3250 8000
Connection ~ 3500 8000
Connection ~ 4000 8000
Wire Wire Line
	950  5250 1350 5250
Wire Wire Line
	2750 5250 3650 5250
Wire Wire Line
	3650 5250 3650 2000
Wire Wire Line
	9800 6800 10250 6800
Wire Wire Line
	9800 6900 10250 6900
Wire Wire Line
	9800 7000 10250 7000
Wire Wire Line
	9800 7100 10250 7100
Wire Wire Line
	9800 7200 10250 7200
Wire Wire Line
	9800 7300 10250 7300
Wire Wire Line
	9800 7400 10250 7400
Wire Wire Line
	9800 7500 10250 7500
Wire Wire Line
	9800 7600 10250 7600
Wire Wire Line
	9800 7700 10250 7700
Wire Wire Line
	1350 6150 1350 6250
Wire Wire Line
	4250 8000 4500 8000
Wire Wire Line
	6000 7600 6250 7600
Wire Wire Line
	6000 8000 6250 8000
Wire Wire Line
	3750 8000 4000 8000
Wire Wire Line
	4250 7600 4500 7600
Wire Wire Line
	4250 3650 4250 3750
Wire Wire Line
	4250 3750 4250 3850
Wire Wire Line
	4250 3850 4250 3950
Wire Wire Line
	4250 3950 4250 4050
Wire Wire Line
	4250 4050 4250 4150
Wire Wire Line
	4250 4150 4250 4250
Wire Wire Line
	4250 4250 4250 4450
Wire Wire Line
	4950 4250 6150 4250
Wire Wire Line
	5050 4150 6150 4150
Wire Wire Line
	5150 4050 6150 4050
Wire Wire Line
	5250 3950 6150 3950
Wire Wire Line
	5350 3850 6150 3850
Wire Wire Line
	5450 3750 6150 3750
Wire Wire Line
	5550 3650 6150 3650
Wire Wire Line
	5650 3550 6150 3550
Wire Wire Line
	6750 7600 7050 7600
Wire Wire Line
	4000 7600 4250 7600
Wire Wire Line
	3750 7600 4000 7600
Wire Wire Line
	3500 7600 3750 7600
Wire Wire Line
	3250 8000 3500 8000
Wire Wire Line
	3500 8000 3750 8000
Wire Wire Line
	4000 8000 4250 8000
Connection ~ 1350 6150
Wire Wire Line
	950  2950 1350 2950
Wire Wire Line
	950  3050 1350 3050
Wire Wire Line
	950  3150 1350 3150
Wire Wire Line
	950  3250 1350 3250
Wire Wire Line
	950  3350 1350 3350
Wire Wire Line
	950  2650 1350 2650
Wire Wire Line
	950  2750 1350 2750
Wire Wire Line
	950  2850 1350 2850
Wire Wire Line
	2850 1200 2850 3950
Wire Wire Line
	2750 2650 4150 2650
Wire Wire Line
	2750 3350 6150 3350
Wire Wire Line
	2750 3250 6150 3250
Wire Wire Line
	2750 3150 6150 3150
Wire Wire Line
	2750 3050 6150 3050
Wire Wire Line
	2750 2950 6150 2950
Wire Wire Line
	750  6150 750  3550
Wire Wire Line
	750  3550 1350 3550
Wire Wire Line
	750  6150 1350 6150
Wire Wire Line
	1350 3650 1350 3550
Connection ~ 1350 3550
Wire Wire Line
	4500 7600 4750 7600
Wire Wire Line
	5250 7600 5500 7600
Wire Wire Line
	4500 8000 4750 8000
Wire Wire Line
	6250 7600 6750 7600
Connection ~ 6250 9250
Wire Wire Line
	6750 8250 6250 8250
Connection ~ 4750 7600
Wire Wire Line
	4750 7600 5000 7600
Connection ~ 4750 8000
Wire Wire Line
	4750 8000 5000 8000
Connection ~ 5000 7600
Wire Wire Line
	5000 7600 5250 7600
Connection ~ 5000 8000
Wire Wire Line
	5000 8000 5250 8000
Wire Wire Line
	850  5100 850  5350
Wire Wire Line
	850  5350 1350 5350
Wire Wire Line
	2750 5350 3650 5350
Wire Wire Line
	3650 7050 3400 7050
Wire Wire Line
	3650 5350 3650 7050
Wire Wire Line
	3400 6700 3400 6650
Wire Wire Line
	3400 7050 3400 7000
Wire Wire Line
	7050 8150 7050 8100
Wire Wire Line
	7050 8450 7050 9250
Wire Wire Line
	3850 2200 8350 2200
Text Label 8050 2950 0    60   ~ 0
CS_FDC#
Wire Wire Line
	6150 2850 6150 2750
Wire Wire Line
	6150 2750 6150 2650
Connection ~ 6150 2750
NoConn ~ 4850 3550
NoConn ~ 4850 3650
NoConn ~ 4850 3750
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C11
U 1 1 609908BE
P 5250 7800
F 0 "C11" H 5300 7900 50  0000 L CNN
F 1 "0.1u" H 5300 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5250 7800 60  0001 C CNN
F 3 "" H 5250 7800 60  0001 C CNN
	1    5250 7800
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C12
U 1 1 609908C8
P 5500 7800
F 0 "C12" H 5550 7900 50  0000 L CNN
F 1 "0.1u" H 5550 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5500 7800 60  0001 C CNN
F 3 "" H 5500 7800 60  0001 C CNN
	1    5500 7800
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C13
U 1 1 609908D2
P 5750 7800
F 0 "C13" H 5800 7900 50  0000 L CNN
F 1 "0.1u" H 5800 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5750 7800 60  0001 C CNN
F 3 "" H 5750 7800 60  0001 C CNN
	1    5750 7800
	1    0    0    -1  
$EndComp
Connection ~ 5250 8000
Wire Wire Line
	5250 8000 5500 8000
Connection ~ 5500 7600
Wire Wire Line
	5500 7600 5750 7600
Connection ~ 5500 8000
Wire Wire Line
	5500 8000 5750 8000
Connection ~ 5750 7600
Wire Wire Line
	5750 7600 6000 7600
Connection ~ 5750 8000
Wire Wire Line
	5750 8000 6000 8000
Wire Wire Line
	3750 2100 8350 2100
Wire Wire Line
	4150 900  8250 900 
Wire Wire Line
	4150 900  4150 2650
Wire Wire Line
	4250 2750 4250 1000
Wire Wire Line
	4250 1000 8250 1000
Wire Wire Line
	2750 2750 4250 2750
Wire Wire Line
	4350 1100 4350 2850
Wire Wire Line
	2750 2850 4350 2850
Text Label 8050 900  0    60   ~ 0
bA0
Text Notes 11900 2100 0    60   ~ 0
IO Ports\nx0 read Main Status Register\nx1 read/write Data In/Out\nx2 read/write Terminal Count\nx3 read/write User Reset FDC\nx4 <none>\nx5 write Load Control Register\nx6 read DMA Acknowledge/write Load Operations Register\nx7 read DMA Acknowledge and Terminal Count
Connection ~ 14800 1650
Wire Wire Line
	14500 4100 14300 4100
Wire Wire Line
	14200 3300 14500 3300
Wire Wire Line
	14500 3050 13900 3050
Wire Wire Line
	13900 3050 13900 2950
Wire Wire Line
	13900 2950 13400 2950
Wire Wire Line
	13250 4150 12450 4150
Wire Wire Line
	18250 2300 17950 2300
Wire Wire Line
	17150 3400 17150 2400
Wire Wire Line
	16050 5300 18800 5300
Wire Wire Line
	16050 5100 18600 5100
Wire Wire Line
	16050 4750 17650 4750
Wire Wire Line
	18000 4450 16050 4450
Wire Wire Line
	16050 4250 18100 4250
Wire Wire Line
	16050 4050 18200 4050
Connection ~ 20550 4450
Wire Wire Line
	20550 2850 20550 2950
Connection ~ 20550 4250
Connection ~ 20550 4050
Connection ~ 20550 3850
Connection ~ 20550 3650
Connection ~ 20550 3450
Connection ~ 20550 3250
Connection ~ 20550 3050
Wire Wire Line
	19650 4350 17550 4350
Wire Wire Line
	17550 4350 17550 3750
Wire Wire Line
	18200 4050 18200 3650
Wire Wire Line
	18200 3650 19650 3650
Connection ~ 18500 5000
Wire Wire Line
	18500 5000 18500 4250
Wire Wire Line
	18500 4250 19650 4250
Connection ~ 18800 5300
Wire Wire Line
	18800 5300 18800 4050
Wire Wire Line
	18800 4050 19650 4050
Wire Wire Line
	19100 4700 19100 4800
Wire Wire Line
	19100 4800 19300 4800
Wire Wire Line
	16100 2800 16050 2800
Wire Wire Line
	14500 4950 14300 4950
Wire Wire Line
	19650 3150 18900 3150
Wire Wire Line
	18900 3150 18900 5400
Connection ~ 18900 5400
Wire Wire Line
	19650 4150 18700 4150
Wire Wire Line
	18700 4150 18700 5200
Connection ~ 18700 5200
Wire Wire Line
	19650 3850 18750 3850
Wire Wire Line
	19650 3750 17750 3750
Wire Wire Line
	17750 3750 17750 4150
Wire Wire Line
	19650 4450 18600 4450
Wire Wire Line
	18600 4450 18600 5100
Connection ~ 18600 5100
Connection ~ 20550 2950
Connection ~ 20550 3150
Connection ~ 20550 3350
Connection ~ 20550 3550
Connection ~ 20550 3750
Connection ~ 20550 3950
Connection ~ 20550 4150
Connection ~ 20550 4350
Wire Wire Line
	17650 4750 17650 2850
Wire Wire Line
	17650 2850 19650 2850
Wire Wire Line
	17550 3750 16050 3750
Wire Wire Line
	18350 3950 16050 3950
Wire Wire Line
	17750 4150 16050 4150
Wire Wire Line
	17450 4350 16050 4350
Wire Wire Line
	16050 5000 18500 5000
Wire Wire Line
	16050 5200 18700 5200
Wire Wire Line
	16050 5400 18900 5400
Wire Wire Line
	14500 5250 14200 5250
Wire Wire Line
	14200 5250 14200 6000
Wire Wire Line
	14200 6000 16600 6000
Wire Wire Line
	16600 6000 16600 5500
Wire Wire Line
	16600 5500 19300 5500
Wire Wire Line
	14500 3550 13800 3550
Wire Wire Line
	13800 3550 13800 4550
Wire Wire Line
	13800 4550 12450 4550
Wire Wire Line
	12000 2850 12800 2850
Wire Wire Line
	12800 2950 12000 2950
Wire Wire Line
	14500 3200 14200 3200
Wire Wire Line
	14150 2900 14500 2900
Wire Wire Line
	14500 4200 14300 4200
Wire Wire Line
	14500 4400 14300 4400
Wire Wire Line
	14500 4300 14300 4300
Wire Wire Line
	14500 4700 14300 4700
Wire Wire Line
	14500 4800 14300 4800
Wire Wire Line
	14500 4600 14300 4600
Wire Wire Line
	14500 4500 14300 4500
$Comp
L Z80FDC-rescue:DIL14-HC3-rescue U11
U 1 1 4CDB448D
P 15150 1350
F 0 "U11" H 15150 1800 60  0000 C CNN
F 1 "16 MHz" V 15150 1350 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 15150 1350 60  0001 C CNN
F 3 "" H 15150 1350 50  0001 C CNN
	1    15150 1350
	1    0    0    -1  
$EndComp
Text Notes 13200 1100 0    60   ~ 0
FLOPPY DRIVE INTERFACE
Text Notes 19600 2400 0    60   ~ 0
IBM floppy connector\nA: =  DS1 (no twist)\nB: =  DS2 (twist)
Text Label 11200 4650 0    60   ~ 0
DACK_AND_TC#
Text Label 12050 3050 0    60   ~ 0
TEND#
Text Label 12050 2950 0    60   ~ 0
DACK_AND_TC#
Text Label 12050 2850 0    60   ~ 0
TC#
Text Label 11200 4450 0    60   ~ 0
DACK#
Text Label 12550 3650 0    60   ~ 0
TC#
Text Label 12500 4150 0    60   ~ 0
DACK_AND_TC#
Text Label 12500 3950 0    60   ~ 0
LDCR#
Text Label 13400 5800 0    60   ~ 0
DACK#
Text Label 18000 2300 0    60   ~ 0
INT#
NoConn ~ 19300 4900
$Comp
L Z80FDC-rescue:WD37C65-HC3-rescue U61
U 1 1 4CCB48B9
P 15300 4050
F 0 "U61" H 15300 4450 60  0000 C CNN
F 1 "WD37C65BJM" H 15250 4150 60  0000 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 15300 4050 60  0001 C CNN
F 3 "" H 15300 4050 50  0001 C CNN
	1    15300 4050
	1    0    0    -1  
$EndComp
NoConn ~ 16050 3150
NoConn ~ 16050 2900
$Comp
L Z80FDC-rescue:GND-HC3-rescue #PWR022
U 1 1 4CCB48B8
P 14500 5750
F 0 "#PWR022" H 14500 5750 30  0001 C CNN
F 1 "GND" H 14500 5680 30  0001 C CNN
F 2 "" H 14500 5750 50  0001 C CNN
F 3 "" H 14500 5750 50  0001 C CNN
	1    14500 5750
	1    0    0    -1  
$EndComp
Text Label 14500 4100 2    60   ~ 0
bD0
Text Label 14500 4200 2    60   ~ 0
bD1
Text Label 14500 4300 2    60   ~ 0
bD2
Text Label 14500 4400 2    60   ~ 0
bD3
Text Label 14500 4500 2    60   ~ 0
bD4
Text Label 14500 4600 2    60   ~ 0
bD5
Text Label 14500 4700 2    60   ~ 0
bD6
$Comp
L Z80FDC-rescue:VCC-HC3-rescue #PWR023
U 1 1 4CCB48B6
P 15500 1050
F 0 "#PWR023" H 15500 1150 30  0001 C CNN
F 1 "VCC" H 15500 1150 30  0000 C CNN
F 2 "" H 15500 1050 50  0001 C CNN
F 3 "" H 15500 1050 50  0001 C CNN
	1    15500 1050
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:CONN_17X2-HC3-rescue P27
U 1 1 4CCB48B4
P 20100 3650
F 0 "P27" V 19150 3650 60  0000 C CNN
F 1 "FLOPPY" H 20100 3650 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x17_P2.54mm_Horizontal" H 20100 3650 60  0001 C CNN
F 3 "" H 20100 3650 50  0001 C CNN
	1    20100 3650
	0    1    1    0   
$EndComp
$Comp
L Z80FDC-rescue:VCC-HC3-rescue #PWR024
U 1 1 4CCB48B3
P 19100 4700
F 0 "#PWR024" H 19100 4800 30  0001 C CNN
F 1 "VCC" H 19100 4800 30  0000 C CNN
F 2 "" H 19100 4700 50  0001 C CNN
F 3 "" H 19100 4700 50  0001 C CNN
	1    19100 4700
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:GND-HC3-rescue #PWR025
U 1 1 4CCB48B2
P 20550 4700
F 0 "#PWR025" H 20550 4700 30  0001 C CNN
F 1 "GND" H 20550 4630 30  0001 C CNN
F 2 "" H 20550 4700 50  0001 C CNN
F 3 "" H 20550 4700 50  0001 C CNN
	1    20550 4700
	1    0    0    -1  
$EndComp
NoConn ~ 19650 2950
Text Label 14500 3200 2    60   ~ 0
bRD#
Text Label 14500 3300 2    60   ~ 0
bWR#
Text Label 14500 2900 2    60   ~ 0
bRESET
NoConn ~ 16050 4650
Text Label 16200 3550 0    60   ~ 0
FDC_DMA
Text Label 16200 3400 0    60   ~ 0
INT_FDC
NoConn ~ 14800 1150
NoConn ~ 14800 1250
NoConn ~ 15500 1250
NoConn ~ 15500 1150
$Comp
L Z80FDC-rescue:GND-HC3-rescue #PWR026
U 1 1 4CCB48AF
P 14800 1750
F 0 "#PWR026" H 14800 1750 30  0001 C CNN
F 1 "GND" H 14800 1680 30  0001 C CNN
F 2 "" H 14800 1750 50  0001 C CNN
F 3 "" H 14800 1750 50  0001 C CNN
	1    14800 1750
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:GND-HC3-rescue #PWR027
U 1 1 4CCB48AE
P 16450 2950
F 0 "#PWR027" H 16450 2950 30  0001 C CNN
F 1 "GND" H 16450 2880 30  0001 C CNN
F 2 "" H 16450 2950 50  0001 C CNN
F 3 "" H 16450 2950 50  0001 C CNN
	1    16450 2950
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:RR8-HC3-rescue RP1
U 1 1 4CCB48AD
P 19650 5250
F 0 "RP1" H 19700 5800 60  0000 C CNN
F 1 "1000" V 19700 5300 70  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP9" H 19650 5250 60  0001 C CNN
F 3 "" H 19650 5250 50  0001 C CNN
	1    19650 5250
	1    0    0    -1  
$EndComp
NoConn ~ 19300 5600
Text Notes 19575 2975 2    40   ~ 0
key
Wire Wire Line
	14800 1650 14800 1750
Wire Wire Line
	20550 4450 20550 4700
Wire Wire Line
	20550 4250 20550 4350
Wire Wire Line
	20550 4050 20550 4150
Wire Wire Line
	20550 3850 20550 3950
Wire Wire Line
	20550 3650 20550 3750
Wire Wire Line
	20550 3450 20550 3550
Wire Wire Line
	20550 3250 20550 3350
Wire Wire Line
	20550 3050 20550 3150
Wire Wire Line
	18500 5000 19300 5000
Wire Wire Line
	18800 5300 19300 5300
Wire Wire Line
	18900 5400 19300 5400
Wire Wire Line
	18700 5200 19300 5200
Wire Wire Line
	18600 5100 19300 5100
Wire Wire Line
	20550 2950 20550 3050
Wire Wire Line
	20550 3150 20550 3250
Wire Wire Line
	20550 3350 20550 3450
Wire Wire Line
	20550 3550 20550 3650
Wire Wire Line
	20550 3750 20550 3850
Wire Wire Line
	20550 3950 20550 4050
Wire Wire Line
	20550 4150 20550 4250
Wire Wire Line
	20550 4350 20550 4450
Wire Wire Line
	16450 2800 16450 2950
Wire Wire Line
	7250 2650 7250 2950
$Comp
L 74ls-sergey:74LS138 U10
U 1 1 61C4ADB5
P 11850 3800
F 0 "U10" H 11800 3900 60  0000 C CNN
F 1 "74LS138" H 11800 3750 60  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 11850 3800 60  0001 C CNN
F 3 "" H 11850 3800 60  0001 C CNN
	1    11850 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 2950 7250 2950
Connection ~ 7250 2950
Wire Wire Line
	7250 2950 7250 5100
Wire Wire Line
	3550 1900 8250 1900
Wire Wire Line
	8250 1800 3450 1800
Wire Wire Line
	8250 1700 3350 1700
Wire Wire Line
	3250 1600 8250 1600
Wire Wire Line
	8250 1500 3150 1500
Wire Wire Line
	3050 1400 8250 1400
Wire Wire Line
	8250 1300 2950 1300
Wire Wire Line
	2850 1200 8250 1200
Text Label 10850 3650 0    60   ~ 0
bA2
Text Label 10850 3550 0    60   ~ 0
bA1
Wire Wire Line
	11250 3550 10800 3550
Wire Wire Line
	11250 3650 10800 3650
Text Label 10850 3450 0    60   ~ 0
bA0
Wire Wire Line
	10800 3450 11250 3450
Text Label 10850 3950 0    60   ~ 0
VCC
Wire Wire Line
	11250 3950 10800 3950
Text Label 10850 4150 0    60   ~ 0
CS_FDC#
$Comp
L 74xx:74LS08 U9
U 1 1 62157CEF
P 13100 3450
F 0 "U9" H 13100 3500 50  0000 C CNN
F 1 "74LS08" H 13100 3400 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 13100 3450 50  0001 C CNN
F 3 "" H 13100 3450 50  0001 C CNN
	1    13100 3450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U9
U 2 1 6215A79C
P 12150 4550
F 0 "U9" H 12150 4600 50  0000 C CNN
F 1 "74LS08" H 12150 4500 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 12150 4550 50  0001 C CNN
F 3 "" H 12150 4550 50  0001 C CNN
	2    12150 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U9
U 3 1 6215C15A
P 11200 10100
F 0 "U9" H 11200 10150 50  0000 C CNN
F 1 "74LS08" H 11200 10050 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 11200 10100 50  0001 C CNN
F 3 "" H 11200 10100 50  0001 C CNN
	3    11200 10100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U9
U 4 1 6215CF9C
P 11200 10450
F 0 "U9" H 11200 10500 50  0000 C CNN
F 1 "74LS08" H 11200 10400 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 11200 10450 50  0001 C CNN
F 3 "" H 11200 10450 50  0001 C CNN
	4    11200 10450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U9
U 5 1 6215E287
P 5750 8750
F 0 "U9" H 5650 8800 50  0000 L CNN
F 1 "74LS08" H 5600 8700 50  0000 L CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 5750 8750 50  0001 C CNN
F 3 "" H 5750 8750 50  0001 C CNN
	5    5750 8750
	1    0    0    -1  
$EndComp
Connection ~ 5750 9250
Wire Wire Line
	5750 9250 6250 9250
Wire Wire Line
	5750 8250 6250 8250
Connection ~ 6250 8250
Wire Wire Line
	12450 3550 12800 3550
Wire Wire Line
	12450 3450 12800 3450
Wire Wire Line
	12800 3450 12800 3350
Text Label 13950 3450 0    60   ~ 0
MSR-DATA#
Wire Wire Line
	13350 5800 13700 5800
Wire Wire Line
	10800 4150 11250 4150
Wire Wire Line
	13400 3450 14500 3450
$Comp
L Z80FDC-rescue:VCC-HC3-rescue #PWR0102
U 1 1 626C9BA6
P 14800 1050
F 0 "#PWR0102" H 14800 1150 30  0001 C CNN
F 1 "VCC" H 14800 1150 30  0000 C CNN
F 2 "" H 14800 1050 50  0001 C CNN
F 3 "" H 14800 1050 50  0001 C CNN
	1    14800 1050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS10 U8
U 1 1 6276BE00
P 13100 2950
F 0 "U8" H 13100 3000 50  0000 C CNN
F 1 "74LS10" H 13100 2900 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 13100 2950 50  0001 C CNN
F 3 "" H 13100 2950 50  0001 C CNN
	1    13100 2950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS10 U8
U 2 1 6276D1B7
P 13100 2550
F 0 "U8" H 13100 2600 50  0000 C CNN
F 1 "74LS10" H 13100 2500 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 13100 2550 50  0001 C CNN
F 3 "" H 13100 2550 50  0001 C CNN
	2    13100 2550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS10 U8
U 3 1 62770DEC
P 10350 10100
F 0 "U8" H 10350 10150 50  0000 C CNN
F 1 "74LS10" H 10350 10050 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 10350 10100 50  0001 C CNN
F 3 "" H 10350 10100 50  0001 C CNN
	3    10350 10100
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS10 U8
U 4 1 627725E2
P 5250 8750
F 0 "U8" H 5150 8800 50  0000 L CNN
F 1 "74LS10" H 5100 8700 50  0000 L CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 5250 8750 50  0001 C CNN
F 3 "" H 5250 8750 50  0001 C CNN
	4    5250 8750
	1    0    0    -1  
$EndComp
Connection ~ 5250 9250
Wire Wire Line
	5250 9250 5750 9250
Wire Wire Line
	5250 8250 5750 8250
Connection ~ 5750 8250
$Comp
L 74xx:74LS06 U7
U 1 1 62995F78
P 17450 2400
F 0 "U7" H 17400 2450 50  0000 C CNN
F 1 "74LS06" H 17400 2350 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 17450 2400 50  0001 C CNN
F 3 "" H 17450 2400 50  0001 C CNN
	1    17450 2400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U7
U 2 1 62999697
P 11200 9650
F 0 "U7" H 11150 9700 50  0000 C CNN
F 1 "74LS06" H 11150 9600 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 11200 9650 50  0001 C CNN
F 3 "" H 11200 9650 50  0001 C CNN
	2    11200 9650
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS06 U7
U 3 1 6299AC50
P 16550 8250
F 0 "U7" H 16500 8300 50  0000 C CNN
F 1 "74LS06" H 16500 8200 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 16550 8250 50  0001 C CNN
F 3 "" H 16550 8250 50  0001 C CNN
	3    16550 8250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U7
U 4 1 6299E6DA
P 11200 8600
F 0 "U7" H 11150 8650 50  0000 C CNN
F 1 "74LS06" H 11150 8550 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 11200 8600 50  0001 C CNN
F 3 "" H 11200 8600 50  0001 C CNN
	4    11200 8600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U7
U 5 1 6299FDBE
P 11200 8950
F 0 "U7" H 11150 9000 50  0000 C CNN
F 1 "74LS06" H 11150 8900 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 11200 8950 50  0001 C CNN
F 3 "" H 11200 8950 50  0001 C CNN
	5    11200 8950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U7
U 6 1 629A365D
P 11200 9300
F 0 "U7" H 11150 9350 50  0000 C CNN
F 1 "74LS06" H 11150 9250 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 11200 9300 50  0001 C CNN
F 3 "" H 11200 9300 50  0001 C CNN
	6    11200 9300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS06 U7
U 7 1 629A5F57
P 4750 8750
F 0 "U7" H 4650 8800 50  0000 L CNN
F 1 "74LS06" H 4600 8700 50  0000 L CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 4750 8750 50  0001 C CNN
F 3 "" H 4750 8750 50  0001 C CNN
	7    4750 8750
	1    0    0    -1  
$EndComp
Connection ~ 4750 9250
Wire Wire Line
	4750 9250 5250 9250
Connection ~ 5250 8250
NoConn ~ 10900 8600
NoConn ~ 11500 8600
NoConn ~ 10900 8950
NoConn ~ 11500 8950
NoConn ~ 10050 10000
NoConn ~ 10050 10200
NoConn ~ 10650 10100
NoConn ~ 10900 10000
NoConn ~ 10900 10200
NoConn ~ 10900 10350
NoConn ~ 10900 10550
NoConn ~ 11500 10100
NoConn ~ 11500 10450
Wire Wire Line
	18350 4050 18350 3950
Wire Wire Line
	18550 3850 18550 3950
Wire Wire Line
	18550 3950 19650 3950
Wire Wire Line
	16050 3850 18550 3850
Wire Wire Line
	18750 4050 18750 3850
Wire Wire Line
	18350 4050 18750 4050
Wire Wire Line
	4750 8250 5250 8250
Text Label 16900 8250 0    60   ~ 0
RDY
Text Label 15600 7500 2    60   ~ 0
TEND#
Text Label 15200 8250 0    60   ~ 0
FDC_DMA
NoConn ~ 10900 9300
NoConn ~ 11500 9300
Wire Wire Line
	17350 7500 16250 7500
Text Label 17000 7500 2    60   ~ 0
PULSE#
Wire Wire Line
	16050 3550 16900 3550
Wire Wire Line
	16900 3300 16900 3550
$Comp
L Z80FDC-rescue:R-HC3-rescue R47
U 1 1 4E46BD83
P 16900 3050
F 0 "R47" V 16980 3050 50  0000 C CNN
F 1 "4700" V 16900 3050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16900 3050 60  0001 C CNN
F 3 "" H 16900 3050 50  0001 C CNN
	1    16900 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	16650 3400 17150 3400
Wire Wire Line
	16050 3400 16650 3400
Connection ~ 16650 3400
Wire Wire Line
	16650 3300 16650 3400
Wire Wire Line
	16650 2800 16900 2800
Connection ~ 16650 2800
$Comp
L Z80FDC-rescue:R-HC3-rescue R46
U 1 1 4E46BD7B
P 16650 3050
F 0 "R46" V 16730 3050 50  0000 C CNN
F 1 "4700" V 16650 3050 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16650 3050 60  0001 C CNN
F 3 "" H 16650 3050 50  0001 C CNN
	1    16650 3050
	1    0    0    -1  
$EndComp
NoConn ~ 7350 8350
Wire Wire Line
	2350 9250 4750 9250
Wire Wire Line
	16250 7500 16250 7400
Connection ~ 16250 7500
Wire Wire Line
	16250 7600 16250 7500
$Comp
L conn:CONN_3 P3
U 1 1 60E0AECD
P 17850 8150
F 0 "P3" H 17978 8178 40  0000 L CNN
F 1 "CONN_3" H 17978 8102 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 17850 8150 60  0001 C CNN
F 3 "" H 17850 8150 60  0001 C CNN
	1    17850 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	17350 7500 17350 8050
Wire Wire Line
	17350 8050 17500 8050
$Comp
L Z80FDC-rescue:R-device-Z80GENERIC_IO-rescue R5
U 1 1 60F96E54
P 16850 8000
F 0 "R5" V 16930 8000 50  0000 C CNN
F 1 "4700" V 16850 8000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16850 8000 60  0001 C CNN
F 3 "" H 16850 8000 60  0001 C CNN
	1    16850 8000
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 60F9748E
P 16850 7750
F 0 "#PWR0104" H 16850 7850 30  0001 C CNN
F 1 "VCC" H 16850 7850 30  0000 C CNN
F 2 "" H 16850 7750 60  0001 C CNN
F 3 "" H 16850 7750 60  0001 C CNN
	1    16850 7750
	1    0    0    -1  
$EndComp
Connection ~ 16850 8250
Wire Wire Line
	16850 8250 17500 8250
$Comp
L Z80FDC-rescue:R-device-Z80GENERIC_IO-rescue R3
U 1 1 6103988B
P 5900 2650
F 0 "R3" V 5980 2650 50  0000 C CNN
F 1 "4700" V 5900 2650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5900 2650 60  0001 C CNN
F 3 "" H 5900 2650 60  0001 C CNN
	1    5900 2650
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0105
U 1 1 61039895
P 5650 2650
F 0 "#PWR0105" H 5650 2750 30  0001 C CNN
F 1 "VCC" H 5650 2750 30  0000 C CNN
F 2 "" H 5650 2650 60  0001 C CNN
F 3 "" H 5650 2650 60  0001 C CNN
	1    5650 2650
	1    0    0    -1  
$EndComp
Connection ~ 6150 2650
$Comp
L power:VCC #PWR0103
U 1 1 60F1B8DB
P 17350 7000
F 0 "#PWR0103" H 17350 7100 30  0001 C CNN
F 1 "VCC" H 17350 7100 30  0000 C CNN
F 2 "" H 17350 7000 60  0001 C CNN
F 3 "" H 17350 7000 60  0001 C CNN
	1    17350 7000
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:R-device-Z80GENERIC_IO-rescue R4
U 1 1 60ED8D25
P 17350 7250
F 0 "R4" V 17430 7250 50  0000 C CNN
F 1 "4700" V 17350 7250 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 17350 7250 60  0001 C CNN
F 3 "" H 17350 7250 60  0001 C CNN
	1    17350 7250
	-1   0    0    1   
$EndComp
Connection ~ 17350 7500
NoConn ~ 10900 9650
NoConn ~ 11500 9650
NoConn ~ 10050 10100
Text Notes 15700 6900 0    60   ~ 0
EXTERNAL DMA INTERFACE
Wire Wire Line
	11250 4050 11250 4150
Connection ~ 11250 4150
Wire Wire Line
	8250 1100 4350 1100
Wire Wire Line
	16900 3550 16900 6100
Wire Wire Line
	16900 6100 14600 6100
Wire Wire Line
	14600 6100 14600 8250
Wire Wire Line
	14600 8250 15650 8250
Connection ~ 16900 3550
Wire Wire Line
	17500 8150 17200 8150
Text Label 17250 8150 0    60   ~ 0
GND
Wire Wire Line
	15650 1650 15650 1350
Wire Wire Line
	15650 1350 15500 1350
Wire Wire Line
	15500 1650 15650 1650
NoConn ~ 15500 1550
NoConn ~ 15500 1450
Wire Wire Line
	14800 1350 14650 1350
Wire Wire Line
	14650 1350 14650 1650
Wire Wire Line
	14650 1650 14800 1650
NoConn ~ 14800 1450
NoConn ~ 14800 1550
Wire Wire Line
	10500 3050 10500 5050
Wire Wire Line
	10500 5050 13800 5050
Wire Wire Line
	10500 3050 12800 3050
Wire Wire Line
	13800 7500 15650 7500
Wire Wire Line
	13800 5050 13800 7500
Text Label 14500 4800 2    60   ~ 0
bD7
Text Label 14500 4950 2    60   ~ 0
bA0
$Comp
L conn:CONN_3 P4
U 1 1 61124462
P 18600 2400
F 0 "P4" H 18728 2428 40  0000 L CNN
F 1 "CONN_3" H 18728 2352 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 18600 2400 60  0001 C CNN
F 3 "" H 18600 2400 60  0001 C CNN
	1    18600 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	18250 2500 17950 2500
Text Label 18000 2500 0    60   ~ 0
NMI#
Wire Wire Line
	17750 2400 18250 2400
Wire Wire Line
	850  5100 850  4950
Connection ~ 850  5100
Wire Wire Line
	850  4950 1350 4950
Wire Wire Line
	850  5100 7250 5100
Wire Wire Line
	13400 2550 14150 2550
Wire Wire Line
	14150 2550 14150 2900
Wire Wire Line
	12450 3650 12800 3650
Wire Wire Line
	12450 3750 13550 3750
Wire Wire Line
	13550 3750 13550 2750
Text Label 12500 3750 0    60   ~ 0
USER_RESET#
Wire Wire Line
	3650 2000 9150 2000
Text Label 12050 2450 0    60   ~ 0
bRESET#
Wire Wire Line
	12000 2750 12000 2650
Wire Wire Line
	12000 2650 12800 2650
Wire Wire Line
	12000 2750 13550 2750
Text Label 12050 2650 0    60   ~ 0
USER_RESET#
Wire Wire Line
	12800 2550 12800 2450
Wire Wire Line
	12800 2450 9150 2450
Connection ~ 12800 2450
Wire Wire Line
	9150 2450 9150 2000
Text Notes 17300 2800 0    60   ~ 0
NOTE: RELIES ON 4700 OHM PULL UP\nRESISTOR ON Z80 PROCESSOR BOARD
$Comp
L mechanical:MountingHole_Pad H1
U 1 1 61C3F302
P 11300 6750
F 0 "H1" H 11400 6799 50  0000 L CNN
F 1 "MountingHole_Pad" H 11400 6708 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 11300 6750 50  0001 C CNN
F 3 "~" H 11300 6750 50  0001 C CNN
	1    11300 6750
	1    0    0    -1  
$EndComp
$Comp
L mechanical:MountingHole_Pad H2
U 1 1 61C45E49
P 12150 6750
F 0 "H2" H 12250 6799 50  0000 L CNN
F 1 "MountingHole_Pad" H 12250 6708 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 12150 6750 50  0001 C CNN
F 3 "~" H 12150 6750 50  0001 C CNN
	1    12150 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11300 6850 11750 6850
Wire Wire Line
	11750 6850 11750 6900
Connection ~ 11750 6850
Wire Wire Line
	11750 6850 12150 6850
$Comp
L power:GND #PWR07
U 1 1 61CA5BE9
P 11750 6900
F 0 "#PWR07" H 11750 6900 30  0001 C CNN
F 1 "GND" H 11750 6830 30  0001 C CNN
F 2 "" H 11750 6900 60  0001 C CNN
F 3 "" H 11750 6900 60  0001 C CNN
	1    11750 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	16450 2800 16650 2800
Wire Wire Line
	14500 5400 14500 5500
Connection ~ 15950 1650
$Comp
L Z80FDC-rescue:DIL14-HC3-rescue U12
U 1 1 61DBD140
P 16300 1350
F 0 "U12" H 16300 1800 60  0000 C CNN
F 1 "9.6 MHz" V 16300 1350 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 16300 1350 60  0001 C CNN
F 3 "" H 16300 1350 50  0001 C CNN
	1    16300 1350
	1    0    0    -1  
$EndComp
$Comp
L Z80FDC-rescue:VCC-HC3-rescue #PWR010
U 1 1 61DBD410
P 16650 1050
F 0 "#PWR010" H 16650 1150 30  0001 C CNN
F 1 "VCC" H 16650 1150 30  0000 C CNN
F 2 "" H 16650 1050 50  0001 C CNN
F 3 "" H 16650 1050 50  0001 C CNN
	1    16650 1050
	1    0    0    -1  
$EndComp
NoConn ~ 15950 1150
NoConn ~ 15950 1250
NoConn ~ 16650 1250
NoConn ~ 16650 1150
$Comp
L Z80FDC-rescue:GND-HC3-rescue #PWR09
U 1 1 61DBD41E
P 15950 1750
F 0 "#PWR09" H 15950 1750 30  0001 C CNN
F 1 "GND" H 15950 1680 30  0001 C CNN
F 2 "" H 15950 1750 50  0001 C CNN
F 3 "" H 15950 1750 50  0001 C CNN
	1    15950 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	15950 1650 15950 1750
$Comp
L Z80FDC-rescue:VCC-HC3-rescue #PWR08
U 1 1 61DBD429
P 15950 1050
F 0 "#PWR08" H 15950 1150 30  0001 C CNN
F 1 "VCC" H 15950 1150 30  0000 C CNN
F 2 "" H 15950 1050 50  0001 C CNN
F 3 "" H 15950 1050 50  0001 C CNN
	1    15950 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	16800 1650 16800 1350
Wire Wire Line
	16800 1350 16650 1350
Wire Wire Line
	16650 1650 16800 1650
NoConn ~ 16650 1550
NoConn ~ 16650 1450
Wire Wire Line
	15950 1350 15800 1350
Wire Wire Line
	15800 1350 15800 1650
Wire Wire Line
	15800 1650 15950 1650
NoConn ~ 15950 1450
NoConn ~ 15950 1550
Wire Wire Line
	16100 2800 16100 2350
Wire Wire Line
	16100 2350 15650 2350
Wire Wire Line
	15650 2350 15650 1650
Connection ~ 15650 1650
Wire Wire Line
	16800 2350 16200 2350
Wire Wire Line
	16200 2350 16200 3050
Wire Wire Line
	16050 3050 16200 3050
Text Notes 16950 1500 0    60   ~ 0
NOTE: U12 OPTIONAL\nSECONDARY CLOCK\nFOR 150/300 KBPS\nDRIVES. USE P5 1-2 \nCLOSED TO ENABLE;\nDEFAULT IS 2-3 CLOSED\n
$Comp
L Z80FDC-rescue:C-device-Z80GENERIC_IO-rescue C14
U 1 1 61F70414
P 3000 7800
F 0 "C14" H 3050 7900 50  0000 L CNN
F 1 "0.1u" H 3050 7700 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3000 7800 60  0001 C CNN
F 3 "" H 3000 7800 60  0001 C CNN
	1    3000 7800
	1    0    0    -1  
$EndComp
Connection ~ 3000 8000
Wire Wire Line
	3000 8000 3250 8000
Wire Wire Line
	3000 7600 3250 7600
Connection ~ 3250 7600
Wire Wire Line
	14500 5750 14500 5500
Connection ~ 14500 5500
Text Notes 18700 6200 0    60   ~ 0
NOTE: REPLACE RP1 WITH 150 OHM\n9 PIN SIP RESISTOR PACK FOR\nLEGACY FLOPPY DRIVES; 1000 OHM\nFOR 3.5" IBM PC 1.44MB COMPATIBLE
$Comp
L conn:CONN_3 P5
U 1 1 6207789E
P 17800 1750
F 0 "P5" H 17928 1778 40  0000 L CNN
F 1 "CONN_3" H 17928 1702 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 17800 1750 60  0001 C CNN
F 3 "" H 17800 1750 60  0001 C CNN
	1    17800 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	17450 1850 17150 1850
Text Label 17200 1850 0    60   ~ 0
GND
Wire Wire Line
	17450 1750 16800 1750
Wire Wire Line
	16800 1750 16800 2350
Wire Wire Line
	16800 1650 17450 1650
Connection ~ 16800 1650
$Comp
L 74xx:74LS04 U4
U 1 1 60EAFD47
P 4700 5850
F 0 "U4" H 4650 5900 50  0000 C CNN
F 1 "74LS04" H 4650 5800 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 4700 5850 50  0001 C CNN
F 3 "" H 4700 5850 50  0001 C CNN
	1    4700 5850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 2 1 60EB29B5
P 15950 8250
F 0 "U4" H 15900 8300 50  0000 C CNN
F 1 "74LS04" H 15900 8200 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 15950 8250 50  0001 C CNN
F 3 "" H 15950 8250 50  0001 C CNN
	2    15950 8250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 3 1 60EB3585
P 10350 8600
F 0 "U4" H 10300 8650 50  0000 C CNN
F 1 "74LS04" H 10300 8550 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 10350 8600 50  0001 C CNN
F 3 "" H 10350 8600 50  0001 C CNN
	3    10350 8600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 4 1 60EB3BF7
P 10350 8950
F 0 "U4" H 10300 9000 50  0000 C CNN
F 1 "74LS04" H 10300 8900 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 10350 8950 50  0001 C CNN
F 3 "" H 10350 8950 50  0001 C CNN
	4    10350 8950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 5 1 60EB4726
P 10350 9300
F 0 "U4" H 10300 9350 50  0000 C CNN
F 1 "74LS04" H 10300 9250 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 10350 9300 50  0001 C CNN
F 3 "" H 10350 9300 50  0001 C CNN
	5    10350 9300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 6 1 60EB50FE
P 10350 9650
F 0 "U4" H 10300 9700 50  0000 C CNN
F 1 "74LS04" H 10300 9600 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 10350 9650 50  0001 C CNN
F 3 "" H 10350 9650 50  0001 C CNN
	6    10350 9650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 7 1 60EB5C00
P 6750 8750
F 0 "U4" H 6650 8800 50  0000 L CNN
F 1 "74LS04" H 6600 8700 50  0000 L CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 6750 8750 50  0001 C CNN
F 3 "" H 6750 8750 50  0001 C CNN
	7    6750 8750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 9250 6750 9250
Connection ~ 6750 8250
Connection ~ 6750 9250
Wire Wire Line
	6750 9250 7050 9250
NoConn ~ 10050 8600
NoConn ~ 10050 8950
NoConn ~ 10050 9300
NoConn ~ 10050 9650
NoConn ~ 10650 9650
NoConn ~ 10650 9300
NoConn ~ 10650 8950
NoConn ~ 10650 8600
NoConn ~ 19650 3050
Wire Wire Line
	19650 3250 18000 3250
Wire Wire Line
	18000 3250 18000 4450
Wire Wire Line
	19650 3350 17450 3350
Wire Wire Line
	17450 3350 17450 4350
Wire Wire Line
	19650 3450 18100 3450
Wire Wire Line
	18100 3450 18100 4250
Wire Wire Line
	16050 4550 17850 4550
Wire Wire Line
	17850 4550 17850 3550
Wire Wire Line
	17850 3550 19650 3550
Wire Wire Line
	12450 5900 12750 5900
Wire Wire Line
	12750 5350 12450 5350
Text Label 12700 5900 2    60   ~ 0
bRD#
Wire Wire Line
	12750 5700 12750 5550
Wire Wire Line
	13700 5450 13350 5450
Text Label 13400 5450 0    60   ~ 0
LDOR#
Wire Wire Line
	13600 4750 12300 4750
Wire Wire Line
	12300 4750 12300 5550
Wire Wire Line
	12300 5550 12750 5550
Connection ~ 12750 5550
Wire Wire Line
	10950 4450 10950 6100
Wire Wire Line
	10950 6100 13700 6100
Wire Wire Line
	13700 6100 13700 5800
Wire Wire Line
	10950 4450 11850 4450
Wire Wire Line
	11850 4650 11150 4650
NoConn ~ 12450 3850
Text Label 12700 5350 2    60   ~ 0
bWR#
Wire Wire Line
	13700 5450 13700 3650
Wire Wire Line
	13700 3650 14500 3650
Wire Wire Line
	14500 3750 13900 3750
Wire Wire Line
	13900 3750 13900 3950
Wire Wire Line
	13900 3950 12450 3950
Wire Wire Line
	12450 4050 13600 4050
Wire Wire Line
	13600 4050 13600 4750
$EndSCHEMATC
