---
layout: archive
lang: en
ref: rh_p12_rna
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/rh_p12_rna/
sidebar:
  title: RH-P12-RN(A)
  nav: "rh_p12_rna"
---

# [Introduction](#introduction)

![](/assets/images/platform/rh_p12_rn/rh-p12-rn_product.png)

> RH_P12_RN(A)

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
| Gear Ratio             | 1295.7 : 1                                                                                     |
| Maximum Gripping Force | 170N                                                                                           |
| Recommended Payload    | 5kg                                                                                            |
| Operating Temperature  | -5&deg;C ~ 55&deg;C                                                                            |
| Nominal Voltage        | 24V                                                                                            |
| Command Signal         | Digital Packet                                                                                 |
| Protocol Type          | RS485 Asynchronous Serial Communication<br />(8bit, 1stop, No Parity)                          |
| Physical Connection    | RS485 Multidrop Bus                                                                            |
| ID                     | 0 ~ 252                                                                                        |
| Feedback               | Position, Velocity, Current, Temperature, Input Voltage, etc                                   |
| Material               | Full Metal Gear, Metal Body                                                                    |
| Standby Current        | 30mA                                                                                           |
| Peak Current           | 3.33A                                                                                          |

{% include en/dxl/warning.md %}

{% include en/dxl/pro-plus/control_table.md %}

## [Control Table of EEPROM Area](#control-table-of-eeprom-area)

