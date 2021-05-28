EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Trick Tracker"
Date "2021-05-23"
Rev "v1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Sensor_Motion:LSM9DS1 U3
U 1 1 60A8DA33
P 5950 2050
F 0 "U3" H 5950 1161 50  0000 C CNN
F 1 "LSM9DS1" H 5950 1070 50  0000 C CNN
F 2 "Package_LGA:LGA-24L_3x3.5mm_P0.43mm" H 7450 2800 50  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/1e/3f/2a/d6/25/eb/48/46/DM00103319.pdf/files/DM00103319.pdf/jcr:content/translations/en.DM00103319.pdf" H 5950 2150 50  0001 C CNN
	1    5950 2050
	1    0    0    -1  
$EndComp
$Comp
L MS88SF2:MS88SF2 U1
U 1 1 60A8E1FD
P 1700 1250
F 0 "U1" H 1700 1765 50  0000 C CNN
F 1 "MS88SF2" H 1700 1674 50  0000 C CNN
F 2 "MS88SF2:MS88SF2" H 1700 1300 50  0001 C CNN
F 3 "" H 1700 1300 50  0001 C CNN
	1    1700 1250
	1    0    0    -1  
$EndComp
$Comp
L DPS368XTSA1:DPS368XTSA1 U2
U 1 1 60A902AB
P 5600 4200
F 0 "U2" H 5600 4767 50  0000 C CNN
F 1 "DPS368XTSA1" H 5600 4676 50  0000 C CNN
F 2 "DPS368XTSA1:XDCR_DPS368XTSA1" H 5600 4200 50  0001 L BNN
F 3 "VFLGA-8 Infineon Technologies" H 5600 4200 50  0001 L BNN
	1    5600 4200
	1    0    0    -1  
$EndComp
$Comp
L Battery_Management:MCP73831-2-OT U4
U 1 1 60A93EE6
P 9700 1600
F 0 "U4" H 10050 2000 50  0000 C CNN
F 1 "MCP73831/OT" H 10100 1900 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 9750 1350 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 9550 1550 50  0001 C CNN
	1    9700 1600
	1    0    0    -1  
$EndComp
$Comp
L USB4105-GF-A:USB4105-GF-A J1
U 1 1 60A97D83
P 2300 6050
F 0 "J1" H 2300 6717 50  0000 C CNN
F 1 "USB4105-GF-A" H 2300 6626 50  0000 C CNN
F 2 "USB4105-GF-A:GCT_USB4105-GF-A" H 2300 6050 50  0001 L BNN
F 3 "" H 2300 6050 50  0001 L BNN
F 4 "TYPE-C-31-M-12" H 2300 6100 50  0001 C CNN "Alternative"
	1    2300 6050
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 60A9A616
P 8950 2550
F 0 "J2" H 9058 2731 50  0000 C CNN
F 1 "S2B-PH-K" H 9058 2640 50  0000 C CNN
F 2 "Connector_JST:JST_PH_S2B-PH-SM4-TB_1x02-1MP_P2.00mm_Horizontal" H 8950 2550 50  0001 C CNN
F 3 "~" H 8950 2550 50  0001 C CNN
	1    8950 2550
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:MIC5504-3.3YM5 U5
U 1 1 60A9CC6F
P 10100 4050
F 0 "U5" H 10100 4417 50  0000 C CNN
F 1 "MIC5504-3.3YM5" H 10100 4326 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 10100 3650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/MIC550X.pdf" H 9850 4300 50  0001 C CNN
	1    10100 4050
	1    0    0    -1  
$EndComp
Text Label 9450 2550 2    50   ~ 0
VBAT
$Comp
L power:GND #PWR0101
U 1 1 60A9DE1F
P 9400 2750
F 0 "#PWR0101" H 9400 2500 50  0001 C CNN
F 1 "GND" H 9405 2577 50  0000 C CNN
F 2 "" H 9400 2750 50  0001 C CNN
F 3 "" H 9400 2750 50  0001 C CNN
	1    9400 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 2750 9400 2650
Wire Wire Line
	9400 2650 9150 2650
Wire Wire Line
	9150 2550 9450 2550
$Comp
L power:GND #PWR0102
U 1 1 60A9F575
P 9700 1950
F 0 "#PWR0102" H 9700 1700 50  0001 C CNN
F 1 "GND" H 9705 1777 50  0000 C CNN
F 2 "" H 9700 1950 50  0001 C CNN
F 3 "" H 9700 1950 50  0001 C CNN
	1    9700 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 60A9FD44
P 9100 1700
F 0 "R3" V 8904 1700 50  0000 C CNN
F 1 "2k" V 8995 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 9100 1700 50  0001 C CNN
F 3 "~" H 9100 1700 50  0001 C CNN
	1    9100 1700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 60AA0A34
P 8900 1800
F 0 "#PWR0103" H 8900 1550 50  0001 C CNN
F 1 "GND" H 8905 1627 50  0000 C CNN
F 2 "" H 8900 1800 50  0001 C CNN
F 3 "" H 8900 1800 50  0001 C CNN
	1    8900 1800
	1    0    0    -1  
$EndComp
Text Label 10900 1500 2    50   ~ 0
VBAT
$Comp
L Device:LED_Small D2
U 1 1 60AA13ED
P 10150 2550
F 0 "D2" H 10150 2343 50  0000 C CNN
F 1 "RED" H 10150 2434 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 10150 2550 50  0001 C CNN
F 3 "~" V 10150 2550 50  0001 C CNN
	1    10150 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 60AA1EE2
P 10500 2550
F 0 "R5" V 10304 2550 50  0000 C CNN
F 1 "1k" V 10395 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 10500 2550 50  0001 C CNN
F 3 "~" H 10500 2550 50  0001 C CNN
	1    10500 2550
	0    1    1    0   
$EndComp
Text Label 10350 1700 2    50   ~ 0
STAT
Wire Wire Line
	10350 1700 10100 1700
Text Label 3400 5650 2    50   ~ 0
VBUS
Text Label 3400 5950 2    50   ~ 0
D+
Text Label 3400 6050 2    50   ~ 0
D-
$Comp
L power:GND #PWR0104
U 1 1 60AA70B4
P 3250 6600
F 0 "#PWR0104" H 3250 6350 50  0001 C CNN
F 1 "GND" H 3255 6427 50  0000 C CNN
F 2 "" H 3250 6600 50  0001 C CNN
F 3 "" H 3250 6600 50  0001 C CNN
	1    3250 6600
	1    0    0    -1  
$EndComp
NoConn ~ 3100 6150
NoConn ~ 1500 6150
Text Label 1150 5950 0    50   ~ 0
D+
Text Label 1150 6050 0    50   ~ 0
D-
Wire Wire Line
	3400 5950 3100 5950
