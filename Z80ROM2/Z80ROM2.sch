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
L Z80ROM2-rescue:74LS244-RESCUE-Z80PROC-Z80ROM-rescue U4
U 1 1 6039713A
P 2200 3250
F 0 "U4" H 2250 3050 60  0000 C CNN
F 1 "74LS244" H 2300 2850 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2200 3250 60  0001 C CNN
F 3 "" H 2200 3250 60  0001 C CNN
	1    2200 3250
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:74LS245-RESCUE-Z80PROC-Z80ROM-rescue U6
U 1 1 603971FD
P 2200 5850
F 0 "U6" H 2300 6425 60  0000 L BNN
F 1 "74LS245" H 2100 5400 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2200 5850 60  0001 C CNN
F 3 "" H 2200 5850 60  0001 C CNN
	1    2200 5850
	1    0    0    -1  
$EndComp
Text Label 1200 7250 0    60   ~ 0
/WR
Text Label 1200 7350 0    60   ~ 0
/RD
Text Label 1200 7050 0    60   ~ 0
/IORQ
Text Label 1200 3050 0    60   ~ 0
A3
Text Label 1200 3250 0    60   ~ 0
A5
Text Label 1200 3350 0    60   ~ 0
A6
Text Label 1200 3450 0    60   ~ 0
A7
Text Label 1200 3150 0    60   ~ 0
A4
Text Label 1200 5450 0    60   ~ 0
D1
Text Label 1200 5550 0    60   ~ 0
D2
Text Label 1200 5650 0    60   ~ 0
D3
Text Label 1200 5350 0    60   ~ 0
D0
Text Label 1200 5850 0    60   ~ 0
D5
Text Label 1200 5950 0    60   ~ 0
D6
Text Label 1200 6050 0    60   ~ 0
D7
Text Label 1200 5750 0    60   ~ 0
D4
Text Label 7650 13400 0    60   ~ 0
A9
Text Label 7650 13300 0    60   ~ 0
A10
Text Label 8950 13300 0    60   ~ 0
A11
Text Label 7650 13500 0    60   ~ 0
A8
Text Label 8950 13500 0    60   ~ 0
A13
Text Label 8950 13600 0    60   ~ 0
A14
Text Label 8950 13700 0    60   ~ 0
A15
Text Label 8950 13400 0    60   ~ 0
A12
Text Label 7650 14200 0    60   ~ 0
A1
Text Label 7650 14100 0    60   ~ 0
A2
Text Label 7650 14000 0    60   ~ 0
A3
Text Label 7650 14300 0    60   ~ 0
A0
Text Label 7650 13800 0    60   ~ 0
A5
Text Label 7650 13700 0    60   ~ 0
A6
Text Label 7650 13600 0    60   ~ 0
A7
Text Label 7650 13900 0    60   ~ 0
A4
Text Label 7650 14400 0    60   ~ 0
GND
Text Label 7650 14500 0    60   ~ 0
/RFSH
Text Label 8950 15000 0    60   ~ 0
/HALT
Text Label 7650 15000 0    60   ~ 0
/BUSACK
Text Label 7650 14600 0    60   ~ 0
/M1
Text Label 7650 14800 0    60   ~ 0
/BUSRQ
Text Label 8950 14900 0    60   ~ 0
/NMI
Text Label 8950 14800 0    60   ~ 0
/INT
Text Label 7650 14900 0    60   ~ 0
/WAIT
Text Label 7650 14700 0    60   ~ 0
/RESET
Text Label 8950 15100 0    60   ~ 0
/MREQ
Text Label 7650 15100 0    60   ~ 0
/WR
Text Label 7650 15200 0    60   ~ 0
/RD
Text Label 8950 15200 0    60   ~ 0
/IORQ
Text Label 8950 14700 0    60   ~ 0
D1
Text Label 8950 14400 0    60   ~ 0
D2
Text Label 8950 14000 0    60   ~ 0
D3
Text Label 8950 14600 0    60   ~ 0
D0
Text Label 8950 14100 0    60   ~ 0
D5
Text Label 8950 14200 0    60   ~ 0
D6
Text Label 8950 14500 0    60   ~ 0
D7
Text Label 8950 13900 0    60   ~ 0
D4
Text Label 8950 14300 0    60   ~ 0
VCC
Text Label 8950 13800 0    60   ~ 0
CLK
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C1
U 1 1 603A8E72
P 3200 13850
F 0 "C1" H 3250 13950 50  0000 L CNN
F 1 "0.1u" H 3250 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3200 13850 60  0001 C CNN
F 3 "" H 3200 13850 60  0001 C CNN
	1    3200 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C2
U 1 1 603A8ED5
P 3450 13850
F 0 "C2" H 3500 13950 50  0000 L CNN
F 1 "0.1u" H 3500 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3450 13850 60  0001 C CNN
F 3 "" H 3450 13850 60  0001 C CNN
	1    3450 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C3
U 1 1 603A8F23
P 3700 13850
F 0 "C3" H 3750 13950 50  0000 L CNN
F 1 "0.1u" H 3750 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3700 13850 60  0001 C CNN
F 3 "" H 3700 13850 60  0001 C CNN
	1    3700 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C4
U 1 1 603A8F29
P 3950 13850
F 0 "C4" H 4000 13950 50  0000 L CNN
F 1 "0.1u" H 4000 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3950 13850 60  0001 C CNN
F 3 "" H 3950 13850 60  0001 C CNN
	1    3950 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C5
U 1 1 603A8FA5
P 4200 13850
F 0 "C5" H 4250 13950 50  0000 L CNN
F 1 "0.1u" H 4250 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4200 13850 60  0001 C CNN
F 3 "" H 4200 13850 60  0001 C CNN
	1    4200 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C6
U 1 1 603A8FAB
P 4450 13850
F 0 "C6" H 4500 13950 50  0000 L CNN
F 1 "0.1u" H 4500 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4450 13850 60  0001 C CNN
F 3 "" H 4450 13850 60  0001 C CNN
	1    4450 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:GND-power #PWR05
U 1 1 603A93CE
P 4700 14100
F 0 "#PWR05" H 4700 14100 30  0001 C CNN
F 1 "GND" H 4700 14030 30  0001 C CNN
F 2 "" H 4700 14100 60  0001 C CNN
F 3 "" H 4700 14100 60  0001 C CNN
	1    4700 14100
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:VCC-power #PWR04
U 1 1 603A9412
P 4700 13650
F 0 "#PWR04" H 4700 13750 30  0001 C CNN
F 1 "VCC" H 4700 13750 30  0000 C CNN
F 2 "" H 4700 13650 60  0001 C CNN
F 3 "" H 4700 13650 60  0001 C CNN
	1    4700 13650
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 603A9456
P 5450 13650
F 0 "#FLG02" H 5450 13745 30  0001 C CNN
F 1 "PWR_FLAG" H 5450 13830 30  0000 C CNN
F 2 "" H 5450 13650 60  0001 C CNN
F 3 "" H 5450 13650 60  0001 C CNN
	1    5450 13650
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 603A949A
P 2950 14050
F 0 "#FLG01" H 2950 14145 30  0001 C CNN
F 1 "PWR_FLAG" H 2950 14230 30  0000 C CNN
F 2 "" H 2950 14050 60  0001 C CNN
F 3 "" H 2950 14050 60  0001 C CNN
	1    2950 14050
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C7
U 1 1 6039A89E
P 4700 13850
F 0 "C7" H 4750 13950 50  0000 L CNN
F 1 "0.1u" H 4750 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4700 13850 60  0001 C CNN
F 3 "" H 4700 13850 60  0001 C CNN
	1    4700 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:CP-device-Z80ROM-rescue C8
U 1 1 6039BD2A
P 6450 13850
F 0 "C8" H 6500 13950 50  0000 L CNN
F 1 "10u" H 6500 13750 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6450 13850 60  0001 C CNN
F 3 "" H 6450 13850 60  0001 C CNN
	1    6450 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:CP-device-Z80ROM-rescue C9
U 1 1 603A3D80
P 6700 13850
F 0 "C9" H 6750 13950 50  0000 L CNN
F 1 "10u" H 6750 13750 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6700 13850 60  0001 C CNN
F 3 "" H 6700 13850 60  0001 C CNN
	1    6700 13850
	1    0    0    -1  
$EndComp
$Comp
L device:LED D1
U 1 1 603A5584
P 7250 14350
F 0 "D1" H 7250 14450 50  0000 C CNN
F 1 "LED" H 7250 14250 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 7250 14350 60  0001 C CNN
F 3 "" H 7250 14350 60  0001 C CNN
	1    7250 14350
	0    -1   -1   0   
$EndComp
$Comp
L Z80ROM2-rescue:R-device-Z80ROM-rescue R5
U 1 1 603A596D
P 7250 13900
F 0 "R5" V 7330 13900 50  0000 C CNN
F 1 "470" V 7250 13900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 7250 13900 60  0001 C CNN
F 3 "" H 7250 13900 60  0001 C CNN
	1    7250 13900
	-1   0    0    1   
$EndComp
$Comp
L Z80ROM2-rescue:CONN_25X2-conn P1
U 1 1 603D6D37
P 8450 14500
F 0 "P1" H 8450 15800 60  0000 C CNN
F 1 "Z80 BUS INTERFACE" V 8450 14500 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x25_P2.54mm_Horizontal" H 8450 14500 60  0001 C CNN
F 3 "" H 8450 14500 60  0001 C CNN
	1    8450 14500
	1    0    0    -1  
$EndComp
Text Label 8950 15500 0    60   ~ 0
SPARE2
Text Label 8950 15400 0    60   ~ 0
SPARE1
Text Label 8950 15300 0    60   ~ 0
SPARE0
Text Label 8950 15600 0    60   ~ 0
SPARE3
Text Label 8950 15700 0    60   ~ 0
SPARE4
Text Label 7650 15500 0    60   ~ 0
SPARE7
Text Label 7650 15400 0    60   ~ 0
SPARE8
Text Label 7650 15300 0    60   ~ 0
SPARE9
Text Label 7650 15600 0    60   ~ 0
SPARE6
Text Label 7650 15700 0    60   ~ 0
SPARE5
Text Notes 7250 13100 0    60   ~ 0
Note: Bus connector is mirror image of Z80\nCPU pin out to mate to backplane whose\nconnectors reflect Z80 CPU pin out.
$Comp
L Z80ROM2-rescue:CONN_10-conn P2
U 1 1 603FC724
P 10550 13800
F 0 "P2" V 10500 13800 60  0000 C CNN
F 1 "SPARES" V 10600 13800 60  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 10550 13800 60  0001 C CNN
F 3 "" H 10550 13800 60  0001 C CNN
	1    10550 13800
	1    0    0    -1  
