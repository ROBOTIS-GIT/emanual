---
layout: archive
lang: en
ref: ax-18a
read_time: true
share: true
author_profile: false
permalink: /docs/en/dxl/ax/ax-18a/
sidebar:
  title: AX-18A
  nav: "ax-18a"
---

![](/emanual/assets/images/dxl/ax/ax-18f_product.jpg)
![](/emanual/assets/images/dxl/ax/ax-18a_product.jpg)

`Note` AX-18A is a new version of the AX-18F with the same performance but more advanced external design.
{: .notice}

# [Specifications](#specifications)

| Item           | Specifications     |
| :------------- | :------------- |
| Baud Rate       | 7843 bps ~ 1 Mbps       |
| Resolution | 0.29&deg;  |
| Running Degree | 0&deg; ~ 300&deg;<br />Endless Turn |
| Weight | 54.5g(AX-18F), 55.9g(AX-18A) |
| Dimensions (W x H x D) | 32mm x 50mm x 40mm |
| Gear Ratio | 254 : 1  |
| Stall Torque | 1.8 N*m (at 12V, 2.2A) |
| No Load Speed | 97rpm (at 12V) |
| Operating Temperature | -5&deg;C ~ +70&deg;F |
| Input Voltage | 9.0 ~ 12.0V (**Recommended : 11.1V**) |
| Command Signal | Digital Packet |
| Protocol Type | Half Duplex Asynchronous Serial Communication (8bit, 1stop, No Parity) |
| Physical Connection | TTL Level Multi Drop Bus(Daisy Chain Type Connector) |
| ID | 0 ~ 253 |
| Feedback | Position, Temperature, Load, Input Voltage, etc |
| Material | Engineering Plastic |

