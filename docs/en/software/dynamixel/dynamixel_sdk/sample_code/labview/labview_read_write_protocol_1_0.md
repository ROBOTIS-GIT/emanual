---
layout: archive
lang: en
ref: labview_read_write_protocol_1_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/labview_read_write_protocol_1_0/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 21"></div>
<div style="counter-reset: h3 0"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="labview-protocol-10"><a href="#labview-protocol-10">LabVIEW Protocol 1.0</a></h2>
<![end dummy Header 1]-->

### [LabVIEW Read Write Protocol 1.0](#labview-read-write-protocol-10)

- Description

  This example writes goal position of the Dynamixel and repeats read present position until it stops moving. The funtions that are related with the Read and the Write handle the number of items which are near each other in the Dynamixel control table, such as the goal position and the goal velocity.

- Available Dynamixel

  All series using protocol 1.0

- Control Panel

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/sample_code/read_write1/read_write1.png)

- Block Diagram

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/sample_code/read_write1/block_diagram.png)