$EndComp
Text Label 9800 14050 0    60   ~ 0
SPARE7
Text Label 9800 14150 0    60   ~ 0
SPARE8
Text Label 9800 14250 0    60   ~ 0
SPARE9
Text Label 9800 13950 0    60   ~ 0
SPARE6
Text Label 9800 13850 0    60   ~ 0
SPARE5
Text Label 9800 13550 0    60   ~ 0
SPARE2
Text Label 9800 13450 0    60   ~ 0
SPARE1
Text Label 9800 13350 0    60   ~ 0
SPARE0
Text Label 9800 13650 0    60   ~ 0
SPARE3
Text Label 9800 13750 0    60   ~ 0
SPARE4
Text Label 1200 6250 0    60   ~ 0
/RD
Text Label 1200 7150 0    60   ~ 0
/MREQ
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 6044C0E0
P 5500 3950
F 0 "SW1" H 5500 4500 50  0000 C CNN
F 1 "IO PORT ADDR" H 5500 3500 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Slide_9.78x22.5mm_W7.62mm_P2.54mm" H 5500 3950 50  0001 C CNN
F 3 "" H 5500 3950 50  0001 C CNN
	1    5500 3950
	1    0    0    1   
$EndComp
$Comp
L Z80ROM2-rescue:RR8-device-Z80ROM-rescue RR2
U 1 1 6044D2F4
P 6250 4900
F 0 "RR2" V 6400 4950 70  0000 C CNN
F 1 "10K" V 6280 4900 70  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" H 6250 4900 60  0001 C CNN
F 3 "" H 6250 4900 60  0001 C CNN
	1    6250 4900
	0    1    1    0   
$EndComp
$Comp
L Z80ROM2-rescue:VCC-power #PWR010
U 1 1 6044E13A
P 7600 2450
F 0 "#PWR010" H 7600 2550 30  0001 C CNN
F 1 "VCC" H 7600 2550 30  0000 C CNN
F 2 "" H 7600 2450 60  0001 C CNN
F 3 "" H 7600 2450 60  0001 C CNN
	1    7600 2450
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:GND-power #PWR011
U 1 1 6044E58D
P 7600 4850
F 0 "#PWR011" H 7600 4850 30  0001 C CNN
F 1 "GND" H 7600 4780 30  0001 C CNN
F 2 "" H 7600 4850 60  0001 C CNN
F 3 "" H 7600 4850 60  0001 C CNN
	1    7600 4850
	1    0    0    -1  
$EndComp
Text Label 9350 6950 0    60   ~ 0
/CS_MPCL
Text Notes 4250 11550 0    60   ~ 0
Note: IO Address Port $7C\nS1=on - A7 (low)\nS2=off - A6 (high)\nS3=off - A5 (high)\nS4=off - A4 (high)\nS5=off - A3 (high)\nS6=off - A2 (high)\nS7=on - A1 (low)\nS8=on - A0 (low)
$Comp
L 74xx:74LS32 U3
U 1 1 60452DFD
P 10200 6850
F 0 "U3" H 10200 6900 50  0000 C CNN
F 1 "74F32" H 10200 6800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10200 6850 50  0001 C CNN
F 3 "" H 10200 6850 50  0001 C CNN
	1    10200 6850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U3
U 2 1 604530A6
P 11850 15000
F 0 "U3" H 11850 15050 50  0000 C CNN
F 1 "74F32" H 11850 14950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 11850 15000 50  0001 C CNN
F 3 "" H 11850 15000 50  0001 C CNN
	2    11850 15000
	1    0    0    -1  
$EndComp
Text Label 10550 6850 0    60   ~ 0
/MPCL_WR
$Comp
L Z80ROM2-rescue:GND-power #PWR08
U 1 1 6046886F
P 5450 6650
F 0 "#PWR08" H 5450 6650 30  0001 C CNN
F 1 "GND" H 5450 6580 30  0001 C CNN
F 2 "" H 5450 6650 60  0001 C CNN
F 3 "" H 5450 6650 60  0001 C CNN
	1    5450 6650
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:VCC-power #PWR07
U 1 1 60468D15
P 5450 5050
F 0 "#PWR07" H 5450 5150 30  0001 C CNN
F 1 "VCC" H 5450 5150 30  0000 C CNN
F 2 "" H 5450 5050 60  0001 C CNN
F 3 "" H 5450 5050 60  0001 C CNN
	1    5450 5050
	1    0    0    -1  
$EndComp
Text Label 1200 2750 0    60   ~ 0
A0
Text Label 1200 2950 0    60   ~ 0
A2
Text Label 1200 2850 0    60   ~ 0
A1
$Comp
L 74xx:74LS32 U3
U 3 1 6044B33F
P 10800 8000
F 0 "U3" H 10800 8050 50  0000 C CNN
F 1 "74F32" H 10800 7950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10800 8000 50  0001 C CNN
F 3 "" H 10800 8000 50  0001 C CNN
	3    10800 8000
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:JUMPER-device-Z80ROM-rescue JP1
U 1 1 604756E5
P 1400 8400
F 0 "JP1" H 1400 8550 60  0000 C CNN
F 1 "BOOT" H 1400 8320 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 1400 8400 60  0001 C CNN
F 3 "" H 1400 8400 60  0001 C CNN
	1    1400 8400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT273 U13
U 1 1 604A01DD
P 5450 5850
F 0 "U13" H 5150 6500 50  0000 C CNN
F 1 "74LS273" H 5150 5200 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 5450 5850 50  0001 C CNN
F 3 "" H 5450 5850 50  0001 C CNN
	1    5450 5850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS688 U10
U 1 1 604A100F
P 7600 3650
F 0 "U10" H 7300 4700 50  0000 C CNN
F 1 "74LS688" H 7300 2600 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 7600 3650 50  0001 C CNN
F 3 "" H 7600 3650 50  0001 C CNN
	1    7600 3650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U3
U 5 1 604B5781
P 6350 14800
F 0 "U3" H 6350 14850 50  0000 C CNN
F 1 "74F32" H 6350 14750 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6350 14800 50  0001 C CNN
F 3 "" H 6350 14800 50  0001 C CNN
	5    6350 14800
	1    0    0    -1  
$EndComp
NoConn ~ 9350 14800
NoConn ~ 9350 14900
NoConn ~ 7550 14500
NoConn ~ 7550 14800
NoConn ~ 7550 15000
NoConn ~ 7550 14900
Text Notes 12150 14350 0    60   ~ 0
Spare Components
Text Notes 1250 2450 0    60   ~ 0
Z80 BUS INTERFACE
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C14
U 1 1 604FAB57
P 4950 13850
F 0 "C14" H 5000 13950 50  0000 L CNN
F 1 "0.1u" H 5000 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4950 13850 60  0001 C CNN
F 3 "" H 4950 13850 60  0001 C CNN
	1    4950 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C15
U 1 1 604FAB5D
P 5200 13850
F 0 "C15" H 5250 13950 50  0000 L CNN
F 1 "0.1u" H 5250 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5200 13850 60  0001 C CNN
F 3 "" H 5200 13850 60  0001 C CNN
	1    5200 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C16
U 1 1 604FAB63
P 5450 13850
F 0 "C16" H 5500 13950 50  0000 L CNN
F 1 "0.1u" H 5500 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5450 13850 60  0001 C CNN
F 3 "" H 5450 13850 60  0001 C CNN
	1    5450 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C17
U 1 1 604FAB69
P 5700 13850
F 0 "C17" H 5750 13950 50  0000 L CNN
F 1 "0.1u" H 5750 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5700 13850 60  0001 C CNN
F 3 "" H 5700 13850 60  0001 C CNN
	1    5700 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:74LS244-RESCUE-Z80PROC-Z80ROM-rescue U7
U 1 1 603971B6
P 2200 7150
F 0 "U7" H 2250 6950 60  0000 C CNN
F 1 "74LS244" H 2300 6750 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2200 7150 60  0001 C CNN
F 3 "" H 2200 7150 60  0001 C CNN
	1    2200 7150
	1    0    0    -1  
$EndComp
Text Label 1200 6650 0    60   ~ 0
/RESET
$Comp
L Z80ROM2-rescue:VCC-power #PWR09
U 1 1 604651AE
P 6700 4550
F 0 "#PWR09" H 6700 4650 30  0001 C CNN
F 1 "VCC" H 6700 4650 30  0000 C CNN
F 2 "" H 6700 4550 60  0001 C CNN
F 3 "" H 6700 4550 60  0001 C CNN
	1    6700 4550
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:GND-power #PWR06
U 1 1 60465D86
P 5200 4550
F 0 "#PWR06" H 5200 4550 30  0001 C CNN
F 1 "GND" H 5200 4480 30  0001 C CNN
F 2 "" H 5200 4550 60  0001 C CNN
F 3 "" H 5200 4550 60  0001 C CNN
	1    5200 4550
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:74LS244-RESCUE-Z80PROC-Z80ROM-rescue U2
U 1 1 604AB7C7
P 2200 4550
F 0 "U2" H 2250 4350 60  0000 C CNN
F 1 "74LS244" H 2300 4150 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 2200 4550 60  0001 C CNN
F 3 "" H 2200 4550 60  0001 C CNN
	1    2200 4550
	1    0    0    -1  
$EndComp
Text Label 1200 4350 0    60   ~ 0
A11
Text Label 1200 4550 0    60   ~ 0
A13
Text Label 1200 4650 0    60   ~ 0
A14
Text Label 1200 4750 0    60   ~ 0
A15
Text Label 1200 4450 0    60   ~ 0
A12
Text Label 1200 4050 0    60   ~ 0
A8
Text Label 1200 4250 0    60   ~ 0
A10
Text Label 1200 4150 0    60   ~ 0
A9
$Comp
L Z80ROM2-rescue:GND-power #PWR01
U 1 1 604C62A2
P 1000 7750
F 0 "#PWR01" H 1000 7750 30  0001 C CNN
F 1 "GND" H 1000 7680 30  0001 C CNN
F 2 "" H 1000 7750 60  0001 C CNN
F 3 "" H 1000 7750 60  0001 C CNN
	1    1000 7750
	1    0    0    -1  
