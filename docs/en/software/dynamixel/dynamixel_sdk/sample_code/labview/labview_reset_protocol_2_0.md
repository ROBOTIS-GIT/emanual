---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_labview_reset_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/labview_reset_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 21"></div>
<div style="counter-reset: h3 8"></div>

# [Sample Code](#sample-code)

## [LabVIEW Protocol 2.0](#labview-protocol-20)

### [LabVIEW Reset Protocol 2.0](#labview-reset-protocol-20)

- Description

  This example resets settings of Dynamixel to default values. The Factoryreset function has three operation modes:

  * 0xFF : reset all values (ID to 1, baudrate to 57600)

  * 0x01 : reset all values except ID (baudrate to 57600)

  * 0x02 : reset all values except ID and baudrate.

- Available Dynamixel

  All series using protocol 2.0

- Control Panel

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/sample_code/factory_reset2/factory_reset2.png)

- Block Diagram

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/sample_code/factory_reset2/block_diagram.png)
