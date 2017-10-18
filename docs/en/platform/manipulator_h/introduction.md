---
layout: archive
lang: en
ref: manipulator_intro
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/manipulator_h/introduction/
sidebar:
  title: Manipulator-H
  nav: "manipulator_h"
---

# [Introduction](#introduction)

- This manual applies to the Dynamixel PRO-based Robotis Manipulator.
- All parameters in this manual are based on default values.
- The manipulator’s configuration is provided. The ArmSDK is based on Windows7 and Visual Studio 2010.
- It is strongly recommended with proficiency with Dynamixel PRO and C++.
- The units utilized in the ArmSDK are in radians (rad) and millimeters (mm).
- Modifying the wiring and components or performances not stated on this guide may result on adverse operations.
- This manual utilizes the term “arm,” “Manipulator,” and “robot” interchangeably to describe product. The guide also may refer to Dynamixel Pro actuators to simply “Dynamixel,” “servo,” “motor,” or “actuator.”

`Last Updated` : 5 November, 2014

## [Safety Information](#safety-information)

{% capture manipulator_danger_01 %}
`DANGER`

Information appearing in a DANGER concerns the protection of personnel from the immediate and imminent hazards that, if not avoided, will result in immediate, serious personal injury or loss of life in addition to equipment damage.
- Keep away from the robot while its moving..
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

|Name|Quantity|
|:---:|:---:|
|Manipulator|1|
|USB2Dyanmixel|1|
|4P Cable(500mm)|2|
|Power Cable(1,200mm)|2|
|4P expansion hub|1|
|Power expansion hub|1|
|Gripper(optional)|1|
|Support(optional)|2|
|Base Plate(optional)|1|
|3x8 wrench bolt|20|
|3x12 wrench bolt|20|

## [Layout](#layout)

i) Dimension of Manipulator-H

 
 
ii) Dimension of Manipulator-L

 
 
ii) Wiring

 
- The diagram above illustrates joints 1~6 connected in daisy-chain (serial) configuration with 4P Cable.
- Joint 1 (labeled as “1st”) connects to USB2Dynamixel via 4P Cable.
- USB2Dynamixel connects to PC via USB hub.
- Dynamixel Pro is powered from a a power supply via power expansion hub.
- Joints 5 and 6 (model: L42 - 10 - S300 – R) are not separately powered; instead power comes from the same 4P Cable.
- You may obtain more 4P or Power Cables via ROBOTIS or see section 2.2 Preparation - ii) Cable.
- Please refer to “2.1 Installation of Manipulator” for more info.

## [Specifications](#specifications)

## [D-H Configuration](#d-h-configuration)

## [Home Position](#home-position)

# [Getting Started](#getting-started)

## [Prerequisite](#prerequisite)

## [Preparation](#preparation)

## [Product Assembly](#product-assembly)

## [USB2Dynamixel Setting](#usb2dynamixel-setting)

## [Manipulator Test](#manipulator-test)

## [Manipulator SDK](#manipulator-sdk)

# [Examples](#examples)

## [ArmMonitor](#armmonitor)

## [SimplePtoP](#simpleptop)

## [SimpleIK](#simpleik)

## [SimpleTorqueFK](#simpletorquefk)

# [Manipulator SDK Programming](#manipulator-sdk-programming)

## [SDK Description](#sdk-description)

## [SDK Flowchart](#sdk-flowchart)

# [Firmware Recovery](#firmware-recovery)

# [References](#references)

## [AMSDK Define](#armsdk-define)

## [ARMSDK Math](#armsdk-math)

## [MotionEngine](#motionengine)

## [RobotisLib](#robotislib)

## [Timer](#timer)

## [Mass Property](#mass-property)
