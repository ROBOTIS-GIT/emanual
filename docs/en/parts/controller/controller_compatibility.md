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

# Supported Baudrates for Dynamixel


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


# Compatibility

## Dynamixel

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



## Parts

|                   Model                   | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
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

## Software

### R+ 1.0

|         Model          | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:---------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
| R+ Task 1.0 |   O    |    X    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
| R+ Manager 1.0 |   O    |    X    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
| R+ Motion  1.0  |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |

### R+ 2.0

|         Model          | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:---------------------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
| R+ Task 2.0 |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
| R+ Manage 2.0 |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |
| R+ Motion 2.0  |   O    |    X    |    X     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      X      |    X     |

### etc

|    Model    | [CM-5] | [CM-50] | [CM-100] | [CM-150] | [CM-200] | [CM-510] | [CM-530] | [CM-550] | [CM-700] | [CM-900] | [OpenCM9.04]<br>(+[485 EXP]) | [OpenCM7.0] | [OpenCR] |
|:-----------:|:------:|:-------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:--------:|:----------------------------:|:-----------:|:--------:|
| R+ Task 3.0 |   O    |    O    |    O     |    O     |    O     |    O     |    O     |    X     |    O     |    X     |             O(X)             |      O      |    X     |
| OpenCM IDE  |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              O               |      X      |    X     |
| Arduino IDE |   X    |    X    |    X     |    X     |    X     |    X     |    X     |    X     |    X     |    X     |              O               |      O      |    O     |
| Scratch2.0  |   X    |    X    |    X     |    O     |    X     |    X     |    X     |    X     |    X     |    X     |              X               |      O      |    X     |




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
[OpenCM7.0]: /docs/en/parts/controller/opencm7/
[485 EXP]: /docs/en/parts/controller/opencm485exp/
[OpenCR]: /docs/en/parts/controller/opencr10/
