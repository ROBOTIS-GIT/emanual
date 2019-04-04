---
layout: archive
lang: en
ref: dxl_pro_plus
permalink: /docs/en/dxl/pro_plus/
sidebar:
  title: DYNAMIXEL PRO+
  nav: "dynamixel_pro_plus"
---

![](/assets/images/dxl/pro_plus/pro-plus.png)
> DYNAMIXEL PRO+

# [Product Lineup](#product-lineup)

![](/assets/images/dxl/pro_plus/dynamixel_pro_plus_lineup_table.jpg)

> DYNAMIXEL PRO+ Lineup

- **Integrated robot-driving device** : Contains all necessary features for robot joints integrated into a single module.

  ![](/assets/images/dxl/pro/dxl_pro_intro.gif)

- **Strong and durable reduction cycloid gearing** : DYNAMIXEL PRO+ implements removable reduction cycloid gears. Small and lightweight cycloids allow a high-ratio reduction gear device. Also cycloid gears are more resistant to vibrations and impacts resulting in minimal backlash.

- **Variety of models** : DYNAMIXEL PRO+ motor, reduction ratio, communications type, etc have been accommodated to meet various price ranges. The user is able to choose the most proper DYNAMIXEL PRO+ model necessary for the robot.

- **Variety of control algorithms** : DYNAMIXEL PRO+ adopts position, velocity, and electrical current control algorithms. The user can control these 3 aspects in any combination and properly tune the robot. DYNAMIXEL PRO+ provides a graph illustrating the relationship between electrical current and torque. This feature is useful for torque control via current control.

- **Precision control** : With a maximum of 1,003,846 resolution, users can control about 0.0004 degrees per unit allowing for high-precision control.

# [Key Specifications](#key-specifications)

|                           Model                           | Dimensions(mm) | Weight | Resolution |      Motor       |
|:---------------------------------------------------------:|:--------------:|:------:|:----------:|:----------------:|
| [H54P-200-S500-R](/docs/en/dxl/pro_plus/h54p-200-s500-r/) | 54 x 126 x 54  |  855g  | 1,003,846  |   BLDC (Maxon)   |
| [H54P-100-S500-R](/docs/en/dxl/pro_plus/h54p-100-s500-r/) | 54 x 108 x 54  |  740g  | 1,003,846  |   BLDC (Maxon)   |
| [H42P-020-S300-R](/docs/en/dxl/pro_plus/h42p-020-s300-r/) |  42 x 84 x 42  |  340g  |  607,500   | Coreless (Maxon) |
| [M54P-060-S250-R](/docs/en/dxl/pro_plus/m54p-060-s250-r/) | 54 x 126 x 54  |  855g  |  502,834   |       BLCD       |
| [M54P-040-S250-R](/docs/en/dxl/pro_plus/m54p-040-s250-r/) | 54 x 108 x 54  |  710g  |  502,834   |       BLCD       |
| [M42P-010-S260-R](/docs/en/dxl/pro_plus/m42p-010-s260-r/) |  42 x 72 x 42  |  270g  |  526,374   |     Coreless     |

# [Communication Circuitry](#communication-circuitry)

## [Connection to UART](#connection-to-uart)
To control DYNAMIXEL Pro+ with a personally made Main Controller, the signal of Main Controller UART should be converted into RS485 type signal. The following is a recommended circuit diagram.

![](/assets/images/dxl/pro/485_circuit_pro.png)

[MAX485 Datasheet](http://ecee.colorado.edu/~mcclurel/max485ds.pdf)

The power of DYNAMIXEL is supplied via Pin1(-), Pin2(+). (The above circuit is built into DYNAMIXEL-only controller)

In the above circuit diagram, the direction of data signal of TxD and RxD in the TTL Level is determined according to the level of DIRECTION 485 as follows:
- In case of DIRECTION485 Level = High: The signal of TxD is output to D+ and D-.
- In case of DIRECTION485 Level = Low: The signal of D+ and D- is output to RxD.

## [Pin Arrangement](#pin-arrangement)
Connector pin arrangement is shown below. DYNAMIXEL PRO+ has two 4-pin connectors arranged in pin-2-pin configuration. In this arrangement it does not matter the order of connection and DYNAMIXEL PRO+ can be driven like the MX-series. Additionally there is a 2-pin connector dedicated for power input for high-current operations.

![](/assets/images/dxl/pro_plus/pin_name.png)

![](/assets/images/dxl/pro_plus/connection.png)

![](/assets/images/dxl/pro_plus/wiring.png)

**WARNING** : When wiring please pay attention to the wire arrangement. Incorrectly connected DYNAMIXEL may be damaged severely.
{: .notice--warning}

## [Confirmation of Connection](#confirmation-of-connection)

The LED of DYNAMIXEL pro flickers once if the power is supplied to DYNAMIXEL pro properly via wiring.

# [Drawing](#drawing)
The output horn has been redesigned. Please refer to below comparisons between PRO and PRO+.

![](/assets/images/dxl/pro_plus/h54p_drawing.png)

{% include en/dxl/download_center_notice.md %}
