---
layout: archive
lang: en
ref: mx-12w
read_time: true
share: true
author_profile: false
permalink: /docs/en/dxl/mx/mx-12w/
sidebar:
  title: mx-12W
  nav: "mx-12w"
---

![](/emanual/assets/images/dxl/mx/mx-12_product.jpg)

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
| Operating Temperature | -5&deg;C ~ +80&deg;F |
| Input Voltage | 10 ~ 14.8V (**Recommended : 12V**) |
| Standby Current | 60mA |
| Command Signal | Digital Packet |
| Protocol Type | Half Duplex Asynchronous Serial Communication<br />(8bit, 1stop, No Parity) |
| Physical Connection | TTL Level Multi Drop Bus(Daisy Chain Type Connector) |
| ID | 0 ~ 253 |
| Feedback | Position, Temperature, Load, Input Voltage, etc |
| Material | Engineering Plastic |

# [Control Table](#control-table)
The Control Table is a structure of data implemented in the DYNAMIXEL. Users can read a specific Data to get status of the DYNAMIXEL with Read Instruction Packets, and modify Data as well to control DYNAMIXEL with WRITE Instruction Packets.

## [Control Table, Data, Address](#control-table-data-address)
The Control Table is a structure that consists of multiple Data fields to store status of the DYNAMIXEL or to control the DYNAMIXEL. Users can check current status of the DYNAMIXEL by reading a specific Data from the Control Table with Read Instruction Packets. WRITE Instruction Packets enable users to control the DYNAMIXEL by changing specific Data in the Control Table. The Address is a unique value when accessing a specific Data in the Control Table with Instruction Packets. In order to read or write data, users must designate a specific Address in the Instruction Packet. Please refer to [Protocol] for more details about Instruction Packets.

`Note` Two's complement is applied for the negative value. For more information, please refer to [Two's complement] from Wikipedia.
{: .notice--warning}

### [Area (EEPROM, RAM)](#area-eeprom-ram)
The Control Table is divided into 2 Areas. Data in the RAM Area is reset to initial values when the DYNAMIXEL is turned on (Volatile). On the other hand, modified data in the EEPROM Area keeps their values even when the DYNAMIXEL is turned off (Non-Volatile). Data in the EEPROM Area can only be changed when the value of Torque Enable(64) is cleared to ‘0’.

### [Size](#size)
The Size of data varies from 1 to 4 bytes depend on their usage. Please check the size of data when updating the data with an Instruction Packet.

### [Access](#access)
The Control Table has two different access properties. ‘RW’ property stands for read and write access permission while ‘R’ stands for read only access permission. Data with the read only property cannot be changed by the WRITE Instruction. Read only property(‘R’) is generally used for measuring and monitoring purpose, and read write property(‘RW’) is used for controlling DYNAMIXEL.

### [Initial Value](#initial-value)
Each data in the Control Table is restored to initial values when the DYNAMIXEL is turned on. Default values in the EEPROM area are initial values of the DYNAMIXEL (factory default settings). If any values in the EEPROM area are modified by a user, modified values will be restored as initial values when the DYNAMIXEL is turned on. Initial Values in the RAM area are restored when the DYNAMIXEL is turned on.


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

### <a name="model-number"></a>**Model Number (0)**
 This address stores model number of the DYNAMIXEL.

### <a name="firmware-version"></a>**Firmware Version (2)**
 This address stores firmware version of the DYNAMIXEL.

### <a name="id"></a>**ID (3)**
{% include dxl/control_table_id.md %}

### <a name="baud-rate"></a>**Baud Rate (4)**
{% include dxl/control_table_baudrate.md %}

For BPS over 250 values :

| Value     | Baud Rate     | Margin of Error     |
| :------------: | :------------: | :------------: |
|250|2,250,000|0.000%|
|251|2,500,000|0.000%|
|252|3,000,000|0.000%|

### <a name="return-delay-time"></a>**Return Delay Time (5)**
{% include dxl/control_table_return_delay_time.md %}

### <a name="cw-angle-limit"></a><a name="ccw-angle-limit"></a>**CW/CCW Angle Limit(6, 8)**
{% include dxl/control_table_mx_angle_limit.md %}

