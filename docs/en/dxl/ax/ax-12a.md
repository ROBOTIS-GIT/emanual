---
layout: archive
lang: en
ref: ax-12a
read_time: true
share: true
author_profile: false
permalink: /docs/en/dxl/ax/ax-12a/
sidebar:
  title: AX-12A
  nav: "ax-12a"
---

![](/assets/images/dxl/ax/ax-12+_product.png)![](/assets/images/dxl/ax/ax-12a_product.png)

> AX-12+, AX-12A

`Note` AX-12+ is the improved version of existing AX-12; the design of circuit, material, and wheel gear are specially improved.
{: .notice}

`Note` AX-12A is a new version of the AX-12+ with the same performance but more advanced external design. Only the AX-12A is now being sold.
{: .notice}

# [Specifications](#specifications)

| Item                   | Specifications                                                              |
|:-----------------------|:----------------------------------------------------------------------------|
| Baud Rate              | 7843 bps ~ 1 Mbps                                                           |
| Resolution             | 0.29&deg;                                                                   |
| Running Degree         | 0&deg; ~ 300&deg;<br />Endless Turn                                         |
| Weight                 | 53.5g(AX-12, AX-12+), 54.6g(AX-12A)                                         |
| Dimensions (W x H x D) | 32mm x 50mm x 40mm                                                          |
| Gear Ratio             | 254 : 1                                                                     |
| Stall Torque           | 1.5 N*m (at 12V, 1.5A)                                                      |
| No Load Speed          | 59rpm (at 12V)                                                              |
| Operating Temperature  | -5&deg;C ~ +70&deg;C                                                        |
| Input Voltage          | 9.0 ~ 12.0V (**Recommended : 11.1V**)                                       |
| Command Signal         | Digital Packet                                                              |
| Protocol Type          | Half Duplex Asynchronous Serial Communication<br />(8bit, 1stop, No Parity) |
| Physical Connection    | TTL Level Multi Drop Bus(Daisy Chain Type Connector)                        |
| ID                     | 0 ~ 253                                                                     |
| Feedback               | Position, Temperature, Load, Input Voltage, etc                             |
| Material               | Engineering Plastic                                                         |

`Note` Stall torque is the maximum instantaneous and static  torque. Stable motions are possible with robots designed for loads with 1/5 or less of the stall torque.
{: .notice}

{% include en/dxl/control_table_protocol1.md %}

## [Control Table of EEPROM Area](#control-table-of-eeprom-area)

