---
layout: archive
lang: en
ref: openmanipulator_pro_specification
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_pro/specification/
sidebar:
  title: "[ROS1] OpenMANIPULATOR-PRO"
  nav: "openmanipulator_pro"
product_group: openmanipulator_pro
page_number: 2
---

<div style="counter-reset: h1 1"></div>

# [Specification](#specification)

## [Specifications](#specifications)


|             Item              |                                                                                                                                                                                        OpenMANIPULATOR-PRO RM-P60-RNH                                                                                                                                                                                        |
|:-----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|              DOF              |                                                                                                                                                                                                      6                                                                                                                                                                                                       |
|            Payload            |                                                                                                                                                                                                     3 kg                                                                                                                                                                                                     |
|             Reach             |                                                                                                                                                                                                    645 mm                                                                                                                                                                                                    |
|         Repeatability         |                                                                                                                                                                                                   ±0.05 mm                                                                                                                                                                                                   |
|            Weight             |                                                                                                                                                                                                     5 kg                                                                                                                                                                                                     |
|       Operating voltage       |                                                                                                                                                                                                     24 V                                                                                                                                                                                                     |
|          Resolution           | Joint 1 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 2 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 3 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 5 : -&pi;(rad) ~ &pi;(rad) , -303,750 ~ 303,750 (pulse)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad) , -303,750 ~ 303,750 (pulse) |
| Dynamixel Pro<br />Model Name |                                                                                                                                             Joint 1, 2 : [PH54-200-S500-R](/docs/en/dxl/pro_plus/ph54-200-s500-r/) (200W)<br />Joint 3, 4 : [PH54-100-S500-R](/docs/en/dxl/pro_plus/ph54-100-s500-r/)(100W)<br />Joint 5, 6 : [PH42-020-S300-R](/docs/en/dxl/pro_plus/ph42-020-s300-r/) (20W)                                                                                                                                             |
|        Operating Range        |                                                                                 Joint 1 : -&pi;(rad) ~ &pi;(rad)<br />Joint 2 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 3 : -&pi;/2(rad) ~ 3&pi;/4(rad)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad)<br />Joint 5 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad)                                                                                  |
|          Default ID           |                                                                                                                                                     Joint 1 (ID:1), Joint 2 (ID:2), Joint 3 (ID:3),<br />Joint 4 (ID:4), Joint 5 (ID:5), Joint 6 (ID:6)                                                                                                                                                      |
|          Motor type           |                                                                                                                                                                     Brushless DC Servo(H54P Series),<br />Coreless DC Motor(H42P Series)                                                                                                                                                                     |
|     Position sensor type      |                                                                                                                                                                     Absolute Encoder(for Homing),<br />Incremental Encoder(for Control)                                                                                                                                                                      |
|        Communications         |                                                                                                                                                                                                    RS485                                                                                                                                                                                                     |
|    Communication Baudrate     |                                                                                                                                                                                                 1000000 bps                                                                                                                                                                                                  |



## [Dimension](#dimension)
![](/assets/images/platform/openmanipulator_pro/dimension.png)

If you have a gripper([RH-P12-RN(A)](/docs/en/platform/rh_p12_rna/)), see below.

![](/assets/images/platform/openmanipulator_pro/dimension_with_gripper.png)

## [Workspace](#workspace)
![](/assets/images/platform/openmanipulator_pro/ws1.png)
  
![](/assets/images/platform/openmanipulator_pro/ws2.png)  


## [Home Position](#home-position)

The diagram below shows the “home position” of the Dynamixel PRO+s from OpenMANIPULATOR-PRO.

![](/assets/images/platform/openmanipulator_pro/home_position.jpg)


## [D-H Configuration](#d-h-configuration)
![](/assets/images/platform/openmanipulator_pro/d_h_configuration.jpg)

- DH Parameter

| Link | Link Length(mm) | Link Twist(rad) | Joint Offset(mm) | Joint Angle(rad) |                         DXL Angle(rad)                          |
|:----:|:---------------:|:---------------:|:----------------:|:----------------:|:---------------------------------------------------------------:|
|  1   |        0        |     -&pi;/2     |        0         |        0         |                                0                                |
|  2   |     265.69      |        0        |        0         |        0         | ![](/assets/images/platform/openmanipulator_pro/d_h_eq_001.gif) |
|  3   |       30        |     -&pi;/2     |        0         |        0         | ![](/assets/images/platform/openmanipulator_pro/d_h_eq_002.gif) |
|  4   |        0        |     -&pi;/2     |       258        |        0         |                                0                                |
|  5   |        0        |     -&pi;/2     |        0         |        0         |                                0                                |
|  6   |        0        |        0        |        0         |        0         |                                0                                |

