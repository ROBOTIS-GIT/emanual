---
layout: archive
lang: en
ref: ai_manipulator_main
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/ai_manipulator_main
sidebar:
  title: AI Manipulator
  nav: "openmanipulator"
---
<!--
# [OMY](#omy)

![](/assets/images/platform/omy/omy_logo.png)

![](/assets/images/platform/omy/omy_product.png)

## Feature

- Gripper Haptic Support
- Gripper Trigger Support
- Gravity Compensation Support
- Friction Compensation Support
- ROS2 Support
- Standardized URDF Provided
- Open Source
- Extensive DXL SDK Support

## Specification

### Follower

| Item | OMY-F3M |
|:---:|:---:|
| DOF | 6 |
| Payload | 3 [kg] |
| Reach | 580 [mm] |
| Weight | 13.5 [kg] |
| Operating Voltage | 24 [VDC] |
| Joint Resolution | -π(rad) ~ π(rad), -262,144 ~ 262,144[pulse/rev] |
| Joint Range | Joint 1, 2 : ±360°<br>Joint 3 : ±150°<br>Joint 4, 5, 6 : ±360° |
| DYNAMIXEL-Y Specification | Joint 1,2 : YM080-230-A099-RH<br>Joint 3,4,5,6 : YM070-210-A099-RH |
| Repeatability | ±0.05 [mm] |
| Brake Force | 200% of the continuous torque for each joint |
| TCP Speed | < 900 [mm/s] |
| Host Interface | Ethernet |
| Internal Communications | RS485 |
| Communication Baudrate | 4 [Mbps] |
| Robot Hand | RH-P12-RN |
| Camera | Intel RealSense D405 |

### Leader

| Item | OMY-L100 |
|:---:|:---:|
| DOF | 7 |
| Reach | 560 [mm] |
| Weight | 1.46 [kg] |
| Operating Voltage | 12 [VDC] |
| Joint Resolution | -π(rad) ~ π(rad), -2,048 ~ 2,048 [pulse/rev] |
| Joint Range | Joint 1 : ±180°<br>Joint 2 : -70° ~ +100°<br>Joint 3, 4, 5, 6 : ±180°<br>Joint 7 : -90° ~ +60° |
| DYNAMIXEL-Y Specification | Joint 1,23 : XH540-W150<br>Joint 4,5,6 : XC330-T288<br>Joint 7 : XC330-T181 |
| Host Interface | U2D2 (USB 2.0) |
| Internal Communications | TTL Multidrop Bus |
| Communication Baudrate | 4 [Mbps] |

- [OMY](/docs/en/platform/omy/overview/) 
-->
# [OpenMANIPULATOR-X](#openmanipulator-x)

![](/assets/images/platform/openmanipulator_x/OpenManipulator.resized.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_Introduction.resized.jpg)
 
## Feature 

- Low Cost, High Repeatability, 500g Max Payload  
- Precision Servo Control (DYNAMIXEL-X series) with Feedback  
- Modular Structure and All-in-One Design  
- Easy to Use with PC or Embedded Boards  
- Open Source Hardware (CAD) and Software (SDK)  
- Low Weight Enables Integration with Mobile Robot Platforms  

## Specification

| Items               | Unit    | OpenMANIPULATOR-X                                    |
|:--------------------|:--------|:-----------------------------------------------------|
| **Actuator**        |         | DYNAMIXEL [XM430-W350-T](/docs/en/dxl/x/xm430-w350/) |
| **Input Voltage**   | V       | 12                                                   |
| **DOF**             | -       | 5 (4 DOF + 1 DOF Gripper)                            |
| **Payload**         | g       | 500                                                  |
| **Repeatability**   | mm      | < 0.2                                                |
| **Speed(Joint)**    | RPM     | 46                                                   |
| **Weight**          | kg (lb) | 0.70  (1.54)                                         |
| **Reach**           | mm (in) | 380   (14.9)                                         |
| **Gripper Stroke**  | mm (in) | 20~75 (0.79~2.95)                                    |
| **Communication**   | -       | TTL Level Multidrop BUS                              |
| **Software**        | -       | ROS, DYNAMIXEL SDK, Arduino, Processing              |
| **Main Controller** | -       | PC, OpenCR                                           |


- [OpenMANIPULATOR-X](/docs/en/platform/openmanipulator_x/overview/) 

# [OpenMANIPULATOR-P](#openmanipulator-p)
 
![](/assets/images/platform/openmanipulator_p/logo.png)

![](/assets/images/platform/openmanipulator_p/product_img.png)

## Feature

- User Programmable Open-Source Manipulator System 

- Modular Platform for Easy Maintenance and Customization

- No External Control Box & High Weight-to-Payload Ratio


## Specification

|             Item              |                                                                                                                                                                                        OpenMANIPULATOR-P (RM-P60-RNH)                                                                                                                                                                                        |
|:-----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|              DOF              |                                                                                                                                                                                                      6                                                                                                                                                                                                       |
|            Payload            |                                                                                                                                                                                                     3 kg                                                                                                                                                                                                     |
|             Reach             |                                                                                                                                                                                                    645 mm                                                                                                                                                                                                    |
|         Repeatability         |                                                                                                                                                                                                   ±0.05 mm                                                                                                                                                                                                   |
|            Weight             |                                                                                                                                                                                                     5.76 kg                                                                                                                                                                                                     |
|       Operating voltage       |                                                                                                                                                                                                     24 V                                                                                                                                                                                                     |
|          Resolution           | Joint 1 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 2 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 3 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 5 : -&pi;(rad) ~ &pi;(rad) , -303,750 ~ 303,750 (pulse)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad) , -303,750 ~ 303,750 (pulse) |
| DYNAMIXEL Pro<br />Model Name |                                                                              Joint 1, 2 : [PH54-200-S500-R](/docs/en/dxl/p/ph54-200-s500-r/) (200W)<br />Joint 3, 4 : [PH54-100-S500-R](/docs/en/dxl/p/ph54-100-s500-r/)(100W)<br />Joint 5, 6 : [PH42-020-S300-R](/docs/en/dxl/p/ph42-020-s300-r/) (20W)                                                                               |
|        Operating Range        |                                                                                 Joint 1 : -&pi;(rad) ~ &pi;(rad)<br />Joint 2 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 3 : -&pi;/2(rad) ~ 3&pi;/4(rad)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad)<br />Joint 5 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad)                                                                                  |
|          Default ID           |                                                                                                                                                     Joint 1 (ID:1), Joint 2 (ID:2), Joint 3 (ID:3),<br />Joint 4 (ID:4), Joint 5 (ID:5), Joint 6 (ID:6)                                                                                                                                                      |
|          Motor type           |                                                                                                                                                                     Brushless DC Servo(H54P Series),<br />Coreless DC Motor(H42P Series)                                                                                                                                                                     |
|     Position sensor type      |                                                                                                                                                                     Absolute Encoder(for Homing),<br />Incremental Encoder(for Control)                                                                                                                                                                      |
|        Communications         |                                                                                                                                                                                                    RS485                                                                                                                                                                                                     |
|    Communication Baudrate     |                                                                                                                                                                                                 1000000 bps                                                                                                                                                                                                  |

- [OpenMANIPULATOR-P](/docs/en/platform/openmanipulator_p/overview/) 
