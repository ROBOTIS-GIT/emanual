
Status Packet의 반환 방식을 결정합니다.

|값|동작 방식|
|:---:|:---:|
|0|모든 명령에 대해 반환하지 않음. (단, PING 명령 제외)|
|1|READ 명령에 대해서만 반환함.|
|2|모든 명령에 대해서 반환함.|
 
`Note` Instruction packet 의 ID가  Broadcast ID 인 경우는 이 값에 상관 없이 Status Packet이 반환되지 않습니다. 더 자세한 정보는 [Protocol 1.0] 또는 [Protocol 2.0]의 `Status Packet`을 참조하십시오.
{: .notice}

[Protocol 1.0]: /docs/kr/dxl/protocol1/#status-packet
[Protocol 2.0]: /docs/kr/dxl/protocol2/#status-packet
