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
L 74xx:74LS245 U2
U 1 1 603971FD
P 1850 3725
F 0 "U2" H 1950 4300 60  0000 L BNN
F 1 "74LS245" H 1925 3050 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 1850 3725 60  0001 C CNN
F 3 "" H 1850 3725 60  0001 C CNN
	1    1850 3725
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:C-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C1
U 1 1 603A8E72
P 1050 7450
F 0 "C1" H 1100 7550 50  0000 L CNN
F 1 "0.1u" H 1100 7350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1050 7450 60  0001 C CNN
F 3 "" H 1050 7450 60  0001 C CNN
	1    1050 7450
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:C-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C2
U 1 1 603A8ED5
P 1300 7450
F 0 "C2" H 1350 7550 50  0000 L CNN
F 1 "0.1u" H 1350 7350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1300 7450 60  0001 C CNN
F 3 "" H 1300 7450 60  0001 C CNN
	1    1300 7450
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:C-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C3
U 1 1 603A8F23
P 1550 7450
F 0 "C3" H 1600 7550 50  0000 L CNN
F 1 "0.1u" H 1600 7350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1550 7450 60  0001 C CNN
F 3 "" H 1550 7450 60  0001 C CNN
	1    1550 7450
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:C-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C4
U 1 1 603A8F29
P 1800 7450
F 0 "C4" H 1850 7550 50  0000 L CNN
F 1 "0.1u" H 1850 7350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1800 7450 60  0001 C CNN
F 3 "" H 1800 7450 60  0001 C CNN
	1    1800 7450
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:C-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C5
U 1 1 603A8FA5
P 2050 7450
F 0 "C5" H 2100 7550 50  0000 L CNN
F 1 "0.1u" H 2100 7350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2050 7450 60  0001 C CNN
F 3 "" H 2050 7450 60  0001 C CNN
	1    2050 7450
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:GND-power-Z80PPIDE2-rescue #PWR03
U 1 1 603A93CE
P 2300 7700
F 0 "#PWR03" H 2300 7700 30  0001 C CNN
F 1 "GND" H 2300 7630 30  0001 C CNN
F 2 "" H 2300 7700 60  0001 C CNN
F 3 "" H 2300 7700 60  0001 C CNN
	1    2300 7700
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR02
U 1 1 603A9412
P 2300 7250
F 0 "#PWR02" H 2300 7350 30  0001 C CNN
F 1 "VCC" H 2300 7350 30  0000 C CNN
F 2 "" H 2300 7250 60  0001 C CNN
F 3 "" H 2300 7250 60  0001 C CNN
	1    2300 7250
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 603A9456
P 3050 7250
F 0 "#FLG02" H 3050 7345 30  0001 C CNN
F 1 "PWR_FLAG" H 3050 7430 30  0000 C CNN
F 2 "" H 3050 7250 60  0001 C CNN
F 3 "" H 3050 7250 60  0001 C CNN
	1    3050 7250
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 603A949A
P 800 7650
F 0 "#FLG01" H 800 7745 30  0001 C CNN
F 1 "PWR_FLAG" H 800 7830 30  0000 C CNN
F 2 "" H 800 7650 60  0001 C CNN
F 3 "" H 800 7650 60  0001 C CNN
	1    800  7650
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:CP-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C10
U 1 1 6039BD2A
P 4300 7450
F 0 "C10" H 4350 7550 50  0000 L CNN
F 1 "10u" H 4350 7350 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4300 7450 60  0001 C CNN
F 3 "" H 4300 7450 60  0001 C CNN
	1    4300 7450
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:CP-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C11
U 1 1 603A3D80
P 4575 7450
F 0 "C11" H 4625 7550 50  0000 L CNN
F 1 "10u" H 4625 7350 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4575 7450 60  0001 C CNN
F 3 "" H 4575 7450 60  0001 C CNN
	1    4575 7450
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:LED-device D2
U 1 1 603A5584
P 6575 7950
F 0 "D2" H 6575 8050 50  0000 C CNN
F 1 "LED" H 6575 7850 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 6575 7950 60  0001 C CNN
F 3 "" H 6575 7950 60  0001 C CNN
	1    6575 7950
	0    -1   -1   0   
$EndComp
$Comp
L Z80PPIDE2-rescue:R-device-Z80PPIDE-rescue-Z80PPIDE2-rescue R2
U 1 1 603A596D
P 6575 7500
F 0 "R2" V 6655 7500 50  0000 C CNN
F 1 "470" V 6575 7500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6575 7500 60  0001 C CNN
F 3 "" H 6575 7500 60  0001 C CNN
	1    6575 7500
	-1   0    0    1   
$EndComp
$Comp
L Z80PPIDE2-rescue:CONN_25X2-conn-Z80PPIDE2-rescue P2
U 1 1 603D6D37
P 8100 8925
F 0 "P2" H 8100 10225 60  0000 C CNN
F 1 "Z80 BUS INTERFACE" V 8100 8925 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x25_P2.54mm_Horizontal" H 8100 8925 60  0001 C CNN
F 3 "" H 8100 8925 60  0001 C CNN
	1    8100 8925
	1    0    0    -1  
$EndComp
Text Notes 7125 7550 0    60   ~ 0
Note: Bus connector is mirror image of Z80\nCPU pin out to mate to backplane whose\nconnectors reflect Z80 CPU pin out.
NoConn ~ 2200 5475
NoConn ~ 2200 5375
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 6044C0E0
P 3475 2425
F 0 "SW1" H 3475 2975 50  0000 C CNN
F 1 "IO PORT ADDR" H 3475 1975 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Slide_9.78x22.5mm_W7.62mm_P2.54mm" H 3475 2425 50  0001 C CNN
F 3 "" H 3475 2425 50  0001 C CNN
	1    3475 2425
	1    0    0    1   
$EndComp
$Comp
L Z80PPIDE2-rescue:RR8-device-Z80PPIDE-rescue-Z80PPIDE2-rescue RR1
U 1 1 6044D2F4
P 4225 3375
F 0 "RR1" H 4275 3975 70  0000 C CNN
F 1 "10K" V 4255 3375 70  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" H 4225 3375 60  0001 C CNN
F 3 "" H 4225 3375 60  0001 C CNN
	1    4225 3375
	0    1    1    0   
$EndComp
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR07
U 1 1 6044E13A
P 5575 925
F 0 "#PWR07" H 5575 1025 30  0001 C CNN
F 1 "VCC" H 5575 1025 30  0000 C CNN
F 2 "" H 5575 925 60  0001 C CNN
F 3 "" H 5575 925 60  0001 C CNN
	1    5575 925 
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:GND-power-Z80PPIDE2-rescue #PWR08
U 1 1 6044E58D
P 5575 3325
F 0 "#PWR08" H 5575 3325 30  0001 C CNN
F 1 "GND" H 5575 3255 30  0001 C CNN
F 2 "" H 5575 3325 60  0001 C CNN
F 3 "" H 5575 3325 60  0001 C CNN
	1    5575 3325
	1    0    0    -1  
$EndComp
Text Notes 5750 6575 0    60   ~ 0
Note: IO Address Port 64-byte blocks\nS1=on - A7 (low)\nS2=off - A6 (high)\nS3=off - A5 (no effect)\nS4=on - A4 (no effect)\nS5=on - A3 (no effect)\nS6=on - A2 (no effect)\nS7=x - A1 (no effect)\nS8=x - A0 (no effect)
Text Notes 4275 6000 0    60   ~ 0
Note: Inhibit Board Operation\nDuring Interrupts\nM1# = low, IORQ# = low
$Comp
L 74xx:74LS688 U7
U 1 1 604A100F
P 5575 2125
F 0 "U7" H 5275 3175 50  0000 C CNN
F 1 "74LS688" H 5275 1075 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket" H 5575 2125 50  0001 C CNN
F 3 "" H 5575 2125 50  0001 C CNN
	1    5575 2125
	1    0    0    -1  
