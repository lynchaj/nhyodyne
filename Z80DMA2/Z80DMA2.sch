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
Text Label 15900 7800 0    60   ~ 0
GND
Text Label 17200 7700 0    60   ~ 0
VCC
$Comp
L Z80DMA2-rescue:CONN_25X2-conn P1
U 1 1 603D6D37
P 16700 7900
F 0 "P1" H 16700 9200 60  0000 C CNN
F 1 "Z80 BUS BACKPLANE" V 16700 7900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_2x25_Pitch2.54mm" H 16700 7900 60  0001 C CNN
F 3 "" H 16700 7900 60  0001 C CNN
	1    16700 7900
	1    0    0    -1  
$EndComp
Text Label 17200 8900 0    60   ~ 0
SPARE2
Text Label 17200 8800 0    60   ~ 0
SPARE1
Text Label 17200 8700 0    60   ~ 0
SPARE0
Text Label 17200 9000 0    60   ~ 0
SPARE3
Text Label 17200 9100 0    60   ~ 0
SPARE4
Text Label 15900 8900 0    60   ~ 0
SPARE7
Text Label 15900 8800 0    60   ~ 0
SPARE8
Text Label 15900 8700 0    60   ~ 0
SPARE9
Text Label 15900 9000 0    60   ~ 0
SPARE6
Text Label 15900 9100 0    60   ~ 0
SPARE5
Text Notes 15500 6500 0    60   ~ 0
Note: Bus connector is mirror image of Z80\nCPU pin out to mate to backplane whose\nconnectors reflect Z80 CPU pin out.
$Comp
L Z80DMA2-rescue:CONN_10-conn P2
U 1 1 603FC724
P 18800 7200
F 0 "P2" V 18750 7200 60  0000 C CNN
F 1 "SPARES" V 18850 7200 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x10_Pitch2.54mm" H 18800 7200 60  0001 C CNN
F 3 "" H 18800 7200 60  0001 C CNN
	1    18800 7200
	1    0    0    -1  
$EndComp
Text Label 18050 7450 0    60   ~ 0
SPARE7
Text Label 18050 7550 0    60   ~ 0
SPARE8
Text Label 18050 7650 0    60   ~ 0
SPARE9
Text Label 18050 7350 0    60   ~ 0
SPARE6
Text Label 18050 7250 0    60   ~ 0
SPARE5
Text Label 18050 6950 0    60   ~ 0
SPARE2
Text Label 18050 6850 0    60   ~ 0
SPARE1
Text Label 18050 6750 0    60   ~ 0
SPARE0
Text Label 18050 7050 0    60   ~ 0
SPARE3
Text Label 18050 7150 0    60   ~ 0
SPARE4
NoConn ~ 15800 7900
NoConn ~ 17600 8400
Wire Wire Line
	15800 6900 16300 6900
Wire Wire Line
	15800 6800 16300 6800
Wire Wire Line
	15800 6700 16300 6700
Wire Wire Line
	17100 6700 17600 6700
Wire Wire Line
	17100 6800 17600 6800
Wire Wire Line
	17100 6900 17600 6900
Wire Wire Line
	17100 7000 17600 7000
Wire Wire Line
	17100 7100 17600 7100
Wire Wire Line
	15800 7700 16300 7700
Wire Wire Line
	15800 7600 16300 7600
Wire Wire Line
	15800 7500 16300 7500
Wire Wire Line
	15800 7400 16300 7400
Wire Wire Line
	15800 7300 16300 7300
Wire Wire Line
	15800 7200 16300 7200
Wire Wire Line
	15800 7100 16300 7100
Wire Wire Line
	15800 7000 16300 7000
Wire Wire Line
	15800 7800 16300 7800
Wire Wire Line
	15800 8000 16300 8000
Wire Wire Line
	15800 7900 16300 7900
Wire Wire Line
	17100 8400 17600 8400
Wire Wire Line
	15800 8400 16300 8400
Wire Wire Line
	15800 8100 16300 8100
Wire Wire Line
	17100 8300 17600 8300
Wire Wire Line
	17100 8200 17600 8200
Wire Wire Line
	15800 8300 16300 8300
Wire Wire Line
	15800 8200 16300 8200
Wire Wire Line
	17100 8600 17600 8600
Wire Wire Line
	17100 8500 17600 8500
Wire Wire Line
	15800 8500 16300 8500
Wire Wire Line
	15800 8600 16300 8600
Wire Wire Line
	17100 8000 17600 8000
Wire Wire Line
	17100 8100 17600 8100
Wire Wire Line
	17100 7800 17600 7800
Wire Wire Line
	17100 7400 17600 7400
Wire Wire Line
	17100 7300 17600 7300
Wire Wire Line
	17100 7500 17600 7500
Wire Wire Line
	17100 7600 17600 7600
Wire Wire Line
	17100 7900 17600 7900
Wire Wire Line
	17100 7700 17600 7700
Wire Wire Line
	17100 7200 17600 7200
Wire Wire Line
	15800 8800 16300 8800
Wire Wire Line
	15800 8700 16300 8700
Wire Wire Line
	17100 8700 17600 8700
Wire Wire Line
	15800 9000 16300 9000
Wire Wire Line
	15800 8900 16300 8900
Wire Wire Line
	17100 9000 17600 9000
Wire Wire Line
	17100 8900 17600 8900
Wire Wire Line
	17100 8800 17600 8800
Wire Wire Line
	15800 9100 16300 9100
Wire Wire Line
	17100 9100 17600 9100
Wire Wire Line
	18000 6750 18450 6750
Wire Wire Line
	18000 6850 18450 6850
Wire Wire Line
	18000 6950 18450 6950
Wire Wire Line
	18000 7050 18450 7050
Wire Wire Line
	18000 7150 18450 7150
Wire Wire Line
	18000 7250 18450 7250
Wire Wire Line
	18000 7350 18450 7350
Wire Wire Line
	18000 7450 18450 7450
Wire Wire Line
	18000 7550 18450 7550
Wire Wire Line
	18000 7650 18450 7650
Wire Wire Line
	50   3850 50   3350
Text Label 17200 7200 0    60   ~ 0
B_PHI
Text Label 17200 8500 0    60   ~ 0
~B_MREQ
Text Label 17200 7100 0    60   ~ 0
B_A15
Text Label 17200 6800 0    60   ~ 0
B_A12
Text Label 17200 8400 0    60   ~ 0
~B_HALT
Text Label 15900 8600 0    60   ~ 0
~B_RD
Text Label 15900 8500 0    60   ~ 0
~B_WR
Text Label 17200 8200 0    60   ~ 0
~B_INT
Text Label 17200 8300 0    60   ~ 0
~B_NMI
Text Label 15900 6700 0    60   ~ 0
B_A10
Text Label 17200 6700 0    60   ~ 0
B_A11
Text Label 17200 8100 0    60   ~ 0
B_D1
Text Label 15900 7000 0    60   ~ 0
B_A7
Text Label 15900 6900 0    60   ~ 0
B_A8
Text Label 15900 7400 0    60   ~ 0
B_A3
Text Label 15900 7600 0    60   ~ 0
B_A1
Text Label 15900 7700 0    60   ~ 0
B_A0
Text Label 17200 7800 0    60   ~ 0
B_D2
Text Label 17200 7900 0    60   ~ 0
B_D7
Text Label 17200 8000 0    60   ~ 0
B_D0
Text Label 15900 6800 0    60   ~ 0
B_A9
Text Label 17200 6900 0    60   ~ 0
B_A13
Text Label 15900 7900 0    60   ~ 0
~B_RFSH
Text Label 17200 8600 0    60   ~ 0
~B_IORQ
Text Label 15900 8000 0    60   ~ 0
~B_M1
Text Label 17200 7000 0    60   ~ 0
B_A14
Text Label 15900 7100 0    60   ~ 0
B_A6
Text Label 15900 7200 0    60   ~ 0
B_A5
Text Label 15900 7300 0    60   ~ 0
B_A4
Text Label 15900 7500 0    60   ~ 0
B_A2
Text Label 17200 7300 0    60   ~ 0
B_D4
Text Label 17200 7400 0    60   ~ 0
B_D3
Text Label 17200 7600 0    60   ~ 0
B_D6
Text Label 17200 7500 0    60   ~ 0
B_D5
$Comp
L 74xx:74LS244 U2
U 1 1 5DB586B0
P 3500 3200
F 0 "U2" H 3250 3850 50  0000 C CNN
F 1 "74LS244" H 3700 2550 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 3500 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 3500 3200 50  0001 C CNN
	1    3500 3200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS244 U7
U 1 1 5DB58EAA
P 6000 3200
F 0 "U7" H 6250 3850 50  0000 C CNN
F 1 "74LS244" H 5800 2550 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6000 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 6000 3200 50  0001 C CNN
	1    6000 3200
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS175 U13
U 1 1 5DB5A292
P 8900 6350
F 0 "U13" H 8650 6900 50  0000 C CNN
F 1 "74LS175" H 9100 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 8900 6350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 8900 6350 50  0001 C CNN
	1    8900 6350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U14
U 1 1 5DB5B4C5
P 8900 8400
F 0 "U14" H 8700 8850 50  0000 C CNN
F 1 "74LS139" H 9050 7950 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 8900 8400 50  0001 C CNN
F 3 "" H 8900 8400 50  0001 C CNN
	1    8900 8400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U4
U 1 1 5DB5C071
P 3500 7950
F 0 "U4" H 3500 8275 50  0000 C CNN
F 1 "74LS32" H 3500 8184 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3500 7950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3500 7950 50  0001 C CNN
	1    3500 7950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U4
U 3 1 5DB5F30D
P 2300 9050
F 0 "U4" H 2300 9375 50  0000 C CNN
F 1 "74LS32" H 2300 9284 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2300 9050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2300 9050 50  0001 C CNN
	3    2300 9050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U4
U 4 1 5DB60B96
P 7950 7350
F 0 "U4" H 7950 7100 50  0000 C CNN
F 1 "74LS32" H 7950 7000 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7950 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7950 7350 50  0001 C CNN
	4    7950 7350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U4
U 5 1 5DB6230D
P 16250 3600
F 0 "U4" H 16480 3646 50  0000 L CNN
F 1 "74LS32" H 16480 3555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 16250 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 16250 3600 50  0001 C CNN
	5    16250 3600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS27 U6
U 1 1 5DB63EF5
P 3500 9150
F 0 "U6" H 3500 9475 50  0000 C CNN
F 1 "74LS27" H 3500 9384 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3500 9150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS27" H 3500 9150 50  0001 C CNN
	1    3500 9150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS27 U6
U 2 1 5DB6589E
P 10850 5400
F 0 "U6" H 10850 5700 50  0000 C CNN
F 1 "74LS27" H 10850 5600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10850 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS27" H 10850 5400 50  0001 C CNN
	2    10850 5400
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS27 U6
U 3 1 5DB67A05
P 12100 9150
F 0 "U6" H 12100 9475 50  0000 C CNN
F 1 "74LS27" H 12100 9384 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12100 9150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS27" H 12100 9150 50  0001 C CNN
	3    12100 9150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS27 U6
