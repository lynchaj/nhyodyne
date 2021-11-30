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
L Z80SERIAL2-rescue:74LS245-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue U2
U 1 1 603971FD
P 1850 5700
F 0 "U2" H 1950 6275 60  0000 L BNN
F 1 "74LS245" H 1750 5250 60  0000 L TNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 1850 5700 60  0001 C CNN
F 3 "" H 1850 5700 60  0001 C CNN
	1    1850 5700
	1    0    0    -1  
$EndComp
Text Label 850  7100 0    60   ~ 0
WR#
Text Label 850  7200 0    60   ~ 0
RD#
Text Label 850  6900 0    60   ~ 0
IORQ#
Text Label 850  5300 0    60   ~ 0
D1
Text Label 850  5400 0    60   ~ 0
D2
Text Label 850  5500 0    60   ~ 0
D3
Text Label 850  5200 0    60   ~ 0
D0
Text Label 850  5700 0    60   ~ 0
D5
Text Label 850  5800 0    60   ~ 0
D6
Text Label 850  5900 0    60   ~ 0
D7
Text Label 850  5600 0    60   ~ 0
D4
Text Label 7250 8000 0    60   ~ 0
A9
Text Label 7250 7900 0    60   ~ 0
A10
Text Label 8550 7900 0    60   ~ 0
A11
Text Label 7250 8100 0    60   ~ 0
A8
Text Label 8550 8100 0    60   ~ 0
A13
Text Label 8550 8200 0    60   ~ 0
A14
Text Label 8550 8300 0    60   ~ 0
A15
Text Label 8550 8000 0    60   ~ 0
A12
Text Label 7250 8800 0    60   ~ 0
A1
Text Label 7250 8700 0    60   ~ 0
A2
Text Label 7250 8600 0    60   ~ 0
A3
Text Label 7250 8900 0    60   ~ 0
A0
Text Label 7250 8400 0    60   ~ 0
A5
Text Label 7250 8300 0    60   ~ 0
A6
Text Label 7250 8200 0    60   ~ 0
A7
Text Label 7250 8500 0    60   ~ 0
A4
Text Label 7250 9000 0    60   ~ 0
GND
Text Label 7250 9100 0    60   ~ 0
RFSH#
Text Label 8550 9600 0    60   ~ 0
HALT#
Text Label 7250 9600 0    60   ~ 0
BUSACK#
Text Label 7250 9200 0    60   ~ 0
M1#
Text Label 7250 9400 0    60   ~ 0
BUSRQ#
Text Label 8550 9500 0    60   ~ 0
NMI#
Text Label 8550 9400 0    60   ~ 0
INT#
Text Label 7250 9500 0    60   ~ 0
WAIT#
Text Label 7250 9300 0    60   ~ 0
RESET#
Text Label 8550 9700 0    60   ~ 0
MREQ#
Text Label 7250 9700 0    60   ~ 0
WR#
Text Label 7250 9800 0    60   ~ 0
RD#
Text Label 8550 9800 0    60   ~ 0
IORQ#
Text Label 8550 9300 0    60   ~ 0
D1
Text Label 8550 9000 0    60   ~ 0
D2
Text Label 8550 8600 0    60   ~ 0
D3
Text Label 8550 9200 0    60   ~ 0
D0
Text Label 8550 8700 0    60   ~ 0
D5
Text Label 8550 8800 0    60   ~ 0
D6
Text Label 8550 9100 0    60   ~ 0
D7
Text Label 8550 8500 0    60   ~ 0
D4
Text Label 8550 8900 0    60   ~ 0
VCC
Text Label 8550 8400 0    60   ~ 0
CLK
$Comp
L Z80SERIAL2-rescue:C-device-Z80SERIAL-rescue C1
U 1 1 603A8E72
P 1600 9050
F 0 "C1" H 1650 9150 50  0000 L CNN
F 1 "0.1u" H 1650 8950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1600 9050 60  0001 C CNN
F 3 "" H 1600 9050 60  0001 C CNN
	1    1600 9050
	1    0    0    -1  
$EndComp
$Comp
L Z80SERIAL2-rescue:C-device-Z80SERIAL-rescue C2
U 1 1 603A8ED5
P 1850 9050
F 0 "C2" H 1900 9150 50  0000 L CNN
F 1 "0.1u" H 1900 8950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1850 9050 60  0001 C CNN
F 3 "" H 1850 9050 60  0001 C CNN
	1    1850 9050
	1    0    0    -1  
$EndComp
$Comp
L Z80SERIAL2-rescue:C-device-Z80SERIAL-rescue C3
U 1 1 603A8F23
P 2100 9050
F 0 "C3" H 2150 9150 50  0000 L CNN
F 1 "0.1u" H 2150 8950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2100 9050 60  0001 C CNN
F 3 "" H 2100 9050 60  0001 C CNN
	1    2100 9050
	1    0    0    -1  
$EndComp
$Comp
L Z80SERIAL2-rescue:C-device-Z80SERIAL-rescue C4
U 1 1 603A8F29
P 2350 9050
F 0 "C4" H 2400 9150 50  0000 L CNN
F 1 "0.1u" H 2400 8950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2350 9050 60  0001 C CNN
F 3 "" H 2350 9050 60  0001 C CNN
	1    2350 9050
	1    0    0    -1  
$EndComp
$Comp
L Z80SERIAL2-rescue:C-device-Z80SERIAL-rescue C5
U 1 1 603A8FA5
P 2600 9050
F 0 "C5" H 2650 9150 50  0000 L CNN
F 1 "0.1u" H 2650 8950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2600 9050 60  0001 C CNN
F 3 "" H 2600 9050 60  0001 C CNN
	1    2600 9050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 603A93CE
P 2850 9300
F 0 "#PWR02" H 2850 9300 30  0001 C CNN
F 1 "GND" H 2850 9230 30  0001 C CNN
F 2 "" H 2850 9300 60  0001 C CNN
F 3 "" H 2850 9300 60  0001 C CNN
	1    2850 9300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 603A9412
P 2850 8850
F 0 "#PWR01" H 2850 8950 30  0001 C CNN
F 1 "VCC" H 2850 8950 30  0000 C CNN
F 2 "" H 2850 8850 60  0001 C CNN
F 3 "" H 2850 8850 60  0001 C CNN
	1    2850 8850
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 603A9456
P 3600 8850
F 0 "#FLG02" H 3600 8945 30  0001 C CNN
F 1 "PWR_FLAG" H 3600 9030 30  0000 C CNN
F 2 "" H 3600 8850 60  0001 C CNN
F 3 "" H 3600 8850 60  0001 C CNN
	1    3600 8850
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 603A949A
P 1350 9250
F 0 "#FLG01" H 1350 9345 30  0001 C CNN
F 1 "PWR_FLAG" H 1350 9430 30  0000 C CNN
F 2 "" H 1350 9250 60  0001 C CNN
F 3 "" H 1350 9250 60  0001 C CNN
	1    1350 9250
	1    0    0    -1  
$EndComp
$Comp
L Z80SERIAL2-rescue:CP-device-Z80SERIAL-rescue C10
U 1 1 6039BD2A
P 4350 9050
F 0 "C10" H 4400 9150 50  0000 L CNN
F 1 "10u" H 4400 8950 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4350 9050 60  0001 C CNN
F 3 "" H 4350 9050 60  0001 C CNN
	1    4350 9050
	1    0    0    -1  
$EndComp
$Comp
L Z80SERIAL2-rescue:CP-device-Z80SERIAL-rescue C11
U 1 1 603A3D80
P 4600 9050
F 0 "C11" H 4650 9150 50  0000 L CNN
F 1 "10u" H 4650 8950 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4600 9050 60  0001 C CNN
F 3 "" H 4600 9050 60  0001 C CNN
	1    4600 9050
	1    0    0    -1  
$EndComp
$Comp
L device:LED D2
U 1 1 603A5584
P 5400 9550
F 0 "D2" H 5400 9650 50  0000 C CNN
F 1 "LED" H 5400 9450 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm_Horizontal_O3.81mm_Z3.0mm" H 5400 9550 60  0001 C CNN
F 3 "" H 5400 9550 60  0001 C CNN
	1    5400 9550
	0    -1   -1   0   
$EndComp
$Comp
L Z80SERIAL2-rescue:R-device-Z80SERIAL-rescue R2
U 1 1 603A596D
P 5400 9100
F 0 "R2" V 5480 9100 50  0000 C CNN
F 1 "470" V 5400 9100 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5400 9100 60  0001 C CNN
F 3 "" H 5400 9100 60  0001 C CNN
	1    5400 9100
	-1   0    0    1   
$EndComp
$Comp
L conn:CONN_25X2 P2
U 1 1 603D6D37
P 8050 9100
F 0 "P2" H 8050 10400 60  0000 C CNN
F 1 "Z80 BUS BACKPLANE" V 8050 9100 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x25_P2.54mm_Horizontal" H 8050 9100 60  0001 C CNN
F 3 "" H 8050 9100 60  0001 C CNN
	1    8050 9100
	1    0    0    -1  
