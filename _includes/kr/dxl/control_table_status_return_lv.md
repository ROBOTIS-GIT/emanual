Status Packet의 반환 방식을 결정합니다.

| 값 |             응답하는 명령              |                     상세설명                      |
|:--:|:--------------------------------------:|:-------------------------------------------------:|
| 0  |            PING Instruction            |    PING 명령에 대해서만 Status Packe을 반환함     |
| 1  | PING Instruction<br />READ Instruction | PING과 READ 명령에 대해서만 Status Packe을 반환함 |
| 2  |            All Instructions            |     모든 명령에 대해서 Status Packe을 반환함      |


{% if page.product_group=='xl330' %}

**참고** : [Instruction Packet ID](/docs/kr/dxl/protocol2/)가 [Broadcast ID](/docs/kr/dxl/protocol2/#packet-id) 인 경우는  Status Return Level(68)의 설정값과 무관하게 Read Instruction 또는 Write Instruction에 대한 Status Packet은 반환되지 않습니다. 더 자세한 설명은 [Protocol 2.0]의 `Status Packet` 항목을 참조하심시오.
{: .notice}

{% else %}
**참고** : Instruction packet 의 ID가 Broadcast ID(0xFE) 인 경우는  Status Return Level(68)의 설정값과 무관하게 Read Instruction 또는 Write Instruction에 대한 Status Packet은 반환되지 않습니다. 더 자세한 설명은 [Protocol 1.0] 와 [Protocol 2.0]의 `Status Packet` 항목을 참조하심시오.
{: .notice}

{% endif %}
