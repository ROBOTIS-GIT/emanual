---
layout: archive
lang: en
ref: openmanipulator_p_specification
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_p/specification/
sidebar:
  title: "[ROS] OpenMANIPULATOR-P"
  nav: "openmanipulator_p"
product_group: openmanipulator_p
page_number: 2
---

<div style="counter-reset: h1 1"></div>

# [Specification](#specification)

## [Specifications](#specifications)


|             Item              |                                                                                                                                                                                        OpenMANIPULATOR-P (RM-P60-RNH)                                                                                                                                                                                        |
|:-----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|              DOF              |                                                                                                                                                                                                      6                                                                                                                                                                                                       |
|            Payload            |                                                                                                                                                                                                     3 kg                                                                                                                                                                                                     |
|             Reach             |                                                                                                                                                                                                    645 mm                                                                                                                                                                                                    |
|         Repeatability         |                                                                                                                                                                                                   ±0.05 mm                                                                                                                                                                                                   |
|            Weight             |                                                                                                                                                                                                     5 kg                                                                                                                                                                                                     |
|       Operating voltage       |                                                                                                                                                                                                     24 V                                                                                                                                                                                                     |
|          Resolution           | Joint 1 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 2 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 3 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 5 : -&pi;(rad) ~ &pi;(rad) , -303,750 ~ 303,750 (pulse)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad) , -303,750 ~ 303,750 (pulse) |
| DYNAMIXEL Pro<br />Model Name |                                                                                         Joint 1, 2 : [PH54-200-S500-R](/docs/en/dxl/p/ph54-200-s500-r/) (200W)<br />Joint 3, 4 : [PH54-100-S500-R](/docs/en/dxl/p/ph54-100-s500-r/)(100W)<br />Joint 5, 6 : [PH42-020-S300-R](/docs/en/dxl/p/ph42-020-s300-r/) (20W)                                                                                         |
|        Operating Range        |                                                                                 Joint 1 : -&pi;(rad) ~ &pi;(rad)<br />Joint 2 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 3 : -&pi;/2(rad) ~ 3&pi;/4(rad)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad)<br />Joint 5 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad)                                                                                  |
|          Default ID           |                                                                                                                                                     Joint 1 (ID:1), Joint 2 (ID:2), Joint 3 (ID:3),<br />Joint 4 (ID:4), Joint 5 (ID:5), Joint 6 (ID:6)                                                                                                                                                      |
|          Motor type           |                                                                                                                                                                     Brushless DC Servo(H54P Series),<br />Coreless DC Motor(H42P Series)                                                                                                                                                                     |
|     Position sensor type      |                                                                                                                                                                     Absolute Encoder(for Homing),<br />Incremental Encoder(for Control)                                                                                                                                                                      |
|        Communications         |                                                                                                                                                                                                    RS485                                                                                                                                                                                                     |
|    Communication Baudrate     |                                                                                                                                                                                                 1000000 bps                                                                                                                                                                                                  |

## [Dimension](#dimension)
![](/assets/images/platform/openmanipulator_p/dimension.png)

If you have a gripper([RH-P12-RN(A)](/docs/en/platform/rh_p12_rna/)), see below.

![](/assets/images/platform/openmanipulator_p/dimension_with_gripper.png)

## [Workspace](#workspace)
![](/assets/images/platform/openmanipulator_p/ws1.png)
  
![](/assets/images/platform/openmanipulator_p/ws2.png)  

## [Home Position](#home-position)

The diagram below shows the “home position” of DYNAMIXEL-P from OpenMANIPULATOR-P.

![](/assets/images/platform/openmanipulator_p/home_position.jpg)

## [D-H Configuration](#d-h-configuration)
![](/assets/images/platform/openmanipulator_p/d_h_configuration.jpg)

- DH Parameter

| Link | Link Length(mm) | Link Twist(rad) | Joint Offset(mm) | Joint Angle(rad) |                         DXL Angle(rad)                          |
|:----:|:---------------:|:---------------:|:----------------:|:----------------:|:---------------------------------------------------------------:|
|  1   |        0        |     -&pi;/2     |        0         |        0         |                                0                                |
|  2   |     265.69      |        0        |        0         |        0         | ![](/assets/images/platform/openmanipulator_p/d_h_eq_001.gif) |
|  3   |       30        |     -&pi;/2     |        0         |        0         | ![](/assets/images/platform/openmanipulator_p/d_h_eq_002.gif) |
|  4   |        0        |     -&pi;/2     |       258        |        0         |                                0                                |
|  5   |        0        |     -&pi;/2     |        0         |        0         |                                0                                |
|  6   |        0        |        0        |        0         |        0         |                                0                                |

## [Mass Property](#mass-property)
### Coordinate

![](/assets/images/platform/openmanipulator_p/mass1.png)

Total Mass : 5,324g

### Link 1

![](/assets/images/platform/openmanipulator_p/mass2.png)

- Mass [Kg] : 9.4360595e-01
- Center of Gravity [m]
  - x : 0.0000000e+00
  - y : -1.7653633e-04
  - z : -1.0030209e-03
- Inertia Tensor with respect to coordinate frame [Kg * m<sup>2</sup>]
  - Ixx Ixy Ixz : 1.5694005e-03 0.0000000e+00 0.0000000e+00
  - Iyx Iyy Iyz : 0.0000000e+00 4.5593385e-04 6.4581824e-09
  - Izx Izy Izz : 0.0000000e+00 6.4581824e-09 1.5561809e-03
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame [Kg * m<sup>2</sup>]
  - Ixx Ixy Ixz : 1.5684218e-03 0.0000000e+00 0.0000000e+00
  - Iyx Iyy Iyz : 0.0000000e+00 4.5498454e-04 1.7354214e-07
  - Izx Izy Izz : 0.0000000e+00 1.7354214e-07 1.5561515e-03