`Note` Stall torque is the maximum instantaneous and static  torque. Stable motions are possible with robots designed for loads with 1/5 or less of the stall torque.
{: .notice}

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
|0|2|[Model Number](#model-number)         | Model Number       | R       | 18 |
|2|1|[Firmware Version](#firmware-version)    |Firmware Version|R|-|
|3|1|[ID](#id)                  |DYNAMIXEL ID      |RW|1|
|4|1|[Baud Rate](#baud-rate)           |Communication Speed|RW|1|
|5|1|[Return Delay Time](#return-delay-time)   |Response Delay Time|RW|250|
|6|2|[CW Angle Limit](#cw-angle-limit)          |Clockwise Angle Limit|RW|0|
|8|2|[CCW Angle Limit](#ccw-angle-limit)          |Counter-Clockwise Angle Limit|RW|1023|
|11|1|[Temperature Limit](#temperature-limit)   |Maximum Internal Temperature Limit|RW|75|
|12|1|[Min Voltage Limit](#min-voltage-limit)   |Minimum Input Voltage Limit|RW|60|
|13|1|[Max Voltage Limit](#max-voltage-limit)   |Maximum Input Voltage Limit|RW|140|
|14|2|[Max Torque](#max-torque)           |Maximun Torque|RW|983|
|16|1|[Status Return Level](#status-return-level)      |Select Types of Status Return|RW|2|
|17|1|[Alarm LED](#alarm-led)                             |LED for Alarm|RW|36|
|18|1|[Shutdown](#shutdown)            |Shutdown Error Information|RW|36|


## [Control Table of RAM Area](#control-table-of-ram-area)

| Address     | Size(Byte)     | Data Name     | Description     | Access     | Initial Value     |
| :------------- | :------------- | :------------- | :------------- | :------------- | :------------- |
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
 The ID is a unique value in the network to identify each DYNAMIXEL with an Instruction Packet.
 0~252 (0xFC) values can be used as an ID, and 254(0xFE) is occupied as a broadcast ID. The Broadcast ID(254, 0xFE) can send an Instruction Packet to all connected DYNAMIXELs simultaneously.

 `Note` Please avoid using an identical ID for multiple DYNAMIXELs. You may face communication failure or may not be able to detect Dynamixels with an identical ID.
 {: .notice}


### <a name="baud-rate"></a>**Baud Rate (4)**
 Baud Rate determines serial communication speed between a controller and DYNAMIXELs.

| Value     | Baud Rate     | Margin of Error     |
| :------------: | :------------: | :------------: |
|1(Default)|1M|0.000%|
|3|500,000| 0.000%|
|4|400,000| 0.000%|
|7|250,000| 0.000%|
|9|200,000| 0.000%|
|16|115200| -2.124%|
|34|57600| 0.794%|
|103|19200| -0.160%|
|207|9600| -0.160%|

`Note` Less than 3% of the baud rate error margin will not affect to UART communication.
{: .notice}


### <a name="return-delay-time"></a>**Return Delay Time (5)**
 After the DYNAMIXEL receives an Instruction Packet, it delays transmitting the Status Packet for Return Delay Time (9). For instance, if the Return Delay Time(9) is set to ‘10’, the Status Packet will be returned after 20[μsec] when the Instruction Packet is received.

 |      | Value     | Description     |
 | :------------- | :------------- | :------------- |
 |Unit| 2[μsec] | - |
 |Range| 0 ~ 254  | Default value ‘250’(500[μsec]), Maximum 508[μsec]|


### <a name="cw-angle-limit"></a><a name="ccw-angle-limit"></a>**CW/CCW Angle Limit(6, 8)**
The angle limit allows the motion to be restrained.
The range and the unit of the value is the same as Goal Position(Address 30, 31).
CW Angle Limit: the minimum value of Goal Position(Address 30, 31)
CCW Angle Limit: the maximum value of Goal Position(Address 30, 31)
The following two modes can be set pursuant to the value of CW and CCW.

|Operation Type|CW / CCW|
| :-------------: | :-------------: |
|Wheel Mode|both are 0|
|Joint Mode|neither are 0|

The wheel mode can be used to wheel-type operation robots since motors of the robots spin infinitely. The joint mode can be used to multi-joints robot since the robots can be controlled with specific angles.

### <a name="temperature-limit"></a>**The Highest Limit Temperature**
`Caution` Do not set the temperature lower/higher than the default value. When the temperature alarm shutdown occurs, wait 20 minutes to cool the temperature before re-use. Using the product when the temperature is high may and can cause damage.
{: .notice--warning}

### <a name="min-voltage-limit"></a><a name="max-voltage-limit"></a>**Min/Max Voltage Limit**
It is the operation range of voltage.
50 to 250 (0x32 ~ 0x96) can be used.  The unit is 0.1V.
For example, if the value is 80, it is 8V.
If Present Voltage (Address42) is out of the range, Voltage Range Error Bit (Bit0) of Status Packet is returned as ‘1’ and Alarm is triggered as set in the addresses 17 and 18.

### <a name="max-torque"></a>**Max Torque**
It is the torque value of maximum output. 0 to 1023 (0x3FF) can be used, and the unit is about 0.1%.
For example, Data 1023 (0x3FF) means that Dynamixel will use 100% of the maximum torque it can produce while Data 512 (0x200) means that Dynamixel will use 50% of the maximum torque. When the power is turned on, Torque Limit (Addresses 34 and 35) uses the value as the initial value.

### <a name="status-return-level"></a>**Status Return Level**
It decides how to return Status Packet. There are three ways like the below table.

| Value | Return of Status Packet     |
| :-------------: | :------------- |
|0| No return against all commands (Except PING Command)|
|1|Return only for the READ command|
|2|Return for all commands|

When Instruction Packet is Broadcast ID, Status Packet is not returned regardless of Status Return Level.

### <a name="alarm-led"></a><a name="shutdown"></a>**Alarm LED / Alarm Shutdown**
Dynamixel can protect itself by detecting errors occur during the operation.
The errors can be set are as the table below.

|Bit   | Name     | Description     |
| :-------------: | :-------------: | :------------- |
|Bit 7|0|-|
|Bit 6|Instruction Error|When undefined Instruction is transmitted or the Action command is delivered without the reg_write command|
|Bit 5|Overload Error|When the current load cannot be controlled with the set maximum torque|
|Bit 4|CheckSum Error|When the Checksum of the transmitted Instruction Packet is invalid|
|Bit 3|Range Error|When the command is given beyond the range of usage|
|Bit 2|OverHeating Error|When the internal temperature is out of the range of operating temperature set in the Control Table|
|Bit 1|Angle Limit Error|When Goal Position is written with the value that is not between CW Angle Limit and CCW Angle Limit|
|Bit 0|Input Voltage Error|When the applied voltage is out of the range of operating voltage set in the Control Table|

It is possible to make duplicate set since the function of each bit is run by  the logic of ‘OR’. That is, if 0X05 (binary 00000101) is set, both Input Voltage Error and Overheating Error can be detected.
If errors occur, in case of Alarm LED, the LED blinks; in case of Alarm Shutdown, the motor output becomes 0 % by making the value of Torque Limit(Address 34, 35) as 0.

### <a name="torque-enable"></a>**Torque Enable**

| Value | Description     |
| :-------------: | :------------- |
|0|Keeps Torque from generating by interrupting the power of motor|
|1|Generates Torque by impressing the power to the motor.|

### <a name="led"></a>**LED**

| Bit | Description     |
| :-------------: | :------------- |
|0|Turn OFF the LED|
|1|Turn ON the LED|

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

`Note` If the function of Alarm Shutdown is triggered, the motor loses its torque because the value becomes 0. At this moment, if the value is changed to the value other than 0, the motor can be used again.
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

![](/emanual/assets/images/dxl/ax/ax_12a_frame_assembly_02.png)

![](/emanual/assets/images/dxl/ax/ax_series_frame_assembly_01.png)

![](/emanual/assets/images/dxl/ax/ax_series_frame_assembly_02.png)

# [Maintenance](#maintenance)

{% include dxl/horn_bearing_replacement.md %}

# [Reference](#reference)

`Note` [Compatibility Guide]
{: .notice}

## [Quick Start](#quick-start)

## [Drawings](#drawings)

![](/emanual/assets/images/dxl/ax/ax-18a_dimension.png)


[Two's complement]: #

[Compatibility Guide]: http://en.robotis.com/BlueAD/board.php?bbs_id=faq&mode=view&bbs_no=47&page=1&key=&keyword=&sort=&scate=
