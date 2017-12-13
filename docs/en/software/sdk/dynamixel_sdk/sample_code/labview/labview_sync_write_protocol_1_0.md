---
layout: archive
lang: en
ref: dynamixel_sdk_sample_code_labview_sync_write_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/sdk/dynamixel_sdk/sample_code/labview_sync_write_protocol_1_0
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h2 100"></div>
<div style="counter-reset: h1 3"></div>

## [LabVIEW Sync Write Protocol 1.0](#labview-sync-write-protocol-10)

- Description

  This example writes goal positions to two Dynamixels simultaneously and repeats to read each present positions until Dynamixels stop moving. The funtions that are related with the Syncwrite handle the number of items that are near to each other in the Dynamixel control table on multiple Dynamixels, such as the goal position and the goal velocity.

- Available Dynamixel

  All series using protocol 1.0

- Control Panel

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/4.SDKExample/4.7%20LabVIEW/sync_write1/sync_write1.png)

- Block Diagram

![](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/DynamixelSDK/4.SDKExample/4.7%20LabVIEW/sync_write1/block_diagram.png)