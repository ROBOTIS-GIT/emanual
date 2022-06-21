---
layout: archive
lang: en
ref: xl430-w250-test
read_time: true
share: false
author_profile: false
permalink: /docs/en/dxl/x/xl430-w250-test
sidebar:
  title: XL430-W250-T
  nav: "xl430-w250-test"
product_group: dxl_xl430
---

{::options parse_block_html="true" /}

![](/assets/images/dxl/x/xl430_product_new.png)

> New XL430-W250 (Released on 2018 3rd quarter)

![](/assets/images/dxl/x/xl430_product.png)

> Old XL430-W250 (This type has been discontinued)

# [Specifications](#specifications)

{% include en/dxl/specifications_x.md %}

{% include en/dxl/warning.md %}

## [Performance Graph](#performance-graph)

![](/assets/images/dxl/x/xl430_w250_performance_graph.png)

{% include en/dxl/note_performance_graph.md %}

{% include en/dxl/control_table.md %}

## [Control Table of EEPROM Area](#control-table-of-eeprom-area)

| Address | Size(Byte) | Data Name                        | Access | Initial<br />Value |           Range            |      Unit       |
|:-------:|:--------------:|:---------------------------------|:------:|:------------------:|:--------------------------:|:---------------:|
|    0    |       2        | [Model Number]{: .popup}         |   R    |       1,060        |             -              |        -        |
|    2    |       4        | Model Information                |   R    |         -          |             -              |        -        |
|    6    |       1        | [Firmware Version]{: .popup}     |   R    |         -          |             -              |        -        |
|    7    |       1        | [ID]{: .popup}                   |   RW   |         1          |          0 ~ 252           |        -        |
|    8    |       1        | [Baud Rate]{: .popup}            |   RW   |         1          |           0 ~ 7            |        -        |
|    9    |       1        | [Return Delay Time]{: .popup}    |   RW   |        250         |          0 ~ 254           |    2 [μsec]     |
|   10    |       1        | [Drive Mode]{: .popup}           |   RW   |         0          |           0 ~ 5            |        -        |
|   11    |       1        | [Operating Mode]{: .popup}       |   RW   |         3          |           0 ~ 16           |        -        |
|   12    |       1        | [Secondary(Shadow) ID]{: .popup} |   RW   |        255         |          0 ~ 252           |        -        |
|   13    |       1        | [Protocol Type]{: .popup}        |   RW   |         2          |           1 ~ 2            |        -        |
|   20    |       4        | [Homing Offset]{: .popup}        |   RW   |         0          | -1,044,479 ~ <br>1,044,479 |    1 [pulse]    |
|   24    |       4        | [Moving Threshold]{: .popup}     |   RW   |         10         |         0 ~ 1,023          | 0.229 [rev/min] |
|   31    |       1        | [Temperature Limit]{: .popup}    |   RW   |         72         |          0 ~ 100           |   1 [&deg;C]    |
|   32    |       2        | [Max Voltage Limit]{: .popup}    |   RW   |        140         |          60 ~ 140          |     0.1 [V]     |
|   34    |       2        | [Min Voltage Limit]{: .popup}    |   RW   |         60         |          60 ~ 140          |     0.1 [V]     |
|   36    |       2        | [PWM Limit]{: .popup}            |   RW   |        885         |          0 ~ 885           |    0.113 [%]    |
|   44    |       4        | [Velocity Limit]{: .popup}       |   RW   |        265         |         0 ~ 1,023          | 0.229 [rev/min] |
|   48    |       4        | [Max Position Limit]{: .popup}   |   RW   |       4,095        |         0 ~ 4,095          |    1 [pulse]    |
|   52    |       4        | [Min Position Limit]{: .popup}   |   RW   |         0          |         0 ~ 4,095          |    1 [pulse]    |
|   63    |       1        | [Shutdown]{: .popup}             |   RW   |         52         |             -              |        -        |

## [Control Table of RAM Area](#control-table-of-ram-area)

