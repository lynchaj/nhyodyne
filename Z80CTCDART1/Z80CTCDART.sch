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
L Z80CTCDART-rescue:74LS245-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue U2
U 1 1 61AFCBFB
P 2100 4550
F 0 "U2" H 2200 5125 60  0000 L BNN
F 1 "74LS245" H 2000 4100 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2100 4550 60  0001 C CNN
F 3 "" H 2100 4550 60  0001 C CNN
	1    2100 4550
	1    0    0    -1  
$EndComp
Text Label 1100 5950 0    60   ~ 0
WR#
Text Label 1100 6050 0    60   ~ 0
RD#
Text Label 1100 5750 0    60   ~ 0
IORQ#
Text Label 1100 4150 0    60   ~ 0
D1
Text Label 1100 4250 0    60   ~ 0
D2
Text Label 1100 4350 0    60   ~ 0
D3
Text Label 1100 4050 0    60   ~ 0
D0
Text Label 1100 4550 0    60   ~ 0
D5
Text Label 1100 4650 0    60   ~ 0
D6
Text Label 1100 4750 0    60   ~ 0
D7
Text Label 1100 4450 0    60   ~ 0
D4
Text Label 7500 6850 0    60   ~ 0
A9
Text Label 7500 6750 0    60   ~ 0
A10
Text Label 8800 6750 0    60   ~ 0
A11
Text Label 7500 6950 0    60   ~ 0
A8
Text Label 8800 6950 0    60   ~ 0
A13
Text Label 8800 7050 0    60   ~ 0
A14
Text Label 8800 7150 0    60   ~ 0
A15
Text Label 8800 6850 0    60   ~ 0
A12
Text Label 7500 7650 0    60   ~ 0
A1
Text Label 7500 7550 0    60   ~ 0
A2
Text Label 7500 7450 0    60   ~ 0
A3
Text Label 7500 7750 0    60   ~ 0
A0
Text Label 7500 7250 0    60   ~ 0
A5
Text Label 7500 7150 0    60   ~ 0
A6
Text Label 7500 7050 0    60   ~ 0
A7
Text Label 7500 7350 0    60   ~ 0
A4
Text Label 7500 7850 0    60   ~ 0
GND
Text Label 7500 7950 0    60   ~ 0
RFSH#
Text Label 8800 8450 0    60   ~ 0
HALT#
Text Label 7500 8450 0    60   ~ 0
BUSACK#
Text Label 7500 8050 0    60   ~ 0
M1#
Text Label 7500 8250 0    60   ~ 0
BUSRQ#
Text Label 8800 8350 0    60   ~ 0
NMI#
Text Label 8800 8250 0    60   ~ 0
INT#
Text Label 7500 8350 0    60   ~ 0
WAIT#
Text Label 7500 8150 0    60   ~ 0
RESET#
Text Label 8800 8550 0    60   ~ 0
MREQ#
Text Label 7500 8550 0    60   ~ 0
WR#
Text Label 7500 8650 0    60   ~ 0
RD#
Text Label 8800 8650 0    60   ~ 0
IORQ#
Text Label 8800 8150 0    60   ~ 0
D1
Text Label 8800 7850 0    60   ~ 0
D2
Text Label 8800 7450 0    60   ~ 0
D3
Text Label 8800 8050 0    60   ~ 0
D0
Text Label 8800 7550 0    60   ~ 0
D5
Text Label 8800 7650 0    60   ~ 0
D6
Text Label 8800 7950 0    60   ~ 0
D7
Text Label 8800 7350 0    60   ~ 0
D4
Text Label 8800 7750 0    60   ~ 0
VCC
Text Label 8800 7250 0    60   ~ 0
CLK
$Comp
L Z80CTCDART-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C1
U 1 1 603A8E72
P 1850 7900
F 0 "C1" H 1900 8000 50  0000 L CNN
F 1 "0.1u" H 1900 7800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1850 7900 60  0001 C CNN
F 3 "" H 1850 7900 60  0001 C CNN
	1    1850 7900
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C2
U 1 1 61AFCC01
P 2100 7900
F 0 "C2" H 2150 8000 50  0000 L CNN
F 1 "0.1u" H 2150 7800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2100 7900 60  0001 C CNN
F 3 "" H 2100 7900 60  0001 C CNN
	1    2100 7900
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C3
U 1 1 61AFCC02
P 2350 7900
F 0 "C3" H 2400 8000 50  0000 L CNN
F 1 "0.1u" H 2400 7800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2350 7900 60  0001 C CNN
F 3 "" H 2350 7900 60  0001 C CNN
	1    2350 7900
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C4
U 1 1 61AFCC03
P 2600 7900
F 0 "C4" H 2650 8000 50  0000 L CNN
F 1 "0.1u" H 2650 7800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2600 7900 60  0001 C CNN
F 3 "" H 2600 7900 60  0001 C CNN
	1    2600 7900
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C5
U 1 1 603A8FA5
P 2850 7900
F 0 "C5" H 2900 8000 50  0000 L CNN
F 1 "0.1u" H 2900 7800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2850 7900 60  0001 C CNN
F 3 "" H 2850 7900 60  0001 C CNN
	1    2850 7900
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:GND-power-Z80SERIAL3-rescue-Z80DARTCTC-rescue #PWR02
U 1 1 61AFCC05
P 3100 8150
F 0 "#PWR02" H 3100 8150 30  0001 C CNN
F 1 "GND" H 3100 8080 30  0001 C CNN
F 2 "" H 3100 8150 60  0001 C CNN
F 3 "" H 3100 8150 60  0001 C CNN
	1    3100 8150
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:VCC-power-Z80SERIAL3-rescue-Z80DARTCTC-rescue #PWR01
U 1 1 61AFCC06
P 3100 7700
F 0 "#PWR01" H 3100 7800 30  0001 C CNN
F 1 "VCC" H 3100 7800 30  0000 C CNN
F 2 "" H 3100 7700 60  0001 C CNN
F 3 "" H 3100 7700 60  0001 C CNN
	1    3100 7700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 61AFCC07
P 3850 7700
F 0 "#FLG02" H 3850 7795 30  0001 C CNN
F 1 "PWR_FLAG" H 3850 7880 30  0000 C CNN
F 2 "" H 3850 7700 60  0001 C CNN
F 3 "" H 3850 7700 60  0001 C CNN
	1    3850 7700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 61AFCC08
P 1600 8100
F 0 "#FLG01" H 1600 8195 30  0001 C CNN
F 1 "PWR_FLAG" H 1600 8280 30  0000 C CNN
F 2 "" H 1600 8100 60  0001 C CNN
F 3 "" H 1600 8100 60  0001 C CNN
	1    1600 8100
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:CP-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C10
U 1 1 6039BD2A
P 4600 7900
F 0 "C10" H 4650 8000 50  0000 L CNN
F 1 "10u" H 4650 7800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4600 7900 60  0001 C CNN
F 3 "" H 4600 7900 60  0001 C CNN
	1    4600 7900
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:CP-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C11
U 1 1 603A3D80
P 4850 7900
F 0 "C11" H 4900 8000 50  0000 L CNN
F 1 "10u" H 4900 7800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4850 7900 60  0001 C CNN
F 3 "" H 4850 7900 60  0001 C CNN
	1    4850 7900
	1    0    0    -1  
$EndComp
$Comp
L device:LED D2
U 1 1 603A5584
P 5650 8400
F 0 "D2" H 5650 8500 50  0000 C CNN
F 1 "LED" H 5650 8300 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5650 8400 60  0001 C CNN
F 3 "" H 5650 8400 60  0001 C CNN
	1    5650 8400
	0    -1   -1   0   
$EndComp
$Comp
L Z80CTCDART-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue R2
U 1 1 603A596D
P 5650 7950
F 0 "R2" V 5730 7950 50  0000 C CNN
F 1 "470" V 5650 7950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 5650 7950 60  0001 C CNN
F 3 "" H 5650 7950 60  0001 C CNN
	1    5650 7950
	-1   0    0    1   
$EndComp
$Comp
L Z80CTCDART-rescue:CONN_25X2-conn-Z80SERIAL3-rescue-Z80DARTCTC-rescue P2
U 1 1 61AFCC09
P 8300 7950
F 0 "P2" H 8300 9250 60  0000 C CNN
F 1 "Z80 BUS BACKPLANE" V 8300 7950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x25_P2.54mm_Horizontal" H 8300 7950 60  0001 C CNN
F 3 "" H 8300 7950 60  0001 C CNN
	1    8300 7950
	1    0    0    -1  
$EndComp
Text Label 8800 8950 0    60   ~ 0
SPARE2
Text Label 8800 8850 0    60   ~ 0
SPARE1
Text Label 8800 8750 0    60   ~ 0
SPARE0
Text Label 8800 9050 0    60   ~ 0
SPARE3
Text Label 8800 9150 0    60   ~ 0
SPARE4
Text Label 7500 8950 0    60   ~ 0
SPARE7
Text Label 7500 8850 0    60   ~ 0
SPARE8
Text Label 7500 8750 0    60   ~ 0
SPARE9
Text Label 7500 9050 0    60   ~ 0
SPARE6
Text Label 7500 9150 0    60   ~ 0
SPARE5
Text Notes 7350 6550 0    60   ~ 0
Note: Bus connector is mirror image of Z80\nCPU pin out to mate to backplane whose\nconnectors reflect Z80 CPU pin out.
$Comp
L Z80CTCDART-rescue:CONN_10-conn-Z80SERIAL3-rescue-Z80DARTCTC-rescue P1
U 1 1 61AFCC0A
P 6850 8500
F 0 "P1" V 6800 8500 60  0000 C CNN
F 1 "SPARES" V 6900 8500 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 6850 8500 60  0001 C CNN
F 3 "" H 6850 8500 60  0001 C CNN
	1    6850 8500
	1    0    0    -1  
$EndComp
Text Label 6100 8750 0    60   ~ 0
SPARE7
Text Label 6100 8850 0    60   ~ 0
SPARE8
Text Label 6100 8950 0    60   ~ 0
SPARE9
Text Label 6100 8650 0    60   ~ 0
SPARE6
Text Label 6100 8550 0    60   ~ 0
SPARE5
Text Label 6100 8250 0    60   ~ 0
SPARE2
Text Label 6100 8150 0    60   ~ 0
SPARE1
Text Label 6100 8050 0    60   ~ 0
SPARE0
Text Label 6100 8350 0    60   ~ 0
SPARE3
Text Label 6100 8450 0    60   ~ 0
SPARE4
Text Label 1100 5850 0    60   ~ 0
M1#
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 61AFCC0B
P 4600 3950
F 0 "SW1" H 4600 4500 50  0000 C CNN
F 1 "IO PORT ADDR" H 4600 3500 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Slide_9.78x22.5mm_W7.62mm_P2.54mm" H 4600 3950 50  0001 C CNN
F 3 "" H 4600 3950 50  0001 C CNN
	1    4600 3950
	1    0    0    1   
$EndComp
$Comp
L Z80CTCDART-rescue:RR8-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue RR1
U 1 1 61AFCC0C
P 5350 4900
F 0 "RR1" H 5400 5500 70  0000 C CNN
F 1 "10K" V 5380 4900 70  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" H 5350 4900 60  0001 C CNN
F 3 "" H 5350 4900 60  0001 C CNN
	1    5350 4900
	0    1    1    0   
$EndComp
$Comp
L Z80CTCDART-rescue:VCC-power-Z80SERIAL3-rescue-Z80DARTCTC-rescue #PWR07
U 1 1 6044E13A
P 6700 2450
F 0 "#PWR07" H 6700 2550 30  0001 C CNN
F 1 "VCC" H 6700 2550 30  0000 C CNN
F 2 "" H 6700 2450 60  0001 C CNN
F 3 "" H 6700 2450 60  0001 C CNN
	1    6700 2450
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:GND-power-Z80SERIAL3-rescue-Z80DARTCTC-rescue #PWR08
U 1 1 61AFCC0E
P 6700 4850
F 0 "#PWR08" H 6700 4850 30  0001 C CNN
F 1 "GND" H 6700 4780 30  0001 C CNN
F 2 "" H 6700 4850 60  0001 C CNN
F 3 "" H 6700 4850 60  0001 C CNN
	1    6700 4850
	1    0    0    -1  
