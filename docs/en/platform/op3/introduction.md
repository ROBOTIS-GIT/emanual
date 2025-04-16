---
layout: archive
lang: en
ref: op3_introduction
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/introduction/
tabs: "Revision"
tab_title1: "2025 ~"
tab_title2: "~ 2023"
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
product_group: op3
page_number: 1
---

{::options parse_block_html="true" /}
<section data-id="{{ page.tab_title1 }}" class="tab_contents">

# [Introduction](#introduction)

## [What is OP3?](#what-is-op3)

![](/assets/images/platform/op3/op3_product_rev2.png)

The ROBOTIS OP3 is the latest miniature humanoid robot platform from ROBOTIS, the successor to the ROBOTIS OP (or “DARWIN OP”) and ROBOTIS OP2 (“DARWIN 2” or “DARWIN OP2”). One of the most noticeable changes for the ROBOTIS OP3 is the replacement of MX-28 actuators with the more modern XM-430 DYNAMIXEL Protocol 2.0 servos featuring improved torque, current-based control, and various additional performance improvements. Another major upgrade is the change from an Intel Atom based SBC to a complete Intel i3-based NUC. The Intel NUC provides significantly enhanced computing power, supporting a 64-bit OS and Bluetooth 5. Additionally, the new 2025 OP3 re-release has been developed from the ground up for ROS2 operation (Robot Operating System 2), allowing developers to leverage a wide range of packages from the ROS ecosystem. All these hardware improvements, combined with ROS2 support, enable developers to focus more on research and development compared to the OP3's predecessors and competitors.

- Physical Differences from ROBOTIS OP2: 

OP3 supports HDMI and Display Port(DP) while OP2 only supports mini HDMI.  
There are 1 RGB LED and 3 LEDs, 4 buttons on the back of OP3. From left to right, each button stands for Mode, Start, User, Reset.

- Here are some mechanical differences :
  - The ROBOTIS OP3 features HDMI and DisplayPort output, while the OP2 only supports mini HDMI.
  - ROBOTIS OP3 no longer has 3.5mm microphone and audio jacks
  - ROBOTIS OP3 does not include an aesthetic skin by default; however, 3D model files are provided to enable 3D printing the default design skin, or the customization of your own.

  ![](/assets/images/platform/op3/op3_002_rev2.png)
  - The location of the I/O ports has been changed.

  ![](/assets/images/platform/op3/op3_003_rev3.png)

  > Moderate changes have been made to the back panel of the OP3.

- Advantages of developing with the ROBOTIS OP3 compared to ROBOTIS OP2  
  - New Actuators (higher torque)
  - Increased SSD capacity
  - Increased RAM capacity
  - Dramatic improvement in computational power
  - Replacing Mini HDMI with HDMI
  - User friendly sub-controller (CM-730 → OpenCR)
  - Improved camera

- Hardware Spec Comparison

|               |                         ROBOTIS OP2                          |                                   ROBOTIS OP3                                   |
|:-------------:|:------------------------------------------------------------:|:-------------------------------------------------------------------------------:|
|   Actuator    |                            MX-28                             |                                   XM430-W350                                    |
|      CPU      |           Intel Atom N2600<br />@1.6GHz dual core            |                     Intel Core i3 processor<br />dual core                      |
|      RAM      |       2GB DDR3 SODIMM 1066MHz<br />(user-replaceable)        |      8GB DDR4 SODIMMs 2666MHz<br />(32GB maximum)<br />(user-replaceable)       |
|    Storage    |    half-size mSATA module (32GB)<br />(user-replaceable)     |                 M.2 SSD module (250GB)<br />(user-replaceable)                  |
| Compatible OS | any Linux release (32-bit)<br />any Windows release (32-bit) |   any Linux release (32-bit/64-bit)<br />any Windows release (32-bit/64-bit)    |
|  Networking   | Realtek 10/100/1000 Mbps Ethernet<br />802.11n (2.4GHz-only) | Intel 10/100/1000 Mbps Ethernet<br />802.11ax (2.4GHz, 5GHz)<br />Bluetooth 5 |
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