Wire Wire Line
	3400 6050 3100 6050
Wire Wire Line
	1500 6050 1150 6050
Wire Wire Line
	1150 5950 1500 5950
Wire Wire Line
	3400 5650 3100 5650
Wire Wire Line
	3100 6350 3250 6350
Wire Wire Line
	3250 6350 3250 6600
Text Label 9750 2550 0    50   ~ 0
VBUS
$Comp
L Device:R_Small R1
U 1 1 60AA9590
P 1050 5850
F 0 "R1" V 854 5850 50  0000 C CNN
F 1 "5k1" V 945 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1050 5850 50  0001 C CNN
F 3 "~" H 1050 5850 50  0001 C CNN
	1    1050 5850
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 60AA9CB6
P 3550 5850
F 0 "R2" V 3354 5850 50  0000 C CNN
F 1 "5k1" V 3445 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3550 5850 50  0001 C CNN
F 3 "~" H 3550 5850 50  0001 C CNN
	1    3550 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	1150 5850 1500 5850
Wire Wire Line
	3100 5850 3450 5850
$Comp
L power:GND #PWR0105
U 1 1 60AAABDF
P 3800 5850
F 0 "#PWR0105" H 3800 5600 50  0001 C CNN
F 1 "GND" H 3805 5677 50  0000 C CNN
F 2 "" H 3800 5850 50  0001 C CNN
F 3 "" H 3800 5850 50  0001 C CNN
	1    3800 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 60AAB5AF
P 800 5850
F 0 "#PWR0106" H 800 5600 50  0001 C CNN
F 1 "GND" H 805 5677 50  0000 C CNN
F 2 "" H 800 5850 50  0001 C CNN
F 3 "" H 800 5850 50  0001 C CNN
	1    800  5850
	-1   0    0    -1  
$EndComp
Wire Wire Line
	800  5850 950  5850
Wire Wire Line
	3800 5850 3650 5850
Text Label 10900 2550 2    50   ~ 0
STAT
Wire Wire Line
	10400 2550 10250 2550
Wire Wire Line
	10050 2550 9750 2550
Wire Wire Line
	9300 1700 9200 1700
Wire Wire Line
	9000 1700 8900 1700
Wire Wire Line
	8900 1700 8900 1800
Text Notes 8200 1800 0    50   ~ 0
10k = 100mA\n5k   = 200mA\n2k   = 500mA\n1k   = 1000mA
Wire Wire Line
	10100 1500 10550 1500
Text Label 8900 950  0    50   ~ 0
VBUS
$Comp
L Device:C_Small C3
U 1 1 60AC1012
P 10550 1600
F 0 "C3" H 10642 1646 50  0000 L CNN
F 1 "10µF" H 10642 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10550 1600 50  0001 C CNN
F 3 "~" H 10550 1600 50  0001 C CNN
	1    10550 1600
	1    0    0    -1  
$EndComp
Connection ~ 10550 1500
Wire Wire Line
	10550 1500 10900 1500
$Comp
L power:GND #PWR0108
U 1 1 60AC67AA
P 10550 1750
F 0 "#PWR0108" H 10550 1500 50  0001 C CNN
F 1 "GND" H 10555 1577 50  0000 C CNN
F 2 "" H 10550 1750 50  0001 C CNN
F 3 "" H 10550 1750 50  0001 C CNN
	1    10550 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10550 1700 10550 1750
$Comp
L Device:C_Small C2
U 1 1 60AC75D0
P 9250 1050
F 0 "C2" H 9342 1096 50  0000 L CNN
F 1 "10µF" H 9342 1005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9250 1050 50  0001 C CNN
F 3 "~" H 9250 1050 50  0001 C CNN
	1    9250 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 60AC8051
P 9250 1200
F 0 "#PWR0109" H 9250 950 50  0001 C CNN
F 1 "GND" H 9255 1027 50  0000 C CNN
F 2 "" H 9250 1200 50  0001 C CNN
F 3 "" H 9250 1200 50  0001 C CNN
	1    9250 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 1900 9700 1950
Wire Wire Line
	9250 1150 9250 1200
Wire Wire Line
	8900 950  9250 950 
Wire Wire Line
	9700 950  9250 950 
Wire Wire Line
	9700 950  9700 1300
Connection ~ 9250 950 
Wire Notes Line
	8100 3350 8100 500 
Text Label 7850 3700 0    50   ~ 0
VBUS
Text Label 7850 4050 0    50   ~ 0
VBAT
Wire Wire Line
	9400 3950 9400 3700
$Comp
L Device:C_Small C1
U 1 1 60ADD64C
P 9100 3800
F 0 "C1" H 9192 3846 50  0000 L CNN
F 1 "10µF" H 9192 3755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9100 3800 50  0001 C CNN
F 3 "~" H 9100 3800 50  0001 C CNN
	1    9100 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 60AE0C42
P 9100 3950
F 0 "#PWR0110" H 9100 3700 50  0001 C CNN
F 1 "GND" H 9105 3777 50  0000 C CNN
F 2 "" H 9100 3950 50  0001 C CNN
F 3 "" H 9100 3950 50  0001 C CNN
	1    9100 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3900 9100 3950
Wire Wire Line
	9100 3700 9400 3700
Wire Wire Line
	9700 4150 9400 4150
$Comp
L power:GND #PWR0111
U 1 1 60AE4DB6
P 10100 4350
F 0 "#PWR0111" H 10100 4100 50  0001 C CNN
F 1 "GND" H 10105 4177 50  0000 C CNN
F 2 "" H 10100 4350 50  0001 C CNN
F 3 "" H 10100 4350 50  0001 C CNN
	1    10100 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 60AE6337
P 10600 4100
F 0 "C4" H 10692 4146 50  0000 L CNN
F 1 "10µF" H 10692 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10600 4100 50  0001 C CNN
F 3 "~" H 10600 4100 50  0001 C CNN
	1    10600 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 60AE633D
P 10600 4250
F 0 "#PWR0112" H 10600 4000 50  0001 C CNN
F 1 "GND" H 10605 4077 50  0000 C CNN
F 2 "" H 10600 4250 50  0001 C CNN
F 3 "" H 10600 4250 50  0001 C CNN
	1    10600 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 4200 10600 4250
Wire Wire Line
	10600 4000 10600 3950
Wire Wire Line
	10600 3950 10500 3950
Text Label 10900 3950 2    50   ~ 0
3.3V
Wire Wire Line
	10900 3950 10600 3950
Connection ~ 10600 3950
Text Label 800  1750 0    50   ~ 0
D+
Text Label 800  1850 0    50   ~ 0
D-
Wire Wire Line
	1150 1850 800  1850