$EndComp
Text Notes 7400 4550 0    60   ~ 0
Note: IO Address Port $B0-B7\nS1=off - A7 (high)\nS2=on - A6 (low)\nS3=off - A5 (high)\nS4=off - A4 (high)\nS5=on - A3 (low)\nS6=x - A2 (no effect)\nS7=x - A1 (no effect)\nS8=x - A0 (no effect)
Text Notes 4100 6650 0    60   ~ 0
Note: Inhibit Board Operation\nDuring Interrupts\nM1# = low, IORQ# = low, IA = low
$Comp
L 74xx:74LS688 U6
U 1 1 61AFCC11
P 6700 3650
F 0 "U6" H 6400 4700 50  0000 C CNN
F 1 "74LS688" H 6400 2600 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6700 3650 50  0001 C CNN
F 3 "" H 6700 3650 50  0001 C CNN
	1    6700 3650
	1    0    0    -1  
$EndComp
Text Notes 1000 6650 0    60   ~ 0
Note: Buffers and Transceivers\nrespond to IO and MEM cycles
NoConn ~ 7400 6750
NoConn ~ 7400 6850
NoConn ~ 7400 6950
NoConn ~ 9200 6750
NoConn ~ 9200 6850
NoConn ~ 9200 6950
NoConn ~ 9200 7050
NoConn ~ 9200 7150
NoConn ~ 7400 7950
NoConn ~ 7400 8250
NoConn ~ 7400 8450
NoConn ~ 7400 8350
Text Notes 4350 10000 0    60   ~ 0
Spare Components
Text Notes 1150 2450 0    60   ~ 0
Z80 BUS INTERFACE
Text Label 1100 5350 0    60   ~ 0
RESET#
$Comp
L Z80CTCDART-rescue:VCC-power-Z80SERIAL3-rescue-Z80DARTCTC-rescue #PWR06
U 1 1 61AFCC0F
P 5800 4550
F 0 "#PWR06" H 5800 4650 30  0001 C CNN
F 1 "VCC" H 5800 4650 30  0000 C CNN
F 2 "" H 5800 4550 60  0001 C CNN
F 3 "" H 5800 4550 60  0001 C CNN
	1    5800 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5750 1400 5750
Wire Wire Line
	1000 5950 1400 5950
Wire Wire Line
	1000 6050 1400 6050
Wire Wire Line
	1000 4050 1400 4050
Wire Wire Line
	1000 4150 1400 4150
Wire Wire Line
	1000 4250 1400 4250
Wire Wire Line
	1000 4350 1400 4350
Wire Wire Line
	1000 4450 1400 4450
Wire Wire Line
	1000 4550 1400 4550
Wire Wire Line
	1000 4650 1400 4650
Wire Wire Line
	1000 4750 1400 4750
Wire Wire Line
	7400 6950 7900 6950
Wire Wire Line
	7400 6850 7900 6850
Wire Wire Line
	7400 6750 7900 6750
Wire Wire Line
	8700 6750 9200 6750
Wire Wire Line
	8700 6850 9200 6850
Wire Wire Line
	8700 6950 9200 6950
Wire Wire Line
	8700 7050 9200 7050
Wire Wire Line
	8700 7150 9200 7150
Wire Wire Line
	7400 7750 7900 7750
Wire Wire Line
	7400 7650 7900 7650
Wire Wire Line
	7400 7550 7900 7550
Wire Wire Line
	7400 7450 7900 7450
Wire Wire Line
	7400 7350 7900 7350
Wire Wire Line
	7400 7250 7900 7250
Wire Wire Line
	7400 7150 7900 7150
Wire Wire Line
	7400 7050 7900 7050
Wire Wire Line
	7400 7850 7900 7850
Wire Wire Line
	7400 8050 7900 8050
Wire Wire Line
	7400 7950 7900 7950
Wire Wire Line
	8700 8450 9200 8450
Wire Wire Line
	7400 8450 7900 8450
Wire Wire Line
	7400 8150 7900 8150
Wire Wire Line
	8700 8350 9200 8350
Wire Wire Line
	8700 8250 9200 8250
Wire Wire Line
	7400 8350 7900 8350
Wire Wire Line
	7400 8250 7900 8250
Wire Wire Line
	8700 8650 9200 8650
Wire Wire Line
	8700 8550 9200 8550
Wire Wire Line
	7400 8550 7900 8550
Wire Wire Line
	7400 8650 7900 8650
Wire Wire Line
	8700 8050 9200 8050
Wire Wire Line
	8700 8150 9200 8150
Wire Wire Line
	8700 7850 9200 7850
Wire Wire Line
	8700 7450 9200 7450
Wire Wire Line
	8700 7350 9200 7350
Wire Wire Line
	8700 7550 9200 7550
Wire Wire Line
	8700 7650 9200 7650
Wire Wire Line
	8700 7950 9200 7950
Wire Wire Line
	8700 7750 9200 7750
Wire Wire Line
	8700 7250 9200 7250
Wire Wire Line
	1850 7700 2100 7700
Wire Wire Line
	1600 8100 1850 8100
Connection ~ 3850 7700
Connection ~ 3100 7700
Connection ~ 3100 8100
Wire Wire Line
	3100 8100 3100 8150
Connection ~ 2850 8100
Connection ~ 4600 7700
Connection ~ 4600 8100
Connection ~ 2350 8100
Connection ~ 2850 7700
Wire Wire Line
	7400 8850 7900 8850
Wire Wire Line
	7400 8750 7900 8750
Wire Wire Line
	8700 8750 9200 8750
Wire Wire Line
	7400 9050 7900 9050
Wire Wire Line
	7400 8950 7900 8950
Wire Wire Line
	8700 9050 9200 9050
Wire Wire Line
	8700 8950 9200 8950
Wire Wire Line
	8700 8850 9200 8850
Wire Wire Line
	7400 9150 7900 9150
Wire Wire Line
	8700 9150 9200 9150
Wire Wire Line
	1000 4950 1400 4950
Wire Wire Line
	1000 5850 1400 5850
Connection ~ 4300 4050
Connection ~ 4300 4150
Connection ~ 4300 4250
Connection ~ 4300 4350
Wire Wire Line
	4900 3950 5400 3950
Wire Wire Line
	4900 4050 5300 4050
Wire Wire Line
	4900 4150 5200 4150
Wire Wire Line
	4900 4250 5100 4250
Wire Wire Line
	4900 4350 5000 4350
Wire Wire Line
	5000 4550 5000 4350
Connection ~ 5000 4350
Wire Wire Line
	5100 4550 5100 4250
Connection ~ 5100 4250
Wire Wire Line
	5200 4550 5200 4150
Connection ~ 5200 4150
Wire Wire Line
	5300 4550 5300 4050
Connection ~ 5300 4050
Wire Wire Line
	5400 4550 5400 3950
Connection ~ 5400 3950
Wire Wire Line
	5500 4550 5500 3850
Wire Wire Line
	5600 4550 5600 3750
Wire Wire Line
	5700 4550 5700 3650
Wire Wire Line
	7200 2750 7300 2750
Wire Wire Line
	2800 5950 3900 5950
Wire Wire Line
	3900 5950 3900 2300
Wire Wire Line
	2800 6050 3800 6050
Wire Wire Line
	3800 6050 3800 2200
Wire Wire Line
	2900 4050 2800 4050
Wire Wire Line
	3000 4150 2800 4150
Wire Wire Line
	3000 1400 3000 4150
Wire Wire Line
	3100 4250 2800 4250
Wire Wire Line
	3100 1500 3100 4250
Wire Wire Line
	3200 4350 2800 4350
Wire Wire Line
	3200 1600 3200 4350
Wire Wire Line
	3300 4450 2800 4450
Wire Wire Line
	3300 1700 3300 4450
Wire Wire Line
	3400 4550 2800 4550
Wire Wire Line
	3400 1800 3400 4550
Wire Wire Line
	3500 4650 2800 4650
Wire Wire Line
	3500 1900 3500 4650
Wire Wire Line
	2800 4750 3600 4750
Wire Wire Line
	3600 4750 3600 2000
Connection ~ 4850 7700
Connection ~ 1600 8100
Wire Wire Line
	1600 8100 1600 9350
Wire Wire Line
	5350 8350 5350 7700
Connection ~ 5350 7700
Connection ~ 2600 7700
Connection ~ 2350 7700
Connection ~ 2100 7700
Connection ~ 1850 8100
Connection ~ 2100 8100
Connection ~ 2600 8100
Wire Wire Line
	1000 5350 1400 5350
Wire Wire Line
	2800 5350 3700 5350
Wire Wire Line
	3700 5350 3700 2100
Wire Wire Line
	6050 8050 6500 8050
Wire Wire Line
	6050 8150 6500 8150
Wire Wire Line
	6050 8250 6500 8250
Wire Wire Line
	6050 8350 6500 8350
Wire Wire Line
	6050 8450 6500 8450
Wire Wire Line
	6050 8550 6500 8550
Wire Wire Line
	6050 8650 6500 8650
Wire Wire Line
	6050 8750 6500 8750
Wire Wire Line
	6050 8850 6500 8850
Wire Wire Line
	6050 8950 6500 8950
Text Label 1100 6250 0    60   ~ 0
GND
$Comp
L Z80CTCDART-rescue:GND-power-Z80SERIAL3-rescue-Z80DARTCTC-rescue #PWR04
U 1 1 61AFCC10
P 4300 4550
F 0 "#PWR04" H 4300 4550 30  0001 C CNN
F 1 "GND" H 4300 4480 30  0001 C CNN
F 2 "" H 4300 4550 60  0001 C CNN
F 3 "" H 4300 4550 60  0001 C CNN
	1    4300 4550
	1    0    0    -1  
$EndComp
Text Label 2850 5850 0    60   ~ 0
bM1#
Text Label 2850 5750 0    60   ~ 0
bIORQ#
Text Label 2850 5950 0    60   ~ 0
bWR#
Text Label 2850 6050 0    60   ~ 0
bRD#
Text Notes 4950 2550 0    60   ~ 0
IO SELECTION CIRCUIT
Text Notes 4200 4800 0    60   ~ 0
SET IO PORT
Wire Wire Line
	7300 5200 7300 2750
Wire Wire Line
	1400 6250 1400 6350
NoConn ~ 9200 8550
Wire Wire Line
	2850 8100 3100 8100
Wire Wire Line
	4600 7700 4850 7700
Wire Wire Line
	4600 8100 4850 8100
Wire Wire Line
	2350 8100 2600 8100
Wire Wire Line
	2850 7700 3100 7700
Wire Wire Line
	4300 3950 4300 4050
Wire Wire Line
	4300 4050 4300 4150
Wire Wire Line
	4300 4150 4300 4250
Wire Wire Line
	4300 4250 4300 4350
Wire Wire Line
	4300 4350 4300 4550
Wire Wire Line
	5000 4350 6200 4350
Wire Wire Line
	5100 4250 6200 4250
Wire Wire Line
	5200 4150 6200 4150
Wire Wire Line
	5300 4050 6200 4050
Wire Wire Line
	5400 3950 6200 3950
Wire Wire Line
	5500 3850 6200 3850
Wire Wire Line
	5600 3750 6200 3750
Wire Wire Line
	5700 3650 6200 3650
Wire Wire Line
	5350 7700 5650 7700
Wire Wire Line
	2600 7700 2850 7700
Wire Wire Line
	2350 7700 2600 7700
Wire Wire Line
	2100 7700 2350 7700
Wire Wire Line
	1850 8100 2100 8100
Wire Wire Line
	2100 8100 2350 8100
Wire Wire Line
	2600 8100 2850 8100
