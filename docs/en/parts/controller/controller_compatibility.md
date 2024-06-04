---
layout: archive
lang: en
ref: controller_compatibility
read_time: true
share: true
author_profile: false
permalink: /docs/en/parts/controller/controller_compatibility/
sidebar:
  title: Controller compatibility
  nav: "controller_compatibility"
---

# [Supported Baudrates for DYNAMIXEL](#supported-baudrates-for-dynamixel)

| Baudrate(bps) | [CM-5] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04] | [OpenCR] | [OpenRB-150] |
|:-------------:|:------:|:--------:|:--------:|:--------:|:--------:|:--------:|:------------:|:--------:|:------------:|
|     9600      |   ✓    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |      ✓       |    ✓     |      ✓       |
|     57600     |   ✓    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |      ✓       |    ✓     |      ✓       |
|    115200     |   ✓    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |      ✓       |    ✓     |      ✓       |
|      1M       |   ✓    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |      ✓       |    ✓     |      ✓       |
|      2M       |   X    |    X     |    X     |    ✓     |    X     |    X     |      X       |    ✓     |      X       |
|      3M       |   X    |    X     |    X     |    ✓     |    X     |    X     |      X       |    ✓     |      X       |
|      4M       |   X    |    X     |    X     |    X     |    X     |    X     |      X       |    ✓     |      X       |
|     4.5M      |   X    |    X     |    X     |    X     |    X     |    X     |      X       |    ✓     |      X       |


# [Compatibility Table](#compatibility-table)

## [DYNAMIXEL](#dynamixel)

|      Model       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-151] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 EXP]) | [OpenCM7.0] | [OpenCR] | [OpenRB-150] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:-----------------------------------:|:-----------:|:--------:|:------------:|
|    AX Series     |   ✓    |    X    |    X     |    X     |    X     |    X     |    ✓     |    ✓     |    X     |    ✓     |    ✓     |                X(✓)                  |      X      |    ✓     |      ✓       |
|    DX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |    ✓     |                X(✓)                  |      X      |    ✓     |      X       |
|    RX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |    ✓     |                X(✓)                  |      X      |    ✓     |      X       |
|    EX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |    ✓     |                X(✓)                  |      X      |    ✓     |      X       |
|  MX Series(TTL)  |   ✓    |    X    |    X     |    X     |    X     |    X     |    ✓     |    ✓     |    X     |    ✓     |    ✓     |                X(✓)                  |      X      |    ✓     |      ✓       |
| MX Series(RS485) |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |    ✓     |                X(✓)                  |      X      |    ✓     |O([Comm Bridge])|
|      XL-320      |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |                ✓(X)                 |      X      |    X     |      ✓       |
|    XL Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |    X     |    X     |                X(✓)                  |      X      |    ✓     |      ✓       |
|    XC Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |    X     |    X     |                X(✓)                  |      X      |    ✓     |      ✓       |
|    XM Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |    X     |    X     |                X(✓)                  |      X      |    ✓     |      ✓       |
|    XH Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |    X     |    X     |                X(✓)                  |      X      |    ✓     |      ✓       |
|    XD Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |    X     |    X     |                X(✓)                  |      X      |    ✓     |O([Comm Bridge])|
|    XW Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |    X     |    X     |                X(✓)                  |      X      |    ✓     |O([Comm Bridge])|
|    PRO Series    |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    ✓     |    X     |                X(✓)                  |      X      |    ✓     |O([Comm Bridge])|

**NOTE**: OpenCM9.04 with OpenCM 485 EXP can use all types of DYNAMIXEL.
{: .notice}


## [Parts](#parts)

