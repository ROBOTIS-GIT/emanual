---
layout: archive
lang: en
ref: opencm904
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/opencm904/
sidebar:
  title: OpenCM 9.04
  nav: "opencm904"
---

# OpenCM 9.04

![](/assets/images/parts/controller/opencm904/opencm904_product.png)

# [Introduction](#introduction)

- OpenCM9.04 Types Package
 	
|Item|OpenCM9.04 A Type|OpenCM9.04 B Type|OpenCM9.04 C Type|
|:---:|:---:|:---:|:---:|
|Power Switch|X|1|1|
|User Button|1|1|1|
|2Pin Battery(LBS-40)|X|2|2|
|JTAG/SWD|X|1|1|
|Micro B USB|X|1|1|
|5-Pin Port|X|4|4|
|Dynamixel TTL BUS|X|4|4|
|4 Pin Communication|X|1|1|

- OpenCM9.04 is a microcontroller board based on 32bit ARM Cortex-M3. The OpenCM9.04’s schematics and source codes are open-source.
- 3 types are available: Type A & Type B & Type C. The difference between Type A,Type B, Type C is the availability of the connectors. (Refer to the image and table above.)  
  (OpenCM9.04 Accessory Set can be purchased to acquire all the necessary connector to upgrade Type A to Type B Type C.)  [OpenCM9.04 Accessory Set](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2394)

`Note` Refer to the DARWIN-MINI for controller recovery (type C-only) [DARWIN-MINI Controller Firmware Update]
{: .notice}


# [Specifications](#specifications)

|Item|Description|
|:---:|:---:|
|CPU|STM32F103CB (ARM Cortex-M3)|
|Operation Voltage|5V ~ 16V|
|I/O|GPIO x 26|
|Timer|4 (16bit)|
|Analog Input(ADC)|10 (12bit)|
|Flash|128Kb|
|SRAM|20Kb|
|Clock|72Mhz|
|USB|1 (2.0 Full Speed) Micro B Type|
|USART|3|
|SPI|2|
|I2C(TWI)|2|
|Debug|JTAG & SWD|
|Dynamixel TTL BUS 3pin|4|
|Dimensions|27mm x 66.5mm|

{% capture opencm904_caution_01 %}
`Caution`
- USB power is cannot be used to operate Dynamixels. Separate power supply needs to be provided.  
  (OpenCM9.04 can operate using power supplied via USB, battery, + - terminal.)
- Check the operating voltage for peripheral devices when using additional power supplies. Dynamixel or XL-series is receives the exact voltage supplied.   
- Dynamixel and XL-series cannot be used together due to different operating voltages.
{% endcapture %}

<div style="notice--warning">{{ opencm904_caution_01 | markdownify }}</div>

# [Control Table](#control-table)
Control Table consists of data regarding the current status and operation of controller. The user can control controller by changing data of Control Table via Instruction packet.

- EEPROM and RAM  
  Data in RAM area is reset to initial values whenever the power is turned on while data in EEPROM area is kept once values are set even if the power is turned off.

- Address  
  Represents the location of data. To read from or write data to the control table the user should assign the correct address in the Instruction packet.

- Access  
  Controller has two kinds of data: Read-only data, used mainly for sensing, and read-and-write data used for driving.

- Initial Value  
  In case of data in the EEPROM Area, the initial values on the right side of the below Control Table are the factory default settings.  
  In case of data in the RAM Area, the initial values on the right side of the following control table are the ones when the power is turned on.

- Size  
  The Size of data varies from 1 ~ 4 bytes depend on their usage. Please check the size of data when updating the data with an Instruction Packet.

## [EEPROM Area](#eeprom-area)

|Address|Size|Name|Description|Access|Init Value|
|:---:|:---:|:---:|:---:|:---:|:---:|
|0|2|Model Number|Model Number|R|400|
|6|1|Firmware Version|Firmware Version|R|-|
|7|1|ID|Controller ID|RW|200|
|8|1|Baud Rate|Communication Baud Rate|R|1|
|9|1|Return Delay Time|Response Delay Time|RW|0|
|10|1|Status Return Level|Select Types of Status Return|RW|2|
|12|1|DXL Baud Rate|Dynamixel Communication Baud Rate|RW|3|

