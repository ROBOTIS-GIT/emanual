---
layout: archive
lang: en
ref: openmanipulator_overview
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_main
sidebar:
  title: OpenMANIPULATOR
  nav: "openmanipulator"
---



# [OpenMANIPULATOR-X](#openmanipulator-x)

![](/assets/images/platform/openmanipulator_x/OpenManipulator.resized.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_Introduction.resized.jpg)
 
## Feature 

- Low Cost, High Repeatability, 500g Max Payload  
- Precision Servo Control (DYNAMIXEL X-Series) with Feedback  
- Modular Structure and All-in-One Design  
- Easy to Use with PC or Embedded Boards  
- Open Source Hardware (CAD) and Software (SDK)  
- Low Weight Enables Integration with Mobile Robot Platforms  

## Specification

| Items               | Unit    | OpenMANIPULATOR-X                                    |
|:--------------------|:--------|:-----------------------------------------------------|
| **Actuator**        |         | Dynamixel [XM430-W350-T](/docs/en/dxl/x/xm430-w350/) |
| **Input Voltage**   | V       | 12                                                   |
| **DOF**             | -       | 5 (4 DOF + 1 DOF Gripper)                            |
| **Payload**         | g       | 500                                                  |
| **Repeatability**   | mm      | < 0.2                                                |
| **Speed(Joint)**    | RPM     | 46                                                   |
| **Weight**          | kg (lb) | 0.70  (1.54)                                         |
| **Reach**           | mm (in) | 380   (14.9)                                         |
| **Gripper Stroke**  | mm (in) | 20~75 (0.79~2.95)                                    |
| **Communication**   | -       | TTL Level Multidrop BUS                              |
| **Software**        | -       | ROS, Dynamixel SDK, Arduino, Processing              |
| **Main Controller** | -       | PC, OpenCR                                           |


- [OpenMANIPULATOR-X's details](/docs/en/platform/openmanipulator_x/overview/) 

# [OpenMANIPULATOR-PRO](#openmanipulator-pro)
 
![](/assets/images/platform/openmanipulator_pro/logo.png)

<img src="/assets/images/platform/openmanipulator_pro/product_img.png" width="1250">

## Feature

- User Programmable Open-Source Manipulator System 

- Modular Platform for Easy Maintenance and Customization

- No External Control Box & High Weight-to-Payload Ratio


## Specification

|             Item              |                                                                                                                                                                                        OpenMANIPULATOR-PRO RM-P60-RNH                                                                                                                                                                                        |
|:-----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|              DOF              |                                                                                                                                                                                                      6                                                                                                                                                                                                       |
|            Payload            |                                                                                                                                                                                                     3 kg                                                                                                                                                                                                     |
|             Reach             |                                                                                                                                                                                                    645 mm                                                                                                                                                                                                    |
|         Repeatability         |                                                                                                                                                                                                   ±0.05 mm                                                                                                                                                                                                   |
|            Weight             |                                                                                                                                                                                                     5 kg                                                                                                                                                                                                     |
|       Operating voltage       |                                                                                                                                                                                                     24 V                                                                                                                                                                                                     |
|          Resolution           | Joint 1 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 2 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 3 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad) , -501,923 ~ 501,923 (pulse)<br />Joint 5 : -&pi;(rad) ~ &pi;(rad) , -303,750 ~ 303,750 (pulse)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad) , -303,750 ~ 303,750 (pulse) |
| Dynamixel Pro<br />Model Name |                                                                              Joint 1, 2 : [PH54-200-S500-R](/docs/en/dxl/pro_plus/ph54-200-s500-r/) (200W)<br />Joint 3, 4 : [PH54-100-S500-R](/docs/en/dxl/pro_plus/ph54-100-s500-r/)(100W)<br />Joint 5, 6 : [PH42-020-S300-R](/docs/en/dxl/pro_plus/ph42-020-s300-r/) (20W)                                                                               |
|        Operating Range        |                                                                                 Joint 1 : -&pi;(rad) ~ &pi;(rad)<br />Joint 2 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 3 : -&pi;/2(rad) ~ 3&pi;/4(rad)<br />Joint 4 : -&pi;(rad) ~ &pi;(rad)<br />Joint 5 : -&pi;/2(rad) ~ &pi;/2(rad)<br />Joint 6 : -&pi;(rad) ~ &pi;(rad)                                                                                  |
|          Default ID           |                                                                                                                                                     Joint 1 (ID:1), Joint 2 (ID:2), Joint 3 (ID:3),<br />Joint 4 (ID:4), Joint 5 (ID:5), Joint 6 (ID:6)                                                                                                                                                      |
|          Motor type           |                                                                                                                                                                     Brushless DC Servo(H54P Series),<br />Coreless DC Motor(H42P Series)                                                                                                                                                                     |
|     Position sensor type      |                                                                                                                                                                     Absolute Encoder(for Homing),<br />Incremental Encoder(for Control)                                                                                                                                                                      |
|        Communications         |                                                                                                                                                                                                    RS485                                                                                                                                                                                                     |
|    Communication Baudrate     |                                                                                                                                                                                                 1000000 bps                                                                                                                                                                                                  |

- [OpenMANIPULATOR-PRO's details](/docs/en/platform/openmanipulator_pro/overview/) 
