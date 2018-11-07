---
layout: archive
lang: en
ref: dxl_pro
permalink: /docs/en/dxl/pro/
sidebar:
  title: DYNAMIXEL PRO
  nav: "dynamixel_pro"
---

![](/assets/images/dxl/pro/dynamixelpro_main.jpg)
>DYNAMIXEL PRO

# [Product Lineup](#product-lineup)

![](/assets/images/dxl/pro/dxl_pro_productline.jpg)

> Product Lineup

- **Integrated robot-driving device**: Contains all necessary features for robot joints integrated into a single module.

  ![](/assets/images/dxl/pro/dxl_pro_intro.gif)

- **Strong and durable reduction cycloid gearing**: Dynamixel PRO implements removable reduction cycloid gears. Small and lightweight cycloids allow a high-ratio reduction gear device. Also cycloid gears are more resistant to vibrations and impacts resulting in minimal backlash.

- **Variety of models**: Dynamixel PRO motor, redactor, reduction ratio, communications type, etc have been accommodated to meet various price ranges. The user is able to choose the most proper Dynamixel PRO model necessary for the robot.

- **Variety of control algorithms**: Dynamixel PRO position, velocity, and electrical current can be controlled via algorithms. The user can control these 3 aspects in any combination and properly tune the robot. Dynamixel PRO provides a graph illustrating the relationship between electrical current and torque. This feature is useful for torque control via current control.

- **Precision control**: with a maximum of 502,000 units per revolution the user can control 0.0007 degrees per unit allowing for high-precision control..

# [Key Specifications](#key-specifications)

|                       Model                        | Dimensions(mm) | Weight | Resolution |      Motor      |
|:--------------------------------------------------:|:--------------:|:------:|:----------:|:---------------:|
| [H54-200-S500-R](/docs/en/dxl/pro/h54-200-s500-r/) | 54 x 126 x 54  |  855g  |  501,923   |   BLDC(Maxon)   |
| [H54-100-S500-R](/docs/en/dxl/pro/h54-100-s500-r/) | 54 x 108 x 54  |  732g  |  501,923   |   BLDC(Maxon)   |
|  [H42-20-S300-R](/docs/en/dxl/pro/h42-20-s300-r/)  |  42 x 84 x 42  |  340g  |  303,750   | Coreless(Maxon) |
|  [M54-60-S250-R](/docs/en/dxl/pro/m54-60-s250-r/)  | 54 x 126 x 54  |  853g  |  251,417   |   BLDC(Maxon)   |
|  [M54-40-S250-R](/docs/en/dxl/pro/m54-40-s250-r/)  | 54 x 108 x 54  |  710g  |  251,417   |   BLDC(Maxon)   |
|  [M42-10-S260-R](/docs/en/dxl/pro/m42-10-s260-r/)  |  42 x 72 x 42  |  269g  |  263,187   | Coreless(Maxon) |
|  [L54-50-S290-R](/docs/en/dxl/pro/l54-50-s500-r/)  | 54 x 108 x 54  |  656g  |  207,692   |      BLDC       |
|  [L54-50-S500-R](/docs/en/dxl/pro/l54-50-s290-r/)  | 54 x 108 x 54  |  656g  |  361,384   |      BLDC       |
|  [L54-30-S400-R](/docs/en/dxl/pro/l54-30-s500-r/)  | 54 x 108 x 54  |  612g  |  288,395   |      BLDC       |
|  [L54-30-S500-R](/docs/en/dxl/pro/l54-30-s400-r/)  | 54 x 108 x 54  |  591g  |  361,384   |      BLDC       |
|  [L42-10-S300-R](/docs/en/dxl/pro/l42-10-s300-r/)  |  42 x 72 x 42  |  257g  |   4,096    |    Coreless     |

# [Communication Circuitry](#communication-circuitry)

## [Connection to UART](#connection-to-uart)
To control Dynamixel pro with a personally made Main Controller, the signal of Main Controller UART should be converted into RS485 type signal. The following is a recommended circuit diagram.

![](/assets/images/dxl/pro/485_circuit_pro.png)

[MAX485 Datasheet](http://ecee.colorado.edu/~mcclurel/max485ds.pdf)

The power of Dynamixel is supplied via Pin1(-), Pin2(+). (The above circuit is built into Dynamixel-only controller)

In the above circuit diagram, the direction of data signal of TxD and RxD in the TTL Level is determined according to the level of DIRECTION 485 as follows:
- In case of DIRECTION485 Level = High: The signal of TxD is output to D+ and D-.
- In case of DIRECTION485 Level = Low: The signal of D+ and D- is output to RxD.

## [Pin Arrangement](#pin-arrangement)
Connector pin arrangement is shown below. Dynamixel PRO has two 4-pin connectors arranged in pin-2-pin configuration. In this arrangement it does not matter the order of connection and Dynamixel PRO can be driven like the MX-series. Additionally there is a 2-pin connector dedicated for power input for high-current operations.

![](/assets/images/dxl/pro/clip_image003.png)

![](/assets/images/dxl/pro/clip_image005.jpg)

![](/assets/images/dxl/pro/clip_image007.png)

**WARNING** : When wiring please pay attention to the wire arrangement. Incorrectly connected Dynamixel PRO may be damaged severely.
{: .notice--warning}

## [Confirmation of Connection](#confirmation-of-connection)

The LED of Dynamixel pro flickers once if the power is supplied to Dynamixel pro properly via wiring.