| Address | Size<br>(Byte) | Data Name                                   | Description                        | Access | Initial<br />Value |
|:--------|:---------------|:--------------------------------------------|:-----------------------------------|:-------|:--------------|
| 0       | 2              | [Model Number](#model-number)               | Model Number                       | R      | 12            |
| 2       | 1              | [Firmware Version](#firmware-version)       | Firmware Version                   | R      | -             |
| 3       | 1              | [ID](#id)                                   | DYNAMIXEL ID                       | RW     | 1             |
| 4       | 1              | [Baud Rate](#baud-rate)                     | Communication Speed                | RW     | 1             |
| 5       | 1              | [Return Delay Time](#return-delay-time)     | Response Delay Time                | RW     | 250           |
| 6       | 2              | [CW Angle Limit](#cw-angle-limit)           | Clockwise Angle Limit              | RW     | 0             |
| 8       | 2              | [CCW Angle Limit](#ccw-angle-limit)         | Counter-Clockwise Angle Limit      | RW     | 1023          |
| 11      | 1              | [Temperature Limit](#temperature-limit)     | Maximum Internal Temperature Limit | RW     | 70            |
| 12      | 1              | [Min Voltage Limit](#min-voltage-limit)     | Minimum Input Voltage Limit        | RW     | 60            |
| 13      | 1              | [Max Voltage Limit](#max-voltage-limit)     | Maximum Input Voltage Limit        | RW     | 140           |
| 14      | 2              | [Max Torque](#max-torque)                   | Maximun Torque                     | RW     | 1023          |
| 16      | 1              | [Status Return Level](#status-return-level) | Select Types of Status Return      | RW     | 2             |
| 17      | 1              | [Alarm LED](#alarm-led)                     | LED for Alarm                      | RW     | 36            |
| 18      | 1              | [Shutdown](#shutdown)                       | Shutdown Error Information         | RW     | 36            |


## [Control Table of RAM Area](#control-table-of-ram-area)

| Address | Size<br>(Byte) | Data Name                                       | Description                  | Access | Initial<br />Value |
|:--------|:---------------|:------------------------------------------------|:-----------------------------|:-------|:--------------|
| 24      | 1              | [Torque Enable](#torque-enable)                 | Motor Torque On/Off          | RW     | 0             |
| 25      | 1              | [LED](#led)                                     | Status LED On/Off            | RW     | 0             |
| 26      | 1              | [CW Compliance Margin](#cw-compliance-margin)   | CW Compliance Margin         | RW     | 1             |
| 27      | 1              | [CCW Compliance Margin](#ccw-compliance-margin) | CCW Compliance Margin        | RW     | 1             |
| 28      | 1              | [CW Compliance Slope](#cw-compliance-slope)     | CW Compliance Slope          | RW     | 32            |
| 29      | 1              | [CCW Compliance Slope](#ccw-compliance-alope)   | CCW Compliance Slope         | RW     | 32            |
| 30      | 2              | [Goal Position](#goal-position)                 | Target Position              | RW     | -             |
| 32      | 2              | [Moving Speed](#moving-speed)                   | Moving Speed                 | RW     | -             |
| 34      | 2              | [Torque Limit](#torque-limit)                   | Torque Limit(Goal Torque)    | RW     | ADD 14&amp;15 |
| 36      | 2              | [Present Position](#present-position)           | Present Position             | R      | -             |
| 38      | 2              | [Present Speed](#present-speed)                 | Present Speed                | R      | -             |
| 40      | 2              | [Present Load](#present-load)                   | Present Load                 | R      | -             |
| 42      | 1              | [Present Voltage](#present-voltage)             | Present Voltage              | R      | -             |
| 43      | 1              | [Present Temperature](#present-temperature)     | Present Temperature          | R      | -             |
| 44      | 1              | [Registered](#registered)                       | If Instruction is registered | R      | 0             |
| 46      | 1              | [Moving](#moving)                               | Movement Status              | R      | 0             |
| 47      | 1              | [Lock](#lock)                                   | Locking EEPROM               | RW     | 0             |
| 48      | 2              | [Punch](#punch)                                 | Minimum Current Threshold    | RW     | 32            |


## [Control Table Description](#control-table-description)

### <a name="model-number"></a>**[Model Number (0)](#model-number-0)**
 This address stores model number of the DYNAMIXEL.

### <a name="firmware-version"></a>**[Firmware Version (2)](#firmware-version-2)**
 This address stores firmware version of the DYNAMIXEL.

### <a name="id"></a>**[ID (3)](#id-3)**
{% include en/dxl/control_table_id.md %}

### <a name="baud-rate"></a>**[Baud Rate (4)](#baud-rate-4)**
{% include en/dxl/control_table_baudrate.md %}

### <a name="return-delay-time"></a>**[Return Delay Time (5)](#return-delay-time-5)**
{% include en/dxl/control_table_return_delay_time.md %}

### <a name="cw-angle-limit"></a><a name="ccw-angle-limit"></a>**[CW/CCW Angle Limit(6, 8)](#cwccw-angle-limit6-8)**
{% include en/dxl/control_table_angle_limit.md %}

### <a name="temperature-limit"></a>**[Temperature Limit (11)](#temperature-limit-11)**
{% include en/dxl/control_table_temp_limit.md %}

### <a name="min-voltage-limit"></a><a name="max-voltage-limit"></a>**[Min/Max Voltage Limit (12, 13)](#minmax-voltage-limit-12-13)**
{% include en/dxl/control_table_volt_limit_high.md %}

### <a name="max-torque"></a>**[Max Torque (14)](#max-torque-14)**
{% include en/dxl/control_table_max_torque.md %}

### <a name="status-return-level"></a>**[Status Return Level (16)](#status-return-level-16)**
{% include en/dxl/control_table_status_return_lv.md %}

### <a name="alarm-led"></a><a name="shutdown"></a>**[Alarm LED(17), Shutdown(18)](#alarm-led17-shutdown18)**
{% include en/dxl/control_table_alarm_shutdown.md %}

### <a name="torque-enable"></a>**[Torque Enable (24)](#torque-enable-24)**
{% include en/dxl/control_table_torque_enable.md %}

### <a name="led"></a>**[LED (25)](#led-25)**
{% include en/dxl/control_table_led.md %}

### <a name="cw-compliance-margin"></a><a name="ccw-compliance-margin"></a>**[Compliance Margin (26, 27)](#compliance-margin-26-27)**
{% include en/dxl/control_table_compliance_margin.md %}

### <a name="cw-compliance-slope"></a><a name="ccw-compliance-slope"></a>**[Compliance Slope (28, 29)](#compliance-slope-28-29)**
{% include en/dxl/control_table_compliance_slope.md %}

### <a name="goal-position"></a>**[Goal Position (30)](#goal-position-30)**
{% include en/dxl/control_table_dx_goal_position.md %}

### <a name="moving-speed"></a>**[Moving Speed (32)](#moving-speed-32)**
{% include en/dxl/control_table_moving_speed.md %}

### <a name="torque-limit"></a>**[Torque Limit (34)](#torque-limit-34)**
{% include en/dxl/control_table_torque_limit.md %}

### <a name="present-position"></a>**[Present Position (36)](#present-position-36)**
It is the current position value of Dynamixel.
The range of the value is 0~1023 (0x3FF), and the unit is 0.29 degree.

![](/assets/images/dxl/dx/dx_series_goal_position.png)
The picture above is the front view of Dynamixel.

`Caution` If it is set to Wheel Mode, the value cannot be used to measure the moving distance and the rotation frequency.
{: .notice--warning}

### <a name="present-speed"></a>**[Present Speed (38)](#present-speed-38)**
It is the current moving speed.
0~2047 (0X7FF) can be used.
If a value is in the rage of 0~1023, it means that the motor rotates to the CCW direction.
If a value is in the rage of 1024~2047, it means that the motor rotates to the CW direction.
That is, the 10th bit becomes the direction bit to control the direction, and 0 and 1024 are equal.
The unit of this value varies depending on operation mode.

+ Joint Mode
  The unit is about 0.111rpm.
  For example, if it is set to 300, it means that the motor is moving to the CCW direction at a rate of about 33.3rpm.

+ Wheel Mode
  The unit is about 0.1%.
  For example, if it is set to 512, it means that the torque is controlled by 50% of the maximum torque to the CCW direction.

### <a name="present-load"></a>**[Present Load (40)](#present-load-40)**
It means currently applied load.
The range of the value is 0~2047, and the unit is about 0.1%.
If the value is 0~1023, it means the load works to the CCW direction.
If the value is 1024~2047, it means the load works to the CW direction.
That is, the 10th bit becomes the direction bit to control the direction, and 1024 is equal to 0.
For example, the value is 512, it means the load is detected in the direction of CCW about 50% of the maximum torque.

|  Bit  | 15 ~ 11 |       10       |       9 ~ 0       |
|:-----:|:-------:|:--------------:|:-----------------:|
| Value |    0    | Load Direction | Data (Load Ratio) |

`Note` CCW Load : Load Direction = 0, CW Load : Load Direction = 1
{: .notice}

`Note` Present load is an inferred value based on the internal output value; not a measured value using torque sensor, etc. Therefore, it may be inaccurate for measuring weight or torque. It is recommended to use it for predicting the direction and size of the force being applied to the joint.
{: .notice}

### <a name="present-voltage"></a>**[Present Voltage (42)](#present-voltage-42)**
It is the size of the current voltage supplied.
This value is 10 times larger than the actual voltage. For example, when 10V is supplied, the data value is 100 (0x64)

### <a name="present-temperature"></a>**[Present Temperature (43)](#present-temperature-43)**
It is the internal temperature of Dynamixel in Celsius.
Data value is identical to the actual temperature in Celsius. For example, if the data value is 85 (0x55), the current internal temperature is 85&deg;C.

### <a name="registered-instruction"></a>**[Registered Instruction (44)](#registered-instruction-44)**

| Value | Description                                    |
|:-----:|:-----------------------------------------------|
|   0   | There are no commands transmitted by REG_WRITE |
|   1   | There are commands transmitted by REG_WRITE    |

`Note` If ACTION command is executed, the value is changed into 0.
{: .notice}

### <a name="moving"></a>**[Moving (46)](#moving-46)**

| Value | Description                                    |
|:-----:|:-----------------------------------------------|
|   0   | Goal position command execution is completed   |
|   1   | Goal position command execution is in progress |

### <a name="lock"></a>**[Lock (47)](#lock-47)**

| Value | Description                    |
|:-----:|:-------------------------------|
|   0   | EEPROM area can be modified    |
|   1   | EEPROM area cannot be modified |

`Caution` If Lock is set to 1, the power must be turned off and then turned on again to change into 0.
{: .notice--warning}

### <a name="punch"></a>**[Punch (48)](#punch-48)**
Current to drive motor is at minimum.
Can choose vales from 0x20 to 0x3FF.


# [How to Assemble](#how-to-assemble)

![](/assets/images/dxl/ax/ax_12a_frame_assembly_01.png)

![](/assets/images/dxl/ax/ax_12a_frame_assembly_02.png)

![](/assets/images/dxl/ax/ax_series_frame_assembly_01.png)

![](/assets/images/dxl/ax/ax_series_frame_assembly_02.png)

# [Maintenance](#maintenance)

{% include en/dxl/horn_bearing_replacement.md %}

# [Reference](#reference)

`Note` [Compatibility Guide]
{: .notice}

## [Connector Information](#connector-information)

{% include en/dxl/molex_ttl.md %}

## [Drawings](#drawings)

![](/assets/images/dxl/ax/ax-12a_dimension.png)

{% include en/dxl/485_ttl_connection.md %}

[Two's complement]: #

[Compatibility Guide]: http://en.robotis.com/BlueAD/board.php?bbs_id=faq&mode=view&bbs_no=47&page=1&key=&keyword=&sort=&scate=