$EndComp
Text Notes 1900 7950 0    60   ~ 0
Note: Buffers/Transceivers respond \nto both IO and MEM cycles
$Comp
L Z80ROM2-rescue:27C080-memory U11
U 1 1 604CCB40
P 10900 3550
F 0 "U11" H 10700 4550 70  0000 C CNN
F 1 "27C080" H 10900 2150 70  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 10900 3550 60  0001 C CNN
F 3 "" H 10900 3550 60  0001 C CNN
	1    10900 3550
	1    0    0    -1  
$EndComp
Text Label 6050 5450 0    60   ~ 0
A16_ROM
Text Label 6050 5550 0    60   ~ 0
A17_ROM
Text Label 6050 5650 0    60   ~ 0
A18_ROM
Text Label 6050 5750 0    60   ~ 0
A19_ROM
Text Label 6050 6050 0    60   ~ 0
/LOW_ROM_EN
Text Label 7450 8100 0    60   ~ 0
bA15
Text Label 7450 7900 0    60   ~ 0
/LOW_ROM_EN
$Comp
L Z80ROM2-rescue:GND-power #PWR02
U 1 1 6050AD8F
P 1100 8450
F 0 "#PWR02" H 1100 8450 30  0001 C CNN
F 1 "GND" H 1100 8380 30  0001 C CNN
F 2 "" H 1100 8450 60  0001 C CNN
F 3 "" H 1100 8450 60  0001 C CNN
	1    1100 8450
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:R-device-Z80ROM-rescue R1
U 1 1 6050B864
P 1400 8100
F 0 "R1" V 1480 8100 50  0000 C CNN
F 1 "4700" V 1400 8100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 1400 8100 60  0001 C CNN
F 3 "" H 1400 8100 60  0001 C CNN
	1    1400 8100
	0    1    -1   0   
$EndComp
$Comp
L Z80ROM2-rescue:VCC-power #PWR03
U 1 1 6050CB72
P 1150 8100
F 0 "#PWR03" H 1150 8200 30  0001 C CNN
F 1 "VCC" H 1150 8200 30  0000 C CNN
F 2 "" H 1150 8100 60  0001 C CNN
F 3 "" H 1150 8100 60  0001 C CNN
	1    1150 8100
	1    0    0    -1  
$EndComp
Text Label 1850 8400 0    60   ~ 0
/BOOT_ROM
$Comp
L Z80ROM2-rescue:27C080-memory U12
U 1 1 6051A38E
P 15300 3550
F 0 "U12" H 15100 4550 70  0000 C CNN
F 1 "27C080" H 15300 2150 70  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm" H 15300 3550 60  0001 C CNN
F 3 "" H 15300 3550 60  0001 C CNN
	1    15300 3550
	1    0    0    -1  
$EndComp
Text Label 6050 5850 0    60   ~ 0
A20_ROM
$Comp
L Z80ROM2-rescue:CONN_3-conn K1
U 1 1 605289F0
P 9100 5650
F 0 "K1" V 9050 5650 50  0000 C CNN
F 1 "PIN30-0" V 9150 5650 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9100 5650 60  0001 C CNN
F 3 "" H 9100 5650 60  0001 C CNN
	1    9100 5650
	0    1    1    0   
$EndComp
$Comp
L Z80ROM2-rescue:CONN_3-conn K6
U 1 1 60528AF0
P 9500 5650
F 0 "K6" V 9450 5650 50  0000 C CNN
F 1 "PIN31-0" V 9550 5650 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9500 5650 60  0001 C CNN
F 3 "" H 9500 5650 60  0001 C CNN
	1    9500 5650
	0    1    1    0   
$EndComp
$Comp
L Z80ROM2-rescue:CONN_3-conn K8
U 1 1 60528BAA
P 9900 5650
F 0 "K8" V 9850 5650 50  0000 C CNN
F 1 "PIN1-0" V 9950 5650 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9900 5650 60  0001 C CNN
F 3 "" H 9900 5650 60  0001 C CNN
	1    9900 5650
	0    1    1    0   
$EndComp
Text Label 9200 5250 1    60   ~ 0
A17_ROM
Text Label 9800 5250 1    60   ~ 0
A18_ROM
Text Label 10000 5250 1    60   ~ 0
A19_ROM
$Comp
L Z80ROM2-rescue:VCC-power #PWR012
U 1 1 6052FDB9
P 9000 5300
F 0 "#PWR012" H 9000 5400 30  0001 C CNN
F 1 "VCC" H 9000 5400 30  0000 C CNN
F 2 "" H 9000 5300 60  0001 C CNN
F 3 "" H 9000 5300 60  0001 C CNN
	1    9000 5300
	1    0    0    -1  
$EndComp
Text Label 6050 5950 0    60   ~ 0
BOOT_OVERRIDE
$Comp
L 74xx:74LS86 U5
U 1 1 604BB8CA
P 3200 8500
F 0 "U5" H 3200 8550 50  0000 C CNN
F 1 "74LS86" H 3200 8450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3200 8500 50  0001 C CNN
F 3 "" H 3200 8500 50  0001 C CNN
	1    3200 8500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U5
U 2 1 604BBBD1
P 13350 14650
F 0 "U5" H 13350 14700 50  0000 C CNN
F 1 "74LS86" H 13350 14600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 13350 14650 50  0001 C CNN
F 3 "" H 13350 14650 50  0001 C CNN
	2    13350 14650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U5
U 3 1 604BBCFB
P 13350 15000
F 0 "U5" H 13350 15050 50  0000 C CNN
F 1 "74LS86" H 13350 14950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 13350 15000 50  0001 C CNN
F 3 "" H 13350 15000 50  0001 C CNN
	3    13350 15000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U5
U 4 1 604BBD01
P 13350 15350
F 0 "U5" H 13350 15400 50  0000 C CNN
F 1 "74LS86" H 13350 15300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 13350 15350 50  0001 C CNN
F 3 "" H 13350 15350 50  0001 C CNN
	4    13350 15350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U5
U 5 1 604BBE75
P 6850 14800
F 0 "U5" H 6850 14850 50  0000 C CNN
F 1 "74LS86" H 6850 14750 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6850 14800 50  0001 C CNN
F 3 "" H 6850 14800 50  0001 C CNN
	5    6850 14800
	1    0    0    -1  
$EndComp
Text Label 1850 8600 0    60   ~ 0
BOOT_OVERRIDE
$Comp
L Z80ROM2-rescue:CONN_3-conn K3
U 1 1 604CAA06
P 13400 5650
F 0 "K3" V 13350 5650 50  0000 C CNN
F 1 "PIN30-1" V 13450 5650 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 13400 5650 60  0001 C CNN
F 3 "" H 13400 5650 60  0001 C CNN
	1    13400 5650
	0    1    1    0   
$EndComp
$Comp
L Z80ROM2-rescue:CONN_3-conn K4
U 1 1 604CAA0C
P 13800 5650
F 0 "K4" V 13750 5650 50  0000 C CNN
F 1 "PIN31-1" V 13850 5650 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 13800 5650 60  0001 C CNN
F 3 "" H 13800 5650 60  0001 C CNN
	1    13800 5650
	0    1    1    0   
$EndComp
$Comp
L Z80ROM2-rescue:CONN_3-conn K5
U 1 1 604CAA12
P 14200 5650
F 0 "K5" V 14150 5650 50  0000 C CNN
F 1 "PIN1-1" V 14250 5650 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 14200 5650 60  0001 C CNN
F 3 "" H 14200 5650 60  0001 C CNN
	1    14200 5650
	0    1    1    0   
$EndComp
Text Label 13500 5250 1    60   ~ 0
A17_ROM
Text Label 14100 5250 1    60   ~ 0
A18_ROM
Text Label 14300 5250 1    60   ~ 0
A19_ROM
$Comp
L Z80ROM2-rescue:VCC-power #PWR013
U 1 1 604CAA1B
P 13300 5300
F 0 "#PWR013" H 13300 5400 30  0001 C CNN
F 1 "VCC" H 13300 5400 30  0000 C CNN
F 2 "" H 13300 5300 60  0001 C CNN
F 3 "" H 13300 5300 60  0001 C CNN
	1    13300 5300
	1    0    0    -1  
$EndComp
NoConn ~ 12900 15000
NoConn ~ 13650 14650
NoConn ~ 13650 15000
NoConn ~ 13650 15350
$Comp
L Z80ROM2-rescue:CONN_3-conn K2
U 1 1 604E4F2C
P 7550 6700
F 0 "K2" V 7500 6700 50  0000 C CNN
F 1 "MAX ROM" V 7600 6700 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7550 6700 60  0001 C CNN
F 3 "" H 7550 6700 60  0001 C CNN
	1    7550 6700
	0    1    1    0   
$EndComp
Text Notes 7050 6900 0    60   ~ 0
1MB/512KB ROMs
NoConn ~ 9350 13800
NoConn ~ 9350 15000
Wire Wire Line
	1100 7050 1500 7050
Wire Wire Line
	1100 7250 1500 7250
Wire Wire Line
	1100 7350 1500 7350
Wire Wire Line
	1100 3050 1500 3050
Wire Wire Line
	1100 3150 1500 3150
Wire Wire Line
	1100 3250 1500 3250
Wire Wire Line
	1100 3350 1500 3350
Wire Wire Line
	1100 3450 1500 3450
Wire Wire Line
	1100 5350 1500 5350
Wire Wire Line
	1100 5450 1500 5450
Wire Wire Line
	1100 5550 1500 5550
Wire Wire Line
	1100 5650 1500 5650
Wire Wire Line
	1100 5750 1500 5750
Wire Wire Line
	1100 5850 1500 5850
Wire Wire Line
	1100 5950 1500 5950
Wire Wire Line
	1100 6050 1500 6050
Wire Wire Line
	7550 13500 8050 13500
Wire Wire Line
	7550 13400 8050 13400
Wire Wire Line
	7550 13300 8050 13300