Wire Wire Line
	800  1750 1150 1750
$Comp
L power:GND #PWR0113
U 1 1 60AED2A5
P 1700 3450
F 0 "#PWR0113" H 1700 3200 50  0001 C CNN
F 1 "GND" H 1705 3277 50  0000 C CNN
F 2 "" H 1700 3450 50  0001 C CNN
F 3 "" H 1700 3450 50  0001 C CNN
	1    1700 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3350 1750 3400
Wire Wire Line
	1750 3400 1700 3400
Wire Wire Line
	1650 3400 1650 3350
Wire Wire Line
	1700 3450 1700 3400
Connection ~ 1700 3400
Wire Wire Line
	1700 3400 1650 3400
Text Label 800  1100 0    50   ~ 0
3.3V
Wire Wire Line
	1150 1150 1100 1150
Wire Wire Line
	1150 1050 1100 1050
Wire Wire Line
	1100 1050 1100 1100
Wire Wire Line
	800  1100 1100 1100
Connection ~ 1100 1100
Wire Wire Line
	1100 1100 1100 1150
$Comp
L Device:D_Schottky D1
U 1 1 60B07CC4
P 8300 4050
F 0 "D1" H 8300 3833 50  0000 C CNN
F 1 "DSS13UTR" H 8300 3924 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 8300 4050 50  0001 C CNN
F 3 "~" H 8300 4050 50  0001 C CNN
	1    8300 4050
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 4050 8550 4050
Wire Wire Line
	8150 4050 7850 4050
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 60B100CF
P 8800 5900
F 0 "J3" H 8900 5450 50  0000 L CNN
F 1 "QWiiC" H 8800 5550 50  0000 L CNN
F 2 "Connector_JST:JST_SH_SM04B-SRSS-TB_1x04-1MP_P1.00mm_Horizontal" H 8800 5900 50  0001 C CNN
F 3 "~" H 8800 5900 50  0001 C CNN
	1    8800 5900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 60B105B9
P 8450 6100
F 0 "#PWR0114" H 8450 5850 50  0001 C CNN
F 1 "GND" H 8455 5927 50  0000 C CNN
F 2 "" H 8450 6100 50  0001 C CNN
F 3 "" H 8450 6100 50  0001 C CNN
	1    8450 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 6000 8450 6000
Wire Wire Line
	8450 6000 8450 6100
Text Label 8300 5900 0    50   ~ 0
3.3V
Text Label 8300 5800 0    50   ~ 0
SDA
Text Label 8300 5700 0    50   ~ 0
SCL
Wire Wire Line
	8300 5900 8600 5900
Wire Wire Line
	8300 5800 8600 5800
Wire Wire Line
	8300 5700 8600 5700
$Comp
L Device:C_Small C10
U 1 1 60B2173D
P 6550 4150
F 0 "C10" H 6642 4196 50  0000 L CNN
F 1 "0.1µF" H 6642 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6550 4150 50  0001 C CNN
F 3 "~" H 6550 4150 50  0001 C CNN
	1    6550 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 60B223EF
P 6550 4300
F 0 "#PWR0115" H 6550 4050 50  0001 C CNN
F 1 "GND" H 6555 4127 50  0000 C CNN
F 2 "" H 6550 4300 50  0001 C CNN
F 3 "" H 6550 4300 50  0001 C CNN
	1    6550 4300
	1    0    0    -1  
$EndComp
Text Label 7050 3950 2    50   ~ 0
3.3V
Wire Wire Line
	6200 3900 6300 3900
Wire Wire Line
	6300 3900 6300 3950
Wire Wire Line
	6300 4000 6200 4000
Wire Wire Line
	6300 3950 6550 3950
Connection ~ 6300 3950
Wire Wire Line
	6300 3950 6300 4000
Wire Wire Line
	6550 4050 6550 3950
Connection ~ 6550 3950
Wire Wire Line
	6550 3950 7050 3950
Wire Wire Line
	6550 4300 6550 4250
$Comp
L power:GND #PWR0116
U 1 1 60B2A421
P 6300 4600
F 0 "#PWR0116" H 6300 4350 50  0001 C CNN
F 1 "GND" H 6305 4427 50  0000 C CNN
F 2 "" H 6300 4600 50  0001 C CNN
F 3 "" H 6300 4600 50  0001 C CNN
	1    6300 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 4500 6300 4500
Wire Wire Line
	6300 4500 6300 4600
Text Label 4300 4400 0    50   ~ 0
PRESS_INT
Text Label 4300 4200 0    50   ~ 0
SCL
Text Label 4300 4300 0    50   ~ 0
SDA
$Comp
L Device:R_Small R16
U 1 1 60B2CF91
P 6600 5850
F 0 "R16" V 6796 5850 50  0000 C CNN
F 1 "10k" V 6705 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6600 5850 50  0001 C CNN
F 3 "~" H 6600 5850 50  0001 C CNN
	1    6600 5850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R17
U 1 1 60B2D45E
P 6600 6150
F 0 "R17" V 6796 6150 50  0000 C CNN
F 1 "10k" V 6705 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6600 6150 50  0001 C CNN
F 3 "~" H 6600 6150 50  0001 C CNN
	1    6600 6150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R12
U 1 1 60B2DAEB
P 4750 4600
F 0 "R12" H 4691 4554 50  0000 R CNN
F 1 "100k" H 4691 4645 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4750 4600 50  0001 C CNN
F 3 "~" H 4750 4600 50  0001 C CNN
	1    4750 4600
	-1   0    0    1   
$EndComp
NoConn ~ 5000 4100
Wire Wire Line
	5000 4400 4750 4400
Wire Wire Line
	4750 4500 4750 4400
Connection ~ 4750 4400
Wire Wire Line
	4750 4400 4300 4400
$Comp
L power:GND #PWR0117
U 1 1 60B43AE8
P 4750 4750
F 0 "#PWR0117" H 4750 4500 50  0001 C CNN
F 1 "GND" H 4755 4577 50  0000 C CNN
F 2 "" H 4750 4750 50  0001 C CNN
F 3 "" H 4750 4750 50  0001 C CNN
	1    4750 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4700 4750 4750
Text Label 7100 5850 2    50   ~ 0
3.3V
Text Label 4250 900  0    50   ~ 0
3.3V
$Comp
L Device:C_Small C9
U 1 1 60B50C8F
P 5250 1000
F 0 "C9" H 5342 1046 50  0000 L CNN
F 1 "10µF" H 5342 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5250 1000 50  0001 C CNN
F 3 "~" H 5250 1000 50  0001 C CNN
	1    5250 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 60B51DBF
