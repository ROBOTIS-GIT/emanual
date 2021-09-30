
{% if page.product_group=='xl330' or page.product_group=='xc330'%}

다이나믹셀과 통신하기 위해서는, 적절한 프로토콜 타입을 선택해야 합니다.

다음 표를 참고하여, 함께 사용할 장치의 프로토콜 타입에 맞추어, 다이나믹셀의 적절한 프로토콜을 선택 하세요. 

|    값     |                     타입                      |               설명                |
| :-------: | :-----------------------------------------------: | :-------------------------------: |
| 2(기본값) | [DYNAMIXEL Protocol 2.0](#dynamixel-protocol-20)  | [프로토콜 호환표]{: .popup} 참고  |
|    20     | [Experimental S.BUS](#experimental-sbus-프로토콜) |  S.BUS 프로토콜을 지원하는 RC 수신장치와 호환됨        |
|    21     | [Experimental iBUS](#experimental-ibus-프로토콜)  |  iBUS 프로토콜을 지원하는 RC 수신장치와 호환됨         |
|    22     |            [RC-PWM](#rc-pwm-프로토콜)             | RC 서보모터에서 이용하는 PWM 신호 |

**주의**  
`Experimental S.BUS`와 `Experimental iBUS`는 S.BUS와 iBUS의 **일부** 기능을 지원하는 실험용 프로토콜이며, 다른 장치와 완전하게 호환되지 않을 수 있습니다.  
실험용 프로토콜의 사용에 따른 책임은 사용자에게 있습니다.
{: .notice--danger}

{% capture protocol_note_01 %}
**참고**
- 프로토콜 타입이 RC 프로토콜 타입(Experimental S.BUS, Experimental iBUS, RC-PWM)으로 설정된 경우, 부팅시 일정 시간동안 해당 신호가 감지되지 않으면, DYNAMIXEL Protocol 2.0으로 동작합니다.
따라서, DYNAMIXEL Protocol 2.0으로 설정되어 있지 않아도, [다이나믹셀 위자드 2.0](/docs/kr/software/dynamixel/dynamixel_wizard2/) 등을 이용하여 컨트롤 테이블 접근이 가능합니다.
- RC 프로토콜 타입 (Experimental S.BUS, Experimental iBUS, RC-PWM) 설정 후 부팅시 해당하는 프로토콜이 감지되면 RC 모드로 동작되며 자동으로 **Torque On** 상태가 됩니다.
{% endcapture %}
<div class="notice">{{ protocol_note_01 | markdownify }}</div>


#### [DYNAMIXEL Protocol 2.0](#dynamixel-protocol-20)

다이나믹셀간의 데이터 통신을 위한 기본적인 통신 프로토콜 입니다. 

자세한 내용은 [다이나믹셀 프로토콜 2.0]을 참고하세요.

#### [Experimental S.BUS 프로토콜](#experimental-sbus-프로토콜)

`Experimental S.BUS`는 S.BUS 프로토콜을 부분적으로 지원하며, 지원되는 기능은 아래와 같습니다.
{: .notice--warning}

S.BUS는 RC 제품에서 사용하는 통신 프로토콜 입니다. XL330 시리즈는 S.BUS를 지원하는 다른 장치와 완전하게 호환되지 않을 수 있습니다.  
- 최대 16개의 다이나믹셀을 공유 통신선으로 연결할 수 있으며, ID가 1~16로 설정되어 있을 경우에만 Experimental S.BUS 프로토콜로 동작이 가능합니다.
- 전달되는 데이터 값의 범위는 0~2,047 (11 bits)입니다.
- 위치제어 모드일 때에는 [Goal Position(116)]으로, 속도제어 모드일 경우에는 [Goal Velocity(104)]로 데이터가 전달됩니다. 프로토콜로 전달받은 데이터에 따른 제어 지령치는 아래 그래프와 같습니다.

<img src="/assets/images/dxl/x/xl330_temp/protocol_s_bus_graph_kr.png" width="1100">

<!-- 

![](/assets/images/dxl/x/xl330_temp/protocol_s_bus_position_mode.png)

  > 위치제어 모드

![](/assets/images/dxl/x/xl330_temp/protocol_s_bus_velocity_mode.png)

  > 속도제어 모드 

-->

**참고**: 속도제어 모드에서 최대 속도는 [Velocity Limit(44)](#velocity-limit44) 값으로, 움직이지 않는 범위([Goal Velocity(104)](#goal-velocity104)가 0인 범위)는 [Moving Threshold(24)](#moving-threshold24) 값으로 설정할 수 있습니다.
{: .notice}

#### [Experimental iBUS 프로토콜](#experimental-ibus-프로토콜)

`Experimental iBUS`는 iBUS 프로토콜을 부분적으로 지원하며, 지원되는 기능은 아래와 같습니다.
{: .notice--warning}

iBUS는 RC 제품에서 사용하는 통신 프로토콜 입니다. XL330 시리즈는 iBUS를 지원하는 다른 장치와 완전하게 호환되지 않을 수 있습니다.  
- 최대 14개의 다이나믹셀을 공유 통신선으로 연결할 수 있으며, ID가 1~14로 설정되어 있을 경우에만 Experimental iBUS 프로토콜로 동작이 가능합니다.
- 전달되는 데이터 값의 범위는 0~16,383(16 bits)입니다.
- 위치제어 모드일 때에는 [Goal Position(116)]으로, 속도제어 모드일 경우에는 [Goal Velocity(104)]로 데이터가 전달됩니다. 프로토콜로 전달받은 데이터에 따른 제어 지령치는 아래 그래프와 같습니다.

<img src="/assets/images/dxl/x/xl330_temp/protocol_ibus_graph_kr.png" width="1100">

**참고**: 속도제어 모드에서는 최대 속도는 [Velocity Limit(44)](#velocity-limit44) 값으로, 움직이지 않는 범위(Goal Velocity가 0인 범위)는 [Moving Threshold(24)](#moving-threshold24) 값으로 설정할 수 있습니다.
{: .notice}

#### [RC-PWM 프로토콜](#rc-pwm-프로토콜)

RC 제품군에서 사용하는 PWM(Pulse Width Modulation) 신호로, 여러 장치가 신호선을 공유할 수 없지만, 가장 고전적이고 오랫동안 대중적으로 사용되고 있는 RC 서보모터의 프로토콜입니다. RC-PWM 신호는 다음과 같이 신호 펄스폭의 시간으로 통해서 데이터를 전송하는 방식으로, 시간에 대한 아날로그 데이터입니다.

<img src="/assets/images/dxl/x/xl330_temp/protocol_rc_pwm_duty.png" width="550">

RC PWM 신호 데이터는 위치제어 모드일 때에는 [Goal Position(116)](#goal-position116)으로, 속도제어 모드일 경우에는 [Goal Velocity(104)](#goal-velocity104)로 데이터가 전달됩니다. RC-PWM 신호의 데이터에 따른 지령치는 다음 그래프와 같습니다.

<img src="/assets/images/dxl/x/xl330_temp/protocl_rc_pwm_graph_kr.png" width="1100">

**참고**: 속도제어 모드에서는 최대 속도는 [Velocity Limit(44)](#velocity-limit44) 값으로, 움직이지 않는 범위(Goal Velocity가 0인 범위)는 [Moving Threshold(24)](#moving-threshold24) 값으로 설정할 수 있습니다.
{: .notice}

{% else %}

장치의 프로토콜 타입 (DYNAMIXEL Protocol 1.0 또는 2.0)을 설정할 수 있습니다. 

함께 사용할 장치의 프로토콜 타입에 맞춰서 설정하세요.

|    값     |          설명          |                     호환되는 장치                     |
| :-------: | :--------------------: | :---------------------------------------------------: |
|     1     | DYNAMIXEL Protocol 1.0 | AX 시리즈, DX 시리즈, RX 시리즈, EX 시리즈, MX 시리즈 |
| 2(기본값) | DYNAMIXEL Protocol 2.0 |        MX-28/64/106(2.0), X 시리즈, PRO 시리즈        |


{% capture protocol_note_02 %}
**참고** : 
- [다이나믹셀 프로토콜 2.0](/docs/kr/dxl/protocol2/)은 [프로토콜 1.0](/docs/kr/dxl/protocol1/)의 안전성을 대폭 개선하였습니다. 프로토콜 1.0을 사용할 경우, 컨트롤테이블의 일부 영역의 접근이 제한될 수 있습니다.
- 프로토콜을 변경하려면 [다이나믹셀 위자드 2.0](/docs/kr/software/dynamixel/dynamixel_wizard2/)을 사용하세요.
- 장치가 지원하는 프로토콜은 [프로토콜 호환표](/docs/kr/popup/faq_protocol_compatibility_table/){: .popup}를 참조하세요.
{% endcapture %}
<div class="notice">{{ protocol_note_02 | markdownify }}</div>

{% endif %}

[프로토콜 1.0]: /docs/kr/dxl/protocol1/
[다이나믹셀 프로토콜 2.0]: /docs/kr/dxl/protocol2/
[다이나믹셀 위자드 2.0]: /docs/kr/software/dynamixel/dynamixel_wizard2/
[프로토콜 호환표]: /docs/kr/popup/faq_protocol_compatibility_table/