Connection ~ 1400 6250
$Comp
L Z80CTCDART-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue U3
U 1 1 603971B6
P 2100 5850
F 0 "U3" H 2150 5650 60  0000 C CNN
F 1 "74LS244" H 2200 5450 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2100 5850 60  0001 C CNN
F 3 "" H 2100 5850 60  0001 C CNN
	1    2100 5850
	1    0    0    -1  
$EndComp
Text Label 1050 5200 0    60   ~ 0
CS_CTCDART#
Wire Wire Line
	3900 2300 8600 2300
Wire Wire Line
	3800 2200 8600 2200
Wire Wire Line
	3700 2100 8600 2100
Text Label 8100 2300 0    60   ~ 0
bWR#
Text Label 8100 2200 0    60   ~ 0
bRD#
Text Label 8100 2100 0    60   ~ 0
bRESET#
Text Label 8100 2000 0    60   ~ 0
bD7
Text Label 8100 1800 0    60   ~ 0
bD5
Text Label 8100 1700 0    60   ~ 0
bD4
Text Label 8100 1600 0    60   ~ 0
bD3
Text Label 8100 1500 0    60   ~ 0
bD2
Wire Wire Line
	3500 1900 8600 1900
Wire Wire Line
	3000 1400 8600 1400
Wire Wire Line
	2900 1300 8600 1300
Wire Wire Line
	3600 2000 8600 2000
Wire Wire Line
	3400 1800 8600 1800
Wire Wire Line
	3300 1700 8600 1700
Wire Wire Line
	3200 1600 8600 1600
Wire Wire Line
	3100 1500 8600 1500
Text Label 8100 1900 0    60   ~ 0
bD6
Text Label 8100 1400 0    60   ~ 0
bD1
Text Label 8100 1300 0    60   ~ 0
bD0
Text Label 1100 4950 0    60   ~ 0
RD#
NoConn ~ 9200 8450
Text Label 1100 3050 0    60   ~ 0
A3
Text Label 1100 3250 0    60   ~ 0
A5
Text Label 1100 3350 0    60   ~ 0
A6
Text Label 1100 3450 0    60   ~ 0
A7
Text Label 1100 3150 0    60   ~ 0
A4
Text Label 1100 2750 0    60   ~ 0
A0
Text Label 1100 2950 0    60   ~ 0
A2
Text Label 1100 2850 0    60   ~ 0
A1
Wire Wire Line
	1000 3050 1400 3050
Wire Wire Line
	1000 3150 1400 3150
Wire Wire Line
	1000 3250 1400 3250
Wire Wire Line
	1000 3350 1400 3350
Wire Wire Line
	1000 3450 1400 3450
Wire Wire Line
	1000 2750 1400 2750
Wire Wire Line
	1000 2850 1400 2850
Wire Wire Line
	1000 2950 1400 2950
Wire Wire Line
	2900 1300 2900 4050
Wire Wire Line
	2800 3450 6200 3450
Wire Wire Line
	2800 3350 6200 3350
Wire Wire Line
	2800 3250 6200 3250
Wire Wire Line
	2800 3150 6200 3150
Wire Wire Line
	2800 3050 6200 3050
Text Label 4000 2950 0    60   ~ 0
bA2
Text Label 4000 3150 0    60   ~ 0
bA4
Text Label 4000 3450 0    60   ~ 0
bA7
Text Label 4000 3350 0    60   ~ 0
bA6
Text Label 4000 3250 0    60   ~ 0
bA5
Text Label 4000 3050 0    60   ~ 0
bA3
$Comp
L Z80CTCDART-rescue:74LS244-RESCUE-Z80PROC-Z80CLOCK-rescue-Z80GENERIC_IO-rescue-Z80PPIDE-rescue-Z80SERIAL-rescue-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue U1
U 1 1 61AFCC16
P 2100 3250
F 0 "U1" H 2200 3825 60  0000 L BNN
F 1 "74LS244" H 2000 2800 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2100 3250 60  0001 C CNN
F 3 "" H 2100 3250 60  0001 C CNN
	1    2100 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  6250 800  3650
Wire Wire Line
	800  3650 1400 3650
Wire Wire Line
	800  6250 1400 6250
Wire Wire Line
	1400 3750 1400 3650
Connection ~ 1400 3650
Wire Wire Line
	3100 7700 3350 7700
Wire Wire Line
	3100 8100 3350 8100
Wire Wire Line
	4850 7700 5350 7700
Text Label 2850 5350 0    60   ~ 0
bRESET#
Connection ~ 7300 2750
Text Label 7400 2750 0    60   ~ 0
CS_CTCDART#
$Comp
L Z80CTCDART-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C6
U 1 1 637B9E50
P 3100 7900
F 0 "C6" H 3150 8000 50  0000 L CNN
F 1 "0.1u" H 3150 7800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3100 7900 60  0001 C CNN
F 3 "" H 3100 7900 60  0001 C CNN
	1    3100 7900
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C7
U 1 1 637B9E5A
P 3350 7900
F 0 "C7" H 3400 8000 50  0000 L CNN
F 1 "0.1u" H 3400 7800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3350 7900 60  0001 C CNN
F 3 "" H 3350 7900 60  0001 C CNN
	1    3350 7900
	1    0    0    -1  
$EndComp
Connection ~ 3350 7700
Wire Wire Line
	3350 7700 3600 7700
Connection ~ 3350 8100
Wire Wire Line
	3350 8100 3600 8100
$Comp
L Z80CTCDART-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C8
U 1 1 61AFCC15
P 3600 7900
F 0 "C8" H 3650 8000 50  0000 L CNN
F 1 "0.1u" H 3650 7800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3600 7900 60  0001 C CNN
F 3 "" H 3600 7900 60  0001 C CNN
	1    3600 7900
	1    0    0    -1  
$EndComp
Connection ~ 3600 7700
Wire Wire Line
	3600 7700 3850 7700
Connection ~ 3600 8100
Wire Wire Line
	900  5200 900  5450
Wire Wire Line
	900  5450 1400 5450
Wire Wire Line
	2800 5450 3700 5450
$Comp
L device:LED D1
U 1 1 6068F1F7
P 3450 6950
F 0 "D1" H 3450 7050 50  0000 C CNN
F 1 "LED" H 3450 6850 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 3450 6950 60  0001 C CNN
F 3 "" H 3450 6950 60  0001 C CNN
	1    3450 6950
	0    -1   -1   0   
$EndComp
$Comp
L Z80CTCDART-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue R1
U 1 1 6068F201
P 3450 6500
F 0 "R1" V 3530 6500 50  0000 C CNN
F 1 "470" V 3450 6500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3450 6500 60  0001 C CNN
F 3 "" H 3450 6500 60  0001 C CNN
	1    3450 6500
	-1   0    0    1   
$EndComp
$Comp
L Z80CTCDART-rescue:VCC-power-Z80SERIAL3-rescue-Z80DARTCTC-rescue #PWR03
U 1 1 6071F0FB
P 3450 6250
F 0 "#PWR03" H 3450 6350 30  0001 C CNN
F 1 "VCC" H 3450 6350 30  0000 C CNN
F 2 "" H 3450 6250 60  0001 C CNN
F 3 "" H 3450 6250 60  0001 C CNN
	1    3450 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 7150 3450 7150
Wire Wire Line
	3700 5450 3700 7150
Text Notes 3700 7000 1    60   ~ 0
IO CHIP SELECT
NoConn ~ 4900 3650
NoConn ~ 4900 3750
Wire Wire Line
	6200 2850 6200 2750
Wire Wire Line
	2800 2750 4200 2750
Wire Wire Line
	2800 2850 4200 2850
Text Label 4000 2750 0    60   ~ 0
bA0
Text Label 4000 2850 0    60   ~ 0
bA1
Wire Wire Line
	3850 7700 4100 7700
Wire Wire Line
	3600 8100 3850 8100
Wire Wire Line
	900  5050 900  5200
Connection ~ 900  5200
Wire Wire Line
	900  5050 1400 5050
Wire Wire Line
	900  5200 7300 5200
Wire Wire Line
	2800 2950 4200 2950
Wire Wire Line
	6200 2950 6200 2850
Connection ~ 6200 2850
NoConn ~ 4900 3850
Wire Wire Line
	5650 8250 5650 8200
Wire Wire Line
	5650 8550 5650 9350
Wire Wire Line
	3450 6800 3450 6750
Wire Wire Line
	3450 7150 3450 7100
Text Label 6200 5700 1    60   ~ 0
688SEL#
$Comp
L 74xx:74LS32 U5
U 1 1 60CE86CB
P 8650 2650
F 0 "U5" H 8650 2700 50  0000 C CNN
F 1 "74LS32" H 8650 2600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8650 2650 50  0001 C CNN
F 3 "" H 8650 2650 50  0001 C CNN
	1    8650 2650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 3 1 60CEDDF6
P 17150 6850
F 0 "U5" H 17150 6900 50  0000 C CNN
F 1 "74LS32" H 17150 6800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 17150 6850 50  0001 C CNN
F 3 "" H 17150 6850 50  0001 C CNN
	3    17150 6850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 4 1 60CF14BD
P 5900 6150
F 0 "U5" H 5900 6200 50  0000 C CNN
F 1 "74LS32" H 5900 6100 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5900 6150 50  0001 C CNN
F 3 "" H 5900 6150 50  0001 C CNN
	4    5900 6150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 5 1 60CF4F38
P 5350 8850
F 0 "U5" H 5250 8900 50  0000 L CNN
F 1 "74LS32" H 5200 8800 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5350 8850 50  0001 C CNN
F 3 "" H 5350 8850 50  0001 C CNN
	5    5350 8850
	1    0    0    -1  
$EndComp
Connection ~ 5350 9350
Wire Wire Line
	5350 9350 5650 9350
$Comp
L Z80CTCDART-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C9
U 1 1 61AFCC1A
P 3850 7900
F 0 "C9" H 3900 8000 50  0000 L CNN
F 1 "0.1u" H 3900 7800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3850 7900 60  0001 C CNN
F 3 "" H 3850 7900 60  0001 C CNN
	1    3850 7900
	1    0    0    -1  
$EndComp
Connection ~ 3850 8100
Wire Wire Line
	3850 8100 4100 8100
$Comp
L mechanical:MountingHole_Pad H1
U 1 1 6107EBB3
P 4350 7150
F 0 "H1" H 4450 7199 50  0000 L CNN
F 1 "BRACKET" H 4450 7108 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 4350 7150 50  0001 C CNN
F 3 "~" H 4350 7150 50  0001 C CNN
	1    4350 7150
	1    0    0    -1  
$EndComp
$Comp
L mechanical:MountingHole_Pad H2
U 1 1 61AFCC18
P 4850 7150
F 0 "H2" H 4950 7199 50  0000 L CNN
F 1 "BRACKET" H 4950 7108 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 4850 7150 50  0001 C CNN
F 3 "~" H 4850 7150 50  0001 C CNN
	1    4850 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 7250 4600 7250
Wire Wire Line
	4600 7250 4600 7300
Connection ~ 4600 7250
Wire Wire Line
	4600 7250 4850 7250
$Comp
L Z80CTCDART-rescue:GND-00JRCsch-Z80SERIAL3-rescue-Z80DARTCTC-rescue #PWR016
U 1 1 61AFCC19
P 4600 7300
F 0 "#PWR016" H 4600 7300 30  0001 C CNN
F 1 "GND" H 4600 7230 30  0001 C CNN
F 2 "" H 4600 7300 60  0000 C CNN
F 3 "" H 4600 7300 60  0000 C CNN
	1    4600 7300
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:CONN_4-conn-Z80SERIAL3-rescue-Z80DARTCTC-rescue P3
U 1 1 61C1B51C
P 6800 7150
F 0 "P3" V 6750 7150 60  0000 C CNN
F 1 "DAISY CHAIN" V 6850 7150 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6800 7150 60  0001 C CNN
F 3 "" H 6800 7150 60  0001 C CNN
	1    6800 7150
	1    0    0    -1  