P 4850 1000
F 0 "C7" H 4942 1046 50  0000 L CNN
F 1 "0.1µF" H 4942 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4850 1000 50  0001 C CNN
F 3 "~" H 4850 1000 50  0001 C CNN
	1    4850 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 60B566D8
P 4500 1000
F 0 "C5" H 4592 1046 50  0000 L CNN
F 1 "0.1µF" H 4592 955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4500 1000 50  0001 C CNN
F 3 "~" H 4500 1000 50  0001 C CNN
	1    4500 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 900  4500 900 
Wire Wire Line
	5950 900  5950 1250
Connection ~ 4500 900 
Wire Wire Line
	4500 900  4850 900 
Connection ~ 4850 900 
Wire Wire Line
	4850 900  5250 900 
Connection ~ 5250 900 
Wire Wire Line
	5250 900  5950 900 
Wire Wire Line
	6050 1250 6050 900 
Wire Wire Line
	6050 900  5950 900 
Connection ~ 5950 900 
Wire Wire Line
	6250 1250 6250 900 
Wire Wire Line
	6250 900  6050 900 
Connection ~ 6050 900 
Wire Wire Line
	6350 1250 6350 900 
Wire Wire Line
	6350 900  6250 900 
Connection ~ 6250 900 
$Comp
L power:GND #PWR0118
U 1 1 60B6495F
P 4500 1100
F 0 "#PWR0118" H 4500 850 50  0001 C CNN
F 1 "GND" H 4505 927 50  0000 C CNN
F 2 "" H 4500 1100 50  0001 C CNN
F 3 "" H 4500 1100 50  0001 C CNN
	1    4500 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 60B6528A
P 4850 1100
F 0 "#PWR0119" H 4850 850 50  0001 C CNN
F 1 "GND" H 4855 927 50  0000 C CNN
F 2 "" H 4850 1100 50  0001 C CNN
F 3 "" H 4850 1100 50  0001 C CNN
	1    4850 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 60B654EC
P 5250 1100
F 0 "#PWR0120" H 5250 850 50  0001 C CNN
F 1 "GND" H 5255 927 50  0000 C CNN
F 2 "" H 5250 1100 50  0001 C CNN
F 3 "" H 5250 1100 50  0001 C CNN
	1    5250 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 60B656CB
P 5000 2850
F 0 "C8" H 5092 2896 50  0000 L CNN
F 1 "0.22µF" H 5092 2805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5000 2850 50  0001 C CNN
F 3 "~" H 5000 2850 50  0001 C CNN
	1    5000 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 60B6697D
P 5000 3000
F 0 "#PWR0121" H 5000 2750 50  0001 C CNN
F 1 "GND" H 5005 2827 50  0000 C CNN
F 2 "" H 5000 3000 50  0001 C CNN
F 3 "" H 5000 3000 50  0001 C CNN
	1    5000 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2950 5000 3000
Wire Wire Line
	5000 2750 5000 2650
Wire Wire Line
	5000 2650 5250 2650
$Comp
L Device:C_Small C6
U 1 1 60B6E4E3
P 4550 2850
F 0 "C6" H 4642 2896 50  0000 L CNN
F 1 "0.01µF" H 4642 2805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4550 2850 50  0001 C CNN
F 3 "~" H 4550 2850 50  0001 C CNN
	1    4550 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2550 4550 2550
Wire Wire Line
	4550 2550 4550 2750
$Comp
L power:GND #PWR0122
U 1 1 60B72F9C
P 4550 3000
F 0 "#PWR0122" H 4550 2750 50  0001 C CNN
F 1 "GND" H 4555 2827 50  0000 C CNN
F 2 "" H 4550 3000 50  0001 C CNN
F 3 "" H 4550 3000 50  0001 C CNN
	1    4550 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2950 4550 3000
$Comp
L power:GND #PWR0123
U 1 1 60B770F9
P 6600 2850
F 0 "#PWR0123" H 6600 2600 50  0001 C CNN
F 1 "GND" H 6605 2677 50  0000 C CNN
F 2 "" H 6600 2850 50  0001 C CNN
F 3 "" H 6600 2850 50  0001 C CNN
	1    6600 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 2150 6650 2250
Connection ~ 6650 2250
Wire Wire Line
	6650 2250 6650 2350
Connection ~ 6650 2350
Wire Wire Line
	6650 2350 6650 2450
Connection ~ 6650 2450
Wire Wire Line
	6650 2450 6650 2550
Wire Wire Line
	5850 2850 6050 2850
Connection ~ 6050 2850
Wire Wire Line
	6650 2550 6650 2850
Wire Wire Line
	6650 2850 6600 2850
Connection ~ 6650 2550
Wire Wire Line
	6050 2850 6600 2850
Connection ~ 6600 2850
Text Label 4950 1650 0    50   ~ 0
SCL
Text Label 4950 1750 0    50   ~ 0
SDA
Wire Wire Line
	4950 1650 5250 1650
Wire Wire Line
	5250 1750 4950 1750
Text Label 7100 6150 2    50   ~ 0
3.3V
Text Label 6200 5850 0    50   ~ 0
SCL
Text Label 6200 6150 0    50   ~ 0
SDA
Wire Wire Line
	4300 4300 5000 4300
Wire Wire Line
	4300 4200 5000 4200
Wire Wire Line
	6200 5850 6500 5850
Wire Wire Line
	6200 6150 6500 6150
Wire Wire Line
	6700 6150 7100 6150
Wire Wire Line
	7100 5850 6700 5850
$Comp
L Device:R_Small R11
U 1 1 60BA4BA6
P 4600 2050
F 0 "R11" V 4400 2050 50  0000 C CNN
F 1 "10k" V 4500 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4600 2050 50  0001 C CNN
F 3 "~" H 4600 2050 50  0001 C CNN
	1    4600 2050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R14
U 1 1 60BA5712
P 7250 1750
F 0 "R14" V 7050 1750 50  0000 C CNN
F 1 "10k" V 7150 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7250 1750 50  0001 C CNN
F 3 "~" H 7250 1750 50  0001 C CNN
	1    7250 1750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 2050 4700 2050
Text Label 4250 2050 0    50   ~ 0
3.3V
Text Label 7600 1750 2    50   ~ 0
3.3V
Wire Wire Line
	7600 1750 7350 1750
Wire Wire Line
	4500 2050 4250 2050
$Comp
L Device:R_Small R10
U 1 1 60BB95CD
P 4600 1950
F 0 "R10" V 4796 1950 50  0000 C CNN
F 1 "10k" V 4705 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 4600 1950 50  0001 C CNN
F 3 "~" H 4600 1950 50  0001 C CNN
	1    4600 1950
	0    -1   -1   0   
