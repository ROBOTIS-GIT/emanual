---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_labview_reset_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/sample_code/labview_reset_protocol_2_0
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 112"></div>
<div style="counter-reset: h1 3"></div>

## [LabVIEW Reset Protocol 2.0](#labview-reset-protocol-20)

- Description

  This example resets settings of Dynamixel to default values. The Factoryreset function has three operation modes:

  * 0xFF : reset all values (ID to 1, baudrate to 57600)

  * 0x01 : reset all values except ID (baudrate to 57600)

  * 0x02 : reset all values except ID and baudrate.

- Available Dynamixel

  All series using protocol 2.0

- Control Panel

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/4.SDKExample/4.7%20LabVIEW/factory_reset2/factory_reset2.png)

- Block Diagram

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/4.SDKExample/4.7%20LabVIEW/factory_reset2/block_diagram.png)