$EndComp
Text Label 8550 10100 0    60   ~ 0
SPARE2
Text Label 8550 10000 0    60   ~ 0
SPARE1
Text Label 8550 9900 0    60   ~ 0
SPARE0
Text Label 8550 10200 0    60   ~ 0
SPARE3
Text Label 8550 10300 0    60   ~ 0
SPARE4
Text Label 7250 10100 0    60   ~ 0
SPARE7
Text Label 7250 10000 0    60   ~ 0
SPARE8
Text Label 7250 9900 0    60   ~ 0
SPARE9
Text Label 7250 10200 0    60   ~ 0
SPARE6
Text Label 7250 10300 0    60   ~ 0
SPARE5
Text Notes 7100 7700 0    60   ~ 0
Note: Bus connector is mirror image of Z80\nCPU pin out to mate to backplane whose\nconnectors reflect Z80 CPU pin out.
$Comp
L conn:CONN_10 P1
U 1 1 603FC724
P 6600 9650
F 0 "P1" V 6550 9650 60  0000 C CNN
F 1 "SPARES" V 6650 9650 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 6600 9650 60  0001 C CNN
F 3 "" H 6600 9650 60  0001 C CNN
	1    6600 9650
	1    0    0    -1  
$EndComp
Text Label 5850 9900 0    60   ~ 0
SPARE7
Text Label 5850 10000 0    60   ~ 0
SPARE8
Text Label 5850 10100 0    60   ~ 0
SPARE9
Text Label 5850 9800 0    60   ~ 0
SPARE6
Text Label 5850 9700 0    60   ~ 0
SPARE5
Text Label 5850 9400 0    60   ~ 0
SPARE2
Text Label 5850 9300 0    60   ~ 0
SPARE1
Text Label 5850 9200 0    60   ~ 0
SPARE0
Text Label 5850 9500 0    60   ~ 0
SPARE3
Text Label 5850 9600 0    60   ~ 0
SPARE4
NoConn ~ 2550 6700
Text Label 850  7000 0    60   ~ 0
M1#
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 6044C0E0
P 4350 5100
F 0 "SW1" H 4350 5650 50  0000 C CNN
F 1 "IO PORT ADDR" H 4350 4650 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_DIP_x8_W7.62mm_Slide" H 4350 5100 50  0001 C CNN
F 3 "" H 4350 5100 50  0001 C CNN
	1    4350 5100
	1    0    0    1   
$EndComp
$Comp
L Z80SERIAL2-rescue:RR8-device-Z80SERIAL-rescue RR1
U 1 1 6044D2F4
P 5100 6050
F 0 "RR1" H 5150 6650 70  0000 C CNN
F 1 "10K" V 5130 6050 70  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP9" H 5100 6050 60  0001 C CNN
F 3 "" H 5100 6050 60  0001 C CNN
	1    5100 6050
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR07
U 1 1 6044E13A
P 6450 3600
F 0 "#PWR07" H 6450 3700 30  0001 C CNN
F 1 "VCC" H 6450 3700 30  0000 C CNN
F 2 "" H 6450 3600 60  0001 C CNN
F 3 "" H 6450 3600 60  0001 C CNN
	1    6450 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 6044E58D
P 6450 6000
F 0 "#PWR08" H 6450 6000 30  0001 C CNN
F 1 "GND" H 6450 5930 30  0001 C CNN
F 2 "" H 6450 6000 60  0001 C CNN
F 3 "" H 6450 6000 60  0001 C CNN
	1    6450 6000
	1    0    0    -1  
$EndComp
Text Notes 7350 6400 0    60   ~ 0
Note: IO Address Port $68-$6F\nS1=on - A7 (low)\nS2=off - A6 (high)\nS3=off - A5 (high)\nS4=on - A4 (low)\nS5=off - A3 (high)\nS6=x - A2 (no effect)\nS7=x - A1 (no effect)\nS8=x - A0 (no effect)
Text Notes 4050 7600 0    60   ~ 0
Note: Inhibit Board Operation\nDuring Interrupts\nM1# = low, IORQ# = low
$Comp
L 74xx:74LS688 U6
U 1 1 604A100F
P 6450 4800
F 0 "U6" H 6150 5850 50  0000 C CNN
F 1 "74LS688" H 6150 3750 50  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 6450 4800 50  0001 C CNN
F 3 "" H 6450 4800 50  0001 C CNN
	1    6450 4800
	1    0    0    -1  
$EndComp
Text Notes 750  7800 0    60   ~ 0
Note: Buffers/Transceivers\nrespond to IO and MEM cycles
NoConn ~ 7150 7900
NoConn ~ 7150 8000
NoConn ~ 7150 8100
NoConn ~ 8950 7900
NoConn ~ 8950 8000
NoConn ~ 8950 8100
NoConn ~ 8950 8200
NoConn ~ 8950 8300
NoConn ~ 7150 9100
NoConn ~ 7150 9400
NoConn ~ 7150 9600
NoConn ~ 7150 9500
Text Notes 9300 8600 0    60   ~ 0
Spare Components
Text Notes 900  3600 0    60   ~ 0
Z80 BUS INTERFACE
Text Label 850  6500 0    60   ~ 0
RESET#
$Comp
L power:VCC #PWR06
U 1 1 604651AE
P 5550 5700
F 0 "#PWR06" H 5550 5800 30  0001 C CNN
F 1 "VCC" H 5550 5800 30  0000 C CNN
F 2 "" H 5550 5700 60  0001 C CNN
F 3 "" H 5550 5700 60  0001 C CNN
	1    5550 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  6900 1150 6900
Wire Wire Line
	750  7100 1150 7100
Wire Wire Line
	750  7200 1150 7200
Wire Wire Line
	750  5200 1150 5200
Wire Wire Line
	750  5300 1150 5300
Wire Wire Line
	750  5400 1150 5400
Wire Wire Line
	750  5500 1150 5500
Wire Wire Line
	750  5600 1150 5600
Wire Wire Line
	750  5700 1150 5700
Wire Wire Line
	750  5800 1150 5800
Wire Wire Line
	750  5900 1150 5900
Wire Wire Line
	7150 8100 7650 8100
Wire Wire Line
	7150 8000 7650 8000
Wire Wire Line
	7150 7900 7650 7900
Wire Wire Line
	8450 7900 8950 7900
Wire Wire Line
	8450 8000 8950 8000
Wire Wire Line
	8450 8100 8950 8100
Wire Wire Line
	8450 8200 8950 8200
Wire Wire Line
	8450 8300 8950 8300
Wire Wire Line
	7150 8900 7650 8900
Wire Wire Line
	7150 8800 7650 8800
Wire Wire Line
	7150 8700 7650 8700
Wire Wire Line
	7150 8600 7650 8600
Wire Wire Line
	7150 8500 7650 8500
Wire Wire Line
	7150 8400 7650 8400
Wire Wire Line
	7150 8300 7650 8300
Wire Wire Line
	7150 8200 7650 8200
Wire Wire Line
	7150 9000 7650 9000
Wire Wire Line
	7150 9200 7650 9200
Wire Wire Line
	7150 9100 7650 9100
Wire Wire Line
	8450 9600 8950 9600
Wire Wire Line
	7150 9600 7650 9600
Wire Wire Line
	7150 9300 7650 9300
Wire Wire Line
	8450 9500 8950 9500
Wire Wire Line
	8450 9400 8950 9400
Wire Wire Line
	7150 9500 7650 9500
Wire Wire Line
	7150 9400 7650 9400
Wire Wire Line
	8450 9800 8950 9800
Wire Wire Line
	8450 9700 8950 9700
Wire Wire Line
	7150 9700 7650 9700
Wire Wire Line
	7150 9800 7650 9800
Wire Wire Line
	8450 9200 8950 9200
Wire Wire Line
	8450 9300 8950 9300
Wire Wire Line
	8450 9000 8950 9000
Wire Wire Line
	8450 8600 8950 8600
Wire Wire Line
	8450 8500 8950 8500
Wire Wire Line
	8450 8700 8950 8700
Wire Wire Line
	8450 8800 8950 8800
Wire Wire Line
	8450 9100 8950 9100
Wire Wire Line
	8450 8900 8950 8900
Wire Wire Line
	8450 8400 8950 8400
Wire Wire Line
	1600 8850 1850 8850
Wire Wire Line
	1350 9250 1600 9250
Connection ~ 3600 8850
Connection ~ 2850 8850
Connection ~ 2850 9250
Wire Wire Line
	2850 9250 2850 9300
Connection ~ 2600 9250
Connection ~ 4350 8850
Connection ~ 4350 9250
Connection ~ 2100 9250
Connection ~ 2600 8850
Wire Wire Line
	7150 10000 7650 10000
Wire Wire Line
	7150 9900 7650 9900
Wire Wire Line
	8450 9900 8950 9900
Wire Wire Line
	7150 10200 7650 10200
Wire Wire Line
	7150 10100 7650 10100
Wire Wire Line
	8450 10200 8950 10200
Wire Wire Line
	8450 10100 8950 10100
Wire Wire Line
	8450 10000 8950 10000
Wire Wire Line
	7150 10300 7650 10300
Wire Wire Line
	8450 10300 8950 10300
Wire Wire Line
	750  6100 1150 6100