$EndComp
Text Label 4250 1950 0    50   ~ 0
3.3V
$Comp
L Device:R_Small R13
U 1 1 60BC4391
P 7250 1650
F 0 "R13" V 7446 1650 50  0000 C CNN
F 1 "10k" V 7355 1650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 7250 1650 50  0001 C CNN
F 3 "~" H 7250 1650 50  0001 C CNN
	1    7250 1650
	0    -1   -1   0   
$EndComp
Text Label 7600 1650 2    50   ~ 0
3.3V
Wire Wire Line
	7600 1650 7350 1650
Wire Wire Line
	4500 1950 4250 1950
Wire Wire Line
	4700 1950 5250 1950
Text Label 4800 2150 0    50   ~ 0
INT1_AG
Text Label 4800 2250 0    50   ~ 0
INT2_AG
Wire Wire Line
	4800 2150 5250 2150
Wire Wire Line
	4800 2250 5250 2250
Text Label 7050 1950 2    50   ~ 0
INT_M
Text Label 4800 2350 0    50   ~ 0
DEN_AG
Wire Wire Line
	5250 2350 4800 2350
Text Label 7050 1850 2    50   ~ 0
DRDY_M
Wire Wire Line
	6650 1650 7150 1650
Wire Wire Line
	6650 1750 7150 1750
Wire Wire Line
	6650 1950 7050 1950
Wire Wire Line
	7050 1850 6650 1850
Text Label 2750 1850 2    50   ~ 0
MOSI
Text Label 2750 1650 2    50   ~ 0
MISO
Wire Wire Line
	2750 1850 2250 1850
Wire Wire Line
	2750 1650 2250 1650
Text Label 2750 1050 2    50   ~ 0
SCL
Text Label 2750 1150 2    50   ~ 0
SDA
Text Label 2750 1250 2    50   ~ 0
Rx
Text Label 2750 1350 2    50   ~ 0
Tx
Text Label 800  1400 0    50   ~ 0
SWDCLK
Text Label 800  1500 0    50   ~ 0
SWDIO
Wire Wire Line
	800  1500 1150 1500
Wire Wire Line
	1150 1400 800  1400
Wire Wire Line
	2750 1050 2250 1050
Wire Wire Line
	2750 1150 2250 1150
Wire Wire Line
	2750 1250 2250 1250
Wire Wire Line
	2750 1350 2250 1350
Text Label 2750 2650 2    50   ~ 0
INT1_AG
Text Label 2750 1550 2    50   ~ 0
INT2_AG
Wire Wire Line
	2750 1450 2250 1450
Wire Wire Line
	2250 1550 2750 1550
Text Label 2750 2050 2    50   ~ 0
DEN_AG
Wire Wire Line
	2750 2050 2250 2050
Wire Wire Line
	2250 2250 2750 2250
Text Label 2750 2750 2    50   ~ 0
RESET
Wire Wire Line
	2750 2750 2250 2750
Text Label 2750 2950 2    50   ~ 0
PRESS_INT
Text Label 2750 2350 2    50   ~ 0
DRDY_M
Text Label 2750 2450 2    50   ~ 0
INT_M
Wire Wire Line
	2750 2350 2250 2350
Wire Wire Line
	2250 2450 2750 2450
$Comp
L EVQ-PUA02K:EVQ-PUA02K S1
U 1 1 60CECE47
P 4950 6750
F 0 "S1" H 5550 7015 50  0000 C CNN
F 1 "EVQ-PUA02K" H 5550 6924 50  0000 C CNN
F 2 "EVQ-PUA02K:EVQPUA02K" H 6000 6850 50  0001 L CNN
F 3 "https://www.mouser.in/ProductDetail/Panasonic/EVQ-PUA02K?qs=%2Fha2pyFadujMSX8lHuHLeTqtnZtxLpuLygd0%252BejhC2g%3D" H 6000 6750 50  0001 L CNN
F 4 "Tactile Switches SIDE PUSH 2.2NF 4.7x3.2x1.65mm" H 6000 6650 50  0001 L CNN "Description"
	1    4950 6750
	1    0    0    -1  
$EndComp
$Comp
L EVQ-PUA02K:EVQ-PUA02K S2
U 1 1 60CED3E0
P 4950 7400
F 0 "S2" H 5550 7665 50  0000 C CNN
F 1 "EVQ-PUA02K" H 5550 7574 50  0000 C CNN
F 2 "EVQ-PUA02K:EVQPUA02K" H 6000 7500 50  0001 L CNN
F 3 "https://www.mouser.in/ProductDetail/Panasonic/EVQ-PUA02K?qs=%2Fha2pyFadujMSX8lHuHLeTqtnZtxLpuLygd0%252BejhC2g%3D" H 6000 7400 50  0001 L CNN
F 4 "Tactile Switches SIDE PUSH 2.2NF 4.7x3.2x1.65mm" H 6000 7300 50  0001 L CNN "Description"
	1    4950 7400
	1    0    0    -1  
$EndComp
Text Label 5650 5550 0    50   ~ 0
RESET
Text Label 7100 5550 2    50   ~ 0
3.3V
$Comp
L Device:R_Small R15
U 1 1 60CF7DFE
P 6600 5550
F 0 "R15" V 6796 5550 50  0000 C CNN
F 1 "10k" V 6705 5550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6600 5550 50  0001 C CNN
F 3 "~" H 6600 5550 50  0001 C CNN
	1    6600 5550
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C11
U 1 1 60CF811E
P 5950 5650
F 0 "C11" H 6042 5696 50  0000 L CNN
F 1 "0.1µF" H 6042 5605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5950 5650 50  0001 C CNN
F 3 "~" H 5950 5650 50  0001 C CNN
	1    5950 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 5550 6700 5550
Wire Wire Line
	6500 5550 5950 5550
Connection ~ 5950 5550
Wire Wire Line
	5650 5550 5950 5550
$Comp
L power:GND #PWR0124
U 1 1 60D139A6
P 5950 5750
F 0 "#PWR0124" H 5950 5500 50  0001 C CNN
F 1 "GND" H 5955 5577 50  0000 C CNN
F 2 "" H 5950 5750 50  0001 C CNN
F 3 "" H 5950 5750 50  0001 C CNN
	1    5950 5750
	1    0    0    -1  
$EndComp
Text Label 4650 6750 0    50   ~ 0
RESET
Text Label 6450 6750 2    50   ~ 0
RESET
$Comp
L power:GND #PWR0125
U 1 1 60D140F4
P 4650 6900
F 0 "#PWR0125" H 4650 6650 50  0001 C CNN
F 1 "GND" H 4655 6727 50  0000 C CNN
F 2 "" H 4650 6900 50  0001 C CNN
F 3 "" H 4650 6900 50  0001 C CNN
	1    4650 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 60D145FF
