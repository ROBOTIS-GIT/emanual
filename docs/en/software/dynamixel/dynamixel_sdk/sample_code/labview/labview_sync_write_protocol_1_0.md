---
layout: archive
lang: en
ref: labview_sync_write_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/labview_sync_write_protocol_1_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 21"></div>
<div style="counter-reset: h3 2"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="labview-protocol-10"><a href="#labview-protocol-10">LabVIEW Protocol 1.0</a></h2>
<![end dummy Header 1]-->

### [LabVIEW Sync Write Protocol 1.0](#labview-sync-write-protocol-10)

- Description

  This example writes goal positions to two Dynamixels simultaneously and repeats to read each present positions until Dynamixels stop moving. The funtions that are related with the Syncwrite handle the number of items that are near to each other in the Dynamixel control table on multiple Dynamixels, such as the goal position and the goal velocity.

- Available Dynamixel

  All series using protocol 1.0

- Control Panel

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/sample_code/sync_write1/sync_write1.png)

- Block Diagram

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/sample_code/sync_write1/block_diagram.png)