Wire Wire Line
	8850 13300 9350 13300
Wire Wire Line
	8850 13400 9350 13400
Wire Wire Line
	8850 13500 9350 13500
Wire Wire Line
	8850 13600 9350 13600
Wire Wire Line
	8850 13700 9350 13700
Wire Wire Line
	7550 14300 8050 14300
Wire Wire Line
	7550 14200 8050 14200
Wire Wire Line
	7550 14100 8050 14100
Wire Wire Line
	7550 14000 8050 14000
Wire Wire Line
	7550 13900 8050 13900
Wire Wire Line
	7550 13800 8050 13800
Wire Wire Line
	7550 13700 8050 13700
Wire Wire Line
	7550 13600 8050 13600
Wire Wire Line
	7550 14400 8050 14400
Wire Wire Line
	7550 14600 8050 14600
Wire Wire Line
	7550 14500 8050 14500
Wire Wire Line
	8850 15000 9350 15000
Wire Wire Line
	7550 15000 8050 15000
Wire Wire Line
	7550 14700 8050 14700
Wire Wire Line
	8850 14900 9350 14900
Wire Wire Line
	8850 14800 9350 14800
Wire Wire Line
	7550 14900 8050 14900
Wire Wire Line
	7550 14800 8050 14800
Wire Wire Line
	8850 15200 9350 15200
Wire Wire Line
	8850 15100 9350 15100
Wire Wire Line
	7550 15100 8050 15100
Wire Wire Line
	7550 15200 8050 15200
Wire Wire Line
	8850 14600 9350 14600
Wire Wire Line
	8850 14700 9350 14700
Wire Wire Line
	8850 14400 9350 14400
Wire Wire Line
	8850 14000 9350 14000
Wire Wire Line
	8850 13900 9350 13900
Wire Wire Line
	8850 14100 9350 14100
Wire Wire Line
	8850 14200 9350 14200
Wire Wire Line
	8850 14500 9350 14500
Wire Wire Line
	8850 14300 9350 14300
Wire Wire Line
	8850 13800 9350 13800
Wire Wire Line
	3200 13650 3450 13650
Wire Wire Line
	2950 14050 3200 14050
Connection ~ 5450 13650
Connection ~ 5200 13650
Connection ~ 4950 13650
Connection ~ 4700 13650
Connection ~ 4700 14050
Connection ~ 4950 14050
Connection ~ 5200 14050
Connection ~ 5450 14050
Wire Wire Line
	4700 14050 4700 14100
Connection ~ 5700 14050
Connection ~ 5700 13650
Connection ~ 5950 13650
Connection ~ 5950 14050
Connection ~ 4450 14050
Connection ~ 6200 13650
Connection ~ 6200 14050
Connection ~ 3950 14050
Connection ~ 4450 13650
Wire Wire Line
	7550 15400 8050 15400
Wire Wire Line
	7550 15300 8050 15300
Wire Wire Line
	8850 15300 9350 15300
Wire Wire Line
	7550 15600 8050 15600
Wire Wire Line
	7550 15500 8050 15500
Wire Wire Line
	8850 15600 9350 15600
Wire Wire Line
	8850 15500 9350 15500
Wire Wire Line
	8850 15400 9350 15400
Wire Wire Line
	7550 15700 8050 15700
Wire Wire Line
	8850 15700 9350 15700
Wire Wire Line
	1100 6250 1500 6250
Wire Wire Line
	1000 3650 1000 4950
Wire Wire Line
	1000 3650 1500 3650
Wire Wire Line
	1500 3650 1500 3750
Connection ~ 1500 3650
Wire Wire Line
	2900 3450 3700 3450
Wire Wire Line
	2900 3350 3600 3350
Wire Wire Line
	2900 3250 3500 3250
Wire Wire Line
	2900 3150 3400 3150
Wire Wire Line
	2900 3050 3300 3050
Wire Wire Line
	2900 2750 3000 2750
Wire Wire Line
	1100 7150 1500 7150
Wire Wire Line
	2900 2850 3100 2850
Connection ~ 5200 3750
Connection ~ 5200 3850
Connection ~ 5200 3950
Connection ~ 5200 4050
Connection ~ 5200 4150
Connection ~ 5200 4250
Connection ~ 5200 4350
Wire Wire Line
	5800 3650 6600 3650
Wire Wire Line
	5800 3750 6500 3750
Wire Wire Line
	5800 3850 6400 3850
Wire Wire Line
	5800 3950 6300 3950
Wire Wire Line
	5800 4050 6200 4050
Wire Wire Line
	5800 4150 6100 4150
Wire Wire Line
	5800 4250 6000 4250
Wire Wire Line
	5800 4350 5900 4350
Wire Wire Line
	5900 4550 5900 4350
Connection ~ 5900 4350
Wire Wire Line
	6000 4550 6000 4250
Connection ~ 6000 4250
Wire Wire Line
	6100 4550 6100 4150
Connection ~ 6100 4150
Wire Wire Line
	6200 4550 6200 4050
Connection ~ 6200 4050
Wire Wire Line
	6300 4550 6300 3950
Connection ~ 6300 3950
Wire Wire Line
	6400 4550 6400 3850
Connection ~ 6400 3850
Wire Wire Line
	6500 4550 6500 3750
Connection ~ 6500 3750
Wire Wire Line
	6600 4550 6600 3650
Connection ~ 6600 3650
Wire Wire Line
	2900 2950 3200 2950
Wire Wire Line
	10500 6850 11050 6850
Wire Wire Line
	2900 5350 4100 5350
Wire Wire Line
	3800 1650 3800 4050
Wire Wire Line
	2900 5450 4200 5450
Wire Wire Line
	3900 1750 3900 4150
Wire Wire Line
	2900 5550 4300 5550
Wire Wire Line
	4000 1850 4000 4250
Wire Wire Line
	2900 5650 4400 5650
Wire Wire Line
	4100 1950 4100 4350
Wire Wire Line
	2900 5750 4500 5750
Wire Wire Line
	4200 2050 4200 4450
Wire Wire Line
	2900 5850 4600 5850
Wire Wire Line
	4300 2150 4300 4550
Wire Wire Line
	2900 5950 4700 5950
Wire Wire Line
	4400 2250 4400 4650
Wire Wire Line
	2900 6050 4800 6050
Wire Wire Line
	1100 2750 1500 2750
Wire Wire Line
	1100 2850 1500 2850
Wire Wire Line
	1100 2950 1500 2950
Wire Wire Line
	5200 3650 5200 3750
Wire Wire Line
	2900 7050 5800 7050
Connection ~ 6450 13650
Connection ~ 6450 14050
Connection ~ 2950 14050
Wire Wire Line
	2950 14050 2950 15300
Connection ~ 5350 15300
Connection ~ 6350 15300
Connection ~ 6350 14300
Connection ~ 6850 14300
Wire Wire Line
	6950 14300 6950 13650
Connection ~ 6700 13650
Connection ~ 6950 13650
Connection ~ 6850 15300
Connection ~ 4200 13650
Connection ~ 3950 13650
Connection ~ 3700 13650
Connection ~ 3450 14050
Connection ~ 3700 14050
Connection ~ 4200 14050
Wire Wire Line
	1100 6650 1500 6650
Wire Wire Line
	9750 13350 10200 13350
Wire Wire Line
	9750 13450 10200 13450
Wire Wire Line
	9750 13550 10200 13550
Wire Wire Line
	9750 13650 10200 13650
Wire Wire Line
	9750 13750 10200 13750
Wire Wire Line
	9750 13850 10200 13850
Wire Wire Line
	9750 13950 10200 13950
Wire Wire Line
	9750 14050 10200 14050
Wire Wire Line
	9750 14150 10200 14150
Wire Wire Line
	9750 14250 10200 14250
Wire Notes Line
	11450 14400 11450 15600
Wire Notes Line
	11450 14400 13750 14400
Wire Wire Line
	1000 7550 1500 7550
Wire Wire Line
	1500 4950 1000 4950
Connection ~ 1000 4950
Wire Wire Line
	1500 5050 1500 4950
Connection ~ 1500 4950
Wire Wire Line
	1100 4350 1500 4350
Wire Wire Line
	1100 4450 1500 4450
Wire Wire Line
	1100 4550 1500 4550
Wire Wire Line
	1100 4650 1500 4650
Wire Wire Line
	1100 4750 1500 4750
Wire Wire Line
	1100 4050 1500 4050
Wire Wire Line
	1100 4150 1500 4150
Wire Wire Line
	1100 4250 1500 4250
Wire Wire Line
	8100 7250 2900 7250
Wire Wire Line
	8100 6750 9300 6750
Wire Wire Line
	11050 6850 11050 6650
Wire Wire Line
	11050 6650 8000 6650
Wire Wire Line
	8000 6650 8000 6950
Wire Wire Line
	8000 6950 4900 6950
Wire Wire Line
	4900 6950 4900 6250
Wire Wire Line
	4900 6250 4950 6250
Wire Wire Line
	5950 5350 8700 5350
Wire Wire Line
	5950 5450 8800 5450
Wire Wire Line
	5950 5550 8900 5550
Wire Wire Line
	5950 5650 8100 5650
Wire Wire Line
	5950 5950 6900 5950
Wire Wire Line
	5950 6050 6800 6050
Wire Wire Line
	3800 4050 2900 4050
Wire Wire Line
	3900 4150 2900 4150
Wire Wire Line
	4000 4250 2900 4250
Wire Wire Line
	4100 4350 2900 4350
Wire Wire Line
	4200 4450 2900 4450
Wire Wire Line
	4300 4550 2900 4550
Wire Wire Line
	4400 4650 2900 4650
Wire Wire Line
	2900 4750 4000 4750
Wire Wire Line
	3000 850  3000 2750
Wire Wire Line
	3100 950  3100 2850
Wire Wire Line
	3200 1050 3200 2950
Wire Wire Line
	3300 1150 3300 3050
Wire Wire Line
	3400 1250 3400 3150
Wire Wire Line
	3500 1350 3500 3250
Wire Wire Line
	3600 1450 3600 3350
Wire Wire Line
	3700 3450 3700 1550
Wire Wire Line
	8200 2750 8100 2750
Wire Wire Line
	2900 7350 7900 7350
Wire Wire Line
	3700 1550 9400 1550