## [RAM Area](#ram-area)

|Address|Size|Name|Description|Access|Init Value|
|:---:|:---:|:---:|:---:|:---:|:---:|
|21|1|Mode Number|Operation Mode|RW|-|
|26|1|Button Status|Start Button Status|R|0|
|66|2|Motion Play Page|Motion Play Page Number|RW|0|
|68|1|Motion Play Status|Motion Play Status|R|-|
|73|1|128ms Timer Value|128ms Timer Counter|RW|0|
|74|2|1ms Timer Value|1ms Timer Counter|RW|0|
|77|1|Random Number|Creating Random Number|RW|-|
|79|1|Green LED|Green LED Status|RW|0|
|82|1|Motion LED|Motion LED Status|RW|0|
|360|2|Port 1 IR Sensor Value|IR Sensor Value on Port 1|R|-|
|366|2|Port 4 IR Sensor Value|IR Sensor Value on Port 4|R|-|
|368|2|Port 1 DMS Sensor Value|DMS Sensor Value on Port 1|R|-|
|370|2|Port 2 DMS Sensor Value|DMS Sensor Value on Port 2|R|-|
|372|2|Port 3 DMS Sensor Value|DMS Sensor Value on Port 3|R|-|
|374|2|Port 4 DMS Sensor Value|DMS Sensor Value on Port 4|R|-|
|376|1|Port 1 Touch Sensor Value|Touch Sensor Value on Port 1|R|-|
|377|1|Port 2 Touch Sensor Value|Touch Sensor Value on Port 2|R|-|
|378|1|Port 3 Touch Sensor Value|Touch Sensor Value on Port 3|R|-|
|379|1|Port 4 Touch Sensor Value|Touch Sensor Value on Port 4|R|-|
|381|1|Port 2 LED Module Value|LED Module Control Value on Port 2|RW|0|
|382|1|Port 3 LED Module Value|LED Module Control Value on Port 3|RW|0|
|386|2|Port 2 User Device Value|User Device Value on Port 2|RW|0|
|388|2|Port 3 User Device Value|User Device Value on Port 3|RW|0|
|392|1|Port 1 Temperature Sensor Value|Temperature Sensor Value on Port 1|R|-|
|393|1|Port 2 Temperature Sensor Value|Temperature Sensor Value on Port 2|R|-|
|394|1|Port 3 Temperature Sensor Value|Temperature Sensor Value on Port 3|R|-|
|395|1|Port 4 Temperature Sensor Value|Temperature Sensor Value on Port 4|R|-|
|396|1|Port 1 Ultrasonic Sensor Value|Ultrasonic Sensor Value on Port 1|R|-|
|397|1|Port 2 Ultrasonic Sensor Value|Ultrasonic Sensor Value on Port 2|R|-|
|398|1|Port 3 Ultrasonic Sensor Value|Ultrasonic Sensor Value on Port 3|R|-|
|399|1|Port 4 Ultrasonic Sensor Value|Ultrasonic Sensor Value on Port 4|R|-|
|400|1|Port 1 Magnetic Sensor Value|Magnetic Sensor Value on Port 1|R|-|
|401|1|Port 2 Magnetic Sensor Value|Magnetic Sensor Value on Port 2|R|-|
|402|1|Port 3 Magnetic Sensor Value|Magnetic Sensor Value on Port 3|R|-|
|403|1|Port 4 Magnetic Sensor Value|Magnetic Sensor Value on Port 4|R|-|
|404|1|Port 1 Motion Sensor Value|Motion Sensor Value on Port 1|R|-|
|405|1|Port 2 Motion Sensor Value|Motion Sensor Value on Port 2|R|-|
|406|1|Port 3 Motion Sensor Value|Motion Sensor Value on Port 3|R|-|
|407|1|Port 4 Motion Sensor Value|Motion Sensor Value on Port 4|R|-|
|409|1|Port 2 Color Sensor Value|Color Sensor Value on Port 2|R|-|
|410|1|Port 3 Color Sensor Value|Color Sensor Value on Port 3|R|-|

