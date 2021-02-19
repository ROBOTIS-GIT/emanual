
{% if page.product_group == 'dxl_p' %}

다이나믹셀의 프로토콜 타입(DYNAMIXEL Protocol 2.0, Modbus-RTU)을 설정할 수 있습니다.

DYNAMIXEL-P 모델의 Modbus-RTU는 펌웨어 버전 V11 이상에서 지원합니다.

{% elsif page.product_group == 'rh_p12_rna' %}

장치의 프로토콜 타입(DYNAMIXEL Protocol 2.0, Modbus-RTU)을 설정할 수 있습니다.

RH-P12-RN(A)의 Modbus-RTU는 펌웨어 버전 V12 이상에서 지원합니다.

{% endif %}

| 값 | 설명                                                                                                  |
|:--:|:------------------------------------------------------------------------------------------------------|
| 2  | [DYNAMIXEL Protocol 2.0]                                                                              |
| 10 | [Modbus-RTU, Industrial Standard Protocol]{: .blank}<br>![](/assets/images/dxl/p/protocol_mode_modbus.png) |

[DYNAMIXEL Protocol 2.0]: /docs/kr/dxl/protocol2/
[Modbus-RTU, Industrial Standard Protocol]: http://modbus.org/docs/PI_MBUS_300.pdf

**주의** : 다이나믹셀-P 시리즈의 Protocol Type(13)을 변경하려면 [다이나믹셀 위자드 2.0](/docs/kr/software/dynamixel/dynamixel_wizard2/)을 사용해주세요. R+ Manager 2.0은 Modbus-RTU를 지원하지 않습니다.
{: .notice--warning}

{% capture warn01 %}
**주의** : 아래의 데이터는 Modbus-RTU 프로토콜에서 동작되지 않습니다.  
[Return Delay Time(9)](#return-delay-time9)  
[Secondary ID(12)](#secondary-id12)  
[Status Return Level(516)](#status-return-level516)  
[Registered Instruction(517)](#registered-instruction517)  
[Indirect Address](#indirect-address)  
[Indirect Data](#indirect-data)
{% endcapture %}
<div class="notice--warning">{{ warn01 | markdownify }}</div>