Wire Wire Line
	2550 6900 4600 6900
Wire Wire Line
	750  7000 1150 7000
Wire Wire Line
	2550 7000 3750 7000
Connection ~ 4050 4900
Connection ~ 4050 5000
Connection ~ 4050 5100
Connection ~ 4050 5200
Connection ~ 4050 5300
Connection ~ 4050 5400
Connection ~ 4050 5500
Wire Wire Line
	4650 5100 5150 5100
Wire Wire Line
	4650 5200 5050 5200
Wire Wire Line
	4650 5300 4950 5300
Wire Wire Line
	4650 5400 4850 5400
Wire Wire Line
	4650 5500 4750 5500
Wire Wire Line
	4750 5700 4750 5500
Connection ~ 4750 5500
Wire Wire Line
	4850 5700 4850 5400
Connection ~ 4850 5400
Wire Wire Line
	4950 5700 4950 5300
Connection ~ 4950 5300
Wire Wire Line
	5050 5700 5050 5200
Connection ~ 5050 5200
Wire Wire Line
	5150 5700 5150 5100
Connection ~ 5150 5100
Wire Wire Line
	5250 5700 5250 5000
Wire Wire Line
	5350 5700 5350 4900
Wire Wire Line
	5450 5700 5450 4800
Wire Wire Line
	6950 3900 7050 3900
Wire Wire Line
	2550 7100 3650 7100
Wire Wire Line
	3650 7100 3650 3450
Wire Wire Line
	2550 7200 3550 7200
Wire Wire Line
	3550 7200 3550 3350
Wire Wire Line
	2650 5200 2550 5200
Wire Wire Line
	2750 5300 2550 5300
Wire Wire Line
	2750 2550 2750 5300
Wire Wire Line
	2850 5400 2550 5400
Wire Wire Line
	2850 2650 2850 5400
Wire Wire Line
	2950 5500 2550 5500
Wire Wire Line
	2950 2750 2950 5500
Wire Wire Line
	3050 5600 2550 5600
Wire Wire Line
	3050 2850 3050 5600
Wire Wire Line
	3150 5700 2550 5700
Wire Wire Line
	3150 2950 3150 5700
Wire Wire Line
	3250 5800 2550 5800
Wire Wire Line
	3250 3050 3250 5800
Wire Wire Line
	2550 5900 3350 5900
Wire Wire Line
	3350 5900 3350 3150
Wire Wire Line
	5950 5700 5950 7000
Wire Wire Line
	4050 4800 4050 4900
Wire Wire Line
	3750 7000 3750 7100
Wire Wire Line
	3750 7100 4000 7100
Connection ~ 4600 8850
Connection ~ 1350 9250
Wire Wire Line
	1350 9250 1350 10500
Wire Wire Line
	5100 9500 5100 8850
Connection ~ 5100 8850
Connection ~ 2350 8850
Connection ~ 2100 8850
Connection ~ 1850 8850
Connection ~ 1600 9250
Connection ~ 1850 9250
Connection ~ 2350 9250
Wire Wire Line
	750  6500 1150 6500
Wire Wire Line
	2550 6500 3450 6500
Wire Wire Line
	3450 6500 3450 3250
Wire Wire Line
	5800 9200 6250 9200
Wire Wire Line
	5800 9300 6250 9300
Wire Wire Line
	5800 9400 6250 9400
Wire Wire Line
	5800 9500 6250 9500
Wire Wire Line
	5800 9600 6250 9600
Wire Wire Line
	5800 9700 6250 9700
Wire Wire Line
	5800 9800 6250 9800
Wire Wire Line
	5800 9900 6250 9900
Wire Wire Line
	5800 10000 6250 10000
Wire Wire Line
	5800 10100 6250 10100
Text Label 850  7400 0    60   ~ 0
GND
$Comp
L power:GND #PWR04
U 1 1 60465D86
P 4050 5700
F 0 "#PWR04" H 4050 5700 30  0001 C CNN
F 1 "GND" H 4050 5630 30  0001 C CNN
F 2 "" H 4050 5700 60  0001 C CNN
F 3 "" H 4050 5700 60  0001 C CNN
	1    4050 5700
	1    0    0    -1  
$EndComp
Text Label 2600 7000 0    60   ~ 0
bM1#
Text Label 2600 6900 0    60   ~ 0
bIORQ#
Text Label 2600 7100 0    60   ~ 0
bWR#
Text Label 2600 7200 0    60   ~ 0
bRD#
Text Notes 4700 3700 0    60   ~ 0
IO SELECTION CIRCUIT
Text Notes 3950 5950 0    60   ~ 0
SET IO PORT
$Comp
L 74xx:74HCT02 U4
U 2 1 604FA8C3
P 4300 7100
F 0 "U4" H 4300 7150 50  0000 C CNN
F 1 "74LS02" H 4300 7050 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 4300 7100 50  0001 C CNN
F 3 "" H 4300 7100 50  0001 C CNN
	2    4300 7100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT02 U4
U 5 1 604FAD32
P 4650 10000
F 0 "U4" H 4650 10050 50  0000 C CNN
F 1 "74LS02" H 4650 9950 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 4650 10000 50  0001 C CNN
F 3 "" H 4650 10000 50  0001 C CNN
	5    4650 10000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 7000 4000 7100
Connection ~ 4000 7100
Wire Wire Line
	7050 6350 7050 3900
Wire Wire Line
	1150 7400 1150 7500
NoConn ~ 8950 9700
Wire Wire Line
	2600 9250 2850 9250
Wire Wire Line
	4350 8850 4600 8850
Wire Wire Line
	4350 9250 4600 9250
Wire Wire Line
	2100 9250 2350 9250
Wire Wire Line
	2600 8850 2850 8850
Wire Wire Line
	4050 4900 4050 5000
Wire Wire Line
	4050 5000 4050 5100
Wire Wire Line
	4050 5100 4050 5200
Wire Wire Line
	4050 5200 4050 5300
Wire Wire Line
	4050 5300 4050 5400
Wire Wire Line
	4050 5400 4050 5500
Wire Wire Line
	4050 5500 4050 5700
Wire Wire Line
	4750 5500 5950 5500
Wire Wire Line
	4850 5400 5950 5400
Wire Wire Line
	4950 5300 5950 5300
Wire Wire Line
	5050 5200 5950 5200
Wire Wire Line
	5150 5100 5950 5100
Wire Wire Line
	5250 5000 5950 5000
Wire Wire Line
	5350 4900 5950 4900
Wire Wire Line
	5450 4800 5950 4800
Wire Wire Line
	5100 8850 5400 8850
Wire Wire Line
	2350 8850 2600 8850
Wire Wire Line
	2100 8850 2350 8850
Wire Wire Line
	1850 8850 2100 8850
Wire Wire Line
	1600 9250 1850 9250
Wire Wire Line
	1850 9250 2100 9250
Wire Wire Line
	2350 9250 2600 9250
Wire Wire Line
	4000 7100 4000 7200
Connection ~ 1150 7400
$Comp
L Z80SERIAL2-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue U3
U 1 1 603971B6
P 1850 7000
F 0 "U3" H 1900 6800 60  0000 C CNN
F 1 "74LS244" H 1950 6600 60  0000 C CNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 1850 7000 60  0001 C CNN
F 3 "" H 1850 7000 60  0001 C CNN
	1    1850 7000
	1    0    0    -1  
$EndComp
NoConn ~ 1150 6700
Text Label 800  6350 0    60   ~ 0
CS_SERIAL#
Wire Wire Line
	3650 3450 8350 3450
Wire Wire Line
	3550 3350 8350 3350
Wire Wire Line
	3450 3250 8350 3250
Text Label 7850 3450 0    60   ~ 0
bWR#
Text Label 7850 3350 0    60   ~ 0
bRD#
Text Label 7850 3250 0    60   ~ 0
bRESET#
Text Label 7850 3150 0    60   ~ 0
bD7
Text Label 7850 2950 0    60   ~ 0
bD5
Text Label 7850 2850 0    60   ~ 0
bD4
Text Label 7850 2750 0    60   ~ 0
bD3
Text Label 7850 2650 0    60   ~ 0
bD2
Wire Wire Line
	3250 3050 8350 3050
Wire Wire Line
	2750 2550 8350 2550
Wire Wire Line
	2650 2450 8350 2450
Wire Wire Line
	3350 3150 8350 3150
Wire Wire Line
	3150 2950 8350 2950
Wire Wire Line
	3050 2850 8350 2850
Wire Wire Line
	2950 2750 8350 2750
Wire Wire Line
	2850 2650 8350 2650
Text Label 7850 3050 0    60   ~ 0
bD6
Text Label 7850 2550 0    60   ~ 0
bD1
Text Label 7850 2450 0    60   ~ 0
bD0
$Comp
L 74xx:74HCT02 U4
U 3 1 604FA9E8
P 10650 4400
F 0 "U4" H 10650 4450 50  0000 C CNN
F 1 "74LS02" H 10650 4350 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 10650 4400 50  0001 C CNN
F 3 "" H 10650 4400 50  0001 C CNN
	3    10650 4400
	1    0    0    -1  