`Note` Some Addresses of the Control Table can be tested with R+ Manager 2.0.

# [Block Diagram](#block-diagram)

OpenCM9.04’s block diagram is shown below. OpenCM9.04’s schematic is based on 32bit Cortex-M3 core STM32F103CB microcontroller.  
The power schematic is designed to cascade through 5V and 3.3V regulators. 5V is supplied to TTL bus and 3.3V is supplied to microcontrollers, 5-pin port and 4-pin communication port.  
OpenCM9.04 supports USB2.0 FS. Micro-B connector is used to download the program or perform data communication.  
Pin 11(TX1) & Pin 12(RX1) cannot be used simultaneously because USART Channel 1 is assigned to DYNAMIXEL TTL Bus.  
USART channel 1 is registered under Dynamixel TTL Bus and cannot be used simultaneously with pin 11(TX1) & 12(RX1). 

![](/assets/images/parts/controller/opencm904/opencm904_01.png)

# [Layout](#layout)

![](/assets/images/parts/controller/opencm904/opencm904_02.png)

1. **Power Switch** : Switch used to control the power supplied to the board and DYNAMIXEL on/off. (Note: the board is always powered ON when USB cable is connected.)
2. **Series Battery Socket** : Connects two LBS-04 Lithium-ion battery. 

    `Caution` Do NOT charge the battery while its connected to the board because the user will short the circuit. Be sure to disconnect from the board when charging the battery.
    {: .notice--warning}

3. **Dynamixel TTL 3 PIN** : Port for daisy chaining Dynamixels that use 3-pin cables (Dynamixel TTL Bus).
4. **Communication Port** : Used from wired/wireless communication using peripheral devices (i.e. BT-210, BT-110A, ZIG-110A, LN-101, etc). OpenCM9.04’s 4-pin communication port uses Serial2(USART2). 

    ![](/assets/images/parts/controller/opencm904/opencm904_03.png)

    > 4-pin communication port pinmap> 

    ![](/assets/images/parts/controller/opencm904/opencm904_04.png)

    > Example : Wireless communication between OpenCM9.04 and a smartphone> 

    ![](/assets/images/parts/controller/opencm904/opencm904_05.png)

    > Example : Bluetooth communication using OpenCM9.04 and RC100

    ![](/assets/images/parts/controller/opencm904/opencm904_06.png)

    > Example : Zigbee communication using OpenCM9.04 and RC100

    ![](/assets/images/parts/controller/opencm904/opencm904_07.png)
    > Example : Wired communication using OpenCM9.04 and LN-101

5. **User Button** :  a button that can be controlled/programmed by the user. Can be used as pin 23 or BOARD_BUTTON_PIN. It can be initialized in setup() as pinMode(23, INPUT_PULLDOWN).  
  If OpenCM9.04 does not download the program, connect the USB cable while holding down the “User Button”. Status LED will stay lit and the download will be initiated. 

    ![](/assets/images/parts/controller/opencm904/opencm904_08.png)
    
    > OpenCM9.04 can enter a “Emergency Recovery Mode” by using the “User button”

6. **Ext. ADC Ref Jumper** : Analog Reference voltage can be modified. Please refer to AREF section on  pg.13 (Link)

7. **Micro-B USB** : Used to download programs onto OpenCM9.04 and used to communicate with other devices via USB while simultaneously supplying 5V to the board.  
  Upon connecting the battery, 5V power from USB is automatically disconnected and power is supplied from the battery.  
  If excessive current is drawn, internal fuse cuts off the current drawn from the 5V USB connection to protect the user’s PC from damage. 

    ![](/assets/images/parts/controller/opencm904/opencm904_09.png)

8. **Status LED** : LED used to test OpenCM9.04’s program. The LED turns ON when Pin 14 or BOARD_LED_PIN is HIGH and turns OFF when it’s LOW. PWM control is possible.

    ![](/assets/images/parts/controller/opencm904/opencm904_10.png)

    > Status LED Position

