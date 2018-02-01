---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_labview_indirect_address_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/labview_indirect_address_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 21"></div>
<div style="counter-reset: h3 4"></div>

# [Sample Code](#sample-code)

## [LabVIEW Protocol 2.0](#labview-protocol-20)

### [LabVIEW Indirect Address Protocol 2.0](#labview-indirect-address-protocol-20)

- Description

  This example writes the goal position and LED value and repeats to read present position and moving status through the indirect data storage, rather than write directly to the their own data storages. The indirect address links between direct and indirect data storages. This makes the Syncread and the Syncwrite function accessible to the items which are far from each other’s address.

- Available Dynamixel

  All series using protocol 2.0

- Control Panel

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/sample_code/indirect_address2/indirect_address2.png)

- Block Diagram

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/sample_code/indirect_address2/block_diagram.png)