$EndComp
Text Label 5850 7200 0    60   ~ 0
IEI#
Text Label 5850 7100 0    60   ~ 0
BAO#
Text Label 5850 7000 0    60   ~ 0
BAI#
Text Label 5850 7300 0    60   ~ 0
IEO#
Wire Wire Line
	5800 7000 6450 7000
Wire Wire Line
	5800 7100 6450 7100
Wire Wire Line
	5800 7200 6450 7200
Wire Wire Line
	5800 7300 6450 7300
NoConn ~ 5800 7000
NoConn ~ 5800 7100
$Comp
L 74xx:74LS32 U5
U 2 1 60CEB3F0
P 8650 3000
F 0 "U5" H 8650 3050 50  0000 C CNN
F 1 "74LS32" H 8650 2950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8650 3000 50  0001 C CNN
F 3 "" H 8650 3000 50  0001 C CNN
	2    8650 3000
	1    0    0    -1  
$EndComp
Connection ~ 20000 4500
Connection ~ 18800 5400
Connection ~ 18800 4400
Connection ~ 11750 6450
NoConn ~ 11300 10550
Wire Wire Line
	18600 2250 19250 2250
Text Label 18650 2250 0    60   ~ 0
RIB#
Wire Wire Line
	18600 2150 19250 2150
Text Label 18650 2150 0    60   ~ 0
RXCA#
Wire Wire Line
	17150 2250 17800 2250
Text Label 17200 2250 0    60   ~ 0
W#-RDYB#
Text Notes 13950 1350 0    60   ~ 0
VCC PIN 9
Text Notes 13950 1250 0    60   ~ 0
GND PIN 31
Text Notes 11000 1450 0    60   ~ 0
VCC PIN 24
Text Notes 11000 1350 0    60   ~ 0
GND PIN 5
Wire Wire Line
	15300 7950 15750 7950
Wire Wire Line
	18800 4600 18800 4400
Wire Wire Line
	11950 10250 11300 10250
Wire Wire Line
	10500 10250 9850 10250
Wire Wire Line
	11950 10350 11300 10350
Wire Wire Line
	10500 10350 9850 10350
Wire Wire Line
	15950 9350 15300 9350
Wire Wire Line
	15950 9150 15300 9150
Wire Wire Line
	12350 9350 11700 9350
Wire Wire Line
	12350 9150 11700 9150
Connection ~ 15750 7950
Wire Wire Line
	13200 9350 13700 9350
Wire Wire Line
	13200 9150 13700 9150
Wire Wire Line
	15300 8550 15300 8650
Wire Wire Line
	15300 8850 16400 8850
Wire Wire Line
	15750 8350 15300 8350
Wire Wire Line
	13200 9050 13700 9050
Wire Wire Line
	13200 9250 13700 9250
Connection ~ 12150 7950
Wire Wire Line
	16350 5400 17000 5400
Wire Wire Line
	16350 5200 17000 5200
Wire Wire Line
	16350 5000 17000 5000
Wire Wire Line
	16350 4800 17000 4800
Wire Wire Line
	16350 4600 17000 4600
Wire Wire Line
	18600 2750 19250 2750
Wire Wire Line
	17150 2650 17800 2650
Wire Wire Line
	18600 2650 19250 2650
Wire Wire Line
	17150 2750 17800 2750
Wire Wire Line
	17150 2450 17800 2450
Wire Wire Line
	18600 2450 19250 2450
Wire Wire Line
	18600 2550 19250 2550
Wire Wire Line
	17150 2550 17800 2550
Wire Wire Line
	18600 2850 19250 2850
Wire Wire Line
	17150 2850 17800 2850
Wire Wire Line
	17150 1950 17800 1950
Wire Wire Line
	17150 2050 17800 2050
Wire Wire Line
	17150 1850 17800 1850
Wire Wire Line
	17150 1750 17800 1750
Wire Wire Line
	17150 1650 17800 1650
Wire Wire Line
	18600 1950 19250 1950
Wire Wire Line
	18600 1850 19250 1850
Wire Wire Line
	18600 1750 19250 1750
Wire Wire Line
	18600 1650 19250 1650
Wire Wire Line
	16000 3400 16650 3400
Wire Wire Line
	16000 3300 16650 3300
Wire Wire Line
	16000 2800 16650 2800
Wire Wire Line
	16000 2700 16650 2700
Wire Wire Line
	16000 3100 16650 3100
Wire Wire Line
	16000 3000 16650 3000
Wire Wire Line
	16000 2400 16650 2400
Wire Wire Line
	16000 2300 16650 2300
Wire Wire Line
	16000 2200 16650 2200
Wire Wire Line
	16000 2500 16650 2500
Wire Wire Line
	16000 2000 16650 2000
Wire Wire Line
	16000 1900 16650 1900
Wire Wire Line
	16000 1700 16650 1700
Wire Wire Line
	16000 1600 16650 1600
Wire Wire Line
	16000 1500 16650 1500
Wire Wire Line
	16000 2900 16650 2900
Wire Wire Line
	16000 1800 16650 1800
Wire Wire Line
	18250 6850 17450 6850
Wire Wire Line
	9700 6150 10350 6150
Wire Wire Line
	11750 6700 11750 6450
Wire Wire Line
	11750 6700 10350 6700
Wire Wire Line
	10350 6700 10350 6950
Wire Wire Line
	20000 5500 20550 5500
Wire Wire Line
	18250 5400 18800 5400
Wire Wire Line
	9600 9350 10100 9350
Wire Wire Line
	9600 9150 10100 9150
Wire Wire Line
	11700 8550 11700 8650
Wire Wire Line
	11700 8850 12800 8850
Wire Wire Line
	12150 8350 11700 8350
Wire Wire Line
	9600 9050 10100 9050
Wire Wire Line
	9600 9250 10100 9250
Wire Wire Line
	20000 4500 20550 4500
Wire Wire Line
	18800 4400 18250 4400
Wire Wire Line
	18250 5100 18800 5100
Wire Wire Line
	18250 4900 18800 4900
Wire Wire Line
	8050 3400 8350 3400
Wire Wire Line
	16000 7000 16000 6950
Wire Wire Line
	9500 3000 8950 3000
Wire Wire Line
	9800 1700 10450 1700
Wire Wire Line
	9800 1800 10450 1800
Wire Wire Line
	9800 1900 10450 1900
Wire Wire Line
	9800 2000 10450 2000
Wire Wire Line
	9800 2100 10450 2100
Wire Wire Line
	9800 2200 10450 2200
Wire Wire Line
	9800 2300 10450 2300
Wire Wire Line
	9800 2400 10450 2400
Wire Wire Line
	9800 2600 10450 2600
Wire Wire Line
	9800 2700 10450 2700
Wire Wire Line
	9800 2800 10450 2800
Wire Wire Line
	9800 2900 10450 2900
Wire Wire Line
	9800 3000 10450 3000
Wire Wire Line
	9800 3100 10450 3100
Wire Wire Line
	9800 3200 10450 3200
Wire Wire Line
	9800 3400 10450 3400
Wire Wire Line
	9800 3500 10450 3500
Wire Wire Line
	9800 3600 10450 3600
Wire Wire Line
	12250 3500 12900 3500
Wire Wire Line
	12250 1800 12900 1800
Wire Wire Line
	12250 1900 12900 1900
Wire Wire Line
	12250 2300 12900 2300
Wire Wire Line
	12250 2400 12900 2400
Wire Wire Line
	13550 2400 14200 2400
Wire Wire Line
	13550 3000 14200 3000
Wire Wire Line
	13550 2900 14200 2900
Wire Wire Line
	13550 2600 14200 2600
Wire Wire Line
	13550 2700 14200 2700
Wire Wire Line
	13550 2800 14200 2800
Wire Wire Line
	13550 3400 14200 3400
Wire Wire Line
	13550 3300 14200 3300
Wire Wire Line
	13550 3200 14200 3200
Wire Wire Line
	13550 3600 14200 3600
Wire Wire Line
	13550 2500 14200 2500
Wire Wire Line
	9700 6450 10350 6450
Wire Wire Line
	9700 7250 10350 7250
Wire Wire Line
	11750 6950 12400 6950
Wire Wire Line
	11750 7050 12400 7050
Wire Wire Line
	11750 7150 12400 7150
Wire Wire Line
	11750 7250 12400 7250
Wire Wire Line
	11750 6150 12400 6150
Wire Wire Line
	11750 6250 12400 6250
Wire Wire Line
	11750 6350 12400 6350
Wire Wire Line
	11750 6450 12400 6450
Wire Wire Line
	16850 6950 16850 6750
Wire Wire Line
	12350 9050 11700 9050
Wire Wire Line
	12350 9250 11700 9250
Wire Wire Line
	15950 9050 15300 9050
Wire Wire Line
	15950 9250 15300 9250
Wire Wire Line
	9850 10550 10500 10550
Wire Wire Line
	18800 5400 18800 5600
Wire Wire Line
	13500 10550 14150 10550
Wire Wire Line
	11700 7950 12150 7950
NoConn ~ 14950 10550
NoConn ~ 14950 10450
Text Label 13550 10550 0    60   ~ 0
GND
Text Label 15150 10350 0    60   ~ 0
CTSA_IN
Text Label 13550 10250 0    60   ~ 0
RXDA_IN#
Text Label 15150 10250 0    60   ~ 0
RTSA_OUT
Text Label 13550 10350 0    60   ~ 0
TXDA_OUT#
NoConn ~ 18600 2050
$Comp
L Z80CTCDART-rescue:74LS09-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U13
U 4 1 49583188
P 19400 6800
F 0 "U13" H 19300 6850 50  0000 L BNN
F 1 "74LS09" H 19300 6750 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 19400 6950 50  0001 C CNN
F 3 "" H 19400 6800 50  0001 C CNN
	4    19400 6800
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:74LS09-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U13
U 3 1 49583171
P 19400 5500
F 0 "U13" H 19300 5550 50  0000 L BNN
F 1 "74LS09" H 19300 5450 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 19400 5650 50  0001 C CNN
F 3 "" H 19400 5500 50  0001 C CNN
	3    19400 5500
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:74LS09-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U13
U 2 1 49583158
P 19400 5000
F 0 "U13" H 19300 5050 50  0000 L BNN
F 1 "74LS09" H 19300 4950 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 19400 5150 50  0001 C CNN
F 3 "" H 19400 5000 50  0001 C CNN
	2    19400 5000
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:74LS09-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U13
U 1 1 4958314B
P 19400 4500
F 0 "U13" H 19300 4550 50  0000 L BNN
F 1 "74LS09" H 19300 4450 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 19400 4650 50  0001 C CNN
F 3 "" H 19400 4500 50  0001 C CNN
	1    19400 4500
	1    0    0    -1  
$EndComp
Text Label 9900 10550 0    60   ~ 0
GND
Text Label 11450 10350 0    60   ~ 0
CTSB_IN
Text Label 9900 10250 0    60   ~ 0
RXDB_IN#
Text Label 11450 10250 0    60   ~ 0
RTSB_OUT
Text Label 9900 10350 0    60   ~ 0
TXDB_OUT#
Text Label 15350 9250 0    60   ~ 0
RXDA_IN#
Text Label 13250 9250 0    60   ~ 0
RXDA
Text Label 13250 9150 0    60   ~ 0
RTSA#
Text Label 13250 9050 0    60   ~ 0
TXDA
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR0101
U 1 1 495820F7
P 16150 8350
F 0 "#PWR0101" H 16150 8350 30  0001 C CNN
F 1 "GND" H 16150 8280 30  0001 C CNN
F 2 "" H 16150 8350 50  0001 C CNN
F 3 "" H 16150 8350 50  0001 C CNN
	1    16150 8350
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR0102
U 1 1 495820F5
P 15300 8650
F 0 "#PWR0102" H 15300 8650 30  0001 C CNN
F 1 "GND" H 15300 8580 30  0001 C CNN
F 2 "" H 15300 8650 50  0001 C CNN
F 3 "" H 15300 8650 50  0001 C CNN
	1    15300 8650
	1    0    0    -1  
