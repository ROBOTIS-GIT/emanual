---
layout: archive
lang: en
ref: op3_introduction
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/introduction/
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
product_group: op3
page_number: 1
---

# [Introduction](#introduction)

## [What is OP3?](#what-is-op3)
Open Platform Humanoid Project

![](/assets/images/platform/op3/op3_product_rev2.png)

ROBOTIS OP3 is the latest miniature humanoid robot platform from ROBOTIS that succeeds ROBOTIS OP(aka “DARWIN OP”) and ROBOTIS OP2(aka “DARWIN 2” or “DARWIN OP2”). One of the noticeable changes of ROBOTIS OP3 is made in actuator by replacing MX-28 actuators with XM-430 actuators. Another significant change is also made in internal PC by replacing Atom based SBC(Single Board Computer) with Intel i3 based NUC. With the XM-430 which supports Dynamixel Protocol 2.0, OP3 has improved torque along with current based control and loaded with various functions. Intel NUC allows highly improved computing power that supports 64-bit OS and Bluetooth 4.1. In addition, OP3 is developed under ROS(Robot Operating System) to utilize various packages in ROS ecosystem. All these hardware improvements and ROS support allows developers to focus more on research and development compare to the preceding robots.

- Physical Differences from ROBOTIS OP2  
  - ROBOTIS OP3 does not come with a design skin, however, 3D modeling files are provided in order to support 3D print for the default design skin.

  ![](/assets/images/platform/op3/op3_002_rev2.png)

OP3 looks quite different from OP2 as default skin is not provided. Users can download design skin files.  
Downloaded skin files can be used for 3D printing.  
ROBOTIS OP3 is loaded Intel NUC with i3 processor to achieve significant improvement in computing power.  
OP3 supports HDMI and Display Port(DP) while OP2 only supports mini HDMI.  
There are 1 RGB LED and 3 LEDs, 4 buttons on the back of OP3. From left to right, each button stands for Mode, Start, User, Reset.

- Here are some mechanical differences :
  - New mini HDMI port connector on the ROBOTIS OP2
  - Location of the ports
  - ROBOTIS OP3 no longer has the 3.5mm microphone and audio jacks

  ![](/assets/images/platform/op3/op3_003_rev2.png)

  > Moderate changes have been made in the back panel of OP3.

- Advantages of developing with ROBOTIS OP3 compared to ROBOTIS OP2  
  As mentioned above, there are several changes in OP3 and advantages of the new OP3 are listed as follows:
  - New Actuators(higher torque)
  - Increase of SSD capacity
  - Increase of RAM capacity
  - Dramatic improvement in computational power
  - Replacing Mini HDMI with HDMI
  - User friendly sub-controller(CM-730 → OpenCR)
  - Improved camera

- Hardware Spec Comparison

|               |                         ROBOTIS OP2                          |                                   ROBOTIS OP3                                   |
|:-------------:|:------------------------------------------------------------:|:-------------------------------------------------------------------------------:|
|   Actuator    |                            MX-28                             |                                   XM430-W350                                    |
|      CPU      |           Intel Atom N2600<br />@1.6GHz dual core            |                     Intel Core i3 processor<br />dual core                      |
|      RAM      |       2GB DDR3 SODIMM 1066MHz<br />(user-replaceable)        |      8GB DDR4 SODIMMs 2133MHz<br />(32GB maximum)<br />(user-replaceable)       |
|    Storage    |    half-size mSATA module (32GB)<br />(user-replaceable)     |                 M.2 SSD module (128GB)<br />(user-replaceable)                  |
| Compatible OS | any Linux release (32-bit)<br />any Windows release (32-bit) |   any Linux release (32-bit/64-bit)<br />any Windows release (32-bit/64-bit)    |
|  Networking   | Realtek 10/100/1000 Mbps Ethernet<br />802.11n (2.4GHz-only) | Intel 10/100/1000 Mbps Ethernet<br />802.11ac (2.4GHz, 5GHz)<br />Bluetooth 4.1 |
|    Camera     |                  Logitech C905 (1600x1200)                   |                            Logitech C920 (1920x1080)                            |

ROBOTIS OP3 is an affordable, miniature humanoid robot platform with advanced computational power, sophisticated sensors, high payload capacity, and dynamic motion ability to enable many exciting research and education activities.

- Actuator Spec Comparisons

