---
layout: archive
lang: en
ref: dynamixel_sdk_faq
read_time: true
share: true
author_profile: false
permalink: /docs/en/software/dynamixel/dynamixel_sdk/faq/
sidebar:
  title: DynamixelSDK
  nav: "dynamixel_sdk"
---

<div style="counter-reset: h1 7"></div>

# [FAQ](#faq)

## Difference between the read write example, the sync read write example, the bulk read write example, and the Indirect Address example

For systematical description or the details of communication method in the Dynamixel, check [Protocol 1.0](http://emanual.robotis.com/docs/en/dxl/protocol1/) and [Protocol 2.0](http://emanual.robotis.com/docs/en/dxl/protocol2/)

### Normal Read and Write controls only one Dynamixel

To make a single wheel turn, or to make LED blink, for becoming familiar with the Dynamixel, or if the operation you planned is not restricted by the time sequence, use this. 

### Sync Read and Write controls more than two Dynamixels simultaneously, targeting same items on each of them

To make a multi-joint mechanism or something that should be operated at the same time, use this. 
This sends the packet once as:
 * let them : [ID:1] _turn wheel_ to 200 + [ID:3] _turn wheel_ to 1500 + [ID:9] _turn wheel_ to 40 + ...

While using **Normal Read and Write control** in the situation, there is a time gap between former and latter signal transmission. 

### Bulk Read and Write controls more than two Dynamixels simultaneously, targeting different items in each other of them

This is as nearly the same as **Sync Read and Write control**, though, it can control different items. For instance:
 * let them : [ID:1] _turn wheel_ to 200 + [ID:3]  _blink LED_ 1(1) + [ID:9] - _set P gain_ 150 + ...

While using **Normal Read and Write control** or **Sync Read and Write control** in the situation, the signal should be transmitted in single items so whole process would be long.  

### Indirect Address control (is available only in Dynamixel PRO and X series but its very useful!)
To control multiple items in multiple dynamixel, and when you want to use **Sync Read and Write control** rather than **Bulk Read and Write control**, use this. Copy the buffer of targeted items to another address on the memory using **Normal Read and Write control**, then **Sync Read and Write control** them.

## I have a question. Where should I put it??
- Any **questions** related with Dynamixel SDK are always welcomed. Just let me know at [ISSUES](https://github.com/ROBOTIS-GIT/DynamixelSDK/issues).
- For the other questions, including **Hardware-wise problems** on your Dynamixels, please contact to `support@robotis.com` or use [ROBOTIS Forum](http://en.robotis.com/service/forum.php).
- Join our **developer community** on the [RobotSource](https://community.robotsource.org/).

## How to change an USB latency in DynamixelSDK?

The defalut of USB latency in DynamixelSDK is 16 ms. If you want to change it, refer to follow table.

|Language      |    File                       |  Name            |  Default |
|--------------|-------------------------------|------------------|----------|
|    c         |   port_handler_[OS].c         |  LATENCY_TIMER   |   16     |
|    c++       |   port_handler_[OS].cpp       |  LATENCY_TIMER   |   16     |
|    python    |   port_handler.py             |  LATENCY_TIMER   |   16     |
