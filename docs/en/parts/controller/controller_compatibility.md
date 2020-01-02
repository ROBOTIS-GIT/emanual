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

| Baudrate(bps) | [CM-5] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04] | [OpenCR] |
|:-------------:|:------:|:--------:|:--------:|:--------:|:--------:|:--------:|:------------:|:--------:|
|     9600      |   O    |    O     |    O     |    O     |    O     |    O     |      O       |    O     |
|     57600     |   O    |    O     |    O     |    O     |    O     |    O     |      O       |    O     |
|    115200     |   O    |    O     |    O     |    O     |    O     |    O     |      O       |    O     |
|      1M       |   O    |    O     |    O     |    O     |    O     |    O     |      O       |    O     |
|      2M       |   X    |    X     |    X     |    O     |    X     |    X     |      X       |    O     |
|      3M       |   X    |    X     |    X     |    O     |    X     |    X     |      X       |    O     |
|      4M       |   X    |    X     |    X     |    X     |    X     |    X     |      X       |    O     |
|     4.5M      |   X    |    X     |    X     |    X     |    X     |    X     |      X       |    O     |


# [Compatibility Table](#compatibility-table)

## [DYNAMIXEL](#dynamixel)

|      Model       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
|    AX Series     |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
|    DX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
|    RX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
|    EX Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
|  MX Series(TTL)  |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
| MX Series(RS485) |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    O     |             X(O)             |      X      |    O     |
|      XL-320      |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    O     |             O(X)             |      X      |    X     |
|    2XL Series    |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |             X(O)             |      X      |    O     |
|    XL Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |             X(O)             |      X      |    O     |
|    XM Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |             X(O)             |      X      |    O     |
|    XH Series     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    O     |    X     |    X     |             X(O)             |      X      |    O     |
|    PRO Series    |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    O     |    X     |             X(O)             |      X      |    O     |



## [Parts](#parts)

|                  Model                   | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:----------------------------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
|           Bioloid Serial Cable           |   O    |    X    |    X     |    X     |    X     |    O     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|                 Mini USB                 |   X    |    X    |    X     |    X     |    X     |    X     |    O     |    X     |    X     |    X     |              X               |      X      |    X     |
|               Micro USB(B)               |   X    |    X    |    X     |    O     |    X     |    X     |    X     |    O     |    X     |    O     |              O               |      O      |    O     |
|                  LN-101                  |   X    |    X    |    O     |    O     |    O     |    X     |    X     |    O     |    O     |    O     |              O               |      O      |    O     |
|                 IRSS-10                  |   X    |    X    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|           TS-10(Touch Sensor)            |   X    |    X    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|         DMS-80 (Distance Sensor)         |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|             IR Array Sensor              |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    X     |              O               |      X      |    O     |
|           GS-12 (Gyro Sensor)            |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    O     |              O               |      O      |    O     |
|           CS-10 (Color Sensor)           |   X    |    X    |    X     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
|        MGSS-10 (Magnetic Sensor)         |   X    |    X    |    X     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
|          PIR-10 (Motion Sensor)          |   X    |    X    |    X     |    O     |    O     |    O     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
|       TPS-10 (Temperature Sensor)        |   X    |    X    |    X     |    O     |    O     |    O     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
| TMS-10 (Temperature and Moisture sensor) |   X    |    X    |    X     |    O     |    O     |    X     |    O     |    X     |    X     |    O     |              O               |      O      |    O     |
|        AX-S1 (Integrated Sensor)         |   O    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    X     |              O               |      X      |    O     |
|           SM-10 (Servo Motor)            |   X    |    X    |    O     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
|          GM-10A (Geared Motor)           |   X    |    X    |    O     |    O     |    O     |    X     |    X     |    X     |    X     |    O     |              O               |      O      |    O     |
|          High Speed Geared Moto          |   X    |    O    |    O     |    O     |    X     |    X     |    X     |    X     |    X     |    O     |              O               |      O      |    O     |
|          Low Speed Geared Motor          |   X    |    O    |    O     |    O     |    X     |    X     |    X     |    X     |    X     |    O     |              O               |      O      |    O     |
|            LM-10 (LED Module)            |   X    |    O    |    O     |    O     |    O     |    X     |    O     |    O     |    X     |    O     |              O               |      O      |    O     |
|                IR Sensor                 |   X    |    X    |    O     |    O     |    X     |    O     |    O     |    X     |    O     |    X     |              O               |      X      |    O     |
|                 ZIG-100                  |   O    |    O    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|                 ZIG-110A                 |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|                 BT-110A                  |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|                  BT-210                  |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|                  BT-410                  |   X    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |
|      LB-04 Series (Li-ion Battery)       |   X    |    X    |    X     |    O     |    O     |    X     |    X     |    X     |    X     |    O     |              X               |      O      |    X     |
|                11.1V LiPo                |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    O     |    O     |    X     |              O               |      X      |    O     |
|                9.6V NiMH                 |   O    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|                 OBB-10A                  |   X    |    X    |    O     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|                 ABB-030                  |   X    |    X    |    X     |    X     |    O     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|                  LFU-10                  |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    O     |    O     |    X     |              O               |      X      |    O     |
|                   FU-5                   |   O    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|               User Device                |   X    |    O    |    X     |    O     |    O     |    O     |    O     |    O     |    O     |    O     |              O               |      O      |    O     |

