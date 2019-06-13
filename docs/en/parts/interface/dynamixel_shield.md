---
layout: archive
lang: en
ref: dynamixel_shield
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/interface/dynamixel_shield/
sidebar:
  title: Dynamixel Shield
  nav: "dynamixel_shield"
---

# [Introduction](#introduction)
![](/assets/images/parts/interface/dynamixel_shield/with_arduino.png)

Dynamixel Shield  was created to use RC100 and Dynamixel on arduino board. We provide dynamixel library for Dynamixel Shield, it can help you to use Dynamixel easily.

**This product does not contain Arduino Uno. Arduino Uno should be purchased separately.**
{: .notice--warning}

# [Specifications](#specifications)

|       Item        |               Details                |
|:-----------------:|:------------------------------------:|
| Operating Voltage | 7.4V (XL-320) ~ 24V (PRO / X Series) |
|  Maximum Current  | 1A(Arduino), 10A(Terminal Connector) |

## [Supported DYNAMIXEL](#supported-dynamixel)

| DYNAMIXEL Series |                                |                                |                                |                                |                 |
|:-----------------|:-------------------------------|:-------------------------------|:-------------------------------|:-------------------------------|:----------------|
| **AX**           | [AX-12W]                       | [AX-12+/12A]                   | [AX-18F/18A]                   |                                |                 |
| **RX** `1`       | [RX-10]                        | [RX-24F]                       | [RX-28]                        | [RX-64]                        |                 |
| **DX** `1`       | [DX-113]                       | [DX-116]                       | [DX-117]                       |                                |                 |
| **EX** `1`       | [EX-106+]                      |                                |                                |                                |                 |
| **MX**           | [MX-12W]                       | [MX-28], [MX-28(2.0)]          | [MX-64], [MX-64(2.0)]          | [MX-106], [MX-106(2.0)]        |                 |
| **XL**           | [XL320]                        | [XL430-W250]                   |                                |                                |                 |
| **XM**           | [XM430-W210]                   | [XM430-W350]                   | [XM540-W150]                   | [XM540-W270]                   |                 |
| **XH**           | [XH430-W210]<br/> [XH430-W350] | [XH430-V210]<br/> [XH430-V350] | [XH540-W150]<br/> [XH540-W270] | [XH540-V150]<br/> [XH540-V270] |                 |
| **PRO H**        | [H42-20-S300-R]                | [H54-100-S500-R]               | [H54-200-S500-R]               |                                |                 |
| **PRO M**        | [M42-10-S260-R]                | [M54-40-S250-R]                | [M54-60-S250-R]                |                                |                 |
| **PRO L** `1`    | [L42-10-S300-R]                | [L54-30-S500-R]                | [L54-30-S400-R]                | [L54-50-S500-R]                | [L54-50-S290-R] |
| **PRO H(A)**     | [H42-20-S300-R(A)]             | [H54-100-S500-R(A)]            | [H54-200-S500-R(A)]            |                                |                 |
| **PRO M(A)**     | [M42-10-S260-R(A)]             | [M54-40-S250-R(A)]             | [M54-60-S250-R(A)]             |                                |                 |
| **PRO+ H**       | [H42P-020-S300-R]              | [H54P-100-S500-R]              | [H54P-100-S500-R]              |                                |                 |
| **PRO+ M**       | [M54P-060-S250-R]              | [M54P-040-S250-R]              | [M42P-010-S260-R]              |                                |                 |

`1` RX, DX, EX, PRO L series require additional configuration in the source code.

# [Layout](#layout)

![](/assets/images/parts/interface/dynamixel_shield/pinmap.png)

| Pin No. |  Pin Name  |        Description        |
|:-------:|:----------:|:-------------------------:|
|    0    | HW UART RX |          DXL_RX           |
|    1    | HW UART TX |          DXL_TX           |
|    7    | SW UART RX | `Caution2` SoftwareSerial |
|    8    | SW UART TX | `Caution2` SoftwareSerial |

|      Item      |                 Description                 |          Note           |
|:--------------:|:-------------------------------------------:|:-----------------------:|
| Dynamixel Port |           TTL, TTL(XL-320), RS485           |       `Caution3`        |
|  Power Switch  |   Power SW (Dynamixel Port Power Switch)    |            -            |
|  UART Switch   | UART SW (Upload or Dynamixel Select Switch) |       `Caution1`        |
|   Jumper Cap   |           Power Source Selection            | Read 'Connecting Power' |

-	Arduino pin #0/ #1 : Hardware serial port to control dynamixel
- Arduino pin #2 : Control pin to select dynamixel direction
- The hardware serial port is used for Dynamixel control, therefore, the serial communication has to be performed by connecting RC100 or LN101 to the software serial port which is assigned to Arduino pin 7 and 8.