P 6450 6900
F 0 "#PWR0126" H 6450 6650 50  0001 C CNN
F 1 "GND" H 6455 6727 50  0000 C CNN
F 2 "" H 6450 6900 50  0001 C CNN
F 3 "" H 6450 6900 50  0001 C CNN
	1    6450 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 6750 6450 6750
Wire Wire Line
	6450 6900 6450 6850
Wire Wire Line
	6450 6850 6150 6850
Wire Wire Line
	4650 6750 4950 6750
Wire Wire Line
	4950 6850 4650 6850
Wire Wire Line
	4650 6850 4650 6900
Text Label 4650 7400 0    50   ~ 0
BTN
$Comp
L power:GND #PWR0127
U 1 1 60D3AD54
P 4650 7550
F 0 "#PWR0127" H 4650 7300 50  0001 C CNN
F 1 "GND" H 4655 7377 50  0000 C CNN
F 2 "" H 4650 7550 50  0001 C CNN
F 3 "" H 4650 7550 50  0001 C CNN
	1    4650 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 7400 4950 7400
Wire Wire Line
	4950 7500 4650 7500
Wire Wire Line
	4650 7500 4650 7550
Text Label 6450 7400 2    50   ~ 0
BTN
$Comp
L power:GND #PWR0128
U 1 1 60D4FD66
P 6450 7550
F 0 "#PWR0128" H 6450 7300 50  0001 C CNN
F 1 "GND" H 6455 7377 50  0000 C CNN
F 2 "" H 6450 7550 50  0001 C CNN
F 3 "" H 6450 7550 50  0001 C CNN
	1    6450 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 7400 6450 7400
Wire Wire Line
	6450 7550 6450 7500
Wire Wire Line
	6450 7500 6150 7500
Wire Wire Line
	2750 2950 2250 2950
Text Label 2750 1950 2    50   ~ 0
BTN
Wire Wire Line
	2750 1950 2250 1950
$Comp
L Mechanical:MountingHole H1
U 1 1 60AC3A3C
P 4550 5450
F 0 "H1" H 4650 5496 50  0000 L CNN
F 1 "MountingHole" H 4650 5405 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad_Via" H 4550 5450 50  0001 C CNN
F 3 "~" H 4550 5450 50  0001 C CNN
	1    4550 5450
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 60AC3F3D
P 4550 5700
F 0 "H2" H 4650 5746 50  0000 L CNN
F 1 "MountingHole" H 4650 5655 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad_Via" H 4550 5700 50  0001 C CNN
F 3 "~" H 4550 5700 50  0001 C CNN
	1    4550 5700
	1    0    0    -1  
$EndComp
$Comp
L 450405020524:450405020524 S3
U 1 1 60AAC851
P 7950 4450
F 0 "S3" H 8450 4715 50  0000 C CNN
F 1 "450405020524" H 8450 4624 50  0000 C CNN
F 2 "450405020524:450405020524" H 8800 4550 50  0001 L CNN
F 3 "https://www.we-online.com/catalog/datasheet/450405020524.pdf" H 8800 4450 50  0001 L CNN
F 4 "Slide Switches WS-SLSU Mini Slide Switch" H 8800 4350 50  0001 L CNN "Description"
F 5 "2.25" H 8800 4250 50  0001 L CNN "Height"
	1    7950 4450
	1    0    0    -1  
$EndComp
NoConn ~ 7950 4450
NoConn ~ 7950 4550
Text Label 9400 4150 0    50   ~ 0
EN
Wire Wire Line
	9400 3950 9700 3950
Wire Wire Line
	9250 4550 8950 4550
Text Label 8750 3700 0    50   ~ 0
VIN
Connection ~ 9100 3700
Text Label 9250 4550 2    50   ~ 0
EN
Text Label 9250 4650 2    50   ~ 0
VIN
Wire Wire Line
	9250 4650 8950 4650
$Comp
L Device:R_Small R18
U 1 1 60B62C01
P 10450 5950
F 0 "R18" H 10391 5904 50  0000 R CNN
F 1 "2M" H 10391 5995 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 10450 5950 50  0001 C CNN
F 3 "~" H 10450 5950 50  0001 C CNN
	1    10450 5950
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 60B6334E
P 10450 5650
F 0 "R4" H 10391 5604 50  0000 R CNN
F 1 "806k" H 10391 5695 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 10450 5650 50  0001 C CNN
F 3 "~" H 10450 5650 50  0001 C CNN
	1    10450 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 60B637CF
P 10100 5950
F 0 "C12" H 10192 5996 50  0000 L CNN
F 1 "0.1µF" H 10192 5905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10100 5950 50  0001 C CNN
F 3 "~" H 10100 5950 50  0001 C CNN
	1    10100 5950
	1    0    0    -1  
$EndComp
Text Label 9500 5800 0    50   ~ 0
BAT_SENS
Wire Wire Line
	10450 5800 10450 5750
Wire Wire Line
	10450 5850 10450 5800
Connection ~ 10450 5800
Wire Wire Line
	10100 5850 10100 5800
Connection ~ 10100 5800
Wire Wire Line
	10100 5800 10450 5800
$Comp
L power:GND #PWR0129
U 1 1 60BBCD3E
P 10250 6100
F 0 "#PWR0129" H 10250 5850 50  0001 C CNN
F 1 "GND" H 10255 5927 50  0000 C CNN
F 2 "" H 10250 6100 50  0001 C CNN
F 3 "" H 10250 6100 50  0001 C CNN
	1    10250 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 6050 10250 6050
Wire Wire Line
	10250 6050 10250 6100
Wire Wire Line
	10100 6050 10250 6050
Connection ~ 10250 6050
Text Label 10150 5500 0    50   ~ 0
VBAT
Wire Wire Line
	10450 5500 10450 5550
Wire Wire Line
	9500 5800 10100 5800
Text Label 2750 1450 2    50   ~ 0
BAT_SENS
Wire Wire Line
	10150 5500 10450 5500
Wire Wire Line
	2750 2650 2250 2650
$Comp
L MEM2051-00-195-00-A:MEM2051-00-195-00-A J4
U 1 1 60AB1D56
P 2150 4500
F 0 "J4" H 2150 5067 50  0000 C CNN
F 1 "MEM2061-01-188-00-A" H 2150 4976 50  0000 C CNN
F 2 "MEM2061-01-188-00-A_REVA:GCT_MEM2061-01-188-00-A_REVA" H 2150 4500 50  0001 L BNN
F 3 "" H 2150 4500 50  0001 L BNN
	1    2150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 2900 9950 3000
Wire Wire Line
	10050 2900 9950 2900
