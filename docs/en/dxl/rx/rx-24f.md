---
layout: archive
lang: en
ref: rx-24f
read_time: true
share: true
author_profile: false
permalink: /docs/en/dxl/rx/rx-24f/
sidebar:
  title: RX-24F
  nav: "rx-24f"
---

![](/emanual/assets/images/dxl/rx/rx-24f_product.png)

`Warning` RX-24F has been discontinued.
{: .notice--warning}

# [Specifications](#specifications)

| Item           | Specifications     |
| :------------- | :------------- |
| Baud Rate       | 7343 bps ~ 1 Mbps       |
| Resolution | 0.29&deg;  |
| Running Degree | 0&deg; ~ 300&deg;<br />Endless Turn|
| Weight | 67g |
| Dimensions (W x H x D) | 35.6mm x 50.6mm x 35.5mm |
| Gear Ratio | 193 : 1  |
| Stall Torque | 2.6 N*m (at 12V, 2.4A) |
| No Load Speed | 126rpm (at 12V) |
| Operating Temperature | -5&deg;C ~ +80&deg;F |
| Input Voltage | 9 ~ 12V (**Recommended : 11.1V**) |
| Standby Current | 50mA |
| Command Signal | Digital Packet |
| Protocol Type | Half Duplex Asynchronous Serial Communication<br />(8bit, 1stop, No Parity) |
| Physical Connection | RS485 Multi Drop Bus(Daisy Chain Type Connector) |
| ID | 0 ~ 253 |
| Feedback | Position, Temperature, Load, Input Voltage, etc |
| Material | Full Metal Gear, Engineering Plastic Body |

{% include dxl/control_table_protocol1.md %}

## [Control Table of EEPROM Area](#control-table-of-eeprom-area)