Wire Wire Line
	3600 1450 9500 1450
Wire Wire Line
	3500 1350 9600 1350
Wire Wire Line
	3400 1250 9700 1250
Wire Wire Line
	3300 1150 9800 1150
Wire Wire Line
	3200 1050 9900 1050
Wire Wire Line
	3100 950  10000 950 
Wire Wire Line
	3000 850  10100 850 
Wire Wire Line
	4400 2250 8700 2250
Wire Wire Line
	4300 2150 8800 2150
Wire Wire Line
	4200 2050 8900 2050
Wire Wire Line
	4100 1950 9000 1950
Wire Wire Line
	4000 1850 9100 1850
Wire Wire Line
	3900 1750 9200 1750
Wire Wire Line
	3800 1650 9300 1650
Wire Wire Line
	9300 3450 10200 3450
Wire Wire Line
	9200 3550 10200 3550
Wire Wire Line
	9100 3650 10200 3650
Wire Wire Line
	9000 3750 10200 3750
Wire Wire Line
	8900 3850 10200 3850
Wire Wire Line
	8800 3950 10200 3950
Wire Wire Line
	8700 4050 10200 4050
Wire Wire Line
	10100 2650 10200 2650
Wire Wire Line
	10000 2750 10200 2750
Wire Wire Line
	9900 2850 10200 2850
Wire Wire Line
	9800 2950 10200 2950
Wire Wire Line
	9700 3050 10200 3050
Wire Wire Line
	9600 3150 10200 3150
Wire Wire Line
	9500 3250 10200 3250
Wire Wire Line
	9400 3350 10200 3350
Wire Wire Line
	8700 2250 8700 4050
Wire Wire Line
	8800 2150 8800 3950
Wire Wire Line
	8900 2050 8900 3850
Wire Wire Line
	9000 1950 9000 3750
Wire Wire Line
	9100 1850 9100 3650
Wire Wire Line
	9200 1750 9200 3550
Wire Wire Line
	9300 1650 9300 3450
Wire Wire Line
	9400 1550 9400 3350
Wire Wire Line
	9500 1450 9500 3250
Wire Wire Line
	9600 1350 9600 3150
Wire Wire Line
	9700 1250 9700 3050
Wire Wire Line
	9800 1150 9800 2950
Wire Wire Line
	9900 1050 9900 2850
Wire Wire Line
	10000 950  10000 2750
Wire Wire Line
	10100 850  10100 2650
Wire Wire Line
	11600 3350 11700 3350
Wire Wire Line
	11700 3350 11700 8700
Wire Wire Line
	4800 8700 11700 8700
Wire Wire Line
	4800 6050 4800 8700
Connection ~ 4800 6050
Wire Wire Line
	4700 5950 4700 8800
Wire Wire Line
	4700 8800 11800 8800
Wire Wire Line
	11800 8800 11800 3250
Wire Wire Line
	11800 3250 11600 3250
Connection ~ 4700 5950
Wire Wire Line
	11600 3150 11900 3150
Wire Wire Line
	11900 3150 11900 8900
Wire Wire Line
	4600 8900 11900 8900
Wire Wire Line
	4600 5850 4600 8900
Connection ~ 4600 5850
Wire Wire Line
	4500 5750 4500 9000
Wire Wire Line
	4500 9000 12000 9000
Wire Wire Line
	12000 9000 12000 3050
Wire Wire Line
	12000 3050 11600 3050
Connection ~ 4500 5750
Wire Wire Line
	11600 2950 12100 2950
Wire Wire Line
	12100 2950 12100 9100
Wire Wire Line
	4400 9100 12100 9100
Wire Wire Line
	4400 5650 4400 9100
Connection ~ 4400 5650
Wire Wire Line
	4300 5550 4300 9200
Wire Wire Line
	4300 9200 12200 9200
Wire Wire Line
	12200 9200 12200 2850
Wire Wire Line
	12200 2850 11600 2850
Connection ~ 4300 5550
Wire Wire Line
	11600 2750 12300 2750
Wire Wire Line
	12300 2750 12300 9300
Wire Wire Line
	4200 9300 12300 9300
Wire Wire Line
	4200 5450 4200 9300
Connection ~ 4200 5450
Wire Wire Line
	4100 5350 4100 9400
Wire Wire Line
	4100 9400 12400 9400
Wire Wire Line
	12400 9400 12400 2650
Wire Wire Line
	12400 2650 11600 2650
Connection ~ 4100 5350
Connection ~ 3700 3450
Connection ~ 3600 3350
Connection ~ 3500 3250
Connection ~ 3400 3150
Connection ~ 3300 3050
Connection ~ 3200 2950
Connection ~ 3100 2850
Connection ~ 3000 2750
Wire Wire Line
	1700 8400 2900 8400
Wire Wire Line
	1100 8400 1100 8450
Connection ~ 1700 8400
Wire Wire Line
	4000 4750 4000 8100
Wire Wire Line
	1700 8400 1700 8100
Wire Wire Line
	1700 8100 1650 8100
Wire Wire Line
	2900 7150 7300 7150
Wire Wire Line
	7300 7150 7300 8300
Connection ~ 1000 7550
Wire Wire Line
	1500 7550 1500 7650
Connection ~ 1500 7550
Wire Wire Line
	14500 850  14500 2650
Wire Wire Line
	14500 2650 14600 2650
Connection ~ 10100 850 
Wire Wire Line
	14400 950  14400 2750
Wire Wire Line
	14400 2750 14600 2750
Connection ~ 10000 950 
Wire Wire Line
	14300 1050 14300 2850
Wire Wire Line
	14300 2850 14600 2850
Connection ~ 9900 1050
Wire Wire Line
	14200 1150 14200 2950
Wire Wire Line
	14200 2950 14600 2950
Connection ~ 9800 1150
Wire Wire Line
	14100 1250 14100 3050
Wire Wire Line
	14100 3050 14600 3050
Connection ~ 9700 1250
Wire Wire Line
	14000 1350 14000 3150
Wire Wire Line
	14000 3150 14600 3150
Connection ~ 9600 1350
Wire Wire Line
	13900 1450 13900 3250
Wire Wire Line
	13900 3250 14600 3250
Connection ~ 9500 1450
Wire Wire Line
	13800 1550 13800 3350
Wire Wire Line
	13800 3350 14600 3350
Connection ~ 9400 1550
Wire Wire Line
	13700 1650 13700 3450
Wire Wire Line
	13700 3450 14600 3450
Connection ~ 9300 1650
Wire Wire Line
	13600 1750 13600 3550
Wire Wire Line
	13600 3550 14600 3550
Connection ~ 9200 1750
Wire Wire Line
	13500 1850 13500 3650
Wire Wire Line
	13500 3650 14600 3650
Connection ~ 9100 1850
Wire Wire Line
	13400 1950 13400 3750
Wire Wire Line
	13400 3750 14600 3750
Connection ~ 9000 1950
Wire Wire Line
	13300 2050 13300 3850
Wire Wire Line
	13300 3850 14600 3850
Connection ~ 8900 2050
Wire Wire Line
	13200 2150 13200 3950
Wire Wire Line
	13200 3950 14600 3950
Connection ~ 8800 2150
Wire Wire Line
	13100 2250 13100 4050
Wire Wire Line
	13100 4050 14600 4050
Connection ~ 8700 2250
Wire Wire Line
	16000 3350 16100 3350
Wire Wire Line
	16100 3350 16100 8700
Wire Wire Line
	16200 8800 16200 3250
Wire Wire Line
	16200 3250 16000 3250
Wire Wire Line
	16000 3150 16300 3150
Wire Wire Line
	16300 3150 16300 8900
Wire Wire Line
	16400 9000 16400 3050
Wire Wire Line
	16400 3050 16000 3050
Wire Wire Line
	16000 2950 16500 2950
Wire Wire Line
	16500 2950 16500 9100
Wire Wire Line
	16600 9200 16600 2850
Wire Wire Line
	16600 2850 16000 2850
Wire Wire Line
	16000 2750 16700 2750
Wire Wire Line
	16700 2750 16700 9300
Wire Wire Line
	16800 9400 16800 2650
Wire Wire Line
	16800 2650 16000 2650
Wire Wire Line
	10100 5150 11250 5150
Wire Wire Line
	10100 5150 10100 4750
Wire Wire Line
	10100 4750 10200 4750
Wire Wire Line
	14500 4750 14500 5850
Wire Wire Line
	14500 4750 14600 4750
Wire Wire Line
	8600 4150 8700 4150
Wire Wire Line
	8700 5350 8700 4150
Wire Wire Line
	8800 5450 8800 4250
Wire Wire Line
	8500 4250 8800 4250
Wire Wire Line
	9900 5300 9900 4550
Wire Wire Line
	9900 4550 10200 4550
Wire Wire Line
	9500 5300 9500 4450
Wire Wire Line
	9500 4450 10200 4450
Wire Wire Line
	9100 5300 9100 4350
Wire Wire Line
	9100 4350 10200 4350
Wire Wire Line
	9200 4700 9200 5300
Wire Wire Line
	9800 5300 9800 4700
Wire Wire Line
	10000 5300 10000 4700
Connection ~ 9300 6750
Wire Wire Line
	8100 7250 8100 6750
Wire Wire Line
	9700 5950 8100 5950
Wire Wire Line
	8100 5950 8100 5650
Wire Wire Line
	8900 4700 8900 5550
Wire Wire Line
	8900 4700 9200 4700
Wire Wire Line
	10000 5300 10100 5300
Wire Wire Line
	10100 5300 10100 6050
Wire Wire Line
	8000 6050 10100 6050
Wire Wire Line
	8000 5750 8000 6050
Connection ~ 10000 5300
Wire Wire Line
	7900 6350 11150 6350
Wire Wire Line
	7900 6550 10200 6550
Wire Wire Line
	7900 7350 7900 6550
Wire Wire Line
	6900 5950 6900 9500
Wire Wire Line
	6900 9500 1700 9500
Wire Wire Line
	1700 9500 1700 8600
Wire Wire Line
	1700 8600 2900 8600
Wire Wire Line
	14200 5300 14200 4550
Wire Wire Line
	13800 5300 13800 4450
Wire Wire Line
	13400 5300 13400 4350
Wire Wire Line
	13500 4700 13500 5300