- Our new X-series XM430 series actuator is easier to assemble and maintain and also supports new control algorithms and operational features.
  - Reduced size and increased torque
  - Metal case with integrated tapped assembly points
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
|       Main Controller        | INTEL NUC i3<br />Intel Core i3 processor dual core<br />8GB RAM DDR4 SODIMMs 2666MHz<br />250GB M.2 SSD |
|        Sub Controller        |                                                  OpenCR                                                  |
|            Camera            |                                       Logitech C920 HD Pro Webcam                                        |
|          IMU Sensor          |                       3-Axis Gyroscope, 3-Axis Accelerometer, 3-Axis Magnetometer                        |
|           Battery            |                                         Lipo 3cell 11.1v 3300mA                                          |
|          IO Device           |                     RGB LED x 1, LED x 3 (Red, Green, Blue), Button x 4, Speaker x 1                     |
|        Installable OS        |                any Linux release (32-bit/64-bit)<br />any Windows release (32-bit/64-bit)                |
| Development<br />Environment |                            OS : Linux (64-bit)<br />C++, ROS2, DYNAMIXEL SDK                             |


## [Safety Information](#safety-information)

**CAUTION** : ROBOTIS is not responsible for any loss or damage whatsoever caused resulting from the end user’s negligence or misuse of the product.
{: .notice--warning}

- Read the instruction manual carefully before getting started.
- Not suitable for children under 15 years old.
- Do not use any tools other than those provided in the kit.
- Keep the robot away from your face and body when the robot is in motion.
- Take appropriate caution to prevent getting your fingers pinched between frames.
- Do not place the robot in or near water, heat or fire.
- Only use the battery and charger included in the kit.
- Servo Gears must be replaced occasionally following use, in order to maintain maximum lifetime and performance.

## [Package Contents](#package-contents)

Check your ROBOTIS OP3 package for the following items.

| No | Item                                     | Quantity |
|:---|:-----------------------------------------|:--------:|
| 1  | Fully-assembled ROBOTIS OP3 robot        |    1     |
| 2  | Battery Pack                             |    2     |
| 3  | Battery Charger                          |    1     |
| 4  | DC Power Supply                          |    1     |
| 5  | Power Cable                              |    1     |
| 6  | Ethernet Cable                           |    1     |
| 7  | Wrenches x 2 & Screw Driver x 2          |  1 set   |
| 8  | Spare Cables                             |  1 pack  |
| 9  | Spare Bolts and Nuts                     |  1 pack  |
| 10 | Ball                                     |    1     |
| 11 | USB Thumb Drive (with recovery software) |    1     |
| 12 | Fuse                                     |    2     |
| 13 | Hard Case                                |    1     |

![](/assets/images/platform/op3/op3_005_rev3-1.png)

## [Layout](#layout)

![](/assets/images/platform/op3/op3_006_rev3.png)

![](/assets/images/platform/op3/op3_007_rev3.png)

**CAUTION** : The Layout of the front and back panel is subject to change depending on the availability of the built-in PC.
{: .notice--warning}

## [Charging Battery](#charging-battery)

This section describes how to charge a battery using the provided charger.

Use the appropriate instruction set depending on the model of charger you intend to use.

### [Using LBC-010](#using-lbc-010)

{% include en/faq/charging_battery.md %}

### [Using IMAX B6MINI CHARGER](#using-imax-b6mini-charger)

The following image provides instructions on how to charge a battery using the IMAX B6MINI charger.

![](/assets/images/platform/op3/op3_008.png)

## [Battery Hot Swap](#battery-hot-swap)

The ROBOTIS-OP3 battery can be replaced without shutting down the robot.  
To replace the battery during operation, please follow the procedure below.

![](/assets/images/platform/op3/op3_009.png)

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/op3/introduction_rev2.md %}
</section>