$EndComp
Text Notes 700  7075 0    60   ~ 0
Note: Buffers/Transceivers\nrespond to IO and MEM cycles
Text Notes 850  950  0    60   ~ 0
Z80 BUS INTERFACE
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR06
U 1 1 604651AE
P 4675 3025
F 0 "#PWR06" H 4675 3125 30  0001 C CNN
F 1 "VCC" H 4675 3125 30  0000 C CNN
F 2 "" H 4675 3025 60  0001 C CNN
F 3 "" H 4675 3025 60  0001 C CNN
	1    4675 3025
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 7250 1300 7250
Wire Wire Line
	800  7650 1050 7650
Connection ~ 3050 7250
Connection ~ 2300 7250
Connection ~ 2300 7650
Wire Wire Line
	2300 7650 2300 7700
Connection ~ 2050 7650
Connection ~ 1550 7650
Connection ~ 2050 7250
Connection ~ 3175 2225
Connection ~ 3175 2325
Connection ~ 3175 2425
Connection ~ 3175 2525
Connection ~ 3175 2625
Connection ~ 3175 2725
Connection ~ 3175 2825
Wire Wire Line
	3775 2725 3975 2725
Wire Wire Line
	3775 2825 3875 2825
Wire Wire Line
	3875 3025 3875 2825
Connection ~ 3875 2825
Wire Wire Line
	3975 3025 3975 2725
Connection ~ 3975 2725
Wire Wire Line
	4075 3025 4075 2625
Wire Wire Line
	4175 3025 4175 2525
Wire Wire Line
	4275 3025 4275 2425
Wire Wire Line
	4375 3025 4375 2325
Wire Wire Line
	4475 3025 4475 2225
Wire Wire Line
	4575 3025 4575 2125
Wire Wire Line
	3175 2125 3175 2225
Connection ~ 800  7650
Wire Wire Line
	800  7650 800  8900
Connection ~ 1800 7250
Connection ~ 1550 7250
Connection ~ 1300 7250
Connection ~ 1050 7650
Connection ~ 1300 7650
Connection ~ 1800 7650
$Comp
L Z80PPIDE2-rescue:GND-power-Z80PPIDE2-rescue #PWR05
U 1 1 60465D86
P 3175 3025
F 0 "#PWR05" H 3175 3025 30  0001 C CNN
F 1 "GND" H 3175 2955 30  0001 C CNN
F 2 "" H 3175 3025 60  0001 C CNN
F 3 "" H 3175 3025 60  0001 C CNN
	1    3175 3025
	1    0    0    -1  
$EndComp
Text Notes 3650 3925 0    60   ~ 0
IO SELECTION CIRCUIT
Text Notes 3075 3275 0    60   ~ 0
SET IO PORT
Wire Wire Line
	2050 7650 2300 7650
Wire Wire Line
	1550 7650 1800 7650
Wire Wire Line
	2050 7250 2300 7250
Wire Wire Line
	3175 2225 3175 2325
Wire Wire Line
	3175 2325 3175 2425
Wire Wire Line
	3175 2425 3175 2525
Wire Wire Line
	3175 2525 3175 2625
Wire Wire Line
	3175 2625 3175 2725
Wire Wire Line
	3175 2725 3175 2825
Wire Wire Line
	3175 2825 3175 3025
Wire Wire Line
	3875 2825 5075 2825
Wire Wire Line
	3975 2725 5075 2725
Wire Wire Line
	4075 2625 5075 2625
Wire Wire Line
	4175 2525 5075 2525
Wire Wire Line
	4275 2425 5075 2425
Wire Wire Line
	4375 2325 5075 2325
Wire Wire Line
	4475 2225 5075 2225
Wire Wire Line
	4575 2125 5075 2125
Wire Wire Line
	1800 7250 2050 7250
Wire Wire Line
	1550 7250 1800 7250
Wire Wire Line
	1300 7250 1550 7250
Wire Wire Line
	1050 7650 1300 7650
Wire Wire Line
	1300 7650 1550 7650
Wire Wire Line
	1800 7650 2050 7650
$Comp
L 74xx:74LS244 U3
U 1 1 603971B6
P 1700 5675
F 0 "U3" H 1750 5475 60  0000 C CNN
F 1 "74LS244" H 1975 4975 60  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 1700 5675 60  0001 C CNN
F 3 "" H 1700 5675 60  0001 C CNN
	1    1700 5675
	1    0    0    -1  
$EndComp
NoConn ~ 1200 5375
NoConn ~ 1200 5475
$Comp
L 74xx:74LS244 U1
U 1 1 60BC80C2
P 1600 1950
F 0 "U1" H 1700 2525 60  0000 L BNN
F 1 "74LS244" H 1775 1300 60  0000 L TNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 1600 1950 60  0001 C CNN
F 3 "" H 1600 1950 60  0001 C CNN
	1    1600 1950
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:C-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C6
U 1 1 637B9E50
P 2300 7450
F 0 "C6" H 2350 7550 50  0000 L CNN
F 1 "0.1u" H 2350 7350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2300 7450 60  0001 C CNN
F 3 "" H 2300 7450 60  0001 C CNN
	1    2300 7450
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:LED-device D1
U 1 1 6068F1F7
P 3250 5275
F 0 "D1" H 3250 5375 50  0000 C CNN
F 1 "LED" H 3250 5175 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 3250 5275 60  0001 C CNN
F 3 "" H 3250 5275 60  0001 C CNN
	1    3250 5275
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:R-device-Z80PPIDE-rescue-Z80PPIDE2-rescue R1
U 1 1 6068F201
P 3400 4875
F 0 "R1" V 3480 4875 50  0000 C CNN
F 1 "470" V 3400 4875 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3400 4875 60  0001 C CNN
F 3 "" H 3400 4875 60  0001 C CNN
	1    3400 4875
	-1   0    0    1   
$EndComp
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR04
U 1 1 6071F0FB
P 3400 4625
F 0 "#PWR04" H 3400 4725 30  0001 C CNN
F 1 "VCC" H 3400 4725 30  0000 C CNN
F 2 "" H 3400 4625 60  0001 C CNN
F 3 "" H 3400 4625 60  0001 C CNN
	1    3400 4625
	1    0    0    -1  
$EndComp
Text Notes 3650 5375 1    60   ~ 0
IO CHIP SELECT
$Comp
L Z80-6502IO-rescue:CONN_13X2-conn P5
U 1 1 606F3EBC
P 12925 1875
F 0 "P5" H 12925 2696 60  0000 C CNN
F 1 "PPI" H 12925 2598 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x14_P2.54mm_Horizontal" H 12925 1875 60  0001 C CNN
F 3 "" H 12925 1875 60  0001 C CNN
	1    12925 1875
	1    0    0    -1  
$EndComp
NoConn ~ 3775 2125
NoConn ~ 3775 2225
Wire Wire Line
	6575 7800 6575 7750
Wire Wire Line
	6575 8100 6575 8900
Text Label 5075 4175 1    60   ~ 0
688SEL#
Wire Wire Line
	4975 1325 5075 1325
Wire Wire Line
	4975 1325 4975 1225
Wire Wire Line
	4975 1225 5075 1225
Connection ~ 4975 1325
$Comp
L Z80PPIDE2-rescue:MountingHole_Pad-mechanical H1
U 1 1 617BCAD0
P 875 10075
F 0 "H1" H 975 10124 50  0000 L CNN
F 1 "MountingHole_Pad" H 975 10033 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 875 10075 50  0001 C CNN
F 3 "~" H 875 10075 50  0001 C CNN
	1    875  10075
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:MountingHole_Pad-mechanical H2
U 1 1 617BD2AE
P 1775 10075
F 0 "H2" H 1875 10124 50  0000 L CNN
F 1 "MountingHole_Pad" H 1875 10033 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2_Pad" H 1775 10075 50  0001 C CNN
F 3 "~" H 1775 10075 50  0001 C CNN
	1    1775 10075
	1    0    0    -1  
$EndComp
Wire Wire Line
	875  10175 1775 10175
$Comp
L Z80PPIDE2-rescue:GND-00JRCsch-Z80PPIDE2-rescue #PWR01
U 1 1 617EA615
P 875 10225
F 0 "#PWR01" H 875 10225 30  0001 C CNN
F 1 "GND" H 875 10155 30  0001 C CNN
F 2 "" H 875 10225 60  0000 C CNN
F 3 "" H 875 10225 60  0000 C CNN
	1    875  10225
	1    0    0    -1  
