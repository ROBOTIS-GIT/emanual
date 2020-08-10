
{% if page.product_group=='xl330' %}

To communicate with DYANMIXEL, it is important to select a proper protocol type.  

The following table lists available protocol types compatible with DYNAMIXEL for communication.

Select a desired DYNAMIXEL protocol type according to your application.

|   Value    |              Protocol Type              |                           Compatible DYNAMIXEL                            |
|:----------:|:---------------------------------------:|:-------------------------------------------------------------------------:|
| 2(default) | [DYNAMIXEL Protocol 2.0](#dynamixel-20) |                 [Protocol Compatibility table]{: .popup}                  |
|     20     |         [S.BUS](#sbus-protocol)         | Protocol controlling RC servos commonly used by Futaba and FrSky products |
|     21     |         [iBUS](#ibus-protocol)          |          Protocol controlling RC servos used by FlySKy products           |
|     22     |       [RC-PWM](#rc-pwm-protocol)        |                       PWM signal used by RC servos                        |

{% capture protocol_note_01 %}
**참고**
- 프로토콜 타입이 RC 프로토콜 타입(S.BUS, iBUS, RC-PWM)으로 설정된 경우, 부팅시 일정시간동안 해당 신호가 감지되지 않으면, 다이나믹셀 프로토콜 2.0으로 동작합니다.
따라서, 다이나믹셀 프로토콜 2.0으로 설정되어 있지 않아도, [다이나믹셀 위자드 2.0](/docs/kr/software/dynamixel/dynamixel_wizard2/) 등을 이용하여 컨트롤 테이블 접근이 가능합니다.
- RC 프로토콜 타입 (S.BUS, iBUS, RC-PWM) 설정 후, 부팅시 해당하는 프로토콜이 감지되어, RC 모드로 동작되면 자동으로 Torque On 상태가 됩니다.
{% endcapture %}
<div class="notice">{{ protocol_note_01 | markdownify }}</div>

#### [DYNAMIXEL Protocol 2.0](#dynamixel-protocol-20)

The basic communication protocol to communicate between DYNAMIXELs. See [Protocol 2.0] for more detailed information.

#### [S.Bus Protocol](#sbus-protocol)

The communication protocol controlling RC servos commonly used by Futaba and FrSky products.
- Multiple DYNAMIXELs, the maximum is 16, can be wired via a daisy chain. Notice that S.BUS protocol allows only the range of [ID(7)] from 1 to 16 for use.
- The available range of data transmission is from 0 to 2,047, 11 bits.
- On Position Control sends; [Operating Mode(11)], the data will be passed to [Goal Position(116)]. On Velocity Mode, the data will be passed to [Goal Velocity(104)]. See the  following graph how the transmitted data should be applied via S.Bus Protocol.  

<img src="/assets/images/dxl/x/xl330_temp/protocol_s_bus.png" width="1100">

<!-- 

![](/assets/images/dxl/x/xl330_temp/protocol_s_bus_position_mode.png)

  > 위치제어 모드

![](/assets/images/dxl/x/xl330_temp/protocol_s_bus_velocity_mode.png)

  > 속도제어 모드 

-->

**참고**: 속도제어 모드에서 최대 속도는 [Velocity Limit(44)](#velocity-limit44) 값으로, 움직이지 않는 범위([Goal Velocity(104)](#goal-velocity104)가 0인 범위)는 [Moving Threshold(24)](#moving-threshold24) 값으로 설정할 수 있습니다.
{: .notice}

#### [iBUS Protocol](#ibus)

FlySky제품에서 사용하는 RC 규격의 통신 프로토콜 입니다. 
- 최대 14개의 다이나믹셀을 공유 통신선으로 연결할 수 있으며, ID가 1~14로 설정되어 있을 경우에만 iBUS 프로토콜로 동작이 가능합니다.
- 전달되는 데이터 값의 범위는 0~16,383(16 bits)입니다.
- 위치제어 모드일 때에는 [Goal Position(116)]으로, 속도제어 모드일 경우에는 [Goal Velocity(104)]로 데이터가 전달됩니다. 프로토콜로 전달받은 데이터에 따른 제어 지령치는 아래 그래프와 같습니다.

<img src="/assets/images/dxl/x/xl330_temp/protocol_ibus_graph.png" width="1100">

**참고**: 속도제어 모드에서는 최대 속도는 [Velocity Limit(44)](#velocity-limit44) 값으로, 움직이지 않는 범위(Goal Velocity가 0인 범위)는 [Moving Threshold(24)](#moving-threshold24) 값으로 설정할 수 있습니다.
{: .notice}

#### [RC-PWM Protocol](#rc-pwm)

RC 제품군에서 사용하는 PWM(Pulse Width Modulation) 신호로, 여러 장치가 신호선을 공유할 수 없지만, 가장 고전적이고 오랫동안 대중적으로 사용되고 있는 RC 서보모터의 프로토콜입니다. RC-PWM 신호는 다음과 같이 신호 펄스폭의 시간으로 통해서 데이터를 전송하는 방식으로, 시간에 대한 아날로그 데이터입니다.

 the radio control

<img src="/assets/images/dxl/x/xl330_temp/protocol_rc_pwm_duty.png" width="550">

RC PWM 신호 데이터는 위치제어 모드일 때에는 [Goal Position(116)](#goal-position116)으로, 속도제어 모드일 경우에는 [Goal Velocity(104)](#goal-velocity104)로 데이터가 전달됩니다. RC-PWM 신호의 데이터에 따른 지령치는 다음 그래프와 같습니다.

<img src="/assets/images/dxl/x/xl330_temp/protocl_rc_pwm_graph.png" width="1100">

**참고**: 속도제어 모드에서는 최대 속도는 [Velocity Limit(44)](#velocity-limit44) 값으로, 움직이지 않는 범위(Goal Velocity가 0인 범위)는 [Moving Threshold(24)](#moving-threshold24) 값으로 설정할 수 있습니다.
{: .notice}
{% else %}

Users can select DYNAMIXEL protocol type (1.0 and 2.0).  
Even if Protocol 1.0 is selected, Protocol 2.0 Control Table will be used.  
It is recommended to use an identical protocol type for multiple DYNAMIXEL.

|   Value    | Protocol Type |                             Compatible DYNAMIXEL                              |
|:----------:|:-------------:|:-----------------------------------------------------------------------------:|
|     1      |      1.0      | AX Series, DX Series, RX Series, EX Series, MX Series with Firmware below v39 |
| 2(default) |      2.0      |         MX-28/64/106 with Firmware v39 or above, X Series, PRO Series         |


**WARNING** : In order to change the Protocol Type to Protocol 1.0, please use [DYNAMIXEL Wizard 2.0] as R+ Manager 2.0 does not support Protocol 1.0.
{: .notice--warning}

**NOTE** : The protocol 2.0 is greatly enhanced from the protocol 1.0. Accessing some of the Control Table area might be denied if protocol 1.0 is selected. This manual complies with protocol 2.0. Please refer to the [Protocol 1.0] and [Protocol 2.0] of e-Manual for more details about the protocol.
{: .notice}

**NOTE** : Please refer to the [Protocol Compatibility table]{: .popup} for product.
{: .notice}

{% endif %}

[Protocol Compatibility table]: /docs/en/popup/faq_protocol_compatibility_table/
[DYNAMIXEL Wizard 2.0]: /docs/en/software/dynamixel/dynamixel_wizard2/