$EndComp
Text Label 850  6100 0    60   ~ 0
RD#
NoConn ~ 8950 8400
NoConn ~ 8950 9600
Text Label 850  4200 0    60   ~ 0
A3
Text Label 850  4400 0    60   ~ 0
A5
Text Label 850  4500 0    60   ~ 0
A6
Text Label 850  4600 0    60   ~ 0
A7
Text Label 850  4300 0    60   ~ 0
A4
Text Label 850  3900 0    60   ~ 0
A0
Text Label 850  4100 0    60   ~ 0
A2
Text Label 850  4000 0    60   ~ 0
A1
Wire Wire Line
	750  4200 1150 4200
Wire Wire Line
	750  4300 1150 4300
Wire Wire Line
	750  4400 1150 4400
Wire Wire Line
	750  4500 1150 4500
Wire Wire Line
	750  4600 1150 4600
Wire Wire Line
	750  3900 1150 3900
Wire Wire Line
	750  4000 1150 4000
Wire Wire Line
	750  4100 1150 4100
Wire Wire Line
	2650 2450 2650 5200
Wire Wire Line
	2550 4600 5950 4600
Wire Wire Line
	2550 4500 5950 4500
Wire Wire Line
	2550 4400 5950 4400
Wire Wire Line
	2550 4300 5950 4300
Wire Wire Line
	2550 4200 5950 4200
Text Label 3750 4100 0    60   ~ 0
bA2
Text Label 3750 4300 0    60   ~ 0
bA4
Text Label 3750 4600 0    60   ~ 0
bA7
Text Label 3750 4500 0    60   ~ 0
bA6
Text Label 3750 4400 0    60   ~ 0
bA5
Text Label 3750 4200 0    60   ~ 0
bA3
$Comp
L Z80SERIAL2-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue U1
U 1 1 60BC80C2
P 1850 4400
F 0 "U1" H 1950 4975 60  0000 L BNN
F 1 "74LS244" H 1750 3950 60  0000 L TNN
F 2 "Housings_DIP:DIP-20_W7.62mm" H 1850 4400 60  0001 C CNN
F 3 "" H 1850 4400 60  0001 C CNN
	1    1850 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	550  7400 550  4800
Wire Wire Line
	550  4800 1150 4800
Wire Wire Line
	550  7400 1150 7400
Wire Wire Line
	1150 4900 1150 4800
Connection ~ 1150 4800
Wire Wire Line
	2850 8850 3100 8850
Wire Wire Line
	2850 9250 3100 9250
Wire Wire Line
	4600 8850 5100 8850
Text Label 2600 6500 0    60   ~ 0
bRESET#
Connection ~ 7050 3900
Wire Wire Line
	7050 3900 8350 3900
Text Label 7150 3900 0    60   ~ 0
CS_SERIAL#
$Comp
L Z80SERIAL2-rescue:C-device-Z80SERIAL-rescue C6
U 1 1 637B9E50
P 2850 9050
F 0 "C6" H 2900 9150 50  0000 L CNN
F 1 "0.1u" H 2900 8950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2850 9050 60  0001 C CNN
F 3 "" H 2850 9050 60  0001 C CNN
	1    2850 9050
	1    0    0    -1  
$EndComp
$Comp
L Z80SERIAL2-rescue:C-device-Z80SERIAL-rescue C7
U 1 1 637B9E5A
P 3100 9050
F 0 "C7" H 3150 9150 50  0000 L CNN
F 1 "0.1u" H 3150 8950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3100 9050 60  0001 C CNN
F 3 "" H 3100 9050 60  0001 C CNN
	1    3100 9050
	1    0    0    -1  
$EndComp
Connection ~ 3100 8850
Wire Wire Line
	3100 8850 3350 8850
Connection ~ 3100 9250
Wire Wire Line
	3100 9250 3350 9250
$Comp
L Z80SERIAL2-rescue:C-device-Z80SERIAL-rescue C8
U 1 1 60B4CA7D
P 3350 9050
F 0 "C8" H 3400 9150 50  0000 L CNN
F 1 "0.1u" H 3400 8950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3350 9050 60  0001 C CNN
F 3 "" H 3350 9050 60  0001 C CNN
	1    3350 9050
	1    0    0    -1  
$EndComp
Connection ~ 3350 8850
Wire Wire Line
	3350 8850 3600 8850
Connection ~ 3350 9250
Wire Wire Line
	650  6350 650  6600
Wire Wire Line
	650  6600 1150 6600
Wire Wire Line
	2550 6600 3450 6600
$Comp
L device:LED D1
U 1 1 6068F1F7
P 3200 8100
F 0 "D1" H 3200 8200 50  0000 C CNN
F 1 "LED" H 3200 8000 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm_Horizontal_O3.81mm_Z3.0mm" H 3200 8100 60  0001 C CNN
F 3 "" H 3200 8100 60  0001 C CNN
	1    3200 8100
	0    -1   -1   0   
$EndComp
$Comp
L Z80SERIAL2-rescue:R-device-Z80SERIAL-rescue R1
U 1 1 6068F201
P 3200 7650
F 0 "R1" V 3280 7650 50  0000 C CNN
F 1 "470" V 3200 7650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3200 7650 60  0001 C CNN
F 3 "" H 3200 7650 60  0001 C CNN
	1    3200 7650
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR03
U 1 1 6071F0FB
P 3200 7400
F 0 "#PWR03" H 3200 7500 30  0001 C CNN
F 1 "VCC" H 3200 7500 30  0000 C CNN
F 2 "" H 3200 7400 60  0001 C CNN
F 3 "" H 3200 7400 60  0001 C CNN
	1    3200 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 8300 3200 8300
Wire Wire Line
	3450 6600 3450 8300
Text Notes 3450 8150 1    60   ~ 0
IO CHIP SELECT
NoConn ~ 4650 4800
NoConn ~ 4650 4900
Wire Wire Line
	5950 4000 5950 3900
Connection ~ 5950 3900
$Comp
L power:VCC #PWR05
U 1 1 6069FAD2
P 5450 3900
F 0 "#PWR05" H 5450 4000 30  0001 C CNN
F 1 "VCC" H 5450 4000 30  0000 C CNN
F 2 "" H 5450 3900 60  0001 C CNN
F 3 "" H 5450 3900 60  0001 C CNN
	1    5450 3900
	1    0    0    -1  
$EndComp
$Comp
L Z80SERIAL2-rescue:R-device-Z80SERIAL-rescue R3
U 1 1 6069FAC8
P 5700 3900
F 0 "R3" V 5780 3900 50  0000 C CNN
F 1 "4700" V 5700 3900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5700 3900 60  0001 C CNN
F 3 "" H 5700 3900 60  0001 C CNN
	1    5700 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 3900 3950 3900
Wire Wire Line
	2550 4000 3950 4000
Text Label 3750 3900 0    60   ~ 0
bA0
Text Label 3750 4000 0    60   ~ 0
bA1
Wire Wire Line
	3600 8850 4350 8850
Wire Wire Line
	3350 9250 3600 9250
Wire Wire Line
	650  6200 650  6350
Connection ~ 650  6350
Wire Wire Line
	650  6200 1150 6200
Wire Wire Line
	650  6350 7050 6350
Wire Wire Line
	4650 9500 5100 9500
Connection ~ 4650 10500
Wire Wire Line
	4650 10500 5100 10500
Wire Wire Line
	1350 10500 4650 10500
$Comp
L 00JRCsch:16C550 U8
U 1 1 60704E03
P 11450 2550
F 0 "U8" H 11450 4211 70  0000 C CNN
F 1 "16C550" H 11450 4090 70  0000 C CNN
F 2 "Housings_DIP:DIP-40_W15.24mm" H 11450 2550 60  0001 C CNN
F 3 "" H 11450 2550 60  0000 C CNN
	1    11450 2550
	1    0    0    -1  
$EndComp
$Comp
L special:MAX232 U9
U 1 1 60706F3A
P 14200 5850
F 0 "U9" H 14200 6860 70  0000 C CNN
F 1 "MAX232" H 14200 6739 70  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 14200 5850 60  0001 C CNN
F 3 "" H 14200 5850 60  0001 C CNN
	1    14200 5850
	1    0    0    -1  
$EndComp
$Comp
L conn:CONN_5X2 P5
U 1 1 607084CF
P 15100 1500
F 0 "P5" H 15100 1943 60  0000 C CNN
F 1 "RS-232" H 15100 1845 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Horizontal" H 15100 1500 60  0001 C CNN
F 3 "" H 15100 1500 60  0001 C CNN
	1    15100 1500
	1    0    0    -1  
$EndComp
$Comp
L conn:DIL14 U10
U 1 1 60711841
P 10100 7450
F 0 "U10" H 10100 7972 60  0000 C CNN
F 1 "UART CLK" V 10100 7450 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 10100 7450 60  0001 C CNN
F 3 "" H 10100 7450 60  0001 C CNN
	1    10100 7450
	1    0    0    -1  
$EndComp
$Comp
L 00JRCsch:74LS06 U7
U 4 1 60712DF2
P 10200 6350
F 0 "U7" H 10150 6400 60  0000 C CNN
F 1 "74LS06" H 10150 6300 60  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 10200 6350 60  0001 C CNN
F 3 "" H 10200 6350 60  0000 C CNN
	4    10200 6350
	1    0    0    -1  