$EndComp
Text Label 15350 9050 0    60   ~ 0
TXDA_OUT#
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR0103
U 1 1 495820F4
P 16400 9250
F 0 "#PWR0103" H 16400 9250 30  0001 C CNN
F 1 "GND" H 16400 9180 30  0001 C CNN
F 2 "" H 16400 9250 50  0001 C CNN
F 3 "" H 16400 9250 50  0001 C CNN
	1    16400 9250
	1    0    0    -1  
$EndComp
Text Label 13250 9350 0    60   ~ 0
CTSA#
$Comp
L Z80CTCDART-rescue:CP-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue C30
U 1 1 495820F3
P 16400 9050
F 0 "C30" H 16450 9150 50  0000 L CNN
F 1 "1u" H 16450 8950 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 16400 9050 50  0001 C CNN
F 3 "" H 16400 9050 50  0001 C CNN
	1    16400 9050
	-1   0    0    1   
$EndComp
$Comp
L Z80CTCDART-rescue:CP-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue C26
U 1 1 495820F2
P 13700 8150
F 0 "C26" H 13750 8250 50  0000 L CNN
F 1 "1u" H 13750 8050 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 13700 8150 50  0001 C CNN
F 3 "" H 13700 8150 50  0001 C CNN
	1    13700 8150
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:CP-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue C27
U 1 1 495820F1
P 13700 8650
F 0 "C27" H 13750 8750 50  0000 L CNN
F 1 "1u" H 13750 8550 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 13700 8650 50  0001 C CNN
F 3 "" H 13700 8650 50  0001 C CNN
	1    13700 8650
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:CP-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue C28
U 1 1 495820F0
P 15750 8150
F 0 "C28" H 15800 8250 50  0000 L CNN
F 1 "1u" H 15800 8050 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 15750 8150 50  0001 C CNN
F 3 "" H 15750 8150 50  0001 C CNN
	1    15750 8150
	-1   0    0    1   
$EndComp
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR0104
U 1 1 495820EF
P 16150 8350
F 0 "#PWR0104" H 16150 8350 30  0001 C CNN
F 1 "GND" H 16150 8280 30  0001 C CNN
F 2 "" H 16150 8350 50  0001 C CNN
F 3 "" H 16150 8350 50  0001 C CNN
	1    16150 8350
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:CP-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue C29
U 1 1 495820EE
P 16150 8150
F 0 "C29" H 16200 8250 50  0000 L CNN
F 1 "1u" H 16200 8050 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 16150 8150 50  0001 C CNN
F 3 "" H 16150 8150 50  0001 C CNN
	1    16150 8150
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR09
U 1 1 495820EC
P 15300 8650
F 0 "#PWR09" H 15300 8650 30  0001 C CNN
F 1 "GND" H 15300 8580 30  0001 C CNN
F 2 "" H 15300 8650 50  0001 C CNN
F 3 "" H 15300 8650 50  0001 C CNN
	1    15300 8650
	1    0    0    -1  
$EndComp
Text Label 15350 9350 0    60   ~ 0
CTSA_IN
$Comp
L Z80CTCDART-rescue:MAX232-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U11
U 1 1 495820EB
P 14500 8650
F 0 "U11" H 14500 9500 70  0000 C CNN
F 1 "MAX232" H 14500 7800 70  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 14500 8650 50  0001 C CNN
F 3 "" H 14500 8650 50  0001 C CNN
	1    14500 8650
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR010
U 1 1 495820EA
P 16400 9250
F 0 "#PWR010" H 16400 9250 30  0001 C CNN
F 1 "GND" H 16400 9180 30  0001 C CNN
F 2 "" H 16400 9250 50  0001 C CNN
F 3 "" H 16400 9250 50  0001 C CNN
	1    16400 9250
	1    0    0    -1  
$EndComp
Text Label 11750 9250 0    60   ~ 0
RXDB_IN#
Text Label 9650 9250 0    60   ~ 0
RXDB
Text Label 11750 9150 0    60   ~ 0
RTSB_OUT
Text Label 9650 9150 0    60   ~ 0
RTSB#
Text Label 9650 9050 0    60   ~ 0
TXDB
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR011
U 1 1 49581D27
P 12550 8350
F 0 "#PWR011" H 12550 8350 30  0001 C CNN
F 1 "GND" H 12550 8280 30  0001 C CNN
F 2 "" H 12550 8350 50  0001 C CNN
F 3 "" H 12550 8350 50  0001 C CNN
	1    12550 8350
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR013
U 1 1 49581D24
P 11700 8650
F 0 "#PWR013" H 11700 8650 30  0001 C CNN
F 1 "GND" H 11700 8580 30  0001 C CNN
F 2 "" H 11700 8650 50  0001 C CNN
F 3 "" H 11700 8650 50  0001 C CNN
	1    11700 8650
	1    0    0    -1  
$EndComp
Text Label 11750 9050 0    60   ~ 0
TXDB_OUT#
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR014
U 1 1 49581D22
P 12800 9250
F 0 "#PWR014" H 12800 9250 30  0001 C CNN
F 1 "GND" H 12800 9180 30  0001 C CNN
F 2 "" H 12800 9250 50  0001 C CNN
F 3 "" H 12800 9250 50  0001 C CNN
	1    12800 9250
	1    0    0    -1  
$EndComp
Text Label 16400 5400 0    60   ~ 0
bINT#
$Comp
L Z80CTCDART-rescue:R-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue R11
U 1 1 49581B3A
P 16100 5400
F 0 "R11" V 16180 5400 50  0000 C CNN
F 1 "4700" V 16100 5400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16100 5400 50  0001 C CNN
F 3 "" H 16100 5400 50  0001 C CNN
	1    16100 5400
	0    1    1    0   
$EndComp
Text Label 16400 5200 0    60   ~ 0
IEO#
$Comp
L Z80CTCDART-rescue:R-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue R10
U 1 1 49581B38
P 16100 5200
F 0 "R10" V 16180 5200 50  0000 C CNN
F 1 "2200" V 16100 5200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16100 5200 50  0001 C CNN
F 3 "" H 16100 5200 50  0001 C CNN
	1    16100 5200
	0    1    1    0   
$EndComp
Text Label 16400 5000 0    60   ~ 0
IEO_DART
$Comp
L Z80CTCDART-rescue:R-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue R7
U 1 1 49581A9E
P 16100 5000
F 0 "R7" V 16180 5000 50  0000 C CNN
F 1 "10K" V 16100 5000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16100 5000 50  0001 C CNN
F 3 "" H 16100 5000 50  0001 C CNN
	1    16100 5000
	0    1    1    0   
$EndComp
Text Label 16400 4800 0    60   ~ 0
IEO_CTC
$Comp
L Z80CTCDART-rescue:R-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue R6
U 1 1 495819F2
P 16100 4800
F 0 "R6" V 16180 4800 50  0000 C CNN
F 1 "10K" V 16100 4800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16100 4800 50  0001 C CNN
F 3 "" H 16100 4800 50  0001 C CNN
	1    16100 4800
	0    1    1    0   
$EndComp
Text Label 16400 4600 0    60   ~ 0
IEI#
$Comp
L Z80CTCDART-rescue:R-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue R5
U 1 1 4958195D
P 16100 4600
F 0 "R5" V 16180 4600 50  0000 C CNN
F 1 "4700" V 16100 4600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 16100 4600 50  0001 C CNN
F 3 "" H 16100 4600 50  0001 C CNN
	1    16100 4600
	0    1    1    0   
$EndComp
Text Label 18650 2750 0    60   ~ 0
DTRA#
Text Label 17200 2650 0    60   ~ 0
CTSA#
Text Label 18650 2650 0    60   ~ 0
RTSA#
Text Label 17200 2750 0    60   ~ 0
DCDA#
Text Label 17200 2450 0    60   ~ 0
W#-RDYA#
Text Label 18650 2450 0    60   ~ 0
RIA#
Text Label 18650 2550 0    60   ~ 0
TXDA
Text Label 17200 2550 0    60   ~ 0
RXDA
Text Label 18650 2850 0    60   ~ 0
GND
Text Label 17200 2850 0    60   ~ 0
GND
Text Label 17200 1950 0    60   ~ 0
CTC_TG2
Text Label 17200 2050 0    60   ~ 0
CTC_TG3
Text Label 17200 1850 0    60   ~ 0
CTC_TG1
Text Label 17200 1750 0    60   ~ 0
CTC_TG0
Text Label 17200 1650 0    60   ~ 0
VCC
Text Label 18650 1950 0    60   ~ 0
CTC_ZC2
Text Label 18650 1850 0    60   ~ 0
CTC_ZC1
Text Label 18650 1750 0    60   ~ 0
CTC_ZC0
Text Label 18650 1650 0    60   ~ 0
VCC
Text Label 16050 3400 0    60   ~ 0
CTSB#
Text Label 16050 3300 0    60   ~ 0
RTSB#
Text Label 16050 2800 0    60   ~ 0
TXDB
Text Label 16050 2700 0    60   ~ 0
RXDB
Text Label 16050 3100 0    60   ~ 0
W#-RDYB#
Text Label 16050 3000 0    60   ~ 0
RIB#
Text Label 16050 2400 0    60   ~ 0
DTRA#
Text Label 16050 2300 0    60   ~ 0
CTSA#
Text Label 16050 2200 0    60   ~ 0
RTSA#
Text Label 16050 2500 0    60   ~ 0
DCDA#
Text Label 16050 2000 0    60   ~ 0
W#-RDYA#
Text Label 16050 1900 0    60   ~ 0
RIA#
Text Label 16050 1700 0    60   ~ 0
TXDA
Text Label 16050 1600 0    60   ~ 0
RXCA#
Text Label 16050 1500 0    60   ~ 0
RXDA
Text Label 16050 2900 0    60   ~ 0
RXTXCB#
Text Label 16050 1800 0    60   ~ 0
TXCA#
Text Label 9750 6150 0    60   ~ 0
CPA
$Comp
L Z80CTCDART-rescue:74LS393-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U12
U 2 1 495804BA
P 11050 7100
F 0 "U12" H 10750 7325 50  0000 L BNN
F 1 "74LS393" H 10750 6700 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 11050 7250 50  0001 C CNN
F 3 "" H 11050 7100 50  0001 C CNN
	2    11050 7100
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:74LS393-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U12
U 1 1 49580495
P 11050 6300
F 0 "U12" H 10750 6525 50  0000 L BNN
F 1 "74LS393" H 10750 5900 50  0000 L BNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 11050 6450 50  0001 C CNN
F 3 "" H 11050 6300 50  0001 C CNN
	1    11050 6300
	1    0    0    -1  
$EndComp
Text Label 11800 6450 0    60   ~ 0
Q3A
Text Label 11800 6350 0    60   ~ 0
Q2A
Text Label 11800 6250 0    60   ~ 0
Q1A
Text Label 11800 6150 0    60   ~ 0
Q0A
Text Label 11800 7250 0    60   ~ 0
Q3B
Text Label 11800 7150 0    60   ~ 0
Q2B
Text Label 11800 7050 0    60   ~ 0
Q1B
Text Label 11800 6950 0    60   ~ 0
Q0B
Text Label 9750 7250 0    60   ~ 0
GND
Text Label 9750 6450 0    60   ~ 0
GND
$Comp
L Z80CTCDART-rescue:CONN_13X2-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue X4
U 1 1 49580061
P 18200 2250
F 0 "X4" H 18200 2950 60  0000 C CNN
F 1 "DART-CTC_TTL" V 18200 2250 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x13_P2.54mm_Vertical" H 18200 2250 50  0001 C CNN
F 3 "" H 18200 2250 50  0001 C CNN
	1    18200 2250
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:CONN_5X2-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue X3
U 1 1 4958005E
P 10900 10350
F 0 "X3" H 10900 10650 60  0000 C CNN
F 1 "RS-232 B" V 10900 10350 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Horizontal" H 10900 10350 50  0001 C CNN
F 3 "" H 10900 10350 50  0001 C CNN
	1    10900 10350
	1    0    0    -1  
