---
layout: archive
lang: en
ref: dynamixel_shield
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/interface/dynamixel_shield/
sidebar:
  title: DYNAMIXEL Shield
  nav: "dynamixel_shield"
---

# [Introduction](#introduction)
![](/assets/images/parts/interface/dynamixel_shield/with_arduino.png)

DYNAMIXEL Shield  was created to use [RC-100] and DYNAMIXEL on arduino board. We provide dynamixel library for DYNAMIXEL Shield, it can help you to use DYNAMIXEL easily.

**This product does not contain Arduino Board. Arduino Board should be purchased separately.**
{: .notice--warning}

# [Specifications](#specifications)

|       Item        |                 Details                 |
|:-----------------:|:---------------------------------------:|
| Operating Voltage |  5 V (XL-330) ~ 24 V (PRO / X Series)   |
|  Maximum Current  | 1 A(Arduino), 10 A (Terminal Connector) |

{% include en/dxl/warning.md %}

## [Supported DYNAMIXEL](#supported-dynamixel)

| DYNAMIXEL Series |                                                              |                                  |                                 |                                |                 |
|:-----------------|:-------------------------------------------------------------|:---------------------------------|:--------------------------------|:-------------------------------|:----------------|
| **AX**           | [AX-12W]                                                     | [AX-12+/12A]                     | [AX-18F/18A]                    |                                |                 |
| **RX** `1`       | [RX-10]                                                      | [RX-24F]                         | [RX-28]                         | [RX-64]                        |                 |
| **DX** `1`       | [DX-113]                                                     | [DX-116]                         | [DX-117]                        |                                |                 |
| **EX** `1`       | [EX-106+]                                                    |                                  |                                 |                                |                 |
| **MX**           | [MX-12W]                                                     | [MX-28], [MX-28(2.0)]            | [MX-64], [MX-64(2.0)]           | [MX-106], [MX-106(2.0)]        |                 |
| **XL**           | [XL320]                                                      | [XL430-W250]                     | [XL330-M077] <br/> [XL330-M288] | [2XL430-W250]                  |                 |
| **XC**           | [XC330-T288]<br>[XC330-T181]<br>[XC330-M288]<br>[XC330-M181] | [XC430-W150]<br/> [XC430-W240]<br/>[XC430-T150BB]<br/> [XC430-T240BB]   | [2XC430-W250]                   |                                |                 |
| **XM**           | [XM430-W210]                                                 | [XM430-W350]                     | [XM540-W150]                    | [XM540-W270]                   |                 |
| **XH**           | [XH430-W210]<br/> [XH430-W350]                               | [XH430-V210]<br/> [XH430-V350]   | [XH540-W150]<br/> [XH540-W270]  | [XH540-V150]<br/> [XH540-V270] |                 |
| **XD**           | [XD430-T210-R]<br>[XD430-T350-R]                             | [XD540-T150-R]<br>[XD540-T270-R] |                                 |                                |                 |
| **XW**           | [XW430-T333-R] <br>[XW430-T200-R]                            | [XW540-T140-R]<br>[XW540-T260-R] |                                 |                                |                 |
| **PRO H**        | [H42-20-S300-R]                                              | [H54-100-S500-R]                 | [H54-200-S500-R]                |                                |                 |
| **PRO M**        | [M42-10-S260-R]                                              | [M54-40-S250-R]                  | [M54-60-S250-R]                 |                                |                 |
| **PRO L** `1`    | [L42-10-S300-R]                                              | [L54-30-S500-R]                  | [L54-30-S400-R]                 | [L54-50-S500-R]                | [L54-50-S290-R] |
| **PRO H(A)**     | [H42-20-S300-R(A)]                                           | [H54-100-S500-R(A)]              | [H54-200-S500-R(A)]             |                                |                 |
| **PRO M(A)**     | [M42-10-S260-R(A)]                                           | [M54-40-S250-R(A)]               | [M54-60-S250-R(A)]              |                                |                 |
| **PH**           | [PH42-020-S300-R]                                            | [PH54-100-S500-R]                | [PH54-200-S500-R]               |                                |                 |
| **PM**           | [PM54-060-S250-R]                                            | [PM54-040-S250-R]                | [PM42-010-S260-R]               |                                |                 |

