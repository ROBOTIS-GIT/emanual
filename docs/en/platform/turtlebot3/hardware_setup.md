---
layout: archive
lang: en
ref: turtlebot3_hardware_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/hardware_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 4"></div>

# [Hardware Setup](#hardware-setup)

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_models.png)

## [Main Components](#main-components)

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_burger_components.png)

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_waffle_components.png)

![](/assets/images/platform/turtlebot3/hardware_setup/turtlebot3_waffle_pi_components.png)

## [Part List](#part-list)

TurtleBot3 has two different models: `Burger`, `Waffle` and `Waffle Pi`. The following list shows their components. The big differences between two models are the Motor, the SBC(Single Board Computer) and the Sensors.

### [Chassis Parts](#chassis-parts)

| Part Name             | Burger | Waffle | Waffle Pi |
| :-------------------- | :----: | :----: | :-------: |
| Waffle-Plate          | 8      | 24     | 24        |
| Plate Support M3x35mm | 4      | 12     | 12        |
| Plate Support M3x45mm | 10     | 10     | 10        |
| PCB Support           | 12     | 12     | 12        |
| Wheel                 | 2      | 2      | 2         |
| Tire                  | 2      | 2      | 2         |
| Ball Caster           | 1      | 2      | 2         |
| Camera Bracket        | 0      | 0      | 1         |

### [Motor](#motor)

| Part Name                | Burger | Waffle | Waffle Pi |
| :----------------------- | :----: | :----: | :-------: |
| DYNAMIXEL (XL430-W250-T) | 2      | 0      | 0         |
| DYNAMIXEL (XM430-W210-T) | 0      | 2      | 2         |

### [Board](#board)

| Part Name      | Burger | Waffle | Waffle Pi |
| :------------- | :----: | :----: | :-------: |
| OpenCR1.0      | 1      | 1      | 1         |
| Raspberry Pi 3 | 1      | 0      | 1         |
| Intel® Joule™  | 0      | 1      | 0         |
| USB2LDS        | 1      | 1      | 1         |

### [Remote Controller](#remote-controller)

| Part Name                     | Burger | Waffle | Waffle Pi |
| :---------------------------- | :----: | :----: | :-------: |
| BT-410 Set (Bluetooth 4, BLE) | 0      | 0      | 2         |
| RC-100B (Remote Controller)   | 0      | 0      | 1         |

### [Sensor](#sensor)

| Part Name                       | Burger | Waffle | Waffle Pi |
| :------------------------------ | :----: | :----: | :-------: |
| LDS (HLS-LFCD2)                 | 1      | 1      | 1         |
| Intel® Realsense™ R200          | 0      | 1      | 0         |
| Raspberry Pi Camera Module v2.1 | 0      | 0      | 1         |

### [Memory](#memory)

| Part Name    | Burger | Waffle | Waffle Pi |
| :----------- | :----: | :----: | :-------: |
| MicroSD Card | 1      | 0      | 1         |

### [Cable](cable)

| Part Name                     | Burger | Waffle | Waffle Pi |
| :---------------------------- | :----: | :----: | :-------: |
| Raspberry Pi 3 Power Cable    | 1      | 0      | 1         |
| Intel® Joule™ Power Cable     | 0      | 1      | 0         |
| Li-Po Battery Extension Cable | 1      | 1      | 1         |
| DYNAMIXEL to OpenCR Cable     | 2      | 2      | 2         |
| USB Cable                     | 2      | 2      | 2         |
| Camera Cable                  | 0      | 0      | 1         |

### [Power](power)

| Part Name                   | Burger | Waffle | Waffle Pi |
| :-------------------------- | :----: | :----: | :-------: |
| SMPS 12V5A                  | 1      | 1      | 1         |
| A/C Cord                    | 1      | 1      | 1         |
| LIPO Battery 11.1V 1,800mAh | 1      | 1      | 1         |
| LIPO Battery Charger        | 1      | 1      | 1         |

### [Tools](tools)

| Part Name            | Burger | Waffle | Waffle Pi |
| :------------------- | :----: | :----: | :-------: |
| Screw driver         | 1      | 1      | 1         |
| Rivet tool           | 1      | 1      | 1         |
| USB3.0 HUB           | 0      | 1      | 0         |

### [Miscellaneous](miscellaneous)