U 4 1 5DB69A8D
P 17100 3600
F 0 "U6" H 17330 3646 50  0000 L CNN
F 1 "74LS27" H 17330 3555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 17100 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS27" H 17100 3600 50  0001 C CNN
	4    17100 3600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U5
U 1 1 5DB6B128
P 2300 8450
F 0 "U5" H 2300 8767 50  0000 C CNN
F 1 "74LS04" H 2300 8676 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2300 8450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2300 8450 50  0001 C CNN
	1    2300 8450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U5
U 2 1 5DB6C1A5
P 14800 5250
F 0 "U5" H 14800 5567 50  0000 C CNN
F 1 "74LS04" H 14800 5476 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 14800 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 14800 5250 50  0001 C CNN
	2    14800 5250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U5
U 3 1 5DB6CFA5
P 2300 9700
F 0 "U5" H 2300 10017 50  0000 C CNN
F 1 "74LS04" H 2300 9926 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2300 9700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2300 9700 50  0001 C CNN
	3    2300 9700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U5
U 6 1 5DB6FD56
P 12700 9150
F 0 "U5" H 12700 9467 50  0000 C CNN
F 1 "74LS04" H 12700 9376 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 12700 9150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 12700 9150 50  0001 C CNN
	6    12700 9150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U5
U 7 1 5DB710D8
P 14550 3600
F 0 "U5" H 14780 3646 50  0000 L CNN
F 1 "74LS04" H 14780 3555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 14550 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 14550 3600 50  0001 C CNN
	7    14550 3600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U1
U 1 1 5DB7310F
P 10450 6350
F 0 "U1" H 10450 6675 50  0000 C CNN
F 1 "74LS08" H 10450 6584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10450 6350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 10450 6350 50  0001 C CNN
	1    10450 6350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U1
U 2 1 5DB74DB5
P 3300 1850
F 0 "U1" H 3300 2150 50  0000 C CNN
F 1 "74LS08" H 3300 2050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3300 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3300 1850 50  0001 C CNN
	2    3300 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U1
U 3 1 5DB7725D
P 4600 9800
F 0 "U1" H 4600 10125 50  0000 C CNN
F 1 "74LS08" H 4600 10034 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4600 9800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4600 9800 50  0001 C CNN
	3    4600 9800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U1
U 4 1 5DB791E7
P 4600 10350
F 0 "U1" H 4600 10675 50  0000 C CNN
F 1 "74LS08" H 4600 10584 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4600 10350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4600 10350 50  0001 C CNN
	4    4600 10350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U1
U 5 1 5DB7AFF0
P 15400 3600
F 0 "U1" H 15630 3646 50  0000 L CNN
F 1 "74LS08" H 15630 3555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 15400 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 15400 3600 50  0001 C CNN
	5    15400 3600
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:R_Network08-Device-ECB-DMA-rescue RN1
U 1 1 5DB7E417
P 1250 6100
F 0 "RN1" V 1775 6100 50  0000 C CNN
F 1 "4K7" V 1684 6100 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP9" V 1725 6100 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 1250 6100 50  0001 C CNN
	1    1250 6100
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:SN74LS07N U12
U 1 1 5DB831AB
P 10350 2200
F 0 "U12" H 10350 2517 50  0000 C CNN
F 1 "SN74LS07N" H 10350 2426 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10350 2200 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 10350 2200 50  0001 C CNN
	1    10350 2200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:SN74LS07N U12
U 2 1 5DB84F96
P 10350 3750
F 0 "U12" H 10300 3450 50  0000 C CNN
F 1 "SN74LS07N" H 10350 3550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10350 3750 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 10350 3750 50  0001 C CNN
	2    10350 3750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:SN74LS07N U12
U 3 1 5DB871B1
P 10350 1450
F 0 "U12" H 10350 1767 50  0000 C CNN
F 1 "SN74LS07N" H 10350 1676 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10350 1450 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 10350 1450 50  0001 C CNN
	3    10350 1450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:SN74LS07N U12
U 4 1 5DB88D96
P 11750 5750
F 0 "U12" H 11750 6067 50  0000 C CNN
F 1 "SN74LS07N" H 11750 5976 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 11750 5750 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 11750 5750 50  0001 C CNN
	4    11750 5750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:SN74LS07N U12
U 5 1 5DB8AA04
P 14800 5800
F 0 "U12" H 14800 6117 50  0000 C CNN
F 1 "SN74LS07N" H 14800 6026 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 14800 5800 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 14800 5800 50  0001 C CNN
	5    14800 5800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:SN74LS07N U12
U 6 1 5DB8C0E7
P 10050 10500
F 0 "U12" H 10050 10817 50  0000 C CNN
F 1 "SN74LS07N" H 10050 10726 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10050 10500 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 10050 10500 50  0001 C CNN
	6    10050 10500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:SN74LS07N U12
U 7 1 5DB8DBD8
P 13650 3600
F 0 "U12" H 13880 3646 50  0000 L CNN
F 1 "SN74LS07N" H 13880 3555 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 13650 3600 50  0001 C CNN
F 3 "www.ti.com/lit/ds/symlink/sn74ls07.pdf" H 13650 3600 50  0001 C CNN
	7    13650 3600
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R2
U 1 1 5DB8F538
P 2150 2750
F 0 "R2" H 2220 2796 50  0000 L CNN
F 1 "4K7" H 2200 2700 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2080 2750 50  0001 C CNN
F 3 "~" H 2150 2750 50  0001 C CNN
	1    2150 2750
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R1
U 1 1 5DB90713
P 4600 2550
F 0 "R1" H 4670 2596 50  0000 L CNN
F 1 "1K" H 4670 2505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4530 2550 50  0001 C CNN
F 3 "~" H 4600 2550 50  0001 C CNN
	1    4600 2550
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R6
U 1 1 5DB91673
P 7650 6600
F 0 "R6" V 7550 6600 50  0000 C CNN
F 1 "4K7" V 7650 6600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7580 6600 50  0001 C CNN
F 3 "~" H 7650 6600 50  0001 C CNN
	1    7650 6600
	-1   0    0    1   
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR0102
U 1 1 5DC0E0D0
P 3500 2400
F 0 "#PWR0102" H 3500 2250 50  0001 C CNN
F 1 "VCC" H 3517 2573 50  0000 C CNN
F 2 "" H 3500 2400 50  0001 C CNN
F 3 "" H 3500 2400 50  0001 C CNN
	1    3500 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR0103
U 1 1 5DC0E43B
P 3500 4600
F 0 "#PWR0103" H 3500 4450 50  0001 C CNN
F 1 "VCC" H 3517 4773 50  0000 C CNN
F 2 "" H 3500 4600 50  0001 C CNN
F 3 "" H 3500 4600 50  0001 C CNN
	1    3500 4600
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR0106
U 1 1 5DC0E90D
P 6000 2400
F 0 "#PWR0106" H 6000 2250 50  0001 C CNN
F 1 "VCC" H 6017 2573 50  0000 C CNN
F 2 "" H 6000 2400 50  0001 C CNN
F 3 "" H 6000 2400 50  0001 C CNN
	1    6000 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR0107
U 1 1 5DC0EA5B
P 8900 5650
F 0 "#PWR0107" H 8900 5500 50  0001 C CNN
F 1 "VCC" H 8917 5823 50  0000 C CNN
F 2 "" H 8900 5650 50  0001 C CNN
F 3 "" H 8900 5650 50  0001 C CNN
	1    8900 5650
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR0108
U 1 1 5DC0FAD3
P 1050 6500
F 0 "#PWR0108" H 1050 6350 50  0001 C CNN
F 1 "VCC" H 1067 6673 50  0000 C CNN
F 2 "" H 1050 6500 50  0001 C CNN
F 3 "" H 1050 6500 50  0001 C CNN
	1    1050 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2700 2600 2700
Wire Wire Line
	3000 2800 2600 2800
Wire Wire Line
	3000 2900 2600 2900
Wire Wire Line
	3000 3000 2600 3000
Wire Wire Line
	4000 2700 4250 2700
Wire Wire Line
	4000 2800 4250 2800
Wire Wire Line
	4000 2900 4250 2900
Text Label 2600 2700 0    50   ~ 0
~B_M1
Text Label 2600 2800 0    50   ~ 0
~B_BUSAK
Text Label 2600 2900 0    50   ~ 0
~B_BAI
Text Label 2600 3000 0    50   ~ 0
B_PHI
Text Label 4050 2700 0    50   ~ 0
~M1
$Comp
L Z80DMA2-rescue:GND-power #PWR0110
U 1 1 5DC72F1A
P 13650 4150
F 0 "#PWR0110" H 13650 3900 50  0001 C CNN
F 1 "GND" H 13655 3977 50  0000 C CNN
F 2 "" H 13650 4150 50  0001 C CNN
F 3 "" H 13650 4150 50  0001 C CNN
	1    13650 4150
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0112
U 1 1 5DC7409B
P 2600 3700
F 0 "#PWR0112" H 2600 3450 50  0001 C CNN
F 1 "GND" H 2605 3527 50  0000 C CNN
F 2 "" H 2600 3700 50  0001 C CNN
F 3 "" H 2600 3700 50  0001 C CNN
	1    2600 3700
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0113
U 1 1 5DC74397
P 3500 7000
F 0 "#PWR0113" H 3500 6750 50  0001 C CNN
F 1 "GND" H 3505 6827 50  0000 C CNN
F 2 "" H 3500 7000 50  0001 C CNN
F 3 "" H 3500 7000 50  0001 C CNN
	1    3500 7000
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0114
U 1 1 5DC746D9
P 1800 7350
F 0 "#PWR0114" H 1800 7100 50  0001 C CNN
F 1 "GND" H 1805 7177 50  0000 C CNN
F 2 "" H 1800 7350 50  0001 C CNN
F 3 "" H 1800 7350 50  0001 C CNN
	1    1800 7350
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0117
U 1 1 5DC74B2D
P 6000 4000
F 0 "#PWR0117" H 6000 3750 50  0001 C CNN
F 1 "GND" H 6150 4000 50  0000 C CNN
F 2 "" H 6000 4000 50  0001 C CNN
F 3 "" H 6000 4000 50  0001 C CNN
	1    6000 4000
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0118
U 1 1 5DC74D6C
P 3500 4000
F 0 "#PWR0118" H 3500 3750 50  0001 C CNN
F 1 "GND" H 3505 3827 50  0000 C CNN
F 2 "" H 3500 4000 50  0001 C CNN
F 3 "" H 3500 4000 50  0001 C CNN
	1    3500 4000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS688 U3
