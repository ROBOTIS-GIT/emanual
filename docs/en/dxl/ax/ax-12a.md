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

![](/assets/images/dxl/ax/ax-12+_product.png)
![](/assets/images/dxl/ax/ax-12a_product.png)

> AX-12+, AX-12A

`Note` AX-12+ is the improved version of existing AX-12; the design of circuit, material, and wheel gear are specially improved.
{: .notice}

`Note` AX-12A is a new version of the AX-12+ with the same performance but more advanced external design. Only the AX-12A is now being sold.
{: .notice--warning}

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

## [EEPROM 영역](#eeprom-영역)

| Address | Size<br>(Byte) | Data Name                                   | Description                        | Access | Initial<br />Value |
|:--------|:---------------|:--------------------------------------------|:-----------------------------------|:-------|:-------------------|
| 0       | 2              | [Model Number](#model-number)               | Model Number                       | R      | 12                 |
| 2       | 1              | [Firmware Version](#firmware-version)       | Firmware Version                   | R      | -                  |
| 3       | 1              | [ID](#id)                                   | DYNAMIXEL ID                       | RW     | 1                  |
| 4       | 1              | [Baud Rate](#baud-rate)                     | Communication Speed                | RW     | 1                  |
| 5       | 1              | [Return Delay Time](#return-delay-time)     | Response Delay Time                | RW     | 250                |
| 6       | 2              | [CW Angle Limit](#cw-angle-limit)           | Clockwise Angle Limit              | RW     | 0                  |
| 8       | 2              | [CCW Angle Limit](#ccw-angle-limit)         | Counter-Clockwise Angle Limit      | RW     | 1023               |
| 11      | 1              | [Temperature Limit](#temperature-limit)     | Maximum Internal Temperature Limit | RW     | 70                 |
| 12      | 1              | [Min Voltage Limit](#min-voltage-limit)     | Minimum Input Voltage Limit        | RW     | 60                 |
| 13      | 1              | [Max Voltage Limit](#max-voltage-limit)     | Maximum Input Voltage Limit        | RW     | 140                |
| 14      | 2              | [Max Torque](#max-torque)                   | Maximun Torque                     | RW     | 1023               |
| 16      | 1              | [Status Return Level](#status-return-level) | Select Types of Status Return      | RW     | 2                  |
| 17      | 1              | [Alarm LED](#alarm-led)                     | LED for Alarm                      | RW     | 36                 |
| 18      | 1              | [Shutdown](#shutdown)                       | Shutdown Error Information         | RW     | 36                 |


## [RAM 영역](#ram-영역)

| Address | Size<br>(Byte) | Data Name                                       | Description                  | Access | Initial<br />Value |
|:--------|:---------------|:------------------------------------------------|:-----------------------------|:-------|:-------------------|
| 24      | 1              | [Torque Enable](#torque-enable)                 | Motor Torque On/Off          | RW     | 0                  |
| 25      | 1              | [LED](#led)                                     | Status LED On/Off            | RW     | 0                  |
| 26      | 1              | [CW Compliance Margin](#cw-compliance-margin)   | CW Compliance Margin         | RW     | 1                  |
| 27      | 1              | [CCW Compliance Margin](#ccw-compliance-margin) | CCW Compliance Margin        | RW     | 1                  |
| 28      | 1              | [CW Compliance Slope](#cw-compliance-slope)     | CW Compliance Slope          | RW     | 32                 |
| 29      | 1              | [CCW Compliance Slope](#ccw-compliance-alope)   | CCW Compliance Slope         | RW     | 32                 |
| 30      | 2              | [Goal Position](#goal-position)                 | Target Position              | RW     | -                  |
| 32      | 2              | [Moving Speed](#moving-speed)                   | Moving Speed                 | RW     | -                  |
| 34      | 2              | [Torque Limit](#torque-limit)                   | Torque Limit(Goal Torque)    | RW     | ADD 14&amp;15      |
| 36      | 2              | [Present Position](#present-position)           | Present Position             | R      | -                  |
| 38      | 2              | [Present Speed](#present-speed)                 | Present Speed                | R      | -                  |
| 40      | 2              | [Present Load](#present-load)                   | Present Load                 | R      | -                  |
| 42      | 1              | [Present Voltage](#present-voltage)             | Present Voltage              | R      | -                  |
| 43      | 1              | [Present Temperature](#present-temperature)     | Present Temperature          | R      | -                  |
| 44      | 1              | [Registered](#registered)                       | If Instruction is registered | R      | 0                  |
| 46      | 1              | [Moving](#moving)                               | Movement Status              | R      | 0                  |
| 47      | 1              | [Lock](#lock)                                   | Locking EEPROM               | RW     | 0                  |
| 48      | 2              | [Punch](#punch)                                 | Minimum Current Threshold    | RW     | 32                 |


## [Control Table Description](#control-table-description)

### <a name="model-number"></a>**[Model Number (0)](#model-number-0)**
 This address stores model number of the DYNAMIXEL.

### <a name="firmware-version"></a>**[Firmware Version (2)](#firmware-version-2)**
 This address stores firmware version of the DYNAMIXEL.

### <a name="id"></a>**[ID (3)](#id-3)**
{% include en/dxl/control_table_id.md %}

### <a name="baud-rate"></a>**[Baud Rate (4)](#baud-rate-4)**
Baud Rate determines serial communication speed between a controller and DYNAMIXELs.

|   Value    | Baud Rate(bps) | Margin of Error |
|:----------:|:--------------:|:---------------:|
| 1(Default) |       1M       |     0.000%      |
|     3      |    500,000     |     0.000%      |
|     4      |    400,000     |     0.000%      |
|     7      |    250,000     |     0.000%      |
|     9      |    200,000     |     0.000%      |
|     16     |     115200     |     -2.124%     |
|     34     |     57600      |     0.794%      |
|    103     |     19200      |     -0.160%     |
|    207     |      9600      |     -0.160%     |

`Note` Less than 3% of the baud rate error margin will not affect to UART communication.
{: .notice}

### <a name="return-delay-time"></a>**[Return Delay Time (5)](#return-delay-time-5)**
{% include en/dxl/control_table_return_delay_time.md %}

### <a name="cw-angle-limit"></a><a name="ccw-angle-limit"></a>**[CW/CCW Angle Limit(6, 8)](#cwccw-angle-limit6-8)**
{% include en/dxl/control_table_angle_limit.md %}

### <a name="temperature-limit"></a>**[Temperature Limit (11)](#temperature-limit-11)**

|     Unit      | Value Range |  |
|:-------------:|:-----------:|::|
| About 1&deg;C |   0 ~ 99    |  |

`Caution` Do not set the temperature lower/higher than the default value. When the temperature alarm shutdown occurs, wait 20 minutes to cool the temperature before re-use. Keep using the product when the temperature is high can cause severe damage.
{: .notice--warning}


### <a name="min-voltage-limit"></a><a name="max-voltage-limit"></a>**[Min/Max Voltage Limit (12, 13)](#minmax-voltage-limit-12-13)**
{% include en/dxl/control_table_volt_limit.md %}

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
{% include en/dxl/control_table_potentio_present_position.md %}

### <a name="present-speed"></a>**[Present Speed (38)](#present-speed-38)**
{% include en/dxl/control_table_present_speed.md %}

### <a name="present-load"></a>**[Present Load (40)](#present-load-40)**
{% include en/dxl/control_table_present_load.md %}

### <a name="present-voltage"></a>**[Present Voltage (42)](#present-voltage-42)**
{% include en/dxl/control_table_present_volt.md %}

### <a name="present-temperature"></a>**[Present Temperature (43)](#present-temperature-43)**
{% include en/dxl/control_table_present_temp.md %}

### <a name="registered-instruction"></a>**[Registered Instruction (44)](#registered-instruction-44)**
{% include en/dxl/control_table_reg_instruction.md %}

### <a name="moving"></a>**[Moving (46)](#moving-46)**
{% include en/dxl/control_table_moving.md %}

### <a name="lock"></a>**[Lock (47)](#lock-47)**
{% include en/dxl/control_table_lock.md %}

### <a name="punch"></a>**[Punch (48)](#punch-48)**
{% include en/dxl/control_table_punch.md %}


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


[Compatibility Guide]: http://en.robotis.com/service/compatibility_table.php?cate=d