### <a name="temperature-limit"></a>**The Maximum Temperature Limit**
{% include dxl/control_table_temp_limit.md %}

### <a name="min-voltage-limit"></a><a name="max-voltage-limit"></a>**Min/Max Voltage Limit**
{% include dxl/control_table_volt_limit.md %}

### <a name="max-torque"></a>**Max Torque**
{% include dxl/control_table_max_torque.md %}

### <a name="status-return-level"></a>**Status Return Level**
{% include dxl/control_table_status_return_lv.md %}

### <a name="alarm-led"></a><a name="shutdown"></a>**Alarm LED / Alarm Shutdown**
{% include dxl/control_table_alarm_shutdown.md %}

### <a name="multi-turn-offset"></a>**Multi-turn Offset**
{% include dxl/control_table_multiturn_offset.md %}

### <a name="resolution-divider"></a>**Resolution Divider**

### <a name="torque-enable"></a>**Torque Enable**
{% include dxl/control_table_mx_torque_enable.md %}

### <a name="led"></a>**LED**
{% include dxl/control_table_led.md %}

### <a name="cw-compliance-margin"></a><a name="ccw-compliance-margin"></a>**Compliance Margin**
It exists in each direction of CW/CCW and means the error between goal position and present position.
The range of the value is 0~255, and the unit is the same as Goal Position.(Address 30,31)
The greater the value, the more difference occurs.

### <a name="cw-compliance-slope"></a><a name="ccw-compliance-slope"></a>**Compliance Slope**
It exists in each direction of CW/CCW and sets the level of Torque near the goal position.
Compliance Slope is set in 7 steps, the higher the value, the more flexibility is obtained.
Data representative value is actually used value.  That is, even if the value is set to 25, 16 is used internally as the representative value.

|Step| Data Value | Data Representative Value     |
| :-------------: | :-------------: | :-------------: |
|1|0(0x00) ~ 3(0x03)|2(0x02)|
|2|4(0x04) ~ 7(0x07)|4(0x04)|
|3|8(0x08)~15(0x0F)|8(0x08)|
|4|16(0x10)~31(0x1F)|16(0x10)|
|5|32(0x20)~63(0x3F)|32(0x20)|
|6|64(0x40)~127(0x7F)|64(0x40)|
|7|128(0x80)~254(0xFE)|128(0x80)|

Compliance is to set the control flexibility of the motor.
The following diagram shows the relationship between output torque and position of the motor.

![](/emanual/assets/images/dxl/dxl_compliance.png)

### <a name="goal-position"></a>**Goal Position**
It is a position value of destination.
0 to 1023 (0x3FF) is available.  The unit is 0.29 degree.
If Goal Position is out of the range, Angle Limit Error Bit (Bit1) of Status Packet is returned as ‘1’ and Alarm is triggered as set in Alarm LED/Shutdown.

![](/emanual/assets/images/dxl/dx_series_goal.png)
The picture above is the front view of Dynamixel

`Note` If it is set to Wheel Mode, this value is not used.
{: .notice}

### <a name="moving-speed"></a>**Moving Speed**
It is a moving speed to Goal Position.
The range and the unit of the value may vary depending on the operation mode.

+ Join Mode
  0~1023 (0X3FF) can be used, and the unit is about 0.111rpm.
  If it is set to 0, it means the maximum rpm of the motor is used without controlling the speed.
  If it is 1023, it is about 114rpm.
  For example, if it is set to 300, it is about 33.3 rpm.

  `Note` Please check the maximum rpm of relevant model in Joint Mode.  Even if the motor is set to more than maximum rpm, it cannot generate the torque more than the maximum rpm.
  {: .notice}

+ Wheel Mode
  0~2047( 0X7FF) can be used, the unit is about 0.1%.
  If a value in the range of 0~1023 is used, it is stopped by setting to 0 while rotating to CCW direction.
  If a value in the range of 1024~2047 is used, it is stopped by setting to 1024 while rotating to CW direction.
  That is, the 10th bit becomes the direction bit to control the direction.
  In Wheel Mode, only the output control is possible, not speed.
  For example, if it is set to 512, it means the output is controlled by 50% of the maximum output.

