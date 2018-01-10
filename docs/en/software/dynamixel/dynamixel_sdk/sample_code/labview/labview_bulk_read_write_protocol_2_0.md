---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_labview_bulk_read_write_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/labview_bulk_read_write_protocol_2_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 21"></div>
<div style="counter-reset: h3 3"></div>

# [Sample Code](#sample-code)

## [LabVIEW Protocol 2.0](#labview-protocol-20)

### [LabVIEW Bulk Read Write Protocol 2.0](#labview-bulk-read-write-protocol-20)

- Description

  This example writes either of goal position or LED value of two Dynamixels and simulateously reads them until Dynamixel stops moving. The functions that are related with the Bulkwrite and the Bulkread function handle the number of items which are not near each other in the Dynamixel control table on multiple Dynamixels.

- Available Dynamixel

  All series using protocol 2.0

- Control Panel

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/4.SDKExample/4.7%20LabVIEW/bulk_read_write2/bulk_read_write2.png)

- Block Diagram

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/4.SDKExample/4.7%20LabVIEW/bulk_read_write2/block_diagram.png)
