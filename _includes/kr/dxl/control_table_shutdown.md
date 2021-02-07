<!--
AX,EX,DX,RX Series : Shutdown [18], Torque Enable [24]
X-Series: Shutdown [63], Torque Enable [64], Hardware Error Status(70)
PRO-Series: Shutdown [48], Torque Enable [562], Hardware Error Status(892)
PRO(A)/PRO+ Series: Shutdown [63], Torque Enable (512), Hardware Error Status(518)
Revision: PRO+ > DYNAMIXEL-P.
-->

{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %}

{% assign shutdown = "Shutdown(18)" %}
{% assign torque_enable = "Torque Enable(24)" %}

{% elsif page.product_group=='dxl_pro' %}

{% assign shutdown = "Shutdown(48)" %}
{% assign torque_enable = "Torque Enable(562)" %}
{% assign hardware_error_status = "Hardware Error Status(892)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign shutdown = "Shutdown(18)" %}
{% assign torque_enable = "Torque Enable(24)" %}
{% assign hardware_error_status = "Hardware Error Status(50)" %}

{% else %} <!-- X / MX 2.0 / P / PRO(A)-->

{% assign shutdown = "Shutdown(63)" %}

  {% if page.product_group =='dxl_pro_a' or page.product_group =='dxl_p'%}
    {% assign torque_enable = "Torque Enable(512)" %}
    {% assign hardware_error_status = "Hardware Error Status(518)" %}
  {% else %}
    {% assign torque_enable = "Torque Enable(64)" %}
    {% assign hardware_error_status = "Hardware Error Status(70)" %}
  {% endif %}
{% endif %}

장치는 동작 중에 발생하는 위험 상황을 감지하여 스스로를 보호할 수 있습니다.
각 Bit의 기능은 ‘OR’의 논리로 적용되기 때문에 중복 설정이 가능합니다.
즉, {{ shutdown }} 이 ‘0x05’ (2 진수: 00000101)로 설정되었을 경우, Input Voltage Error(2 진수 : 00000001)와 Overheating Error(2 진수 : 00000100)가 발생하는 것을 모두 감지할 수 있습니다. 위험 상황이 감지되면, {% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} LED가 점멸하고 모터 출력은 0 [%]로 변경됩니다. {% else %} [{{ torque_enable }}] 값이 ‘0’으로 변경되고 모터 출력은 0 [%]가 됩니다.
{% endif %}
{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %}{% else %}
위험 상황이 감지된 후에는 Reboot을 하지 않는 한, [{{ torque_enable }}] 을 ‘1’(Torque ON)로 설정할 수 없습니다.제어기는 Status Packet의 Error 필드에 [Alert Bit(0x80)]이 설정되었는지를 확인하거나, [{{ hardware_error_status }}] 을 통해서 현재 상태를 확인할 수 있습니다.
{% endif %}
[{{ shutdown }}] 에서 감지할 수 있는 위험 상황은 아래 표와 같습니다.

{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %}
|  Bit  |        항목         | 설명                                                                                     |
|:-----:|:-------------------:|:-----------------------------------------------------------------------------------------|
| Bit 7 |          0          | -                                                                                        |
| Bit 6 |  Instruction Error  | 정의되지 않은 Instruction이 전송된 경우, 또는 REG_WRITE 명령 없이 ACTION 명령이 전달된 경우 |
| Bit 5 |   Overload Error    | 모터의 최대 출력으로 제어할 수 없는 하중이 지속적으로 적용되는 경우                      |
| Bit 4 |   CheckSum Error    | 전송된 Instruction Packet의 CheckSum이 맞지 않을 경우                                   |
| Bit 3 |     Range Error     | Instruction Packet(WRITE)으로 허용범위를 벗어난 값을 쓰려고 할 경우                |
| Bit 2 |  Overheating Error  | 설정된 온도를 벗어난 경우                                                    |
| Bit 1 |  Angle Limit Error  | 적용한 Goal Position이 설정한 CW/CCW Angle Limit 범위를 벗어난 경우                      |
| Bit 0 | Input Voltage Error | 인가된 전압이 설정된 동작 전압 범위를 벗어났을 경우                                      |
{% elsif page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %}
|  Bit  |              명칭               | 내용                                                                                   |
|:-----:|:-------------------------------:|:---------------------------------------------------------------------------------------|
| Bit 7 |                -                | 미사용, 항상 '0'                                                                       |
| Bit 6 |                -                | 미사용, 항상 '0'                                                                       |
| Bit 5 |     Overload Error(기본값)      | 모터의 최대 출력으로 제어 할 수 없는 하중이 지속적으로 적용되는 경우                   |
| Bit 4 | Electrical Shock Error(기본값)  | 전기적으로 회로가 충격을 받거나, 입력 전력이 부족해서, 모터가 정상동작하지 못하는 경우 |
| Bit 3 |   Motor Encoder Error(기본값)   | 모터의 엔코더가 동작하지 않을 경우                                                     |
| Bit 2 |        Overheating Error        | 설정된 온도를 벗어난 경우                                                  |
| Bit 1 | Motor Hall Sensor Error(기본값) | 모터의 홀센서 값이 정상 범위를 벗어났을 경우                                           |
| Bit 0 |       Input Voltage Error       | 인가된 전압이 설정된 동작 전압 범위를 벗어났을 경우                                    |
{% else %}
|  Bit  |              명칭              | 상세 설명                                                                                                                      |
|:-----:|:------------------------------:|:-------------------------------------------------------------------------------------------------------------------------------|
| Bit 7 |               -                | 미사용, 항상 '0'                                                                                                               |
| Bit 6 |               -                | 미사용, 항상 '0'                                                                                                               |
| Bit 5 |     Overload Error(기본값)     | 최대 출력으로 제어할 수 없는 하중이 지속적으로 발생한 경우                                                                     |
| Bit 4 | Electrical Shock Error(기본값) | 전기적으로 회로가 충격을 받았거나, 입력 전력이 부족해서 모터가 정상 동작하지 못하는 경우                                       |
| Bit 3 |      Motor Encoder Error       | 모터의 엔코더가 동작하지 않는 경우                                                                                             |
| Bit 2 |   Overheating Error(기본값)    | 설정된 온도를 벗어난 경우                                                                                          |
| Bit 1 |               -                | 미사용, 항상 '0'                                                                         |{% if page.product_group=='xl330' %} |
| Bit 0 |  Input Voltage Error(기본값)   | 인가된 전압이 설정된 동작전압 범위를 벗어난 경우                                                 |{% else %}                   |
| Bit 0 |      Input Voltage Error       | 인가된 전압이 설정된 동작전압 범위를 벗어난 경우                                                 |{% endif %}                  |

{% endif %}

{% if page.product_group=='dxl_xw540' %}
{% capture shutdown_uptodate_firmware_released_dxl %}
**참고** : Shutdown이 발생할 경우 장치를 **장치를 REBOOT** 시켜 주세요
-  H/W REBOOT : 전원을 껐다 켜주세요.
-  S/W REBOOT : REBOOT Instruction을 사용할수 있습니다. [Protocol 2.0](/docs/kr/dxl/protocol2/#reboot)을 참고해주세요.
{% endcapture %}
<div class="notice">{{ shutdown_uptodate_firmware_released_dxl | markdownify }}</div>

{% elsif page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %}
**참고** : Shutdown이 발생하면, **1초 주기로 LED가 점멸합니다.** 전원을 껏다 다시 켜주세요 (Reboot).
{: .notice}
{% else %}
{% capture shutdown_01 %}
**참고** :
{% if page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %}1. Shutdown이 발생하면 **전기적 브레이크(Dynamic brake) 상태로 전환**됩니다.{% else %}{% endif %}
2. Shutdown이 발생하면 **1초 주기로 LED가 점멸** 합니다.{% if page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' or page.product_group=='xl330' %}{% else %}(**펌웨어 버전 41 이상**) {% endif %}
3. Shutdown이 발생하면 다음과 같은 방법으로 **장치를 REBOOT** 시켜 주세요.
-  H/W REBOOT : 전원을 껐다 켜주세요.
-  S/W REBOOT : REBOOT Instruction을 사용할수 있습니다. [Protocol 2.0](/docs/kr/dxl/protocol2/#reboot)을 참고해주세요.
{% endcapture %}
<div class="notice">{{ shutdown_01 | markdownify }}</div>
{% endif %}