$EndComp
$Comp
L 00JRCsch:74LS06 U7
U 1 1 60714183
P 9750 8900
F 0 "U7" H 9700 8950 60  0000 C CNN
F 1 "74LS06" H 9700 8850 60  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 9750 8900 60  0001 C CNN
F 3 "" H 9750 8900 60  0000 C CNN
	1    9750 8900
	1    0    0    -1  
$EndComp
$Comp
L 00JRCsch:74LS06 U7
U 2 1 60717376
P 9750 9250
F 0 "U7" H 9700 9300 60  0000 C CNN
F 1 "74LS06" H 9700 9200 60  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 9750 9250 60  0001 C CNN
F 3 "" H 9750 9250 60  0000 C CNN
	2    9750 9250
	1    0    0    -1  
$EndComp
$Comp
L 00JRCsch:74LS06 U7
U 3 1 60717380
P 10200 5100
F 0 "U7" H 10150 5150 60  0000 C CNN
F 1 "74LS06" H 10150 5050 60  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 10200 5100 60  0001 C CNN
F 3 "" H 10200 5100 60  0000 C CNN
	3    10200 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4100 3950 4100
Wire Wire Line
	5950 4100 5950 4000
Connection ~ 5950 4000
Text Label 10100 2100 0    60   ~ 0
bA0
Text Label 10100 2300 0    60   ~ 0
bA2
Text Label 10100 2200 0    60   ~ 0
bA1
Wire Wire Line
	10000 2100 10400 2100
Wire Wire Line
	10000 2200 10400 2200
Wire Wire Line
	10000 2300 10400 2300
Text Label 10100 1300 0    60   ~ 0
bD1
Text Label 10100 1400 0    60   ~ 0
bD2
Text Label 10100 1500 0    60   ~ 0
bD3
Text Label 10100 1200 0    60   ~ 0
bD0
Text Label 10100 1700 0    60   ~ 0
bD5
Text Label 10100 1800 0    60   ~ 0
bD6
Text Label 10100 1900 0    60   ~ 0
bD7
Text Label 10100 1600 0    60   ~ 0
bD4
Wire Wire Line
	10000 1200 10400 1200
Wire Wire Line
	10000 1300 10400 1300
Wire Wire Line
	10000 1400 10400 1400
Wire Wire Line
	10000 1500 10400 1500
Wire Wire Line
	10000 1600 10400 1600
Wire Wire Line
	10000 1700 10400 1700
Wire Wire Line
	10000 1800 10400 1800
Wire Wire Line
	10000 1900 10400 1900
Text Label 9800 2650 0    60   ~ 0
CS_SERIAL#
Wire Wire Line
	9750 2650 10400 2650
Wire Wire Line
	10400 2550 10400 2450
Wire Wire Line
	10400 2450 10000 2450
Connection ~ 10400 2450
Text Label 10050 2450 0    60   ~ 0
VCC
Wire Wire Line
	9750 7450 9650 7450
Wire Wire Line
	9650 7450 9650 7750
Wire Wire Line
	9650 7750 9750 7750
$Comp
L 00JRCsch:GND #PWR09
U 1 1 60837A08
P 9650 7850
F 0 "#PWR09" H 9650 7850 30  0001 C CNN
F 1 "GND" H 9650 7780 30  0001 C CNN
F 2 "" H 9650 7850 60  0000 C CNN
F 3 "" H 9650 7850 60  0000 C CNN
	1    9650 7850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 7850 9650 7750
Connection ~ 9650 7750
$Comp
L 00JRCsch:VCC #PWR012
U 1 1 6084C095
P 10450 7150
F 0 "#PWR012" H 10450 7250 30  0001 C CNN
F 1 "VCC" H 10453 7278 30  0000 C CNN
F 2 "" H 10450 7150 60  0000 C CNN
F 3 "" H 10450 7150 60  0000 C CNN
	1    10450 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 2950 9450 2950
NoConn ~ 10400 3100
Text Label 9900 4300 0    60   ~ 0
bRESET#
Wire Wire Line
	9850 4300 10350 4300
Text Label 11000 4400 0    60   ~ 0
bRESET
Wire Wire Line
	10950 4400 11400 4400
Wire Wire Line
	10350 4500 10350 4300
Connection ~ 10350 4300
Wire Wire Line
	10400 3900 10400 4150
Wire Wire Line
	10400 4150 11400 4150
Wire Wire Line
	11400 4150 11400 4400
Text Label 10100 3300 0    60   ~ 0
bWR#
Text Label 10100 3500 0    60   ~ 0
bRD#
Wire Wire Line
	10000 3300 10400 3300
Wire Wire Line
	10000 3400 10400 3400
Wire Wire Line
	10000 3500 10400 3500
Wire Wire Line
	10000 3600 10400 3600
Text Label 10100 3700 0    60   ~ 0
GND
Wire Wire Line
	10000 3700 10400 3700
Text Label 10100 3800 0    60   ~ 0
INT
Wire Wire Line
	9750 3800 10400 3800
Text Label 10700 5000 0    60   ~ 0
INT#
Wire Wire Line
	10650 5000 10950 5000
$Comp
L 00JRCsch:VCC #PWR010
U 1 1 60A8F523
P 9750 7150
F 0 "#PWR010" H 9750 7250 30  0001 C CNN
F 1 "VCC" H 9753 7278 30  0000 C CNN
F 2 "" H 9750 7150 60  0000 C CNN
F 3 "" H 9750 7150 60  0000 C CNN
	1    9750 7150
	1    0    0    -1  
$EndComp
Text Label 10500 7450 0    60   ~ 0
CLK_UART
Wire Wire Line
	9450 8000 10450 8000
Wire Wire Line
	10450 8000 10450 7750
Wire Wire Line
	9450 2950 9450 8000
Connection ~ 10450 7750
Wire Wire Line
	10900 7450 10900 7750
Wire Wire Line
	10450 7750 10900 7750
Wire Wire Line
	10450 7450 10900 7450
NoConn ~ 9750 7250
NoConn ~ 9750 7350
NoConn ~ 9750 7550
NoConn ~ 9750 7650
NoConn ~ 10450 7650
NoConn ~ 10450 7550
NoConn ~ 10450 7350
NoConn ~ 10450 7250
Wire Wire Line
	9750 3800 9750 5100
Wire Wire Line
	12500 3900 12500 3700
Wire Wire Line
	13150 650  12800 650 
Text Label 12850 650  0    60   ~ 0
VCC
Text Label 12850 1050 0    60   ~ 0
GND
Wire Wire Line
	12800 1050 13150 1050
Text Label 12550 1600 0    60   ~ 0
TTL_CTS#
Wire Wire Line
	12500 1600 12900 1600
Text Label 12550 2100 0    60   ~ 0
TTL_RTS#
Wire Wire Line
	12500 2100 12900 2100
Text Label 12550 2450 0    60   ~ 0
TTL_RX
Wire Wire Line
	12500 2450 12900 2450
Text Label 12550 2550 0    60   ~ 0
TTL_TX
Wire Wire Line
	12500 2550 12900 2550
NoConn ~ 12500 3300
Text Label 12900 6250 0    60   ~ 0
TTL_RTS#
Wire Wire Line
	12850 6250 13400 6250
Text Label 12900 6350 0    60   ~ 0
TTL_TX
Text Label 12900 6450 0    60   ~ 0
TTL_CTS#
Wire Wire Line
	12850 6450 13400 6450
Text Label 12900 6550 0    60   ~ 0
TTL_RX
Text Label 15050 6250 0    60   ~ 0
RTS#
Wire Wire Line
	15000 6250 15550 6250
Text Label 15050 6350 0    60   ~ 0
TX
Wire Wire Line
	15000 6350 15550 6350
Text Label 15050 6450 0    60   ~ 0
CTS#
Wire Wire Line
	15000 6450 15550 6450
Text Label 15050 6550 0    60   ~ 0
RX
Wire Wire Line
	15000 6550 15550 6550
Wire Wire Line
	15550 5150 15000 5150
Text Label 15050 5150 0    60   ~ 0
VCC
Text Label 15050 5750 0    60   ~ 0
GND
$Comp
L Z80SERIAL2-rescue:CP-device-Z80SERIAL-rescue C12
U 1 1 60EEAC88
P 13250 5350
F 0 "C12" H 13379 5396 50  0000 L CNN
F 1 "1u" H 13379 5305 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 13250 5350 60  0001 C CNN
F 3 "" H 13250 5350 60  0001 C CNN
	1    13250 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	13250 5150 13400 5150
Wire Wire Line
	13250 5550 13400 5550
$Comp
L Z80SERIAL2-rescue:CP-device-Z80SERIAL-rescue C13
U 1 1 60F3C51C
P 13250 5850
F 0 "C13" H 13379 5896 50  0000 L CNN
F 1 "1u" H 13379 5805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 13250 5850 60  0001 C CNN
F 3 "" H 13250 5850 60  0001 C CNN
	1    13250 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13250 5650 13400 5650