| Address | Size<br>(Byte) | Data Name                                   | Access | Initial<br />Value |               Range                |      Unit      |
|:-------:|:--------------:|:--------------------------------------------|:------:|:------------------:|:----------------------------------:|:--------------:|
|    0    |       2        | [Model Number](#model-number)               |   R    |       51,201       |                 -                  |       -        |
|    2    |       4        | [Model Information](#model-information)     |   R    |         -          |                 -                  |       -        |
|    6    |       1        | [Firmware Version](#firmware-version)       |   R    |         -          |                 -                  |       -        |
|    7    |       1        | [ID](#id)                                   |   RW   |         1          |              0 ~ 252               |       -        |
|    8    |       1        | [Baud Rate](#baud-rate)                     |   RW   |         1          |               0 ~ 9                |       -        |
|    9    |       1        | [Return Delay Time](#return-delay-time)     |   RW   |        250         |              0 ~ 255               |    2 [μsec]    |
|   10    |       1        | [Drive Mode](#drive-mode)                   |   RW   |         0          |               0 ~ 1                |       -        |
|   11    |       1        | [Operating Mode](#operating-mode)           |   RW   |         5          |                0, 5                |       -        |
|   12    |       1        | [Sencondary ID](#secondary-id)              |   RW   |        255         |              0 ~ 255               |       -        |
|   20    |       4        | [Homing Offset](#homing-offset)             |   RW   |         0          | -2,147,483,648 ~<br> 2,147,483,647 |   1 [pulse]    |
|   24    |       4        | [Moving Threshold](#moving-threshold)       |   RW   |         50         | -2,147,483,648 ~<br> 2,147,483,647 | 0.01 [rev/min] |
|   31    |       1        | [Temperature Limit](#temperature-limit)     |   RW   |         80         |              0 ~ 100               |     1 [℃]      |
|   32    |       2        | [Max Voltage Limit](#max-voltage-limit)     |   RW   |        350         |              0 ~ 350               |    0.1 [V]     |
|   34    |       2        | [Min Voltage Limit](#min-voltage-limit)     |   RW   |        150         |              0 ~ 350               |    0.1 [V]     |
|   36    |       2        | [PWM Limit](#pwm-limit)                     |   RW   |       2,009        |             0 ~ 2,009              |       -        |
|   38    |       2        | [Current Limit](#current-limit)             |   RW   |       1,984        |             0 ~ 1,984              |     1 [mA]     |
|   40    |       4        | [Acceleration Limit](#acceleration-limit)   |   RW   |       3,447        |           0 ~ 1,378,788            |  1 [rev/min²]  |
|   44    |       4        | [Velocity Limit](#velocity-limit)           |   RW   |       2,970        |             0 ~ 2,970              | 0.01 [rev/min] |
|   48    |       4        | [Max Position Limit](#max-position-limit)   |   RW   |       1,150        |           0 ~ 1,150            |   1 [pulse]    |
|   52    |       4        | [Min Position Limit](#min-position-limit)   |   RW   |         0          |           0 ~ 1,150            |   1 [pulse]    |
|   57    |       1        | [External Port Mode 2](#external-port-mode) |   RW   |         3          |               0 ~ 3                |       -        |
|   56    |       1        | [External Port Mode 1](#external-port-mode) |   RW   |         3          |               0 ~ 3                |       -        |
|   58    |       1        | [External Port Mode 3](#external-port-mode) |   RW   |         3          |               0 ~ 3                |       -        |
|   59    |       1        | [External Port Mode 4](#external-port-mode) |   RW   |         3          |               0 ~ 3                |       -        |
|   63    |       1        | [Shutdown](#shutdown)                       |   RW   |         52         |              0 ~ 255               |       -        |
|   168   |       2        | [Indirect Address 1](#indirect-address)     |   RW   |        634         |            512 ~ 1,023             |       -        |
|   170   |       2        | [Indirect Address 2](#indirect-address)     |   RW   |        635         |            512 ~ 1,023             |       -        |
|   172   |       2        | [Indirect Address 3](#indirect-address)     |   RW   |        636         |            512 ~ 1,023             |       -        |
|   ...   |      ...       | ...                                         |  ...   |        ...         |                ...                 |      ...       |
|   422   |       2        | [Indirect Address 128](#indirect-address)   |   RW   |        761         |            512 ~ 1,023             |       -        |

## [Control Table of RAM Area](#control-table-of-ram-area)

| Address | Size<br>(Byte) | Data Name                                         | Access | Initial<br />Value |                        Range                        |      Unit      |
|:-------:|:--------------:|:--------------------------------------------------|:------:|:------------------:|:---------------------------------------------------:|:--------------:|
|   512   |       1        | [Torque Enable](#torque-enable)                   |   RW   |         0          |                        0 ~ 1                        |       -        |
|   513   |       1        | [LED Red](#led-red)                               |   RW   |         0          |                       0 ~ 255                       |       -        |
|   514   |       1        | [LED Green](#led-green)                           |   RW   |         0          |                       0 ~ 255                       |       -        |
|   515   |       1        | [LED Blue](#led-blue)                             |   RW   |         0          |                       0 ~ 255                       |       -        |
|   516   |       1        | [Status Return Level](#status-return-level)       |   RW   |         2          |                        0 ~ 2                        |       -        |
|   517   |       1        | [Registered Instruction](#registered-instruction) |   R    |         0          |                          -                          |       -        |
|   518   |       1        | [Hardware Error Status](#hardware-error-status)   |   R    |         0          |                          -                          |       -        |
|   524   |       2        | [Velocity I Gain](#velocity-i-gain)               |   RW   |         -          |                     0 ~ 32,767                      |       -        |
|   526   |       2        | [Velocity P Gain](#velocity-p-gain)               |   RW   |         -          |                     0 ~ 32,767                      |       -        |
|   528   |       2        | [Position D Gain](#position-p-gain)               |   RW   |         -          |                     0 ~ 32,767                      |       -        |
|   532   |       2        | [Position P Gain](#position-p-gain)               |   RW   |         -          |                     0 ~ 32,767                      |       -        |
|   530   |       2        | [Position I Gain](#position-p-gain)               |   RW   |         -          |                     0 ~ 32,767                      |       -        |
|   536   |       2        | [Feedforward 2nd Gain](#feedforward-2nd-gain)     |   RW   |         -          |                     0 ~ 32,767                      |       -        |
|   538   |       2        | [Feedforward 1st Gain](#feedforward-1st-gain)     |   RW   |         -          |                     0 ~ 32,767                      |       -        |
|   546   |       1        | [Bus Watchdog](#bus-watchdog)                     |   RW   |         -          |                       0 ~ 127                       |   20 [msec]    |
|   548   |       2        | [Goal PWM](#goal-pwm)                             |   RW   |         -          |         -PWM Limit(36) ~<br> PWM Limit(36)          |       -        |
|   550   |       2        | [Goal Current](#goal-current)                     |   RW   |         0          |     -Current Limit(38) ~<br> Current Limit(38)      |     1 [mA]     |
|   552   |       4        | [Goal Velocity](#goal-velocity)                   |   RW   |         0          |    -Velocity Limit(44) ~<br> Velocity Limit(44)     | 0.01 [rev/min] |
|   556   |       4        | [Profile Acceleration](#profile-acceleration)     |   RW   |         0          |           0 ~<br> Acceleration Limit(40)            |  1 [rev/min²]  |
|   560   |       4        | [Profile Velocity](#profile-velocity)             |   RW   |         0          |             0 ~<br> Velocity Limit(44)              | 0.01 [rev/min] |
|   564   |       4        | [Goal Position](#goal-position)                   |   RW   |         -          | Min Position Limit(52) ~<br> Max Position Limit(48) |    1[pulse]    |
|   568   |       2        | [Realtime Tick](#realtime-tick)                   |   R    |         -          |                     0 ~ 32,767                      |    1 [msec]    |
|   570   |       1        | [Moving](#moving)                                 |   R    |         -          |                          -                          |       -        |
|   571   |       1        | [Moving Status](#moving-status)                   |   R    |         -          |                          -                          |       -        |
|   572   |       2        | [Present PWM](#present-pwm)                       |   R    |         -          |                          -                          |       -        |
|   574   |       2        | [Present Current](#present-current)               |   R    |         -          |                          -                          |     1 [mA]     |
|   576   |       4        | [Present Velocity](#present-velocity)             |   R    |         -          |                          -                          | 0.01 [rev/min] |
|   580   |       4        | [Present Position](#present-position)             |   R    |         -          |                          -                          |   1 [pulse]    |
|   584   |       4        | [Velocity Trajectory](#velocity-trajectory)       |   R    |         -          |                          -                          | 0.01 [rev/min] |
|   588   |       4        | [Position Trajectory](#position-trajectory)       |   R    |         -          |                          -                          |   1 [pulse]    |
|   592   |       2        | [Present Input Voltage](#present-input-voltage)   |   R    |         -          |                          -                          |    0.1 [V]     |
|   594   |       1        | [Present Temperature](#present-temperature)       |   R    |         -          |                          -                          |     1 [℃]      |
|   600   |       2        | [External Port Data 1](#external-port-data)       |  R/RW  |         0          |                      0 ~ 4095                       |       -        |
|   602   |       2        | [External Port Data 2](#external-port-data)       |  R/RW  |         0          |                      0 ~ 4095                       |       -        |
|   604   |       2        | [External Port Data 3](#external-port-data)       |  R/RW  |         0          |                      0 ~ 4095                       |       -        |
|   606   |       2        | [External Port Data 4](#external-port-data)       |  R/RW  |         0          |                      0 ~ 4095                       |       -        |
|   634   |       1        | [Indirect Data 1](#indirect-data)                 |   RW   |         0          |                       0 ~ 255                       |       -        |
|   635   |       1        | [Indirect Data 2](#indirect-data)                 |   RW   |         0          |                       0 ~ 255                       |       -        |
|   636   |       1        | [Indirect Data 3](#indirect-data)                 |   RW   |         0          |                       0 ~ 255                       |       -        |
|   ...   |      ...       | ...                                               |  ...   |        ...         |                         ...                         |      ...       |
|   761   |       1        | [Indirect Data 128](#indirect-data)               |   RW   |         0          |                       0 ~ 255                       |       -        |


## [Control Table Description](#control-table-description)

**CAUTION** : Data in the EEPROM Area can only be written when the value of [Torque Enable(512)] is cleared to `0`.
{: .notice--warning}

**NOTE** : RH_P12_RN(A) stands for the Advanced firmware of RH_P12_RN. Please be aware of the changes of Control Table such as Addresses and additional features.
{: .notice}

### <a name="model-number"></a>**[Model Number(0)](#model-number0)**
This address stores model number of the device.

|    Model Name    |  Model Number   |
|:----------------:|:---------------:|
| RH_P12_RN(A)  | 35,074 (0x8902) |

### <a name="firmware-version"></a>**[Firmware Version(6)](#firmware-version6)**
{% include en/dxl/pro-plus/control_table_6_firmware_version.md %}

### <a name="id"></a>**[ID(7)](#id7)**
{% include en/dxl/pro-plus/control_table_7_id.md %}

### <a name="baud-rate"></a>**[Baud Rate(8)](#baud-rate8)**
{% include en/dxl/pro-plus/control_table_8_baud_rate.md %}

### <a name="return-delay-time"></a>**[Return Delay Time(9)](#return-delay-time9)**
{% include en/dxl/pro-plus/control_table_9_return_delay_time.md %}

### <a name="drive-mode"></a>**[Drive Mode(10)](#drive-mode10)**
{% include en/dxl/pro-plus/control_table_10_drive_mode.md %}

### <a name="operating-mode"></a>**[Operating Mode(11)](#operating-mode11)**
Operating mode of the device can be configured. Each control mode has different characteristics so please choose appropriate mode for the application.

| Value      | Operating Mode                      | Description                                                       |
|:-----------|:------------------------------------|:------------------------------------------------------------------|
| 0          | Current Control Mode                | This mode only controls Current regardless of speed and position. |
| 1 ~ 4      | Reserved                            | -                                                                 |
| 5(Default) | Current based Position Control Mode | This mode controls both Position and Current.                     |

### <a name="secondary-id"></a>**[Secondary ID(12)](#secondary-id12)**
{% include en/dxl/pro-plus/control_table_12_secondary_id.md %}

### <a name="homing-offset"></a>**[Homing Offset(20)](#homing-offset20)**
{% include en/dxl/pro-plus/control_table_20_homing_offset.md %}

### <a name="moving-threshold"></a>**[Moving Threshold(24)](#moving-threshold24)**
{% include en/dxl/pro-plus/control_table_24_moving_threshold.md %}

### <a name="temperature-limit"></a>**[Temperature Limit(31)](#temperature-limit31)**
{% include en/dxl/pro-plus/control_table_31_temperature_limit.md %}

### <a name="max-voltage-limit"></a><a name="min-voltage-limit"></a>**[Max/Min Voltage Limit(32, 34)](#maxmin-voltage-limit32-34)**
{% include en/dxl/pro-plus/control_table_32_voltage_limit.md %}

### <a name="pwm-limit"></a>**[PWM Limit(36)](#pwm-limit36)**
{% include en/dxl/pro-plus/control_table_36_pwm_limit.md %}

### <a name="current-limit"></a>**[Current Limit(38)](#current-limit38)**
This value indicates the maximum current(torque) output limit.  
Goal Current(550) cannot be configured with any values exceeding Current Limit(38). Attempting to write an invalid value will fail and set the Limit Error Bit in the error field of the Status Packet.

|  Unit  | Value Range |
|:------:|:-----------:|
| 1 [mA] |  0 ~ 1,984  |

### <a name="acceleration-limit"></a>**[Acceleration Limit(40)](#acceleration-limit40)**
This value indicates the maximum acceleration limit.  
Profile Acceleration(556) cannot be configured with any values exceeding Acceleration Limit(40). Attempting to write an invalid value will fail and set the Limit Error Bit in the error field of the Status Packet.

|     Unit     |  Value Range  |
|:------------:|:-------------:|
| 1 [rev/min²] | 0 ~ 1,378,788 |

### <a name="velocity-limit"></a>**[Velocity Limit(44)](#velocity-limit44)**
This value indicates maximum velocity of Goal Velocity(552) and Profile Velocity(562). 
Goal Velocity(552) and Profile Velocity(562) cannot be configured with any values exceeding Velocity Limit(44). Attempting to write an invalid value will fail and set the Limit Error Bit in the error field of the Status Packet.

|      Unit      | Value Range |
|:--------------:|:-----------:|
| 0.01 [rev/min] |  0 ~ 2,970  |

### <a name="max-position-limit"></a><a name="min-position-limit"></a>**[Max/Min Position Limit(48, 52)](#maxmin-position-limit48-52)**
These values limit maximum and minimum positions in Current based Position Control Mode within the range of 0 ~ 1,150.  
Therefore, Goal Position(564) should not exceed the limit range. Attempting to write an invalid value will fail and set the Limit Error Bit in the error field of the Status Packet.

|   Unit    |    Value Range     |
|:---------:|:------------------:|
| 1 [pulse] | 0 ~ 1,150 |

### <a name="external-port-mode"></a><a name="external-port-data"></a>**[External Port Mode](#external-port-mode)**, **[External Port Data](#external-port-data)**
External ports can be used for various purposes.

|         |    Range    |
|:-------:|:-----------:|
| Voltage | 0 ~ 3.3 [V] |
| Current | 0 ~ 5 [mA]  |

| External Port Mode |           Mode           |                                        Description                                         |
|:------------------:|:------------------------:|:------------------------------------------------------------------------------------------:|
|         0          |      Analogue Input      |                   Converts External Port signal to 12[bit] digital value                   |
|         1          | Digital Output Push-Pull |                   Use External Port as a digital output port(3.3V level)                   |
|         2          |  Digital Input Pull-Up   | Use External Port as a digital input port<br>Floating connection will be considered as ‘1’ |
|     3(Default)     | Digital Input Pull-Down  | Use External Port as a digital input port<br>Floating connection will be considered as ‘0’ |

#### External expansion port location and pin function
Remove bolts and cover plate to reveal External Port connector.

![](/assets/images/platform/rh_p12_rn/rh_p12_rn_external_port.png)

![](/assets/images/platform/rh_p12_rn/rh_p12_rn_external_port_pinout.png)

| Pin 1 | Pin 2 | Pin 3 | Pin 4 | Pin 5 | Pin 6 |
|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|  GND  | 3.3V  | PORT1 | PORT2 | PORT3 | PORT4 |

### <a name="shutdown"></a>**[Shutdown(63)](#shutdown63)**
{% include en/dxl/pro-plus/control_table_63_shutdown.md %}

### <a name="indirect-address"></a><a name="indirect-data"></a>**[Indirect Address](#indirect-address)**, **[Indirect Data](#indirect-data)**
{% include en/dxl/pro-plus/control_table_168_indirect.md %}

### <a name="torque-enable"></a>**[Torque Enable(512)](#torque-enable512)**
{% include en/dxl/pro-plus/control_table_512_torque_enable.md %}

### <a name="led"></a>**[RGB LED](#rgb-led)**
{% include en/dxl/pro-plus/control_table_513_led.md %}

### <a name="status-return-level"></a>**[Status Return Level(516)](#status-return-level516)**
{% include en/dxl/pro-plus/control_table_516_status_return_level.md %}

### <a name="registered-instruction"></a>**[Registered Instruction(517)](#registered-instruction517)**
{% include en/dxl/pro-plus/control_table_517_registered_instruction.md %}

### <a name="hardware-error-status"></a>**[Hardware Error Status(518)](#hardware-error-status518)**
{% include en/dxl/pro-plus/control_table_518_hardware_error_status.md %}

### <a name="velocity-i-gain"></a><a name="velocity-p-gain"></a>**[Velocity PI Gain(524, 526), Feedforward 2nd Gains(536)](#velocity-pi-gain524-526, Feedforward 2nd Gains(536))**
{% include en/dxl/pro-plus/control_table_524_velocity_gain.md %}

### <a name="position-d-gain"></a><a name="position-i-gain"></a><a name="position-p-gain"></a>**[Position PID Gain(528,530,532), Feedforward 1st Gains(538)](#position-pid-gain528-530-532, Feedforward 1st Gains(538))**
{% include en/dxl/pro-plus/control_table_528_position_gain.md %}

### <a name="bus-watchdog"></a>**[Bus Watchdog(546)](#bus-watchdog546)**
{% include en/dxl/pro-plus/control_table_546_bus_watchdog.md %}

### <a name="goal-pwm"></a>**[Goal PWM(548)](#goal-pwm548)**
{% include en/dxl/pro-plus/control_table_548_goal_pwm.md %}

### <a name="goal-current"></a>**[Goal Current(550)](#goal-current550)**
{% include en/dxl/pro-plus/control_table_550_goal_current.md %}

### <a name="goal-velocity"></a>**[Goal Velocity(552)](#goal-velocity552)**
{% include en/dxl/pro-plus/control_table_552_goal_velocity.md %}

### <a name="profile-acceleration"></a>**[Profile Acceleration(556)](#profile-acceleration556)**
{% include en/dxl/pro-plus/control_table_556_profile_acceleration.md %}

### <a name="profile-velocity"></a>**[Profile Velocity(560)](#profile-velocity560)**
{% include en/dxl/pro-plus/control_table_560_profile_velocity.md %}

### <a name="goal-position"></a>**[Goal Position(564)](#goal-position564)**
Desired position can be set with Goal Position(564).  
This value must be inbetween Min Position Limit(52) and Max Position Limit(48). 

|Model Name|Goal Position = 0|Goal Position = 740|
| :-------: | :--------: | :--------: |
|RH-P12-RN|![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_open.png)|![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_close.png)|

### <a name="realtime-tick"></a>**[Realtime Tick(568)](#realtime-tick568)**
{% include en/dxl/pro-plus/control_table_568_realtime_tick.md %}

### <a name="moving"></a>**[Moving(570)](#moving570)**
{% include en/dxl/pro-plus/control_table_570_moving.md %}

### <a name="moving-status"></a>**[Moving Status(571)](#moving-status571)**
{% include en/dxl/pro-plus/control_table_571_moving_status.md %}

### <a name="present-pwm"></a>**[Present PWM(572)](#present-pwm572)**
{% include en/dxl/pro-plus/control_table_572_present_pwm.md %}

### <a name="present-current"></a>**[Present Current(574)](#present-current574)**
{% include en/dxl/pro-plus/control_table_574_present_current.md %}

### <a name="present-velocity"></a>**[Present Velocity(576)](#present-velocity576)**
{% include en/dxl/pro-plus/control_table_576_present_velocity.md %}

### <a name="present-position"></a>**[Present Position(580)](#present-position580)**
This value represents present position of the device.

|Model Name|Goal Position = 0|Goal Position = 740|
| :-------: | :--------: | :--------: |
|RH-P12-RN|![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_open.png)|![](/assets/images/platform/rh_p12_rn/rh_p12_rn_position_close.png)|

### <a name="velocity-trajectory"></a>**[Velocity Trajectory(584)](#velocity-trajectory584)**
{% include en/dxl/pro-plus/control_table_584_velocity_trajectory.md %}

### <a name="position-trajectory"></a>**[Position Trajectory(588)](#position-trajectory588)**
{% include en/dxl/pro-plus/control_table_588_position_trajectory.md %}

### <a name="present-input-voltage"></a>**[Present Input Voltage(592)](#present-input-voltage592)**
{% include en/dxl/pro-plus/control_table_592_present_input_voltage.md %}

### <a name="present-temperature"></a>**[Present Temperature(594)](#present-temperature594)**
{% include en/dxl/pro-plus/control_table_594_present_temperature.md %}

# [How to Assemble](#how-to-assemble)

## [Option Frame Assembly](#option-frame-assembly)

![](/assets/images/platform/rh_p12_rn/rh-p12-rn_assembly.png)


# [Reference](#reference)

## [Connector Information](#connector-information)

|      Item      |                           RS-485                           |                               External Port                                |
|:--------------:|:----------------------------------------------------------:|:--------------------------------------------------------------------------:|
|     Pinout     |        `1` GND<br>`2` VDD<br>`3` DATA+<br>`4` DATA-        | `1` GND<br>`2` VDD<br>`3` PORT 1<br>`4` PORT 2<br>`5` PORT 3<br>`6` PORT 4 |
|    Diagram     |       ![](/assets/images/dxl/jst_b4beha_diagram.png)       |             ![](/assets/images/dxl/molex_5304706_diagram.png)              |
|    Housing     |                        [JST EHR-04]                        |    ![](/assets/images/dxl/molex_510210600.png)<br />[MOLEX 51021-0600]     |
|   PCB Header   | ![](/assets/images/dxl/jst_b4beha.png)<br />[JST B4B-EH-A] |    ![](/assets/images/dxl/molex_530470610.png)<br />[MOLEX 53047-0610]     |
| Crimp Terminal |                    [JST SHE-001T-P0.6]                     |                             [MOLEX 50079-8100]                             |
|   Wire Gauge   |                           21 AWG                           |                                   21 AWG                                   |

[JST EHR-04]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST B4B-EH-A]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[JST SHE-001T-P0.6]: http://www.jst-mfg.com/product/pdf/eng/eEH.pdf
[MOLEX 51021-0600]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0510210600_CRIMP_HOUSINGS.xml
[MOLEX 53047-0610]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0530470610_PCB_HEADERS.xml
[MOLEX 50079-8100]: http://www.molex.com/molex/products/datasheet.jsp?part=active/0500798100_CRIMP_TERMINALS.xml

## [Drawings](#drawings)
`Download` [RH-P12-RN(PDF).zip](http://www.robotis.com/service/download.php?no=740)  
`Download` [RH-P12-RN(STP).zip](http://www.robotis.com/service/download.php?no=741)


[PDF]: http://support.robotis.com/en/baggage_files/dynamixel/rh-p12-rn.pdf
[Torque Enable(562)]: #torque-enable562