`1` RX, DX, EX series are by default disabled and require [config.h](https://github.com/ROBOTIS-GIT/Dynamixel2Arduino/blob/master/src/utility/config.h#L6) modification in DYNAMIXEL2Arduino to be used.

# [Layout](#layout)

![](/assets/images/parts/interface/dynamixel_shield/pinmap.png)

The DYNAMIXEL Shield has the same pin position as Aruduino UNO. To find the pinout diagram, see [Arduino Offical page](https://www.arduino.cc/en/Main/Products).
{: .notice--warning}

| Pin No. |  Pin Name   |        Description        |
|:-------:|:-----------:|:-------------------------:|
|    0    | HW UART RX  |          DXL_RX           |
|    1    | HW UART TX  |          DXL_TX           |
|    2    | HW UART DIR |    DXL_DIR(DXL_TX_EN)     |
|    7    | SW UART RX  | `Caution2` SoftwareSerial |
|    8    | SW UART TX  | `Caution2` SoftwareSerial |

|      Item      |                 Description                 |          Note           |
|:--------------:|:-------------------------------------------:|:-----------------------:|
| DYNAMIXEL Port |           TTL, TTL(XL-320), RS485           |       `Caution3`        |
|  Power Switch  |   Power SW (DYNAMIXEL Port Power Switch)    |            -            |
|  UART Switch   | UART SW (Upload or DYNAMIXEL Select Switch) |       `Caution1`        |
|   Jumper Cap   |           Power Source Selection            | Read 'Connecting Power' |

-	DXL_RX (0), DXL_TX (1) : Hardware serial port to communicate with DYNAMIXEL.
- DXL_DIR(2) : Flow control of DYNAMIXEL packet.
- The hardware serial port is used to communicate with DYNAMIXEL, therefore, [RC-100] or [LN-101] has to be connected to the software serial communication port(SW TX/RX) via Arduino pin 7 and 8.

{% capture shield_01 %}
`Caution1` When uploading firmware using USB port, you should switch the UART SW(SW_2) to Upload mode. When you select the UART SW (SW_2) to DYNAMIXEL mode, you can use DYNAMIXEL but USB port.  
`Caution2` If you are using a board that does not support SoftwareSerial(like SAMD, etc..), you cannot use pins 7 and 8 for UART purposes.  
`Caution3` TTL, TTL (XL-320) and RS485 connectors are all connected in parallel in one serial.
{% endcapture %}
<div class="notice--warning">{{ shield_01 | markdownify }}</div>

## [Use of Serial Monitor with DYNAMIXEL Shield](#use-of-serial-monitor-with-dynamixel-shield)

DYNAMIXELShield uses serial pins (0,1) which are the same pins as Arduino Uno / Mega. When using the serial monitor, it may cause unexpected issue with data in the board due to a port conflict.  

In order to prevent the board from the port conflict, be sure to read [How to Use Serial Monitor with DYNAMIXEL Shield](#how-to-use-serial-monitor-with-dynamixel-shield) carefully. 

### [How to Use Serial Monitor with DYNAMIXEL Shield](#how-to-use-serial-monitor-with-dynamixel-shield)

Check the type of your arduino board, and select the either of listed solution to use Serial Monitor with DYNAMIXEL Shield. 

1. **[Recommanded] #define DEBUG_SERIAL**
- See #define DEBUG_SERIAL in the DynamixelShield Examples in Arduino.

2. **Use UART port of DYNAMIXEL Shield ( AVR 8 bit board including Uno / Mega boards)**
- AVR 8 bit boards, such as Uno, and Mega, can use the serial monitor by using DYNAMIXEL Shield's pins, which is read UART (See [Layout](#layout))

    **NOTE**: Be sure to use `SoftwareSerial` Library to use the serial port with DYNAMIXEL Shield and AVR 8 bit boards as the port is designed for the use of general pins. Prefered Comunication Modules: [BT-210](/docs/en/parts/communication/bt-410/), [BT-410](/docs/en/parts/communication/bt-210/), [LN-101](/docs/en/parts/interface/ln-101/).
    {: .notice}

3. **Use USB Port**
- When you use other arduino boards except Uno and Mega, use the serial monitor via USB port.

4. **Use USB to Serial converter**
- You can use either SoftwareSerial or HardwareSerial ways. See [Arduino Reference page of Serial](https://www.arduino.cc/reference/en/language/functions/communication/serial/), and determine your board whether or not it support either of ways (SoftwareSerial or HardwareSerial).
 
5. **Use UART Port**
- DYNAMIXEL Shield contains UART pins: 7(RX), 8(TX). They are only compatible with AVR 8 bit board, such as Uno and Mega boards. In order to use this port, use other HardwareSerial pins instead of 7(RX), 8(TX). To determine wheather boards has HardwareSerial, and its pin numbers see [Arduino Reference page of Comunication](https://www.arduino.cc/reference/en/language/functions/communication/serial/). 

# [Connecting Power](#connecting-power)

|                            Connect VIN                            |                          Disconnect VIN                           |
|:-----------------------------------------------------------------:|:-----------------------------------------------------------------:|
| ![](/assets/images/parts/interface/dynamixel_shield/power_01.png) | ![](/assets/images/parts/interface/dynamixel_shield/power_02.png) |

- The power input is divided as follows depending on whether the jumper cap is connected or not.
  1. Connect VIN : Power supply using with Arduino's SMPS connector
  2. Disconnect VIN : Power supply using DYNAMIXEL shield's power input connector. Can not use power from arduino.

- Since DYNAMIXEL power can not be connected to the USB power of the Arduino board, you need to connect the external power.
-	When using the power input connector, **be sure to check the polarity of the power supply**.

  ![](/assets/images/parts/interface/dynamixel_shield/power_polarity.png)


# [Switches](#switches)

![](/assets/images/parts/interface/dynamixel_shield/switches.png)

## [Upload Switch](#upload-switch)

-	For DYNAMIXEL control, the hardware serial port of the arduino board is used. Because the downloading is done to the same port, the two ports may collide. Therefore, to download, use serial port switch to move to upload position and download.
- After the download is completed, the switch must be moved to DYNAMIXEL position for DYNAMIXEL control. If it is not moved, DYNAMIXEL will not work.

## [DYNAMIXEL Power Switch](#dynamixel-power-switch)

-	It is a switch that can turn on / off the power of DYNAMIXEL connector.


# [DYNAMIXEL Shield Libraries](#dynamixel-shield-libraries)

DYNAMIXEL2Arduino Library : [GitHub Repository][DYNAMIXEL2Arduino GitHub repository]  
DYNAMIXEL Shield Library : [GitHub Repository][DYNAMIXEL Shield GitHub repository]

## [Features](#features)

- Compatible to Arduino boards
-	Support dynamixel protocol 1.0/2.0
- Up to 16 DYNAMIXEL's can be controlled (Typically, each motor(XL-320 or XL430-W250) consumes 0.4 ~ 0.6A of current)
- Support SynWrite function
- Support RC-100 library
- Serial communication using software serial library
- DYNAMIXEL Shield library(v0.1.0 or above) requires DYNAMIXEL2Arduino library

## [Install Library](#install-library)

There are three ways to add libraries to the Arduino IDE.

- Using the Library Manager
- Importing a .zip Library
- Manual installation

Each way is described in detail in the [Arduino Official Guide], so please refer to it if necessary.  
Below is an example of using the Library Manager.

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

- [syncRead()]{: .popup}
- [syncWrite()]{: .popup}
- [bulkRead()]{: .popup}
- [bulkWrite()]{: .popup}
- [getLastLibErrCode()]{: .popup}

#### [RobotisRemoteController Class](#robotisremotecontroller-class)

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

### [DynamixelShield(v0.0.5)](#dynamixelshieldv005)

**WARNING** : This version of DYNAMIXEL Shield API is deprecated and not maintained anymore.
{: .notice--warning}

```c
bool begin(uint32_t baud_rate = 57600, uint8_t protocol_version = DXL_PACKET_VER_2_0);

bool scan(void);
bool ping(uint8_t id = DXL_GLOBAL_ID);
bool addMotor(uint8_t id, uint8_t model);
bool setProtocolVersion(uint8_t version);
bool write(uint8_t id, uint16_t addr, uint8_t *p_data, uint16_t length, uint32_t timeout);
bool read(uint8_t id, uint16_t addr, uint8_t *p_data, uint16_t length, uint32_t timeout);

uint8_t getDxlCount(void);
uint8_t getDxlID(uint8_t index);
uint32_t getErr(void);
void clearErr(void);

bool reboot(uint8_t id);
bool reset(uint8_t id);

bool setID(uint8_t id, uint8_t new_id);
bool setBaud(uint8_t id, uint32_t new_baud);

bool ledOn(uint8_t id);
bool ledOff(uint8_t id);

bool torqueOn(uint8_t id);
bool torqueOff(uint8_t id);

bool setJointMode(uint8_t id);
bool setWheelMode(uint8_t id);

bool    setGoalPosition(uint8_t id, uint32_t position);
int32_t getGoalPosition(uint8_t id);
int32_t getCurPosition(uint8_t id);

bool    setGoalSpeed(uint8_t id, int32_t speed);
int32_t getGoalSpeed(uint8_t id);   
int32_t getCurSpeed(uint8_t id);  

bool    setGoalAngle(uint8_t id, int32_t angle);
int32_t getGoalAngle(uint8_t id);
int32_t getCurAngle(uint8_t id);

bool syncWriteBegin(void);
bool syncWriteEnd(void);
```

# [Reference](#reference)

## [DYNAMIXEL Connectors](#dynamixel-connectors)

|           Item           |                             TTL                              |                            RS-485                            |                            XL-320 (TTL)                             |
|:------------------------:|:------------------------------------------------------------:|:------------------------------------------------------------:|:-------------------------------------------------------------------:|
|          Pinout          |                `1` GND<br>`2` VDD<br>`3` DATA                |         `1` GND<br>`2` VDD<br>`3` DATA+<br>`4` DATA-         |                   `1` GND<br>`2` VDD<br>`3` DATA                    |
|         Diagram          |        ![](/assets/images/dxl/jst_b3beha_diagram.png)        |        ![](/assets/images/dxl/jst_b4beha_diagram.png)        |         ![](/assets/images/dxl/molex_532530370_diagram.png)         |
|         Housing          |   ![](/assets/images/dxl/JST_EHR-3.png)<br />[JST EHR-03]    |   ![](/assets/images/dxl/JST_EHR-4.png)<br />[JST EHR-04]    | ![](/assets/images/dxl/molex_510650300.png)<br />[MOLEX 51065-0300] |
|        PCB Header        | ![](/assets/images/dxl/JST_B3B_EH-A.png)<br />[JST B3B-EH-A] | ![](/assets/images/dxl/JST_B4B-EH-A.png)<br />[JST B4B-EH-A] | ![](/assets/images/dxl/molex_532530370.png)<br />[MOLEX 53253-0370] |
|      Crimp Terminal      |                     [JST SEH-001T-P0.6]                      |                     [JST SEH-001T-P0.6]                      |                         [MOLEX 50212-8000]                          |
| Wire Gauge for DYNAMIXEL |                            21 AWG                            |                            21 AWG                            |                               24 AWG                                |

{% include en/dxl/485_ttl_connection_x.md %}


# [Download](#download)

- [DYNAMIXEL Shield Schematic(PDF)](https://www.robotis.com/service/download.php?no=2206)
  ![](/assets/images/parts/interface/dynamixel_shield/dynamixel_shield_schematic01.png)
  ![](/assets/images/parts/interface/dynamixel_shield/dynamixel_shield_schematic02.png)


[AX-12W]: /docs/en/dxl/ax/ax-12w/
[AX-12+/12A]: /docs/en/dxl/ax/ax-12a/
[AX-18F/18A]: /docs/en/dxl/ax/ax-18a/
[DX-113]: /docs/en/dxl/dx/dx-113/
[DX-116]: /docs/en/dxl/dx/dx-116/
[DX-117]: /docs/en/dxl/dx/dx-117/
[EX-106+]: /docs/en/dxl/ex/ex-106+/
[RX-10]: /docs/en/dxl/rx/rx-10/
[RX-24F]: /docs/en/dxl/rx/rx-24f/
[RX-28]: /docs/en/dxl/rx/rx-28/
[RX-64]: /docs/en/dxl/rx/rx-64/
[MX-12W]: /docs/en/dxl/mx/mx-12w/
[MX-28]: /docs/en/dxl/mx/mx-28/
[MX-28(2.0)]: /docs/en/dxl/mx/mx-28-2/
[MX-64]: /docs/en/dxl/mx/mx-64/
[MX-64(2.0)]: /docs/en/dxl/mx/mx-64-2/
[MX-106]: /docs/en/dxl/mx/mx-106/
[MX-106(2.0)]: /docs/en/dxl/mx/mx-106-2/
[XL320]: /docs/en/dxl/x/xl320/
[XL430-W250]: /docs/en/dxl/x/xl430-w250/
[XL330-M077]: /docs/en/dxl/x/xl330-m077/
[XL330-M288]: /docs/en/dxl/x/xl330-m288/
[2XL430-W250]: /docs/en/dxl/x/2xl430-w250/
[XC430-W150]: /docs/en/dxl/x/xc430-w150/
[XC430-W240]: /docs/en/dxl/x/xc430-w240/
[XC430-T150BB]: /docs/en/dxl/x/xc430-t150bb/
[XC430-T240BB]: /docs/en/dxl/x/xc430-t240bb/
[2XC430-W250]: /docs/en/dxl/x/2xc430-w250/
[XC330-T288]: /docs/en/dxl/x/xc330-t288
[XC330-T181]: /docs/en/dxl/x/xc330-t181
[XC330-M288]: /docs/en/dxl/x/xc330-m288
[XC330-M181]: /docs/en/dxl/x/xc330-m181
[XM430-W210]: /docs/en/dxl/x/xm430-w210/
[XM430-W350]: /docs/en/dxl/x/xm430-w350/
[XH430-W210]: /docs/en/dxl/x/xh430-w210/
[XM540-W150]: /docs/en/dxl/x/xm540-w150/
[XM540-W270]: /docs/en/dxl/x/xm540-w270/
[XH430-W350]: /docs/en/dxl/x/xh430-w350/
[XH430-V210]: /docs/en/dxl/x/xh430-v210/
[XH430-V350]: /docs/en/dxl/x/xh430-v350/
[XH540-W150]: /docs/en/dxl/x/xh540-w150/
[XH540-W270]: /docs/en/dxl/x/xh540-w270/
[XH540-V150]: /docs/en/dxl/x/xh540-v150/
[XH540-V270]: /docs/en/dxl/x/xh540-v270/
[XD540-T270-R]: /docs/en/dxl/x/xd540-t270
[XD540-T150-R]: /docs/en/dxl/x/xd540-t150
[XD430-T350-R]: /docs/en/dxl/x/xd430-t350
[XD430-T210-R]: /docs/en/dxl/x/xd430-t210
[XW430-T333-R]: /docs/en/dxl/x/xw430-t333
[XW430-T200-R]: /docs/en/dxl/x/xw430-t200
[XW540-T260-R]: /docs/en/dxl/x/xw540-t260/
[XW540-T140-R]: /docs/en/dxl/x/xw540-t140/
[H54-200-S500-R]: /docs/en/dxl/pro/h54-200-s500-r/
[H54-100-S500-R]: /docs/en/dxl/pro/h54-100-s500-r/
[H42-20-S300-R]: /docs/en/dxl/pro/h42-20-s300-r/
[M54-60-S250-R]: /docs/en/dxl/pro/m54-60-s250-r/
[M54-40-S250-R]: /docs/en/dxl/pro/m54-40-s250-r/
[M42-10-S260-R]: /docs/en/dxl/pro/m42-10-s260-r/
[H54-200-S500-R(A)]: /docs/en/dxl/pro/h54-200-s500-ra/
[H54-100-S500-R(A)]: /docs/en/dxl/pro/h54-100-s500-ra/
[H42-20-S300-R(A)]: /docs/en/dxl/pro/h42-20-s300-ra/
[M54-60-S250-R(A)]: /docs/en/dxl/pro/m54-60-s250-ra/
[M54-40-S250-R(A)]: /docs/en/dxl/pro/m54-40-s250-ra/
[M42-10-S260-R(A)]: /docs/en/dxl/pro/m42-10-s260-ra/
[L54-50-S500-R]: /docs/en/dxl/pro/l54-50-s500-r/
[L54-50-S290-R]: /docs/en/dxl/pro/l54-50-s290-r/
[L54-30-S500-R]: /docs/en/dxl/pro/l54-30-s500-r/
[L54-30-S400-R]: /docs/en/dxl/pro/l54-30-s400-r/
[L42-10-S300-R]: /docs/en/dxl/pro/l42-10-s300-r/
[PH42-020-S300-R]: /docs/en/dxl/p/ph42-020-s300-r/
[PH54-100-S500-R]: /docs/en/dxl/p/ph54-100-s500-r/
[PH54-200-S500-R]: /docs/en/dxl/p/ph54-200-s500-r/
[PM54-060-S250-R]: /docs/en/dxl/p/pm54-060-s250-r/
[PM54-040-S250-R]: /docs/en/dxl/p/pm54-040-s250-r/
[PM42-010-S260-R]: /docs/en/dxl/p/pm42-010-s260-r/

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
[read()]: /docs/en/popup/arduino_api/rc100_read/
[peek()]: /docs/en/popup/arduino_api/peek/
[flush()]: /docs/en/popup/arduino_api/flush/
[write()]: /docs/en/popup/arduino_api/rc100_write/
[JST EHR-03]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST EHR-04]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST B3B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST B4B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST SEH-001T-P0.6]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[MOLEX 51065-0300]: https://www.molex.com/molex/products/datasheet.jsp?part=active/0510650300_CRIMP_HOUSINGS.xml&channel=Product
[MOLEX 53253-0370]: https://www.molex.com/molex/products/datasheet.jsp?part=active/0532530370_PCB_HEADERS.xml
[MOLEX 50212-8000]: https://www.molex.com/molex/products/datasheet.jsp?part=active/0502128000_CRIMP_TERMINALS.xml