$EndComp
Wire Wire Line
	875  10175 875  10225
Connection ~ 875  10175
Wire Wire Line
	2300 7250 2550 7250
Wire Wire Line
	2300 7650 2550 7650
$Comp
L 65xx:W65C22SxP U9
U 1 1 6225259E
P 11125 2375
F 0 "U9" H 11125 4075 50  0000 C CNN
F 1 "W65C22SxP" H 11125 4000 50  0000 C CIB
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 11125 2525 50  0001 C CNN
F 3 "http://www.westerndesigncenter.com/wdc/documentation/w65c22.pdf" H 11125 2525 50  0001 C CNN
	1    11125 2375
	1    0    0    -1  
$EndComp
Text Notes 7750 10400 0    60   ~ 0
42=Vcc\n43=GND\n
$Comp
L Z80PPIDE2-rescue:CP-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C9
U 1 1 6225AA73
P 4025 7450
F 0 "C9" H 4075 7550 50  0000 L CNN
F 1 "10u" H 4075 7350 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4025 7450 60  0001 C CNN
F 3 "" H 4025 7450 60  0001 C CNN
	1    4025 7450
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR017
U 1 1 6227076C
P 11125 925
F 0 "#PWR017" H 11125 1025 30  0001 C CNN
F 1 "VCC" H 11125 1025 30  0000 C CNN
F 2 "" H 11125 925 60  0001 C CNN
F 3 "" H 11125 925 60  0001 C CNN
	1    11125 925 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 62271E93
P 11125 3825
F 0 "#PWR018" H 11125 3575 50  0001 C CNN
F 1 "GND" H 11130 3652 50  0000 C CNN
F 2 "" H 11125 3825 50  0001 C CNN
F 3 "" H 11125 3825 50  0001 C CNN
	1    11125 3825
	1    0    0    -1  
$EndComp
Text GLabel 6075 1225 2    60   Output ~ 0
BOARD_CS#
Text GLabel 2350 3225 2    60   BiDi ~ 0
bD0
Text GLabel 2350 3325 2    60   BiDi ~ 0
bD1
Text GLabel 2350 3425 2    60   BiDi ~ 0
bD2
Text GLabel 2350 3525 2    60   BiDi ~ 0
bD3
Text GLabel 2350 3625 2    60   BiDi ~ 0
bD4
Text GLabel 2350 3725 2    60   BiDi ~ 0
bD5
Text GLabel 2350 3825 2    60   BiDi ~ 0
bD6
Text GLabel 2350 3925 2    60   BiDi ~ 0
bD7
Text GLabel 2200 5175 2    60   Output ~ 0
bRESET#
Text GLabel 2200 5875 2    60   Output ~ 0
bRD#
Text GLabel 2200 5775 2    60   Output ~ 0
bWR#
Text GLabel 10525 1275 0    60   Input ~ 0
bRESET#
Text GLabel 6400 4625 0    60   Output ~ 0
SLAVE_CLK
Text GLabel 10525 1375 0    60   Input ~ 0
SLAVE_CLK
Text GLabel 10525 2775 0    60   BiDi ~ 0
bD0
Text GLabel 10525 2875 0    60   BiDi ~ 0
bD1
Text GLabel 10525 2975 0    60   BiDi ~ 0
bD2
Text GLabel 10525 3075 0    60   BiDi ~ 0
bD3
Text GLabel 10525 3175 0    60   BiDi ~ 0
bD4
Text GLabel 10525 3275 0    60   BiDi ~ 0
bD5
Text GLabel 10525 3375 0    60   BiDi ~ 0
bD6
Text GLabel 10525 3475 0    60   BiDi ~ 0
bD7
$Comp
L 74xx:74LS04 U4
U 1 1 6216F49D
P 8375 3800
F 0 "U4" H 8375 4117 50  0000 C CNN
F 1 "74LS04" H 8375 4026 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8375 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 8375 3800 50  0001 C CNN
	1    8375 3800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U4
U 7 1 621759C6
P 4900 8125
F 0 "U4" H 4475 8150 50  0000 L CNN
F 1 "74LS04" H 4400 8050 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 4900 8125 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4900 8125 50  0001 C CNN
	7    4900 8125
	1    0    0    -1  
$EndComp
Text GLabel 8075 3800 0    60   Input ~ 0
bRD#
$Comp
L 74xx:74LS32 U5
U 1 1 621A9DE6
P 8975 3900
F 0 "U5" H 8975 4225 50  0000 C CNN
F 1 "74LS32" H 8975 4134 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 8975 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8975 3900 50  0001 C CNN
	1    8975 3900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U5
U 5 1 621AC24D
P 5350 8125
F 0 "U5" H 5400 7750 50  0000 L CNN
F 1 "74LS32" H 5400 7675 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5350 8125 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5350 8125 50  0001 C CNN
	5    5350 8125
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 7625 4900 7250
Wire Wire Line
	4900 8625 4900 8900
Text GLabel 8075 4125 0    60   Input ~ 0
bWR#
Wire Wire Line
	8075 4125 8475 4125
Wire Wire Line
	8475 4125 8475 4000
Wire Wire Line
	8475 4000 8675 4000
Text GLabel 9275 3900 2    60   Output ~ 0
bRW#
$Comp
L Z80PPIDE2-rescue:C-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C7
U 1 1 62254216
P 2550 7450
F 0 "C7" H 2600 7550 50  0000 L CNN
F 1 "0.1u" H 2600 7350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2550 7450 60  0001 C CNN
F 3 "" H 2550 7450 60  0001 C CNN
	1    2550 7450
	1    0    0    -1  
$EndComp
Connection ~ 2550 7250
Wire Wire Line
	2550 7250 2800 7250
Connection ~ 2550 7650
Wire Wire Line
	2550 7650 2800 7650
Text GLabel 10525 2575 0    60   Input ~ 0
bRW#
$Comp
L Z80PPIDE2-rescue:CONN_3-00JRCsch-Z80PPIDE2-rescue K1
U 1 1 6226DD7A
P 8525 5300
F 0 "K1" H 8392 4979 50  0000 C CNN
F 1 "INT SRC" H 8392 5063 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 8525 5300 60  0001 C CNN
F 3 "" H 8525 5300 60  0000 C CNN
	1    8525 5300
	1    0    0    -1  
$EndComp
Text GLabel 10525 1575 0    60   Output ~ 0
IRQV#
Text GLabel 8175 5300 0    60   Input ~ 0
IRQV#
Text GLabel 8175 5200 0    60   Output ~ 0
INT#
Text GLabel 8175 5400 0    60   Output ~ 0
NMI#
Text GLabel 8225 3175 0    60   Input ~ 0
BOARD_CS#
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR015
U 1 1 6228B068
P 10525 1775
F 0 "#PWR015" H 10525 1875 30  0001 C CNN
F 1 "VCC" H 10525 1875 30  0000 C CNN
F 2 "" H 10525 1775 60  0001 C CNN
F 3 "" H 10525 1775 60  0001 C CNN
	1    10525 1775
	0    -1   -1   0   
$EndComp
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR021
U 1 1 62344E2A
P 12525 2475
F 0 "#PWR021" H 12525 2575 30  0001 C CNN
F 1 "VCC" H 12525 2575 30  0000 C CNN
F 2 "" H 12525 2475 60  0001 C CNN
F 3 "" H 12525 2475 60  0001 C CNN
	1    12525 2475
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR023
U 1 1 623B226E
P 13325 2475
F 0 "#PWR023" H 13325 2225 50  0001 C CNN
F 1 "GND" H 13330 2302 50  0000 C CNN
F 2 "" H 13325 2475 50  0001 C CNN
F 3 "" H 13325 2475 50  0001 C CNN
	1    13325 2475
	1    0    0    -1  