Wire Wire Line
	13250 6050 13400 6050
$Comp
L Z80SERIAL2-rescue:CP-device-Z80SERIAL-rescue C14
U 1 1 60F56682
P 15550 5350
F 0 "C14" H 15421 5304 50  0000 R CNN
F 1 "1u" H 15421 5395 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 15550 5350 60  0001 C CNN
F 3 "" H 15550 5350 60  0001 C CNN
	1    15550 5350
	-1   0    0    1   
$EndComp
Wire Wire Line
	15000 5550 15550 5550
$Comp
L Z80SERIAL2-rescue:CP-device-Z80SERIAL-rescue C15
U 1 1 60F8A6E0
P 15800 6250
F 0 "C15" H 15671 6204 50  0000 R CNN
F 1 "1u" H 15671 6295 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 15800 6250 60  0001 C CNN
F 3 "" H 15800 6250 60  0001 C CNN
	1    15800 6250
	-1   0    0    1   
$EndComp
Wire Wire Line
	15000 6050 15800 6050
Wire Wire Line
	16100 5150 15550 5150
Connection ~ 15550 5150
Wire Wire Line
	16100 5750 16100 5550
Wire Wire Line
	15000 5750 16100 5750
$Comp
L Z80SERIAL2-rescue:CP-device-Z80SERIAL-rescue C16
U 1 1 6102F167
P 16100 5350
F 0 "C16" H 16229 5396 50  0000 L CNN
F 1 "10u" H 16229 5305 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 16100 5350 60  0001 C CNN
F 3 "" H 16100 5350 60  0001 C CNN
	1    16100 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	16100 6450 16100 5750
Connection ~ 16100 5750
Wire Wire Line
	15800 6450 16100 6450
$Comp
L conn:CONN_6 J4
U 1 1 610FD61B
P 14050 3950
F 0 "J4" V 14300 3950 60  0000 C CNN
F 1 "TTL SERIAL" V 14200 3950 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Horizontal" H 14050 3950 60  0001 C CNN
F 3 "" H 14050 3950 60  0001 C CNN
	1    14050 3950
	-1   0    0    -1  
$EndComp
Text Label 15550 1400 0    60   ~ 0
RTS#
Wire Wire Line
	15500 1400 15850 1400
Text Label 14400 1500 0    60   ~ 0
TX
Wire Wire Line
	14350 1500 14700 1500
Text Label 15550 1500 0    60   ~ 0
CTS#
Wire Wire Line
	15500 1500 15850 1500
Text Label 14400 1400 0    60   ~ 0
RX
Wire Wire Line
	14350 1400 14700 1400
NoConn ~ 14700 1300
NoConn ~ 15500 1300
NoConn ~ 15500 1600
NoConn ~ 15500 1700
Text Label 14400 1600 0    60   ~ 0
DTR#
$Comp
L Z80SERIAL2-rescue:R-device-Z80SERIAL-rescue R5
U 1 1 6121722B
P 14200 1350
F 0 "R5" V 14280 1350 50  0000 C CNN
F 1 "470" V 14200 1350 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 14200 1350 60  0001 C CNN
F 3 "" H 14200 1350 60  0001 C CNN
	1    14200 1350
	-1   0    0    1   
$EndComp
Text Label 14450 3800 0    60   ~ 0
TTL_RTS#
Wire Wire Line
	14950 3800 14400 3800
Text Label 14450 4100 0    60   ~ 0
TTL_TX
Wire Wire Line
	14950 4100 14400 4100
Text Label 14450 4000 0    60   ~ 0
TTL_RX
Wire Wire Line
	14950 4000 14400 4000
Text Label 15600 3700 2    60   ~ 0
VCC
Text Label 14450 3700 0    60   ~ 0
GND
Wire Wire Line
	14950 3700 14400 3700
Wire Wire Line
	15700 3700 15150 3700
Text Label 14400 1700 0    60   ~ 0
GND
Wire Wire Line
	14350 1700 14700 1700
Wire Wire Line
	14200 1600 14700 1600
Text Notes 14050 4500 0    60   ~ 0
FTDI 5V SERIAL UART TO\nUSB CABLE INTERFACE
Text Notes 9850 4900 0    60   ~ 0
NOTE: INT# AND NMI# RELY ON 4700 \nOHM PULL UP RESISTOR ON PROCESSOR
NoConn ~ 1150 6800
NoConn ~ 2550 6800
NoConn ~ 4650 5000
Text Label 10100 3400 0    60   ~ 0
GND
Text Label 10100 3600 0    60   ~ 0
GND
Text Notes 9500 6850 0    60   ~ 0
1.8432 MHz or 7.3728 MHz\nCrystal Oscillator
Text Notes 13550 4200 1    60   ~ 0
PIN HEADER
$Comp
L 00JRCsch:VCC #PWR013
U 1 1 606C1108
P 14200 1100
F 0 "#PWR013" H 14200 1200 30  0001 C CNN
F 1 "VCC" H 14203 1228 30  0000 C CNN
F 2 "" H 14200 1100 60  0000 C CNN
F 3 "" H 14200 1100 60  0000 C CNN
	1    14200 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 9400 5400 9350
Wire Wire Line
	5400 9700 5400 10500
Wire Wire Line
	3200 7950 3200 7900
Wire Wire Line
	3200 8300 3200 8250
Text Label 5950 6900 1    60   ~ 0
688SEL#
$Comp
L 74xx:74LS32 U5
U 1 1 60CE86CB
P 4900 7000
F 0 "U5" H 4900 7050 50  0000 C CNN
F 1 "74LS32" H 4900 6950 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 4900 7000 50  0001 C CNN
F 3 "" H 4900 7000 50  0001 C CNN
	1    4900 7000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 3 1 60CEDDF6
P 12400 5950
F 0 "U5" H 12400 6000 50  0000 C CNN
F 1 "74LS32" H 12400 5900 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 12400 5950 50  0001 C CNN
F 3 "" H 12400 5950 50  0001 C CNN
	3    12400 5950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 4 1 60CF14BD
P 12400 7550
F 0 "U5" H 12400 7600 50  0000 C CNN
F 1 "74LS32" H 12400 7500 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 12400 7550 50  0001 C CNN
F 3 "" H 12400 7550 50  0001 C CNN
	4    12400 7550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 5 1 60CF4F38
P 5100 10000
F 0 "U5" H 5000 10050 50  0000 L CNN
F 1 "74LS32" H 4950 9950 50  0000 L CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 5100 10000 50  0001 C CNN
F 3 "" H 5100 10000 50  0001 C CNN
	5    5100 10000
	1    0    0    -1  
$EndComp
Connection ~ 5100 9500
Connection ~ 5100 10500
Wire Wire Line
	5100 10500 5400 10500
Wire Wire Line
	5200 7000 5950 7000
$Comp
L Z80SERIAL2-rescue:C-device-Z80SERIAL-rescue C9
U 1 1 610E21C8
P 3600 9050
F 0 "C9" H 3650 9150 50  0000 L CNN
F 1 "0.1u" H 3650 8950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3600 9050 60  0001 C CNN
F 3 "" H 3600 9050 60  0001 C CNN
	1    3600 9050
	1    0    0    -1  
$EndComp
Connection ~ 3600 9250
Wire Wire Line
	3600 9250 4350 9250
Text Label 12550 1500 0    60   ~ 0
TTL_DSR#
Wire Wire Line
	12500 1500 12900 1500
Wire Wire Line
	15700 4100 15150 4100
Text Label 15200 4100 0    60   ~ 0
TTL_CTS#
$Comp
L 00JRCsch:CONN_3 J8
U 1 1 609C8F16
P 16050 4200
F 0 "J8" H 16178 4228 50  0000 L CNN
F 1 "CTS/DSR" H 16178 4144 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 16050 4200 60  0001 C CNN
F 3 "" H 16050 4200 60  0000 C CNN
	1    16050 4200
	1    0    0    -1  
$EndComp
Text Label 15200 4300 0    60   ~ 0
TTL_DSR#
Wire Wire Line
	15150 4300 15700 4300
Wire Wire Line
	14400 4200 15700 4200
Wire Wire Line
	14400 3900 15700 3900
Text Notes 14000 3500 0    60   ~ 0
DTECH FTDI USB to TTL Serial 5V Adapter Cable \n6 Pin 0.1 inch Pitch Female Socket Header \nUART IC FT232RL Chip
Text Notes 14000 850  0    60   ~ 0
StarTech.com 16in 9 Pin Serial Male to \n10 Pin Motherboard Header Panel Mount \nCable - motherboard to RS232 (PNL9M16),Gray
Text Notes 13800 7150 0    60   ~ 0
NOTE: INSTALL ONLY ONE\n9 PIN SERIAL OR\nTTL SERIAL USB CABLE
Wire Wire Line
	9750 5100 9750 6350
