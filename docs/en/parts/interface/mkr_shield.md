---
layout: archive
lang: en
ref: mkr_shield
read_time: true
share: false
author_profile: false
permalink: /docs/en/parts/interface/mkr_shield/
sidebar:
  title: MKR DYNAMIXEL Shield
  nav: "mkr_shield"
---

# [Introduction](#introduction)
![](/assets/images/parts/interface/mkr_shield/mkr_shield_product.png)

MKR DYNAMIXEL Shield(TTL) is compatible with MKR form factor Arduino boards such as MKR ZERO, MKR1000 WIFI, MKR WiFi 1010, and Portenta H7. We provide Arduino libraries(DYNAMIXEL2Arduino, DYNAMIXEL Shield) for MKR DYNAMIXEL Shield to accelerate the development process using DYNAMIXEL on Arduino.

Please refer to DYNAMIXEL Shield Libraries section to 

{% capture shield_00 %}
**WARNING!**
1. This product does not contain Arduino Board. **Arduino Board should be purchased separately.**  
2. **One of three DYNAMIXEL ports is attached** on the shield for DYNAMIXEL X series (More headers are included).  
3. Please solder included headers and parts when necessary.  
4. Some Arduino MKR shields may not fully compatible with MKR DYNAMIXEL Shield due to the pin confliction. Please refer to each product information before use with MKR DYNAMIXEL Shield.  
{% endcapture %}
<div class="notice--danger">{{ shield_00 | markdownify }}</div>

# [Quick Start Guide](#quick-start-guide)

<iframe width="560" height="315" src="https://www.youtube.com/embed/UFitBEHsWTo" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

**Please use 12V SMPS or external power supply when operating DYNAMIXEL other than XL-320 and XL330.**
{: .notice--warning}

# [Specifications](#specifications)

|             Item             |                                               Details                                               |
|:----------------------------:|:---------------------------------------------------------------------------------------------------:|
| VIN(DXL) Voltage<sup>1</sup> |                                            3.5 ~ 24 [V]                                             |
|    Operating Temperature     |                                         -10 ~ +80 [&deg;C]                                          |
|    Connectors<sup>2</sup>    | JST([S3B-EH]), Molex([5268-02A]), Power Connector([SMAW250-02]), Terminal Block([DG350-3.5-02P-14]) |
|     Physical Connection      |                            TTL Multidrop Bus (3.3V Logic, 5V Compatible)                            |
|            Cables            |       DC Jack Harness (Type A, O.D.: 5.5 [mm], I.D.: 2.5 [mm]), Convertible cable for XL-320        |
|          Dimensions          |                                            65 x 25 [mm]                                             |
|            Weight            |                                               11 [g]                                                |

<sup>1</sup> [ROBOTIS SMPS 12V 5A PS-10] is recommended for 12V DYNAMIXEL power supply.  
<sup>2</sup> Only one JST is assembled by default. Please solder included connectors when necessary.
{: .notice}


## [Supported DYNAMIXEL](#supported-dynamixel)
MKR DYNAMIXEL Shield only supports `TTL` based DYNAMIXEL lineups.

| DYNAMIXEL Series |                                    |                                    |                                   |                                     |
|:-----------------|:-----------------------------------|:-----------------------------------|:----------------------------------|:------------------------------------|
| **AX**           | [AX-12W]                           | [AX-12+/12A]                       | [AX-18F/18A]                      |                                     |
| **MX**           | [MX-12W]                           | [MX-28T/AT]<br/> [MX-28T/AT(2.0)]  | [MX-64T/AT]<br/> [MX-64T/AT(2.0)] | [MX-106T/AT]<br/> [MX-106T/AT(2.0)] |
| **XL**           | [XL-320]                           | [XL330-M077-T]<br/> [XL330-M288-T] | [XL430-W250-T]                    | [2XL430-W250-T]                     |
| **XC**           | [XC430-W150-T]<br/> [XC430-W240-T] | [2XC430-W250-T]                    |                                   |                                     |
| **XM**           | [XM430-W210-T]<br/> [XM430-W350-T] | [XM540-W150-T]<br/> [XM540-W270-T] |                                   |                                     |
| **XH**           | [XH430-W210-T]<br/> [XH430-W350-T] | [XH540-W150-T]<br/> [XH540-W270-T] |                                   |                                     |

## [Part Lists](#part-lists)
The following parts are included in the package.  
- MKR DYNAMIXEL Shield (1)
- JST([S3B-EH]) (2)
- Molex([5268-02A]) (2)
- Terminal Block([DG350-3.5-02P-14]) (1)
- DC Jack Harness (1)
- XL-320 Convertible cable (1)

