---
layout: archive
lang: en
ref: dynamixel_sdk_faq
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/faq/
sidebar:
  title: DYNAMIXEL SDK
  nav: "dynamixel_sdk"
---

<style>body {counter-reset: h1 7 !important;}</style>

# [FAQ](#faq)

## What is the Difference between Read/Write example, Sync Read/Write example, and Bulk Read/Write?


### Normal Read/Write
This method interfaces with a single DYNAMIXEL actuator at a time.

It is ideal for simple tasks such as operating a single joint, especially when you're new to DYNAMIXEL or when precise timing isn't critical.

Use case example:
Turn one actuator or test basic functionality during setup or debugging.

### Sync Read and Write
This method controls multiple DYNAMIXEL actuators simultaneously, but is limited to reading or writing the same control table item for all actuators (e.g., position or speed).

Instead of sending separate commands for each ID, one combined packet is sent, using Normal Read/Write in a situation requiring synchronized movement can introduce time delays between commands, which can affect synchronization.

Use case example:
Coordinate a multi-jointed mechanism like a robotic arm, where actuators must move at the same time.

### Bulk Read/Write
This method also controls multiple actuators simultaneously, but is capable of targeting different control table items for each actuator.

Compared to Sync Read/Write, Bulk Read/Write is a little slower and more flexible but still sends all instructions in a single transmission—saving time and improving efficiency over individual Read/Writes.

Use case example:
Send simultaneous mixed commands like-
[ID:1] Move to 200
[ID:3] Turn on LED
[ID:9] Set P Gain to 150

For more information on the DYNAMIXEL protocol refer to the [Protocol 1.0](http://emanual.robotis.com/docs/en/dxl/protocol1/) and [Protocol 2.0](http://emanual.robotis.com/docs/en/dxl/protocol2/) documentation for full technical details.

## What are Indirect Addresses?

### Indirect Addressing (Available on DYNAMIXEL X,Y, and P Series)
Indirect Addressing lets you map multiple separate control items to occupy a continuous memory space. You can then use Sync Read/Write to access this continuous region to interact with the control table items as if they were in a continuous address range.

This method is especially useful when you prefer the performance of Sync Read/Write but need the flexibility typically offered by Bulk Read/Write.

Use case example:
When you want to control multiple parameters (e.g., position, speed, torque) on multiple actuators using Sync Read/Write, set up Indirect Addressing first using Normal Write, then control them all at once with a single Sync Read/Write.

## Have Questions?
If you have any questions related to the DYNAMIXEL SDK, feel free to open an issue in on the [GitHub repository](https://github.com/ROBOTIS-GIT/DynamixelSDK/issues).
For hardware-related issues or other technical support, please contact us at support@robotis.com or visit the [ROBOTIS Community Forum](https://forum.robotis.com).

## How to Change USB Latency in the DYNAMIXEL SDK
The default USB latency in the DYNAMIXEL SDK is 16 ms. If you need to reduce it for faster communication, modify the following settings in your code:

| Language | File                  | Name          | Default |
|:---------|:----------------------|:--------------|:--------|
| C        | port_handler_[OS].c   | LATENCY_TIMER | 16      |
| C++      | port_handler_[OS].cpp | LATENCY_TIMER | 16      |
| Python   | port_handler.py       | LATENCY_TIMER | 16      |

Make sure your system permits changing USB latency settings, as this may require administrative privileges.