U 1 1 5DC7585C
P 3500 5800
F 0 "U3" H 3200 6850 50  0000 L CNN
F 1 "74LS688" H 3550 4750 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 3500 5800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS688" H 3500 5800 50  0001 C CNN
	1    3500 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4900 3000 4900
Wire Wire Line
	2600 5000 3000 5000
Wire Wire Line
	2600 5100 3000 5100
Wire Wire Line
	2600 5200 3000 5200
Wire Wire Line
	2600 5300 3000 5300
Wire Wire Line
	2600 5400 3000 5400
Wire Wire Line
	2600 5500 3000 5500
Wire Wire Line
	2600 5600 3000 5600
Wire Wire Line
	1450 5800 3000 5800
Wire Wire Line
	1450 5900 1800 5900
Wire Wire Line
	1450 6000 1900 6000
Wire Wire Line
	1450 6100 2000 6100
Wire Wire Line
	1450 6200 2100 6200
Wire Wire Line
	1450 6300 2200 6300
Wire Wire Line
	1450 6400 2300 6400
Wire Wire Line
	1450 6500 2400 6500
Wire Wire Line
	1800 6700 1800 5900
Wire Wire Line
	1900 6700 1900 6000
Wire Wire Line
	2000 6700 2000 6100
Wire Wire Line
	2100 6700 2100 6200
Wire Wire Line
	2200 6700 2200 6300
Wire Wire Line
	2300 6700 2300 6400
Wire Wire Line
	2400 6700 2400 6500
Text Label 2600 4900 0    50   ~ 0
~B_M1
Text Label 2600 5000 0    50   ~ 0
B_A1
Text Label 2600 5100 0    50   ~ 0
B_A2
Text Label 2600 5200 0    50   ~ 0
B_A3
Text Label 2600 5300 0    50   ~ 0
B_A4
Text Label 2600 5400 0    50   ~ 0
B_A5
Text Label 2600 5500 0    50   ~ 0
B_A6
Text Label 2600 5600 0    50   ~ 0
B_A7
Wire Wire Line
	2600 6700 3000 6700
Text Label 2600 6700 0    50   ~ 0
~B_IORQ
Connection ~ 1800 5900
Connection ~ 1900 6000
Connection ~ 2000 6100
Connection ~ 2100 6200
Connection ~ 2200 6300
Connection ~ 2300 6400
Connection ~ 2400 6500
Wire Wire Line
	1800 5900 3000 5900
Wire Wire Line
	1900 6000 3000 6000
Wire Wire Line
	2000 6100 3000 6100
Wire Wire Line
	2100 6200 3000 6200
Wire Wire Line
	2200 6300 3000 6300
Wire Wire Line
	2300 6400 3000 6400
Wire Wire Line
	2400 6500 3000 6500
Wire Wire Line
	5100 2700 5500 2700
Wire Wire Line
	3600 1850 3750 1850
Wire Wire Line
	2600 1950 3000 1950
Wire Wire Line
	4000 3200 4250 3200
Text Label 2600 3200 0    50   ~ 0
B_IEI
Text Label 4000 3200 0    50   ~ 0
IEI
Text Label 2600 1750 0    50   ~ 0
IEO
Text Label 2600 2100 0    50   ~ 0
B_IEO
Text Label 4600 3000 1    50   ~ 0
PHI
Wire Wire Line
	2600 8450 3200 8450
Wire Wire Line
	1250 9700 2000 9700
Wire Wire Line
	1250 9150 2000 9150
Wire Wire Line
	1250 8950 2000 8950
Wire Wire Line
	1250 8450 1800 8450
Wire Wire Line
	2600 9700 2950 9700
Wire Wire Line
	2950 9700 2950 9250
Wire Wire Line
	2950 9250 3200 9250
Wire Wire Line
	1250 9350 2850 9350
Wire Wire Line
	2850 9350 2850 9150
Wire Wire Line
	2850 9150 3200 9150
Wire Wire Line
	2600 9050 3200 9050
Wire Wire Line
	1250 8700 2850 8700
Wire Wire Line
	2850 8700 2850 8650
Wire Wire Line
	2850 8650 3200 8650
Wire Wire Line
	3800 9150 3800 9400
Wire Wire Line
	3800 9400 3150 9400
Wire Wire Line
	3150 9400 3150 9700
Wire Wire Line
	3150 9700 3200 9700
Wire Wire Line
	3900 8550 3800 8550
Wire Wire Line
	3800 7950 4000 7950
Wire Wire Line
	3200 8050 1800 8050
Wire Wire Line
	1800 8050 1800 8450
Connection ~ 1800 8450
Wire Wire Line
	1800 8450 2000 8450
$Comp
L 74xx:74LS04 U5
U 4 1 5DB6DE9A
P 3500 9700
F 0 "U5" H 3500 10050 50  0000 C CNN
F 1 "74LS04" H 3500 9900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3500 9700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3500 9700 50  0001 C CNN
	4    3500 9700
	1    0    0    -1  
$EndComp
Text Label 1250 9700 0    50   ~ 0
IEI
Text Label 1250 9350 0    50   ~ 0
IEO
Text Label 1250 9150 0    50   ~ 0
~M1
Text Label 1250 8950 0    50   ~ 0
~IORQ
Text Label 1250 8700 0    50   ~ 0
~BAI
Text Label 1250 8450 0    50   ~ 0
~RD
Wire Wire Line
	1250 7850 3200 7850
Text Label 1250 7850 0    50   ~ 0
~CE_DMA_IC
Wire Wire Line
	2600 3700 3000 3700
Wire Wire Line
	5100 2800 5500 2800
Wire Wire Line
	5100 2900 5500 2900
Wire Wire Line
	5100 3000 5500 3000
Wire Wire Line
	5100 3100 5500 3100
Wire Wire Line
	5100 3200 5500 3200
Wire Wire Line
	5100 3300 5500 3300
Wire Wire Line
	5100 3400 5500 3400
Text Label 5100 2700 0    50   ~ 0
B_A0
Text Label 5100 2800 0    50   ~ 0
B_A1
Text Label 5100 2900 0    50   ~ 0
B_A2
Text Label 5100 3000 0    50   ~ 0
B_A3
Text Label 5100 3100 0    50   ~ 0
B_A4
Text Label 5100 3200 0    50   ~ 0
B_A5
Text Label 5100 3300 0    50   ~ 0
B_A6
Text Label 5100 3400 0    50   ~ 0
B_A7
$Comp
L 74xx:74LS244 U8
U 1 1 5E0118E4
P 6000 5400
F 0 "U8" H 6250 6050 50  0000 C CNN
F 1 "74LS244" H 5800 4750 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6000 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 6000 5400 50  0001 C CNN
	1    6000 5400
	-1   0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0119
U 1 1 5E013EC9
P 6000 6200
F 0 "#PWR0119" H 6000 5950 50  0001 C CNN
F 1 "GND" H 6005 6027 50  0000 C CNN
F 2 "" H 6000 6200 50  0001 C CNN
F 3 "" H 6000 6200 50  0001 C CNN
	1    6000 6200
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0120
U 1 1 5E014FF8
P 6000 8350
F 0 "#PWR0120" H 6000 8100 50  0001 C CNN
F 1 "GND" H 6005 8177 50  0000 C CNN
F 2 "" H 6000 8350 50  0001 C CNN
F 3 "" H 6000 8350 50  0001 C CNN
	1    6000 8350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4900 5500 4900
Wire Wire Line
	5100 5000 5500 5000
Wire Wire Line
	5100 5100 5500 5100
Wire Wire Line
	5100 5200 5500 5200
Wire Wire Line
	5100 5300 5500 5300
Wire Wire Line
	5100 5400 5500 5400
Wire Wire Line
	5100 5500 5500 5500
Wire Wire Line
	8000 5950 8400 5950
Text Label 5100 4900 0    50   ~ 0
B_A8
Text Label 5100 5000 0    50   ~ 0
B_A9
Text Label 5100 5100 0    50   ~ 0
B_A10
Text Label 5100 5200 0    50   ~ 0
B_A11
Text Label 5100 5300 0    50   ~ 0
B_A12
Text Label 5100 5400 0    50   ~ 0
B_A13
Text Label 5100 5500 0    50   ~ 0
B_A14
Text Label 5100 5600 0    50   ~ 0
B_A15
$Comp
L Z80DMA2-rescue:VCC-power #PWR0121
U 1 1 5E030FAA
P 6000 4600
F 0 "#PWR0121" H 6000 4450 50  0001 C CNN
F 1 "VCC" H 6017 4773 50  0000 C CNN
F 2 "" H 6000 4600 50  0001 C CNN
F 3 "" H 6000 4600 50  0001 C CNN
	1    6000 4600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS241 U9
U 1 1 5DB59E8F
P 6000 7550
F 0 "U9" H 5750 8200 50  0000 C CNN
F 1 "74LS241" H 6200 6900 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6000 7550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS241" H 6000 7550 50  0001 C CNN
	1    6000 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 5600 5500 5600
Wire Wire Line
	5050 7550 5200 7550
Wire Wire Line
	6500 7750 6550 7750
$Comp
L Z80DMA2-rescue:GND-power #PWR0122
U 1 1 5E0C6BE6
P 8100 5250
F 0 "#PWR0122" H 8100 5000 50  0001 C CNN
F 1 "GND" H 8100 5150 50  0000 C CNN
F 2 "" H 8100 5250 50  0001 C CNN
F 3 "" H 8100 5250 50  0001 C CNN
	1    8100 5250
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR0123
U 1 1 5E0C6EEA
P 6000 6750
F 0 "#PWR0123" H 6000 6600 50  0001 C CNN
F 1 "VCC" H 6017 6923 50  0000 C CNN
F 2 "" H 6000 6750 50  0001 C CNN
F 3 "" H 6000 6750 50  0001 C CNN
	1    6000 6750
	1    0    0    -1  
$EndComp
Text Label 5050 7450 0    50   ~ 0
~B_IORQ
Text Label 5050 7550 0    50   ~ 0
~B_MREQ
Text Label 5050 7650 0    50   ~ 0
~B_RD
Text Label 5050 7750 0    50   ~ 0
~B_WR
Text Label 6700 7450 0    50   ~ 0
~IORQ
Text Label 6700 7550 0    50   ~ 0
~MREQ
Text Label 6700 7650 0    50   ~ 0
~RD
Text Label 6700 7750 0    50   ~ 0
~WR
Wire Wire Line
	5450 8600 6550 8600
Wire Wire Line
	6550 8600 6550 7750
Wire Wire Line
	5450 7350 5500 7350
Wire Wire Line
	5350 8700 6650 8700
Wire Wire Line
	6650 8700 6650 7650
Wire Wire Line
	5250 8800 6750 8800
Wire Wire Line
	5150 8900 6850 8900
Wire Wire Line
	6500 7350 6550 7350
Wire Wire Line
	5500 7950 5500 8050
Wire Wire Line
	5500 8500 7050 8500
Wire Wire Line
	7050 8500 7050 5800
