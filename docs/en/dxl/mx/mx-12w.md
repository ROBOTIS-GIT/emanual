---
layout: archive
lang: en
ref: mx-12w
read_time: true
share: true
author_profile: false
permalink: /docs/en/dxl/mx/mx-12w/
sidebar:
  title: MX-12W
  nav: "mx-12w"
---

# MX-12W

![](/assets/images/dxl/mx/mx-12_product.jpg)

# [Specifications](#specifications)

| Item           | Specifications     |
| :------------- | :------------- |
| Baud Rate       | 8000 bps ~ 4.5 Mbps       |
| Resolution | 0.088&deg;  |
| Running Degree | 0&deg; ~ 360&deg;<br />Endless Turn |
| Weight | 54.6g |
| Dimensions (W x H x D) | 32mm x 50mm x 40mm |
| Gear Ratio | 32 : 1  |
| No Load Speed | 470rpm (at 12V) |
| Operating Temperature | -5&deg;C ~ +80&deg;C |
| Input Voltage | 10 ~ 14.8V (**Recommended : 12V**) |
| Standby Current | 60mA |
| Command Signal | Digital Packet |
| Protocol Type | Half Duplex Asynchronous Serial Communication<br />(8bit, 1stop, No Parity) |
| Physical Connection | TTL Level Multidrop Bus(Daisy Chain Type Connector) |
| ID | 0 ~ 253 |
| Feedback | Position, Temperature, Load, Input Voltage, etc |
| Material | Engineering Plastic |

{% include en/dxl/control_table_protocol1.md %}

## [Control Table of EEPROM Area](#control-table-of-eeprom-area)