$Comp
L power:GND #PWR0107
U 1 1 60AB16FD
P 9950 3000
F 0 "#PWR0107" H 9950 2750 50  0001 C CNN
F 1 "GND" H 9955 2827 50  0000 C CNN
F 2 "" H 9950 3000 50  0001 C CNN
F 3 "" H 9950 3000 50  0001 C CNN
	1    9950 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 2900 10250 2900
Wire Wire Line
	10700 2900 10600 2900
Wire Wire Line
	10700 2550 10600 2550
Wire Wire Line
	10900 2550 10700 2550
Connection ~ 10700 2550
Wire Wire Line
	10700 2550 10700 2900
$Comp
L Device:R_Small R6
U 1 1 60AA5C8E
P 10500 2900
F 0 "R6" V 10304 2900 50  0000 C CNN
F 1 "1k" V 10395 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 10500 2900 50  0001 C CNN
F 3 "~" H 10500 2900 50  0001 C CNN
	1    10500 2900
	0    1    1    0   
$EndComp
$Comp
L Device:LED_Small D3
U 1 1 60AA51B1
P 10150 2900
F 0 "D3" H 10150 3135 50  0000 C CNN
F 1 "GREEN" H 10150 3044 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 10150 2900 50  0001 C CNN
F 3 "~" V 10150 2900 50  0001 C CNN
	1    10150 2900
	1    0    0    -1  
$EndComp
Text Label 3050 4200 2    50   ~ 0
3.3V
Wire Wire Line
	3050 4200 2750 4200
Text Label 1150 4200 0    50   ~ 0
MISO
Text Label 1150 4600 0    50   ~ 0
MOSI
Text Label 1150 4800 0    50   ~ 0
SCK
NoConn ~ 1550 4300
NoConn ~ 1550 4400
Text Label 1150 4500 0    50   ~ 0
CS
$Comp
L power:GND #PWR0130
U 1 1 60AF2CE9
P 2800 4850
F 0 "#PWR0130" H 2800 4600 50  0001 C CNN
F 1 "GND" H 2805 4677 50  0000 C CNN
F 2 "" H 2800 4850 50  0001 C CNN
F 3 "" H 2800 4850 50  0001 C CNN
	1    2800 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 4850 2800 4800
Wire Wire Line
	2800 4800 2750 4800
Wire Wire Line
	1550 4800 1150 4800
Wire Wire Line
	1150 4600 1550 4600
Wire Wire Line
	1550 4500 1150 4500
Wire Wire Line
	1150 4200 1550 4200
$Comp
L Device:R_Small R7
U 1 1 60B2E96D
P 3300 1750
F 0 "R7" V 3104 1750 50  0000 C CNN
F 1 "470" V 3195 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3300 1750 50  0001 C CNN
F 3 "~" H 3300 1750 50  0001 C CNN
	1    3300 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 1750 3400 1750
$Comp
L power:GND #PWR0131
U 1 1 60B3AE16
P 3500 1750
F 0 "#PWR0131" H 3500 1500 50  0001 C CNN
F 1 "GND" H 3505 1577 50  0000 C CNN
F 2 "" H 3500 1750 50  0001 C CNN
F 3 "" H 3500 1750 50  0001 C CNN
	1    3500 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1750 3050 1750
$Comp
L Device:LED_Small D4
U 1 1 60B2E967
P 2950 1750
F 0 "D4" H 2950 1543 50  0000 C CNN
F 1 "GREEN" H 2950 1634 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" V 2950 1750 50  0001 C CNN
F 3 "~" V 2950 1750 50  0001 C CNN
	1    2950 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	2250 1750 2850 1750
Text Label 2750 2550 2    50   ~ 0
CS
Wire Wire Line
	2750 2550 2250 2550
Text Label 2750 2850 2    50   ~ 0
SCK
Wire Wire Line
	2750 2850 2250 2850
Text Label 3250 4700 2    50   ~ 0
SD_DETECT
Wire Wire Line
	3250 4700 2750 4700
Text Label 2750 2250 2    50   ~ 0
SD_DETECT
Wire Notes Line
	7350 3350 7350 6550
Wire Notes Line
	7350 5000 11200 5000
Wire Notes Line
	9050 5000 9050 6550
Wire Notes Line
	3700 3350 11200 3350
Wire Notes Line
	3700 3700 500  3700
Wire Notes Line
	3700 500  3700 5150
$Comp
L Mechanical:MountingHole H3
U 1 1 60CAC34F
P 4550 5950
F 0 "H3" H 4650 5996 50  0000 L CNN
F 1 "MountingHole" H 4650 5905 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad_Via" H 4550 5950 50  0001 C CNN
F 3 "~" H 4550 5950 50  0001 C CNN
	1    4550 5950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 60CAC5B0
P 4550 6200
F 0 "H4" H 4650 6246 50  0000 L CNN
F 1 "MountingHole" H 4650 6155 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.5mm_Pad_Via" H 4550 6200 50  0001 C CNN
F 3 "~" H 4550 6200 50  0001 C CNN
	1    4550 6200
	1    0    0    -1  
$EndComp
Wire Notes Line
	5350 5150 5350 6350
Wire Notes Line
	4200 6350 7350 6350
Wire Notes Line
	4200 5150 4200 7800
Wire Notes Line
	500  5150 7350 5150
$Comp
L Device:D_Schottky D5
U 1 1 60D58FCE
P 8300 3700
F 0 "D5" H 8300 3483 50  0000 C CNN
F 1 "DSS13UTR" H 8300 3574 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 8300 3700 50  0001 C CNN
F 3 "~" H 8300 3700 50  0001 C CNN
	1    8300 3700
	-1   0    0    1   
$EndComp
Wire Wire Line
	7850 3700 8150 3700
Wire Wire Line
	8450 3700 8550 3700
Wire Wire Line
	8550 3700 8550 4050
Connection ~ 8550 3700
Wire Wire Line
	8550 3700 9100 3700
Text Notes 9100 5100 0    50   ~ 0
BATT_SENS
Text Notes 7400 5100 0    50   ~ 0
QWiiC I2C Connector
Text Notes 7400 3450 0    50   ~ 0
LDO
Text Notes 8150 600  0    50   ~ 0
Charging IC
Text Notes 5400 5250 0    50   ~ 0
Pull-Ups
Text Notes 4250 5250 0    50   ~ 0
Mounting Holes
Text Notes 4250 6450 0    50   ~ 0
Buttons
Text Notes 550  5300 0    50   ~ 0
USB-C
Text Notes 550  3850 0    50   ~ 0
Micro SD-Card
Text Notes 3750 3500 0    50   ~ 0
Pressure Sensor
Text Notes 3750 600  0    50   ~ 0
9-Axis Sensor
Text Notes 550  600  0    50   ~ 0
MCU
Text Label 3600 2850 2    50   ~ 0
SWDCLK
Text Label 3600 3050 2    50   ~ 0
SWDIO
$Comp
L power:GND #PWR0132
U 1 1 60AB9E9C
P 3500 3500
F 0 "#PWR0132" H 3500 3250 50  0001 C CNN
F 1 "GND" H 3505 3327 50  0000 C CNN
F 2 "" H 3500 3500 50  0001 C CNN
F 3 "" H 3500 3500 50  0001 C CNN
	1    3500 3500
	1    0    0    -1  