$EndComp
Text Label 13600 2500 0    60   ~ 0
bRESET#
Text Label 13600 3600 0    60   ~ 0
bCLK
Text Label 13600 3200 0    60   ~ 0
bINT#
Text Label 13600 3300 0    60   ~ 0
IEO_CTC
Text Label 13600 3400 0    60   ~ 0
IEO_DART
Text Label 13600 2800 0    60   ~ 0
bRD#
Text Label 13600 2700 0    60   ~ 0
bIORQ#
Text Label 13600 2600 0    60   ~ 0
bM1#
Text Label 13600 2900 0    60   ~ 0
bA1
Text Label 13600 3000 0    60   ~ 0
bA0
Text Label 13600 2400 0    60   ~ 0
CS_DART#
Text Label 12300 3100 0    60   ~ 0
CTC_TG3
Text Label 12300 2800 0    60   ~ 0
CTC_ZC2
Text Label 12300 2700 0    60   ~ 0
CTC_TG2
Text Label 12300 2400 0    60   ~ 0
CTC_ZC1
Text Label 12300 2300 0    60   ~ 0
CTC_TG1
Text Label 12300 1900 0    60   ~ 0
CTC_ZC0
Text Label 12300 1800 0    60   ~ 0
CTC_TG0
Text Label 12300 3500 0    60   ~ 0
bRESET#
Text Label 9850 3600 0    60   ~ 0
bCLK
Text Label 9850 3500 0    60   ~ 0
bINT#
Text Label 9850 3400 0    60   ~ 0
IEO_CTC
Text Label 9850 3200 0    60   ~ 0
IEI#
Text Label 9850 3100 0    60   ~ 0
bRD#
Text Label 9850 3000 0    60   ~ 0
bIORQ#
Text Label 9850 2900 0    60   ~ 0
bM1#
Text Label 9850 2800 0    60   ~ 0
bA1
Text Label 9850 2700 0    60   ~ 0
bA0
Text Label 9850 2600 0    60   ~ 0
CS_CTC#
Text Label 9850 2400 0    60   ~ 0
bD7
Text Label 9850 2300 0    60   ~ 0
bD6
Text Label 9850 2200 0    60   ~ 0
bD5
Text Label 9850 2100 0    60   ~ 0
bD4
Text Label 9850 2000 0    60   ~ 0
bD3
Text Label 9850 1900 0    60   ~ 0
bD2
Text Label 9850 1800 0    60   ~ 0
bD1
Text Label 9850 1700 0    60   ~ 0
bD0
Text Label 20250 5400 0    60   ~ 0
INT#
Text Label 18300 5400 0    60   ~ 0
bINT#
Text Label 9650 9350 0    60   ~ 0
CTSB#
$Comp
L Z80CTCDART-rescue:CP-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue C25
U 1 1 4957E1A8
P 12800 9050
F 0 "C25" H 12850 9150 50  0000 L CNN
F 1 "1u" H 12850 8950 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 12800 9050 50  0001 C CNN
F 3 "" H 12800 9050 50  0001 C CNN
	1    12800 9050
	-1   0    0    1   
$EndComp
$Comp
L Z80CTCDART-rescue:CP-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue C21
U 1 1 4957E1A7
P 10100 8150
F 0 "C21" H 10150 8250 50  0000 L CNN
F 1 "1u" H 10150 8050 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 10100 8150 50  0001 C CNN
F 3 "" H 10100 8150 50  0001 C CNN
	1    10100 8150
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:CP-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue C22
U 1 1 4957E1A6
P 10100 8650
F 0 "C22" H 10150 8750 50  0000 L CNN
F 1 "1u" H 10150 8550 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 10100 8650 50  0001 C CNN
F 3 "" H 10100 8650 50  0001 C CNN
	1    10100 8650
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:CP-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue C23
U 1 1 4957E1A5
P 12150 8150
F 0 "C23" H 12200 8250 50  0000 L CNN
F 1 "1u" H 12200 8050 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 12150 8150 50  0001 C CNN
F 3 "" H 12150 8150 50  0001 C CNN
	1    12150 8150
	-1   0    0    1   
$EndComp
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR023
U 1 1 4957E1A4
P 12550 8350
F 0 "#PWR023" H 12550 8350 30  0001 C CNN
F 1 "GND" H 12550 8280 30  0001 C CNN
F 2 "" H 12550 8350 50  0001 C CNN
F 3 "" H 12550 8350 50  0001 C CNN
	1    12550 8350
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:CP-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue C24
U 1 1 4957E1A3
P 12550 8150
F 0 "C24" H 12600 8250 50  0000 L CNN
F 1 "1u" H 12600 8050 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 12550 8150 50  0001 C CNN
F 3 "" H 12550 8150 50  0001 C CNN
	1    12550 8150
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR024
U 1 1 4957E1A1
P 11700 8650
F 0 "#PWR024" H 11700 8650 30  0001 C CNN
F 1 "GND" H 11700 8580 30  0001 C CNN
F 2 "" H 11700 8650 50  0001 C CNN
F 3 "" H 11700 8650 50  0001 C CNN
	1    11700 8650
	1    0    0    -1  
$EndComp
Text Label 11750 9350 0    60   ~ 0
CTSB_IN
$Comp
L Z80CTCDART-rescue:MAX232-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U10
U 1 1 4957E1A0
P 10900 8650
F 0 "U10" H 10900 9500 70  0000 C CNN
F 1 "MAX232" H 10900 7800 70  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 10900 8650 50  0001 C CNN
F 3 "" H 10900 8650 50  0001 C CNN
	1    10900 8650
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR025
U 1 1 4957E19F
P 12800 9250
F 0 "#PWR025" H 12800 9250 30  0001 C CNN
F 1 "GND" H 12800 9180 30  0001 C CNN
F 2 "" H 12800 9250 50  0001 C CNN
F 3 "" H 12800 9250 50  0001 C CNN
	1    12800 9250
	1    0    0    -1  
$EndComp
Text Label 17500 6850 0    60   ~ 0
CLK_4.9152MHz
Text Label 20050 4500 0    60   ~ 0
IEO#
Text Label 18300 4400 0    60   ~ 0
IEI#
Text Label 18300 5100 0    60   ~ 0
IEO_DART
Text Label 18300 4900 0    60   ~ 0
IEO_CTC
Text Label 9000 3000 0    60   ~ 0
CS_DART#
Text Label 9050 2650 0    60   ~ 0
CS_CTC#
Text Label 8100 3400 0    60   ~ 0
bA2
$Comp
L Z80CTCDART-rescue:74LS04-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U15
U 6 1 4957D965
P 4800 11450
F 0 "U15" H 4995 11565 60  0000 C CNN
F 1 "74LS04" H 4990 11325 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4800 11450 50  0001 C CNN
F 3 "" H 4800 11450 50  0001 C CNN
	6    4800 11450
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:74LS04-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U15
U 4 1 4957D95C
P 4800 10650
F 0 "U15" H 4995 10765 60  0000 C CNN
F 1 "74LS04" H 4990 10525 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4800 10650 50  0001 C CNN
F 3 "" H 4800 10650 50  0001 C CNN
	4    4800 10650
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:74LS04-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U15
U 1 1 4957D949
P 8800 3400
F 0 "U15" H 8995 3515 60  0000 C CNN
F 1 "74LS04" H 8990 3275 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8800 3400 50  0001 C CNN
F 3 "" H 8800 3400 50  0001 C CNN
	1    8800 3400
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:Z80-DART-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U9
U 1 1 4957D5F1
P 15100 2550
F 0 "U9" H 15100 3750 60  0000 C CNN
F 1 "Z80-DART" H 15100 1350 60  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm" H 15100 2550 50  0001 C CNN
F 3 "" H 15100 2550 50  0001 C CNN
	1    15100 2550
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:Z80-CTC-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U7
U 1 1 4957D5E7
P 11350 2650
F 0 "U7" H 11350 3750 60  0000 C CNN
F 1 "Z80-CTC" H 11350 1550 60  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 11350 2650 50  0001 C CNN
F 3 "" H 11350 2650 50  0001 C CNN
	1    11350 2650
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:GND-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue #PWR030
U 1 1 4957D50E
P 16000 7000
F 0 "#PWR030" H 16000 7000 30  0001 C CNN
F 1 "GND" H 16000 6930 30  0001 C CNN
F 2 "" H 16000 7000 50  0001 C CNN
F 3 "" H 16000 7000 50  0001 C CNN
	1    16000 7000
	1    0    0    -1  
$EndComp
NoConn ~ 16700 6550
NoConn ~ 16700 6450
NoConn ~ 16000 6450
NoConn ~ 16000 6550
NoConn ~ 16000 6750
NoConn ~ 16000 6850
NoConn ~ 16700 6850
NoConn ~ 16700 6750
$Comp
L Z80CTCDART-rescue:DIL14-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U8
U 1 1 4957D50C
P 16350 6650
F 0 "U8" H 16350 7050 60  0000 C CNN
F 1 "4.9152 MHz" V 16350 6650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 16350 6650 50  0001 C CNN
F 3 "" H 16350 6650 50  0001 C CNN
	1    16350 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	15750 7950 16150 7950
Wire Wire Line
	12150 7950 12550 7950
$Comp
L Z80CTCDART-rescue:CONN_5X2-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue X7
U 1 1 5E653345
P 14550 10350
F 0 "X7" H 14550 10650 60  0000 C CNN
F 1 "RS-232 A" V 14550 10350 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Horizontal" H 14550 10350 50  0001 C CNN
F 3 "" H 14550 10350 50  0001 C CNN
	1    14550 10350
	1    0    0    -1  
$EndComp
Wire Wire Line
	13500 10350 14150 10350
Wire Wire Line
	13500 10250 14150 10250
Wire Wire Line
	15600 10250 14950 10250
Wire Wire Line
	15600 10350 14950 10350
NoConn ~ 11300 10450
NoConn ~ 11300 10150
NoConn ~ 14950 10150
Text Notes 10650 10800 0    60   ~ 0
IBM PC pin\nassignments
Wire Wire Line
	12250 2800 13050 2800
$Comp
L power:VCC #PWR0105
U 1 1 620E6613
P 16700 6350
F 0 "#PWR0105" H 16700 6200 50  0001 C CNN
F 1 "VCC" H 16715 6523 50  0000 C CNN
F 2 "" H 16700 6350 50  0001 C CNN
F 3 "" H 16700 6350 50  0001 C CNN
	1    16700 6350
	1    0    0    -1  
$EndComp
Connection ~ 16850 6950
Wire Wire Line
	6100 5850 6100 2850
Wire Wire Line
	6100 2850 6200 2850
Wire Wire Line
	2800 5850 6100 5850
Text Label 1100 5550 0    60   ~ 0
CLK
Wire Wire Line
	1000 5550 1400 5550
Text Label 2850 5550 0    60   ~ 0
bCLK
Wire Wire Line
	2800 5550 3200 5550
Wire Wire Line
	7300 2750 8350 2750
Wire Wire Line
	8350 2750 8350 2900
Connection ~ 8350 2750
Wire Wire Line
	8050 2550 8350 2550
Text Label 8100 2550 0    60   ~ 0
bA2
$Comp
L conn:CONN_01X02 P10
U 1 1 632EBE75
P 13250 2850
F 0 "P10" V 13250 2950 50  0000 L CNN
F 1 "TIMER3" V 13350 2750 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 13250 2850 50  0001 C CNN
F 3 "" H 13250 2850 50  0001 C CNN
	1    13250 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	15850 4500 15850 4600
Connection ~ 15850 4600
Wire Wire Line
	15850 4600 15850 4800
Connection ~ 15850 4800
Wire Wire Line
	15850 4800 15850 5000