9. Reset Button : imitates the CPU to reset.
10. JTAG/SWD 4 PIN : Used to connect ST-LINK or other In-Circuit Debugger/Programmer.  
  JTAG/SWD 4-pin port can be used for various developments by advanced users. ST-LINK connection example is shown below. 

    ![](/assets/images/parts/controller/opencm904/opencm904_11.png)

    > Example: ST-LINK and OpenCM9.04 connection

11. 5-pin Port : used to connect ROBOTIS 5-pin devices (modules). 

    ![](/assets/images/parts/controller/opencm904/opencm904_12.png)

    > 5-pin port number and instructions
    
    ![](/assets/images/parts/controller/opencm904/opencm904_13.png)

    >5-pin cable direction

    |5-pin Device Type|Port 1|Port 2|Port 3|Port 4|
    |:---:|:---:|:---:|:---:|:---:|
    |IR Sensor|O|X|X|O|
    |DMS Sensor|O|O|O|O|
    |Gyro Sensor|O|O|O|O|
    |Touch Sensor|O|O|O|O|
    |Color Sensor|X|O|O|X|
    |Magnetic Sensor|O|O|O|O|
    |Temperature Sensor|O|O|O|O|
    |Passive IR Sensor PIR-10|O|O|O|O|
    |LED Module|X|O|O|X|

    > ROBOTIS sense and LED module compatibility list

12. I/O Header : OpenCM9.04’s CPU <STM32F103CB> can be accessed via GPIO pins.  
  26 GPIO pins (0~25) are digital input/outputs and operates at 3.3V. Digital input either HIGH(3.3V) or LOW(0V). 
  Digital input’s maximum toggle speed is 18Mhz. (With exception of pin 22 & 23, which has a maximum toggle speed of 2Mhz). 
  Digital pins can only tolerate up to 3.3V; any voltage input greater than 3.3V may damage the OpenCM9.04.
  5V Tolerant Pin : 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21 
  The maximum current these pins can tolerate is 25mA. (exception: pin 22 & 23 can only tolerate 3mA.) 
  All of OpenCM9.04’s GPIO pins can internally “pull-up” or “pull-down” and can be modified via software. “Pull-up” and “pull-up” resistance is 40Kohm(Typical).

    ![](/assets/images/parts/controller/opencm904/opencm904_14.png)

    > OpenCM9.04 GPIO PinMap


