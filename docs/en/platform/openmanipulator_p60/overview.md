---
layout: archive
lang: en
ref: openmanipulator_p60_overview
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_p60/overview/
sidebar:
  title: OpenManipulator RM-P60-RNH
  nav: "openmanipulator_p60"
---

![](/assets/images/platform/manipulator/manipulator_product.gif)

<iframe width="560" height="315" src="https://www.youtube.com/embed/VHpNbKvo0AE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

# [Overview](#overview)

- This manual applies to the Dynamixel PRO or Dynamixel PRO+ based Robotis Manipulator.
- The Dynamixel PRO based Robotis Manipulator is called **Manipulator-H** and the Dynamixel PRO+ based Robotis Manipulator is called **Manipulator-H+**.
- All parameters in this manual are based on default values.
- The manipulator’s configuration is provided. The ArmSDK is based on Windows7 and Visual Studio 2010.
- It is strongly recommended with proficiency with C++ language.
- The units utilized in the ArmSDK are in radians (rad) and millimeters (mm).
- Modifying the wiring and components or performances not stated on this guide may result on adverse operations.
- This manual utilizes the term “arm,” “Manipulator,” and “robot” interchangeably to describe product. The guide also may refer to Dynamixel Pro actuators to simply “Dynamixel,” “servo,” “motor,” or “actuator.”

**NOTE** : **Manipulator-H** does support both ArmSDK and ROS programs. **Manipulator-H+** does not support the ArmSDK. Only ROS programs are provided.
{: .notice}

`Last Updated` : 15 March, 2019

## [Safety Information](#safety-information)

{% capture manipulator_danger_01 %}
`DANGER`

Information appearing in a DANGER concerns the protection of personnel from the immediate and imminent hazards that, if not avoided, will result in immediate, serious personal injury or loss of life in addition to equipment damage.
- Keep away from the robot while its moving.
- Do not touch with the robot with wet hands.
- Turn off power of the robot whenever robot is problematic.
{% endcapture %}

<div class="notice--danger">{{ manipulator_danger_01 | markdownify }}</div>


{% capture manipulator_warning_01 %}
`WARNING`

Information appearing in a WARNING concerns the protection of personnel and equipment from potential hazards that can result in personal injury or loss of life in addition to equipment damage.
- Setup robot in an environment low on dust and humidity.
- The robot must always be attached to the based when powered on.
- The robot wiring must be checked prior to powering on.
- The robot connection to power supplly must be check prior to powering on.
- Do not change wiring on Robotis Manipulator while powered on.
{% endcapture %}

<div class="notice--warning">{{ manipulator_warning_01 | markdownify }}</div>

{% capture manipulator_caution_01 %}
`CAUTION`

Information appearing in a CAUTION concerns the protection of personnel and equipment, software, and data from hazards that can result in minor personal injury or equipment damage.
- Keep robot’s workspace clear of object.
- Ensure wiring is not tangled up on every joint.
- Make sure USB2Dynamixel and PC does not interfere with the robot’s moving
{% endcapture %}

<div class="notice--warning">{{ manipulator_caution_01 | markdownify }}</div>


## [Package Contents](#package-contents)

|                                                   Item                                                   | Quantity |
|:--------------------------------------------------------------------------------------------------------:|:--------:|
|                                               Manipulator                                                |    1     |
|                                                   U2D2                                                   |    1     |
|                                             4P Cable(500mm)                                              |    2     |
|                                           Power Cable(1,200mm)                                           |    2     |
|                                             4P expansion hub                                             |    1     |
|                                           Power expansion hub                                            |    1     |
|                                            Gripper(optional)                                             |    1     |
|   [Angle Frame(optional)](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2538&GC=GD070002)    |    2     |
| [Base Plate Frame(optional)](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2538&GC=GD070002) |    1     |
|                                             3x8 wrench bolt                                              |    20    |
|                                             3x12 wrench bolt                                             |    20    |

## [Layout](#layout)

### Dimension of Manipulator-H or Manipulator-H+

![](/assets/images/platform/manipulator/manipulator_h_001.jpg)

### Dimension of Manipulator-L

![](/assets/images/platform/manipulator/manipulator_h_002.jpg)

### Wiring

![](/assets/images/platform/manipulator/manipulator_h_003.jpg)

- The diagram above illustrates joints 1~6 connected in daisy-chain (serial) configuration with 4P Cable.
- Joint 1 (labeled as “1st”) connects to USB2Dynamixel via 4P Cable.
- USB2Dynamixel connects to PC via USB hub.
- Dynamixel Pro is powered from a a power supply via power expansion hub.
- Joints 5 and 6 (model: L42 - 10 - S300 – R) are not separately powered; instead power comes from the same 4P Cable.
- You may obtain more 4P or Power Cables via ROBOTIS or see section 2.2 Preparation - ii) Cable.
- Please refer to “2. Getting started” for more info.