$EndComp
Text GLabel 12525 1275 0    60   BiDi ~ 0
PA0
Text GLabel 12525 1375 0    60   BiDi ~ 0
PA1
Text GLabel 12525 1475 0    60   BiDi ~ 0
PA2
Text GLabel 12525 1575 0    60   BiDi ~ 0
PA3
Text GLabel 12525 1675 0    60   BiDi ~ 0
PA4
Text GLabel 12525 1775 0    60   BiDi ~ 0
PA5
Text GLabel 12525 1875 0    60   BiDi ~ 0
PA6
Text GLabel 12525 1975 0    60   BiDi ~ 0
PA7
Text GLabel 11725 2175 2    60   BiDi ~ 0
CA1
Text GLabel 11725 2275 2    60   BiDi ~ 0
CA2
Text GLabel 13325 1275 2    60   BiDi ~ 0
PB0
Text GLabel 13325 1375 2    60   BiDi ~ 0
PB1
Text GLabel 13325 1475 2    60   BiDi ~ 0
PB2
Text GLabel 13325 1575 2    60   BiDi ~ 0
PB3
Text GLabel 13325 1675 2    60   BiDi ~ 0
PB4
Text GLabel 13325 1775 2    60   BiDi ~ 0
PB5
Text GLabel 13325 1875 2    60   BiDi ~ 0
PB6
Text GLabel 13325 1975 2    60   BiDi ~ 0
PB7
Text GLabel 13325 2075 2    60   BiDi ~ 0
CB1
Text GLabel 13325 2175 2    60   BiDi ~ 0
CB2
NoConn ~ 13325 2275
NoConn ~ 13325 2375
NoConn ~ 12525 2375
NoConn ~ 12525 2275
Text GLabel 11725 1275 2    60   BiDi ~ 0
PA0
Text GLabel 11725 1375 2    60   BiDi ~ 0
PA1
Text GLabel 11725 1475 2    60   BiDi ~ 0
PA2
Text GLabel 11725 1575 2    60   BiDi ~ 0
PA3
Text GLabel 11725 1675 2    60   BiDi ~ 0
PA4
Text GLabel 11725 1775 2    60   BiDi ~ 0
PA5
Text GLabel 11725 1875 2    60   BiDi ~ 0
PA6
Text GLabel 11725 1975 2    60   BiDi ~ 0
PA7
Text GLabel 11725 2475 2    60   BiDi ~ 0
PB0
Text GLabel 11725 2575 2    60   BiDi ~ 0
PB1
Text GLabel 11725 2675 2    60   BiDi ~ 0
PB2
Text GLabel 11725 2775 2    60   BiDi ~ 0
PB3
Text GLabel 11725 2875 2    60   BiDi ~ 0
PB4
Text GLabel 11725 2975 2    60   BiDi ~ 0
PB5
Text GLabel 11725 3075 2    60   BiDi ~ 0
PB6
Text GLabel 11725 3175 2    60   BiDi ~ 0
PB7
Text GLabel 11725 3375 2    60   BiDi ~ 0
CB1
Text GLabel 11725 3475 2    60   BiDi ~ 0
CB2
Text GLabel 12525 2075 0    60   BiDi ~ 0
CA1
Text GLabel 12525 2175 0    60   BiDi ~ 0
CA2
Text GLabel 8500 7725 2    60   Output ~ 0
A11
Text GLabel 8500 7825 2    60   Output ~ 0
A12
Text GLabel 8500 7925 2    60   Output ~ 0
A13
Text GLabel 8500 8025 2    60   Output ~ 0
A14
Text GLabel 8500 8125 2    60   Output ~ 0
A15
Text GLabel 8500 8225 2    60   Output ~ 0
CLK
Text GLabel 8500 8325 2    60   BiDi ~ 0
D4
Text GLabel 8500 8425 2    60   BiDi ~ 0
D3
Text GLabel 8500 8525 2    60   BiDi ~ 0
D5
Text GLabel 8500 8625 2    60   BiDi ~ 0
D6
Text GLabel 8500 8825 2    60   BiDi ~ 0
D2
Text GLabel 8500 8925 2    60   BiDi ~ 0
D7
Text GLabel 8500 9025 2    60   BiDi ~ 0
D0
Text GLabel 8500 9125 2    60   BiDi ~ 0
D1
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR010
U 1 1 62521ED2
P 8800 8725
F 0 "#PWR010" H 8800 8825 30  0001 C CNN
F 1 "VCC" H 8800 8825 30  0000 C CNN
F 2 "" H 8800 8725 60  0001 C CNN
F 3 "" H 8800 8725 60  0001 C CNN
	1    8800 8725
	0    1    1    0   
$EndComp
NoConn ~ 8500 7725
NoConn ~ 8500 7825
NoConn ~ 8500 7925
NoConn ~ 8500 8025
NoConn ~ 8500 8125
NoConn ~ 8500 8225
Text GLabel 8500 9225 2    60   Input ~ 0
INT#
Text GLabel 8500 9325 2    60   Input ~ 0
NMI#
Text GLabel 8500 9425 2    60   Input ~ 0
HALT#
Text GLabel 8500 9525 2    60   Output ~ 0
MREQ#
Text GLabel 8500 9625 2    60   Output ~ 0
IORQ#
Text GLabel 8500 9725 2    60   3State ~ 0
SPARE0
Text GLabel 8500 9825 2    60   3State ~ 0
SPARE1
Text GLabel 8500 9925 2    60   3State ~ 0
SPARE2
Text GLabel 8500 10025 2    60   3State ~ 0
SPARE3
Text GLabel 8500 10125 2    60   3State ~ 0
SPARE4
NoConn ~ 8500 9425
NoConn ~ 8500 9525
NoConn ~ 8500 9725
NoConn ~ 8500 9825
NoConn ~ 8500 9925
NoConn ~ 8500 10025
NoConn ~ 8500 10125
Text GLabel 7700 7725 0    60   Output ~ 0
A10
Text GLabel 7700 7825 0    60   Output ~ 0
A9
Text GLabel 7700 7925 0    60   Output ~ 0
A8
Text GLabel 7700 8025 0    60   Output ~ 0
A7
Text GLabel 7700 8125 0    60   Output ~ 0
A6
Text GLabel 7700 8225 0    60   Output ~ 0
A5
Text GLabel 7700 8325 0    60   Output ~ 0
A4
Text GLabel 7700 8425 0    60   Output ~ 0
A3
Text GLabel 7700 8525 0    60   Output ~ 0
A2
Text GLabel 7700 8625 0    60   Output ~ 0
A1
Text GLabel 7700 8725 0    60   Output ~ 0
A0
Text GLabel 7700 8925 0    60   Output ~ 0
RFSH#
Text GLabel 7700 9025 0    60   Output ~ 0
M1#
Text GLabel 7700 9125 0    60   Output ~ 0
RESET#
Text GLabel 7700 9225 0    60   Input ~ 0
BUSRQ#
Text GLabel 7700 9325 0    60   Input ~ 0
WAIT#
Text GLabel 7700 9425 0    60   Output ~ 0
BUSACK#
Text GLabel 7700 9525 0    60   Output ~ 0
WR#
Text GLabel 7700 9625 0    60   Output ~ 0
RD#
Text GLabel 7700 9825 0    60   3State ~ 0
SPARE8
Text GLabel 7700 9925 0    60   3State ~ 0
SPARE7
Text GLabel 7700 10025 0    60   3State ~ 0
SPARE6
Text GLabel 7700 10125 0    60   3State ~ 0
SPARE5
$Comp
L power:GND #PWR09
U 1 1 6268C4E0
P 7325 8825
F 0 "#PWR09" H 7325 8575 50  0001 C CNN
F 1 "GND" H 7330 8652 50  0000 C CNN
F 2 "" H 7325 8825 50  0001 C CNN
F 3 "" H 7325 8825 50  0001 C CNN
	1    7325 8825
	0    1    1    0   
$EndComp
Wire Wire Line
	7325 8825 7700 8825
Wire Wire Line
	8800 8725 8500 8725