- **Serial(USART)** : 11(TX1), 12(RX1), 4(TX2), 5(RX2), 24(TX3), 25(RX3)
- **PWM** : 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14
- **SPI** : 0(SS1), 1(SCK1),6(MISO1) ,7(MOSI1), 18(SS2) ,19(SCK2) ,20(MISO2) ,21(MOSI2)
- **LED** : 14 (BOARD_LED_PIN is defined as 14)
- **BUTTON** : 23 (BOARD_BUTTON_PIN is defined as 23)
- **TWI(I2C)** : 24(SCL2), 25(SDA2)
- **RST** : Pin connect to the CPU Reset signal.
- **5V** : outputs 5V when the battery is connected to the board. (Does not output 5V when USB only the USB cable is connected.)
- **3.3V** : outputs 3.3V when the power is supplied to the board via battery or USB cable.
- **GND** : GROUND(-) terminal.
- **A0** : Digital I/O and analog input.
- **A1** : Digital I/O and analog input. Can be used for SPI channel 1’s SCK clock-pin.
- **A2** : Digital I/O, analog input, & PWM output.
- **A3** : Digital I/O, analog input, & PWM output.
- **A4** : Digital I/O, analog input, & PWM output. Used as USART1 (Serial2) channel’s TXD pin and connected to 4-pin communication port’s TX2.
- **A5** : Digital I/O, analog input, & PWM output. Used as USART2(Serial2) channel’s RXD pin and connected to 4-pin communication RX2.
- **A6** : Digital I/O, analog input, & PWM output. Can be used as SPI channel 1’s MISO pin.
- **A7** : Digital I/O, analog input, & PWM output. Can be used as SPI channel 1’s MISO pin.
- **A8** : Digital I/O, analog input, & PWM output.
- **A9** Digital I/O, analog input, & PWM output.
- **D10** : Digital I/O & PWM output.
- **D11** : Digital I/O & PWM output. USART1’s (Serial1) TX pin. Cannot be simultaneously used with the Dynamixel TTL Bus.
- **D12** : Digital I/O & PWM output. USART1(Serial1)’s RX pin. Cannot be simultaneously used with the Dynamixel TTL Bus.
- **D13** : Digital I/O & PWM output.
- **D14** : Digital I/O & PWM output. Pin connected to the Status LED. It’s pre-defined as BOARD_LED_PIN.
- **D15** : Digital I/O.
- **VCC(+)** : +voltage of the board. There are 2 VCC(+) pins. Connected to the + terminal of the battery socket.
- **GND(-)** :-voltage of the board. There are 2 GND(-) pins. Connected to the + terminal of the battery socket.
- **TTL** : Dynamixel TTL Bus’s Data line. Used to communicate with 3-pin TTL Dynamixels.
- **D** : Relevant to Dynamixel TTL Bus and used to select TX, RX.
- **X** : Dynamixel TTL Bus’s TX pin.
- **L** : Dynamixel TTL Bus’s RX pin.
- **D16** : Digital I/O Pin.
- **D17** : Digital I/O Pin. 
- **D18** : Digital I/O Pin. 
- **D19** : Digital I/O Pin. Can be used for SPI channel 2’s SCK clock pin.
- **D20** : Digital I/O Pin. Can be used for SPI channel 2’s MOSI pin.
- **D21** : Digital I/O Pin. Can be used for SPI channel 2’s MOSI pin.
- **D22** : Digital I/O Pin. Maximum output current is 3mA and maximum toggle speed is 2Mhz. 
- **D23** : Digital I/O Pin. It’s connected to User Button. If the power is supplied while User Button is pressed, the board initiates Emergency Recovery (Download) Mode. Maximum output current is 3mA and maximum toggle speed is 2Mhz.
- **D24** : Digital I/O Pin. Can be used as I2C channel 2’s SCL pin or USART3(Serial3)’s TX pin.
- **D25** : Digital I/O Pin. Can be used as I2C channel 2’s SDA pin or USART3(Serial3)’s RX pin.
- **5V** : 5V output pin. JP2 jumper can be modified to connect to AREF pin and change the default voltage to 5V.
- **AREF** : Connect to CPU’s Analog Reference pin. Voltage can be modified from 3.3V by changing the JP2 jumper (Maximum 5V). Refer to STM32F103CB datasheet for specifications.)

![](/assets/images/parts/controller/opencm904/opencm904_15.png)

> JP2 jumper location and instructions

![](/assets/images/parts/controller/opencm904/opencm904_16.png)

> Example: Changing default Analog Reference voltage(AREF) to 5V by modifying JP2


`Caution` Check the pin supporting up to 5V once Analog Reference (AREF) has been modified to 5V.
{: .notice--warning}


# [Connecting Power](#connecting-power)

OpenCM board can be powered using 3 types of voltage input:
1. LBS-40 battery socket
2. Power supplied via +- header pins 
3. Micro-B USB cable

![](/assets/images/parts/controller/opencm904/opencm904_17.png)

We recommend using 2 LBS-40 batteries when operating the XL-320.

![](/assets/images/parts/controller/opencm904/opencm904_18.png)

> Example: OpenCM9.04, XL-320, and LBS-40(Li-Ion Battery) connection

![](/assets/images/parts/lbs-40_product.jpg)

> LBS-40 battery

We recommend using +- pin to power Dynamixels other than XL-320. 

![](/assets/images/parts/controller/opencm904/opencm904_19.png)

> Example: OpenCM9.04 and AX12 connection

As displayed in the image below, connect towards the end of both +,- and it can also be connected using other power supply equipment.  
(If you see the back side of OpenCM9.04, the +,- in the center is connected as displayed in image A. So, please connect as in the image below)

![](/assets/images/parts/controller/opencm904/opencm904_20.jpg)
    
> Picture A

![](/assets/images/parts/controller/opencm904/opencm904_21.jpg)

> Example : Power Connection
 