Wire Wire Line
	7050 3600 6500 3600
Wire Wire Line
	6500 3700 6500 3600
Connection ~ 6500 3600
Wire Wire Line
	6500 5800 7050 5800
Connection ~ 7050 5800
Wire Wire Line
	6500 5900 6500 5800
Connection ~ 6500 5800
Wire Wire Line
	5500 8500 5500 8050
Connection ~ 5500 8050
$Comp
L Z80DMA2-rescue:VCC-power #PWR0124
U 1 1 5E28F3F8
P 4250 7500
F 0 "#PWR0124" H 4250 7350 50  0001 C CNN
F 1 "VCC" H 4267 7673 50  0000 C CNN
F 2 "" H 4250 7500 50  0001 C CNN
F 3 "" H 4250 7500 50  0001 C CNN
	1    4250 7500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS245 U10
U 1 1 5E28FD90
P 6000 9950
F 0 "U10" H 5750 10600 50  0000 C CNN
F 1 "74LS245" H 6200 9300 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6000 9950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 6000 9950 50  0001 C CNN
	1    6000 9950
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR0125
U 1 1 5E292B1C
P 6000 9150
F 0 "#PWR0125" H 6000 9000 50  0001 C CNN
F 1 "VCC" H 6017 9323 50  0000 C CNN
F 2 "" H 6000 9150 50  0001 C CNN
F 3 "" H 6000 9150 50  0001 C CNN
	1    6000 9150
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0126
U 1 1 5E293160
P 6000 10750
F 0 "#PWR0126" H 6000 10500 50  0001 C CNN
F 1 "GND" H 6005 10577 50  0000 C CNN
F 2 "" H 6000 10750 50  0001 C CNN
F 3 "" H 6000 10750 50  0001 C CNN
	1    6000 10750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 9450 5500 9450
Wire Wire Line
	5150 9550 5500 9550
Wire Wire Line
	5150 9650 5500 9650
Wire Wire Line
	5150 9750 5500 9750
Wire Wire Line
	5150 9850 5500 9850
Wire Wire Line
	5150 9950 5500 9950
Wire Wire Line
	5150 10050 5500 10050
Wire Wire Line
	5150 10150 5500 10150
Wire Wire Line
	6500 9450 6850 9450
Wire Wire Line
	6850 9550 6500 9550
Wire Wire Line
	6850 9650 6500 9650
Wire Wire Line
	6850 9750 6500 9750
Wire Wire Line
	6850 9850 6500 9850
Wire Wire Line
	6850 9950 6500 9950
Wire Wire Line
	6850 10050 6500 10050
Wire Wire Line
	9750 9450 9400 9450
$Comp
L Z80DMA2-rescue:GND-power #PWR0127
U 1 1 5E45EEE2
P 5500 10450
F 0 "#PWR0127" H 5500 10200 50  0001 C CNN
F 1 "GND" H 5505 10277 50  0000 C CNN
F 2 "" H 5500 10450 50  0001 C CNN
F 3 "" H 5500 10450 50  0001 C CNN
	1    5500 10450
	1    0    0    -1  
$EndComp
Text Label 5150 9450 0    50   ~ 0
B_D7
Text Label 5150 9550 0    50   ~ 0
B_D6
Text Label 5150 9650 0    50   ~ 0
B_D5
Text Label 5150 9750 0    50   ~ 0
B_D4
Text Label 5150 9850 0    50   ~ 0
B_D3
Text Label 5150 9950 0    50   ~ 0
B_D2
Text Label 5150 10050 0    50   ~ 0
B_D1
Text Label 5150 10150 0    50   ~ 0
B_D0
Text Label 6700 9450 0    50   ~ 0
D7
Text Label 6700 9550 0    50   ~ 0
D6
Text Label 6700 9650 0    50   ~ 0
D5
Text Label 6700 9750 0    50   ~ 0
D4
Text Label 6700 9850 0    50   ~ 0
D3
Text Label 6700 9950 0    50   ~ 0
D2
Text Label 6700 10050 0    50   ~ 0
D1
Text Label 6700 10150 0    50   ~ 0
D0
Wire Wire Line
	6500 2700 8400 2700
Wire Wire Line
	6500 2800 8400 2800
Wire Wire Line
	6500 2900 8400 2900
Wire Wire Line
	6500 3000 8400 3000
Wire Wire Line
	6500 3100 8400 3100
Wire Wire Line
	6500 3200 8400 3200
Wire Wire Line
	6500 3300 8400 3300
Wire Wire Line
	6500 3400 8400 3400
Wire Wire Line
	7200 4900 7200 3500
Wire Wire Line
	7200 3500 8400 3500
Wire Wire Line
	6500 4900 7200 4900
Wire Wire Line
	7300 5000 7300 3600
Wire Wire Line
	7300 3600 8400 3600
Wire Wire Line
	6500 5000 7300 5000
Wire Wire Line
	7400 5100 7400 3700
Wire Wire Line
	7400 3700 8400 3700
Wire Wire Line
	6500 5100 7400 5100
Wire Wire Line
	7500 5200 7500 3800
Wire Wire Line
	7500 3800 8400 3800
Wire Wire Line
	6500 5200 7500 5200
Wire Wire Line
	7600 5300 7600 3900
Wire Wire Line
	7600 3900 8400 3900
Wire Wire Line
	6500 5300 7600 5300
Wire Wire Line
	7700 5400 7700 4000
Wire Wire Line
	7700 4000 8400 4000
Wire Wire Line
	6500 5400 7700 5400
Wire Wire Line
	7800 5500 7800 4100
Wire Wire Line
	7800 4100 8400 4100
Wire Wire Line
	7900 5600 7900 4200
Wire Wire Line
	7900 4200 8400 4200
Wire Wire Line
	6500 5600 7900 5600
$Comp
L Z80DMA2-rescue:VCC-power #PWR0128
U 1 1 5E724EC6
P 8900 2450
F 0 "#PWR0128" H 8900 2300 50  0001 C CNN
F 1 "VCC" H 8900 2550 50  0000 C CNN
F 2 "" H 8900 2450 50  0001 C CNN
F 3 "" H 8900 2450 50  0001 C CNN
	1    8900 2450
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0129
U 1 1 5E726A05
P 8900 7150
F 0 "#PWR0129" H 8900 6900 50  0001 C CNN
F 1 "GND" H 8905 6977 50  0000 C CNN
F 2 "" H 8900 7150 50  0001 C CNN
F 3 "" H 8900 7150 50  0001 C CNN
	1    8900 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 7050 5250 7050
Wire Wire Line
	8000 6150 8400 6150
Wire Wire Line
	8000 6350 8400 6350
Wire Wire Line
	8000 6550 8400 6550
Wire Wire Line
	9950 5400 8000 5400
Wire Wire Line
	8000 5400 8000 4350
Text Label 8000 5950 0    50   ~ 0
B_D0
Text Label 8000 6150 0    50   ~ 0
B_D1
Text Label 8000 6350 0    50   ~ 0
B_D2
Text Label 8000 6550 0    50   ~ 0
B_D3
NoConn ~ 9400 6050
NoConn ~ 9400 6450
NoConn ~ 9400 6650
Wire Wire Line
	8250 6750 8400 6750
Wire Wire Line
	8400 8400 8000 8400
Text Label 8150 7650 0    50   ~ 0
~CE_DMA_RDY
Text Label 2600 3300 0    50   ~ 0
~B_WR
Wire Wire Line
	8250 6750 8250 7350
Wire Wire Line
	7250 7250 7650 7250
$Comp
L Z80DMA2-rescue:VCC-power #PWR0133
U 1 1 5EA5FF91
P 7650 6450
F 0 "#PWR0133" H 7650 6300 50  0001 C CNN
F 1 "VCC" H 7667 6623 50  0000 C CNN
F 2 "" H 7650 6450 50  0001 C CNN
F 3 "" H 7650 6450 50  0001 C CNN
	1    7650 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 8300 9400 8300
NoConn ~ 9400 8500
NoConn ~ 9400 8600
Wire Wire Line
	7650 7450 7650 7650
Wire Wire Line
	7650 7650 9550 7650
Wire Wire Line
	9550 7650 9550 8400
Wire Wire Line
	9550 8400 9400 8400
$Comp
L 74xx:74LS139 U14
U 2 1 5EC7FD2A
P 13800 5350
F 0 "U14" H 13800 5750 50  0000 C CNN
F 1 "74LS139" H 13800 5650 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 13800 5350 50  0001 C CNN
F 3 "" H 13800 5350 50  0001 C CNN
	2    13800 5350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS157 U15
U 1 1 5EC837CA
P 8900 10050
F 0 "U15" H 8650 10800 50  0000 C CNN
F 1 "74LS157" H 9100 9200 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 8900 10050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 8900 10050 50  0001 C CNN
	1    8900 10050
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0134
U 1 1 5EC85D43
P 8900 11050
F 0 "#PWR0134" H 8900 10800 50  0001 C CNN
F 1 "GND" H 8905 10877 50  0000 C CNN
F 2 "" H 8900 11050 50  0001 C CNN
F 3 "" H 8900 11050 50  0001 C CNN
	1    8900 11050
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR0135
U 1 1 5EC869FC
P 8900 9150
F 0 "#PWR0135" H 8900 9000 50  0001 C CNN
F 1 "VCC" H 8917 9323 50  0000 C CNN
F 2 "" H 8900 9150 50  0001 C CNN
F 3 "" H 8900 9150 50  0001 C CNN
	1    8900 9150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 8300 9650 8900
Wire Wire Line
	9650 8900 8300 8900
Wire Wire Line
	8300 8900 8300 9550
Wire Wire Line
	8300 9550 8400 9550
Text Label 8000 8400 0    50   ~ 0
B_A0
Text Label 8000 8600 0    50   ~ 0
~CE_DMA_BRD
Wire Wire Line
	8000 8600 8400 8600
NoConn ~ 8400 9750
NoConn ~ 8400 9850
NoConn ~ 8400 10050
NoConn ~ 8400 10150
NoConn ~ 8400 10350
NoConn ~ 8400 10450
NoConn ~ 9400 10350
NoConn ~ 9400 10050
NoConn ~ 9400 9750
$Comp
L Z80DMA2-rescue:GND-power #PWR0137
U 1 1 5EE38AAD
P 8400 10750
F 0 "#PWR0137" H 8400 10500 50  0001 C CNN
F 1 "GND" H 8250 10750 50  0000 C CNN
F 2 "" H 8400 10750 50  0001 C CNN
F 3 "" H 8400 10750 50  0001 C CNN
	1    8400 10750
	1    0    0    -1  
$EndComp
Text Label 8000 10650 0    50   ~ 0
~BAI
Text Label 9400 9450 0    50   ~ 0
~CE_DMA_IC
Text Label 9450 2700 0    50   ~ 0
D0
Wire Wire Line
	9750 2800 9400 2800
Wire Wire Line
	9750 2900 9400 2900