{% capture shield_01 %}
`Caution1` When uploading firmware using USB port, you should switch the UART SW(SW_2) to Upload mode. When you select the UART SW (SW_2) to Dynamixel mode, you can use Dynamixel but USB port.  
`Caution2` If you are using a board that does not support SoftwareSerial(like SAMD, etc..), you cannot use pins 7 and 8 for UART purposes.  
`Caution3` TTL, TTL (XL-320) and RS485 connectors are all connected in parallel in one serial.
{% endcapture %}

<div class="notice--warning">{{ shield_01 | markdownify }}</div>

# [Connecting Power](#connecting-power)

|                                Connect VIN                                 |                               Disconnect VIN                               |
|:--------------------------------------------------------------------------:|:--------------------------------------------------------------------------:|
| ![](/assets/images/parts/interface/dynamixel_shield/power_01.png) | ![](/assets/images/parts/interface/dynamixel_shield/power_02.png) |

- The power input is divided as follows depending on whether the jumper cap is connected or not.
  1. Connect VIN : Power supply using with Arduino's SMPS connector
  2. Disconnect VIN : Power supply using Dynamixel shield's power input connector. Can not use power from arduino.

- Since the Dynamixel power can not be connected to the USB power of the Arduino board, you need to connect the external power.
-	When using the power input connector, **be sure to check the polarity of the power supply**.

  ![](/assets/images/parts/interface/dynamixel_shield/power_polarity.png)


# [Switches](#switches)

![](/assets/images/parts/interface/dynamixel_shield/switches.png)

## [Upload Switch](#upload-switch)

-	For Dynamixel control, the hardware serial port of the arduino board is used. Because the downloading is done to the same port, the two ports may collide. Therefore, to download, use serial port switch to move to upload position and download.
- After the download is completed, the switch must be moved to the Dynamixel position for Dynamixel control. If it is not moved, the Dynamixel will not work.

## [Dynamixel Power Switch](#dynamixel-power-switch)

-	It is a switch that can turn on / off the power of Dynamixel connector.


# [Arduino Shield Libraries](#arduino-shield-libraries)

## [Features](#features)

- Compatible to Arduino boards
-	Support dynamixel protocol 1.0/2.0
- Up to 16 Dynamixels can be controlled (Typically, each motor(XL-320 or XL430-W250) consumes 0.4 ~ 0.6A of current)
- Support SynWrite function
- Support RC100 library
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

In order to use DYNAMIXEL Shield library(v0.1.0 or above), DYNAMIXEL2Arduino library must be installed.

![](/assets/images/parts/interface/dynamixel_shield/library_manager_02.png)

![](/assets/images/parts/interface/dynamixel_shield/library_manager_03.png)

If you have successfully installed the library, you'll be able to find several examples of DynamixelShield in the examples.

![](/assets/images/parts/interface/dynamixel_shield/examples.png)


# [Library API](#library-api)

## [DYNAMIXELShield(v0.1.0 or above)](#dynamixelshieldv010-or-above)

**WARNING** : In order to use DYNAMIXEL Shield library(v0.1.0 or above), [DYNAMIXEL2Arduino library](#install-library) must be installed.
{: .notice--warning}

### [Dynamixel2Arduino Class](#dynamixel2arduino-class)

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

### [Master Class](#master-class)

Dynamixel2Arduino class inherits below public functions from the Master class.

- [syncRead()]{: .popup}
- [syncWrite()]{: .popup}
- [bulkRead()]{: .popup}
- [bulkWrite()]{: .popup}
- [getLastLibErrCode()]{: .popup}

### [RobotisRemoteController Class](#robotisremotecontroller-class)

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

## [DynamixelShield(v0.0.5)](#dynamixelshieldv005)

**WARNING** : This version of API is deprecated.
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
[H42P-020-S300-R]: /docs/en/dxl/pro_plus/h42p-020-s300-r/
[H54P-100-S500-R]: /docs/en/dxl/pro_plus/h54p-100-s500-r/
[H54P-200-S500-R]: /docs/en/dxl/pro_plus/h54p-200-s500-r/
[M54P-060-S250-R]: /docs/en/dxl/pro_plus/m54p-060-s250-r/
[M54P-040-S250-R]: /docs/en/dxl/pro_plus/m54p-040-s250-r/
[M42P-010-S260-R]: /docs/en/dxl/pro_plus/m42p-010-s260-r/

[Arduino Official Guide]: https://www.arduino.cc/en/Guide/Libraries
[GitHub repository]: https://github.com/ROBOTIS-GIT/Dynamixel2Arduino
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
[read()]: /docs/en/popup/arduino_api/read/
[peek()]: /docs/en/popup/arduino_api/peek/
[flush()]: /docs/en/popup/arduino_api/flush/
[write()]: /docs/en/popup/arduino_api/write/