NoConn ~ 7700 7725
NoConn ~ 7700 7825
NoConn ~ 7700 7925
NoConn ~ 7700 8925
NoConn ~ 7700 9225
NoConn ~ 7700 9325
NoConn ~ 7700 9425
NoConn ~ 7700 9825
NoConn ~ 7700 9925
NoConn ~ 7700 10025
NoConn ~ 7700 10125
Text GLabel 1100 2150 0    60   Input ~ 0
A7
Text GLabel 1100 2050 0    60   Input ~ 0
A6
Text GLabel 1100 1950 0    60   Input ~ 0
A5
Text GLabel 1100 1850 0    60   Input ~ 0
A4
Text GLabel 1100 1750 0    60   Input ~ 0
A3
Text GLabel 1100 1650 0    60   Input ~ 0
A2
Text GLabel 1100 1550 0    60   Input ~ 0
A1
Text GLabel 1100 1450 0    60   Input ~ 0
A0
Text GLabel 1350 3625 0    60   BiDi ~ 0
D4
Text GLabel 1350 3525 0    60   BiDi ~ 0
D3
Text GLabel 1350 3725 0    60   BiDi ~ 0
D5
Text GLabel 1350 3825 0    60   BiDi ~ 0
D6
Text GLabel 1350 3425 0    60   BiDi ~ 0
D2
Text GLabel 1350 3925 0    60   BiDi ~ 0
D7
Text GLabel 1350 3225 0    60   BiDi ~ 0
D0
Text GLabel 1350 3325 0    60   BiDi ~ 0
D1
Text GLabel 1350 4125 0    60   Input ~ 0
RD#
Text GLabel 1200 5175 0    60   Input ~ 0
RESET#
Text GLabel 1200 5575 0    60   Input ~ 0
IORQ#
Text GLabel 1200 5675 0    60   Input ~ 0
M1#
Text GLabel 1200 5775 0    60   Input ~ 0
WR#
Text GLabel 1200 5875 0    60   Input ~ 0
RD#
Text GLabel 10525 2075 0    60   Input ~ 0
bA0
Text GLabel 10525 2175 0    60   Input ~ 0
bA1
Text GLabel 10525 2275 0    60   Input ~ 0
bA2
Text GLabel 10525 2375 0    60   Input ~ 0
bA3
Text GLabel 2100 1450 2    60   Output ~ 0
bA0
Text GLabel 2100 1550 2    60   Output ~ 0
bA1
Text GLabel 2100 1650 2    60   Output ~ 0
bA2
Text GLabel 2100 1750 2    60   Output ~ 0
bA3
Wire Wire Line
	5075 1425 4975 1425
Connection ~ 4975 1425
Wire Wire Line
	4975 1425 4975 1325
Wire Wire Line
	5075 1525 4975 1525
Connection ~ 4975 1525
Wire Wire Line
	4975 1525 4975 1425
NoConn ~ 3775 2325
NoConn ~ 3775 2425
$Comp
L 74xx:74LS139 U6
U 1 1 62920A80
P 8725 2975
F 0 "U6" H 8725 3342 50  0000 C CNN
F 1 "74LS139" H 8725 3251 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 8725 2975 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 8725 2975 50  0001 C CNN
	1    8725 2975
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U6
U 3 1 62921E1C
P 5950 8150
F 0 "U6" H 6180 8196 50  0000 L CNN
F 1 "74LS139" H 6180 8105 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 5950 8150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 5950 8150 50  0001 C CNN
	3    5950 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 7250 5350 7250
Connection ~ 4900 7250
Wire Wire Line
	5350 7625 5350 7250
Connection ~ 5350 7250
Wire Wire Line
	4900 8900 5350 8900
Connection ~ 4900 8900
Wire Wire Line
	5350 8625 5350 8900
Connection ~ 5350 8900
$Comp
L Z80PPIDE2-rescue:C-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C8
U 1 1 6294EDFA
P 2800 7450
F 0 "C8" H 2850 7550 50  0000 L CNN
F 1 "0.1u" H 2850 7350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2800 7450 60  0001 C CNN
F 3 "" H 2800 7450 60  0001 C CNN
	1    2800 7450
	1    0    0    -1  
$EndComp
Connection ~ 2800 7250
Wire Wire Line
	2800 7250 3050 7250
Connection ~ 2800 7650
Wire Wire Line
	5075 1625 4975 1625
Connection ~ 4975 1625
Wire Wire Line
	4975 1625 4975 1525
Wire Wire Line
	5075 1725 4975 1725
Wire Wire Line
	4975 1725 4975 1625
NoConn ~ 3775 2525
NoConn ~ 3775 2625
Text GLabel 2100 1850 2    60   Output ~ 0
bA4
Text GLabel 2100 1950 2    60   Output ~ 0
bA5
Text GLabel 8225 2975 0    60   Input ~ 0
bA4
Text GLabel 8225 2875 0    60   Input ~ 0
bA5
Text GLabel 9225 2875 2    60   Output ~ 0
CS_VIA1#
Text GLabel 10525 1875 0    60   Input ~ 0
CS_VIA1#
Text GLabel 9225 3075 2    60   Output ~ 0
CS_ACIA1#
NoConn ~ 9225 2975
$Comp
L 65xx:W65C51NxP U8
U 1 1 62A238DC
P 10325 6700
F 0 "U8" H 10325 8331 50  0000 C CNN
F 1 "W65C51NxP" H 10325 8240 50  0000 C CIB
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 10325 6850 50  0001 C CNN
F 3 "http://www.westerndesigncenter.com/wdc/documentation/w65c51n.pdf" H 10325 6850 50  0001 C CNN
	1    10325 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 62A25A51
P 10325 8150
F 0 "#PWR014" H 10325 7900 50  0001 C CNN
F 1 "GND" H 10330 7977 50  0000 C CNN
F 2 "" H 10325 8150 50  0001 C CNN
F 3 "" H 10325 8150 50  0001 C CNN
	1    10325 8150
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR013
U 1 1 62A2645C
P 10325 5250
F 0 "#PWR013" H 10325 5350 30  0001 C CNN
F 1 "VCC" H 10325 5350 30  0000 C CNN
F 2 "" H 10325 5250 60  0001 C CNN
F 3 "" H 10325 5250 60  0001 C CNN
	1    10325 5250
	1    0    0    -1  
$EndComp
Text GLabel 9725 5600 0    60   Input ~ 0
bRESET#
Text GLabel 9725 5700 0    60   Input ~ 0
SLAVE_CLK
Text GLabel 9725 5900 0    60   Output ~ 0
IRQA#
$Comp
L Z80PPIDE2-rescue:CONN_3-00JRCsch-Z80PPIDE2-rescue K2
U 1 1 62A31240
P 8525 5900
F 0 "K2" H 8392 5579 50  0000 C CNN
F 1 "INT SRC" H 8392 5663 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 8525 5900 60  0001 C CNN
F 3 "" H 8525 5900 60  0000 C CNN
	1    8525 5900
	1    0    0    -1  
$EndComp
Text GLabel 8175 5900 0    60   Input ~ 0
IRQA#
Text GLabel 8175 5800 0    60   Output ~ 0
INT#
Text GLabel 8175 6000 0    60   Output ~ 0
NMI#
Text GLabel 9725 6200 0    60   Input ~ 0
CS_ACIA1#
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR011
U 1 1 62A3AB9B
P 9725 6100
F 0 "#PWR011" H 9725 6200 30  0001 C CNN
F 1 "VCC" H 9725 6200 30  0000 C CNN
F 2 "" H 9725 6100 60  0001 C CNN
F 3 "" H 9725 6100 60  0001 C CNN
	1    9725 6100
	0    -1   -1   0   
$EndComp
Text GLabel 9725 6400 0    60   Input ~ 0
bA0
Text GLabel 9725 6500 0    60   Input ~ 0
bA1
Text GLabel 9725 7100 0    60   BiDi ~ 0
bD0
Text GLabel 9725 7200 0    60   BiDi ~ 0
bD1
Text GLabel 9725 7300 0    60   BiDi ~ 0
bD2
Text GLabel 9725 7400 0    60   BiDi ~ 0
bD3
Text GLabel 9725 7500 0    60   BiDi ~ 0
bD4
Text GLabel 9725 7600 0    60   BiDi ~ 0
bD5
Text GLabel 9725 7700 0    60   BiDi ~ 0
bD6
Text GLabel 9725 7800 0    60   BiDi ~ 0
bD7
Text GLabel 9725 6900 0    60   Input ~ 0
bRW#
$Comp
L Oscillator:CXO_DIP8 X1
U 1 1 62A4F3C9
P 11450 5600
F 0 "X1" H 11106 5646 50  0000 R CNN
F 1 "1.8432MHz" H 11106 5555 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-8" H 11900 5250 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 11350 5600 50  0001 C CNN
	1    11450 5600
	-1   0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR019
