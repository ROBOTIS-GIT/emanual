Status Packet의 반환하는 방식을 결정합니다.

| 값 |               응답하는 명령                |                     설명                   |
|:--:|:-----------------------------------------:|:-----------------------------------------:|
|  0 |              PING Instruction             | PING 명령에 대해서만 Status Packet을 반환함 |
|  1 |   PING Instruction<br />Read Instruction  |      PING과 READ 명령에 대해서만 반환함     |
|  2 |              All Instruction              |          모든 명령에 대해서 반환함          |

**참고**: Instruction packet 의 ID가 Broadcast ID(0xFE) 인 경우는 Status Return Level(15)의 설정 값과 무관하게 Read Instruction 또는 Write Instruction에 대한 Status Packet은 반환되지 않습니다. 더 자세한 설명은 [Protocol 2.0]의 [Status Packet]항목을 참조하세요.
{: .notice}

[Status Packet]: /docs/kr/dxl/protocol2/#packet