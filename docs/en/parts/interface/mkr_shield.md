---
layout: archive
lang: en
ref: mkr_shield
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/interface/mkr_shield/
sidebar:
  title: DYNAMIXEL Shield MKR
  nav: "mkr_shield"
---

![](/assets/images/parts/interface/mkr_shield/mkr_shield_product.jpg)

# [Introduction](#introduction)

**DYNAMIXEL Shield for Arduino MKR Series**(hereafter referred to as "DYNAMIXEL Shield MKR") is compatible with MKR series form factor Arduino boards such as MKR ZERO, MKR1000 WIFI, MKR WiFi 1010, and Portenta H7.

Arduino libraries(DYNAMIXEL2Arduino, DYNAMIXEL Shield) for DYNAMIXEL Shield MKR is provided to accelerate the development process using DYNAMIXEL on Arduino.

Please refer to [DYNAMIXEL Shield Libraries](#dynamixel-shield-libraries) section for available APIs.

{% capture shield_00 %}
**WARNING**

1. This product does not contain Arduino MKR Board. **Arduino Board should be purchased separately.**
2. **One of three DYNAMIXEL headers is assembled** on the shield for DYNAMIXEL X series (More headers for AX/MX/X series are included).
3. Please solder included headers and parts when necessary.
4. Some Arduino MKR shields may not fully compatible with DYNAMIXEL Shield MKR due to the pin confliction. Please refer to each product datasheet before using with DYNAMIXEL Shield MKR.  
{% endcapture %}
<div class="notice--danger">{{ shield_00 | markdownify }}</div>

# [Quick Start Guide](#quick-start-guide)

<iframe width="560" height="315" src="https://www.youtube.com/embed/1Y7FLG1n-9k" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**Please use the recommended voltage source for the DYNAMIXEL.**
{: .notice--warning}

# [Specifications](#specifications)

|             Item             | Details                                                                                                                                                       |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| VIN(DXL) Voltage<sup>1</sup> | 3.5 ~ 24 [V]                                                                                                                                                  |
|    Operating Temperature     | -10 ~ +80 [&deg;C]                                                                                                                                            |
|    Connectors<sup>2</sup>    | JST([S3B-EH]), Molex([5268-03A])<br>Battery Connector<sup>3</sup>([SMW250-02])<br>Terminal Block([DG350-3.5-02P-14])                                          |
|     Physical Connection      | TTL Multidrop Bus (5V Level)                                                                                                                                  |
|            Cables            | ![](/assets/images/parts/interface/mkr_shield/dc_jack_polarity.png)<br>DC Jack Harness (Type A, O.D: 5.5 [mm], I.D: 2.5 [mm])<br>Convertible cable for XL-320 |
|          Dimensions          | 65 x 25 [mm]                                                                                                                                                  |
|            Weight            | 11 [g]                                                                                                                                                        |

<sup>1</sup> [ROBOTIS SMPS 12V 5A PS-10] is recommended as a power supply for 12V DYNAMIXEL.  
<sup>2</sup> Only one JST connector is assembled by default. Please solder included connectors when necessary.  
<sup>3</sup> The battery connector is compatible with ROBOTIS batteries [LB-010](http://en.robotis.com/shop_en/item.php?it_id=903-0143-000) or [LB-020](http://en.robotis.com/shop_en/item.php?it_id=903-0277-000).
{: .notice}

{% include en/dxl/warning.md %}

## [Supported DYNAMIXEL](#supported-dynamixel)

DYNAMIXEL Shield MKR only supports `TTL` based DYNAMIXEL lineups.

| DYNAMIXEL Series |                                                                 |                                                        |                                     |
|:----------------:|:----------------------------------------------------------------|:-------------------------------------------------------|:------------------------------------|
|      **AX**      | [AX-12W]<br/>[AX-12+/12A]<br/>[AX-18F/18A]                      |                                                        |                                     |
|      **MX**      | [MX-12W]<br/>[MX-28T/AT]<br/> [MX-28T/AT(2.0)]                  | [MX-64T/AT]<br/> [MX-64T/AT(2.0)]                      | [MX-106T/AT]<br/> [MX-106T/AT(2.0)] |
|      **XL**      | [XL-320]<br/>[XL330-M077-T]<br/> [XL330-M288-T]                 | [XL430-W250-T]<br/>[2XL430-W250-T]                     |                                     |
|      **XC**      | [XC330-T288]<br/>[XC330-T181]<br/>[XC330-M288]<br/>[XC330-M181] | [XC430-W150-T]<br/> [XC430-W240-T]<br/>[2XC430-W250-T]<br/>[XC430-T150BB-T]<br/> [XC430-T240BB-T] |                                     |
|      **XM**      |                                                                 | [XM430-W210-T]<br/> [XM430-W350-T]                     | [XM540-W150-T]<br/> [XM540-W270-T]  |
|      **XH**      |                                                                 | [XH430-W210-T]<br/> [XH430-W350-T]                     | [XH540-W150-T]<br/> [XH540-W270-T]  |

<!-- [XC330-T288]<br>[XC330-T181]<br>[XC330-M288]<br>[XC330-M181] Need to add-->

## [Part Lists](#part-lists)

The following parts are included in the package.

- DYNAMIXEL Shield MKR (1)
- JST Header([S3B-EH]) (2)
- Molex Header([5268-03A]) (2)
- Terminal Block([DG350-3.5-02P-14]) (1)
- DC Jack Harness (1)
- Battery Connector([SMW250-02]) (1)
- XL-320 Convertible cable (1)

# [Layout](#layout)

DYNAMIXEL Shield MKR Schematics can be downloaded in the link below.

- [DYNAMIXEL Shield MKR Schematic](https://www.robotis.com/service/download.php?no=1988)

![](/assets/images/parts/interface/mkr_shield/pinmap.png)

> The DYNAMIXEL Shield MKR header pinout is based on the Aruduino MKR boards.

|        Item        |                                       Description                                       |
|:------------------:|:---------------------------------------------------------------------------------------:|
| DYNAMIXEL TTL Port |                                 TTL DYNAMIXEL supported                                 |
|      VIN(DXL)      | External power input for DYNAMIXEL only. Cannot provide power to the ARduino MKR boards |
|  +5V<sup>1</sup>   |                 5V from Arduino MKR boards to supply power to DYNAMIXEL                 |
|     Jumper Cap     |                   Power Source Selection between `VIN(DXL)` and `+5V`                   |

<sup>1</sup> Please be aware that Arduino MKR boards may limit the 5V power source for USB hardware protection.
{: .notice--warning}

![](/assets/images/parts/interface/mkr_shield/mkr_pinmap.png)

> Arduino MKR board pinout example. Please refer to each product in [Arduino Products](https://www.arduino.cc/en/Main/Products) for more details.

| Pin No. | Pin Name | Description                                                                            |
|:-------:|:--------:|:---------------------------------------------------------------------------------------|
|   13    |    RX    | Hardware serial port to receive data from DYNAMIXEL                                    |
|   14    |    TX    | Hardware serial port to transmit data to DYNAMIXEL                                     |
| 21(A6)  |  TX_EN   | Flow control of DYNAMIXEL data BUS<br />- **HIGH** : Transmit<br />- **LOW** : Receive |

# [How to Connect](#how-to-connect)

DYNAMIXEL Shield MKR can be mounted on or below the Arduino MKR boards.  
Please check the compatibility when using multiple shields with a single Arduino MKR board.  
**Arduino MKR boards cannot be powered using the VIN(DXL) power source.**

## 12V DYNAMIXEL X Series

This connection is recommended for most X series DYNAMIXEL with 12V operating voltage (except XL-320, XL330).  
The USB connection from PC supplies power and serial communication to the MKR board to upload the Arduino sketch, while 12V SMPS supplies power to connceted DYNAMIXEL.  
 ![](/assets/images/parts/interface/mkr_shield/DXL_MKRShield_info01.jpg)

## AX / MX Series DYNAMIXEL

AX and MX series use different type of Molex connector.  
In order to use the original AX or MX series cable, solder the included molex connector to empty DYNAMIXEL port.  
Or else, use the [Robot Cable-X3P convertible].  
 ![](/assets/images/parts/interface/mkr_shield/DXL_MKRShield_info02.jpg)

## XL330 using USB power

XL330 can run off of the 5V USB power due to its low operating voltage.  
Set the power jumper to +5V side to use 5V power from the Arduino MKR board.

Please be aware that Arduino MKR boards may limit the 5V power source for USB hardware protection.  
{: .notice--warning}  
 ![](/assets/images/parts/interface/mkr_shield/DXL_MKRShield_info03.jpg)

After uploading the program, 1 cell Lithium battery(3.7V) can be used to power the Arduino MKR board and XL330.  
 ![](/assets/images/parts/interface/mkr_shield/DXL_MKRShield_info04.jpg)

# [Power Select Jumper](#power-select-jumper)

|                                                              Use VIN(DXL) from external power source(SMPS)                                                               |                                                                                  Use +5V from Arduino MKR                                                                                  |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|                                                     ![](/assets/images/parts/interface/mkr_shield/select_vindxl.png)                                                     |                                                                ![](/assets/images/parts/interface/mkr_shield/select_5v.png)                                                                |
| When using `VIN(DXL)` from external power source, please be aware of the polarity of terminal block. **Additional power source for Arduino MKR board will be required.** | When using `+5V` from Arduino MKR, be aware that some Arduino MKR board has a built in fuse that prevents excessive use of 5V power. Please refer to each Arduino MKR board specification. |

When supplying power to DYNAMIXEL Shield MKR, **take extra care for the polarity of the cable**.
{: .notice}

# [DYNAMIXEL Shield Libraries](#dynamixel-shield-libraries)

1. DYNAMIXEL2Arduino Library : [GitHub Repository][dynamixel2arduino github repository]
2. DYNAMIXEL Shield Library : [GitHub Repository][dynamixel shield github repository]

## [Features](#features)

- Compatible to Arduino MKR and Portenta H7 boards
- Support both DYNAMIXEL Protocol 1.0 and 2.0
- By default, 16 DYNAMIXEL can be detected with DYNAMIXEL Arduino libraries([config.h](https://github.com/ROBOTIS-GIT/Dynamixel2Arduino/blob/master/src/utility/config.h#L62))
- Support SynWrite function
- DYNAMIXEL Shield library(v0.1.0 or above) requires DYNAMIXEL2Arduino library

## [Install Library](#install-library)

**NOTE**  
Make sure to install the `Arduino SAMD Boards manager` from Arduino IDE boards manager in order to program Arduino MKR boards.
{: .notice}

There are three ways to add libraries to the Arduino IDE.

1. **Using the Library Manager**
2. Importing a .zip Library
3. Manual installation

Each way is described in detail in the [Arduino Official Guide], so please refer to it if necessary.  
Below is an example of **using the Library Manager** from Arduino IDE.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_01.png)

Search for `dynamixel shield` from the Library Manager and install the latest version.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_03.png)

Click `Install all` to install the dependent library `Dynamixel2Arduino`.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_04.png)

If you have successfully installed both libraries, you'll be able to find several examples of DynamixelShield in the examples.

![](/assets/images/parts/interface/dynamixel_shield/examples.png)

## [Library API](#library-api)

### [DYNAMIXELShield(v0.1.0 or above)](#dynamixelshieldv010-or-above)

**WARNING** : In order to use DYNAMIXEL Shield library(v0.1.0 or above), [DYNAMIXEL2Arduino library](#install-library) must be installed.
{: .notice--warning}

#### [Dynamixel2Arduino Class](#dynamixel2arduino-class)

- [begin()]{: .popup}
- [getPortBaud()]{: .popup}
- [ping()]{: .popup}
- [scan()]{: .popup}
- [getModelNumber()]{: .popup}
- [setID()]{: .popup}
- [setProtocol()]{: .popup}
- [setBaudrate()]{: .popup}
- [torqueOn()]{: .popup}
- [torqueOff()]{: .popup}
- [ledOn()]{: .popup}
- [ledOff()]{: .popup}
- [setOperatingMode()]{: .popup}
- [setGoalPosition()]{: .popup}
- [getPresentPosition()]{: .popup}
- [setGoalVelocity()]{: .popup}
- [getPresentVelocity()]{: .popup}
- [setGoalPWM()]{: .popup}
- [getPresentPWM()]{: .popup}
- [setGoalCurrent()]{: .popup}
- [getPresentCurrent()]{: .popup}
- [readControlTableItem()]{: .popup}
- [writeControlTableItem()]{: .popup}

#### [Master Class](#master-class)

Dynamixel2Arduino class inherits below public functions from the Master class.

- [read()]{: .popup}
- [write()]{: .popup}
- [syncRead()]{: .popup}
- [syncWrite()]{: .popup}
- [bulkRead()]{: .popup}
- [bulkWrite()]{: .popup}
- [getLastLibErrCode()]{: .popup}

#### [RobotisRemoteController Class](#robotisremotecontroller-class)

The Remote Controller class can be used with the Arduino MKR boards by enabling SoftwareSerial feature.

- [begin()][rc100_begin]{: .popup}
- [availableData()]{: .popup}
- [readData()]{: .popup}
- [availableEvent()]{: .popup}
- [readEvent()]{: .popup}
- [flushRx()]{: .popup}
- [available()]{: .popup}
- [read()]{: .popup}
- [peek()]{: .popup}
- [flush()]{: .popup}
- [write()]{: .popup}

# [Examples](#examples)

## [CAN2DYNAMIXEL](#can2dynamixel)

CAN2DYNAMIXEL converts CAN based DYNAMIXEL Protocol into DYNAMIXEL Protocol 2.0.

CAN shield board with MCP2515 is required and `107-Arduino-MCP2515` library can be installed via Library Manager of Arduino IDE.

### Download
The example is included in the `DYNAMIXEL Shield library` and can be found at **File > Examples > DynamixelShield > advanced > can2dynamixel** from Arduino IDE.

### Tested Environment
- DYNAMIXEL
  - TTL supported X series (except XL-320)
  - ID = 1, Baudrate = 1000000bps, Protocol 2.0
- Controller
  - Arduino MKR WAN 1300
  - DYNAMIXEL Shield for Arduino MKR
  - MKR CAN Shield
- CAN Interface
  - IXXAT USB-to-CAN V2
- CAN Library
  - 107-Arduino-MCP2515
- Software
  - IXXAT canAnalyser3 Mini
  - Bitrate = 1000CiA (1000 kbit/s)
  - Arduino IDE
  - DYNAMIXEL Shield library

{% capture shield_01 %}
**WARNING**  
- This example uses 1,000,000 bps. Please configure the Baudrate of DYNAMIXEL accordingly.
- Do not use a Baudrate higher than 1,000,000 bps as it may cause unstable data transmission.
{% endcapture %}
<div class="notice--warning">{{ shield_01 | markdownify }}</div>

### Connection Diagram
![](/assets/images/parts/interface/mkr_shield/examples_can2dynamixel_diagram.jpg)

### Additional Information
The `CAN Standard Protocol 2.0` used in this example is shown as below.

| 1 Bit | 11 Bit | 1 Bit | 1 Bit | 1 Bit |  4 Bit  |  8 Byte  | 2 Byte | 2 Bit | 7 Bit | 3 Bit |
|:-----:|:------:|:-----:|:-----:|:-----:|:-------:|:--------:|:------:|:-----:|:-----:|:-----:|
|  SOF  | **ID** |  RTR  |  IDE  |  r0   | **DLC** | **Data** |  CRC   |  ACK  |  EOF  |  IFS  |

- **ID** : DYNAMIXEL ID
- **DLC** : Size of Data
- **Data** : [Instruction](/docs/en/dxl/protocol2/#instruction){: .blank}(1 Byte) + [Parameters](/docs/en/dxl/protocol2/#parameters){: .blank}(0 ~ 7 Byte)

**NOTE** : CAN2DYNAMIXEL does not support `Sync` or `Bulk` instructions due to the limited length of Data field.
{: .notice}

The Transmit section of IXXAT canAnalyser3 Mini software requires `ID (hex)` and `Data (hex)` while other fields are automatically generated as shown below.

![](/assets/images/parts/interface/mkr_shield/can2dynamixel_ixxat_cananalyser3_mini_example.png)

## [RCPWM2DYNAMIXEL](#rcpwm2dynamixel)

RCPWM2DYNAMIXEL is the example to control DYNAMIXEL using RC controller.  
The RC signal sent from the RC controller is translated into PWM signal by the RC receiver, then converted into DYNAMIXEL Protocol 2.0 by the Arduino MKR board.

The example provides a couple safety features such as `Soft Start` that prevents sudden movement of DYNAMIXEL when the RC receiver is powered, and `Fail Safe` that returns DYNAMIXEL to certain position when the power of the RC receiver is cut off.

### Download
The example is included in the `DYNAMIXEL Shield library` and can be found from **File > Examples > DynamixelShield > advanced > rc_pwm2dynamixel**

### Tested Environment
- DYNAMIXEL
  - TTL supported X series (except XL-320)
  - ID = 1 ~ 7, Baudrate = 1000000bps, Protocol 2.0
- Controller
  - Arduino MKR Zero
  - DYNAMIXEL Shield for Arduino MKR
  - Futaba T10J controller
- RC Interface
  - Futaba R3008SB receiver
- Software
  - Arduino IDE
  - DYNAMIXEL Shield library

**NOTE**: The maximum number of DYNAMIXEL depends on the number of channel supported by the RC receiver and the Arduino controller.
{: .notice}

**WARNING**: The default baudrate of DYNAMIXEL X series is set to 57600 bps, and the example uses 1000000 bps.  
Please match the baudrate of DYNAMIXEL and the examplel code.
{: .notice--warning}
### Connection Diagram
![](/assets/images/parts/interface/mkr_shield/examples_rcpwm2dynamixel_diagram.png)

### Wiring
The RC receiver and the DYNAMIXEL Shield MKR can be connected as below.

![connection_diagram](/assets/images/parts/interface/mkr_shield/connection_diagram.jpg)

# [Download](#download)

- [DYNAMIXEL Shield MKR Schematic(PDF)](https://www.robotis.com/service/download.php?no=1988)  
  ![](/assets/images/parts/interface/mkr_shield/mkr_schematic.png)

# [FAQ](#faq)

[ax-12w]: /docs/en/dxl/ax/ax-12w/
[ax-12+/12a]: /docs/en/dxl/ax/ax-12a/
[ax-18f/18a]: /docs/en/dxl/ax/ax-18a/
[mx-12w]: /docs/en/dxl/mx/mx-12w/
[mx-28t/at]: /docs/en/dxl/mx/mx-28/
[mx-28t/at(2.0)]: /docs/en/dxl/mx/mx-28-2/
[mx-64t/at]: /docs/en/dxl/mx/mx-64/
[mx-64t/at(2.0)]: /docs/en/dxl/mx/mx-64-2/
[mx-106t/at]: /docs/en/dxl/mx/mx-106/
[mx-106t/at(2.0)]: /docs/en/dxl/mx/mx-106-2/
[xl-320]: /docs/en/dxl/x/xl320/
[xl330-m077-t]: /docs/en/dxl/x/xl330-m077/
[xl330-m288-t]: /docs/en/dxl/x/xl330-m288/
[xl430-w250-t]: /docs/en/dxl/x/xl430-w250/
[2xl430-w250-t]: /docs/en/dxl/x/2xl430-w250/
[xc430-w150-t]: /docs/en/dxl/x/xc430-w150/
[xc430-w240-t]: /docs/en/dxl/x/xc430-w240/
[xc430-t150bb-t]: /docs/en/dxl/x/xc430-t150bb/
[xc430-t240bb-t]: /docs/en/dxl/x/xc430-t240bb/
[2xc430-w250-t]: /docs/en/dxl/x/2xc430-w250/
[XC330-T288]: /docs/en/dxl/x/xc330-t288
[XC330-T181]: /docs/en/dxl/x/xc330-t181
[XC330-M288]: /docs/en/dxl/x/xc330-m288
[XC330-M181]: /docs/en/dxl/x/xc330-m181
[xm430-w210-t]: /docs/en/dxl/x/xm430-w210/
[xm430-w350-t]: /docs/en/dxl/x/xm430-w350/
[xh430-w210-t]: /docs/en/dxl/x/xh430-w210/
[xm540-w150-t]: /docs/en/dxl/x/xm540-w150/
[xm540-w270-t]: /docs/en/dxl/x/xm540-w270/
[xh430-w350-t]: /docs/en/dxl/x/xh430-w350/
[xh540-w150-t]: /docs/en/dxl/x/xh540-w150/
[xh540-w270-t]: /docs/en/dxl/x/xh540-w270/
[s3b-eh]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[5268-03A]: https://www.molex.com/molex/products/part-detail/pcb_headers/0022057035
[smw250-02]: http://product.ic114.com/PDF/S/SMW250-NN.pdf
[dg350-3.5-02p-14]: http://www.degson.com/en/downpdf/id/542.html
[robotis smps 12v 5a ps-10]: http://en.robotis.com/shop_en/list.php?ca_id=3020a0
[robot cable-x3p convertible]: http://en.robotis.com/shop_en/item.php?it_id=903-0251-000
[ln-101]: /docs/en/parts/interface/ln-101/
[rc-100]: /docs/en/parts/communication/rc-100/
[arduino official guide]: https://www.arduino.cc/en/Guide/Libraries
[dynamixel2arduino github repository]: https://github.com/ROBOTIS-GIT/Dynamixel2Arduino
[dynamixel shield github repository]: https://github.com/ROBOTIS-GIT/DynamixelShield
[begin()]: /docs/en/popup/arduino_api/begin/
[getportbaud()]: /docs/en/popup/arduino_api/getPortBaud/
[ping()]: /docs/en/popup/arduino_api/ping/
[scan()]: /docs/en/popup/arduino_api/scan/
[getmodelnumber()]: /docs/en/popup/arduino_api/getModelNumber/
[setid()]: /docs/en/popup/arduino_api/setID/
[setprotocol()]: /docs/en/popup/arduino_api/setProtocol/
[setbaudrate()]: /docs/en/popup/arduino_api/setBaudrate/
[torqueon()]: /docs/en/popup/arduino_api/torqueOn/
[torqueoff()]: /docs/en/popup/arduino_api/torqueOff/
[ledon()]: /docs/en/popup/arduino_api/ledOn/
[ledoff()]: /docs/en/popup/arduino_api/ledOff/
[setoperatingmode()]: /docs/en/popup/arduino_api/setOperatingMode/
[setgoalposition()]: /docs/en/popup/arduino_api/setGoalPosition/
[getpresentposition()]: /docs/en/popup/arduino_api/getPresentPosition/
[setgoalvelocity()]: /docs/en/popup/arduino_api/setGoalVelocity/
[getpresentvelocity()]: /docs/en/popup/arduino_api/getPresentVelocity/
[setgoalpwm()]: /docs/en/popup/arduino_api/setGoalPWM/
[getpresentpwm()]: /docs/en/popup/arduino_api/getPresentPWM/
[setgoalcurrent()]: /docs/en/popup/arduino_api/setGoalCurrent/
[getpresentcurrent()]: /docs/en/popup/arduino_api/getPresentCurrent/
[readcontroltableitem()]: /docs/en/popup/arduino_api/readControlTableItem/
[writecontroltableitem()]: /docs/en/popup/arduino_api/writeControlTableItem/
[read()]: /docs/en/popup/arduino_api/read/
[write()]: /docs/en/popup/arduino_api/write/
[syncread()]: /docs/en/popup/arduino_api/syncRead/
[syncwrite()]: /docs/en/popup/arduino_api/syncWrite/
[bulkread()]: /docs/en/popup/arduino_api/bulkRead/
[bulkwrite()]: /docs/en/popup/arduino_api/bulkWrite/
[getlastliberrcode()]: /docs/en/popup/arduino_api/getLastLibErrCode/
[rc100_begin]: /docs/en/popup/arduino_api/rc100_begin/
[availabledata()]: /docs/en/popup/arduino_api/availableData/
[readdata()]: /docs/en/popup/arduino_api/readData/
[availableevent()]: /docs/en/popup/arduino_api/availableEvent/
[readevent()]: /docs/en/popup/arduino_api/readEvent/
[flushrx()]: /docs/en/popup/arduino_api/flushRx/
[available()]: /docs/en/popup/arduino_api/available/
[read()]: /docs/en/popup/arduino_api/read/
[peek()]: /docs/en/popup/arduino_api/peek/
[flush()]: /docs/en/popup/arduino_api/flush/
[write()]: /docs/en/popup/arduino_api/write/
