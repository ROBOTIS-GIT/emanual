Status Packet의 반환 방식을 결정합니다.

| 값 |             응답하는 명령              |                  상세설명                   |
|:--:|:--------------------------------------:|:-------------------------------------------:|
| 0  |            PING Instruction            | PING 명령에 대해서만 Status Packet을 반환함 |
| 1  | PING Instruction<br />READ Instruction |     PING과 READ 명령에 대해서만 반환함      |
| 2  |            All Instructions            |          모든 명령에 대해서 반환함          |


**주의** : Status Return Level(516)은 Modbus-RTU 프로토콜에서 동작되지 않습니다.   
{: .notice--warning}

**참고** : Instruction packet 의 ID가 Broadcast ID(0xFE) 인 경우는 Status Return Level(516)의 설정값과 무관하게 Read Instruction 또는 Write Instruction에 대한 Status Packet은 반환되지 않습니다. 더 자세한 설명은 [Protocol 2.0]의 [Status Packet] 항목을 참조하세요.
{: .notice}

[Status Packet]: /docs/kr/dxl/protocol2/#status-packet
[Protocol 2.0]: /docs/kr/dxl/protocol2/#status-packet