U 1 1 62A5091E
P 11450 5250
F 0 "#PWR019" H 11450 5350 30  0001 C CNN
F 1 "VCC" H 11450 5350 30  0000 C CNN
F 2 "" H 11450 5250 60  0001 C CNN
F 3 "" H 11450 5250 60  0001 C CNN
	1    11450 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 62A50F15
P 11450 5900
F 0 "#PWR020" H 11450 5650 50  0001 C CNN
F 1 "GND" H 11455 5727 50  0000 C CNN
F 2 "" H 11450 5900 50  0001 C CNN
F 3 "" H 11450 5900 50  0001 C CNN
	1    11450 5900
	1    0    0    -1  
$EndComp
NoConn ~ 10925 5700
NoConn ~ 10925 5900
$Comp
L Z80-6502IO-rescue:CONN_6-conn P3
U 1 1 62A77BA6
P 10375 8850
F 0 "P3" H 10503 8893 60  0000 L CNN
F 1 "SERIAL" H 10503 8787 60  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 10375 8850 60  0001 C CNN
F 3 "" H 10375 8850 60  0001 C CNN
	1    10375 8850
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:CONN_3-00JRCsch-Z80PPIDE2-rescue K3
U 1 1 62A79C7E
P 10950 9525
F 0 "K3" H 10817 9204 50  0000 C CNN
F 1 "HANDS" H 10817 9288 40  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10950 9525 60  0001 C CNN
F 3 "" H 10950 9525 60  0000 C CNN
	1    10950 9525
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 62A8379D
P 10025 8600
F 0 "#PWR012" H 10025 8350 50  0001 C CNN
F 1 "GND" H 9975 8450 50  0000 C CNN
F 2 "" H 10025 8600 50  0001 C CNN
F 3 "" H 10025 8600 50  0001 C CNN
	1    10025 8600
	0    1    1    0   
$EndComp
Wire Wire Line
	10025 9100 10025 9525
Wire Wire Line
	10025 9525 10600 9525
Text GLabel 10925 6400 2    60   Output ~ 0
TxD
Text GLabel 10925 6500 2    60   Input ~ 0
RxD
Text GLabel 10925 6800 2    60   Input ~ 0
CTS
Text GLabel 10925 6700 2    60   Output ~ 0
RTS
Text GLabel 10925 7100 2    60   Input ~ 0
DSR
NoConn ~ 10925 7300
NoConn ~ 10925 7000
Text GLabel 10600 9425 0    60   Input ~ 0
CTS
Text GLabel 10600 9625 0    60   Input ~ 0
DSR
Text GLabel 10025 8700 0    60   Input ~ 0
RTS
Text GLabel 10025 8900 0    60   Input ~ 0
RxD
Text GLabel 10025 9000 0    60   Output ~ 0
TxD
$Comp
L Z80-6502IO-rescue:CONN_2-conn P4
U 1 1 62AC8F2D
P 10950 10150
F 0 "P4" H 11078 10178 40  0000 L CNN
F 1 "USB_PWR" H 11078 10102 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 10950 10150 60  0001 C CNN
F 3 "" H 10950 10150 60  0001 C CNN
	1    10950 10150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10025 8800 9750 8800
Wire Wire Line
	9750 8800 9750 10050
Wire Wire Line
	9750 10050 10600 10050
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR016
U 1 1 62AD2935
P 10600 10250
F 0 "#PWR016" H 10600 10350 30  0001 C CNN
F 1 "VCC" H 10600 10350 30  0000 C CNN
F 2 "" H 10600 10250 60  0001 C CNN
F 3 "" H 10600 10250 60  0001 C CNN
	1    10600 10250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11150 5600 10925 5600
$Comp
L Amplifier_Operational:OPA2134 U12
U 1 1 622202B9
P 15125 6125
F 0 "U12" H 15125 6492 50  0000 C CNN
F 1 "OPA2134" H 15125 6401 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 15125 6125 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/opa134.pdf" H 15125 6125 50  0001 C CNN
	1    15125 6125
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:OPA2134 U12
U 3 1 62223475
P 15950 5375
F 0 "U12" H 15925 5425 50  0000 L CNN
F 1 "OPA2134" H 15908 5330 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 15950 5375 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/opa134.pdf" H 15950 5375 50  0001 C CNN
	3    15950 5375
	1    0    0    -1  
$EndComp
$Comp
L 65xx:6581 U10
U 1 1 62229066
P 13825 6825
F 0 "U10" H 13550 5450 50  0000 C CNN
F 1 "6581" H 13550 5350 50  0000 C CIB
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 13825 6975 50  0001 C CNN
F 3 "http://www.6502.org/documents/datasheets/mos/mos_6581_sid.pdf" H 13825 6975 50  0001 C CNN
	1    13825 6825
	1    0    0    -1  
$EndComp
$Comp
L Z80-6502IO-rescue:MAX662ACPA+-Maxim U11
U 1 1 6223EEBC
P 13925 4075
F 0 "U11" H 13925 4845 50  0000 C CNN
F 1 "MAX662ACPA+" H 13925 4754 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm_Socket" H 13925 4075 50  0001 L BNN
F 3 "" H 13925 4075 50  0001 L BNN
F 4 "Maxim Integrated" H 13925 4075 50  0001 L BNN "MF"
F 5 "PDIP-8 Maxim" H 13925 4075 50  0001 L BNN "Package"
F 6 "Unavailable" H 13925 4075 50  0001 L BNN "Availability"
F 7 "Charge Pump Switching Regulator IC Positive Fixed 12V 1 Output 30mA 8-DIP _0.300, 7.62mm_" H 13925 4075 50  0001 L BNN "Description"
F 8 "None" H 13925 4075 50  0001 L BNN "Price"
F 9 "MAX662ACPA+" H 13925 4075 50  0001 L BNN "MP"
	1    13925 4075
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 7250 5950 7250
$Comp
L power:GND #PWR028
U 1 1 6227F36F
P 14625 4675
F 0 "#PWR028" H 14625 4425 50  0001 C CNN
F 1 "GND" H 14630 4502 50  0000 C CNN
F 2 "" H 14625 4675 50  0001 C CNN
F 3 "" H 14625 4675 50  0001 C CNN
	1    14625 4675
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 6227F758
P 13225 4425
F 0 "#PWR022" H 13225 4175 50  0001 C CNN
F 1 "GND" H 13230 4252 50  0000 C CNN
F 2 "" H 13225 4425 50  0001 C CNN
F 3 "" H 13225 4425 50  0001 C CNN
	1    13225 4425
	1    0    0    -1  
$EndComp
Wire Wire Line
	14625 4675 14625 4475
Connection ~ 14625 4475
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR027
U 1 1 6229CF52
P 14625 3225
F 0 "#PWR027" H 14625 3325 30  0001 C CNN
F 1 "VCC" H 14625 3325 30  0000 C CNN
F 2 "" H 14625 3225 60  0001 C CNN
F 3 "" H 14625 3225 60  0001 C CNN
	1    14625 3225
	1    0    0    -1  
$EndComp
Wire Wire Line
	14625 3225 14625 3575
Wire Wire Line
	13225 4425 13225 4175
$Comp
L Z80-6502IO-rescue:CP_Small-Device C17
U 1 1 622FD18D
P 14725 3575
F 0 "C17" V 14950 3575 50  0000 C CNN
F 1 "4.7uF" V 14859 3575 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 14725 3575 50  0001 C CNN
F 3 "~" H 14725 3575 50  0001 C CNN
	1    14725 3575
	0    -1   -1   0   