- Principal Moments of Inertia [Kg * m<sup>2</sup>]
  - I1 : 4.5498451e-04
  - I2 : 1.5561515e-03
  - I3 : 1.5684218e-03

### Link 2

![](/assets/images/platform/openmanipulator_p/mass3.png)

- Mass [Kg] : 1.3825862e+00
- Center of Gravity [m]
  - x : 1.5751501e-02
  - y : -2.2073221e-04
  - z : 1.9913687e-01
- Inertia Tensor with respect to coordinate frame [Kg * m<sup>2</sup>]
  - Ixx Ixy Ixz : 6.7630430e-02 -1.9988597e-05 -5.7477571e-03
  - Iyx Iyy Iyz : -1.9988597e-05 6.7208001e-02 7.4823203e-05
  - Izx Izy Izz : -5.7477571e-03 7.4823203e-05 2.6031353e-03
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame [Kg * m<sup>2</sup>]
  - Ixx Ixy Ixz : 1.2803228e-02 -2.4795661e-05 -1.4109928e-03
  - Iyx Iyy Iyz : -2.4795661e-05 1.2037834e-02 1.4050354e-05
  - Izx Izy Izz : -1.4109928e-03 1.4050354e-05 2.2600348e-03
- Principal Moments of Inertia [Kg * m<sup>2</sup>]
  - I1 : 2.0744566e-03
  - I2 : 1.2037112e-02
  - I3 : 1.2989528e-02

### Link 3

![](/assets/images/platform/openmanipulator_p/mass4.png)

- Mass [Kg] : 1.2126965e+00
- Center of Gravity [m]
  - x : 3.0352597e-04
  - y : 4.1703880e-05
  - z : 3.8074728e-01
- Inertia Tensor with respect to coordinate frame [Kg * m<sup>2</sup>]
  - Ixx Ixy Ixz : 1.7985424e-01 -9.9417476e-07 -8.1564441e-05
  - Iyx Iyy Iyz : -9.9417476e-07 1.7948679e-01 -1.7705853e-05
  - Izx Izy Izz : -8.1564441e-05 -1.7705853e-05 1.1422079e-03
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame [Kg * m<sup>2</sup>]
  - Ixx Ixy Ixz : 4.0514666e-03 -9.7882420e-07 5.8582868e-05
  - Iyx Iyy Iyz : -9.7882420e-07 3.6839091e-03 1.5501165e-06
  - Izx Izy Izz : 5.8582868e-05 1.5501165e-06 1.1420941e-03
- Principal Moments of Inertia [Kg * m<sup>2</sup>]
  - I1 : 1.1409140e-03
  - I2 : 3.6839076e-03
  - I3 : 4.0526481e-03

### Link 4

![](/assets/images/platform/openmanipulator_p/mass5.png)

- Mass [Kg] : 4.6635550e-01
- Center of Gravity [m]
  - x : -2.1388493e-06
  - y : -2.2290515e-03
  - z : 5.1387207e-01
- Inertia Tensor with respect to coordinate frame [Kg * m<sup>2</sup>]
  - Ixx Ixy Ixz : 1.2357713e-01 -1.9465317e-09  5.1228604e-07
  - Iyx Iyy Iyz : -1.9465317e-09  1.2339567e-01  5.3769657e-04
  - Izx Izy Izz : 5.1228604e-07  5.3769657e-04  3.3216863e-04
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame [Kg * m<sup>2</sup>]
  - Ixx Ixy Ixz : 4.2687885e-04  0.0000000e+00  0.0000000e+00
  - Iyx Iyy Iyz : 0.0000000e+00  2.4774029e-04  3.5109263e-06
  - Izx Izy Izz : 0.0000000e+00  3.5109263e-06  3.2985146e-04
- Principal Moments of Inertia [Kg * m<sup>2</sup>]
  - I1 : 2.4759044e-04
  - I2 : 3.3000130e-04
  - I3 : 4.2687885e-04

### Link 5

![](/assets/images/platform/openmanipulator_p/mass6.png)

- Mass [Kg] : 4.2561606e-01
- Center of Gravity [m]
  - x : -2.1268822e-06
  - y : 1.8039922e-04
  - z : 5.9028250e-01
- Inertia Tensor with respect to coordinate frame [Kg * m<sup>2</sup>]
  - Ixx Ixy Ixz : 1.4881319e-01  0.0000000e+00  5.3435266e-07
  - Iyx Iyy Iyz : 0.0000000e+00  1.4872708e-01 -4.3708754e-05
  - Izx Izy Izz : 5.3435266e-07 -4.3708754e-05  2.1040082e-04
- Inertia Tensor at CENTER OF GRAVITY with respect to coordinate frame [Kg * m<sup>2</sup>]
  - Ixx Ixy Ixz : 5.1431341e-04  0.0000000e+00  0.0000000e+00
  - Iyx Iyy Iyz : 0.0000000e+00  4.2820999e-04  1.6136111e-06
  - Izx Izy Izz : 0.0000000e+00  1.6136111e-06  2.1038697e-04
- Principal Moments of Inertia [Kg * m<sup>2</sup>]
  - I1 : 2.1037502e-04
  - I2 : 4.2822194e-04
  - I3 : 5.1431341e-04