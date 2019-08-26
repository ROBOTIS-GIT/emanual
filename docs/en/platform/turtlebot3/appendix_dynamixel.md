---
layout: archive
lang: en
ref: appendix_dynamixel
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/appendix_dynamixel/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 35
---

<div style="counter-reset: h1 22"></div>
<div style="counter-reset: h2 0"></div>

<!--[dummy Header 1]>
  <h1 id="appendixes"><a href="#appendixes">Appendixes</a></h1>
<![end dummy Header 1]-->

## [DYNAMIXEL](#appendix-dynamixel)

![](/assets/images/platform/turtlebot3/appendix_dynamixel/dynamixel_x.jpg)

### [Overview](#overview)

<iframe width="560" height="315" src="https://www.youtube.com/embed/gZWoyCvU-U8" frameborder="0" allowfullscreen></iframe>

`DYNAMIXEL X-Series` is a new line-up of high performance networked actuator module, which has been widely used for building various types of robots with reliability and expandability.

Two different types of DYNAMIXEL is adopted in TurtleBot3 Burger, Waffle and Waffle Pi as they have different requirements. DYNAMIXEL X-Series shares its design, therefore, users can replace actuators depend on applications.

- Basic Features
  - Improved Torque with Compact Size
  - Enhanced Durability and Expandability
  - Hollow Back Case Minimizes Cable Stress (3-way-routing)
  - Direct Screw Assembly to the Case (without Nut Insert)
  - Improved Heat Sink Featuring Aluminum Case

- Various Control Functions
  - 6 Operating Modes
  - Current-Based Torque Control (4096 steps, 2.69mA/step)
  - Profile Control for Smooth Motion Planning
  - Trajectory Data and Moving Status (In-Position, Following Error, etc.)
  - Energy Saving (Reduced Current from 100mA to 40mA)

### [Specifications](#specifications)

| Items           | [XL430-W250][xl430_w250] (for Burger)          | [XM430-W210][xm430_w210] (for Waffle and Waffle Pi)                                |
|:----------------|:-----------------------------------------------|:-----------------------------------------------------------------------------------|
| Microcontroller | ST CORTEX-M3 (STM32F103C8 @ 72Mhz, 32bit)      | ST CORTEX-M3 (STM32F103C8 @ 72Mhz, 32bit)                                          |
| Position Sensor | Contactless Absolute Encoder (12bit, 360&deg;) | Contactless Absolute Encoder (12bit, 360&deg;)                                     |
| Motor           | Cored Motor                                    | **Coreless Motor **                                                                |
| Baud Rate       | 9600 bps ~ 4.5 Mbps                            | 9600 bps ~ 4.5 Mbps                                                                |
| Control Modes   | Velocity, Position, Extended Position, PWM     | Velocity, Position, Extended Position, PWM, **Current**, **Current-base Position** |
| Gear Ratio      | 258.5 : 1                                      | 212.6 : 1                                                                          |
| Stall Torque    | 1.0 N.m (@ 9V, 1A)                             | **2.7 N.m (@ 11.1V, 2.1A)**                                                        |
|                 | 1.4 N.m (@ 11.1V, 1.3A)                        | 3.0 N.m (@ 12V, 2.3A)                                                              |
|                 | 1.5 N.m (@ 12V, 1.4A)                          | 3.7 N.m (@ 14.8V, 2.7A)                                                            |
| No Load Speed   | 47rpm (@ 9V)                                   | **70rpm (@ 11.1V)**                                                                |
|                 | 57rpm (@ 11.1V)                                | 77rpm (@ 12V)                                                                      |
|                 | 61rpm (@ 12V)                                  | 95rpm (@ 14.8V)                                                                    |
| Communication   | TTL Level Multi Drop Bus                       | TTL Level / RS485 Multi Drop Bus                                                   |
| Material        | Engineering Plastic                            | Full Metal Gear, Metal Body, Engineering Plastic                                   |
| Standby Current | 52mA                                           | 40mA                                                                               |


- More information for actuators can be found at below ROBOTIS e-Manual links.
  - [XL430-W250][xl430_w250] for TurtleBot3 Burger
  - [XM430-W210][xm430_w210] for TurtleBot3 Waffle and Waffle Pi

### [Dynamixel SDK](#dynamixel-sdk)

![](/assets/images/sw/sdk/dynamixel_sdk/overview/dynamixel_sdk_concept_logo.jpg)

The ROBOTIS Dynamixel SDK is a software development library that provides Dynamixel control functions for packet communication. The API is designed for Dynamixel actuators and Dynamixel-based platforms. TurtleBot3 uses the Dynamixel SDK in OpenCR to control the actuator.

- More information for Dynamixel SDK can be found at below ROBOTIS e-Manual and GitHub links.
  - [e-Manual of Dynamixel SDK][dynamixel_sdk]
  - [GitHub Repository of Dynamixel SDK][dynamixel_sdk_github]

[dynamixel]: http://en.robotis.com/subindex/dxl_en.php
[xl430_w250]: /docs/en/dxl/x/xl430-w250/
[xm430_w210]: /docs/en/dxl/x/xm430-w210/
[dynamixel_sdk]: /docs/en/software/dynamixel/dynamixel_sdk/overview/
[dynamixel_sdk_github]: https://github.com/ROBOTIS-GIT/DynamixelSDK