| Part Name       | Burger | Waffle | Waffle Pi |
| :-------------- | :----: | :----: | :-------: |
| PH_M2x4mm_K     | 8      | 8      | 8         |
| PH_T2x6mm_K     | 4      | 8      | 8         |
| PH_M2x12mm_K    | 0      | 4      | 4         |
| PH_M2.5x8mm_K   | 16     | 12     | 16        |
| PH_M2.5x12mm_K  | 0      | 18     | 20        |
| PH_T2.6x12mm_K  | 16     | 0      | 0         |
| PH_M2.5x16mm_K  | 4      | 4      | 4         |
| PH_M3x8mm_K     | 44     | 140    | 140       |
| NUT_M2          | 0      | 4      | 4         |
| NUT_M2.5        | 20     | 18     | 24        |
| NUT_M3          | 16     | 96     | 96        |
| Rivet_1         | 14     | 20     | 22        |
| Rivet_2         | 2      | 2      | 2         |
| Spacer          | 4      | 4      | 4         |
| Silicone Spacer | 0      | 0      | 4         |
| Bracket         | 5      | 8      | 6         |
| Adapter Plate   | 1      | 1      | 1         |



## [Assembly Manual](#assembly-manual)

TurtleBots3 is delivered as unassembled parts in the boxes. Follow the instructions to assemble TurtleBot3.

- `Download PDF` [Assembly manual for TurtleBot3 Burger](https://drive.google.com/open?id=1tg1Kjz8jt3UtGvxCKRxn4CxdHCnCyK7_)
- `Download PDF` [Assembly manual for TurtleBot3 Waffle](https://drive.google.com/open?id=1DGWuv8c9Fo2giQMvpTTDJWZTkfYxMbxn)
- `Download PDF` [Assembly manual for TurtleBot3 Waffle Pi](https://drive.google.com/open?id=17lOFQrsVRCbtPidy_xvcPoHpRZw3unwC)

## [Assembly Video](#assembly-video)

If it is difficult to assemble with the assembly manual, please refer to the following assembly video.


### [TurtleBot3 Burger](turtlebot3-burger)

<iframe width="640" height="360" src="https://www.youtube.com/embed/rvm-m2ogrLA" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/5D9S_tcenL4" frameborder="0" allowfullscreen></iframe>

### [TurtleBot3 Waffle](turtlebot3-waffle)

<iframe width="640" height="360" src="https://www.youtube.com/embed/1nTMyr4ybi0" frameborder="0" allowfullscreen></iframe>

## [Basic Operation](#basic-operation)

![](/assets/images/platform/turtlebot3/hardware_setup/opencr_models.png)

You can use `PUSH SW 1` and `PUSH SW 2` buttons to see whether your robot has been properly assembled. This process tests the left and right DYNAMIXELs and the OpenCR1.0 board.

1. After assembling TurtleBot3, connect the battery to OpenCR1.0 and turn on the power switch. You can see that the `Power LED` of OpenCR1.0 turns on.
2. Place the robot on the floor. For the test, safety radius of 1 meter (about 40 inches) is recommended.
3. Press and hold `PUSH SW 1` for a few seconds to command the robot to move 30 centimeters (about 12 inches) forward.
4. Press and hold `PUSH SW 2` for a few seconds to command the robot to rotate 180 degrees in place.

## [Open Source Hardware](#open-source-hardware)

Core components of Turtlebot3 are the followings: Chassis, Motors, Wheels, OpenCR1.0, SBC Computer, Sensor and Battery. The chassis are Waffle Plates that holds other components. The Waffle Plate plays an important role as a chassis although its size is as small as your palm. Waffle plate is manufactured with injection mold method to lower the manufacturing cost. However, the CAD data of waffle plate for 3D printing is also available via [Onshape]. Turtlebot3 Burger is a Two-wheeled differential drive type platform, but it is customizable structurally and mechanically in many ways: Cars, Bikes, Trailers and so on.

The CAD data is released to the [Onshape], which is a full-cloud 3D CAD editor. Get access through a web browser from your PC or from portable devices. OnShape allows drawing and assemblying parts with co-workers.

- [TurtleBot3 Burger 3D Model](http://www.robotis.com/service/download.php?no=676)
- [TurtleBot3 Waffle 3D Model](http://www.robotis.com/service/download.php?no=677)
- [TurtleBot3 Waffle Pi 3D Model](http://www.robotis.com/service/download.php?no=678)


[Onshape]: https://cad.onshape.com/documents?filter=recently-opened&column=modifiedAt&order=desc&viewMode=0&q=turtlebot3
[Open Robotics]: http://www.osrfoundation.org/
[ROBOTIS]: http://www.robotis.com