Wire Wire Line
	14100 5300 14100 4700
Wire Wire Line
	14300 5300 14300 4700
Wire Wire Line
	13400 4350 14600 4350
Wire Wire Line
	13800 4450 14600 4450
Wire Wire Line
	14200 4550 14600 4550
Wire Wire Line
	9300 6150 13600 6150
Connection ~ 9300 6150
Connection ~ 10100 6050
Connection ~ 12400 9400
Connection ~ 12300 9300
Connection ~ 12200 9200
Connection ~ 12100 9100
Connection ~ 12000 9000
Connection ~ 11900 8900
Connection ~ 11800 8800
Connection ~ 11700 8700
Wire Wire Line
	14600 4150 13000 4150
Wire Wire Line
	13000 4150 13000 2350
Wire Wire Line
	13000 2350 8600 2350
Wire Wire Line
	8600 2350 8600 4150
Wire Wire Line
	14600 4250 12900 4250
Wire Wire Line
	12900 4250 12900 2450
Wire Wire Line
	12900 2450 8500 2450
Wire Wire Line
	8500 2450 8500 4250
Connection ~ 8700 4150
Connection ~ 8800 4250
Wire Wire Line
	9700 6450 14000 6450
Connection ~ 9700 5950
Wire Wire Line
	2900 6350 2900 6650
Wire Wire Line
	4950 6350 2900 6350
Wire Wire Line
	5950 5750 7650 5750
Wire Wire Line
	7650 6350 7650 5750
Connection ~ 7650 5750
Wire Wire Line
	7450 6350 7450 5850
Wire Wire Line
	7450 5850 5950 5850
Wire Wire Line
	7550 6350 7550 6150
Wire Wire Line
	7550 6150 7900 6150
Wire Wire Line
	7900 6150 7900 6350
Wire Wire Line
	8900 6250 13200 6250
Wire Wire Line
	13200 6250 13200 4700
Wire Wire Line
	13200 4700 13500 4700
Connection ~ 8900 5550
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C10
U 1 1 604F2053
P 5950 13850
F 0 "C10" H 6000 13950 50  0000 L CNN
F 1 "0.1u" H 6000 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5950 13850 60  0001 C CNN
F 3 "" H 5950 13850 60  0001 C CNN
	1    5950 13850
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:C-device-Z80ROM-rescue C11
U 1 1 604F2697
P 6200 13850
F 0 "C11" H 6250 13950 50  0000 L CNN
F 1 "0.1u" H 6250 13750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 6200 13850 60  0001 C CNN
F 3 "" H 6200 13850 60  0001 C CNN
	1    6200 13850
	1    0    0    -1  
$EndComp
Connection ~ 3450 13650
Connection ~ 3200 14050
Text Notes 750  12100 0    60   ~ 0
JP1 ENABLES MULTIPLE ROM BOARDS\nPRESENT IN SYSTEM. ONLY 1 MAY HAVE\nBOOT JUMPER INSTALLED OR MEMORY\nBUS CONTENTION.  SUBSEQUENT BOARDS\nARE ACTIVATED BY CPU USING\nBOOT_OVERRIDE DISCRETE SIGNAL\n\nJUMPER JP1 FOR PRESENCE OF ROM PAGE \nIN LOWER 32K MEMORY MAP\n\nADD JUMPER JP1 FOR SINGLE ROM \nBOARD IN SYSTEM TO BOOT FROM ROM\n\n/BOOT_ROM=0 Jumper Installed\n/BOOT_ROM=1 Jumper Not Installed\n\nBOOT_OVERRIDE=0 No\nBOOT_OVERRIDE=1 Yes\n\n/BOOT_ROM  BOOT_OVERRIDE  OUTCOME  RESULT\n0             0                 0         ROM responds            \n0             1                 1         No ROM response\n1             0                 1         No ROM response\n1             1                 0         ROM responds
Wire Notes Line
	13750 14400 13750 15600
Wire Notes Line
	13750 15600 11450 15600
Text Label 7450 8300 0    60   ~ 0
b/MREQ
Text Notes 12950 7600 0    60   ~ 0
ROM0\nK1 = USE FOR 32 PIN EPROM OR 28 PIN EPROM\nK6 = USE FOR 27C080 EPROM OR 29C040 FLASH\nK8 = USE FOR 27C080 EPROM OR 29C040 FLASH
Text Notes 12950 8100 0    60   ~ 0
ROM1\nK3 = USE FOR 32 PIN EPROM OR 28 PIN EPROM\nK4 = USE FOR 27C080 EPROM OR 29C040 FLASH\nK5 = USE FOR 27C080 EPROM OR 29C040 FLASH
Text Notes 10000 7600 0    60   ~ 0
ROM SELECTION CIRCUIT\nROM0 OR ROM1
Text Label 9400 5250 1    60   ~ 0
b/WR
Text Label 13700 5250 1    60   ~ 0
b/WR
Text Label 9450 6750 0    60   ~ 0
b/WR
Text Label 3150 6350 0    60   ~ 0
b/RESET
Text Label 4950 6950 0    60   ~ 0
/MPCL_WR
Text Label 8250 6550 0    60   ~ 0
b/RD
Text Label 7600 7350 0    60   ~ 0
b/RD
Text Label 8250 6350 0    60   ~ 0
ROM_SIZE
Text Label 10150 7200 0    60   ~ 0
ROM_SIZE
Text Label 10300 5150 0    60   ~ 0
CS_ROM0#
Text Label 12650 5850 0    60   ~ 0
CS_ROM1#
Text Notes 10900 2550 0    60   ~ 0
ROM0
Text Notes 15300 2550 0    60   ~ 0
ROM1
Text Notes 6050 2500 0    60   ~ 0
IO ADDRESS SELECT CIRCUIT
Text Notes 4300 5050 0    60   ~ 0
ROM MEMORY PAGING \nCONFIGURATION LATCH
Text Label 3000 7050 0    60   ~ 0
b/IORQ
Text Label 3000 7150 0    60   ~ 0
b/MREQ
Text Label 3000 7250 0    60   ~ 0
b/WR
Text Label 3000 7350 0    60   ~ 0
b/RD
Text Notes 4700 4150 0    60   ~ 0
SET IO \nADDRESS
Text Notes 8250 7700 0    60   ~ 0
Enable ROM when memory request\nis received (b/MREQ=0) and \naccessing lower 32K (bA15=0) and \nROM enable is active \n(/LOW_ROM_EN=0)
Wire Wire Line
	6800 7900 6800 6050
Text Label 7450 8500 0    60   ~ 0
BOOT
Wire Wire Line
	7100 4550 7000 4550
Text Label 1200 6950 0    60   ~ 0
/M1
Wire Wire Line
	1100 6950 1500 6950
Text Label 3000 6950 0    60   ~ 0
b/M1
Wire Wire Line
	3900 6950 3900 10250
Text Label 7000 4950 1    60   ~ 0
688SEL#
Text Label 7000 10100 1    60   ~ 0
688SEL#
Text Notes 5900 10550 0    60   ~ 0
Interrupt filter circuit
Wire Wire Line
	8200 10400 8200 10250
Wire Wire Line
	1500 6350 1100 6350
Wire Wire Line
	1100 6350 1100 6500
Wire Wire Line
	1100 6500 3800 6500
Wire Wire Line
	3800 6500 3800 10600
Wire Wire Line
	3800 10600 8800 10600
Wire Wire Line
	8800 10600 8800 10150
Text Notes 8100 10900 0    60   ~ 0
Enable 74LS245 bus transceiver\non IO port select or ROM select
$Comp
L 74xx:74LS08 U9
U 3 1 604F8172
P 12600 15000
F 0 "U9" H 12600 15050 50  0000 C CNN
F 1 "74F08" H 12600 14950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12600 15000 50  0001 C CNN
F 3 "" H 12600 15000 50  0001 C CNN
	3    12600 15000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U9
U 4 1 604F8178
P 12600 15350
F 0 "U9" H 12600 15400 50  0000 C CNN
F 1 "74F08" H 12600 15300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12600 15350 50  0001 C CNN
F 3 "" H 12600 15350 50  0001 C CNN
	4    12600 15350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U9
U 1 1 604F86E6
P 8500 10150
F 0 "U9" H 8500 10200 50  0000 C CNN
F 1 "74F08" H 8500 10100 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8500 10150 50  0001 C CNN
F 3 "" H 8500 10150 50  0001 C CNN
	1    8500 10150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U9
U 5 1 604F884C
P 5350 14800
F 0 "U9" H 5350 14850 50  0000 C CNN
F 1 "74F08" H 5350 14750 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5350 14800 50  0001 C CNN
F 3 "" H 5350 14800 50  0001 C CNN
	5    5350 14800
	1    0    0    -1  
$EndComp
NoConn ~ 12900 14650
Wire Wire Line
	5450 13650 5700 13650
Wire Wire Line
	5200 13650 5450 13650
Wire Wire Line
	4950 13650 5200 13650
Wire Wire Line
	4700 13650 4950 13650
Wire Wire Line
	4700 14050 4950 14050
Wire Wire Line
	4950 14050 5200 14050
Wire Wire Line
	5200 14050 5450 14050
Wire Wire Line
	5450 14050 5700 14050
Wire Wire Line
	5700 14050 5950 14050
Wire Wire Line
	5700 13650 5950 13650
Wire Wire Line
	5950 13650 6200 13650
Wire Wire Line
	5950 14050 6200 14050
Wire Wire Line
	4450 14050 4700 14050
Wire Wire Line
	6200 13650 6450 13650
Wire Wire Line
	6200 14050 6450 14050
Wire Wire Line
	3950 14050 4200 14050
Wire Wire Line
	4450 13650 4700 13650
Wire Wire Line
	5200 3750 5200 3850
Wire Wire Line
	5200 3850 5200 3950
Wire Wire Line
	5200 3950 5200 4050
Wire Wire Line
	5200 4050 5200 4150
Wire Wire Line
	5200 4150 5200 4250
Wire Wire Line
	5200 4250 5200 4350
Wire Wire Line
	5200 4350 5200 4550
Wire Wire Line
	5900 4350 7100 4350
Wire Wire Line
	6000 4250 7100 4250
Wire Wire Line
	6100 4150 7100 4150
Wire Wire Line
	6200 4050 7100 4050
