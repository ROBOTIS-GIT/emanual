---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_labview_bulk_read_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/labview_bulk_read_protocol_1_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 20"></div>
<div style="counter-reset: h3 3"></div>

# [Sample Code](#sample-code)

## [LabVIEW Protocol 1.0](#labview-protocol-10)

### [LabVIEW Bulk Read Protocol 1.0](#labview-bulk-read-protocol-10)

- Description

  This example writes goal positions to two Dynamixels simultaneously and repeats to read each present positions until Dynamixels stop moving. The funtions that are related with the Syncwrite handle the number of items that are near to each other in the Dynamixel control table on multiple Dynamixels, such as the goal position and the goal velocity.

- Available Dynamixel

  All series using protocol 1.0

- Control Panel

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/4.SDKExample/4.7%20LabVIEW/bulk_read1/bulk_read1.png)

- Block Diagram

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/4.SDKExample/4.7%20LabVIEW/bulk_read1/block_diagram.png)