|                  Model                   | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-151] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:----------------------------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:-----------------------------------:|:-----------:|:--------:|
|           Bioloid Serial Cable           |   ✓    |    X    |    X     |    X     |    X     |    X     |    ✓     |    X     |    X     |    X     |    X     |                  X                  |      X      |    X     |
|                 Mini USB                 |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    ✓     |    X     |    X     |    X     |                  X                  |      X      |    X     |
|               Micro USB(B)               |   X    |    X    |    X     |    ✓     |    ✓     |    X     |    X     |    X     |    ✓     |    X     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|                  LN-101                  |   X    |    X    |    ✓     |    ✓     |    ✓     |    ✓     |    X     |    X     |    ✓     |    ✓     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|                 IRSS-10                  |   X    |    X    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|           TS-10(Touch Sensor)            |   X    |    X    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|         DMS-80 (Distance Sensor)         |   X    |    X    |    X     |    X     |    X     |    X     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|             IR Array Sensor              |   ✓    |    X    |    X     |    X     |    X     |    X     |    ✓     |    ✓     |    X     |    ✓     |    X     |                  ✓                  |      X      |    ✓     |
|           GS-12 (Gyro Sensor)            |   X    |    X    |    X     |    X     |    X     |    X     |    ✓     |    ✓     |    X     |    ✓     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|           CS-10 (Color Sensor)           |   X    |    X    |    X     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    ✓     |    X     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|        MGSS-10 (Magnetic Sensor)         |   X    |    X    |    X     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    ✓     |    X     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|          PIR-10 (Motion Sensor)          |   X    |    X    |    X     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|       TPS-10 (Temperature Sensor)        |   X    |    X    |    X     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |                  ✓                  |      ✓      |    ✓     |
| TMS-10 (Temperature and Moisture sensor) |   X    |    X    |    X     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    ✓     |    X     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|        AX-S1 (Integrated Sensor)         |   ✓    |    X    |    X     |    X     |    X     |    X     |    ✓     |    ✓     |    X     |    ✓     |    X     |                  ✓                  |      X      |    ✓     |
|           SM-10 (Servo Motor)            |   X    |    X    |    ✓     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    ✓     |    X     |    ✓     |                  X                  |      ✓      |    ✓     |
|          GM-10A (Geared Motor)           |   X    |    X    |    ✓     |    ✓     |    ✓     |    ✓     |    X     |    X     |    X     |    X     |    ✓     |                  X                  |      ✓      |    ✓     |
|         High Speed Geared Motor          |   X    |    ✓    |    ✓     |    ✓     |    ✓     |    X     |    X     |    X     |    X     |    X     |    ✓     |                  X                  |      ✓      |    ✓     |
|          Low Speed Geared Motor          |   X    |    ✓    |    ✓     |    ✓     |    ✓     |    X     |    X     |    X     |    X     |    X     |    ✓     |                  X                  |      ✓      |    ✓     |
|            LM-10 (LED Module)            |   X    |    ✓    |    ✓     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    ✓     |    X     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|                IR Sensor                 |   X    |    X    |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    ✓     |    ✓     |    ✓     |    X     |                  ✓                  |      X      |    ✓     |
|                 ZIG-100                  |   ✓    |    ✓    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  X                  |      X      |    X     |
|                 ZIG-110A                 |   X    |    ✓    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|                 BT-110A                  |   X    |    ✓    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|                  BT-210                  |   X    |    ✓    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|                  BT-410                  |   X    |    ✓    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |                  ✓                  |      ✓      |    ✓     |
|      LB-04 Series (Li-ion Battery)       |   X    |    X    |    X     |    ✓     |    ✓     |    ✓     |    X     |    X     |    X     |    X     |    ✓     |                  X                  |      ✓      |    X     |
|                11.1V LiPo                |   X    |    X    |    X     |    X     |    X     |    X     |    ✓     |    ✓     |    ✓     |    ✓     |    X     |                  ✓                  |      X      |    ✓     |
|                9.6V NiMH                 |   ✓    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  X                  |      X      |    X     |
|                 OBB-10A                  |   X    |    X    |    ✓     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  X                  |      X      |    X     |
|                 ABB-030                  |   X    |    X    |    X     |    X     |    X     |    ✓     |    X     |    X     |    X     |    X     |    X     |                  X                  |      X      |    X     |
|                  LFU-10                  |   X    |    X    |    X     |    X     |    X     |    X     |    ✓     |    ✓     |    ✓     |    ✓     |    X     |                  ✓                  |      X      |    ✓     |
|                   FU-5                   |   ✓    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  X                  |      X      |    X     |
|               User Device                |   X    |    ✓    |    X     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |                  ✓                  |      ✓      |    ✓     |