Wire Wire Line
	9750 3000 9400 3000
Wire Wire Line
	9750 3100 9400 3100
Wire Wire Line
	9750 3200 9400 3200
Wire Wire Line
	9750 3300 9400 3300
Wire Wire Line
	9750 3400 9400 3400
Text Label 9450 2800 0    50   ~ 0
D1
Text Label 9450 2900 0    50   ~ 0
D2
Text Label 9450 3000 0    50   ~ 0
D3
Text Label 9450 3100 0    50   ~ 0
D4
Text Label 9450 3200 0    50   ~ 0
D5
Text Label 9450 3300 0    50   ~ 0
D6
Text Label 9450 3400 0    50   ~ 0
D7
Wire Wire Line
	9750 3550 9400 3550
Wire Wire Line
	9750 3900 9400 3900
Wire Wire Line
	9750 4000 9400 4000
Wire Wire Line
	9750 4100 9400 4100
Wire Wire Line
	9750 4200 9400 4200
Wire Wire Line
	9750 4300 9400 4300
Wire Wire Line
	8400 4650 8050 4650
Text Label 9450 3550 0    50   ~ 0
~B_BUSRQ
Text Label 9450 3650 0    50   ~ 0
~BAI
Text Label 9450 3750 0    50   ~ 0
~BAO
Text Label 9450 3900 0    50   ~ 0
~M1
Text Label 9450 4000 0    50   ~ 0
~IORQ
Text Label 9450 4100 0    50   ~ 0
~MREQ
Text Label 9450 4200 0    50   ~ 0
~RD
Text Label 9450 4300 0    50   ~ 0
~WR
Text Label 9450 4750 0    50   ~ 0
PHI
Text Label 4050 4900 0    50   ~ 0
~CE_DMA_BRD
$Comp
L Z80DMA2-rescue:VCC-power #PWR0139
U 1 1 5F38C5EE
P 4600 2400
F 0 "#PWR0139" H 4600 2250 50  0001 C CNN
F 1 "VCC" H 4700 2450 50  0000 C CNN
F 2 "" H 4600 2400 50  0001 C CNN
F 3 "" H 4600 2400 50  0001 C CNN
	1    4600 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2700 4600 3000
Wire Wire Line
	2150 3200 2150 2900
Text Label 2150 3200 1    50   ~ 0
B_IEI
Wire Wire Line
	8050 4750 8400 4750
Wire Wire Line
	9400 4750 9750 4750
Text Label 8050 4650 0    50   ~ 0
IEI
Text Label 8050 4750 0    50   ~ 0
IEO
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R5
U 1 1 5F6740A7
P 9200 2050
F 0 "R5" H 9270 2096 50  0000 L CNN
F 1 "4K7" H 9270 2005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9130 2050 50  0001 C CNN
F 3 "~" H 9200 2050 50  0001 C CNN
	1    9200 2050
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR0142
U 1 1 5F674E23
P 9200 1900
F 0 "#PWR0142" H 9200 1750 50  0001 C CNN
F 1 "VCC" H 9217 2073 50  0000 C CNN
F 2 "" H 9200 1900 50  0001 C CNN
F 3 "" H 9200 1900 50  0001 C CNN
	1    9200 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9750 2700 9400 2700
Text Label 11300 1350 0    50   ~ 0
~B_INT
Wire Wire Line
	11050 3750 10650 3750
Text Label 10650 3750 0    50   ~ 0
~B_BAO
NoConn ~ 14500 5250
NoConn ~ 15100 5250
NoConn ~ 13300 5250
NoConn ~ 13300 5350
NoConn ~ 13300 5550
NoConn ~ 14300 5550
NoConn ~ 14300 5450
NoConn ~ 14300 5350
NoConn ~ 14300 5250
Text Label 15900 8300 0    50   ~ 0
~B_WAIT
Wire Wire Line
	7050 8500 7050 9100
Connection ~ 7050 8500
Wire Wire Line
	6500 9100 7050 9100
Text Label 6500 9100 0    50   ~ 0
~BAI
Connection ~ 6550 7750
Wire Wire Line
	6500 7450 6750 7450
Connection ~ 6650 7650
Wire Wire Line
	6650 7650 6500 7650
Wire Wire Line
	6500 7550 6850 7550
Wire Wire Line
	5350 7250 5500 7250
Connection ~ 6750 7450
Wire Wire Line
	6750 7450 6900 7450
Connection ~ 6850 7550
Wire Wire Line
	6850 7550 6900 7550
Wire Wire Line
	5150 7150 5500 7150
Text Label 2600 3100 0    50   ~ 0
~B_WAIT
Text Label 15900 8200 0    50   ~ 0
~B_BUSRQ
Wire Wire Line
	2600 2100 3750 2100
Wire Wire Line
	5400 7750 5400 6600
Wire Wire Line
	5400 6600 6550 6600
Wire Wire Line
	6550 6600 6550 7350
Connection ~ 5400 7750
Wire Wire Line
	5400 7750 5500 7750
Wire Wire Line
	5300 7650 5300 6500
Wire Wire Line
	5300 6500 6650 6500
Wire Wire Line
	6650 6500 6650 7250
Connection ~ 5300 7650
Wire Wire Line
	5300 7650 5500 7650
Wire Wire Line
	6650 7250 6500 7250
Wire Wire Line
	5200 7550 5200 6400
Wire Wire Line
	5200 6400 6750 6400
Wire Wire Line
	6750 6400 6750 7150
Connection ~ 5200 7550
Wire Wire Line
	5200 7550 5500 7550
Wire Wire Line
	6750 7150 6500 7150
Wire Wire Line
	5100 6300 6850 6300
Wire Wire Line
	6850 6300 6850 7050
Wire Wire Line
	6850 7050 6500 7050
Wire Wire Line
	5050 7450 5100 7450
Wire Wire Line
	5100 6300 5100 7450
Connection ~ 5100 7450
Wire Wire Line
	9400 3750 10050 3750
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C1
U 1 1 606751C1
P 13300 2400
F 0 "C1" H 13415 2446 50  0000 L CNN
F 1 "0.1u" H 13415 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 13338 2250 50  0001 C CNN
F 3 "~" H 13300 2400 50  0001 C CNN
	1    13300 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C2
U 1 1 606770E2
P 13650 2400
F 0 "C2" H 13765 2446 50  0000 L CNN
F 1 "0.1u" H 13765 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 13688 2250 50  0001 C CNN
F 3 "~" H 13650 2400 50  0001 C CNN
	1    13650 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C3
U 1 1 6067756E
P 14000 2400
F 0 "C3" H 14115 2446 50  0000 L CNN
F 1 "0.1u" H 14115 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 14038 2250 50  0001 C CNN
F 3 "~" H 14000 2400 50  0001 C CNN
	1    14000 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C4
U 1 1 60677F3F
P 14350 2400
F 0 "C4" H 14465 2446 50  0000 L CNN
F 1 "0.1u" H 14465 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 14388 2250 50  0001 C CNN
F 3 "~" H 14350 2400 50  0001 C CNN
	1    14350 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C5
U 1 1 60678515
P 14700 2400
F 0 "C5" H 14815 2446 50  0000 L CNN
F 1 "0.1u" H 14815 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 14738 2250 50  0001 C CNN
F 3 "~" H 14700 2400 50  0001 C CNN
	1    14700 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C6
U 1 1 6067AB7C
P 15050 2400
F 0 "C6" H 15165 2446 50  0000 L CNN
F 1 "0.1u" H 15165 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 15088 2250 50  0001 C CNN
F 3 "~" H 15050 2400 50  0001 C CNN
	1    15050 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C7
U 1 1 6067AB82
P 15400 2400
F 0 "C7" H 15515 2446 50  0000 L CNN
F 1 "0.1u" H 15515 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 15438 2250 50  0001 C CNN
F 3 "~" H 15400 2400 50  0001 C CNN
	1    15400 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C8
U 1 1 6067AB88
P 15750 2400
F 0 "C8" H 15865 2446 50  0000 L CNN
F 1 "0.1u" H 15865 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 15788 2250 50  0001 C CNN
F 3 "~" H 15750 2400 50  0001 C CNN
	1    15750 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C9
U 1 1 6067AB8E
P 16100 2400
F 0 "C9" H 16215 2446 50  0000 L CNN
F 1 "0.1u" H 16215 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 16138 2250 50  0001 C CNN
F 3 "~" H 16100 2400 50  0001 C CNN
	1    16100 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C10
U 1 1 6067AB94
P 16450 2400
F 0 "C10" H 16565 2446 50  0000 L CNN
F 1 "0.1u" H 16565 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 16488 2250 50  0001 C CNN
F 3 "~" H 16450 2400 50  0001 C CNN
	1    16450 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C11
U 1 1 606A732B
P 16800 2400
F 0 "C11" H 16915 2446 50  0000 L CNN
F 1 "0.1u" H 16915 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 16838 2250 50  0001 C CNN
F 3 "~" H 16800 2400 50  0001 C CNN
	1    16800 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C12
U 1 1 606A7331
P 17150 2400
F 0 "C12" H 17265 2446 50  0000 L CNN
F 1 "0.1u" H 17265 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 17188 2250 50  0001 C CNN
F 3 "~" H 17150 2400 50  0001 C CNN
	1    17150 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C13
U 1 1 606A7337
P 17500 2400
F 0 "C13" H 17615 2446 50  0000 L CNN
F 1 "0.1u" H 17615 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 17538 2250 50  0001 C CNN
F 3 "~" H 17500 2400 50  0001 C CNN
	1    17500 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C14
U 1 1 606A733D
P 17850 2400
F 0 "C14" H 17965 2446 50  0000 L CNN
F 1 "0.1u" H 17965 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 17888 2250 50  0001 C CNN
F 3 "~" H 17850 2400 50  0001 C CNN
	1    17850 2400
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C15
U 1 1 606A7343
P 18200 2400
F 0 "C15" H 18315 2446 50  0000 L CNN
F 1 "0.1u" H 18315 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 18238 2250 50  0001 C CNN
F 3 "~" H 18200 2400 50  0001 C CNN
	1    18200 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	13300 2550 13650 2550
Connection ~ 13650 2550
Wire Wire Line
	13650 2550 14000 2550
Connection ~ 14000 2550
Wire Wire Line
	14000 2550 14350 2550
Connection ~ 14350 2550
Wire Wire Line
	14350 2550 14700 2550
Connection ~ 14700 2550
Wire Wire Line
	14700 2550 15050 2550
Connection ~ 15050 2550
Wire Wire Line
	15050 2550 15400 2550
Connection ~ 15400 2550
Wire Wire Line
	15400 2550 15750 2550
Connection ~ 15750 2550
Wire Wire Line
	15750 2550 16100 2550
Connection ~ 16100 2550
Wire Wire Line
	16100 2550 16450 2550
Connection ~ 16450 2550
Wire Wire Line
	16450 2550 16800 2550