### <a name="torque-limit"></a>**Torque Limit**
It is the value of the maximum torque limit.
0 to 1023 (0x3FF) is available, and the unit is about 0.1%.
For example, if the value is 512, it is about 50%; that means only 50% of the maximum torque will be used.
If the power is turned on, the value of Max Torque (Address 14, 15) is used as the initial value.

`Note` If the function of Alarm Shutdown is triggered, the motor loses its torque because the value becomes 0. Once error conditions are resolved and this value is changed to the value other than 0, the motor can be operated again.
{: .notice}

### <a name="present-position"></a>**Present Position**
It is the current position value of Dynamixel.
The range of the value is 0~1023 (0x3FF), and the unit is 0.29 degree.

![](/emanual/assets/images/dxl/dx_series_goal.png)
The picture above is the front view of Dynamixel.

`Caution` If it is set to Wheel Mode, the value cannot be used to measure the moving distance and the rotation frequency.
{: .notice--warning}

### <a name="present-speed"></a>**Present Speed**
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

### <a name="present-load"></a>**Present Load**
It means currently applied load.
The range of the value is 0~2047, and the unit is about 0.1%.
If the value is 0~1023, it means the load works to the CCW direction.
If the value is 1024~2047, it means the load works to the CW direction.
That is, the 10th bit becomes the direction bit to control the direction, and 1024 is equal to 0.
For example, the value is 512, it means the load is detected in the direction of CCW about 50% of the maximum torque.

| Bit | 15 ~ 11  | 10 | 9 ~ 0|
| :----: | :---: | :---: | :---: |
| Value | 0 | Load Direction | Data (Load Ratio)|

`Note` CCW Load : Load Direction = 0, CW Load : Load Direction = 1
{: .notice}

`Note` Present load is an inferred value based on the internal output value; not a measured value using torque sensor, etc. Therefore, it may be inaccurate for measuring weight or torque. It is recommended to use it for predicting the direction and size of the force being applied to the joint.
{: .notice}

### <a name="present-voltage"></a>**Present Voltage**
It is the size of the current voltage supplied.
This value is 10 times larger than the actual voltage. For example, when 10V is supplied, the data value is 100 (0x64)

### <a name="present temperature"></a>**Present Temperature**
It is the internal temperature of Dynamixel in Celsius.
Data value is identical to the actual temperature in Celsius. For example, if the data value is 85 (0x55), the current internal temperature is 85&deg;C.

### <a name="registered-instruction"></a>**Registered Instruction**

| Value | Description     |
| :-------------: | :------------- |
|0|There are no commands transmitted by REG_WRITE|
|1|There are commands transmitted by REG_WRITE|

`Note` If ACTION command is executed, the value is changed into 0.
{: .notice}

### <a name="moving"></a>**Moving**

|Value|Description|
| :---:| :---|
|0|Goal position command execution is completed|
|1|Goal position command execution is in progress|

### <a name="lock"></a>**Lock**

|Value|Description|
| :---:| :---|
|0|EEPROM area can be modified|
|1|EEPROM area cannot be modified|

`Caution` If Lock is set to 1, the power must be turned off and then turned on again to change into 0.
{: .notice--warning}

### <a name="punch"></a>**Punch**
Current to drive motor is at minimum.
Can choose vales from 0x20 to 0x3FF.


# [How to Assemble](#how-to-assemble)

![](/emanual/assets/images/dxl/ax/ax_series_frame_assembly_01.png)

![](/emanual/assets/images/dxl/ax/ax_series_frame_assembly_02.png)

# [Maintenance](#maintenance)

{% include dxl/horn_bearing_replacement.md %}

# [Reference](#reference)

`Note` [Compatibility Guide]
{: .notice}

## [Quick Start](#quick-start)

## [Drawings](#drawings)

![](/emanual/assets/images/dxl/ax/ax-12w_dimension.png)

{% include dxl/485_ttl_connection.md %}

## [Pin Assignment](#pin-assignment)
The connector pin assignments are as the following. The two connectors on the Dynamixel are connected pin to pin, thus the AX-12 can be operated with only one connector attached.

![](/emanual/assets/images/dxl/connector_pin.png)

[Two's complement]: #

[Compatibility Guide]: http://en.robotis.com/BlueAD/board.php?bbs_id=faq&mode=view&bbs_no=47&page=1&key=&keyword=&sort=&scate=
