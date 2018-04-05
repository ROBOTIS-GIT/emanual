---
layout: archive
lang: en
ref: thormang3_introduction
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/thormang3/introduction/
sidebar:
  title: THORMANG3
  nav: "thormang3"
---

# [Introduction](#introduction)

Congratulations on purchasing THORMANG.  
THORMANG will lead you to the robot world with virtually unlimited research possibilities and opportunities.  
Read this guide thouroughly before getting with THORMANG.

![](/assets/images/platform/thormang3/thormang3.png)

- THORMANG3 3D files
  - `Download ZIP` [thormang3_stp.zip]
  - `Download ZIP` [sim_for_thormang3_stl.zip]

## [What is THORMANG3?](#what-is-thormang3)

THOR (Tactical Hazardous Operations Robot) is an affordable, full size humanoid robot platform with advanced
computational power, sophisticated sensors, high payload capacity, and dynamic motion abilities to enable many exciting researches and educational activities.

## [Package Contents](#package-contents)

1. THORMANG3(fully-assembled) × 1
2. Battery packs(in robot) × 1
3. Battery charger × 1
4. Wrench set × 1
5. Screwdrivers × 2
6. Spare cables
7. Spare bolts and nuts
8. USB ×1
9. Carrying Case × 1
10. Carabiner and rope × 2
11. Lift × 1
12. Wireless (D-Link DIR-806A) × 1

![](/assets/images/platform/thormang3/thormang3_001.jpg)

{% capture package_warning %}
`Caution` This package does not include the Operating PC and Power Supplies.
Additional components may need to be purchased as described below.
 - When operating THORMANG3 from a distance, one Operating PC is required.
 - When operating THORMANG3 without batteries, two external power supplies (for actuators and internal PCs) are required.
{% endcapture %}
<div class="notice--warning">{{ package_warning | markdownify }}</div>

Recommended Component Specifications
1. Operating PC
 - Usage : The main PC to remote control THORMANG3
 - Requirements : Linux + ROS installed PC

2. Power Supply for internal PCs
 - Usage : Supplies power to PCs and peripheral devices when operating THORMANG3 with an external power source
 - Requirements : 24V / 10A (at least)
 - Recommended product : 24V 15A DC Universal Regulated Switching Power Supply 360W for CCTV, Radio, Computer Project  
   ![](/assets/images/platform/thormang3/pc_power_supply.jpg)

3. Power Supply for Actuators
 - Usage : Supplies power to Dynamixel when operating THORMANG3 with an external power source.
 - Requirements : 0 ~ 30V / 100A (at least)
 - Recommended product : Instek PSW 30-108 Multi-Range DC Power Supply  
   ![](/assets/images/platform/thormang3/actuator_power_supply.jpg)
   

## [Layout](#layout)

![](/assets/images/platform/thormang3/thormang3_002.jpg)

![](/assets/images/platform/thormang3/thormang3_003.jpg)

![](/assets/images/platform/thormang3/thormang3_004.jpg)

## [Specifications](#specifications)

![](/assets/images/platform/thormang3/thormang3_005.jpg)

### Hardware

|Feature|Description|
|:---:|:---:|
|DOF|29|
|Actuator|200W x 10 / 100W x 11 / 20W x 8|
|Computer|Intel® NUC with Intel® Core™ i5 Processor<br />(DDR4 RAM 8GB / M.2 SSD 128GB) x2|
|Wireless router|Dlink DIR-806A x 1|
|Sensor|Logitech C920 HD Camera x 1<br />Intel Realsense(Option) x 1<br />Hokuyo UTM-30LX-EW(Option) x 1<br />F/T: ATi Mini58-SI-2800-120 x 2<br />IMU: MicroSrain 3DM-GX4-25 x 1|
|Battery|22V, 22000mA x 1<br />18.5V, 11000mA x 1|
|Height|137.5cm|
|Weight|42Kg|

### Software

The followings are source code development environments.
- OS : Linux (Ubuntu LTS 64-bit) with ROS (Robot Operating System)
- Compiler : GNU project C and C++ Compiler
- Programming Language : C++

## [Safety Information](#safety-information)

ROBOTIS is not responsible for any damages or losses resulting from any accidents caused by user’s negligence.
- Read the instructions carefully before getting started.
- Parental guide is necessary for users under 15 years old.
- Do not use tools other than those provided in the kit.
- Keep away from the action radius of the robot when the robot is moving.
- Prevent from getting your fingers stuck in any moving parts.
- Do not keep the robot near water, heat, or fire.
- Do not use batteries or chargers other than provided in the kit.
- Gears must be replaced after long excessive use.


[thormang3_stp.zip]:http://support.robotis.com/en/baggage_files/thormang3/thormang3_stp.zip
[sim_for_thormang3_stl.zip]:http://support.robotis.com/en/baggage_files/thormang3/sim_for_thormang3_stl.zip