Wire Wire Line
	6300 3950 7100 3950
Wire Wire Line
	6400 3850 7100 3850
Wire Wire Line
	6500 3750 7100 3750
Wire Wire Line
	6600 3650 7100 3650
Wire Wire Line
	6450 13650 6700 13650
Wire Wire Line
	6450 14050 6700 14050
Wire Wire Line
	6350 15300 6850 15300
Wire Wire Line
	6350 14300 6850 14300
Wire Wire Line
	6850 14300 6950 14300
Wire Wire Line
	6700 13650 6950 13650
Wire Wire Line
	6950 13650 7250 13650
Wire Wire Line
	6850 15300 7250 15300
Wire Wire Line
	4200 13650 4450 13650
Wire Wire Line
	3950 13650 4200 13650
Wire Wire Line
	3700 13650 3950 13650
Wire Wire Line
	3450 14050 3700 14050
Wire Wire Line
	3700 14050 3950 14050
Wire Wire Line
	4200 14050 4450 14050
Wire Wire Line
	4800 6050 4950 6050
Wire Wire Line
	4700 5950 4950 5950
Wire Wire Line
	4600 5850 4950 5850
Wire Wire Line
	4500 5750 4950 5750
Wire Wire Line
	4400 5650 4950 5650
Wire Wire Line
	4300 5550 4950 5550
Wire Wire Line
	4200 5450 4950 5450
Wire Wire Line
	4100 5350 4950 5350
Wire Wire Line
	3700 3450 7100 3450
Wire Wire Line
	3600 3350 7100 3350
Wire Wire Line
	3500 3250 7100 3250
Wire Wire Line
	3400 3150 7100 3150
Wire Wire Line
	3300 3050 7100 3050
Wire Wire Line
	3200 2950 7100 2950
Wire Wire Line
	3100 2850 7100 2850
Wire Wire Line
	3000 2750 7100 2750
Wire Wire Line
	1000 7550 1000 7750
Wire Wire Line
	10100 850  14500 850 
Wire Wire Line
	10000 950  14400 950 
Wire Wire Line
	9900 1050 14300 1050
Wire Wire Line
	9800 1150 14200 1150
Wire Wire Line
	9700 1250 14100 1250
Wire Wire Line
	9600 1350 14000 1350
Wire Wire Line
	9500 1450 13900 1450
Wire Wire Line
	9400 1550 13800 1550
Wire Wire Line
	9300 1650 13700 1650
Wire Wire Line
	9200 1750 13600 1750
Wire Wire Line
	9100 1850 13500 1850
Wire Wire Line
	9000 1950 13400 1950
Wire Wire Line
	8900 2050 13300 2050
Wire Wire Line
	8800 2150 13200 2150
Wire Wire Line
	8700 2250 13100 2250
Wire Wire Line
	9300 6750 9900 6750
Wire Wire Line
	9300 6150 9300 6750
Wire Wire Line
	10100 6050 14400 6050
Wire Wire Line
	12400 9400 16800 9400
Wire Wire Line
	12300 9300 16700 9300
Wire Wire Line
	12200 9200 16600 9200
Wire Wire Line
	12100 9100 16500 9100
Wire Wire Line
	12000 9000 16400 9000
Wire Wire Line
	11900 8900 16300 8900
Wire Wire Line
	11800 8800 16200 8800
Wire Wire Line
	11700 8700 16100 8700
Wire Wire Line
	8700 4150 10200 4150
Wire Wire Line
	8800 4250 10200 4250
Wire Wire Line
	9700 5950 9700 6450
Wire Wire Line
	7650 5750 8000 5750
Wire Wire Line
	8900 5550 8900 6250
Wire Wire Line
	3450 13650 3700 13650
Wire Wire Line
	3200 14050 3450 14050
NoConn ~ 12900 15350
Wire Wire Line
	1000 4950 1000 7550
Wire Wire Line
	11150 6350 11150 7200
Wire Wire Line
	11350 5850 14500 5850
Connection ~ 10200 6550
Wire Wire Line
	10200 6550 14600 6550
Wire Wire Line
	10200 4850 10200 6550
Wire Wire Line
	14600 4850 14600 6550
Text Label 14300 6550 0    60   ~ 0
b/RD
Text Label 9000 10400 0    60   ~ 0
/CS_ROM
$Comp
L 74xx:74LS32 U3
U 4 1 6044B345
P 10800 8400
F 0 "U3" H 10800 8450 50  0000 C CNN
F 1 "74F32" H 10800 8350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10800 8400 50  0001 C CNN
F 3 "" H 10800 8400 50  0001 C CNN
	4    10800 8400
	1    0    0    -1  
$EndComp
Text Label 6050 5350 0    60   ~ 0
A15_ROM
Text Label 8250 5350 0    60   ~ 0
A15_ROM
Text Label 8250 5450 0    60   ~ 0
A16_ROM
Text Label 8250 5550 0    60   ~ 0
A17_ROM
Text Label 8250 5950 0    60   ~ 0
A18_ROM
Text Label 8250 6050 0    60   ~ 0
A19_ROM
Text Label 4900 9500 0    60   ~ 0
BOOT_OVERRIDE
Wire Wire Line
	9400 5300 9400 4700
Wire Wire Line
	9400 4700 9300 4700
Wire Wire Line
	9300 4700 9300 6150
Wire Wire Line
	13600 4700 13700 4700
Wire Wire Line
	13700 4700 13700 5300
Wire Wire Line
	13600 4700 13600 6150
Wire Wire Line
	14100 4700 14000 4700
Wire Wire Line
	13900 4700 13900 5300
Connection ~ 14000 4700
Wire Wire Line
	14000 4700 13900 4700
Wire Wire Line
	14000 4700 14000 6450
Wire Wire Line
	14300 4700 14400 4700
Wire Wire Line
	14400 4700 14400 6050
Wire Wire Line
	9600 5300 9600 4700
Wire Wire Line
	9600 4700 9700 4700
Connection ~ 9700 4700
Wire Wire Line
	9700 4700 9800 4700
Wire Wire Line
	9700 4700 9700 5950
Text Label 13300 6150 0    60   ~ 0
b/WR
Text Label 9350 6150 0    60   ~ 0
b/WR
Text Label 11250 7900 1    60   ~ 0
CS_ROM0#
Wire Wire Line
	6800 7900 8300 7900
Text Label 11350 8350 1    60   ~ 0
CS_ROM1#
Wire Wire Line
	11350 5850 11350 8400
Wire Wire Line
	8200 10400 9500 10400
Wire Wire Line
	2950 15300 4850 15300
Wire Wire Line
	7000 4550 7000 10150
Wire Wire Line
	3900 10250 5800 10250
$Comp
L 74xx:74LS08 U9
U 2 1 604F816C
P 12600 14650
F 0 "U9" H 12600 14700 50  0000 C CNN
F 1 "74F08" H 12600 14600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12600 14650 50  0001 C CNN
F 3 "" H 12600 14650 50  0001 C CNN
	2    12600 14650
	1    0    0    -1  
$EndComp
NoConn ~ 12150 15000
NoConn ~ 12150 15350
NoConn ~ 12300 14550
NoConn ~ 12300 14750
NoConn ~ 12300 14900
NoConn ~ 12300 15100
NoConn ~ 12300 15250
NoConn ~ 12300 15450
NoConn ~ 13050 14550
NoConn ~ 13050 14750
NoConn ~ 13050 14900
NoConn ~ 13050 15100
NoConn ~ 13050 15250
NoConn ~ 13050 15450
Wire Wire Line
	5350 15300 5850 15300
Wire Wire Line
	5350 14300 5850 14300
Connection ~ 5850 14300
Wire Wire Line
	5850 14300 6350 14300
Connection ~ 5850 15300
Wire Wire Line
	5850 15300 6350 15300
$Comp
L 74xx:74LS02 U1
U 1 1 60669BB6
P 6100 10250
F 0 "U1" H 6100 10300 50  0000 C CNN
F 1 "74F02" H 6100 10200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6100 10250 50  0001 C CNN
F 3 "" H 6100 10250 50  0001 C CNN
	1    6100 10250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U1
U 2 1 6066AA56
P 11850 14650
F 0 "U1" H 11850 14700 50  0000 C CNN
F 1 "74F02" H 11850 14600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 11850 14650 50  0001 C CNN
F 3 "" H 11850 14650 50  0001 C CNN
	2    11850 14650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U1
U 3 1 6066C920
P 10200 8500
F 0 "U1" H 10200 8550 50  0000 C CNN
F 1 "74F02" H 10200 8450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10200 8500 50  0001 C CNN
F 3 "" H 10200 8500 50  0001 C CNN
	3    10200 8500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U1
U 4 1 6066E493
P 11850 15350
F 0 "U1" H 11850 15400 50  0000 C CNN
F 1 "74F02" H 11850 15300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 11850 15350 50  0001 C CNN
F 3 "" H 11850 15350 50  0001 C CNN
	4    11850 15350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U1
U 5 1 6066FFF2
P 5850 14800
F 0 "U1" H 5750 14850 50  0000 L CNN
F 1 "74F02" H 5700 14750 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5850 14800 50  0001 C CNN
F 3 "" H 5850 14800 50  0001 C CNN
	5    5850 14800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U8
U 1 1 60732955
P 8600 8000
F 0 "U8" H 8600 8050 50  0000 C CNN
F 1 "74F32" H 8600 7950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8600 8000 50  0001 C CNN
F 3 "" H 8600 8000 50  0001 C CNN
	1    8600 8000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U8
U 2 1 60734DEE
P 8600 8400
F 0 "U8" H 8600 8450 50  0000 C CNN
F 1 "74F32" H 8600 8350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8600 8400 50  0001 C CNN
F 3 "" H 8600 8400 50  0001 C CNN
	2    8600 8400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U8
U 3 1 60735FFE
P 9200 8300
F 0 "U8" H 9200 8350 50  0000 C CNN
F 1 "74F32" H 9200 8250 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9200 8300 50  0001 C CNN
F 3 "" H 9200 8300 50  0001 C CNN
	3    9200 8300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U8
U 4 1 60736008
P 6700 10150
F 0 "U8" H 6700 10200 50  0000 C CNN
F 1 "74F32" H 6700 10100 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6700 10150 50  0001 C CNN
F 3 "" H 6700 10150 50  0001 C CNN
	4    6700 10150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U8
