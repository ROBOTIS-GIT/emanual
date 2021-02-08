<!-- 
Protocol 1.0 Status Return lv - 16
Protocol 2.0 Status Return lv - 68
 -->

 {% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

 {% assign stauts_return_lv = "Stuatus Return Level (16)" %}
 {% assign protocol= "DYNAMIXEL Protocol 1.0" %}

 {% elsif page.product_group == 'dxl_xl320' %}

 {% assign stauts_return_lv = "Stuatus Return Level (17)" %}
 {% assign protocol= "DYNAMIXEL Protocol 2.0" %}

 {% else %}

 {% assign stauts_return_lv = "Stuatus Return Level (68)" %} <!-- X / MX 2.0  -->
 {% assign protocol= "DYNAMIXEL Protocol 2.0" %}

 {% endif %}

Status Packet의 반환 방식을 결정합니다.

| 값 |             응답하는 명령              |                     상세설명                      |
|:--:|:--------------------------------------:|:-------------------------------------------------:|
| 0  |            PING Instruction            |    PING 명령에 대해서만 Status Packe을 반환함     |
| 1  | PING Instruction<br />READ Instruction | PING과 READ 명령에 대해서만 Status Packe을 반환함 |
| 2  |            All Instructions            |     모든 명령에 대해서 Status Packe을 반환함      |


{% if page.product_group=='xl330' %}

**참고** : [Instruction Packet ID](/docs/kr/dxl/protocol2/)가 [Broadcast ID](/docs/kr/dxl/protocol2/#packet-id) 인 경우는  {{ stauts_return_lv }}의 설정값과 무관하게 Read Instruction 또는 Write Instruction에 대한 Status Packet은 반환되지 않습니다. 더 자세한 설명은 [{{ protocol }}]의 `Status Packet` 항목을 참조하심시오.
{: .notice}

{% else %}
**참고** : Instruction packet 의 ID가 Broadcast ID(0xFE) 인 경우는  {{ stauts_return_lv }}의 설정값과 무관하게 Read Instruction 또는 Write Instruction에 대한 Status Packet은 반환되지 않습니다. 더 자세한 설명은 [{{ protocol }}]의 `Status Packet` 항목을 참조하심시오.
{: .notice}

{% endif %}

[DYNAMIXEL Protocol 1.0]: /docs/kr/dxl/protocol1/
[DYNAMIXEL Protocol 2.0]: /docs/kr/dxl/protocol2/