## [Mass Property](#mass-property)
### Coordinate

![](/assets/images/platform/openmanipulator_pro/mass1.png)

Total Mass : 5,551g

### Link 1

![](/assets/images/platform/openmanipulator_pro/mass2.png)

- Mass(g) : 1,030
- Center of Gravity(mm)
  - x : 0
  - y : 1
  - z : -1.1
- Inertia Tensor(g * mm<sup>2</sup>)
  - Ixx Ixy Ixz : 1.4957303e+06 0.0000000e+00 0.0000000e+00
  - Iyx Iyy Iyz : 0.0000000e+00 4.5009641e+05 -1.0959043e+04
  - Izz Izy Izz : 0.0000000e+00 -1.0959043e+04 1.4874997e+06
- Principal Moments(g * mm<sup>2</sup>)
  - I1 : 4.4998065e+05
  - I2 : 1.4876155e+06
  - I3 : 1.4957303e+06

### Link 2

![](/assets/images/platform/openmanipulator_pro/mass3.png)

- Mass(g) : 1,404
- Center of Gravity(mm)
  - x : 17.9
  - y : 0.3
  - z : 206.9
- Inertia Tensor(g * mm<sup>2</sup>)
  - Ixx Ixy Ixz : 1.0627201e+07 1.2357497e+04 -1.2920605e+06
  - Iyx Iyy Iyz : 1.2357497e+04 1.0014640e+07 1.5798255e+05
  - Izz Izy Izz : -1.2920605e+06 1.5798255e+05 1.9568681e+06
- Principal Moments(g * mm<sup>2</sup>)
  - I1 : 1.7653895e+06
  - I2 : 1.0017530e+07
  - I3 : 1.0815789e+07

### Link 3

![](/assets/images/platform/openmanipulator_pro/mass4.png)

- Mass(g) : 1,236
- Center of Gravity(mm)
  - x : 0.2
  - y : 0.3
  - z : 387.9
- Inertia Tensor(g * mm<sup>2</sup>)
  - Ixx Ixy Ixz : 3.1318491e+06 –6.0760429e+03 2.4765806e+04
  - Iyx Iyy Iyz : -6.0760429e+03 2.9193915e+06 4.2823763e+04
  - Izz Izy Izz : 2.4765806e+04 4.2823763e+04 9.2402606e+05
- Principal Moments(g * mm<sup>2</sup>)
  - I1 : 9.2282696e+05
  - I2 : 2.9201652e+06
  - I3 : 3.1322745e+06

### Link 4

![](/assets/images/platform/openmanipulator_pro/mass5.png)

- Mass(g) : 491
- Center of Gravity(mm)
  - x : 0
  - y : -1.5
  - z : 514.3
- Inertia Tensor(g * mm<sup>2</sup>)
  - Ixx Ixy Ixz : 3.9670485e+05 –3.3867048e+00 -4.7608394e+01
  - Iyx Iyy Iyz : -3.3867048e+00 2.3556702e+05 3.9098238e+03
  - Izz Izy Izz : -4.7608394e+01 3.9098238e+03 2.9647894e+05
- Principal Moments(g * mm<sup>2</sup>)
  - I1 : 2.3531708e+05
  - I2 : 2.9672886e+05
  - I3 : 3.9670487e+05

### Link 5

![](/assets/images/platform/openmanipulator_pro/mass6.png)

- Mass(g) : 454
- Center of Gravity(mm)
  - x : 0
  - y : 0.8
  - z : 591.5
- Inertia Tensor(g * mm<sup>2</sup>)
  - Ixx Ixy Ixz : 4.7548066e+05 0.0000000e+00 0.0000000e+00
  - Iyx Iyy Iyz : 0.0000000e+00 3.9961989e+05 1.4840847e+04
  - Izz Izy Izz : 0.0000000e+00 1.4840847e+04 1.9795791e+05
- Principal Moments(g * mm<sup>2</sup>)
  - I1 : 1.9687159e+05
  - I2 : 4.0070622e+05
  - I3 : 4.7548066e+05