$EndComp
Text Label 3600 3250 2    50   ~ 0
3.3V
Wire Wire Line
	3200 2850 3600 2850
Wire Wire Line
	3600 3050 3200 3050
Wire Wire Line
	3200 3250 3600 3250
Wire Wire Line
	3500 3500 3500 3450
Wire Wire Line
	3500 3450 3200 3450
$Comp
L SMTB-1240-S-R:SMTB-1240-S-R P1
U 1 1 60ACE7E7
P 3100 2150
F 0 "P1" H 3107 2395 50  0000 C CNN
F 1 "SMTB-1240-S-R" H 3107 2304 50  0000 C CNN
F 2 "SMTB-1240-S-R:SMTB-1240-S-R" H 3100 2150 50  0001 C CNN
F 3 "" H 3100 2150 50  0001 C CNN
	1    3100 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2150 2250 2150
$Comp
L power:GND #PWR0133
U 1 1 60AEDF28
P 3450 2250
F 0 "#PWR0133" H 3450 2000 50  0001 C CNN
F 1 "GND" H 3455 2077 50  0000 C CNN
F 2 "" H 3450 2250 50  0001 C CNN
F 3 "" H 3450 2250 50  0001 C CNN
	1    3450 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2150 3450 2150
Wire Wire Line
	3450 2150 3450 2250
$Comp
L Connector:Conn_01x04_Male J6
U 1 1 60B2CE75
P 8100 5900
F 0 "J6" H 8200 5450 50  0000 L CNN
F 1 "QWiiC" H 8100 5550 50  0000 L CNN
F 2 "Connector_JST:JST_SH_SM04B-SRSS-TB_1x04-1MP_P1.00mm_Horizontal" H 8100 5900 50  0001 C CNN
F 3 "~" H 8100 5900 50  0001 C CNN
	1    8100 5900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 60B2CE7B
P 7750 6100
F 0 "#PWR0134" H 7750 5850 50  0001 C CNN
F 1 "GND" H 7755 5927 50  0000 C CNN
F 2 "" H 7750 6100 50  0001 C CNN
F 3 "" H 7750 6100 50  0001 C CNN
	1    7750 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 6000 7750 6000
Wire Wire Line
	7750 6000 7750 6100
Text Label 7600 5900 0    50   ~ 0
3.3V
Text Label 7600 5800 0    50   ~ 0
SDA
Text Label 7600 5700 0    50   ~ 0
SCL
Wire Wire Line
	7600 5900 7900 5900
Wire Wire Line
	7600 5800 7900 5800
Wire Wire Line
	7600 5700 7900 5700
$Comp
L IP4220CZ6:IP4220CZ6 U6
U 1 1 60B113A2
P 2450 7100
F 0 "U6" H 2375 7415 50  0000 C CNN
F 1 "IP4220CZ6" H 2375 7324 50  0000 C CNN
F 2 "Package_SO:TSOP-6_1.65x3.05mm_P0.95mm" H 2450 7100 50  0001 C CNN
F 3 "" H 2450 7100 50  0001 C CNN
	1    2450 7100
	1    0    0    -1  
$EndComp
Text Label 1650 7050 0    50   ~ 0
D+
Text Label 3100 7050 2    50   ~ 0
D-
Text Label 3100 7150 2    50   ~ 0
VBUS
$Comp
L power:GND #PWR0135
U 1 1 60B11942
P 1650 7350
F 0 "#PWR0135" H 1650 7100 50  0001 C CNN
F 1 "GND" H 1655 7177 50  0000 C CNN
F 2 "" H 1650 7350 50  0001 C CNN
F 3 "" H 1650 7350 50  0001 C CNN
	1    1650 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 7050 1650 7050
Wire Wire Line
	2800 7050 3100 7050
Wire Wire Line
	3100 7150 2800 7150
Wire Wire Line
	1950 7150 1650 7150
Wire Wire Line
	1650 7150 1650 7350
NoConn ~ 2800 7250
NoConn ~ 1950 7250
$Comp
L Connector:TestPoint TP3
U 1 1 60ADEE00
P 3200 2850
F 0 "TP3" V 3100 3000 50  0000 C CNN
F 1 "TP_SWDCLK" V 3300 3000 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3400 2850 50  0001 C CNN
F 3 "~" H 3400 2850 50  0001 C CNN
	1    3200 2850
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 60ADFAD3
P 3200 3050
F 0 "TP4" V 3100 3200 50  0000 C CNN
F 1 "TP_SWD" V 3200 3400 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3400 3050 50  0001 C CNN
F 3 "~" H 3400 3050 50  0001 C CNN
	1    3200 3050
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 60ADFC18
P 3200 3250
F 0 "TP5" V 3100 3400 50  0000 C CNN
F 1 "TP_3v3" V 3200 3600 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3400 3250 50  0001 C CNN
F 3 "~" H 3400 3250 50  0001 C CNN
	1    3200 3250
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 60ADFDB3
P 3200 3450
F 0 "TP6" V 3100 3600 50  0000 C CNN
F 1 "TP_GND" V 3200 3800 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 3400 3450 50  0001 C CNN
F 3 "~" H 3400 3450 50  0001 C CNN
	1    3200 3450
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 60B93083
P 900 3250
F 0 "TP1" V 800 3400 50  0000 C CNN
F 1 "TP_Tx" V 900 3550 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 1100 3250 50  0001 C CNN
F 3 "~" H 1100 3250 50  0001 C CNN
	1    900  3250
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 60B93507
P 900 3450
F 0 "TP2" V 800 3600 50  0000 C CNN
F 1 "TP_Rx" V 900 3750 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 1100 3450 50  0001 C CNN
F 3 "~" H 1100 3450 50  0001 C CNN
	1    900  3450
	0    -1   -1   0   
$EndComp
Text Label 1050 3450 2    50   ~ 0
Rx
Text Label 1050 3250 2    50   ~ 0
Tx
Wire Wire Line
	1050 3250 900  3250
Wire Wire Line
	1050 3450 900  3450
$EndSCHEMATC
