---
layout: archive
lang: en
ref: dynamixel_sdk_overview
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/overview/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

# [Overview](#overview)

## [DYNAMIXEL SDK](#dynamixel-sdk)

![](/assets/images/sw/sdk/dynamixel_sdk/overview/dynamixel_sdk_concept_logo.jpg)

**DYNAMIXEL SDK** is a software development kit that provides DYNAMIXEL control functions using packet communication. The API of DYNAMIXEL SDK is designed for DYNAMIXEL actuators and DYNAMIXEL-based platforms. You need to be familiar with C/C++ programming language for right use of the software. This e-Manual provides comprehensive information on ROBOTIS products and applications.

## [Supported DYNAMIXEL](#supported-dynamixels)

The DYNAMIXEL SDK supports **all DYNAMIXEL series**.


| DYNAMIXEL Series |                                |                                |                                |                                |                 |
|:-----------------|:-------------------------------|:-------------------------------|:-------------------------------|:-------------------------------|:----------------|
| **AX**           | [AX-12W]                       | [AX-12+/12A]                   | [AX-18F/18A]                   |                                |                 |
| **EX**           | [EX-106+]                      |                                |                                |                                |                 |
| **DX**           | [DX-113]                       | [DX-116]                       | [DX-117]                       |                                |                 |
| **RX**           | [RX-10]                        | [RX-24F]                       | [RX-28]                        | [RX-64]                        |                 |
| **MX**           | [MX-12W]                       | [MX-28], [MX-28(2.0)]          | [MX-64], [MX-64(2.0)]          | [MX-106], [MX-106(2.0)]        |                 |
| **XL**           | [XL320]                        | [XL330-M288]<br>[XL330-M077]   | [XL430-W250]                   | [2XL430-W250]                  |                 |
| **XC**           | [XC430-W150]<br/> [XC430-W240] | [2XC430-W250]                  |                                |                                |                 |
| **XM**           | [XM430-W210]<br/> [XM430-W350] | [XM540-W150]<br/> [XM540-W270] |                                |                                |                 |
| **XH**           | [XH430-W210]<br/> [XH430-W350] | [XH430-V210]<br/> [XH430-V350] | [XH540-W150]<br/> [XH540-W270] | [XH540-V150]<br/> [XH540-V270] |                 |
| **PRO L**        | [L42-10-S300-R]                | [L54-30-S500-R]                | [L54-30-S400-R]                | [L54-50-S500-R]                | [L54-50-S290-R] |
| **PRO M**        | [M42-10-S260-R]                | [M54-40-S250-R]                | [M54-60-S250-R]                |                                |                 |
| **PRO H**        | [H42-20-S300-R]                | [H54-100-S500-R]               | [H54-200-S500-R]               |                                |                 |
| **PRO M(A)**     | [M42-10-S260-R(A)]             | [M54-40-S250-R(A)]             | [M54-60-S250-R(A)]             |                                |                 |
| **PRO H(A)**     | [H42-20-S300-R(A)]             | [H54-100-S500-R(A)]            | [H54-200-S500-R(A)]            |                                |                 |
| **PM**           | [PM54-060-S250-R]              | [PM54-040-S250-R]              | [PM42-010-S260-R]              |                                |                 |
| **PH**           | [PH42-020-S300-R]              | [PH54-100-S500-R]              | [PH54-200-S500-R]              |                                |                 |



## [Supported Protocols](#supported-protocols)

To control DYNAMIXEL, communication should be established according to the protocol of DYNAMIXEL. There are **versions 1.0 and 2.0 of the DYNAMIXEL protocol**. The DYNAMIXEL SDK supports both, and the user can use both protocols simultaneously using the DYNAMIXEL SDK. Refer to the following manuals for details on the protocols.

- [DYNAMIXEL Protocol 1.0](/docs/en/dxl/protocol1/)
- [DYNAMIXEL Protocol 2.0 (Recommended protocoltype)](/docs/en/dxl/protocol2/)

## [Supported Devices](#supported-devices)

The DYNAMIXEL SDK can be used on PCs such as **desktops** or **laptops**, as well as on **tablets**, and also on **SBCs** like Raspberry Pi and UpBoards. In addition, it can be used with **embedded boards** that support the Arduino IDE. DYNAMIXEL uses TTL and RS485 communication. In order to use computer and DYNAMIXEL, we recommend [USB2DYNAMIXEL](http://emanual.robotis.com/docs/en/parts/interface/usb2dynamixel/) or [U2D2](http://emanual.robotis.com/docs/en/parts/interface/u2d2/) as interface device.

## [Supported Operating Systems](#supported-operating-systems)

The DYNAMIXEL SDK supports all three operating systems: **Windows**, **Linux**, and **MacOS**.

## [Supported Languages](#supported-languages)

The DYNAMIXEL SDK supports various programming languages: **C**, **C++**, **C#**, **Python**, **Java**, **MATLAB** and **LabVIEW**.  
In addition, DYNAMIXEL SDK supports **ROS**, so it can be used as ROS library using C++ or Python modules.

- **C**: *Dynamic library and source code of this library and examples
- **C#, Java, MATLAB, LabVIEW**: Support based on dynamic library using C language
- **C++**: *Dynamic library and source code of this library and examples
- **Python**: Python module and examples
- **ROS**:  ROS library using C++ and Python modules

(* Dynamic library (*.dll, *.so, and *.dylib files) / .dll: dynamic-link library on Windows / .so: shared object on Linux / .dylib: dynamic library on macOS)

[AX-12W]: /docs/en/dxl/ax/ax-12w/
[AX-12+/12A]: /docs/en/dxl/ax/ax-12a/
[AX-18F/18A]: /docs/en/dxl/ax/ax-18a/
[EX-106+]: /docs/en/dxl/ex/ex-106+/
[DX-113]: /docs/en/dxl/dx/dx-113/
[DX-116]: /docs/en/dxl/dx/dx-116/
[DX-117]: /docs/en/dxl/dx/dx-117/
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
[XL330-M288]: /docs/en/dxl/x/xl330-m288/
[XL330-M077]: /docs/en/dxl/x/xl330-m077/
[XL430-W250]: /docs/en/dxl/x/xl430-w250/
[2XL430-W250]: /docs/en/dxl/x/2xl430-w250/
[XC430-W150]: /docs/en/dxl/x/xc430-w150/
[XC430-W240]: /docs/en/dxl/x/xc430-w240/
[2XC430-W250]: /docs/en/dxl/x/2xc430-w250/
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
[PH42-020-S300-R]: /docs/en/dxl/p/ph42-020-s300-r/
[PH54-100-S500-R]: /docs/en/dxl/p/ph54-100-s500-r/
[PH54-200-S500-R]: /docs/en/dxl/p/ph54-200-s500-r/
[PM54-060-S250-R]: /docs/en/dxl/p/pm54-060-s250-r/
[PM54-040-S250-R]: /docs/en/dxl/p/pm54-040-s250-r/
[PM42-010-S260-R]: /docs/en/dxl/p/pm42-010-s260-r/
