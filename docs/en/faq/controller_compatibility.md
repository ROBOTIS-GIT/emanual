---
layout: archive
lang: en
ref: controller_compatibility
share: true
author_profile: false
permalink: /docs/en/faq/controller_compatibility/
sidebar:
  title: Compatibility
  nav: "controller_compatibility"
---

# Supported Baudrates for Dynamixel

|Baudrate(bps)|[CM-5][cm-5]|[CM-510][cm-510]|[CM-530][cm-530]|[CM-700][cm-700]|[CM-900][cm-900]|[OpenCM9.04][opencm9.04]|[OpenCR][opencr]|
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

|Model|[CM-100][cm-100]|[CM-150][cm-150]|[CM-200][cm-200]|[CM-5][cm-5]|[CM-510][cm-510]|[CM-530][cm-530]|[CM-700][cm-700]|[CM-900][cm-900]|[OpenCM9.04][opencm9.04]<br>(+[485 EXP][exp485])|
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|AX-Series|X|X|X|O|O|O|O|O|O(O)|
|DX-Series|X|X|X|X|X|X|O|O|X(O)|
|RX-Series|X|X|X|X|X|X|O|O|X(O)|
|EX-Series|X|X|X|X|X|X|O|O|X(O)|
|MX-Series(TTL)|X|X|X|O|O|O|O|O|O(O)|
|MX-Series(RS485)|X|X|X|X|X|X|O|O|X(O)|
|XM-Series|X|X|X|X|X|X|X|X|X(O)|
|XH-Series|X|X|X|X|X|X|X|X|X(O)|
|XL-320|X|X|X|X|X|X|X|O|X(O)|

## Parts

|Model|[CM-100][cm-100]|[CM-150][cm-150]|[CM-200][cm-200]|[CM-5][cm-5]|[CM-510][cm-510]|[CM-530][cm-530]|[CM-700][cm-700]|[CM-900][cm-900]|[OpenCM9.04][opencm9.04]<br>(+[485 EXP][exp485])|
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|Bioloid Serial Cable|X|X|X|O|O|X|X|X|X|
|Mini USB|X|X|X|X|X|O|X|X|X|
|Micro USB(B)|X|O|X|X|X|X|X|O|O(O)|
|LN-101|O|O|O|X|X|X|O|O|O(O)|
|IRSS-10|O|O|O|X|O|O|O|X|O(O)|
|TS-10|O|O|O|X|O|O|O|X|O(O)|
|DMS-80|X|X|X|X|O|O|O|X|O(O)|
|IR Array|X|X|X|O|O|O|O|O|O(O)|
|GS-12|X|X|X|X|O|O|O|X|O(O)|
|CS-10|X|O|O|X|X|O|X|X|O(O)|
|MGSS-10|X|O|O|X|X|O|X|X|O(O)|
|PIR-10|X|O|O|X|O|O|X|X|O(O)|
|TPS-10|X|O|O|X|O|O|X|X|O(O)|
|AX-S1|X|X|X|O|O|O|O|O|O(O)|
|SM-10|O|O|O|X|X|O|X|X|X|
|GM-10A|O|O|O|X|X|X|X|X|X|
|H-Spd Geared Motor|O|O|X|X|X|X|X|X|X|
|L-Spd Geared Motor|O|O|X|X|X|X|X|X|X|
|LM-10|O|O|O|X|X|O|X|X|O(O)|
|IR Receiver|O|O|X|X|O|O|O|X|X|
|ZIG-100|X|X|X|O|X|X|X|X|X|
|ZIG-110A|O|O|O|X|O|O|O|O|O(O)|
|BT-110A|O|O|O|X|O|O|O|O|O(O)|
|BT-210|O|O|O|X|O|O|O|O|O(O)|
|BT-410|O|O|O|X|O|O|O|O|O(O)|
|LBS-040|X|O|O|X|X|X|X|X|O(O)|
|11.1V LiPo|X|X|X|X|O|O|O|O|X|
|9.6V NiMH|X|X|X|O|X|X|X|X|X|
|OBB-10A|O|X|X|X|X|X|X|X|X|
|ABB-030|X|X|O|X|X|X|X|X|X|
|LFU-10|X|X|X|X|O|O|O|X|X|
|FU-5|X|X|X|O|X|X|X|X|X|
|User Device|X|X|X|X|O|O|O|O|O(O)|

## Software

|Model|[CM-100][cm-100]|[CM-150][cm-150]|[CM-200][cm-200]|[CM-5][cm-5]|[CM-510][cm-510]|[CM-530][cm-530]|[CM-700][cm-700]|[CM-900][cm-900]|[OpenCM9.04][opencm9.04]<br>(+[485 EXP][exp485])|
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|R+ 1.0|O|O|O|O|O|O|O|X|O(X)|
|R+ 2.0|O|O|O|O|O|O|O|X|O(X)|
|OpenCM IDE||||||||||


[ln-101]: /docs/en/parts/interface/ln_101/

[cm-100]: /docs/en/parts/controller/cm_100/
[cm-150]: /docs/en/parts/controller/cm_150/
[cm-200]: /docs/en/parts/controller/cm_200/
[cm-5]: /docs/en/parts/controller/cm_5/
[cm-510]: /docs/en/parts/controller/cm_510/
[cm-530]: /docs/en/parts/controller/cm_530/
[cm-700]: /docs/en/parts/controller/cm_700/
[cm-900]: /docs/en/parts/controller/cm_900/
[opencm9.04]: /docs/en/parts/controller/opencm_904/
[exp485]: /docs/en/parts/controller/exp485/
[opencr]: /docs/en/parts/controller/opencr/
