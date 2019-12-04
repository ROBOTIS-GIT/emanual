---
layout: archive
lang: en
ref: dynamixel_sdk_overview
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/overview/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

# [Overview](#overview)

## [Dynamixel SDK](#dynamixel-sdk)

![](/assets/images/sw/sdk/dynamixel_sdk/overview/dynamixel_sdk_concept_logo.jpg)

The **ROBOTIS Dynamixel SDK** is a software development kit that provides Dynamixel control functions using packet communication. The API of Dynamixel SDK is designed for Dynamixel actuators and Dynamixel-based platforms. It assumes that you are familiar with C/C++ programming. This e-Manual provides comprehensive information about ROBOTIS products and applications.

## [Supported Dynamixels](#supported-dynamixels)

The Dynamixel SDK supports **all Dynamixel series** developed by ROBOTIS. For example, all series such as AX, RX, EX, MX, XL, XC, XM, XH, PRO-L, PRO-M, PRO-H and PRO+ are supported by packet communication. For information on each Dynamixel model, please refer to the Dynamixel section of the following manual.

- http://emanual.robotis.com/

## [Supported Protocols](#supported-protocols)

To control Dynamixel, communication should be established according to the protocol of Dynamixel. There are **versions 1.0 and 2.0 of the Dynamixel protocol**. The Dynamixel SDK supports both, and the user can use both protocols simultaneously using the Dynamixel SDK. Refer to the following manuals for details on the protocols.

- [Dynamixel Protocol 1.0](http://emanual.robotis.com/docs/en/dxl/protocol1/)
- [Dynamixel Protocol 2.0 (Recommended version)](http://emanual.robotis.com/docs/en/dxl/protocol2/)

## [Supported Devices](#supported-devices)

The Dynamixel SDK can be used on PCs such as **desktops** or **laptops**, as well as on **tablets**, and also on **SBCs** like Raspberry Pi and UpBoards. In addition, it can be used with **embedded boards** that support the Arduino IDE. Dynamixel uses TTL and RS485 communication. In order to use computer and Dynamixel, we recommend [USB2Dynamixel](http://emanual.robotis.com/docs/en/parts/interface/usb2dynamixel/) or [U2D2](http://emanual.robotis.com/docs/en/parts/interface/u2d2/) as interface device.

## [Supported Operating Systems](#supported-operating-systems)

The Dynamixel SDK supports all three operating systems: **Windows**, **Linux**, and **MacOS**.

## [Supported Languages](#supported-languages)

The Dynamixel SDK supports various programming languages like **C**, **C++**, **C#**, **Python**, **Java**, **MATLAB** and **LabVIEW**. In addition, Dynamixel SDK supports **ROS**, so it can be used as ROS library using C++ or Python modules.

- **C**: *Dynamic library and source code of this library and examples
- **C#, Java, MATLAB, LabVIEW**: Support based on dynamic library using C language
- **C++**: *Dynamic library and source code of this library and examples
- **Python**: Python module and examples
- **ROS**:  ROS library using C++ and Python modules

(* Dynamic library (*.dll, *.so, and *.dylib files) / .dll: dynamic-link library on Windows / .so: shared object on Linux / .dylib: dynamic library on macOS)