Connection ~ 15850 5000
Connection ~ 15850 5200
Wire Wire Line
	15850 5200 15850 5400
$Comp
L power:VCC #PWR0106
U 1 1 63443665
P 15850 4500
F 0 "#PWR0106" H 15850 4350 50  0001 C CNN
F 1 "VCC" H 15865 4673 50  0000 C CNN
F 2 "" H 15850 4500 50  0001 C CNN
F 3 "" H 15850 4500 50  0001 C CNN
	1    15850 4500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0107
U 1 1 634FC924
P 11700 7950
F 0 "#PWR0107" H 11700 7800 50  0001 C CNN
F 1 "VCC" H 11715 8123 50  0000 C CNN
F 2 "" H 11700 7950 50  0001 C CNN
F 3 "" H 11700 7950 50  0001 C CNN
	1    11700 7950
	1    0    0    -1  
$EndComp
Connection ~ 11700 7950
$Comp
L power:VCC #PWR0108
U 1 1 635033FF
P 15300 7950
F 0 "#PWR0108" H 15300 7800 50  0001 C CNN
F 1 "VCC" H 15315 8123 50  0000 C CNN
F 2 "" H 15300 7950 50  0001 C CNN
F 3 "" H 15300 7950 50  0001 C CNN
	1    15300 7950
	1    0    0    -1  
$EndComp
Connection ~ 15300 7950
Wire Wire Line
	9250 3400 9250 3200
Wire Wire Line
	9250 3200 8350 3200
Wire Wire Line
	8350 3200 8350 3100
Wire Wire Line
	8050 2550 8050 3400
Wire Wire Line
	8950 2650 9500 2650
$Comp
L power:VCC #PWR0109
U 1 1 638D1B5A
P 10750 1600
F 0 "#PWR0109" H 10750 1450 50  0001 C CNN
F 1 "VCC" H 10765 1773 50  0000 C CNN
F 2 "" H 10750 1600 50  0001 C CNN
F 3 "" H 10750 1600 50  0001 C CNN
	1    10750 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	13550 1500 14200 1500
Wire Wire Line
	13550 1600 14200 1600
Wire Wire Line
	13550 1700 14200 1700
Wire Wire Line
	13550 1800 14200 1800
Wire Wire Line
	13550 1900 14200 1900
Wire Wire Line
	13550 2000 14200 2000
Wire Wire Line
	13550 2100 14200 2100
Wire Wire Line
	13550 2200 14200 2200
Text Label 13600 2200 0    60   ~ 0
bD7
Text Label 13600 2100 0    60   ~ 0
bD6
Text Label 13600 2000 0    60   ~ 0
bD5
Text Label 13600 1900 0    60   ~ 0
bD4
Text Label 13600 1800 0    60   ~ 0
bD3
Text Label 13600 1700 0    60   ~ 0
bD2
Text Label 13600 1600 0    60   ~ 0
bD1
Text Label 13600 1500 0    60   ~ 0
bD0
Wire Wire Line
	20000 4500 20000 5000
Wire Wire Line
	15850 5000 15850 5200
Text Label 15350 9150 0    60   ~ 0
RTSA_OUT
NoConn ~ 4350 11450
NoConn ~ 5250 11450
Wire Wire Line
	16700 6950 16850 6950
Wire Wire Line
	16850 6650 16700 6650
Wire Wire Line
	16000 6650 15850 6650
Wire Wire Line
	15850 6650 15850 6950
Wire Wire Line
	15850 6950 16000 6950
Connection ~ 16000 6950
NoConn ~ 8600 2300
NoConn ~ 14150 10150
NoConn ~ 10500 10150
$Comp
L Z80CTCDART-rescue:74LS04-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U15
U 2 1 4957D94F
P 20450 5000
F 0 "U15" H 20645 5115 60  0000 C CNN
F 1 "74LS04" H 20640 4875 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 20450 5000 50  0001 C CNN
F 3 "" H 20450 5000 50  0001 C CNN
	2    20450 5000
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:74LS04-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U15
U 3 1 4957D953
P 4800 10250
F 0 "U15" H 4995 10365 60  0000 C CNN
F 1 "74LS04" H 4990 10125 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4800 10250 50  0001 C CNN
F 3 "" H 4800 10250 50  0001 C CNN
	3    4800 10250
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:74LS04-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue U15
U 5 1 4957D961
P 4800 11050
F 0 "U15" H 4995 11165 60  0000 C CNN
F 1 "74LS04" H 4990 10925 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4800 11050 50  0001 C CNN
F 3 "" H 4800 11050 50  0001 C CNN
	5    4800 11050
	1    0    0    -1  
$EndComp
NoConn ~ 4350 10250
NoConn ~ 4350 10650
NoConn ~ 4350 11050
NoConn ~ 5250 10250
NoConn ~ 5250 10650
NoConn ~ 5250 11050
Text Notes 18500 4150 0    60   ~ 0
IA: HIGH DURING INTERRUPT ACTIVE\nLOW DURING NORMAL OPERATION
Connection ~ 20000 5000
Wire Wire Line
	21300 5000 20900 5000
Text Label 20950 5000 0    60   ~ 0
IA
Text Label 16050 3500 0    60   ~ 0
DTRB#
Wire Wire Line
	16000 3500 16650 3500
Text Label 16050 3600 0    60   ~ 0
DCDB#
Wire Wire Line
	16000 3600 16650 3600
Text Label 18650 2350 0    60   ~ 0
DTRB#
Wire Wire Line
	18600 2350 19250 2350
Text Label 17200 2350 0    60   ~ 0
DCDB#
Wire Wire Line
	17150 2350 17800 2350
Text Notes 14300 10800 0    60   ~ 0
IBM PC pin\nassignments
Wire Wire Line
	6200 4550 6200 6150
Wire Wire Line
	2800 5750 5600 5750
Wire Wire Line
	5600 5750 5600 6050
Wire Wire Line
	5600 6250 5200 6250
Text Label 5250 6250 0    60   ~ 0
IA
$Comp
L conn:CONN_01X03 J1
U 1 1 61A8A4E9
P 20750 5500
F 0 "J1" H 20828 5541 50  0000 L CNN
F 1 "INT SEL" H 20828 5450 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 20750 5500 50  0001 C CNN
F 3 "" H 20750 5500 50  0001 C CNN
	1    20750 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	20550 5400 20200 5400
Wire Wire Line
	20200 5600 20550 5600
Text Label 20250 5600 0    60   ~ 0
NMI#
Text Notes 10150 4000 0    60   ~ 0
X6 - DART baud rate clock source selection
Text Notes 9900 9950 0    60   ~ 0
X3 - DART channel B (RS-232 levels)
Text Notes 17150 1450 0    60   ~ 0
X4 - CTC, DART channel A (TTL levels)
Text Notes 10500 5800 0    60   ~ 0
X5 - oscillator divider selection
Text Notes 13600 9950 0    60   ~ 0
X7 - DART channel A (RS-232 levels)
Wire Wire Line
	1600 9350 5350 9350
$Comp
L Z80CTCDART-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C12
U 1 1 61E81727
P 4100 7900
F 0 "C12" H 4150 8000 50  0000 L CNN
F 1 "0.1u" H 4150 7800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4100 7900 60  0001 C CNN
F 3 "" H 4100 7900 60  0001 C CNN
	1    4100 7900
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:C-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue C13
U 1 1 61E81731
P 4350 7900
F 0 "C13" H 4400 8000 50  0000 L CNN
F 1 "0.1u" H 4400 7800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4350 7900 60  0001 C CNN
F 3 "" H 4350 7900 60  0001 C CNN
	1    4350 7900
	1    0    0    -1  
$EndComp
Connection ~ 4100 7700
Wire Wire Line
	4100 7700 4350 7700
Connection ~ 4100 8100
Wire Wire Line
	4100 8100 4350 8100
Connection ~ 4350 7700
Wire Wire Line
	4350 7700 4600 7700
Connection ~ 4350 8100
Wire Wire Line
	4350 8100 4600 8100
Wire Wire Line
	12250 3100 12900 3100
Text Notes 19750 5850 0    60   ~ 0
NOTE: INT# AND NMI# RELY ON 4700\nOHM PULL UP ON PROCESSOR
NoConn ~ 4300 3650
NoConn ~ 4300 3750
NoConn ~ 4300 3850
Wire Wire Line
	1000 5650 1400 5650
Wire Wire Line
	2800 5650 3200 5650
NoConn ~ 3200 5650
NoConn ~ 1000 5650
Text Label 17550 9800 0    60   ~ 0
VCC
Text Label 18300 8700 0    60   ~ 0
GND
Text Notes 17450 9500 0    60   ~ 0
FTDI 5V SERIAL UART TO\nUSB CABLE INTERFACE
Wire Wire Line
	18250 8900 18750 8900
Text Notes 17050 8500 0    60   ~ 0
DTECH FTDI USB to TTL Serial 5V Adapter Cable \n6 Pin 0.1 inch Pitch Female Socket Header \nUART IC FT232RL Chip
$Comp
L Connector_Generic:Conn_02x06_Odd_Even J4
U 1 1 610FD61B
P 18050 8900
F 0 "J4" H 18100 9200 60  0000 C CNN
F 1 "TTL SERIAL" V 18100 8850 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x06_P2.54mm_Horizontal" H 18050 8900 60  0001 C CNN
F 3 "" H 18050 8900 60  0001 C CNN
	1    18050 8900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	17750 9800 17450 9800
Wire Wire Line
	18750 8700 18250 8700
Text Label 17550 9900 0    60   ~ 0
VCC
Text Label 17300 8700 0    60   ~ 0
GND
Wire Wire Line
	17750 8900 17250 8900
Wire Wire Line
	17450 9900 17750 9900
Wire Wire Line
	17250 8700 17750 8700
Wire Wire Line
	17250 9200 17750 9200
Wire Wire Line
	17250 8800 17750 8800
Wire Wire Line
	17250 9100 17750 9100
Wire Wire Line
	17250 9000 17750 9000
Text Label 17300 9000 0    60   ~ 0
RXDB
Text Label 17300 8800 0    60   ~ 0
RTSB#
Text Label 17300 9100 0    60   ~ 0
TXDB
Text Label 17300 9200 0    60   ~ 0
CTSB#
Wire Wire Line
	18250 9200 18750 9200
Wire Wire Line
	18250 8800 18750 8800
Wire Wire Line
	18250 9100 18750 9100
Wire Wire Line
	18250 9000 18750 9000
Text Label 18300 9000 0    60   ~ 0
RXDA
Text Label 18300 8800 0    60   ~ 0
RTSA#
Text Label 18300 9100 0    60   ~ 0
TXDA
Text Label 18300 9200 0    60   ~ 0
CTSA#
$Comp
L Connector_Generic:Conn_02x02_Odd_Even J2
U 1 1 6248EFFF
P 17950 9800
F 0 "J2" H 18000 9900 60  0000 C CNN
F 1 "TTLSERPWR" H 18000 9600 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 17950 9800 60  0001 C CNN
F 3 "" H 17950 9800 60  0001 C CNN
	1    17950 9800
	1    0    0    -1  
$EndComp
Text Label 17300 8900 0    60   ~ 0
PWRB
Text Label 18300 8900 0    60   ~ 0
PWRA
Wire Wire Line
	18750 9900 18250 9900
Text Label 18300 9900 0    60   ~ 0
PWRB
Wire Wire Line
	18250 9800 18750 9800
Text Label 18300 9800 0    60   ~ 0
PWRA
$Comp
L device:LED D3
U 1 1 629F83C9
P 20150 6650
F 0 "D3" H 20150 6750 50  0000 C CNN
F 1 "LED" H 20150 6550 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 20150 6650 60  0001 C CNN
F 3 "" H 20150 6650 60  0001 C CNN
	1    20150 6650
	0    -1   -1   0   