U 5 1 60792ACE
P 4850 14800
F 0 "U8" H 4750 14850 50  0000 L CNN
F 1 "74F32" H 4700 14750 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4850 14800 50  0001 C CNN
F 3 "" H 4850 14800 50  0001 C CNN
	5    4850 14800
	1    0    0    -1  
$EndComp
Connection ~ 4850 15300
Wire Wire Line
	4850 15300 5350 15300
Wire Wire Line
	5350 14300 4850 14300
Connection ~ 5350 14300
Wire Wire Line
	4000 8100 8300 8100
Wire Wire Line
	7300 8300 8300 8300
Wire Wire Line
	3500 8500 8300 8500
Wire Wire Line
	8900 8000 8900 8200
Wire Wire Line
	11250 5150 11250 8000
Wire Wire Line
	9900 8600 9900 8400
Wire Wire Line
	9900 7200 11150 7200
Connection ~ 9900 8400
Wire Wire Line
	9900 8400 9900 7900
Wire Wire Line
	10500 7900 9900 7900
Connection ~ 9900 7900
Wire Wire Line
	9900 7900 9900 7200
Wire Wire Line
	9500 8300 10500 8300
Wire Wire Line
	10500 8100 10500 8300
Connection ~ 10500 8300
Wire Wire Line
	9500 8300 9500 10400
Connection ~ 9500 8300
Wire Wire Line
	11100 8000 11250 8000
Wire Wire Line
	11100 8400 11350 8400
NoConn ~ 11550 14900
NoConn ~ 11550 15100
NoConn ~ 11550 15250
NoConn ~ 11550 15450
Wire Wire Line
	3700 6750 2900 6750
Wire Wire Line
	2900 6950 3900 6950
Wire Wire Line
	2900 6850 3600 6850
Wire Wire Line
	11250 9600 900  9600
Wire Wire Line
	900  9600 900  6850
Wire Wire Line
	900  6850 1500 6850
Wire Wire Line
	11250 8000 11250 9600
Connection ~ 11250 8000
Wire Wire Line
	1500 6750 800  6750
Wire Wire Line
	800  6750 800  9700
Wire Wire Line
	800  9700 11350 9700
Wire Wire Line
	11350 9700 11350 8400
Connection ~ 11350 8400
$Comp
L Z80ROM2-rescue:R-device-Z80ROM-rescue R2
U 1 1 622CF62E
P 2900 10150
F 0 "R2" V 2980 10150 50  0000 C CNN
F 1 "470" V 2900 10150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 2900 10150 60  0001 C CNN
F 3 "" H 2900 10150 60  0001 C CNN
	1    2900 10150
	-1   0    0    1   
$EndComp
$Comp
L device:LED D2
U 1 1 622CF624
P 2900 10600
F 0 "D2" H 2900 10700 50  0000 C CNN
F 1 "LED" H 2900 10500 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 2900 10600 60  0001 C CNN
F 3 "" H 2900 10600 60  0001 C CNN
	1    2900 10600
	0    -1   -1   0   
$EndComp
$Comp
L Z80ROM2-rescue:R-device-Z80ROM-rescue R3
U 1 1 6232704F
P 3300 10150
F 0 "R3" V 3380 10150 50  0000 C CNN
F 1 "470" V 3300 10150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3300 10150 60  0001 C CNN
F 3 "" H 3300 10150 60  0001 C CNN
	1    3300 10150
	-1   0    0    1   
$EndComp
$Comp
L device:LED D3
U 1 1 62327033
P 3300 10600
F 0 "D3" H 3300 10700 50  0000 C CNN
F 1 "LED" H 3300 10500 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 3300 10600 60  0001 C CNN
F 3 "" H 3300 10600 60  0001 C CNN
	1    3300 10600
	0    -1   -1   0   
$EndComp
$Comp
L Z80ROM2-rescue:VCC-00JRCsch #PWR015
U 1 1 6292C966
P 3300 9900
F 0 "#PWR015" H 3300 10000 30  0001 C CNN
F 1 "VCC" H 3303 10028 30  0000 C CNN
F 2 "" H 3300 9900 60  0000 C CNN
F 3 "" H 3300 9900 60  0000 C CNN
	1    3300 9900
	1    0    0    -1  
$EndComp
$Comp
L Z80ROM2-rescue:VCC-00JRCsch #PWR014
U 1 1 6292DD1D
P 2900 9900
F 0 "#PWR014" H 2900 10000 30  0001 C CNN
F 1 "VCC" H 2903 10028 30  0000 C CNN
F 2 "" H 2900 9900 60  0000 C CNN
F 3 "" H 2900 9900 60  0000 C CNN
	1    2900 9900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 10800 3300 10800
Wire Wire Line
	3600 6850 3600 10800
Wire Wire Line
	3700 10900 2900 10900
Wire Wire Line
	3700 6750 3700 10900
Text Notes 3450 10250 1    60   ~ 0
ROM0
Text Notes 3050 10250 1    60   ~ 0
ROM1
Text Label 10350 9700 0    60   ~ 0
CS_ROM1#
Text Label 10350 9600 0    60   ~ 0
CS_ROM0#
Wire Wire Line
	3300 10450 3300 10400
Wire Wire Line
	3300 10800 3300 10750
Wire Wire Line
	2900 10750 2900 10900
Wire Wire Line
	2900 10450 2900 10400
Wire Wire Line
	7250 14200 7250 14150
Wire Wire Line
	7250 14500 7250 15300
Wire Wire Line
	5800 10150 5800 10250
Connection ~ 5800 10250
Wire Wire Line
	5800 10250 5800 10350
Wire Wire Line
	6400 10050 5800 10050
Wire Wire Line
	5800 7050 5800 10050
NoConn ~ 12150 14650
NoConn ~ 11550 14550
NoConn ~ 11550 14750
Wire Wire Line
	8200 6950 9900 6950
Connection ~ 8200 6950
Wire Wire Line
	8200 6950 8200 10050
Wire Wire Line
	8200 2750 8200 6950
Text Notes 14150 12500 0    60   ~ 0
TRUTH TABLE A: ROM CHIP SELECT\nCS_ROM# = 0 MEANS ROM SELECTED\n\nM=MREQ#\nB=BOOT#\nL=LOW_ROM_EN#\n5=A15  (0=LOWER 32K PAGE, 1=UPPER 32K PAGE)\nX=CS_ROM#\n\nM  B  L  5  X\n0  0  0  0  1  ; MEMORY ACCESS IN LOWER MEMORY WHEN LOW_ROM ENABLED & BOOT ACTIVE, ENABLED\n0  0  0  1  0  ; MEMORY ACCESS IN UPPER MEMORY WHEN LOW_ROM ENABLED & BOOT ACTIVE, DENIED\n0  0  1  0  0  ; MEMORY ACCESS IN LOWER MEMORY WHEN LOW_ROM DISABLED & BOOT ACTIVE, DENIED\n0  0  1  1  0  ; MEMORY ACCESS IN UPPER MEMORY WHEN LOW_ROM DISABLED & BOOT ACTIVE, DENIED\n0  1  0  0  1  ; BOOT NOT ACTIVE OR OVERRIDDEN, DENIED\n0  1  0  1  1  ; BOOT NOT ACTIVE OR OVERRIDDEN, DENIED\n0  1  1  0  1  ; BOOT NOT ACTIVE OR OVERRIDDEN, DENIED\n0  1  1  1  1  ; BOOT NOT ACTIVE OR OVERRIDDEN, DENIED\n1  0  0  0  1  ; NOT MEMORY ACCESS, DENIED\n1  0  0  1  1  ; NOT MEMORY ACCESS, DENIED\n1  0  1  0  1  ; NOT MEMORY ACCESS, DENIED\n1  0  1  1  1  ; NOT MEMORY ACCESS, DENIED\n1  1  0  0  1  ; NOT MEMORY ACCESS, DENIED\n1  1  0  1  1  ; NOT MEMORY ACCESS, DENIED\n1  1  1  0  1  ; NOT MEMORY ACCESS, DENIED\n1  1  1  1  1  ; NOT MEMORY ACCESS, DENIED
Text Notes 9200 7950 0    120  ~ 0
A
Text Notes 10900 7750 0    120  ~ 0
B
Text Notes 14450 14250 0    60   ~ 0
TRUTH TABLE B: DETERMINE WHICH ROM CHIP SELECTED\n\nC=CS_ROM#\nR=ROMSIZE (SELECT FIRST OR SECOND ROM CHIP)\nR0=CS_ROM0#\nR1=CS_ROM1#\n\nC  R  R0  R1\n0  0   0   1  ; ROM ACCESS, ENABLE FIRST CHIP\n0  1   1   0  ; ROM ACCESS, ENABLE SECOND CHIP\n1  0   1   1  ; NOT ROM ACCESS, DENIED\n1  1   1   1  ; NOT ROM ACCESS, DENIED
$Comp
L mechanical:MountingHole_Pad H1
U 1 1 617276F3
P 9650 14800
F 0 "H1" H 9750 14849 50  0000 L CNN
F 1 "MountingHole_Pad" H 9750 14758 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_2.2mm_M2_Pad" H 9650 14800 50  0001 C CNN
F 3 "~" H 9650 14800 50  0001 C CNN
	1    9650 14800
	1    0    0    -1  
$EndComp
$Comp
L mechanical:MountingHole_Pad H2
U 1 1 6172B6BF
P 10550 14800
F 0 "H2" H 10650 14849 50  0000 L CNN
F 1 "MountingHole_Pad" H 10650 14758 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_2.2mm_M2_Pad" H 10550 14800 50  0001 C CNN
F 3 "~" H 10550 14800 50  0001 C CNN
	1    10550 14800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 14900 10550 14900
$Comp
L power:GND #PWR016
U 1 1 617915D2
P 9650 14900
F 0 "#PWR016" H 9650 14650 50  0001 C CNN
F 1 "GND" H 9655 14727 50  0000 C CNN
F 2 "" H 9650 14900 50  0001 C CNN
F 3 "" H 9650 14900 50  0001 C CNN
	1    9650 14900
	1    0    0    -1  
$EndComp
Connection ~ 9650 14900
$EndSCHEMATC