| Address | Size(Byte) | Data Name                                         | Access | Initial<br />Value |                        Range                        |                  Unit                   |
|:-------:|:--------------:|:--------------------------------------------------|:------:|:------------------:|:---------------------------------------------------:|:---------------------------------------:|
|   64    |       1        | [Torque Enable](#torque-enable)                   |   RW   |         0          |                        0 ~ 1                        |                    -                    |
|   65    |       1        | [LED](#led)                                       |   RW   |         0          |                        0 ~ 1                        |                    -                    |
|   68    |       1        | [Status Return Level](#status-return-level)       |   RW   |         2          |                        0 ~ 2                        |                    -                    |
|   69    |       1        | [Registered Instruction](#registered-instruction) |   R    |         0          |                        0 ~ 1                        |                    -                    |
|   70    |       1        | [Hardware Error Status](#hardware-error-status)   |   R    |         0          |                          -                          |                    -                    |
|   76    |       2        | [Velocity I Gain](#velocity-i-gain)               |   RW   |       1,000        |                     0 ~ 16,383                      |                    -                    |
|   78    |       2        | [Velocity P Gain](#velocity-p-gain)               |   RW   |        100         |                     0 ~ 16,383                      |                    -                    |
|   80    |       2        | [Position D Gain](#position-d-gain)               |   RW   |       4,000        |                     0 ~ 16,383                      |                    -                    |
|   82    |       2        | [Position I Gain](#position-i-gain)               |   RW   |         0          |                     0 ~ 16,383                      |                    -                    |
|   84    |       2        | [Position P Gain](#position-p-gain)               |   RW   |        640         |                     0 ~ 16,383                      |                    -                    |
|   88    |       2        | [Feedforward 2nd Gain](#feedforward-2nd-gain)     |   RW   |         0          |                     0 ~ 16,383                      |                    -                    |
|   90    |       2        | [Feedforward 1st Gain](#feedforward-1st-gain)     |   RW   |         0          |                     0 ~ 16,383                      |                    -                    |
|   98    |       1        | [Bus Watchdog](#bus-watchdog)                     |   RW   |         0          |                       1 ~ 127                       |                20 [msec]                |
|   100   |       2        | [Goal PWM](#goal-pwm)                             |   RW   |         -          |         -PWM Limit(36) ~<br> PWM Limit(36)          |                0.113 [%]                |
|   104   |       4        | [Goal Velocity](#goal-velocity)                   |   RW   |         -          |    -Velocity Limit(44) ~<br> Velocity Limit(44)     |             0.229 [rev/min]             |
|   108   |       4        | [Profile Acceleration](#profile-acceleration)     |   RW   |         0          |             0 ~ 32,767 <br> 0 ~ 32,737              | 214.577 [rev/min<sup>2</sup>]<br>1 [ms] |
|   112   |       4        | [Profile Velocity](#profile-velocity)             |   RW   |         0          |                     0 ~ 32,767                      |             0.229 [rev/min]             |
|   116   |       4        | [Goal Position](#goal-position)                   |   RW   |         -          | Min Position Limit(52) ~<br> Max Position Limit(48) |                1 [pulse]                |
|   120   |       2        | [Realtime Tick](#realtime-tick)                   |   R    |         -          |                     0 ~ 32,767                      |                1 [msec]                 |
|   122   |       1        | [Moving](#moving)                                 |   R    |         0          |                        0 ~ 1                        |                    -                    |
|   123   |       1        | [Moving Status](#moving-status)                   |   R    |         0          |                          -                          |                    -                    |
|   124   |       2        | [Present PWM](#present-pwm)                       |   R    |         -          |                          -                          |                    -                    |
|   126   |       2        | [Present Load](#present-load)                     |   R    |         -          |                   -1,000 ~ 1,000                    |                 0.1 [%]                 |
|   128   |       4        | [Present Velocity](#present-velocity)             |   R    |         -          |                          -                          |             0.229 [rev/min]             |
|   132   |       4        | [Present Position](#present-position)             |   R    |         -          |                          -                          |                1 [pulse]                |
|   136   |       4        | [Velocity Trajectory](#velocity-trajectory)       |   R    |         -          |                          -                          |             0.229 [rev/min]             |
|   140   |       4        | [Position Trajectory](#position-trajectory)       |   R    |         -          |                          -                          |                1 [pulse]                |
|   144   |       2        | [Present Input Voltage](#present-input-voltage)   |   R    |         -          |                          -                          |                 0.1 [V]                 |
|   146   |       1        | [Present Temperature](#present-temperature)       |   R    |         -          |                          -                          |               1 [&deg;C]                |
|   168   |       2        | [Indirect Address 1](#indirect-address)           |   RW   |        224         |                      64 ~ 661                       |                    -                    |
|   170   |       2        | [Indirect Address 2](#indirect-address)           |   RW   |        225         |                      64 ~ 661                       |                    -                    |
|   172   |       2        | [Indirect Address 3](#indirect-address)           |   RW   |        226         |                      64 ~ 661                       |                    -                    |
|    …    |       …        | …                                                 |   …    |         …          |                          -                          |                    -                    |
|   218   |       2        | [Indirect Address 26](#indirect-address)          |   RW   |        249         |                      64 ~ 661                       |                    -                    |
|   220   |       2        | [Indirect Address 27](#indirect-address)          |   RW   |        250         |                      64 ~ 661                       |                    -                    |
|   222   |       2        | [Indirect Address 28](#indirect-address)          |   RW   |        251         |                      64 ~ 661                       |                    -                    |
|   224   |       1        | [Indirect Data 1](#indirect-data)                 |   RW   |         0          |                       0 ~ 255                       |                    -                    |
|   225   |       1        | [Indirect Data 2](#indirect-data)                 |   RW   |         0          |                       0 ~ 255                       |                    -                    |
|   226   |       1        | [Indirect Data 3](#indirect-data)                 |   RW   |         0          |                       0 ~ 255                       |                    -                    |
|    …    |       …        | …                                                 |   …    |         …          |                          -                          |                    -                    |
|   249   |       1        | [Indirect Data 26](#indirect-data)                |   RW   |         0          |                       0 ~ 255                       |                    -                    |
|   250   |       1        | [Indirect Data 27](#indirect-data)                |   RW   |         0          |                       0 ~ 255                       |                    -                    |
|   251   |       1        | [Indirect Data 28](#indirect-data)                |   RW   |         0          |                       0 ~ 255                       |                    -                    |
|   578   |       2        | [Indirect Address 29](#indirect-address)          |   RW   |        634         |                      64 ~ 661                       |                    -                    |
|   580   |       2        | [Indirect Address 30](#indirect-address)          |   RW   |        635         |                      64 ~ 661                       |                    -                    |
|   582   |       2        | [Indirect Address 31](#indirect-address)          |   RW   |        636         |                      64 ~ 661                       |                    -                    |
|    …    |       …        | …                                                 |   …    |         …          |                          -                          |                    -                    |
|   628   |       2        | [Indirect Address 54](#indirect-address)          |   RW   |        659         |                      64 ~ 661                       |                    -                    |
|   630   |       2        | [Indirect Address 55](#indirect-address)          |   RW   |        660         |                      64 ~ 661                       |                    -                    |
|   632   |       2        | [Indirect Address 56](#indirect-address)          |   RW   |        661         |                      64 ~ 661                       |                    -                    |
|   634   |       1        | [Indirect Data 29](#indirect-data)                |   RW   |         0          |                       0 ~ 255                       |                    -                    |
|   635   |       1        | [Indirect Data 30](#indirect-data)                |   RW   |         0          |                       0 ~ 255                       |                    -                    |
|   636   |       1        | [Indirect Data 31](#indirect-data)                |   RW   |         0          |                       0 ~ 255                       |                    -                    |
|    …    |       …        | …                                                 |   …    |         …          |                          -                          |                    -                    |
|   659   |       1        | [Indirect Data 54](#indirect-data)                |   RW   |         0          |                       0 ~ 255                       |                    -                    |
|   660   |       1        | [Indirect Data 55](#indirect-data)                |   RW   |         0          |                       0 ~ 255                       |                    -                    |
|   661   |       1        | [Indirect Data 56](#indirect-data)                |   RW   |         0          |                       0 ~ 255                       |                    -                    |

[Bus Watchdog]: /docs/en/popup/x/control_table_buswatchdog

**CAUTION** : Protocol 1.0 does not support addresses greater than 256. Therefore, Indirect Address 29 ~ 56 and Indirect Data 29 ~ 56 can only be accessed with Protocol 2.0.
{: .notice--warning}

<!-- 
## [Control Table Description](#control-table-description) 

**CAUTION** : Data in the EEPROM Area can only be written when the value of Torque Enable(64) is cleared to ‘0’.
{: .notice--warning}

<details>
<summary> 
</summary>
</details>

<details>
<summary> 
### Protocol Type(13)
</summary>
{% include en/dxl/control_table_protocolversion.md %}
</details>

<details>
<summary> 
### <a name="homing-offset"></a>Homing Offset(20)
</summary>
{% include en/dxl/control_table_homingoffset.md %}
</details>

<details>
<summary> 
### <a name="moving-threshold"></a>**[Moving Threshold(24)](#moving-threshold24)**
</summary>
{% include en/dxl/control_table_movingthreshold.md %}
</details>

<details>
<summary> 
### <a name="temperature-limit"></a>**[Temperature Limit(31)](#temperature-limit31)**
</summary>
{% include en/dxl/control_table_temp_limit_2.md %}
</details>

<details>
<summary> 
### <a name="max-voltage-limit"></a><a name="min-voltage-limit"></a>**[Min/Max Voltage Limit(32, 34)](#minmax-voltage-limit32-34)**
</summary>

These values are maximum and minimum operating voltages.  
When current input voltage acquired from [Present Input Voltage(144)](#present-input-voltage144) exceeds the range of Max Voltage Limit(32) and Min Voltage Limit(34), Voltage Range Error Bit(0x01) and [Alert Bit(0x80)](#hardware-error-status70) in the Hardware Error Status(70) are set.  
If Input Voltage Error Bit(0x10) is configured in the Shutdown(63), [Torque Enable(64)](#torque-enable64) is cleared to ‘0’ and Torque is disabled.  
For more details, please refer to the [Shutdown(63)] section.

|    Unit    | Value Range | Description |
|:----------:|:-----------:|:-----------:|
| About 0.1V |  60 ~ 140   | 6.0 ~ 14.0V |
</details>

<details>
<summary> 
### <a name="pwm-limit"></a>**[PWM Limit(36)](#pwm-limit36)**
</summary>
{% include en/dxl/control_table_pwm_limit.md %}
</details>

<details>
<summary> 
### <a name="velocity-limit"></a>**[Velocity Limit(44)](#velocity-limit44)**
</summary>
{% include en/dxl/control_table_vellimit.md %}
</details>

<details>
<summary> 
### <a name="max-position-limit"></a><a name="min-position-limit"></a>**[Min/Max Position Limit(48, 52)](#minmax-position-limit48-52)**
</summary>

These values limit maximum and minimum target positions for Position Control Mode(Joint Mode) within the range of 1 rotation(0 ~ 4,095). Therefore, Goal Position(116) should be configured within the position limit range. These values are not used in Extended Position Control Mode.

|    Unit    |      Value Range      |
|:----------:|:---------------------:|
| 0.088&deg; | 0 ~ 4,095(1 rotation) |

**NOTE** : Max Position Limit(48) and Min Position Limit(52) are only used in Position Control Mode with a single turn.

</details>

<details>
<summary> 
### <a name="shutdown"></a>**[Shutdown(63)](#shutdown63)**
</summary>
{% include en/dxl/control_table_shutdown.md %}
</details> -->

<!-- 
### <a name="torque-enable"></a>**[Torque Enable(64)](#torque-enable64)**
{% include en/dxl/control_table_torque_enable.md %}

### <a name="led"></a>**[LED(65)](#led65)**

{% include en/dxl/control_table_led.md %}

### <a name="status-return-level"></a>**[Status Return Level(68)](#status-return-level68)**

{% include en/dxl/control_table_status_return_lv.md %}


### <a name="registered-instruction"></a>**[Registered Instruction(69)](#registered-instruction69)**

{% include en/dxl/control_table_reg_instruction.md %}


### <a name="hardware-error-status"></a>**[Hardware Error Status(70)](#hardware-error-status70)**

The Hardware Error Status(70) indicates hardware error status.  
{% include en/dxl/control_table_shutdown.md %}


### <a name="velocity-i-gain"></a><a name="velocity-p-gain"></a>**[Velocity PI Gain(76, 78)](#velocity-pi-gain76-78)**
 
{% include en/dxl/control_table_velocity_pi_gain.md %}


### <a name="position-d-gain"></a><a name="position-i-gain"></a><a name="position-p-gain"></a><a name="feedforward-1st-gain"></a><a name="feedforward-2nd-gain"></a><a name="position-pid-gain80-82-84"></a><a name="feedforward-1st2nd-gains88-90"></a>**Position PID Gain(80, 82, 84), Feedforward 1st/2nd Gains(88, 90)**

{% include en/dxl/control_table_position_pid_gain.md %}

### <a name="bus-watchdog"></a>**[Bus Watchdog(98)](#bus-watchdog98)**
 
{% include en/dxl/control_table_buswatchdog.md %}


### <a name="goal-pwm"></a>**[Goal PWM(100)](#goal-pwm100)**
 
{% include en/dxl/control_table_goal_pwm.md %}


### <a name="goal-velocity"></a>**[Goal Velocity(104)](#goal-velocity104)**
 
{% include en/dxl/control_table_goal_velocity.md %}


### <a name="profile-acceleration"></a>**[Profile Acceleration(108)](#profile-acceleration108)**
 
{% include en/dxl/control_table_profile_acceleration.md %}


### <a name="profile-velocity"></a>**[Profile Velocity(112)](#profile-velocity112)**
 
{% include en/dxl/control_table_profile_velocity.md %}


### <a name="goal-position"></a>**[Goal Position(116)](#goal-position116)**
 
{% include en/dxl/control_table_goal_position_2.md %}


### <a name="realtime-tick"></a>**[Realtime Tick(120)](#realtime-tick120)**
 
{% include en/dxl/control_table_realtime_tick.md %}


### <a name="moving"></a>**[Moving(122)](#moving122)**
 
{% include en/dxl/control_table_moving_2.md %}


### <a name="moving-status"></a>**[Moving Status(123)](#moving-status123)**
 
{% include en/dxl/control_table_moving_status.md %}


### <a name="present-pwm"></a>**[Present PWM(124)](#present-pwm124)**
 
This value indicates present PWM. For more details, please refer to the [Goal PWM(100)](#goal-pwm).


### <a name="present-load"></a>**[Present Load(126)](#present-load126)**
 
{% include en/dxl/control_table_present_load_2.md %}


### <a name="present-velocity"></a>**[Present Velocity(128)](#present-velocity128)**
 
This value indicates present Velocity. For more details, please refer to the [Goal Velocity(104)](#goal-velocity104).


### <a name="present-position"></a>**[Present Position(132)](#present-position132)**
 
{% include en/dxl/control_table_present_position.md %}


### <a name="velocity-trajectory"></a>**[Velocity Trajectory(136)](#velocity-trajectory136)**
 
This is a target velocity trajectory created by Profile. Operating method can be changed based on control mode. For more details, please refer to the [Profile Velocity(112)].
1. **Velocity Control Mode** : When Profile reaches to the endpoint, [Velocity Trajectory(136)] becomes equal to [Goal Velocity(104)].
2. **Position Control Mode, Extended Position Control Mode** : Velocity Trajectory is used to create [Position Trajectory(140)]. When Profile reaches to an endpoint, [Velocity Trajectory(136)] is cleared to '0'.



### <a name="position-trajectory"></a>**[Position Trajectory(140)](#position-trajectory140)**
 
{% include en/dxl/control_table_position_trajectory.md %}



### <a name="present-input-voltage"></a>**[Present Input Voltage(144)](#present-input-voltage144)**
 
{% include en/dxl/control_table_present_volt_2.md %}


### <a name="present-temperature"></a>**[Present Temperature(146)](#present-temperature146)**
 
{% include en/dxl/control_table_present_temp_2.md %}


### <a name="indirect-address"></a><a name="indirect-data"></a>**[Indirect Address](#indirect-address)**, **[Indirect Data](#indirect-data)**
 
{% include en/dxl/control_table_indirect_data.md %}

-->

# [How to Assemble](#how-to-assemble)

## [Wiring through Back Case](#wiring-through-back-case)

![](/assets/images/dxl/x/xl430_idler_assembly_new.png)

> New XL430-W250 (Released on 2018 3rd quarter)

![](/assets/images/dxl/x/xl430_idler_assembly.png)

> Old XL430-W250 (This type has been discontinued)

![](/assets/images/dxl/x/frame/common/x-series_cable_assembly.png)

{% capture hollow_assy %}
**CAUTION** : DYNAMIXEL-X series cable assembly through hollow case
- Organize the entangled cable before assembling the back case.
- Do not assemble the back case with entangled cable. The entangled cable can be squashed by the case and cause communication error.
- Do not assemble both cables through the hollow case.
{% endcapture %}

<div class="notice--warning">{{ hollow_assy | markdownify }}</div>

## [Option Frame Assembly](#option-frame-assembly)

### New XL430-W250

![](/assets/images/dxl/x/xl430_option_frame_new.jpg)

### Old XL430-W250

![](/assets/images/dxl/x/xl430_option_frame.jpg)

# [Reference](#reference)

**NOTE**
[Compatibility Guide]{: .blank}  
[Harness Compatibility]{: .popup}  
{: .notice}

## [What is the Profile](#what-is-the-profile)

{% include en/dxl/profile_description.md %}

## [Certifications](#certifications)
Please inquire us for information regarding unlisted certifications.

### [FCC](#fcc)


## [Quick Start](#quick-start)

## [Connector Information](#connector-information)

{% include en/dxl/jst_ttl.md %}

{% include en/dxl/ttl_connection_x.md %}

## [Drawings](#drawings)

### New XL430-W250
- `Download` [XL430_new(pdf).pdf]{: .blank}
- `Download` [XL430_new(dwg).dwg]{: .blank}
- `Download` [XL430_new(stp).stp]{: .blank}

### Old XL430-W250
- `Download` [XL430.pdf]{: .blank}
- `Download` [XL430.dwg]{: .blank}
- `Download` [XL430.stp]{: .blank}

{% include en/dxl/download_center_notice.md %}

[XL430_new(pdf).pdf]: http://www.robotis.com/service/download.php?no=772
[XL430_new(dwg).dwg]: http://www.robotis.com/service/download.php?no=771
[XL430_new(stp).stp]: http://www.robotis.com/service/download.php?no=773
[XL430.pdf]: http://www.robotis.com/service/download.php?no=154
[XL430.dwg]: http://www.robotis.com/service/download.php?no=153
[XL430.stp]: http://www.robotis.com/service/download.php?no=155
[Compatibility Guide]: http://en.robotis.com/service/compatibility_table.php?cate=dx

[Model Number]: /docs/en/popup/x/model_number
[Model Information]: /docs/en/popup/x/ 
[Firmware Version]: /docs/en/popup/x/firmware_version
[Protocol Type]: /docs/en/popup/x/control_table_protocolversion
[ID]: /docs/en/popup/x/control_table_id
[Baud Rate]: /docs/en/popup/x/control_table_baudrate_2
[Return Delay Time]: /docs/en/popup/x/control_table_return_delay_time
[Drive Mode]: /docs/en/popup/x/control_table_drivemode     
[Operating Mode]: /docs/en/popup/x/control_table_mx_opmode_2       
[Secondary(Shadow) ID]: /docs/en/popup/x/control_table_shadowid
[Protocol Type]: /docs/en/popup/x/control_table_protocolversion
[Homing Offset]: /docs/en/popup/x/control_table_homingoffset        
[Moving Threshold]: /docs/en/popup/x/control_table_movingthreshold    
[Temperature Limit]: /docs/en/popup/x/control_table_temp_limit_2    
[Max Voltage Limit]: /docs/en/popup/x/contron_table_max_min_voltage_level
[Min Voltage Limit]: /docs/en/popup/x/contron_table_max_min_voltage_level
[PWM Limit]: /docs/en/popup/x/control_table_pwm_limit            
[Velocity Limit]: /docs/en/popup/x/control_table_vellimit
[Max Position Limit]: /docs/en/popup/x/control_table_min_max_position_limit
[Min Position Limit]: /docs/en/popup/x/control_table_min_max_position_limit
[Shutdown]: /docs/en/popup/x/control_table_shutdown

{% include en/dxl/common_link.md %}