$EndComp
Connection ~ 14625 3575
$Comp
L Z80-6502IO-rescue:CP_Small-Device C14
U 1 1 622FF010
P 14625 4125
F 0 "C14" H 14713 4171 50  0000 L CNN
F 1 "4.7uF" H 14713 4080 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 14625 4125 50  0001 C CNN
F 3 "~" H 14625 4125 50  0001 C CNN
	1    14625 4125
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 6230349A
P 13125 3775
F 0 "C12" V 12896 3775 50  0000 C CNN
F 1 "0.22uF" V 12987 3775 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 13125 3775 50  0001 C CNN
F 3 "~" H 13125 3775 50  0001 C CNN
	1    13125 3775
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C13
U 1 1 62304A69
P 13125 3975
F 0 "C13" V 13275 3825 50  0000 C CNN
F 1 "0.22uF" V 13350 3825 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 13125 3975 50  0001 C CNN
F 3 "~" H 13125 3975 50  0001 C CNN
	1    13125 3975
	0    1    1    0   
$EndComp
Wire Wire Line
	13225 3875 12875 3875
Wire Wire Line
	12875 3875 12875 3775
Wire Wire Line
	12875 3775 13025 3775
Wire Wire Line
	13025 3975 12875 3975
Wire Wire Line
	12875 3975 12875 4075
Wire Wire Line
	12875 4075 13225 4075
Wire Wire Line
	14625 4225 14625 4475
Wire Wire Line
	14625 4025 14625 3775
$Comp
L power:GND #PWR030
U 1 1 623445C2
P 14825 3575
F 0 "#PWR030" H 14825 3325 50  0001 C CNN
F 1 "GND" H 14830 3402 50  0000 C CNN
F 2 "" H 14825 3575 50  0001 C CNN
F 3 "" H 14825 3575 50  0001 C CNN
	1    14825 3575
	0    -1   -1   0   
$EndComp
$Comp
L power:+12V #PWR031
U 1 1 6234757A
P 14625 3775
F 0 "#PWR031" H 14625 3625 50  0001 C CNN
F 1 "+12V" H 14640 3948 50  0000 C CNN
F 2 "" H 14625 3775 50  0001 C CNN
F 3 "" H 14625 3775 50  0001 C CNN
	1    14625 3775
	0    1    1    0   
$EndComp
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR026
U 1 1 623522A6
P 13825 5375
F 0 "#PWR026" H 13825 5475 30  0001 C CNN
F 1 "VCC" H 13825 5475 30  0000 C CNN
F 2 "" H 13825 5375 60  0001 C CNN
F 3 "" H 13825 5375 60  0001 C CNN
	1    13825 5375
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR024
U 1 1 62352724
P 13725 5375
F 0 "#PWR024" H 13725 5225 50  0001 C CNN
F 1 "+12V" H 13740 5548 50  0000 C CNN
F 2 "" H 13725 5375 50  0001 C CNN
F 3 "" H 13725 5375 50  0001 C CNN
	1    13725 5375
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C15
U 1 1 62353E53
P 14650 7525
F 0 "C15" V 14775 7625 50  0000 C CNN
F 1 "2200pF" V 14850 7650 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 14650 7525 50  0001 C CNN
F 3 "~" H 14650 7525 50  0001 C CNN
	1    14650 7525
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C16
U 1 1 62354F68
P 14650 7925
F 0 "C16" V 14800 8025 50  0000 C CNN
F 1 "2200pF" V 14875 8025 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 14650 7925 50  0001 C CNN
F 3 "~" H 14650 7925 50  0001 C CNN
	1    14650 7925
	0    1    1    0   
$EndComp
Wire Wire Line
	14550 7525 14425 7525
Wire Wire Line
	14425 7425 14750 7425
Wire Wire Line
	14750 7425 14750 7525
Wire Wire Line
	14550 7925 14425 7925
Wire Wire Line
	14425 7825 14750 7825
Wire Wire Line
	14750 7825 14750 7925
NoConn ~ 14425 6725
NoConn ~ 14425 6825
NoConn ~ 14425 6225
Wire Wire Line
	14825 6025 14625 6025
$Comp
L power:GND #PWR025
U 1 1 623D3E83
P 13825 8275
F 0 "#PWR025" H 13825 8025 50  0001 C CNN
F 1 "GND" H 13830 8102 50  0000 C CNN
F 2 "" H 13825 8275 50  0001 C CNN
F 3 "" H 13825 8275 50  0001 C CNN
	1    13825 8275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 623D44E2
P 14625 6525
F 0 "#PWR029" H 14625 6275 50  0001 C CNN
F 1 "GND" H 14630 6352 50  0000 C CNN
F 2 "" H 14625 6525 50  0001 C CNN
F 3 "" H 14625 6525 50  0001 C CNN
	1    14625 6525
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 623D595E
P 14625 6275
F 0 "R3" V 14705 6275 50  0000 C CNN
F 1 "1.0KQ" V 14625 6275 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 14625 6275 60  0001 C CNN
F 3 "" H 14625 6275 60  0001 C CNN
	1    14625 6275
	-1   0    0    1   
$EndComp
Connection ~ 14625 6025
Wire Wire Line
	14625 6025 14425 6025
Wire Wire Line
	14625 6125 14625 6025
Wire Wire Line
	14625 6525 14625 6425
Wire Wire Line
	14825 6225 14825 6475
Wire Wire Line
	14825 6475 15425 6475
Wire Wire Line
	15425 6475 15425 6125
$Comp
L Z80-6502IO-rescue:CP_Small-Device C18
U 1 1 623F8FDE
P 15525 6125
F 0 "C18" V 15750 6125 50  0000 C CNN
F 1 "4.7uF" V 15659 6125 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 15525 6125 50  0001 C CNN
F 3 "~" H 15525 6125 50  0001 C CNN
	1    15525 6125
	0    -1   -1   0   
$EndComp
Connection ~ 15425 6125
$Comp
L power:GND #PWR032
U 1 1 623FC5A0
P 15625 6525
F 0 "#PWR032" H 15625 6275 50  0001 C CNN
F 1 "GND" H 15630 6352 50  0000 C CNN
F 2 "" H 15625 6525 50  0001 C CNN
F 3 "" H 15625 6525 50  0001 C CNN
	1    15625 6525
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 623FC5AA
P 15625 6275
F 0 "R4" V 15705 6275 50  0000 C CNN
F 1 "10KQ" V 15625 6275 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 15625 6275 60  0001 C CNN
F 3 "" H 15625 6275 60  0001 C CNN
	1    15625 6275
	-1   0    0    1   
$EndComp
Wire Wire Line
	15625 6525 15625 6425
$Comp
L Z80-6502IO-rescue:RCJ-014-RAC_Custom J1
U 1 1 6242A141
P 16125 6225
F 0 "J1" H 16300 6450 50  0000 R CNN
F 1 "RCJ-014" H 16425 6525 50  0000 R CNN
F 2 "CUI:CUI_RCJ-014" H 15975 5775 50  0001 L BNN
F 3 "" H 15975 5675 50  0001 L BNN
	1    16125 6225
	-1   0    0    1   
$EndComp
Wire Wire Line
	15825 6125 15625 6125
Connection ~ 15625 6125
Wire Wire Line
	15625 6425 15825 6425
Wire Wire Line
	15825 6425 15825 6325
Connection ~ 15625 6425
Text GLabel 13225 5725 0    60   Input ~ 0
bRESET#
Text GLabel 13225 5825 0    60   Input ~ 0
SLAVE_CLK
Text GLabel 13225 7225 0    60   BiDi ~ 0
bD0
Text GLabel 13225 7325 0    60   BiDi ~ 0
bD1
Text GLabel 13225 7425 0    60   BiDi ~ 0
bD2
Text GLabel 13225 7525 0    60   BiDi ~ 0
bD3
Text GLabel 13225 7625 0    60   BiDi ~ 0
bD4
Text GLabel 13225 7725 0    60   BiDi ~ 0
bD5
Text GLabel 13225 7825 0    60   BiDi ~ 0
bD6
Text GLabel 13225 7925 0    60   BiDi ~ 0
bD7
Text GLabel 13225 7025 0    60   Input ~ 0
bRW#
Text GLabel 13225 6425 0    60   Input ~ 0
bA0
Text GLabel 13225 6525 0    60   Input ~ 0
bA1
Text GLabel 13225 6625 0    60   Input ~ 0
bA2
Text GLabel 13225 6725 0    60   Input ~ 0
bA3
Text GLabel 13225 6825 0    60   Input ~ 0
bA4
Text GLabel 9225 3175 2    60   Output ~ 0
CS_SID#
Text GLabel 13225 6225 0    60   Input ~ 0
CS_SID#
Text GLabel 2100 2050 2    60   Output ~ 0
bA6
Text GLabel 2100 2150 2    60   Output ~ 0
bA7
Text GLabel 4800 1825 0    60   Input ~ 0
bA6
Text GLabel 4800 1925 0    60   Input ~ 0
bA7
Wire Wire Line
	5075 1825 4800 1825