$EndComp
$Comp
L Z80CTCDART-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue R3
U 1 1 629F83D3
P 20150 6250
F 0 "R3" V 20230 6250 50  0000 C CNN
F 1 "470" V 20150 6250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 20150 6250 60  0001 C CNN
F 3 "" H 20150 6250 60  0001 C CNN
	1    20150 6250
	-1   0    0    1   
$EndComp
$Comp
L Z80CTCDART-rescue:VCC-power-Z80SERIAL3-rescue-Z80DARTCTC-rescue #PWR05
U 1 1 629F83DD
P 20150 6000
F 0 "#PWR05" H 20150 6100 30  0001 C CNN
F 1 "VCC" H 20150 6100 30  0000 C CNN
F 2 "" H 20150 6000 60  0001 C CNN
F 3 "" H 20150 6000 60  0001 C CNN
	1    20150 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	20000 6800 20150 6800
Wire Wire Line
	18800 5600 18800 6700
Connection ~ 18800 5600
Connection ~ 18800 6700
Wire Wire Line
	18800 6700 18800 6900
$Comp
L power:VCC #PWR0110
U 1 1 62F2E8DB
P 16000 6350
F 0 "#PWR0110" H 16000 6200 50  0001 C CNN
F 1 "VCC" H 16015 6523 50  0000 C CNN
F 2 "" H 16000 6350 50  0001 C CNN
F 3 "" H 16000 6350 50  0001 C CNN
	1    16000 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	16850 6750 16850 6650
Connection ~ 16850 6750
Wire Wire Line
	17150 2150 17800 2150
Text Label 17200 2150 0    60   ~ 0
TXCA#
Text Notes 17250 3200 0    60   ~ 0
NOTE: DEFAULT JUMPER ON PINS 11-12\nTO CONNECT TXCA# AND RXCA#
Text Notes 13250 7050 0    60   ~ 0
NOTE: JUMPER DEFAULTS for 38400 bps\nwith 50 Hz System Tick:\n- Assumes 4.9152 MHz oscillator\n- Jumper X5 pins 15-16 and pins 9-11 (/8)\n- Jumper P4 (or wire X5 pin 3 (PHI_X) \n     to X4 pin 7 (CTC_TG2))\n- Jumper P10 (or wire X4 pin 8 \n     (CTC_ZC2) to X4 pin 9 (CTC_TG3))\n- Configure the interrupt vector\n- Configure channel 3 to divide by 256\n- Configure channel 4 to divide by 48 and interrupt.\n- Refer to ROMWBW ctc.asm driver for example.
Text Notes 12500 6450 0    60   ~ 0
/2\n/4\n/8\n/16
Text Notes 12500 7250 0    60   ~ 0
/32\n/64\n/128\n/256
Text Notes 13300 5550 0    60   ~ 0
First jumper pins 15-16 of X5 to\nselect the oscillator module. A \nsecond jumper on X5 selects the\ndivider output for PHI_X.\nThe /16 or /64 option is \nprogrammed into the Z80-DART\nregisters.\n\nBAUD   PHI_X (Hz)  /16 or /64   X5 Jumper\n300       19200        /64       3-4\n600       38400        /64       3-5\n1200     19200         /16       3-4\n2400     38400         /16       3-5\n4800     76800         /16       6-8\n9600     153600        /16       7-8\n19200    307200       /16       8-10\n*38400   614400       /16       9-11 (default)
Text Notes 13000 3400 0    60   ~ 0
NOTE:\nDEFAULT\nJUMPER\nON P10
$Comp
L conn:CONN_01X02 P4
U 1 1 620145A5
P 13250 1450
F 0 "P4" V 13250 1550 50  0000 L CNN
F 1 "TIMER2" V 13350 1350 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 13250 1450 50  0001 C CNN
F 3 "" H 13250 1450 50  0001 C CNN
	1    13250 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	13050 2900 12900 2900
Wire Wire Line
	12900 2900 12900 3100
Wire Wire Line
	13050 1500 13050 2700
Wire Wire Line
	12250 2700 13050 2700
Wire Wire Line
	12650 1400 13050 1400
Text Label 12700 1400 0    60   ~ 0
PHI_X
Text Notes 12900 1200 0    60   ~ 0
NOTE:\nDEFAULT\nJUMPER\nON P4
Wire Wire Line
	9550 4500 10350 4500
Wire Wire Line
	11150 4500 11800 4500
Wire Wire Line
	11150 4600 11800 4600
Wire Wire Line
	9550 4400 10350 4400
Wire Wire Line
	9550 4600 10350 4600
Wire Wire Line
	11150 4400 11800 4400
Wire Wire Line
	9550 4300 10350 4300
Wire Wire Line
	11150 4300 11800 4300
Wire Wire Line
	9550 4200 10350 4200
Wire Wire Line
	11150 4200 11800 4200
Wire Wire Line
	11800 5500 11150 5500
Wire Wire Line
	10350 5600 9550 5600
Wire Wire Line
	9550 5400 10350 5400
Wire Wire Line
	11150 5200 11800 5200
Wire Wire Line
	9550 5000 10350 5000
Wire Wire Line
	9550 5500 10350 5500
Wire Wire Line
	11150 5400 11800 5400
Wire Wire Line
	9550 5300 10350 5300
Wire Wire Line
	11150 5300 11800 5300
Wire Wire Line
	9550 5200 10350 5200
Wire Wire Line
	11150 5100 11800 5100
Wire Wire Line
	9550 5100 10350 5100
Wire Wire Line
	11150 5000 11800 5000
Wire Wire Line
	11150 5600 11800 5600
Text Label 9600 4500 0    60   ~ 0
PHI_X
Text Label 11200 4500 0    60   ~ 0
PHI_X
Text Label 11200 4600 0    60   ~ 0
RXTXCB#
Text Label 9600 4400 0    60   ~ 0
TXCA#
Text Label 9600 4600 0    60   ~ 0
CTC_ZC1
Text Label 11200 4400 0    60   ~ 0
CTC_ZC0
Text Label 11200 4300 0    60   ~ 0
PHI_X
Text Label 9600 4300 0    60   ~ 0
PHI_X
Text Label 9600 4200 0    60   ~ 0
CTC_TG1
Text Label 11200 4200 0    60   ~ 0
CTC_TG0
Text Label 11200 5500 0    60   ~ 0
bCLK
Text Label 9600 5600 0    60   ~ 0
CLK_4.9152MHz
Text Label 9600 5400 0    60   ~ 0
PHI_X
Text Label 11200 5200 0    60   ~ 0
PHI_X
Text Label 9600 5000 0    60   ~ 0
PHI_X
Text Label 9600 5500 0    60   ~ 0
Q0A
Text Label 11200 5400 0    60   ~ 0
Q1A
Text Label 9600 5300 0    60   ~ 0
Q2A
Text Label 11200 5300 0    60   ~ 0
Q3A
Text Label 9600 5200 0    60   ~ 0
Q0B
Text Label 11200 5100 0    60   ~ 0
Q1B
Text Label 9600 5100 0    60   ~ 0
Q2B
Text Label 11200 5000 0    60   ~ 0
Q3B
Text Label 11200 5600 0    60   ~ 0
CPA
$Comp
L Z80CTCDART-rescue:CONN_5X2-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue X6
U 1 1 622AB80C
P 10750 4400
F 0 "X6" H 10750 4700 60  0000 C CNN
F 1 "BAUD_CLK" V 10750 4400 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 10750 4400 50  0001 C CNN
F 3 "" H 10750 4400 50  0001 C CNN
	1    10750 4400
	1    0    0    -1  
$EndComp
NoConn ~ 9550 4900
NoConn ~ 11800 4900
Wire Wire Line
	11150 4900 11800 4900
Wire Wire Line
	9550 4900 10350 4900
$Comp
L Z80CTCDART-rescue:CONN_8X2-Zilog-Peripherals-rescue-Zilog-Peripherals-rescue X5
U 1 1 62362E6E
P 10750 5250
F 0 "X5" H 10750 5700 60  0000 C CNN
F 1 "OSC_DIV" V 10750 5250 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 10750 5250 50  0001 C CNN
F 3 "" H 10750 5250 50  0001 C CNN
	1    10750 5250
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue R4
U 1 1 61C1A3A0
P 12350 10500
F 0 "R4" V 12430 10500 50  0000 C CNN
F 1 "470" V 12350 10500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 12350 10500 60  0001 C CNN
F 3 "" H 12350 10500 60  0001 C CNN
	1    12350 10500
	-1   0    0    1   
$EndComp
$Comp
L Z80CTCDART-rescue:VCC-power-Z80SERIAL3-rescue-Z80DARTCTC-rescue #PWR012
U 1 1 61C1A3AA
P 12350 10250
F 0 "#PWR012" H 12350 10350 30  0001 C CNN
F 1 "VCC" H 12350 10350 30  0000 C CNN
F 2 "" H 12350 10250 60  0001 C CNN
F 3 "" H 12350 10250 60  0001 C CNN
	1    12350 10250
	1    0    0    -1  
$EndComp
$Comp
L Z80CTCDART-rescue:R-device-Z80SERIAL-rescue-Z80SERIAL2-rescue-Z80SERIAL3-rescue-Z80DARTCTC-rescue R8
U 1 1 61CD7C53
P 12850 10500
F 0 "R8" V 12930 10500 50  0000 C CNN
F 1 "470" V 12850 10500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 12850 10500 60  0001 C CNN
F 3 "" H 12850 10500 60  0001 C CNN
	1    12850 10500
	-1   0    0    1   
$EndComp
$Comp
L Z80CTCDART-rescue:VCC-power-Z80SERIAL3-rescue-Z80DARTCTC-rescue #PWR015
U 1 1 61CD7C5D
P 12850 10250
F 0 "#PWR015" H 12850 10350 30  0001 C CNN
F 1 "VCC" H 12850 10350 30  0000 C CNN
F 2 "" H 12850 10250 60  0001 C CNN
F 3 "" H 12850 10250 60  0001 C CNN
	1    12850 10250
	1    0    0    -1  
$EndComp
Wire Wire Line
	12850 10950 13250 10950
Text Label 12900 10950 0    60   ~ 0
DTRA#
Text Label 12000 10950 0    60   ~ 0
DTRB#
$Comp
L conn:CONN_02X03 J3
U 1 1 62297B86
P 12600 10850
F 0 "J3" H 12550 11050 50  0000 L CNN
F 1 "DTR SEL" H 12450 10650 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 12600 10850 50  0001 C CNN
F 3 "" H 12600 10850 50  0001 C CNN
	1    12600 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 10450 10500 10450
Wire Wire Line
	13350 10450 13350 10850
Wire Wire Line
	13350 10850 12850 10850
Wire Wire Line
	13350 10450 14150 10450
Wire Wire Line
	11950 10950 12350 10950
Wire Wire Line
	12350 10850 9750 10850
Wire Wire Line
	9750 10850 9750 10450
Text Notes 11900 11650 0    60   ~ 0
NOTE: J3 CONFIGURES DTR FOR \nRS-232 A AND B CHANNELS.\nDEFAULT IS 1-3 AND 2-4.  TTL\nDTR AVAILABLE FOR CUSTOM\nAPPLICATIONS.
Text Notes 7450 5700 0    60   ~ 0
The Z80-DART's clock pins need to be\nconnected to PHI_X using header X6.\nFor the FIXED baud rate jumper pins\n3-5 or 5-7 for channel A and 8-10 for\nchannel B of header X6. For CTC baud\nrate to DART clock for channel A set\nwith pins 2-4 and channel B with pins\n1-3. This assumes pins 11-12 are closed\non X4 per default.
Text Notes 11900 4450 0    60   ~ 0
X6 DEFAULT:\npins 3-5 FIXED channel A\npins 8-10 FIXED channel B
Text Notes 11950 5150 0    60   ~ 0
X5 DEFAULT:\npins 15-16 4.9152 MHz\npins 9-11 /8 divider
Text Notes 19350 1800 0    60   ~ 0
X4 DEFAULT:\npins 11-12 share RX & TX clock
$EndSCHEMATC