Connection ~ 16800 2550
Wire Wire Line
	16800 2550 17150 2550
Connection ~ 17150 2550
Wire Wire Line
	17150 2550 17500 2550
Connection ~ 17500 2550
Wire Wire Line
	17500 2550 17850 2550
Connection ~ 17850 2550
Wire Wire Line
	17850 2550 18200 2550
Wire Wire Line
	13300 2250 13650 2250
Connection ~ 13650 2250
Wire Wire Line
	13650 2250 14000 2250
Connection ~ 14000 2250
Wire Wire Line
	14000 2250 14350 2250
Connection ~ 14350 2250
Wire Wire Line
	14350 2250 14700 2250
Connection ~ 14700 2250
Wire Wire Line
	14700 2250 15050 2250
Connection ~ 15050 2250
Wire Wire Line
	15050 2250 15400 2250
Connection ~ 15400 2250
Wire Wire Line
	15400 2250 15750 2250
Connection ~ 15750 2250
Wire Wire Line
	15750 2250 16100 2250
Connection ~ 16100 2250
Wire Wire Line
	16100 2250 16450 2250
Connection ~ 16450 2250
Wire Wire Line
	16450 2250 16800 2250
Connection ~ 16800 2250
Wire Wire Line
	16800 2250 17150 2250
Connection ~ 17150 2250
Wire Wire Line
	17150 2250 17500 2250
Connection ~ 17500 2250
Wire Wire Line
	17500 2250 17850 2250
Connection ~ 17850 2250
Wire Wire Line
	17850 2250 18200 2250
$Comp
L Z80DMA2-rescue:VCC-power #PWR0144
U 1 1 6078F299
P 13650 2250
F 0 "#PWR0144" H 13650 2100 50  0001 C CNN
F 1 "VCC" H 13667 2423 50  0000 C CNN
F 2 "" H 13650 2250 50  0001 C CNN
F 3 "" H 13650 2250 50  0001 C CNN
	1    13650 2250
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:CP-Device-ECB-DMA-rescue C17
U 1 1 5EC2D28F
P 18950 2400
F 0 "C17" H 19068 2446 50  0000 L CNN
F 1 "47uF" H 19068 2355 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 18988 2250 50  0001 C CNN
F 3 "~" H 18950 2400 50  0001 C CNN
	1    18950 2400
	1    0    0    -1  
$EndComp
Connection ~ 18950 2550
Wire Wire Line
	18600 2250 18950 2250
Wire Wire Line
	18600 2550 18950 2550
Wire Wire Line
	5450 7350 5450 8350
Connection ~ 5250 8250
Connection ~ 5450 8350
Wire Wire Line
	5450 8350 5450 8600
Wire Wire Line
	5250 8250 5250 8800
Connection ~ 5350 8550
Wire Wire Line
	5350 8550 5350 8700
Connection ~ 5150 8450
Wire Wire Line
	5150 8450 5150 8900
$Comp
L MCU_Microchip_ATtiny:ATtiny13-20PU U16
U 1 1 5DCDF135
P 11950 10250
F 0 "U16" H 11600 10800 50  0000 R CNN
F 1 "ATtiny13-20PU" H 12600 9700 50  0000 R CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 11950 10250 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc2535.pdf" H 11950 10250 50  0001 C CNN
	1    11950 10250
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR0145
U 1 1 5DCE30E5
P 11950 9650
F 0 "#PWR0145" H 11950 9500 50  0001 C CNN
F 1 "VCC" H 11967 9823 50  0000 C CNN
F 2 "" H 11950 9650 50  0001 C CNN
F 3 "" H 11950 9650 50  0001 C CNN
	1    11950 9650
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0146
U 1 1 5DCE36BC
P 11950 10850
F 0 "#PWR0146" H 11950 10600 50  0001 C CNN
F 1 "GND" H 11955 10677 50  0000 C CNN
F 2 "" H 11950 10850 50  0001 C CNN
F 3 "" H 11950 10850 50  0001 C CNN
	1    11950 10850
	1    0    0    -1  
$EndComp
Text Label 7250 6850 0    50   ~ 0
~RST
Wire Wire Line
	12900 10450 12550 10450
Wire Wire Line
	6850 10150 6500 10150
Text Label 12600 10450 0    50   ~ 0
~RST
NoConn ~ 12550 10350
NoConn ~ 12550 10250
NoConn ~ 12550 9950
$Comp
L Z80DMA2-rescue:LED-Device-ECB-DMA-rescue D1
U 1 1 5DF62F8A
P 13450 10600
F 0 "D1" H 13443 10907 50  0000 C CNN
F 1 "LED" H 13443 10816 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 13443 10725 50  0001 C CNN
F 3 "~" H 13450 10600 50  0001 C CNN
	1    13450 10600
	0    -1   -1   0   
$EndComp
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R7
U 1 1 5DF99DAB
P 13450 10300
F 0 "R7" H 13520 10346 50  0000 L CNN
F 1 "470R" H 13520 10255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 13380 10300 50  0001 C CNN
F 3 "~" H 13450 10300 50  0001 C CNN
	1    13450 10300
	-1   0    0    1   
$EndComp
$Comp
L Z80DMA2-rescue:C-Device-ECB-DMA-rescue C16
U 1 1 5E0446FF
P 18600 2400
F 0 "C16" H 18715 2446 50  0000 L CNN
F 1 "0.1u" H 18715 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D7.0mm_W2.5mm_P5.00mm" H 18638 2250 50  0001 C CNN
F 3 "~" H 18600 2400 50  0001 C CNN
	1    18600 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	18200 2250 18600 2250
Connection ~ 18200 2250
Connection ~ 18600 2250
Wire Wire Line
	18200 2550 18600 2550
Connection ~ 18200 2550
Connection ~ 18600 2550
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R8
U 1 1 5DD1EF92
P 4250 7650
F 0 "R8" H 4200 7850 50  0000 L CNN
F 1 "1K8" V 4250 7600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4180 7650 50  0001 C CNN
F 3 "~" H 4250 7650 50  0001 C CNN
	1    4250 7650
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R9
U 1 1 5DD1FE45
P 4400 7650
F 0 "R9" H 4350 7850 50  0000 L CNN
F 1 "1K8" V 4400 7600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4330 7650 50  0001 C CNN
F 3 "~" H 4400 7650 50  0001 C CNN
	1    4400 7650
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R10
U 1 1 5DD1FFC7
P 4550 7650
F 0 "R10" H 4500 7850 50  0000 L CNN
F 1 "1K8" V 4550 7600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4480 7650 50  0001 C CNN
F 3 "~" H 4550 7650 50  0001 C CNN
	1    4550 7650
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R11
U 1 1 5DD201DA
P 4700 7650
F 0 "R11" H 4650 7850 50  0000 L CNN
F 1 "1K8" V 4700 7600 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4630 7650 50  0001 C CNN
F 3 "~" H 4700 7650 50  0001 C CNN
	1    4700 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 7500 4550 7500
Connection ~ 4400 7500
Wire Wire Line
	4400 7500 4250 7500
Connection ~ 4550 7500
Wire Wire Line
	4550 7500 4400 7500
Connection ~ 4250 7500
Wire Wire Line
	4700 8250 4700 7800
Wire Wire Line
	4700 8250 5250 8250
Wire Wire Line
	4550 8350 4550 7800
Wire Wire Line
	4400 8450 4400 7800
Wire Wire Line
	4400 8450 5150 8450
Wire Wire Line
	4250 8550 4250 7800
Wire Wire Line
	4250 8550 5350 8550
Wire Wire Line
	11400 9250 11800 9250
Wire Wire Line
	11800 9050 11400 9050
Text Label 11400 9250 0    50   ~ 0
~PULSE
Text Label 4000 2800 0    50   ~ 0
~BUSAK
Text Label 11400 9050 0    50   ~ 0
~BUSAK
Text Label 11400 9150 0    50   ~ 0
~B_BUSRQ
Wire Wire Line
	11800 9150 11400 9150
Text Label 8050 4550 0    50   ~ 0
~PULSE
Text Label 13000 9150 0    50   ~ 0
DATA_XFER
Wire Wire Line
	13000 9150 13550 9150
Wire Wire Line
	13550 9150 13550 9500
Wire Wire Line
	12550 10050 13050 10050
Wire Wire Line
	3900 8550 3900 9700
Wire Wire Line
	3800 9700 3800 10450
Wire Wire Line
	9750 3650 9400 3650
Wire Wire Line
	3750 1850 3750 2100
$Comp
L 74xx:74LS139 U14
U 3 1 606BE3C8
P 17900 3600
F 0 "U14" H 18130 3646 50  0000 L CNN
F 1 "74LS139" H 18130 3555 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 17900 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74ls139a.pdf" H 17900 3600 50  0001 C CNN
	3    17900 3600
	1    0    0    -1  
$EndComp
Text Notes 8100 11700 0    50   ~ 0
CE / WAIT FUNCTION SELECT LOGIC\nWHEN DMA IS BUS MASTER CE/WAIT IS WAIT FUNCTION\nOTHERWISE CE/WAIT IS CHIP ENABLE\nWHEN WAIT FUNCTION IS SELECTED, BUS WAIT PIN IS CONNECTED\nTO CE/WAIT PIN
Text Notes 6150 2450 0    50   ~ 0
ADDRESS DIRECTION IS CONTROLLED BY\nSTATUS OF BAI\nWHEN BAI IS HIGH ADDRESS ARE IN TO DMA\nWHEN BAI IS LOW ADDRESS ARE OUT TO ECB BUS
Text Notes 1950 10350 0    50   ~ 0
DATA DIRECTION CONTROL LOGIC
Text Notes 8600 8150 0    50   ~ 0
PORT DECODING\n
Text Notes 9300 8900 0    50   ~ 0
TRANSITION LOW WHEN \nBASE PORT IS ACCESSED
Text Notes 9300 7600 0    50   ~ 0
TRANSITION LOW WHEN SECOND\nPORT IS ACCESSED
Text Notes 9700 8450 0    50   ~ 0
OUTPUT P4 AND P5 ARE HIGH\nWHEN NOT ACCESSING DMA BOARD
Text Notes 3900 10750 0    50   ~ 0
U1D, Pin 11 = H A->B from bus\nU1D, Pin 11 = L B->A to bus
$Comp
L Connector_Generic:Conn_02x02_Odd_Even JP2
U 1 1 61098BBA
P 4500 4100
F 0 "JP2" H 4550 4300 50  0000 C CNN
F 1 "ADDR DIR" H 4550 4200 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical" H 4500 4100 50  0001 C CNN
F 3 "~" H 4500 4100 50  0001 C CNN
	1    4500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4100 4300 4100
Text Label 4050 4200 0    50   ~ 0
~BUSAK
Text Label 4850 4100 0    50   ~ 0
~BAI
Wire Wire Line
	4800 4100 4800 4200