Connection ~ 9750 5100
$Comp
L device:LED D3
U 1 1 608C9DBC
P 10650 6200
F 0 "D3" H 10650 6300 50  0000 C CNN
F 1 "LED" H 10650 6100 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm_Horizontal_O3.81mm_Z3.0mm" H 10650 6200 60  0001 C CNN
F 3 "" H 10650 6200 60  0001 C CNN
	1    10650 6200
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR011
U 1 1 60951D31
P 10650 5550
F 0 "#PWR011" H 10650 5650 30  0001 C CNN
F 1 "VCC" H 10650 5650 30  0000 C CNN
F 2 "" H 10650 5550 60  0001 C CNN
F 3 "" H 10650 5550 60  0001 C CNN
	1    10650 5550
	1    0    0    -1  
$EndComp
$Comp
L 00JRCsch:CONN_3 J1
U 1 1 60956F11
P 11300 5100
F 0 "J1" H 11428 5128 50  0000 L CNN
F 1 "INT# OR NMI#" H 11428 5044 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 11300 5100 60  0001 C CNN
F 3 "" H 11300 5100 60  0000 C CNN
	1    11300 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 5100 10950 5100
Text Label 10700 5200 0    60   ~ 0
NMI#
Wire Wire Line
	10650 5200 10950 5200
$Comp
L 00JRCsch:CONN_3 J2
U 1 1 60AECE8F
P 13500 750
F 0 "J2" H 13628 778 50  0000 L CNN
F 1 "VCC OR RI#" H 13628 694 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 13500 750 60  0001 C CNN
F 3 "" H 13500 750 60  0000 C CNN
	1    13500 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	13150 750  12600 750 
Wire Wire Line
	12600 750  12600 1300
Wire Wire Line
	12600 1300 12500 1300
Wire Wire Line
	13150 850  12800 850 
Text Label 12850 850  0    60   ~ 0
RI#
$Comp
L 00JRCsch:CONN_3 J3
U 1 1 60C3B9C4
P 13500 1150
F 0 "J3" H 13628 1178 50  0000 L CNN
F 1 "GND OR DCD#" H 13628 1094 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 13500 1150 60  0001 C CNN
F 3 "" H 13500 1150 60  0000 C CNN
	1    13500 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	12500 1400 12700 1400
Wire Wire Line
	12700 1400 12700 1150
Wire Wire Line
	12700 1150 13150 1150
Wire Wire Line
	13150 1250 12800 1250
Text Label 12850 1250 0    60   ~ 0
DCD#
Text Label 12550 1900 0    60   ~ 0
TTL_OUT1
Wire Wire Line
	12500 1900 12900 1900
Text Label 12550 2000 0    60   ~ 0
TTL_DTR#
Wire Wire Line
	12500 2000 12900 2000
Text Label 12550 2200 0    60   ~ 0
TTL_OUT2
Wire Wire Line
	12500 2200 12900 2200
Text Label 15400 8600 0    60   ~ 0
TTL_OUT1
Text Label 15400 8700 0    60   ~ 0
TTL_DTR#
Wire Wire Line
	15350 8600 15850 8600
Wire Wire Line
	15350 8700 15850 8700
$Comp
L conn:CONN_8 J9
U 1 1 6104C0A8
P 15000 8450
F 0 "J9" V 15250 8450 60  0000 C CNN
F 1 "EXPERIMENT" V 15150 8400 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 15000 8450 60  0001 C CNN
F 3 "" H 15000 8450 60  0001 C CNN
	1    15000 8450
	-1   0    0    -1  
$EndComp
Text Notes 14550 7750 0    60   ~ 0
DO NOT POPULATE: EXPERIMENT HEADER
$Comp
L Z80SERIAL2-rescue:R-device-Z80SERIAL-rescue R4
U 1 1 61CF21B7
P 10650 5800
F 0 "R4" V 10730 5800 50  0000 C CNN
F 1 "470" V 10650 5800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 10650 5800 60  0001 C CNN
F 3 "" H 10650 5800 60  0001 C CNN
	1    10650 5800
	-1   0    0    1   
$EndComp
Text Label 15400 8300 0    60   ~ 0
DCD#
Text Label 15400 8800 0    60   ~ 0
VCC
Wire Wire Line
	15850 8800 15350 8800
Text Label 15400 8400 0    60   ~ 0
TTL_OUT2
Wire Wire Line
	15350 8400 15850 8400
Wire Wire Line
	15350 8100 15850 8100
Text Label 15400 8100 0    60   ~ 0
GND
Wire Wire Line
	15350 8500 15850 8500
Wire Wire Line
	15350 8300 15850 8300
Text Label 15400 8200 0    60   ~ 0
RI#
Wire Wire Line
	15350 8200 15850 8200
Wire Notes Line
	14550 7750 14550 9050
Wire Notes Line
	16250 9050 16250 7750
Wire Notes Line
	14550 9050 16250 9050
Wire Notes Line
	14550 7750 16250 7750
NoConn ~ 15850 8500
Wire Wire Line
	12100 6550 13400 6550
$Comp
L device:LED D5
U 1 1 60DD53C5
P 12850 7400
F 0 "D5" H 12850 7500 50  0000 C CNN
F 1 "LED" H 12850 7300 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm_Horizontal_O3.81mm_Z3.0mm" H 12850 7400 60  0001 C CNN
F 3 "" H 12850 7400 60  0001 C CNN
	1    12850 7400
	0    -1   -1   0   
$EndComp
$Comp
L Z80SERIAL2-rescue:R-device-Z80SERIAL-rescue R7
U 1 1 60DD53CF
P 12850 7000
F 0 "R7" V 12930 7000 50  0000 C CNN
F 1 "470" V 12850 7000 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 12850 7000 60  0001 C CNN
F 3 "" H 12850 7000 60  0001 C CNN
	1    12850 7000
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR015
U 1 1 60DD53D9
P 12850 6750
F 0 "#PWR015" H 12850 6850 30  0001 C CNN
F 1 "VCC" H 12850 6850 30  0000 C CNN
F 2 "" H 12850 6750 60  0001 C CNN
F 3 "" H 12850 6750 60  0001 C CNN
	1    12850 6750
	1    0    0    -1  
$EndComp
$Comp
L device:LED D4
U 1 1 60E6BD67
P 12850 5800
F 0 "D4" H 12850 5900 50  0000 C CNN
F 1 "LED" H 12850 5700 50  0000 C CNN
F 2 "LEDs:LED_D5.0mm_Horizontal_O3.81mm_Z3.0mm" H 12850 5800 60  0001 C CNN
F 3 "" H 12850 5800 60  0001 C CNN
	1    12850 5800
	0    -1   -1   0   
$EndComp
$Comp
L Z80SERIAL2-rescue:R-device-Z80SERIAL-rescue R6
U 1 1 60E6BD71
P 12850 5400
F 0 "R6" V 12930 5400 50  0000 C CNN
F 1 "470" V 12850 5400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 12850 5400 60  0001 C CNN
F 3 "" H 12850 5400 60  0001 C CNN
	1    12850 5400
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR014
U 1 1 60E6BD7B
P 12850 5150
F 0 "#PWR014" H 12850 5250 30  0001 C CNN
F 1 "VCC" H 12850 5250 30  0000 C CNN
F 2 "" H 12850 5150 60  0001 C CNN
F 3 "" H 12850 5150 60  0001 C CNN
	1    12850 5150
	1    0    0    -1  
$EndComp
$Comp
L mechanical:MountingHole_Pad H1
U 1 1 6107EBB3
P 4100 8300
F 0 "H1" H 4200 8349 50  0000 L CNN
F 1 "BRACKET" H 4200 8258 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 4100 8300 50  0001 C CNN
F 3 "~" H 4100 8300 50  0001 C CNN
	1    4100 8300
	1    0    0    -1  
$EndComp
$Comp
L mechanical:MountingHole_Pad H2
U 1 1 61081B3A
P 4600 8300
F 0 "H2" H 4700 8349 50  0000 L CNN
F 1 "BRACKET" H 4700 8258 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 4600 8300 50  0001 C CNN
F 3 "~" H 4600 8300 50  0001 C CNN
	1    4600 8300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 8400 4350 8400
Wire Wire Line
	4350 8400 4350 8450
Connection ~ 4350 8400
Wire Wire Line
	4350 8400 4600 8400
$Comp
L 00JRCsch:GND #PWR016
U 1 1 610CFA90
P 4350 8450
F 0 "#PWR016" H 4350 8450 30  0001 C CNN
F 1 "GND" H 4350 8380 30  0001 C CNN
F 2 "" H 4350 8450 60  0000 C CNN
F 3 "" H 4350 8450 60  0000 C CNN
	1    4350 8450
	1    0    0    -1  
$EndComp
Wire Wire Line
	12100 6350 13400 6350
$Comp
L Switch:SW_Push SW2
U 1 1 6138E7EC
P 14400 2650
F 0 "SW2" H 14400 2935 50  0000 C CNN
F 1 "RECOVERY" H 14400 2844 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_SPST_Angled" H 14400 2850 50  0001 C CNN
F 3 "" H 14400 2850 50  0001 C CNN
	1    14400 2650
	1    0    0    -1  
$EndComp
$Comp
L Z80SERIAL2-rescue:CP-device-Z80SERIAL-rescue C17
U 1 1 61391D90
P 15400 2850
F 0 "C17" H 15529 2896 50  0000 L CNN
F 1 "10u" H 15529 2805 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 15400 2850 60  0001 C CNN
F 3 "" H 15400 2850 60  0001 C CNN
	1    15400 2850
	1    0    0    -1  
