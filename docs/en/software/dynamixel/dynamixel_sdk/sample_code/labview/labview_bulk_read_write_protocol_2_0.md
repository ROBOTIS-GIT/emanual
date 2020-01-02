---
layout: archive
lang: en
ref: labview_bulk_read_write_protocol_2_0
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/sample_code/labview_bulk_read_write_protocol_2_0/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 22"></div>
<div style="counter-reset: h3 3"></div>

<!--[dummy Header 1]>
  <h1 id="sample-code"><a href="#sample-code">Sample Code</a></h1>
  <h2 id="labview-protocol-20"><a href="#labview-protocol-20">LabVIEW Protocol 2.0</a></h2>
<![end dummy Header 1]-->

### [LabVIEW Bulk Read Write Protocol 2.0](#labview-bulk-read-write-protocol-20)

- Description

  This example writes either of goal position or LED value of two DYNAMIXEL's and simulateously reads them until Dynamixel stops moving. The functions that are related with the Bulkwrite and the Bulkread function handle the number of items which are not near each other in the Dynamixel control table on multiple DYNAMIXEL's.

- Available Dynamixel

  All series using protocol 2.0

- Control Panel

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/sample_code/bulk_read_write2/bulk_read_write2.png)

- Block Diagram

  ![](/assets/images/sw/sdk/dynamixel_sdk/library_setup/labview/windows/sample_code/bulk_read_write2/block_diagram.png)