Connection ~ 4800 4100
Text Label 4150 3000 2    50   ~ 0
PHI
Text Label 4000 2900 0    50   ~ 0
~BAI~b
Text Label 4050 4100 0    50   ~ 0
~BAI~b
Wire Wire Line
	4300 4200 4050 4200
Wire Wire Line
	7250 6850 7650 6850
Wire Wire Line
	7650 6750 7650 6850
Connection ~ 7650 6850
Wire Wire Line
	7650 6850 8400 6850
Text Label 8050 4350 0    50   ~ 0
RDY
Wire Wire Line
	7950 4550 7950 2200
Wire Wire Line
	7950 4550 8400 4550
Wire Wire Line
	7950 2200 9200 2200
Text Label 9400 6150 0    50   ~ 0
Q1
Text Label 9400 6350 0    50   ~ 0
Q2
Text Label 9400 6550 0    50   ~ 0
Q3
NoConn ~ 9400 6150
NoConn ~ 9400 6350
NoConn ~ 9400 6550
Wire Wire Line
	4900 9800 4900 10050
Wire Wire Line
	4900 10050 4300 10050
Wire Wire Line
	4300 10050 4300 10250
Wire Wire Line
	4900 10350 5500 10350
Wire Wire Line
	3800 10450 4300 10450
Wire Wire Line
	4000 9900 4300 9900
Wire Wire Line
	4000 7950 4000 9900
Wire Wire Line
	3900 9700 4300 9700
$Comp
L 74xx:74LS04 U5
U 5 1 6148A573
P 10250 5400
F 0 "U5" H 10250 5717 50  0000 C CNN
F 1 "74LS04" H 10250 5626 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10250 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 10250 5400 50  0001 C CNN
	5    10250 5400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3000 3600 3000 3700
Connection ~ 3000 3700
Text Label 2600 1950 0    50   ~ 0
IEI
Wire Wire Line
	3000 1750 2600 1750
Wire Wire Line
	2600 3100 3000 3100
Wire Wire Line
	4000 3100 4250 3100
Text Label 4000 3100 0    50   ~ 0
~WAIT
Text Label 8000 9450 0    50   ~ 0
~WAIT
Wire Wire Line
	8000 9450 8400 9450
$Comp
L 74xx:74LS32 U4
U 2 1 5DB5D2D1
P 3500 8550
F 0 "U4" H 3500 8875 50  0000 C CNN
F 1 "74LS32" H 3500 8784 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3500 8550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3500 8550 50  0001 C CNN
	2    3500 8550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3300 3000 3300
Wire Wire Line
	4000 3300 4250 3300
Text Label 4000 3300 0    50   ~ 0
~WR~b
Text Label 7250 7250 0    50   ~ 0
~WR~b
Text Label 15900 8100 0    60   ~ 0
~B_RESET
Text Label 15900 8400 0    60   ~ 0
~B_BUSAK
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61BF5D9E
P 13300 2250
F 0 "#FLG0101" H 13300 2345 30  0001 C CNN
F 1 "PWR_FLAG" H 13300 2458 30  0000 C CNN
F 2 "" H 13300 2250 60  0001 C CNN
F 3 "" H 13300 2250 60  0001 C CNN
	1    13300 2250
	1    0    0    -1  
$EndComp
Connection ~ 13300 2250
Wire Wire Line
	13300 4100 13650 4100
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 61C30931
P 13300 4100
F 0 "#FLG0102" H 13300 4195 30  0001 C CNN
F 1 "PWR_FLAG" H 13300 4308 30  0000 C CNN
F 2 "" H 13300 4100 60  0001 C CNN
F 3 "" H 13300 4100 60  0001 C CNN
	1    13300 4100
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x08 SW1
U 1 1 61DE5AE0
P 2000 7000
F 0 "SW1" V 2046 7530 50  0000 L CNN
F 1 "IO PORT ADDR" V 1955 7530 50  0000 L CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx08_Slide_9.78x22.5mm_W7.62mm_P2.54mm" H 2000 7000 50  0001 C CNN
F 3 "" H 2000 7000 50  0001 C CNN
	1    2000 7000
	0    1    -1   0   
$EndComp
Connection ~ 1800 7300
Wire Wire Line
	1800 7300 1900 7300
Connection ~ 1900 7300
Wire Wire Line
	1900 7300 2000 7300
Connection ~ 2000 7300
Wire Wire Line
	2000 7300 2100 7300
Connection ~ 2100 7300
Wire Wire Line
	2100 7300 2200 7300
Connection ~ 2200 7300
Wire Wire Line
	2200 7300 2300 7300
Connection ~ 2300 7300
Wire Wire Line
	2300 7300 2400 7300
Wire Wire Line
	1800 7300 1800 7350
NoConn ~ 1700 6700
Wire Wire Line
	11150 5500 11150 5950
Wire Wire Line
	9400 5950 11150 5950
$Comp
L Z80DMA2-rescue:CONN_3-conn K1
U 1 1 622504DE
P 11900 2300
F 0 "K1" H 12028 2328 50  0000 L CNN
F 1 "EXT DMA" H 12028 2244 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 11900 2300 60  0001 C CNN
F 3 "" H 11900 2300 60  0001 C CNN
	1    11900 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11150 2400 11150 5300
Wire Wire Line
	11150 5400 11450 5400
Text Label 11200 5400 0    60   ~ 0
GND
Wire Wire Line
	11250 2300 11550 2300
Text Label 11300 2300 0    60   ~ 0
GND
Text Label 11200 2400 0    60   ~ 0
RDY_IN
Text Label 11050 2200 0    60   ~ 0
~PULSE_OUT
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R12
U 1 1 6242BDDB
P 18600 3450
F 0 "R12" H 18670 3496 50  0000 L CNN
F 1 "470R" H 18670 3405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 18530 3450 50  0001 C CNN
F 3 "~" H 18600 3450 50  0001 C CNN
	1    18600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	18600 3600 18600 3700
$Comp
L Z80DMA2-rescue:LED-Device-ECB-DMA-rescue D2
U 1 1 6242BDC7
P 18600 3850
F 0 "D2" H 18593 4157 50  0000 C CNN
F 1 "LED" H 18593 4066 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 18593 3975 50  0001 C CNN
F 3 "~" H 18600 3850 50  0001 C CNN
	1    18600 3850
	0    -1   -1   0   
$EndComp
$Comp
L Z80DMA2-rescue:GND-power #PWR0101
U 1 1 61DBA5AF
P 13600 6850
F 0 "#PWR0101" H 13600 6850 30  0001 C CNN
F 1 "GND" H 13600 6780 30  0001 C CNN
F 2 "" H 13600 6850 60  0001 C CNN
F 3 "" H 13600 6850 60  0001 C CNN
	1    13600 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	13600 6800 13150 6800
Connection ~ 13600 6800
Wire Wire Line
	13600 6800 13600 6850
Wire Wire Line
	14050 6800 13600 6800
$Comp
L mechanical:MountingHole_Pad H2
U 1 1 61D4969B
P 14050 6700
F 0 "H2" H 14150 6749 50  0000 L CNN
F 1 "BRACKET" H 14150 6658 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_2.2mm_M2_Pad" H 14050 6700 50  0001 C CNN
F 3 "~" H 14050 6700 50  0001 C CNN
	1    14050 6700
	1    0    0    -1  
$EndComp
$Comp
L mechanical:MountingHole_Pad H1
U 1 1 61D432DE
P 13150 6700
F 0 "H1" H 13250 6749 50  0000 L CNN
F 1 "BRACKET" H 13250 6658 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_2.2mm_M2_Pad" H 13150 6700 50  0001 C CNN
F 3 "~" H 13150 6700 50  0001 C CNN
	1    13150 6700
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:CONN_4-conn P3
U 1 1 61BDD64A
P 14250 7800
F 0 "P3" H 14378 7841 50  0000 L CNN
F 1 "DAISY CHAIN" H 14378 7750 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 14250 7800 60  0001 C CNN
F 3 "" H 14250 7800 60  0001 C CNN
	1    14250 7800
	1    0    0    -1  
$EndComp
Wire Wire Line
	13300 7650 13900 7650
Wire Wire Line
	13300 7950 13900 7950
Wire Wire Line
	13300 7750 13900 7750
Text Label 13350 7750 0    60   ~ 0
~B_BAO
Text Label 13350 7650 0    60   ~ 0
~B_BAI
Text Label 13350 7950 0    60   ~ 0
B_IEO
Wire Wire Line
	10650 2200 11550 2200
Wire Wire Line
	11150 2400 11550 2400
Wire Wire Line
	13300 7850 13900 7850
Text Label 13350 7850 0    60   ~ 0
B_IEI
Wire Wire Line
	5100 7450 5500 7450
Wire Wire Line
	5250 7050 5250 8250
Wire Wire Line
	5050 7650 5300 7650
Wire Wire Line
	5050 7750 5400 7750
Wire Wire Line
	5150 7150 5150 8450
Wire Wire Line
	6650 7650 6900 7650
Wire Wire Line
	6750 7450 6750 8800
Wire Wire Line
	6550 7750 6900 7750
Wire Wire Line
	6850 7550 6850 8900
Wire Wire Line
	5350 7250 5350 8550
Wire Wire Line
	4550 8350 5450 8350
Wire Wire Line
	6500 5500 7800 5500
Wire Wire Line
	7050 3600 7050 4100
$Comp
L Z80DMA2-rescue:CONN_3-conn K2
U 1 1 613E5D63
P 11900 1450
F 0 "K2" H 12028 1478 50  0000 L CNN
F 1 "INT SEL" H 12028 1394 40  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 11900 1450 60  0001 C CNN
F 3 "" H 11900 1450 60  0001 C CNN
	1    11900 1450
	1    0    0    -1  
$EndComp
Text Label 11300 1550 0    50   ~ 0
~B_NMI
Wire Wire Line
	11550 1450 10650 1450
Wire Wire Line
	11550 1350 11250 1350
Wire Wire Line
	11250 1550 11550 1550
Wire Wire Line
	7050 9100 7050 10650
Connection ~ 7050 9100
Wire Wire Line
	7050 10650 8400 10650
Wire Wire Line
	4800 4100 7050 4100
Connection ~ 7050 4100
Wire Wire Line
	7050 4100 7050 5800
Wire Wire Line
	4000 4900 4250 4900
Wire Wire Line
	13650 3100 14550 3100
Connection ~ 14550 3100
Wire Wire Line
	14550 3100 15400 3100
Connection ~ 15400 3100
Wire Wire Line
	15400 3100 16250 3100
Connection ~ 16250 3100
Wire Wire Line
	16250 3100 17100 3100
Connection ~ 17100 3100
Wire Wire Line
	17100 3100 17900 3100
Wire Wire Line
	13650 4100 14550 4100
Connection ~ 13650 4100
Connection ~ 14550 4100
Wire Wire Line
	14550 4100 15400 4100