$EndComp
$Comp
L Z80SERIAL2-rescue:R-device-Z80SERIAL-rescue R8
U 1 1 61393D87
P 15400 2400
F 0 "R8" V 15480 2400 50  0000 C CNN
F 1 "10K" V 15400 2400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 15400 2400 60  0001 C CNN
F 3 "" H 15400 2400 60  0001 C CNN
	1    15400 2400
	-1   0    0    1   
$EndComp
Wire Wire Line
	15300 2650 15400 2650
Connection ~ 15400 2650
$Comp
L diode:1N4148 D6
U 1 1 613BA7A7
P 15750 2500
F 0 "D6" V 15704 2580 50  0000 L CNN
F 1 "1N4148" V 15795 2580 50  0000 L CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 15750 2325 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 15750 2500 50  0001 C CNN
	1    15750 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	15400 2650 15750 2650
Wire Wire Line
	15400 2150 15550 2150
Wire Wire Line
	15750 2150 15750 2350
$Comp
L 00JRCsch:GND #PWR017
U 1 1 61400AF7
P 15400 3050
F 0 "#PWR017" H 15400 3050 30  0001 C CNN
F 1 "GND" H 15400 2980 30  0001 C CNN
F 2 "" H 15400 3050 60  0000 C CNN
F 3 "" H 15400 3050 60  0000 C CNN
	1    15400 3050
	1    0    0    -1  
$EndComp
$Comp
L 00JRCsch:VCC #PWR018
U 1 1 614012D7
P 15550 2150
F 0 "#PWR018" H 15550 2250 30  0001 C CNN
F 1 "VCC" H 15553 2278 30  0000 C CNN
F 2 "" H 15550 2150 60  0000 C CNN
F 3 "" H 15550 2150 60  0000 C CNN
	1    15550 2150
	1    0    0    -1  
$EndComp
Connection ~ 15550 2150
Wire Wire Line
	15550 2150 15750 2150
Wire Wire Line
	14200 2650 13850 2650
Text Label 13900 2650 0    60   ~ 0
RI#
$Comp
L Z80SERIAL2-rescue:R-device-Z80SERIAL-rescue R9
U 1 1 614E13F6
P 15050 2650
F 0 "R9" V 15130 2650 50  0000 C CNN
F 1 "10" V 15050 2650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 15050 2650 60  0001 C CNN
F 3 "" H 15050 2650 60  0001 C CNN
	1    15050 2650
	0    -1   -1   0   
$EndComp
$Comp
L device:Jumper JP1
U 1 1 615104D7
P 14500 3050
F 0 "JP1" H 14500 3314 50  0000 C CNN
F 1 "EXT RECOVERY" H 14500 3223 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 14500 3050 50  0001 C CNN
F 3 "~" H 14500 3050 50  0001 C CNN
	1    14500 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	14200 2650 14200 3050
Connection ~ 14200 2650
Wire Wire Line
	14800 3050 14800 2650
Wire Wire Line
	14800 2650 14600 2650
Connection ~ 14800 2650
$Comp
L 00JRCsch:CONN_3 J5
U 1 1 6167D12C
P 13700 9000
F 0 "J5" H 13828 9028 50  0000 L CNN
F 1 "EXT DMA" H 13828 8944 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 13700 9000 60  0001 C CNN
F 3 "" H 13700 9000 60  0000 C CNN
	1    13700 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	13100 9000 13350 9000
Text Label 13150 9000 0    60   ~ 0
GND
Text Label 12550 2900 0    60   ~ 0
TXRDY#
Wire Wire Line
	12500 2900 12900 2900
Text Label 12550 3000 0    60   ~ 0
RXRDY#
Wire Wire Line
	12500 3000 12900 3000
Text Label 11350 8750 0    60   ~ 0
RXRDY#
Text Label 11350 9100 0    60   ~ 0
TXRDY#
$Comp
L 00JRCsch:74LS06 U7
U 6 1 6071736C
P 12300 9100
F 0 "U7" H 12250 9150 60  0000 C CNN
F 1 "74LS06" H 12250 9050 60  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 12300 9100 60  0001 C CNN
F 3 "" H 12300 9100 60  0000 C CNN
	6    12300 9100
	1    0    0    -1  
$EndComp
$Comp
L Z80SERIAL2-rescue:R-device-Z80SERIAL-rescue R11
U 1 1 619FD472
P 12950 8850
F 0 "R11" V 13030 8850 50  0000 C CNN
F 1 "4700" V 12950 8850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 12950 8850 60  0001 C CNN
F 3 "" H 12950 8850 60  0001 C CNN
	1    12950 8850
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR019
U 1 1 61A2C8E1
P 12950 8600
F 0 "#PWR019" H 12950 8700 30  0001 C CNN
F 1 "VCC" H 12950 8700 30  0000 C CNN
F 2 "" H 12950 8600 60  0001 C CNN
F 3 "" H 12950 8600 60  0001 C CNN
	1    12950 8600
	1    0    0    -1  
$EndComp
Wire Wire Line
	11300 8750 11850 8750
$Comp
L conn:CONN_4 P3
U 1 1 61C1B51C
P 6550 8300
F 0 "P3" V 6500 8300 60  0000 C CNN
F 1 "DAISY CHAIN" V 6600 8300 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6550 8300 60  0001 C CNN
F 3 "" H 6550 8300 60  0001 C CNN
	1    6550 8300
	1    0    0    -1  
$EndComp
Text Label 5600 8350 0    60   ~ 0
IEI
Text Label 5600 8250 0    60   ~ 0
BAO#
Text Label 5600 8150 0    60   ~ 0
BAI#
Text Label 5600 8450 0    60   ~ 0
IEO
Wire Wire Line
	5550 8150 6200 8150
Wire Wire Line
	5550 8250 6200 8250
Wire Wire Line
	5550 8350 6200 8350
Wire Wire Line
	5550 8450 6200 8450
Wire Wire Line
	12100 5850 12100 6050
Wire Wire Line
	12100 6550 12100 7450
Wire Wire Line
	12700 5950 12850 5950
Wire Wire Line
	12100 6050 12100 6350
Connection ~ 12100 6050
Wire Wire Line
	12100 7650 12100 7450
Connection ~ 12100 7450
Wire Wire Line
	12700 7550 12850 7550
$Comp
L 00JRCsch:74LS06 U7
U 5 1 60714F89
P 12300 8750
F 0 "U7" H 12250 8800 60  0000 C CNN
F 1 "74LS06" H 12250 8700 60  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 12300 8750 60  0001 C CNN
F 3 "" H 12300 8750 60  0000 C CNN
	5    12300 8750
	1    0    0    -1  
$EndComp
NoConn ~ 9300 8900
NoConn ~ 9300 9250
NoConn ~ 10200 9250
NoConn ~ 10200 8900
$Comp
L conn:CONN_2 J7
U 1 1 60A6A4F0
P 16050 3800
F 0 "J7" H 16178 3828 40  0000 L CNN
F 1 "TTL SER PWR" H 16178 3752 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 16050 3800 60  0001 C CNN
F 3 "" H 16050 3800 60  0001 C CNN
	1    16050 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	11300 9100 11850 9100
NoConn ~ 5550 8150
NoConn ~ 5550 8250
NoConn ~ 5550 8350
NoConn ~ 5550 8450
NoConn ~ 13350 8900
Wire Wire Line
	12750 9100 12750 8750
Connection ~ 12750 9100
Wire Wire Line
	12750 9100 12950 9100
Connection ~ 12950 9100
Wire Wire Line
	12950 9100 13350 9100
NoConn ~ 10700 9600
NoConn ~ 10100 9700
NoConn ~ 10100 9500
$Comp
L 74xx:74HCT02 U4
U 1 1 604F9EB4
P 9600 9950
F 0 "U4" H 9600 10000 50  0000 C CNN
F 1 "74LS02" H 9600 9900 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 9600 9950 50  0001 C CNN
F 3 "" H 9600 9950 50  0001 C CNN
	1    9600 9950
	1    0    0    -1  
$EndComp
NoConn ~ 9900 9950
NoConn ~ 9300 10050
NoConn ~ 9300 9850
NoConn ~ 9900 9600
NoConn ~ 9300 9700
NoConn ~ 9300 9500
$Comp
L 74xx:74LS32 U5
U 2 1 60CEB3F0
P 10400 9600
F 0 "U5" H 10400 9650 50  0000 C CNN
F 1 "74LS32" H 10400 9550 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 10400 9600 50  0001 C CNN
F 3 "" H 10400 9600 50  0001 C CNN
	2    10400 9600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT02 U4
U 4 1 6097C061
P 9600 9600
F 0 "U4" H 9600 9650 50  0000 C CNN
F 1 "74LS02" H 9600 9550 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm" H 9600 9600 50  0001 C CNN
F 3 "" H 9600 9600 50  0001 C CNN
	4    9600 9600
	1    0    0    -1  
$EndComp
Text Notes 12100 8400 0    60   ~ 0
External DMA Interface Circuit
$EndSCHEMATC