`1` IR Receiver with OpenCM 9.04 is not supported on R+Task

## [Software](#software)

### [R+ 1.0](#r-10)

|      Model       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-151] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:-----------------------------------:|:-----------:|:--------:|
|  [R+ Task 1.0]   |   ✓    |    X    |    ✓     |    ✓     |    X     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    X     |                ✓(X)                 |      X      |    X     |
| [R+ Manager 1.0] |   ✓    |    X    |    ✓     |    ✓     |    X     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    X     |                ✓(X)                 |      X      |    X     |
| [R+ Motion  1.0] |   ✓    |    X    |    X     |    ✓     |    X     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    X     |                ✓(X)                 |      X      |    X     |

{% capture notice_01 %}
**NOTE**: 
- R+ Manager 1.0 only supports a firmware update or restore of a controller, but it isn't possible to read control table of a controller via R+ Manager 1.0.
- Use R+ Manager 2.0 to read control table of a controller.
  - If a controller is not compatible with R+Manager 2.0, use R+Manager 1.0.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify}}</div>

### [R+ 2.0](#r-20)

|      Model       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-151] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:-----------------------------------:|:-----------:|:--------:|
|  [R+ Task 2.0]   |   ✓    |    ✓    |    ✓     |    ✓     |    X     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    X     |                ✓(X)                 |      X      |    X     |
| [R+ Manager 2.0] |   ✓    |    X    |    X     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    X     |                ✓(X)                 |      X      |    X     |
| [R+ Motion 2.0]  |   ✓    |    X    |    X     |    ✓     |    X     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    X     |                ✓(X)                 |      X      |    X     |

### [R+ 3.0](#r-30)

|     Model     | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-151] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:-------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:-----------------------------------:|:-----------:|:--------:|
| [R+ Task 3.0] |   ✓    |    ✓    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    X     |                ✓(X)                 |      ✓      |    X     |


### [R+ Mobile](#r-mobile)

|      Model       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-151] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:-----------------------------------:|:-----------:|:--------:|
|   [R+ m.Task]    |   ✓    |    ✓    |    ✓     |    ✓     |    X     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    X     |                ✓(X)                 |      ✓      |    X     |
| [R+ m.Task 2.0]  |   ✓    |    ✓    |    X     |    ✓     |    X     |    ✓     |    ✓     |    ✓     |    X     |    X     |    X     |                ✓(X)                 |      ✓      |    X     |
| [R+ m.Motion 2.0] |   ✓    |    X    |    X     |    X     |    X     |    ✓     |    ✓     |    ✓     |    X     |    ✓     |    X     |                ✓(X)                 |      X      |    X     |
|  [R+ m.Design]   |   ✓    |    X    |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    ✓     |    X     |    X     |    X     |                ✓(X)                 |      X      |    X     |

### [R+ Mobile (STEAM KIT)](#r-mobile-steam-kit)

|             Model              | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-151] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:------------------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:-----------------------------------:|:-----------:|:--------:|
| R+ SMART <br> ( I / II / III ) |   X    |    X    |    X     |    X     |    X     |    ✓     |    X     |    X     |    X     |    X     |    X     |                  X                  |      X      |    X     |
|           [R+ Block]           |   X    |    ✓    |    X     |    ✓     |    ✓     |    X     |    X     |    X     |    X     |    X     |    X     |                  X                  |      ✓      |    X     |
|             R+ IoT             |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  X                  |      ✓      |    X     |
|         [R+ Play 700]          |   X    |    ✓    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  X                  |      X      |    X     |
|         [ROBOTIS MINI]         |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                ✓(X)                 |      X      |    X     |


[How to install ROBOTIS virtual COM port for Windows]: /docs/en/popup/usb_driver_install/

### [etc](#etc)