Wire Wire Line
	5075 1925 4800 1925
Wire Wire Line
	1100 2350 1100 2450
Wire Wire Line
	1100 2450 1100 2750
Wire Wire Line
	1100 2750 1600 2750
Connection ~ 1100 2450
Wire Wire Line
	1200 6075 1200 6175
Wire Wire Line
	1200 6175 1200 6475
Wire Wire Line
	1200 6475 1700 6475
Connection ~ 1200 6175
$Comp
L power:GND #PWR0101
U 1 1 62486CCA
P 1700 6475
F 0 "#PWR0101" H 1700 6225 50  0001 C CNN
F 1 "GND" H 1705 6302 50  0000 C CNN
F 2 "" H 1700 6475 50  0001 C CNN
F 3 "" H 1700 6475 50  0001 C CNN
	1    1700 6475
	1    0    0    -1  
$EndComp
Connection ~ 1700 6475
$Comp
L power:GND #PWR0102
U 1 1 62488009
P 1600 2750
F 0 "#PWR0102" H 1600 2500 50  0001 C CNN
F 1 "GND" H 1605 2577 50  0000 C CNN
F 2 "" H 1600 2750 50  0001 C CNN
F 3 "" H 1600 2750 50  0001 C CNN
	1    1600 2750
	1    0    0    -1  
$EndComp
Connection ~ 1600 2750
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR0103
U 1 1 6248850F
P 1600 1150
F 0 "#PWR0103" H 1600 1250 30  0001 C CNN
F 1 "VCC" H 1600 1250 30  0000 C CNN
F 2 "" H 1600 1150 60  0001 C CNN
F 3 "" H 1600 1150 60  0001 C CNN
	1    1600 1150
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR0104
U 1 1 624A3035
P 1850 2925
F 0 "#PWR0104" H 1850 3025 30  0001 C CNN
F 1 "VCC" H 1850 3025 30  0000 C CNN
F 2 "" H 1850 2925 60  0001 C CNN
F 3 "" H 1850 2925 60  0001 C CNN
	1    1850 2925
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 624DA750
P 1850 4525
F 0 "#PWR0105" H 1850 4275 50  0001 C CNN
F 1 "GND" H 1855 4352 50  0000 C CNN
F 2 "" H 1850 4525 50  0001 C CNN
F 3 "" H 1850 4525 50  0001 C CNN
	1    1850 4525
	1    0    0    -1  
$EndComp
$Comp
L Z80PPIDE2-rescue:VCC-power-Z80PPIDE2-rescue #PWR0106
U 1 1 624E5FAB
P 1700 4875
F 0 "#PWR0106" H 1700 4975 30  0001 C CNN
F 1 "VCC" H 1700 4975 30  0000 C CNN
F 2 "" H 1700 4875 60  0001 C CNN
F 3 "" H 1700 4875 60  0001 C CNN
	1    1700 4875
	1    0    0    -1  
$EndComp
Text GLabel 1350 4225 0    60   Input ~ 0
BOARD_CS#
Text GLabel 1200 5275 0    60   Input ~ 0
BOARD_CS#
Text GLabel 2200 5675 2    60   Output ~ 0
bM1#
Text GLabel 4825 1325 0    60   Input ~ 0
bM1#
Wire Wire Line
	4825 1325 4975 1325
Wire Wire Line
	2200 5275 3100 5275
Wire Wire Line
	2200 5575 5075 5575
Wire Wire Line
	5075 3025 5075 5575
Wire Wire Line
	3400 5125 3400 5275
Wire Wire Line
	3050 7250 3150 7250
Wire Wire Line
	2800 7650 3150 7650
$Comp
L Z80PPIDE2-rescue:C-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C19
U 1 1 6219A9EB
P 3150 7450
F 0 "C19" H 3200 7550 50  0000 L CNN
F 1 "0.1u" H 3200 7350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3150 7450 60  0001 C CNN
F 3 "" H 3150 7450 60  0001 C CNN
	1    3150 7450
	1    0    0    -1  
$EndComp
Connection ~ 3150 7250
Wire Wire Line
	3150 7250 3400 7250
Connection ~ 3150 7650
Wire Wire Line
	3150 7650 3400 7650
$Comp
L Z80PPIDE2-rescue:C-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C20
U 1 1 6219ADDE
P 3400 7450
F 0 "C20" H 3450 7550 50  0000 L CNN
F 1 "0.1u" H 3450 7350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3400 7450 60  0001 C CNN
F 3 "" H 3400 7450 60  0001 C CNN
	1    3400 7450
	1    0    0    -1  
$EndComp
Connection ~ 3400 7250
Wire Wire Line
	3400 7250 3650 7250
Connection ~ 3400 7650
Wire Wire Line
	3400 7650 3650 7650
Wire Wire Line
	5950 7650 5950 7250
Connection ~ 5950 7250
Wire Wire Line
	5950 7250 6575 7250
Wire Wire Line
	800  8900 4900 8900
Connection ~ 4575 7250
Wire Wire Line
	4575 7250 4900 7250
Wire Wire Line
	4300 7250 4575 7250
$Comp
L Z80PPIDE2-rescue:C-device-Z80PPIDE-rescue-Z80PPIDE2-rescue C21
U 1 1 621D9347
P 3650 7450
F 0 "C21" H 3700 7550 50  0000 L CNN
F 1 "0.1u" H 3700 7350 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3650 7450 60  0001 C CNN
F 3 "" H 3650 7450 60  0001 C CNN
	1    3650 7450
	1    0    0    -1  
$EndComp
Connection ~ 3650 7250
Connection ~ 3650 7650
Wire Wire Line
	3650 7250 4025 7250
Wire Wire Line
	4025 7250 4300 7250
Connection ~ 4025 7250
Connection ~ 4300 7250
Wire Wire Line
	4575 7650 4300 7650
Wire Wire Line
	4300 7650 4025 7650
Connection ~ 4300 7650
Wire Wire Line
	3650 7650 4025 7650
Connection ~ 4025 7650
Wire Wire Line
	5350 8900 5950 8900
Wire Wire Line
	5950 8650 5950 8900
Connection ~ 5950 8900
Wire Wire Line
	5950 8900 6575 8900
Wire Wire Line
	11450 5250 11450 5300
Wire Wire Line
	11450 5300 11750 5300
Wire Wire Line
	11750 5300 11750 5600
Connection ~ 11450 5300
Connection ~ 14625 3775
$Comp
L power:+12V #PWR0107
U 1 1 62280876
P 15850 5075
F 0 "#PWR0107" H 15850 4925 50  0001 C CNN
F 1 "+12V" H 15865 5248 50  0000 C CNN
F 2 "" H 15850 5075 50  0001 C CNN
F 3 "" H 15850 5075 50  0001 C CNN
	1    15850 5075
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 622815E5
P 15850 5675
F 0 "#PWR0108" H 15850 5425 50  0001 C CNN
F 1 "GND" H 15855 5502 50  0000 C CNN
F 2 "" H 15850 5675 50  0001 C CNN
F 3 "" H 15850 5675 50  0001 C CNN
	1    15850 5675
	1    0    0    -1  
$EndComp
Text GLabel 7700 9725 0    60   3State ~ 0
SPARE9
NoConn ~ 7700 9725
$Comp
L Z80-6502IO-rescue:CONN_1-conn P1
U 1 1 622D9D75
P 6550 4625
F 0 "P1" H 6608 4625 40  0000 L CNN
F 1 "CONN_1" H 6550 4680 30  0001 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 6550 4625 60  0001 C CNN
F 3 "" H 6550 4625 60  0001 C CNN
	1    6550 4625
	1    0    0    -1  
$EndComp
$EndSCHEMATC