## [Specifications](#specifications)

|Item|Manipulator-H|Manipulator-H+|
|:---:|:---:|:---:|
|DOF|6 DOF|6 DOF|
|Payload|3kg|3kg|
|Weight|5kg|5kg|
|Operating voltage|24V|24V|
|Resolution|Joint 1 : -&pi;(rad) ~ &pi;(rad) , -251,961 ~ 251,961 (pulse)<br />Joint 2 : -&pi;(rad) ~ &pi;(rad) , -251,961 ~ 251,961 (pulse)<br />Joint 3 : -&pi;(rad) ~ &pi;(rad) , -251,961 ~ 251,961 (pulse)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad) , -251,961 ~ 251,961 (pulse)<br />Joint 5 : -&pi;(rad) ~ &pi;(rad) , -151,875 ~ 151,875 (pulse)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad) , -151,875 ~ 151,875 (pulse)|Joint 1 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 2 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 3 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 5 : -&pi;(rad) ~ &pi;(rad) , -303,750 ~ 303,750 (pulse)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad) , -303,750 ~ 303,750 (pulse)|
|Dynamixel Pro<br />Model Name|Joint 1, 2 : H54-200-S500-R<br />Joint 3, 4 : H54-100-S500-R<br />Joint 5, 6 : H42-20-S300-R|Joint 1, 2 : H54P-200-S500-R<br />Joint 3, 4 : H54P-100-S500-R<br />Joint 5, 6 : H42P-20-S300-R|
|Operating Range|Joint 1 : -&pi;(rad) ~ &pi;(rad)<br />Joint 2 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 3 : -&pi;/2(rad) ~ 3&pi;/4(rad)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad)<br />Joint 5 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad)|Joint 1 : -&pi;(rad) ~ &pi;(rad)<br />Joint 2 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 3 : -&pi;/2(rad) ~ 3&pi;/4(rad)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad)<br />Joint 5 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad)|
|Default ID|Joint 1 (ID:1), Joint 2 (ID:2), Joint 3 (ID:3),<br />Joint 4 (ID:4), Joint 5 (ID:5), Joint 6 (ID:6)|Joint 1 (ID:1), Joint 2 (ID:2), Joint 3 (ID:3),<br />Joint 4 (ID:4), Joint 5 (ID:5), Joint 6 (ID:6)|
|Motor type|Brushless DC Servo(H54 Series),<br />Coreless DC Motor(H42 Series)|Brushless DC Servo(H54P Series),<br />Coreless DC Motor(H42P Series)|
|Position sensor type|Absolute Encoder(for Homing),<br />Incremental Encoder(for Control)|Absolute Encoder(for Homing),<br />Incremental Encoder(for Control)|
|Communications|RS485|RS485|

## [D-H Configuration](#d-h-configuration)

![](/assets/images/platform/manipulator/manipulator_h_004.jpg)

- DH Parameter

|Link|Link Length(mm)|Link Twist(rad)|Joint Offset(mm)|Joint Angle(rad)|DXL Angle(rad)|
|:---:|:---:|:---:|:---:|:---:|:---:|
|1|0|-&pi;/2|0|0|0|
|2|265.69|0|0|0|![](/assets/images/platform/manipulator/manipulator_h_eq_001.gif)|
|3|30|-&pi;/2|0|0|![](/assets/images/platform/manipulator/manipulator_h_eq_002.gif)|
|4|0|-&pi;/2|258|0|0|
|5|0|-&pi;/2|0|0|0|
|6|0|0|0|0|0|

## [Home Position](#home-position)

The diagram below shows the “home position” of the Dynamixel PROs from Robotis Manipulator.

![](/assets/images/platform/manipulator/manipulator_h_005.jpg)

## [Mass Property](#mass-property)

### Coordinate

![](/assets/images/platform/manipulator/manipulator_h_087.jpg)

Total Mass : 5,551g

### Link 1

![](/assets/images/platform/manipulator/manipulator_h_088.jpg)

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

![](/assets/images/platform/manipulator/manipulator_h_089.jpg)

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

![](/assets/images/platform/manipulator/manipulator_h_090.jpg)

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

![](/assets/images/platform/manipulator/manipulator_h_091.jpg)

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

![](/assets/images/platform/manipulator/manipulator_h_092.jpg)

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
