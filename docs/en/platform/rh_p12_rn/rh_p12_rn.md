---
layout: archive
lang: en
ref: rh_p12_rn
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/rh_p12_rn/
sidebar:
  title: RH-P12-RN
  nav: "rh_p12_rn"
---

# [Introduction](#introduction)

![](/assets/images/platform/rh_p12_rn/rh-p12-rn_product.png)

> RH-P12-RN


# [Specifications](#specifications)

| Item                   | Specifications                                                                                 |
|:-----------------------|:-----------------------------------------------------------------------------------------------|
| MCU                    | ST CORTEX-M4 (STM32F405 @ 168Mhz, 32bit)                                                       |
| Position Sensor        | Contactless Absolute Encoder (12bit, 360&deg;)<br />Maker : ams(www.ams.com), Part No : AS5045 |
| Motor                  | Coreless                                                                                       |
| Baud Rate              | 9,600 bps ~ 10.5 Mbps                                                                          |
| Control Algorithm      | PID Control                                                                                    |
| Degree of Precision    | 0.088&deg;                                                                                     |
| Operating Mode         | Current Control Mode<br />Current based Position Control Mode                                  |
| Weight                 | 500g                                                                                           |
| Stroke                 | 0 ~ 109mm                                                                                      |
| Gear Ratio             | 1181 : 1                                                                                       |
| Maximum Gripping Force | 170N                                                                                           |
| Recommended Payload    | 5kg                                                                                            |
| Operating Temperature  | -5&deg;C ~ 55&deg;C                                                                            |
| Nominal Voltage        | 24V                                                                                            |
| Command Signal         | Digital Packet                                                                                 |
| Protocol Type          | RS485 Asynchronous Serial Communication<br />(8bit, 1stop, No Parity)                          |
| Physical Connection    | RS485 Multidrop BUS                                                                            |
| ID                     | 0 ~ 252                                                                                        |
| Feedback               | Position, Velocity, Current, Temperature, Input Voltage, etc                                   |
| Material               | Full Metal Gear, Metal Body                                                                    |
| Standby Current        | 30mA                                                                                           |
| Peak Current           | 3.33A                                                                                          |

{% include en/dxl/control_table_protocol2.md %}

## [Control Table of EEPROM Area](#control-table-of-eeprom-area)