|               |          MX-28           |        XM430-W350        |
|:-------------:|:------------------------:|:------------------------:|
|    Weight     |           77g            |           82g            |
|   Dimension   | 35.6mm x 50.6mm x 35.5mm | 28.5mm x 46.5mm x 34.0mm |
|  Gear Ratio   |         193 : 1          |        353.5 : 1         |
| Stall Torque  |         2.5 N.m          |         4.1 N.m          |
| Stall Current |          1.4 A           |          2.3 A           |
| No Load Speed |          55 RPM          |          46 RPM          |
|   Protocol    |         1.0 Only         |         1.0, 2.0         |

- XM430 series actuator is easier to assemble and maintain as well as supporting various control algorithms.
  - Reduced size and increased torque
  - Metal case with integrated assembly bolt taps
  - Hollow back case with cable cover
  - 6 operating modes
  - Current-based torque control
  - Profile control for smooth motion planning

- ROBOTIS-OP3 Specifications

|                              |                                               ROBOTIS OP3                                                |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------:|
|            Height            |                                               About 510mm                                                |
|            Weight            |                                     About 3.5kg (without skin cover)                                     |
|             DOF              |                                                    20                                                    |
|           Actuator           |                                               XM430-W350-R                                               |
|       Main Controller        | INTEL NUC i3<br />Intel Core i3 processor dual core<br />8GB RAM DDR4 SODIMMs 2133MHz<br />128GB M.2 SSD |
|        Sub Controller        |                                                  OpenCR                                                  |
|            Camera            |                                       Logitech C920 HD Pro Webcam                                        |
|          IMU Sensor          |                       3-Axis Gyroscope, 3-Axis Accelerometer, 3-Axis Magnetometer                        |
|           Battery            |                                         Lipo 3cell 11.1v 1800mA                                          |
|          IO Device           |                     RGB LED x 1, LED x 3 (Red, Green, Blue), Button x 4, Speaker x 1                     |
|        Installable OS        |                any Linux release (32-bit/64-bit)<br />any Windows release (32-bit/64-bit)                |
| Development<br />Environment |                             OS : Linux (64-bit)<br />C++, ROS, Dynamixel SDK                             |


## [Safety Information](#safety-information)

**CAUTION** : ROBOTIS will not be responsible for any loss or damage whatsoever caused resulting from user’s negligence or misuse of the product.
{: .notice--warning}

- Read the instruction carefully before getting started.
- Not suitable for children under 15 years old.
- Do not use any other tools other than those provided in the kit.
- Keep the robot away from your face and body when the robot is operating.
- Prevent from getting your fingers stuck between frames.
- Do not place the robot near water, heat or fire.
- Only use the battery and charger included in the kit.
- Gears must be replaced after long excessive use.

## [Package Contents](#package-contents)

Check your ROBOTIS OP3 package for the following items.

| No | Item                                     | Quantity |
|:---|:-----------------------------------------|:--------:|
| 1  | Fully-assembled ROBOTIS OP3 robot        |    1     |
| 2  | USB Thumb Drive (with recovery software) |    1     |
| 3  | Fuse                                     |    2     |
| 4  | Ball                                     |    1     |
| 5  | Quick Start Manual                       |    1     |
| 6  | Spare Cables                             |  1 pack  |
| 7  | Loctite                                  |    1     |
| 8  | Wrench & Screw Driver                    |  1 set   |
| 9  | Power Cable                              |    1     |
| 10 | DC Power Supply                          |    1     |
| 11 | Spare Bolts and Nuts                     |  1 pack  |
| 12 | Ethernet Cable                           |    1     |
| 13 | Battery Charger                          |    1     |
| 14 | Battery Pack                             |    3     |
| 15 | Hard Case                                |    1     |

![](/assets/images/platform/op3/op3_005_rev2-1.png)

## [Layout](#layout)

![](/assets/images/platform/op3/op3_006_rev2.png)

![](/assets/images/platform/op3/op3_007_rev2.png)

**CAUTION** : Layout of the front and back panel is subject to change depends on the selected built-in PC.
{: .notice--warning}

## [Charging Battery](#charging-battery)

Please charge the battery pack according to the following procedure.

![](/assets/images/platform/op3/op3_008.png)

## [Battery Hot Swap](#battery-hot-swap)

The battery of ROBOTIS-OP3 can be replaced without shutting down the robot.  
To replace battery during operation, please follow the below procedure.

![](/assets/images/platform/op3/op3_009.png)