| Address     | Size(Byte)     | Data Name     | Description    | Access     | Initial Value  |
| :---------: | :-----------:  | :-----------: | :------------: | :--------: | :------------: |
|0|2|[Model Number](#model-number)         | Model Number       | R       | 24 |
|2|1|[Firmware Version](#firmware-version)    |Firmware Version|R|-|
|3|1|[ID](#id)                  |DYNAMIXEL ID      |RW|1|
|4|1|[Baud Rate](#baud-rate)           |Communication Speed|RW|34|
|5|1|[Return Delay Time](#return-delay-time)   |Response Delay Time|RW|250|
|6|2|[CW Angle Limit](#cw-angle-limit)          |Clockwise Angle Limit|RW|0|
|8|2|[CCW Angle Limit](#ccw-angle-limit)          |Counter-Clockwise Angle Limit|RW|1023|
|11|1|[Temperature Limit](#temperature-limit)   |Maximum Internal Temperature Limit|RW|80|
|12|1|[Min Voltage Limit](#min-voltage-limit)   |Minimum Input Voltage Limit|RW|60|
|13|1|[Max Voltage Limit](#max-voltage-limit)   |Maximum Input Voltage Limit|RW|190|
|14|2|[Max Torque](#max-torque)           |Maximun Torque|RW|1023|
|16|1|[Status Return Level](#status-return-level)      |Select Types of Status Return|RW|2|
|17|1|[Alarm LED](#alarm-led)                             |LED for Alarm|RW|36|
|18|1|[Shutdown](#shutdown)            |Shutdown Error Information|RW|36|


## [Control Table of RAM Area](#control-table-of-ram-area)

| Address     | Size(Byte)     | Data Name     | Description     | Access     | Initial Value    |
| :---------: | :------------: | :-----------: | :-------------: | :--------: | :--------------: |
|24|1|[Torque Enable](#torque-enable)            |Motor Torque On/Off|RW|0|
|25|1|[LED](#led)                             |Status LED On/Off|RW|0|
|26|1|[CW Compliance Margin](#cw-compliance-margin)   |CW Compliance Margin|RW|1|
|27|1|[CCW Compliance Margin](#ccw-compliance-margin)   |CCW Compliance Margin|RW|1|
|28|1|[CW Compliance Slope](#cw-compliance-slope)   |CW Compliance Slope|RW|32|
|29|1|[CCW Compliance Slope](#ccw-compliance-alope)   |CCW Compliance Slope|RW|32|
|30|2|[Goal Position](#goal-position)                 |Target Position|RW|-|
|32|2|[Moving Speed](#moving-speed)             |Moving Speed|RW|-|
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


## [Control Table Description](#control-table-description)

### <a name="model-number"></a>**Model Number (0)**
 This address stores model number of the DYNAMIXEL.

### <a name="firmware-version"></a>**Firmware Version (2)**
 This address stores firmware version of the DYNAMIXEL.

### <a name="id"></a>**ID (3)**
{% include dxl/control_table_id.md %}


### <a name="baud-rate"></a>**Baud Rate (4)**
{% include dxl/control_table_baudrate.md %}


### <a name="return-delay-time"></a>**Return Delay Time (5)**
{% include dxl/control_table_return_delay_time.md %}


### <a name="cw-angle-limit"></a><a name="ccw-angle-limit"></a>**CW/CCW Angle Limit(6, 8)**
{% include dxl/control_table_angle_limit.md %}

### <a name="temperature-limit"></a>**The Highest Limit Temperature**
{% include dxl/control_table_temp_limit.md %}

### <a name="min-voltage-limit"></a><a name="max-voltage-limit"></a>**Min/Max Voltage Limit**
{% include dxl/control_table_volt_limit_high.md %}

### <a name="max-torque"></a>**Max Torque**
{% include dxl/control_table_max_torque.md %}

### <a name="status-return-level"></a>**Status Return Level**
{% include dxl/control_table_status_return_lv.md %}

### <a name="alarm-led"></a><a name="shutdown"></a>**Alarm LED / Alarm Shutdown**
{% include dxl/control_table_alarm_shutdown.md %}

### <a name="torque-enable"></a>**Torque Enable**
{% include dxl/control_table_torque_enable.md %}

### <a name="led"></a>**LED**
{% include dxl/control_table_led.md %}

### <a name="cw-compliance-margin"></a><a name="ccw-compliance-margin"></a>**Compliance Margin**
{% include dxl/control_table_compliance_margin.md %}

### <a name="cw-compliance-slope"></a><a name="ccw-compliance-slope"></a>**Compliance Slope**
{% include dxl/control_table_compliance_slope.md %}

### <a name="goal-position"></a>**Goal Position**
{% include dxl/control_table_dx_goal_position.md %}

### <a name="moving-speed"></a>**Moving Speed**
{% include dxl/control_table_moving_speed.md %}

### <a name="torque-limit"></a>**Torque Limit**
{% include dxl/control_table_torque_limit.md %}

### <a name="present-position"></a>**Present Position**
{% include dxl/control_table_potentio_present_position.md %}

### <a name="present-speed"></a>**Present Speed**
{% include dxl/control_table_present_speed.md %}

### <a name="present-load"></a>**Present Load**
{% include dxl/control_table_present_load.md %}

### <a name="present-voltage"></a>**Present Voltage**
{% include dxl/control_table_present_volt.md %}

### <a name="present temperature"></a>**Present Temperature**
{% include dxl/control_table_present_temp.md %}

### <a name="registered-instruction"></a>**Registered Instruction**
{% include dxl/control_table_reg_instruction.md %}

### <a name="moving"></a>**Moving**
{% include dxl/control_table_moving.md %}

### <a name="lock"></a>**Lock**
{% include dxl/control_table_lock.md %}

### <a name="punch"></a>**Punch**
{% include dxl/control_table_punch.md %}

# [How to Assemble](#how-to-assemble)

+ FR07-B1 Option Frame

![](/emanual/assets/images/dxl/rx/rx-28_of-28b.png)

+ FR07-H1 Option Frame

![](/emanual/assets/images/dxl/rx/rx-28_of-28h.png)

+ FR07-S1 Option Frame

![](/emanual/assets/images/dxl/rx/rx-28_of-28s.png)

+ FR07-B101 Option Frame

![](/emanual/assets/images/dxl/rx/rx-28_fr07-b101.png)

+ FR07-F101, FR07-X101 Option Frame

![](/emanual/assets/images/dxl/rx/rx-28_fr07-f101_fr07-x101.png)

+ FR07-H101 Option Frame

![](/emanual/assets/images/dxl/rx/rx-28_fr07-h101.png)

+ FR07-S101 Option Frame

![](/emanual/assets/images/dxl/rx/rx-28_fr07-s101.png)

+ HN07-N1 Horn

![](/emanual/assets/images/dxl/rx/rx-28_hn07-n1.png)

+ HN07-I1 Horn

![](/emanual/assets/images/dxl/rx/rx-28_hn07-i1.png)

+ HN07-T1 Horn

![](/emanual/assets/images/dxl/rx/rx-28_hn07-t1.png)

+ HN07-N101 Horn

![](/emanual/assets/images/dxl/rx/rx-28_hn07-n101.png)

+ HN07-I101 Horn

![](/emanual/assets/images/dxl/rx/rx-28_hn07-i101.png)

+ HN07-T101 Horn

![](/emanual/assets/images/dxl/rx/rx-28_hn07-t101.png)

+ Combinations

![](/emanual/assets/images/dxl/rx/rx-10_combinations.png)

# [Maintenance](#maintenance)

{% include dxl/horn_bearing_replacement.md %}

# [Reference](#reference)

`Note` [Compatibility Guide]
{: .notice}

## [Quick Start](#quick-start)

## [Drawings](#drawings)

{% include dxl/485_ttl_connection.md %}

[Two's complement]: #

[Compatibility Guide]: http://en.robotis.com/BlueAD/board.php?bbs_id=faq&mode=view&bbs_no=47&page=1&key=&keyword=&sort=&scate=
