---
layout: archive
lang: en
ref: openmanipulator_x_specification
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/specification/
sidebar:
  title: OpenManipulator-X
  nav: "openmanipulator_x"
---

<div style="counter-reset: h1 1"></div>

# [Specification](#specification)

## [Hardware Specification](#hardware-specification)

| Items               | Unit    |OpenManipulator-X                        |
|:--------------------|:--------|:----------------------------------------|
| **Actuator**        |         | Dynamixel XM430-W350-T                  |
| **Input Voltage**   | V       | 12                                      |
| **DOF**             | -       | 5 (4 DOF + 1 DOF Gripper)               |
| **Payload**         | g       | 500                                     |
| **Speed(Joint)**    | RPM     | 46                                      |
| **Weight**          | kg (lb) | 0.70  (1.54)                            |
| **Reach**           | mm (in) | 380   (14.9)                            |
| **Gripper Stroke**  | mm (in) | 20~75 (0.79~2.95)                       |
| **Communication**   | -       | TTL Level Multidrop BUS                 |
| **Software**        | -       | ROS, Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -       | PC, OpenCR                              |

## [Dimension](#dimension)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_spec_side.png)

<!-- ![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_spec_gripper.jpg) -->

## [Repeatability](#repeatability)

The below video introduces how the repeatability of OpenManipulator-X was measured. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/-xmEE9WrwtM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

QC MANAGER single LSY-220LN ([Korean Manual](http://qcmanager.cafe24.com/wp/wp-content/uploads/2017/11/KYENG_qcmanager_cata.pdf)) and Mitutoyo 540-390 digimatic indicator ID-C, 12.7mm ([English Manual](https://ecatalog.mitutoyo.com/ABSOLUTE-Digimatic-Indicator-ID-C-Series-543-Standard-Type-C1198.aspx)) were used for the data collection. Based on the result from 300 measurements, we guarantee less than 0.05 mm repeatability.