| Address     | Size(Byte)     | Data Name     | Description     | Access     | Initial Value     |
| :------------- | :------------- | :------------- | :------------- | :------------- | :------------- |
|0|2|[Model Number](#model-number)         | Model Number       | R       | 104 |
|2|1|[Firmware Version](#firmware-version)    |Firmware Version|R|-|
|3|1|[ID](#id)                  |DYNAMIXEL ID      |RW|1|
|4|1|[Baud Rate](#baud-rate)           |Communication Speed|RW|1|
|5|1|[Return Delay Time](#return-delay-time)   |Response Delay Time|RW|250|
|6|2|[CW Angle Limit](#cw-angle-limit)          |Clockwise Angle Limit|RW|0|
|8|2|[CCW Angle Limit](#ccw-angle-limit)          |Counter-Clockwise Angle Limit|RW|4095|
|11|1|[Temperature Limit](#temperature-limit)   |Maximum Internal Temperature Limit|RW|80|
|12|1|[Min Voltage Limit](#min-voltage-limit)   |Minimum Input Voltage Limit|RW|60|
|13|1|[Max Voltage Limit](#max-voltage-limit)   |Maximum Input Voltage Limit|RW|160|
|14|2|[Max Torque](#max-torque)           |Maximun Torque|RW|1023|
|16|1|[Status Return Level](#status-return-level)      |Select Types of Status Return|RW|2|
|17|1|[Alarm LED](#alarm-led)                             |LED for Alarm|RW|36|
|18|1|[Shutdown](#shutdown)            |Shutdown Error Information|RW|36|
|20|2|[Multi Turn Offset](#multi-turn-offset)   |Adjust Position with Offset|RW|0|
|22|1|[Resolution Divider](#resolution-divider) |Divider for Position Resolution|RW|1|


## [Control Table of RAM Area](#control-table-of-ram-area)

| Address     | Size(Byte)     | Data Name     | Description     | Access     | Initial Value     |
| :------------- | :------------- | :------------- | :------------- | :------------- | :------------- |
|24|1|[Torque Enable](#torque-enable)            |Motor Torque On/Off|RW|0|
|25|1|[LED](#led)                             |Status LED On/Off|RW|0|
|26|1|[D Gain](#d-gain)   |Derivative Gain|RW|8|
|27|1|[I Gain](#i-gain)   |Integral Gain|RW|0|
|28|1|[P Gain](#p-gain)   |Proportional Gain|RW|8|
|30|2|[Goal Position](#goal-position)                 |Target Position|RW|-|
|32|2|[Moving Speed](#moving-speed)             |Moving Speed(Moving Velocity)|RW|-|
|34|2|[Torque Limit](#torque-limit)            |Torque Limit(Goal Torque)|RW|ADD 14&15|
|36|2|[Present Position](#present-position)     |Present Position|R|-|
|38|2|[Present Speed](#present-speed)           |Present Speed|R|-|
|40|2|[Present Load](#present-load)             |Present Load|R|-|
|42|1|[Present Voltage](#present-voltage)       |Present Voltage|R|-|
|43|1|[Present Temperature](#present-temperature)|Present Temperature|R|-|
|44|1|[Registered](#registered)                 |If Instruction is registered|R|0|
|46|1|[Moving](#moving)                   |Movement Status|R|0|
|47|1|[Lock](#lock)                   |Locking EEPROM|RW|0|
|48|2|[Punch](#punch)                   |Minimum Current Threshold|RW|32|
|73|1|[Goal Acceleration](#goal-acceleration)   |Goal Acceleration|RW|0|


## [Control Table Description](#control-table-description)

### <a name="model-number"></a>**[Model Number (0)](#model-number-0)**
 This address stores model number of the DYNAMIXEL.

### <a name="firmware-version"></a>**[Firmware Version (2)](#firmware-version-2)**
 This address stores firmware version of the DYNAMIXEL.

### <a name="id"></a>**[ID (3)](#id-3)**
{% include en/dxl/control_table_id.md %}

### <a name="baud-rate"></a>**[Baud Rate (4)](#baud-rate-4)**
{% include en/dxl/control_table_baudrate.md %}

For BPS over 250 values :

| Value     | Baud Rate     | Margin of Error     |
| :------------: | :------------: | :------------: |
|250|2,250,000|0.000%|
|251|2,500,000|0.000%|
|252|3,000,000|0.000%|

### <a name="return-delay-time"></a>**[Return Delay Time (5)](#return-delay-time-5)**
{% include en/dxl/control_table_return_delay_time.md %}

### <a name="cw-angle-limit"></a><a name="ccw-angle-limit"></a>**[CW/CCW Angle Limit(6, 8)](#cwccw-angle-limit6-8)**
{% include en/dxl/control_table_mx_angle_limit.md %}

### <a name="temperature-limit"></a>**[Temperature Limit (11)](#temperature-limit-11)**
{% include en/dxl/control_table_temp_limit.md %}

### <a name="min-voltage-limit"></a><a name="max-voltage-limit"></a>**[Min/Max Voltage Limit (12, 13)](#minmax-voltage-limit-12-13)**
{% include en/dxl/control_table_volt_limit.md %}

### <a name="max-torque"></a>**[Max Torque (14)](#max-torque-14)**
{% include en/dxl/control_table_max_torque.md %}

### <a name="status-return-level"></a>**[Status Return Level (16)](#status-return-level-16)**
{% include en/dxl/control_table_status_return_lv.md %}

### <a name="alarm-led"></a><a name="shutdown"></a>**[Alarm LED(17), Shutdown(18)](#alarm-led17-shutdown18)**
{% include en/dxl/control_table_alarm_shutdown.md %}

### <a name="multi-turn-offset"></a>**[Multi Turn Offset (20)](#multi-turn-offset-20)**
{% include en/dxl/control_table_multiturn_offset.md %}

### <a name="resolution-divider"></a>**[Resolution Divider (22)](#resolution-divider-22)**
{% include en/dxl/control_table_resolution_divider.md %}

### <a name="torque-enable"></a>**[Torque Enable (24)](#torque-enable-24)**
{% include en/dxl/control_table_torque_enable.md %}

### <a name="led"></a>**[LED (25)](#led-25)**
{% include en/dxl/control_table_led.md %}

### <a name="p-gain"></a><a name="i-gain"></a><a name="d-gain"></a>**[PID Gains (26, 27, 28)](#pid-gains-26-27-28)**
{% include en/dxl/control_table_mx_pid.md %}

### <a name="goal-position"></a>**[Goal Position (30)](#goal-position-30)**
{% include en/dxl/control_table_mx_goal_position.md %}

### <a name="moving-speed"></a>**[Moving Speed (32)](#moving-speed-32)**
- Join Mode, Multi-Turn mode
  It is a moving speed to Goal Position.
  0~1023 (0X3FF) can be used, and the unit is about 0.916rpm.
  If it is set to 0, it means the maximum rpm of the motor is used without controlling the speed.
  If it is 1023, it is about 937.1rpm.
  For example, if it is set to 300, it is about 274.8 rpm.
  However, the rpm will not exceed the No Load Speed.

- Wheel Mode
  It is a moving speed to Goal direction.
  0~2047 (0X7FF) can be used, and the unit is about 0.916rpm.
  If a value in the range of 0~1023 is used, it is stopped by setting to 0 while rotating to CCW direction.
  If a value in the range of 1024~2047 is used, it is stopped by setting to 1024 while rotating to CW direction.
  That is, the 10th bit becomes the direction bit to control the direction.

  `Note` Wheel mode allows to check max rpm. Any values higher than max rpm will not take effect.
  {: .notice}

### <a name="torque-limit"></a>**[Torque Limit (34)](#torque-limit-34)**
{% include en/dxl/control_table_torque_limit.md %}

### <a name="present-position"></a>**[Present Position (36)](#present-position-36)**
{% include en/dxl/control_table_magnet_present_position.md %}

### <a name="present-speed"></a>**[Present Speed (38)](#present-speed-38)**
Is the current moving speed.
0~2047 (0x000 ~ 0x7FF) can be used.
If a value is in the rage of 0~1023 then the motor rotates to the CCW direction.
If a value is in the rage of 1024~2047 then the motor rotates to the CW direction.
The 10th bit becomes the direction bit to control the direction; 0 and 1024 are equal.
The value unit is about 0.916rpm.
For example, if it is set to 300 then the motor is moving to the CCW direction at a rate of about 274.8rpm.

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

### <a name="goal-acceleration"></a>**[Goal Acceleration (73)](#goal-acceleration-73)**
{% include en/dxl/control_table_goal_acceleration.md %}

# [How to Assemble](#how-to-assemble)



# [Maintenance](#maintenance)

{% include en/dxl/horn_bearing_replacement.md %}

# [Reference](#reference)

`Note` [Compatibility Guide]
{: .notice}

## [Videos](#videos)

<iframe width="560" height="315" src="https://www.youtube.com/embed/Tw4GfqUpzNA" frameborder="0" allowfullscreen></iframe>

## [Quick Start](#quick-start)

## [Drawings](#drawings)

![](/assets/images/dxl/ax/ax-12w_dimension.png)


[Compatibility Guide]: http://en.robotis.com/BlueAD/board.php?bbs_id=faq&mode=view&bbs_no=47&page=1&key=&keyword=&sort=&scate=