|             Model             | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-151] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[OpenCM 485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:-----------------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:-----------------------------------:|:-----------:|:--------:|
|         [R+ Scratch]          |   X    |    ✓    |    X     |    ✓     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  X                  |      ✓      |    X     |
|         [OpenCM IDE]          |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  ✓                  |      X      |    X     |
|        [DYNAMIXEL SDK]        |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  ✓                  |      X      |    ✓     |
|     [DYNAMIXEL Workbench]     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  ✓                  |      X      |    ✓     |
|      [DYNAMIXEL Wizard]       |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  X                  |      X      |    X     |
|    [DYNAMIXEL Wizard 2.0]     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  X                  |      X      |    ✓     |
| [ROBOTIS Manipulator library] |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  X                  |      X      |    ✓     |
| [Embeded SDK(CM-510/530/700)] |   X    |    X    |    X     |    X     |    X     |    X     |    ✓     |    ✓     |    X     |    ✓     |    X     |                  X                  |      X      |    X     |
Z          Arduino IDE          |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |                  ✓                  |      X      |    ✓     |

{% capture etc %}
- Users can build their own manipulator with ROBOTIS Manipulator library offerd by ROBOTIS.
- Users can build there own firmware of CM-510/530/700 with Embeded SDK offerd by ROBOTIS.
{% endcapture %}
<div class="notice--info">{{ etc | markdownify }}</div>

[ln-101]: /docs/en/parts/interface/ln-101/
[CM-5]: /docs/en/parts/controller/cm-5/
[CM-50]: /docs/en/parts/controller/cm-50/
[CM-100]: /docs/en/parts/controller/cm-100/
[CM-150]: /docs/en/parts/controller/cm-150/
[CM-151]: /docs/en/parts/controller/cm-151/
[CM-200]: /docs/en/parts/controller/cm-200/
[CM-510]: /docs/en/parts/controller/cm-510/
[CM-530]: /docs/en/parts/controller/cm-530/
[CM-550]: /docs/en/parts/controller/cm-550/
[CM-700]: /docs/en/parts/controller/cm-700/
[CM-900]: /docs/en/parts/controller/cm-900/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
[OpenCM7.0]: /docs/kr/parts/controller/opencm7/
[OpenCM 485 EXP]: /docs/en/parts/controller/opencm485exp/
[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenRB-150]: /docs/en/parts/controller/openrb-150/
[Comm Bridge]: /docs/en/parts/interface/dxl_bridge/
[R+ Task 1.0]: /docs/en/software/rplus1/task/getting_started/
[R+ Manager 1.0]: /docs/en/software/rplus1/manager/
[R+ Motion  1.0]: /docs/en/software/rplus1/motion/
[R+ Task 2.0]: /docs/en/software/rplus2/task/
[R+ Manager 2.0]: /docs/en/software/rplus2/manager/
[R+ Motion 2.0]: /docs/en/software/rplus2/motion/
[R+ Task 3.0]: /docs/en/software/rplustask3/
[R+ IoT]: /docs/kr/software/mobile_app/rplusiot/
[R+ Blcok]: /docs/en/software/rplus2/rplus2_block/
[R+ m.Task]: /docs/en/software/rplus_mobile/mtask/
[R+ m.Task 2.0]: /docs/en/software/rplus_mobile/mtask20/
[R+ m.Mtion 2.0]: /docs/en/software/rplus_mobile/mmotion/
[R+ m.Design]: /docs/en/software/rplus_mobile/mdesign/
[R+ SMART]: /docs/kr/software/mobile_app/rplussmart/
[R+ Play 700]: /docs/en/edu/play/play-700/#quick-start
[ROBOTIS MINI]: /docs/en/software/mobile_app/mini_app/
[R+ Scratch]: /docs/en/software/rplus2/scratch/
[OpenCM IDE]: /docs/en/software/opencm_ide/getting_started/              
[DYNAMIXEL SDK]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[DYNAMIXEL Workbench]: /docs/en/software/dynamixel/dynamixel_workbench/
[DYNAMIXEL Wizard]: /docs/en/software/rplus1/dynamixel_wizard/
[DYNAMIXEL Wizard 2.0]: /docs/en/software/dynamixel/dynamixel_wizard2/
[Embeded SDK(CM-510/530/700)]: /docs/en/software/embedded_sdk/
[ROBOTIS Manipulator library]: /docs/en/software/robotis_manipulator_libs/
