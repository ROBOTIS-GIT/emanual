---
layout: archive
lang: en
ref: turtlebot3_appendix_dynamixel
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/appendix_dynamixel/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

# [Appendix #DYNAMIXEL](#appendix-dynamixel)

![](/assets/images/platform/turtlebot3/appendix_dynamixel/dynamixel_x.jpg)

## [Overview](#overview)

`DYNAMIXEL X-Series` is a new line-up of high performance networked actuator module, which has been widely used for building various types of robots with reliability and expandability.
Two different types of DYNAMIXEL is adopted in TurtleBot3 Burger and Waffle as they have different requirements.
DYNAMIXEL X-Series shares its design, therefore, users can replace actuators depend on applications.

* Basic Feature
  - Improved Torque with Compact Size
  - Enhanced Durability and Expandability
  - Hollow Back Case Minimizes Cable Stress (3-way-routing)
  - Direct Screw Assembly to the Case (without Nut Insert)
  - Improved Heat Sink Featuring Aluminum Case


* Various Control Functions  
  - 6 Operating Modes
  - Current-Based Torque Control (4096 steps, 2.69mA/step)
  - Profile Control for Smooth Motion Planning
  - Trajectory Data and Moving Status (In-Position, Following Error, etc.)
  - Energy Saving (Reduced Current from 100mA to 40mA)

<div class="alert alert-info">
  **Note :** Control Functions may vary by models
</div>


<figure class="video_container">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/gZWoyCvU-U8" frameborder="0" allowfullscreen></iframe>
</figure>

## [Specifications](#specifications)

| Items          | [XL430-W250](http://support.robotis.com/en/product/actuator/dynamixel_x/xl_series/xl430-w250.htm) (for Burger) | [XM430-W210](http://support.robotis.com/en/product/actuator/dynamixel_x/xm_series/xm430-w210.htm) (for Waffle) |
|:---------------|:---------------------------------------------|:---------------------------------------------------------------------------|
| Microcontroller <td colspan=2> ST CORTEX-M3 (STM32F103C8 @ 72Mhz, 32bit)                                                                    </td>
| Position Sensor <td colspan=2> Contactless Absolute Encoder (12bit, 360&deg;)                                                               </td>
| Motor          | Cored Motor                                   | Coreless Motor                                                             |
| Baud Rate       <td colspan=2> 9600 bps ~ 4.5 Mbps                                                                                          </td>
| Control Modes  | Velocity, Position, Extended Position, PWM    | Velocity, Position, Extended Position, PWM, Current, Current-base Position |
| Gear Ratio     | 258.5 : 1                                     | 212.6 : 1                                                                  |
| Stall Torque   | 1.0 N.m (@ 9V, 1A)                            | 2.7 N.m (@ 11.1V, 2.1A)                                                    |
|                | 1.4 N.m (@ 11.1V, 1.3A)                       | 3.0 N.m (@ 12V, 2.3A)                                                      |
|                | 1.5 N.m (@ 12V, 1.4A)                         | 3.7 N.m (@ 14.8V, 2.7A)                                                    |
| No Load Speed  | 47rpm (@ 9V)                                  | 70rpm (@ 11.1V)                                                            |
|                | 57rpm (@ 11.1V)                               | 77rpm (@ 12V)                                                              |
|                | 61rpm (@ 12V)                                 | 95rpm (@ 14.8V)                                                            |
| Communication  | TTL Level Multi Drop Bus                      | TTL Level / RS485 Multi Drop Bus                                           |
| Material       | Engineering Plastic                           | Full Metal Gear, Metal Body, Engineering Plastic                           |
| Standby Current| 52mA                                          | 40mA                                                                       |


More information for actuators can be found at below ROBOTIS e-Manual links.  

* [XL430-W250](http://support.robotis.com/en/product/actuator/dynamixel_x/xl_series/xl430-w250.htm)

* [XM430-W210](http://support.robotis.com/en/product/actuator/dynamixel_x/xm_series/xm430-w210.htm)