Connection ~ 15400 4100
Wire Wire Line
	15400 4100 16250 4100
Connection ~ 16250 4100
Wire Wire Line
	16250 4100 17100 4100
Connection ~ 17100 4100
Wire Wire Line
	17100 4100 17900 4100
Wire Wire Line
	13650 4150 13650 4100
Connection ~ 9200 2200
Wire Wire Line
	9200 2200 10050 2200
Wire Wire Line
	10050 2200 10050 1450
Connection ~ 10050 2200
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R13
U 1 1 61090486
P 10650 2050
F 0 "R13" H 10720 2096 50  0000 L CNN
F 1 "4K7" H 10720 2005 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10580 2050 50  0001 C CNN
F 3 "~" H 10650 2050 50  0001 C CNN
	1    10650 2050
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR01
U 1 1 61090490
P 10650 1900
F 0 "#PWR01" H 10650 1750 50  0001 C CNN
F 1 "VCC" H 10667 2073 50  0000 C CNN
F 2 "" H 10650 1900 50  0001 C CNN
F 3 "" H 10650 1900 50  0001 C CNN
	1    10650 1900
	1    0    0    -1  
$EndComp
Connection ~ 10650 2200
Text Notes 11100 1950 0    60   ~ 0
NOTE: ~B_INT~ AND ~B_NMI~\nRELY ON PULL UP RESISTORS\nON PROCESOR BOARD
Wire Wire Line
	18950 4100 18600 4100
Connection ~ 17900 4100
Wire Wire Line
	13650 3100 12950 3100
Wire Wire Line
	12950 3100 12950 2250
Wire Wire Line
	12950 2250 13300 2250
Connection ~ 13650 3100
Wire Wire Line
	18600 4000 18600 4100
Connection ~ 18600 4100
Wire Wire Line
	18600 4100 17900 4100
Wire Wire Line
	18950 2550 18950 4100
Text Notes 6500 1800 0    60   ~ 0
Note: JP2 Select DMA priority\nJumpers 1-2 or 3-4 configure whether the board\nis a primary DMA or secondary DMA in the DMA\npriority chain. Default select 3-4 configures the\nboard as the primary DMA
Text Notes 12200 11750 0    60   ~ 0
DMA Transfer LED triggered \nwhenever a DMA\ntransfer is in progress and\nthe pulse signal is active.\nDMA software configuration\nneeds to program the\nactivation of the pulse signal.
Text Notes 650  5450 0    60   ~ 0
Note: DMA IO Address Ports $E0-$E1\nS1=off - A7 (high)\nS2=off - A6 (high)\nS3=off - A5 (high)\nS4=on - A4 (low)\nS5=on - A3 (low)\nS6=on - A2 (low)\nS7=on - A1 (low)\nS8=xx - A0 (xx)
$Comp
L Z80DMA2-rescue:LED-Device-ECB-DMA-rescue D3
U 1 1 613BA6CE
P 10350 10350
F 0 "D3" H 10350 10150 50  0000 C CNN
F 1 "LED" H 10350 10250 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 10343 10475 50  0001 C CNN
F 3 "~" H 10350 10350 50  0001 C CNN
	1    10350 10350
	0    -1   -1   0   
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR02
U 1 1 613BA6D8
P 10350 9700
F 0 "#PWR02" H 10350 9550 50  0001 C CNN
F 1 "VCC" H 10367 9873 50  0000 C CNN
F 2 "" H 10350 9700 50  0001 C CNN
F 3 "" H 10350 9700 50  0001 C CNN
	1    10350 9700
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R14
U 1 1 613BA6E2
P 10350 9950
F 0 "R14" H 10420 9996 50  0000 L CNN
F 1 "470R" H 10420 9905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10280 9950 50  0001 C CNN
F 3 "~" H 10350 9950 50  0001 C CNN
	1    10350 9950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 10100 10350 10200
Wire Wire Line
	10350 9700 10350 9800
Wire Wire Line
	13050 9500 13550 9500
Wire Wire Line
	13050 9500 13050 10050
Wire Wire Line
	9750 9450 9750 10500
$Comp
L Z80DMA2-rescue:LED-Device-ECB-DMA-rescue D4
U 1 1 61B5B6DF
P 12050 5600
F 0 "D4" H 12050 5400 50  0000 C CNN
F 1 "LED" H 12050 5500 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 12043 5725 50  0001 C CNN
F 3 "~" H 12050 5600 50  0001 C CNN
	1    12050 5600
	0    -1   -1   0   
$EndComp
$Comp
L Z80DMA2-rescue:VCC-power #PWR03
U 1 1 61B5B6E9
P 12050 4950
F 0 "#PWR03" H 12050 4800 50  0001 C CNN
F 1 "VCC" H 12067 5123 50  0000 C CNN
F 2 "" H 12050 4950 50  0001 C CNN
F 3 "" H 12050 4950 50  0001 C CNN
	1    12050 4950
	1    0    0    -1  
$EndComp
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R15
U 1 1 61B5B6F3
P 12050 5200
F 0 "R15" H 12120 5246 50  0000 L CNN
F 1 "470R" H 12120 5155 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 11980 5200 50  0001 C CNN
F 3 "~" H 12050 5200 50  0001 C CNN
	1    12050 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	12050 5350 12050 5450
Wire Wire Line
	12050 4950 12050 5050
Wire Wire Line
	10550 5400 10550 5750
Text Label 9750 5400 0    50   ~ 0
RDY
Connection ~ 10550 5400
Text Label 11250 5750 0    50   ~ 0
~RDY
Wire Wire Line
	2600 3400 3000 3400
Text Label 2600 3400 0    50   ~ 0
~B_RESET
Wire Wire Line
	4000 3400 4250 3400
Text Label 4000 3400 0    50   ~ 0
~RST
NoConn ~ 14500 5800
NoConn ~ 15100 5800
Wire Wire Line
	12550 10150 13450 10150
$Comp
L Z80DMA2-rescue:GND-power #PWR04
U 1 1 61411E28
P 13450 10750
F 0 "#PWR04" H 13450 10500 50  0001 C CNN
F 1 "GND" H 13455 10577 50  0000 C CNN
F 2 "" H 13450 10750 50  0001 C CNN
F 3 "" H 13450 10750 50  0001 C CNN
	1    13450 10750
	1    0    0    -1  
$EndComp
NoConn ~ 1700 7300
$Comp
L Z80DMA2-rescue:VCC-power #PWR05
U 1 1 617EAA34
P 2150 2600
F 0 "#PWR05" H 2150 2450 50  0001 C CNN
F 1 "VCC" H 2250 2650 50  0000 C CNN
F 2 "" H 2150 2600 50  0001 C CNN
F 3 "" H 2150 2600 50  0001 C CNN
	1    2150 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3200 3000 3200
Wire Wire Line
	4000 3000 4600 3000
$Comp
L Z80DMA2-rescue:DMA-PLCC-44-CMOS-Zilog_Z80_Peripherals U11
U 1 1 6197231F
P 9200 2650
F 0 "U11" H 9750 2700 50  0000 C CNN
F 1 "DMA-PLCC-44-CMOS" V 9600 2050 50  0000 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 9600 4500 50  0001 L CNN
F 3 "" H 8400 1500 50  0001 L CNN
F 4 "6 MHZ Z80 CMOS SIO/2 , Z84C4206PEG Zilog Z84C4206PEG, 8bit Z8 Microcontroller, 6MHz ROMLess, 40-Pin PDIP" H 9600 4300 50  0001 L CNN "Description"
F 5 "4.06" H 9600 4200 50  0001 L CNN "Height"
F 6 "Zilog" H 9600 4100 50  0001 L CNN "Manufacturer_Name"
F 7 "Z84C4206PEG" H 9600 4000 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "692-Z84C4206PEG" H 9600 3900 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.com/Search/Refine.aspx?Keyword=692-Z84C4206PEG" H 9600 3800 50  0001 L CNN "Mouser Price/Stock"
F 10 "6600766" H 9600 3700 50  0001 L CNN "RS Part Number"
F 11 "https://uk.rs-online.com/web/p/products/6600766" H 9600 3600 50  0001 L CNN "RS Price/Stock"
F 12 "R1000052" H 9600 3500 50  0001 L CNN "Allied_Number"
F 13 "https://www.alliedelec.com/zilog-z84c4206peg/R1000052/" H 9600 3400 50  0001 L CNN "Allied Price/Stock"
	1    9200 2650
	-1   0    0    -1  
$EndComp
Text Label 8050 4450 0    50   ~ 0
~CE_DMA_IC
Wire Wire Line
	8400 4450 8050 4450
Text Label 9950 6450 0    50   ~ 0
~RST
Wire Wire Line
	9900 6450 10150 6450
Wire Wire Line
	8400 8300 8000 8300
Text Label 8000 8300 0    50   ~ 0
GND
Wire Wire Line
	11450 5750 10550 5750
Wire Wire Line
	9400 6250 10150 6250
Wire Wire Line
	9400 4400 12400 4400
Wire Wire Line
	12400 4400 12400 6350
Wire Wire Line
	12400 6350 10750 6350
$Comp
L Z80DMA2-rescue:R-Device-ECB-DMA-rescue R3
U 1 1 621C7D52
P 8350 5200
F 0 "R3" V 8450 5150 50  0000 L CNN
F 1 "0R" V 8250 5100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8280 5200 50  0001 C CNN
F 3 "~" H 8350 5200 50  0001 C CNN
	1    8350 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	8200 5200 8100 5200
Wire Wire Line
	8100 5200 8100 5250
Wire Wire Line
	8500 5200 8900 5200
Wire Wire Line
	8900 5200 8900 5050
Wire Wire Line
	8000 4350 8400 4350
Text Label 8500 5200 0    60   ~ 0
G-PLCC
Text Notes 13950 4800 0    60   ~ 0
SPARE GATES
Text Label 9650 6250 0    50   ~ 0
~USR_RST
Wire Wire Line
	8900 5200 9300 5200
Connection ~ 8900 5200
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 62513C60
P 9300 5200
F 0 "#FLG0103" H 9300 5295 30  0001 C CNN
F 1 "PWR_FLAG" H 9300 5408 30  0000 C CNN
F 2 "" H 9300 5200 60  0001 C CNN
F 3 "" H 9300 5200 60  0001 C CNN
	1    9300 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	18600 3300 18600 3100
Wire Wire Line
	18600 3100 17900 3100
Connection ~ 17900 3100
$Comp
L Z80DMA2-rescue:VCC-power #PWR0104
U 1 1 613C817B
P 18600 3100
F 0 "#PWR0104" H 18600 2950 50  0001 C CNN
F 1 "VCC" H 18617 3273 50  0000 C CNN
F 2 "" H 18600 3100 50  0001 C CNN
F 3 "" H 18600 3100 50  0001 C CNN
	1    18600 3100
	1    0    0    -1  
$EndComp
Connection ~ 18600 3100
$EndSCHEMATC
