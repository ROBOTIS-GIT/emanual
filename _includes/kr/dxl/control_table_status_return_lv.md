Status Packet의 반환 방식을 결정합니다.

| 값 |             응답하는 명령              |                     상세설명                      |
|:--:|:--------------------------------------:|:-------------------------------------------------:|
| 0  |            PING Instruction            | PING 명령을 제외한 모든 명령에 대해 반환하지 않음 |
| 1  | PING Instruction<br />READ Instruction |        PING과 READ 명령에 대해서만 반환함         |
| 2  |            All Instructions            |             모든 명령에 대해서 반환함             |

{% if page.product_group=='xl330' %}

**참고** : Instruction packet 의 ID가  Broadcast ID 인 경우는 이 값에 상관 없이 Status Packet이 반환되지 않습니다. 더 자세한 설명은 [Protocol 2.0]의 `Status Packet` 항목을 참조하심시오.
{: .notice}

{% else %}
**참고** : Instruction packet 의 ID가  Broadcast ID 인 경우는 이 값에 상관 없이 Status Packet이 반환되지 않습니다. 더 자세한 설명은 [Protocol 1.0] 와 [Protocol 2.0]의 `Status Packet` 항목을 참조하심시오.
{: .notice}

{% endif %}