# [Layout](#layout)
MKR DYNAMIXEL Shield Schematics can be found in the below.  
- [MKR DYNAMIXEL Shield Schematic](https://www.robotis.com/service/download.php?no=1988)

![](/assets/images/parts/interface/mkr_shield/pinmap.png)  
> The MKR DYNAMIXEL Shield pinout is based on the layout of Aruduino MKR boards. 

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
MKR DYNAMIXEL Shield can be mounted on or below the Arduino MKR boards.  
Please check the compatibility when using multiple shields on a single Arduino MKR board.  
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

|          Use VIN(DXL) from external power source(SMPS)           |                   Use +5V from Arduino MKR                   |
|:----------------------------------------------------------------:|:------------------------------------------------------------:|
| ![](/assets/images/parts/interface/mkr_shield/select_vindxl.png) | ![](/assets/images/parts/interface/mkr_shield/select_5v.png) |
|When using `VIN(DXL)` from external power source, use included DC barrel jack extension or solder the terminal block when needed. **Additional power source for Arduino MKR board will be required.**|When using `+5V` from Arduino MKR, be aware that some Arduino MKR board has a built in fuse that prevents excessive use of 5V power. Please refer to each Arduino MKR board specification.|

When replacing the VIN(DXL) power connector with included terminal block, **be aware of the polarity of the power supply**.
{: .notice}


# [DYNAMIXEL Shield Libraries](#dynamixel-shield-libraries)

DYNAMIXEL2Arduino Library : [GitHub Repository][DYNAMIXEL2Arduino GitHub repository]  
DYNAMIXEL Shield Library : [GitHub Repository][DYNAMIXEL Shield GitHub repository]

## [Features](#features)

- Compatible to Arduino MKR and Portenta H7 boards
-	Support both DYNAMIXEL Protocol 1.0 and 2.0
- By default, 16 DYNAMIXEL can be detected with DYNAMIXEL Arduino libraries([config.h](https://github.com/ROBOTIS-GIT/Dynamixel2Arduino/blob/master/src/utility/config.h#L62))
- Support SynWrite function
- DYNAMIXEL Shield library(v0.1.0 or above) requires DYNAMIXEL2Arduino library

## [Install Library](#install-library)

There are three ways to add libraries to the Arduino IDE.

1. **Using the Library Manager**
2. Importing a .zip Library
3. Manual installation

Each way is described in detail in the [Arduino Official Guide], so please refer to it if necessary.  
Below is an example of **using the Library Manager** from Arduino IDE.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_01.png)

In order to use DYNAMIXEL Shield library(v0.1.0 or above), DYNAMIXEL2Arduino library must be installed.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

![](/assets/images/parts/interface/dynamixel_shield/library_manager_03.png)

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

# [Download](#download)
- [MKR DYNAMIXEL Shield Schematic(PDF)](https://www.robotis.com/service/download.php?no=1988)  
![](/assets/images/parts/interface/mkr_shield/mkr_schematic.png)

# [FAQ](#faq)


[AX-12W]: /docs/en/dxl/ax/ax-12w/
[AX-12+/12A]: /docs/en/dxl/ax/ax-12a/
[AX-18F/18A]: /docs/en/dxl/ax/ax-18a/
[MX-12W]: /docs/en/dxl/mx/mx-12w/
[MX-28T/AT]: /docs/en/dxl/mx/mx-28/
[MX-28T/AT(2.0)]: /docs/en/dxl/mx/mx-28-2/
[MX-64T/AT]: /docs/en/dxl/mx/mx-64/
[MX-64T/AT(2.0)]: /docs/en/dxl/mx/mx-64-2/
[MX-106T/AT]: /docs/en/dxl/mx/mx-106/
[MX-106T/AT(2.0)]: /docs/en/dxl/mx/mx-106-2/
[XL-320]: /docs/en/dxl/x/xl320/
[XL330-M077-T]: /docs/en/dxl/x/xl330-m077/
[XL330-M288-T]: /docs/en/dxl/x/xl330-m288/
[XL430-W250-T]: /docs/en/dxl/x/xl430-w250/
[2XL430-W250-T]: /docs/en/dxl/x/2xl430-w250/
[XC430-W150-T]: /docs/en/dxl/x/xc430-w150/
[XC430-W240-T]: /docs/en/dxl/x/xc430-w240/
[2XC430-W250-T]: /docs/en/dxl/x/2xc430-w250/
[XM430-W210-T]: /docs/en/dxl/x/xm430-w210/
[XM430-W350-T]: /docs/en/dxl/x/xm430-w350/
[XH430-W210-T]: /docs/en/dxl/x/xh430-w210/
[XM540-W150-T]: /docs/en/dxl/x/xm540-w150/
[XM540-W270-T]: /docs/en/dxl/x/xm540-w270/
[XH430-W350-T]: /docs/en/dxl/x/xh430-w350/
[XH540-W150-T]: /docs/en/dxl/x/xh540-w150/
[XH540-W270-T]: /docs/en/dxl/x/xh540-w270/

[S3B-EH]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[5268-02A]: https://www.molex.com/molex/products/part-detail/pcb_headers/0022057025
[SMAW250-02]: http://product.ic114.com/PDF/S/SMAW250-NN.pdf
[DG350-3.5-02P-14]: http://www.degson.com/en/downpdf/id/542.html
[ROBOTIS SMPS 12V 5A PS-10]: http://en.robotis.com/shop_en/list.php?ca_id=3020a0
[Robot Cable-X3P convertible]: http://en.robotis.com/shop_en/item.php?it_id=903-0251-000

[LN-101]: /docs/en/parts/interface/ln-101/
[RC-100]: /docs/en/parts/communication/rc-100/

[Arduino Official Guide]: https://www.arduino.cc/en/Guide/Libraries
[DYNAMIXEL2Arduino GitHub repository]: https://github.com/ROBOTIS-GIT/Dynamixel2Arduino
[DYNAMIXEL Shield GitHub repository]: https://github.com/ROBOTIS-GIT/DynamixelShield
[begin()]: /docs/en/popup/arduino_api/begin/
[getPortBaud()]: /docs/en/popup/arduino_api/getPortBaud/
[ping()]: /docs/en/popup/arduino_api/ping/
[scan()]: /docs/en/popup/arduino_api/scan/
[getModelNumber()]: /docs/en/popup/arduino_api/getModelNumber/
[setID()]: /docs/en/popup/arduino_api/setID/
[setProtocol()]: /docs/en/popup/arduino_api/setProtocol/
[setBaudrate()]: /docs/en/popup/arduino_api/setBaudrate/
[torqueOn()]: /docs/en/popup/arduino_api/torqueOn/
[torqueOff()]: /docs/en/popup/arduino_api/torqueOff/
[ledOn()]: /docs/en/popup/arduino_api/ledOn/
[ledOff()]: /docs/en/popup/arduino_api/ledOff/
[setOperatingMode()]: /docs/en/popup/arduino_api/setOperatingMode/
[setGoalPosition()]: /docs/en/popup/arduino_api/setGoalPosition/
[getPresentPosition()]: /docs/en/popup/arduino_api/getPresentPosition/
[setGoalVelocity()]: /docs/en/popup/arduino_api/setGoalVelocity/
[getPresentVelocity()]: /docs/en/popup/arduino_api/getPresentVelocity/
[setGoalPWM()]: /docs/en/popup/arduino_api/setGoalPWM/
[getPresentPWM()]: /docs/en/popup/arduino_api/getPresentPWM/
[setGoalCurrent()]: /docs/en/popup/arduino_api/setGoalCurrent/
[getPresentCurrent()]: /docs/en/popup/arduino_api/getPresentCurrent/
[readControlTableItem()]: /docs/en/popup/arduino_api/readControlTableItem/
[writeControlTableItem()]: /docs/en/popup/arduino_api/writeControlTableItem/
[read()]: /docs/en/popup/arduino_api/read/
[write()]: /docs/en/popup/arduino_api/write/
[syncRead()]: /docs/en/popup/arduino_api/syncRead/
[syncWrite()]: /docs/en/popup/arduino_api/syncWrite/
[bulkRead()]: /docs/en/popup/arduino_api/bulkRead/
[bulkWrite()]: /docs/en/popup/arduino_api/bulkWrite/
[getLastLibErrCode()]: /docs/en/popup/arduino_api/getLastLibErrCode/
[rc100_begin]: /docs/en/popup/arduino_api/rc100_begin/
[availableData()]: /docs/en/popup/arduino_api/availableData/
[readData()]: /docs/en/popup/arduino_api/readData/
[availableEvent()]: /docs/en/popup/arduino_api/availableEvent/
[readEvent()]: /docs/en/popup/arduino_api/readEvent/
[flushRx()]: /docs/en/popup/arduino_api/flushRx/
[available()]: /docs/en/popup/arduino_api/available/
[read()]: /docs/en/popup/arduino_api/read/
[peek()]: /docs/en/popup/arduino_api/peek/
[flush()]: /docs/en/popup/arduino_api/flush/
[write()]: /docs/en/popup/arduino_api/write/