- `Example` Power supply cable ([Link](http://www.robotsource.org/bs/bd.php?bt=forum_CM9DeveloperWorld&bt_id=583))
 
Avoid connecting power to the battery socket and +- pin (shown below). Do not connect an
incorrect battery to the battery socket. Only connect LBS-40 onto the battery socket.
 
![](/assets/images/parts/controller/opencm904/opencm904_22.jpg)
 
> CAUTION: Remove either the battery connector or +-header-pin power

![](/assets/images/parts/controller/opencm904/opencm904_23.jpg)

> CAUTION: Don’t used different types of batteries

![](/assets/images/parts/controller/opencm904/opencm904_24.png)

It is possible to simultaneously connect the USB port, LBS-40 battery, and +- pin.(Built-in protection)  
We recommend supplying the recommended voltage of the Dynamixel when supplying power via +- pin or battery. Higher voltage usage may reduce the Dynamixel’s lifespan or damage the product.  
The OpenCM9.04’s maximum tolerable voltage is 16V; voltage input greater than 16V may damage the board.  
Dynamixel cannot operate using the power supplied via USB cable, but communication ports and I/O headers can be operated normally.  
CAUTION: do NOT charge the LBS-40 battery while it is connected to the board and the board is connected to the PC via USB cable.

# [Switch Assembly(Type A)](#switch-assembly-type-a)

OpenCM9.04 Type A is sold without a power switch and JP1 shorted. To add the power switch, remove the solder connection of JP1 and solder the 2.54mm pitch power switch.  
Power switch is included in the OpenCM accessory kit or other switches with the similar pitch can be used.  

![](/assets/images/parts/controller/opencm904/opencm904_25.png)

> JP1& Power Switch schematics : Power is supplied to the board if JP1 is connected even without a switch

![](/assets/images/parts/controller/opencm904/opencm904_26.png)

> OpenCM9.04 Type A needs to have JP1 disconnected when soldering the switch for it to operate properly


# [Connector Assembly(Type A)](#connector-assembly-type-a)

OpenCM9.04’s Dynamixel 3-Pin TTL pins are all compatible with Dynamixel 3-pin TTL and XL-320 3-pin TTL(mini-type). Thus, both type of pins can be soldered and used.  
Both types of 3-pin TTL pins are included in OpenCM Accessory Set.

![](/assets/images/parts/controller/opencm904/opencm904_27.png)

> OpenCM9.04 Type A can have 2 types of 3-pin connectors soldered onto the board


# [Downloads](#downloads)

- `Download ZIP` [OpenCM 9.04 Manual](http://www.robotis.com/download/doc/controller/OpenCM9.04_en/OpenCM9.04_manual_en.zip)
- `Download PDF` [PCB Schematic](http://support.robotis.com/en/baggage_files/opencm/opencm904_rev_10_final_schematic.pdf)
- `Download PDF` [Top Gerber]
- `Download PDF` [Bottom Gerber]
- `Download PDF` [Gerber]
- `Download Software Link` [OpenCM IDE](http://support.robotis.com/en/software/robotis_opencm/robotis_opencm.htm)

# [Dimension](#dimension)

![](/assets/images/parts/controller/opencm904/opencm904_28.png)

[RoboPlus Task]: /docs/en/software/rplus1/task/getting_started/
[RoboPlus Motion]: ???/docs/en/software/rplus1/motion/
[RoboPlus Manager]: ???
[Number of pressed Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[Start button]: /docs/en/software/rplus1/task/programming_02/#button-count
[LN-101]: /docs/en/parts/interface/ln-101/
[ZIG-100]: /docs/en/parts/communication/zig-110/
[BT-110]: /docs/en/parts/communication/bt-110/
[BT-210]: /docs/en/parts/communication/bt-210/
[Automatic Turn-off]: /docs/en/software/rplus1/task/programming_02/#powersave-timer
[Firmware Update]: ???Roboplus
[Top Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-top.pdf
[Bottom Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-bottom.pdf
[Gerber]: http://support.robotis.com/en/baggage_files/opencm/opencm9.04__rev_1.0(131009)-gerber.pdf
[DARWIN-MINI Controller Firmware Update]: /docs/en/edu/mini/#firmware-update