`1` IR Receiver with OpenCM 9.04 is not supported on R+Task

## [Software](#software)

### [R+ 1.0](#r-10)

|      Model       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
|  [R+ Task 1.0]   |   O    |    X    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
| [R+ Manager 1.0] |   O    |    X    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
| [R+ Motion  1.0] |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |

R+ Manager 1.0 only supports a firmware update or restore of controllers, but it isn't possible to read control table of controller via R+ Manager 1.0.
{: .notice--info}

### [R+ 2.0](#r-20)

|      Model       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
|  [R+ Task 2.0]   |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
| [R+ Manager 2.0] |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
| [R+ Motion 2.0]  |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |

### [R+ 3.0](#r-30)

|     Model     | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:-------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
| [R+ Task 3.0] |   O    |    O    |    O     |    O     |    O     |    O     |    O     |    O     |    O     |    X     |             O(X)             |      O      |    X     |


### [R+ Mobile](#r-mobile)

|      Model       | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:----------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
|   [R+ m.Task]    |   O    |    O    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      O      |    X     |
| [R+ m.Task 2.0]  |   O    |    O    |    X     |    O     |    O     |    O     |    O     |    X     |    X     |    X     |             O(X)             |      O      |    X     |
| [R+ m.Mtion 2.0] |   O    |    X    |    X     |    X     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
|  [R+ m.Design]   |   O    |    X    |    O     |    O     |    O     |    O     |    O     |    X     |    X     |    X     |             O(X)             |      X      |    X     |

### [R+ Mobile (STEAM KIT)](#r-mobile-steam-kit)

|             Model              | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:------------------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
| R+ SMART <br> ( I / II / III ) |   X    |    X    |    X     |    X     |    O     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|           [R+ Blcok]           |   X    |    O    |    X     |    O     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      O      |    X     |
|             R+ IoT             |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      O      |    X     |
|         [R+ Play 700]          |   X    |    O    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|         [ROBOTIS MINI]         |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |             O(X)             |      X      |    X     |

R+ SMART and R+IoT aren't released yet.
{: .notice--info}


### [etc](#etc)

|             Model             | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:-----------------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
|         [R+ Scratch]          |   X    |    O    |    X     |    O     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      O      |    X     |
|         [OpenCM IDE]          |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              O               |      X      |    X     |
|        [DYNAMIXEL SDK]        |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              O               |      X      |    O     |
|     [DYNAMIXEL Workbench]     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              O               |      X      |    O     |
|      [DYNAMIXEL Wizard]       |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
|    [DYNAMIXEL Wizard 2.0]     |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    X     |
| [ROBOTIS Manipulator library] |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      X      |    O     |
| [Embeded SDK(CM-510/530/700)] |   X    |    X    |    X     |    X     |    X     |    O     |    O     |    X     |    O     |    X     |              X               |      X      |    X     |
|          Arduino IDE          |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              O               |      X      |    O     |

{% capture etc %}
- Users can build their own manipulator with ROBOTIS Manipulator library offerd by ROBOTIS.
- Users can build there own firmware of CM-510/530/700 with Embeded SDK offerd by ROBOTIS.
{% endcapture %}
<div class="notice--info">{{ etc | markdownify }}</div>

[ln-101]: /docs/en/parts/interface/ln-101/
[CM-5]: /docs/en/parts/controller/cm-5/
[CM-50]: /docs/en/parts/controller/cm-100/
[CM-100]: /docs/en/parts/controller/cm-100/
[CM-150]: /docs/en/parts/controller/cm-150/
[CM-200]: /docs/en/parts/controller/cm-200/
[CM-510]: /docs/en/parts/controller/cm-510/
[CM-530]: /docs/en/parts/controller/cm-530/
[CM-550]: /docs/en/parts/controller/cm-550/
[CM-700]: /docs/en/parts/controller/cm-700/
[CM-900]: /docs/en/parts/controller/cm-900/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
[OpenCM7.0]: /docs/kr/parts/controller/opencm7/
[485 EXP]: /docs/en/parts/controller/opencm485exp/
[OpenCR]: /docs/en/parts/controller/opencr10/
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
