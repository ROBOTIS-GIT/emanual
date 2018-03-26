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

|Baudrate(bps)|[CM-5]|[CM-510]|[CM-530]|[CM-700]|[CM-900]|[OpenCM9.04]|[OpenCR]|
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|9600|O|O|O|O|O|O|O|
|57600|O|O|O|O|O|O|O|
|115200|O|O|O|O|O|O|O|
|1M|O|O|O|O|O|O|O|
|2M|X|X|X|X|X|X|O|
|3M|X|X|X|X|X|X|O|
|4M|X|X|X|X|X|X|O|
|4.5M|X|X|X|X|X|X|O|

# Compatibility

## Dynamixel

|Model|[CM-100]|[CM-150]|[CM-200]|[CM-5]|[CM-510]|[CM-530]|[CM-700]|[CM-900]|[OpenCM9.04]<br>(+[485 EXP])|[OpenCM7.0]|[OpenCR]|
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|AX Series|X|X|X|O|O|O|O|O|X(O)|X|O|
|DX Series|X|X|X|X|X|X|O|O|X(O)|X|O|
|RX Series|X|X|X|X|X|X|O|O|X(O)|X|O|
|EX Series|X|X|X|X|X|X|O|O|X(O)|X|O|
|MX Series(TTL)|X|X|X|O|O|O|O|O|X(O)|X|O|
|MX Series(RS485)|X|X|X|X|X|X|O|O|X(O)|X|O|
|XM Series|X|X|X|X|X|X|X|X|X(O)|X|O|
|XH Series|X|X|X|X|X|X|X|X|X(O)|X|O|
|XL-320|X|X|X|X|X|X|X|O|O(X)|X|O|
|PRO Series|X|X|X|X|X|X|O|X|X(O)|X|O|

## Parts

|Model|[CM-100]|[CM-150]|[CM-200]|[CM-5]|[CM-510]|[CM-530]|[CM-700]|[CM-900]|[OpenCM9.04]<br>(+[485 EXP])|[OpenCM7.0]|[OpenCR]|
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|Bioloid Serial Cable|X|X|X|O|O|X|X|X|X|X|X|
|Mini USB|X|X|X|X|X|O|X|X|X|X|X|
|Micro USB(B)|X|O|X|X|X|X|X|O|O(O)|O|O|
|LN-101|O|O|O|X|X|X|O|O|O(O)|O|O|
|IRSS-10|O|O|O|X|O|O|O|X|O(O)|O|O|
|TS-10|O|O|O|X|O|O|O|X|O(O)|O|O|
|DMS-80|X|X|X|X|O|O|O|X|O(O)|O|O|
|IR Array|X|X|X|O|O|O|O|O|X(O)|X|O|
|GS-12|X|X|X|X|O|O|O|X|O(O)|O|O|
|CS-10|X|O|O|X|X|O|X|X|O(O)|O|O|
|MGSS-10|X|O|O|X|X|O|X|X|O(O)|O|O|
|PIR-10|X|O|O|X|O|O|X|X|O(O)|O|O|
|TPS-10|X|O|O|X|O|O|X|X|O(O)|O|O|
|AX-S1|X|X|X|O|O|O|O|O|X(O)|X|O|
|SM-10|O|O|O|X|X|O|X|X|X|O|O|
|GM-10A|O|O|O|X|X|X|X|X|X|O|O|
|H-Spd Geared Motor|O|O|X|X|X|X|X|X|X|O|O|
|L-Spd Geared Motor|O|O|X|X|X|X|X|X|X|O|O|
|LM-10|O|O|O|X|X|O|X|X|O(O)|O|O|
|IR Receiver|O|O|X|X|O|O|O|X|X|X|O|
|ZIG-100|X|X|X|O|X|X|X|X|X|X|X|
|ZIG-110A|O|O|O|X|O|O|O|O|O(O)|O|O|
|BT-110A|O|O|O|X|O|O|O|O|O(O)|O|O|
|BT-210|O|O|O|X|O|O|O|O|O(O)|O|O|
|BT-410|O|O|O|X|O|O|O|O|O(O)|O|O|
|LBS-040|X|O|O|X|X|X|X|X|O(O)|O|X|
|11.1V LiPo|X|X|X|X|O|O|O|O|X|X|O|
|9.6V NiMH|X|X|X|O|X|X|X|X|X|X|X|
|OBB-10A|O|X|X|X|X|X|X|X|X|X|X|
|ABB-030|X|X|O|X|X|X|X|X|X|X|X|
|LFU-10|X|X|X|X|O|O|O|X|X|X|O|
|FU-5|X|X|X|O|X|X|X|X|X|X|X|
|User Device|X|O|O|X|O|O|O|O|O(O)|O|O|

## Software

|Model|[CM-100]|[CM-150]|[CM-200]|[CM-5]|[CM-510]|[CM-530]|[CM-700]|[CM-900]|[OpenCM9.04]<br>(+[485 EXP])|[OpenCM7.0]|[OpenCR]|
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|R+ 1.0|O|O|O|O|O|O|O|X|O(X)|X|X|
|R+ 2.0|O|O|O|O|O|O|O|X|O(X)|O|X|
|OpenCM IDE|X|X|X|X|X|X|X|X|O|X|X|
|Arduino IDE|X|X|X|X|X|X|X|X|O|X|O|
|Scratch2.0|X|O|X|X|X|X|X|X|X|O|X|


[ln-101]: /docs/en/parts/interface/ln-101/

[CM-100]: /docs/en/parts/controller/cm-100/
[CM-150]: /docs/en/parts/controller/cm-150/
[CM-200]: /docs/en/parts/controller/cm-200/
[CM-5]: /docs/en/parts/controller/cm-5/
[CM-510]: /docs/en/parts/controller/cm-510/
[CM-530]: /docs/en/parts/controller/cm-530/
[CM-700]: /docs/en/parts/controller/cm-700/
[CM-900]: /docs/en/parts/controller/cm-900/
[OpenCM9.04]: /docs/en/parts/controller/opencm904/
[OpenCM7.0]: /docs/kr/parts/controller/opencm7/
[485 EXP]: /docs/en/parts/controller/exp485/
[OpenCR]: /docs/en/parts/controller/opencr/