| Address | Size<br>(Byte) | Data Name                                   | Description                               | Access | Initial<br />Value |
|:-------:|:--------------:|:--------------------------------------------|:------------------------------------------|:------:|:------------------:|
|    0    |       2        | [Model Number](#model-number)               | Model Number                              |   R    |       35073        |
|    2    |       4        | [Model Information](#model-information)     | Model Information                         |   R    |         -          |
|    6    |       1        | [Firmware Version](#firmware-version)       | Firmware Version                          |   R    |         -          |
|    7    |       1        | [ID](#id)                                   | DYNAMIXEL ID                              |   RW   |         1          |
|    8    |       1        | [Baud Rate](#baud-rate)                     | Communication Speed                       |   RW   |         1          |
|    9    |       1        | [Return Delay Time](#return-delay-time)     | Response Delay Time                       |   RW   |        250         |
|   11    |       1        | [Operating Mode](#operating-mode)           | Operating Mode                            |   RW   |         5          |
|   17    |       4        | [Moving Threshold](#moving-threshold)       | Velocity Threshold for Movement Detection |   RW   |         10         |
|   21    |       1        | [Temperature Limit](#temperature-limit)     | Maximum Internal Temperature Limit        |   RW   |         80         |
|   22    |       2        | [Max Voltage Limit](#max-voltage-limit)     | Maximum Input Voltage Limit               |   RW   |        400         |
|   24    |       2        | [Min Voltage Limit](#min-voltage-limit)     | Minimum Input Voltage Limit               |   RW   |        150         |
|   26    |       4        | [Acceleration Limit](#acceleration-limit)   | Maximum Accleration Limit                 |   RW   |        255         |
|   30    |       2        | [Current Limit](#current-limit)             | Maximum Current Limit                     |   RW   |        820         |
|   32    |       4        | [Velocity Limit](#velocity-limit)           | Maximum Velocity Limit                    |   RW   |        100         |
|   36    |       4        | [Max Position Limit](#max-position-limit)   | Maximum Position Limit                    |   RW   |        1150        |
|   40    |       4        | [Min Position Limit](#min-position-limit)   | Minimum Position Limit                    |   RW   |         0          |
|   44    |       1        | [External Port Mode 1](#external-port-mode) | External Port Mode 1                      |   RW   |         0          |
|   45    |       1        | [External Port Mode 2](#external-port-mode) | External Port Mode 2                      |   RW   |         0          |
|   46    |       1        | [External Port Mode 3](#external-port-mode) | External Port Mode 3                      |   RW   |         0          |
|   47    |       1        | [External Port Mode 4](#external-port-mode) | External Port Mode 4                      |   RW   |         0          |
|   48    |       1        | [Shutdown](#shutdown)                       | Shutdown Error Information                |   RW   |         48         |
|   49    |       2        | [Indirect Address 1](#indirect-address)     | Indirect Address 1                        |   RW   |        634         |
|   51    |       2        | [Indirect Address 2](#indirect-address)     | Indirect Address 2                        |   RW   |        635         |
|   53    |       2        | [Indirect Address 3](#indirect-address)     | Indirect Address 3                        |   RW   |        636         |
|   ...   |       2        | [Indirect Address N](#indirect-address)     | Indirect Address N                        |   RW   |        ...         |
|   559   |       2        | [Indirect Address 256](#indirect-address)   | Indirect Address 256                      |   RW   |        889         |


## [Control Table of RAM Area](#control-table-of-ram-area)

| Address | Size<br>(Byte) | Data Name                                         | Description                    | Access | Initial<br />Value |
|:-------:|:--------------:|:--------------------------------------------------|:-------------------------------|:------:|:------------------:|
|   562   |       1        | [Torque Enable](#torque-enable)                   | Motor Torque On/Off            |   RW   |         0          |
|   563   |       1        | [LED Red](#led-red)                               | Red LED Intensity Value        |   RW   |         0          |
|   564   |       1        | [LED Green](#led-green)                           | Green LED Intensity Value      |   RW   |         0          |
|   565   |       1        | [LED Blue](#led-blue)                             | Blue LED Intensity Value       |   RW   |         0          |
|   590   |       2        | [Position D Gain](#position-d-gain)               | D Gain of Position             |   RW   |         -          |
|   592   |       2        | [Position I Gain](#position-i-gain)               | I Gain of Position             |   RW   |         -          |
|   594   |       2        | [Position P Gain](#position-p-gain)               | P Gain of Position             |   RW   |         -          |
|   596   |       4        | [Goal Position](#goal-position)                   | Target Position Value          |   RW   |         -          |
|   600   |       4        | [Goal Velocity](#goal-velocity)                   | Target Velocity Value          |   RW   |         0          |
|   604   |       2        | [Goal Current](#goal-current)                     | Target Current Value           |   RW   |         0          |
|   606   |       4        | [Goal Acceleration](#goal-acceleration)           | Target Acceleration Value      |   RW   |         0          |
|   610   |       1        | [Moving](#moving)                                 | Movement Status                |   R    |         -          |
|   611   |       4        | [Present Position](#present-position)             | Present Position Value         |   R    |         -          |
|   615   |       4        | [Present Velocity](#present-velocity)             | Present Velocity Value         |   R    |         -          |
|   621   |       2        | [Present Current](#present-current)               | Present Current Value          |   R    |         -          |
|   623   |       2        | [Present Input Voltage](#present-input-voltage)   | Present Input Voltage          |   R    |         -          |
|   625   |       1        | [Present Temperature](#present-temperature)       | Present Internal Temperature   |   R    |         -          |
|   626   |       2        | [External Port Data 1](#external-port-data)       | External Port Data 1           |  R/RW  |         0          |
|   628   |       2        | [External Port Data 2](#external-port-data)       | External Port Data 2           |  R/RW  |         0          |
|   630   |       2        | [External Port Data 3](#external-port-data)       | External Port Data 3           |  R/RW  |         0          |
|   632   |       2        | [External Port Data 4](#external-port-data)       | External Port Data 4           |  R/RW  |         0          |
|   634   |       1        | [Indirect Data 1](#indirect-data)                 | Indirect Data 1                |   RW   |         0          |
|   635   |       1        | [Indirect Data 2](#indirect-data)                 | Indirect Data 2                |   RW   |         0          |
|   636   |       1        | [Indirect Data 3](#indirect-data)                 | Indirect Data 3                |   RW   |         0          |
|   ...   |       1        | [Indirect Data N](#indirect-data)                 | Indirect Data N                |   RW   |         0          |
|   889   |       1        | [Indirect Data 256](#indirect-data)               | Indirect Data 256              |   RW   |         0          |
|   890   |       1        | [Registered Instruction](#registered-instruction) | Check Reception of Instruction |   R    |         0          |
|   891   |       1        | [Status Return Level](#status-return-level)       | Select Types of Status Return  |   RW   |         2          |
|   892   |       1        | [Hardware Error Status](#hardware-error-status)   | Hardware Error Status          |   R    |         0          |


## [Control Table Description](#control-table-description)

**CAUTION** : Data in the EEPROM Area can only be written when the value of [Torque Enable(562)] is cleared to ‘0’.
{: .notice--warning}

### <a name="model-number"></a>**[Model Number(0)](#model-number0)**
This address stores model number of the RH-P12-RN.

| Model Name |  Model Number  |
|:----------:|:--------------:|
| RH-P12-RN  | 35073 (0x8901) |

### <a name="firmware-version"></a>**[Firmware Version(6)](#firmware-version6)**
This address stores firmware version of the RH-P12-RN.

### <a name="id"></a>**[ID(7)](#id7)**
{% include en/dxl/control_table_id.md %}

### <a name="baud-rate"></a>**[Baud Rate(8)](#baud-rate8)**
{% include en/dxl/control_table_8_baudrate_pro.md %}

### <a name="return-delay-time"></a>**[Return Delay Time(9)](#return-delay-time9)**
{% include en/dxl/control_table_return_delay_time.md %}

### <a name="operating-mode"></a>**[Operating Mode(11)](#operating-mode11)**

| Value      | Operating Mode                      | Description                                                              |
|:-----------|:------------------------------------|:-------------------------------------------------------------------------|
| 0          | Current Control Mode                | This mode only controls Current regardless of speed and position.        |
| 1 ~ 4      | Reserved                            | -                                                                        |
| 5(Default) | Current based Position Control Mode | This mode controls both Position and Current.                            |

### <a name="moving-threshold"></a>**[Moving Threshold(17)](#moving-threshold17)**
{% include en/dxl/control_table_17_movingthreshold_pro.md %}

### <a name="temperature-limit"></a>**[Temperature Limit(21)](#temperature-limit21)**
{% include en/dxl/control_table_21_templimit_pro.md %}

### <a name="max-voltage-limit"></a><a name="min-voltage-limit"></a>**[Min/Max Voltage Limit(22, 24)](#minmax-voltage-limit22-24)**
{% include en/dxl/control_table_22_voltlimit_pro.md %}

### <a name="acceleration-limit"></a>**[Acceleration Limit(26)](#acceleration-limit26)**
This data indicates maximum value of Goal Acceleration(606).  
[Goal Acceleration(606)] can’t be configured with any values exceeding the [Acceleration Limit(26)].  

Attempting to write an exceeding value will result transmitting Data Limit Error(0x06) in the Error field of the Status Packet.  
[Goal Acceleration(606)] is used in all operating mode except Current Control Mode in order to generate a target trajectory.

|            Unit             |    Value Range    |
|:---------------------------:|:-----------------:|
| 214.577 Rev/min<sup>2</sup> | 0 ~ 2,147,483,647 |

### <a name="current-limit"></a>**[Current Limit(30)](#current-limit30)**
This value indicates maximum current limit. [Goal Current(604)] can't be configured with any values exceeding [Current Limit(30)].  
Attempting to write an exceeding value will fail and result in receiving a Limit Error Bit from the Status Packet.

|     Unit      | Value Range |
|:-------------:|:-----------:|
| About 4.02 mA |   0 ~ 820   |

### <a name="velocity-limit"></a>**[Velocity Limit(32)](#velocity-limit32)**
This value indicates velocity limit.  
The Goal Velocity(600) can't exceed this value.  
Attempting to write an exceeding value will fail and result in receiving a Limit Error Bit from the Status Packet.

|   Unit    |    Value Range    |
|:---------:|:-----------------:|
| 0.114 RPM | 0 ~ 2,147,483,647 |

### <a name="max-position-limit"></a><a name="min-position-limit"></a>**[Min/Max Position Limit(36, 40)](#minmax-position-limit36-40)**
These values limit maximum and minimum target positions.  
The Goal Position(596) can't exceed these values.  
Attempting to write an exceeding value will fail and result in receiving a Limit Error Bit from the Status Packet.  

| Max Position(Close) | Min Position(Open) |
|:-------------------:|:------------------:|
|        1,150        |         0          |


### <a name="external-port-mode"></a><a name="external-port-data"></a>**[External Port Mode](#external-port-mode)**, **[External Port Data](#external-port-data)**
External ports that can be used for various purposes are provided.  
The property of each port is configured by the External Port Mode (44, 45, 46, 47) and data of external port is controlled by the External Port Data(626, 628, 630, 632).

| External Port Mode |              Mode               |                                         Description                                          |
|:------------------:|:-------------------------------:|:--------------------------------------------------------------------------------------------:|
|     0(default)     |       AI(Analogue Input)        |                    Converts External Port signal to 12[bit] digital value                    |
|         1          | DO_PP(Digital Output Push-Pull) |                    Use External Port as a digital output port(3.3V level)                    |
|         2          |  DI_PU(Digital Input Pull-Up)   | Use External Port as a digital input port<br />Floating connection will be considered as '1' |
|         3          | DI_PD(Digital Input Pull-Down)  | Use External Port as a digital input port<br />Floating connection will be considered as '0' |

|   External Port Mode    | Access |                                          Details                                           |                                            Electrical Characteristics                                             |
|:-----------------------:|:------:|:------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------:|
|         Common          |   -    |                                             -                                              |                                   0 ~ 3.3[V], 0 ~ 5[mA]<br />VESD(HBM) : 2[kV]                                    |
|          0(AI)          |  Read  | Converts External Port signal to digital value<br />External Data = signal x (4,095 / 3.3) |                                         Resolution : 12[bit] (0 ~ 4,095)                                          |
|        1(DO_PP)         | Write  |      0 : Set External Port output to 0[V]<br />1 : Set External Port output to 3.3[V]      |                 Output High level(VOH) : 2.4 [V] (min)<br />Output Low level(VOL) : 0.5 [V] (max)                 |
| 2(DI_PU)<br />3 (DI_PD) |  Read  |           0: External Port input is 0[V]<br />1 : External Port input is 3.3[V]            | Input High level(VIH) : 2.3 [V] (min)<br />Input Low level(VIL) : 1.0 [V] (max)<br />Pull-Up/Down : 40 [kΩ] (typ) |

※ VESD(HBM) : ESD(Electrostatic Discharge) Voltage(human body model)

{% capture control_table_externalportdata_warning %}
The External Port is not electrically insulated, therefore, abide by the electrical specifications.  
If the electrical specification is exceeded or there is a problem with the signal connection, special caution is required because DYNAMIXEL can be damaged.  
- Be careful not to cause electric shock by static electricity (ESD), short circuit, open circuit.
- Be careful not to let water or dust get into the External Port connector.
- If you are not using the External Port, remove the cable.
- To connect or disconnect the External Port, proceed with power off.
- Do not connect the GNDext pin of External Port directly to the GND pin of DYNAMIXEL connector. Noise from power may affect on the External Port.
{% endcapture %}

<div class="notice--warning">{{ control_table_externalportdata_warning | markdownify }}</div>

#### External expansion port location and pin function
Remove bolts and cover plate to reveal External Port connector.

![](/assets/images/platform/rh_p12_rn/rh_p12_rn_external_port.png)

![](/assets/images/platform/rh_p12_rn/rh_p12_rn_external_port_pinout.png)

| Pin 1 | Pin 2 | Pin 3 | Pin 4 | Pin 5 | Pin 6 |
|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|  GND  | 3.3V  | PORT1 | PORT2 | PORT3 | PORT4 |


### <a name="shutdown"></a>**[Shutdown(48)](#shutdown48)**
The Dynamixel can protect itself by detecting dangerous situations that could occur during the operation. Each Bit is inclusively processed with the ‘OR’ logic, therefore, multiple options can be generated. For instance, when ‘0x05’ (binary : 00000101) is defined as [Shutdown(48)], Dynamixel can detect both Input Voltage Error(binary : 00000001) and Overheating Error(binary : 00000100). If those errors are detected, [Torque Enable(562)] is cleared to ‘0’ and the motor output becomes 0[%]. In order to reuse Dynamixel Pro in shutdown status, REBOOT has to be done. The followings are detectable situations.

|  Bit  |              Item               | Description                                                                     |
|:-----:|:-------------------------------:|:--------------------------------------------------------------------------------|
| Bit 7 |                -                | Unused, Always 0                                                                |
| Bit 6 |                -                | Unused, Always 0                                                                |
| Bit 5 |     Overload Error(Default)     | Detect persistent load that exceeds maximum output                              |
| Bit 4 | Electrical Shock Error(Default) | Detect electric shock on the circuit or insufficient power to operate the motor |
| Bit 3 |       Motor Encoder Error       | Detect malfunction of the motor encoder                                         |
| Bit 2 |        OverHeating Error        | Detect internal temperature exceeds the configured operating temperature        |
| Bit 1 |                -                | Unused, Always 0                                                                |
| Bit 0 |       Input Voltage Error       | Detect input voltage exceeds the configured operating voltage                   |

{% capture rh_p12_rn_01 %}
**NOTE** : If Shutdown occurs, use below method to reboot Dynamixels.
1. H/W REBOOT : Turn off the power and turn on again
2. S/W REBOOT : Transmit REBOOT Instruction (For more details, please refer to the [Protocol] section of e-Manual.)
{% endcapture %}

<div class="notice">{{ rh_p12_rn_01 | markdownify }}</div>

[Protocol]: /docs/en/dxl/protocol2/#reboot


### <a name="indirect-address"></a><a name="indirect-data"></a>**[Indirect Address](#indirect-address)**, **[Indirect Data](#indirect-data)**
{% include en/dxl/control_table_49_indirectdata_pro.md %}

### <a name="torque-enable"></a>**[Torque Enable(562)](#torque-enable562)**
{% include en/dxl/control_table_torque_enable_2.md %}

### <a name="led"></a>**[RGB LED(563)](#rgb-led563)**
{% include en/dxl/control_table_563_led_pro.md %}

### <a name="position-d-gain"></a><a name="position-i-gain"></a><a name="position-p-gain"></a>**Position PID Gain(594, 592, 590)**
These gains are used for Current-based Position Control Mode. The range of value is 0 ~ 32,767.  
Below diagram illustrates position controller and current controller for Current-based Position Control Mode.  
K<sub>P</sub>D, K<sub>P</sub>I and K<sub>P</sub>P stands for Position D Gain, Position I Gain and Position P Gain respectively.  
When the instruction from the user is received by the gripper, it takes following steps until operating grippers.
1. An Instruction from the user is transferred to the gripper, then registered to Goal Position(596).
2. Goal Position(596) is converted to Target Position Trajectory and Target Velocity Trajectory by Goal Velocity(600) and Goal Acceleration(606).
3. The PID controller calculates Target Current based on the Target Trajectory.
4. Goal Current(604) sets a limit on the calculated Target Current to decide final Target Current.
5. Current controller decides PWM output to be applied to the motor based on the final Target Current.
6. The final PWM output is delivered to the motor through an Inverter, and the gripper is driven.
7. Results are stored at Present Position(611), Present Velocity(615) and Present Current(621).

![](/assets/images/platform/rh_p12_rn/rh_p12_rn_control_diagram.png)

**NOTE** : K<sub>P</sub>A stands for Anti-windup Gain which cannot be modified by users. For more details about the PID controller, please refer to the [PID Controller at wikipedia](http://en.wikipedia.org/wiki/PID_controller).
{: .notice}


### <a name="goal-position">**[Goal Position(596)](#goal-position596)**
This value indicates the position to move.  
The range of value is between Min Position Limit(40) and Max Position Limit(36) with initial value of 0 ~ 1,150(0x47E) respectively.

|   Model   |                         Goal Position = 0                          |                         Goal Position = 740                         |
|:---------:|:------------------------------------------------------------------:|:-------------------------------------------------------------------:|
| RH-P12-RN | ![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_open.png) | ![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_close.png) |


### <a name="goal-velocity"></a>**[Goal Velocity(600)](#goal-velocity600)**
Goal Velocity is only used for Current-based Position Control mode to set the maximum speed of Profile.  
If Goal Velocity(600) is set to '0', Profile is disabled and use the maximum RPM of motor.

|   Unit    |               Value Range                |
|:---------:|:----------------------------------------:|
| 0.114 rpm | -Velocity Limit(32) ~ Velocity Limit(32) |

**NOTE** : The maximum velocity and maximum current of DYNAMIXEL is affected by supplying voltage. Therefore, if supplying voltage changes, so does the maximum velocity. This manual complies with recommended supply voltage(24[V]).
{: .notice}

**NOTE** : Please check the maximum rpm of the Dynamixel. The motor cannot exceed the maximum rpm with the higher Moving Speed value.
{: .notice}

### <a name="goal-current"></a>**[Goal Current(604)](#goal-current604)**
Goal Current is used for other purposes according to Operating Mode(11).

|             Operating Mode              |                  Goal Current                 |
|:---------------------------------------:|:---------------------------------------------:|
| 0 (Current Control Mode)                | Goal Current is used as Target Current value  |
| 5 (Current-based Position Control Mode) | Goal Current is used as Maximum Current value |

Also, [Goal Current(604)] cannot exceed Current Limit(30).

|     Unit      |              Value Range               |
|:-------------:|:--------------------------------------:|
| about 4.02 mA | -Current Limit(30) ~ Current Limit(30) |

### <a name="goal-acceleration"></a>**[Goal Acceleration(606)](#goal-acceleration606)**
Goal Acceleration  is only used for Current-based Position Control mode to set the acceleration of Profile.  
If [Goal Velocity(600)] is set to '0', Profile is disabled and [Goal Acceleration(606)] is not applied.

|            Unit             |        Value Range         |
|:---------------------------:|:--------------------------:|
| 214.577 Rev/min<sup>2</sup> | 0 ~ Acceleration Limit(26) |

### <a name="moving"></a>**[Moving(610)](#moving610)**
{% include en/dxl/control_table_610_moving_pro.md %}

### <a name="present-position"></a>**[Present Position(611)](#present-position611)**
This value indicates present Position.

|   Model   |                         Goal Position = 0                          |                         Goal Position = 740                         |
|:---------:|:------------------------------------------------------------------:|:-------------------------------------------------------------------:|
| RH-P12-RN | ![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_open.png) | ![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_close.png) |

### <a name="present-velocity"></a>**[Present Velocity(615)](#present-velocity615)**
This value indicates present Velocity.
It is a velocity to a target direction.
-1,023 ~ 1,023 (0x3FF) can be used, and the conversion unit is about 0.114rpm.
For more details, please refer to the [Goal Velocity(600)](#goal-velocity).

### <a name="present-current"></a>**[Present Current(621)](#present-current621)**
This value indicates present Current. The unit of this value is about 4.02mA.

### <a name="present-input-voltage"></a>**[Present Input Voltage(623)](#present-input-voltage623)**
This value indicates present voltage that is being supplied. For more details, please refer to the [Min/Max Voltage Limit(24, 22)](#max-voltage-limit).

### <a name="present-temperature"></a>**[Present Temperature(625)](#present-temperature625)**
This value indicates present internal Temperature. For more details, please refer to the [Temperature Limit(21)](#temperature-limit).

### <a name="registered-instruction"></a>**[Registered Instruction(890)](#registered-instruction890)**
{% include en/dxl/control_table_reg_instruction.md %}

### <a name="status-return-level"></a>**[Status Return Level(891)](#status-return-level891)**
{% include en/dxl/control_table_status_return_lv.md %}

### <a name="hardware-error-status"></a>**[Hardware Error Status(892)](#hardware-error-status892)**
{% include en/dxl/control_table_hardware_error_status.md %}


# [How to Assemble](#how-to-assemble)

## [Option Frame Assembly](#option-frame-assembly)

![](/assets/images/platform/rh_p12_rn/rh-p12-rn_assembly.png)


# [Reference](#reference)

## [Connector Information](#connector-information)

|Item|RS-485|External Port|
|:---:|:---:|:---:|
|Pinout|`1` GND<br>`2` VDD<br>`3` DATA+<br>`4` DATA-|`1` GND<br>`2` VDD<br>`3` PORT 1<br>`4` PORT 2<br>`5` PORT 3<br>`6` PORT 4|
|Diagram|![](/assets/images/dxl/jst_b4beha_diagram.png)|![](/assets/images/dxl/molex_5304706_diagram.png)|
|Housing|[JST EHR-04]|![](/assets/images/dxl/molex_510210600.png)<br />[MOLEX 51021-0600]|
|PCB Header|![](/assets/images/dxl/jst_b4beha.png)<br />[JST B4B-EH-A]|![](/assets/images/dxl/molex_530470610.png)<br />[MOLEX 53047-0610]|
|Crimp Terminal|[JST SEH-001T-P0.6]|[MOLEX 50079-8100]|
|Wire Gauge|21 AWG|21 AWG|

[JST EHR-04]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST B4B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST SEH-001T-P0.6]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[MOLEX 51021-0600]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0510210600_CRIMP_HOUSINGS.xml
[MOLEX 53047-0610]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0530470610_PCB_HEADERS.xml
[MOLEX 50079-8100]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0500798100_CRIMP_TERMINALS.xml


## [Drawings](#drawings)
`Download` [RH-P12-RN(PDF).zip](http://www.robotis.com/service/download.php?no=740)  
`Download` [RH-P12-RN(STP).zip](http://www.robotis.com/service/download.php?no=741)


[Torque Enable(562)]: #torque-enable562
[Goal Current(604)]: #goal-current604
[Acceleration Limit(26)]: #acceleration-limit26
[Goal Acceleration(606)]: #goal-acceleration606
[Goal Velocity(600)]: #goal-velocity600
