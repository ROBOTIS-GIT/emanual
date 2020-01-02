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

The **ROBOTIS DYNAMIXEL SDK** is a software development kit that provides DYNAMIXEL control functions using packet communication. The API of DYNAMIXEL SDK is designed for DYNAMIXEL actuators and DYNAMIXEL-based platforms. It assumes that you are familiar with C/C++ programming. This e-Manual provides comprehensive information about ROBOTIS products and applications.

## [Supported DYNAMIXEL](#supported-dynamixels)

The DYNAMIXEL SDK supports **all DYNAMIXEL series** developed by ROBOTIS. For example, all series such as AX, RX, EX, MX, XL, XC, XM, XH, PRO-L, PRO-M, PRO-H and PRO+ are supported by packet communication. For information on each DYNAMIXEL model, please refer to the DYNAMIXEL section of the following manual.

- http://emanual.robotis.com/

## [Supported Protocols](#supported-protocols)

To control DYNAMIXEL, communication should be established according to the protocol of DYNAMIXEL. There are **versions 1.0 and 2.0 of the DYNAMIXEL protocol**. The DYNAMIXEL SDK supports both, and the user can use both protocols simultaneously using the DYNAMIXEL SDK. Refer to the following manuals for details on the protocols.

- [DYNAMIXEL Protocol 1.0](http://emanual.robotis.com/docs/en/dxl/protocol1/)
- [DYNAMIXEL Protocol 2.0 (Recommended version)](http://emanual.robotis.com/docs/en/dxl/protocol2/)

## [Supported Devices](#supported-devices)

The DYNAMIXEL SDK can be used on PCs such as **desktops** or **laptops**, as well as on **tablets**, and also on **SBCs** like Raspberry Pi and UpBoards. In addition, it can be used with **embedded boards** that support the Arduino IDE. DYNAMIXEL uses TTL and RS485 communication. In order to use computer and DYNAMIXEL, we recommend [USB2DYNAMIXEL](http://emanual.robotis.com/docs/en/parts/interface/usb2dynamixel/) or [U2D2](http://emanual.robotis.com/docs/en/parts/interface/u2d2/) as interface device.

## [Supported Operating Systems](#supported-operating-systems)

The DYNAMIXEL SDK supports all three operating systems: **Windows**, **Linux**, and **MacOS**.

## [Supported Languages](#supported-languages)

The DYNAMIXEL SDK supports various programming languages like **C**, **C++**, **C#**, **Python**, **Java**, **MATLAB** and **LabVIEW**. In addition, DYNAMIXEL SDK supports **ROS**, so it can be used as ROS library using C++ or Python modules.

- **C**: *Dynamic library and source code of this library and examples
- **C#, Java, MATLAB, LabVIEW**: Support based on dynamic library using C language
- **C++**: *Dynamic library and source code of this library and examples
- **Python**: Python module and examples
- **ROS**:  ROS library using C++ and Python modules

(* Dynamic library (*.dll, *.so, and *.dylib files) / .dll: dynamic-link library on Windows / .so: shared object on Linux / .dylib: dynamic library on macOS)
