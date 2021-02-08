
전압 동작 범위의 상한과 하한 값입니다.

|  단위   |   범위   |  상세설명   |
|:-------:|:--------:|:-----------:|
| 약 0.1 [V] | 50 ~ 160 | 5.0 ~ 16.0 [V] |

상한과 하한 각각 50 ~ 160 (32 ~ A0)까지 사용 가능하며, 단위는 0.1 [V]입니다. 예를 들어, 값이 120이면 12 [V]입니다. 
장치에 현재 인가된 전압을 나타내는 [Present Voltage(42)]가 Min Voltage Limit(12)와 Max Voltage Limit(13)의 범위를 벗어날 경우, Status Packet은 ERROR 필드를 통해서 Input Voltage Error Bit(0x01)를 전송합니다. [Alarm LED(17)/Shutdown(18)](#alarm-led17-shutdown18)의 설정 중에서 Input Voltage Error Bit(0x01)가 설정되어 있다면 Alarm LED가 점멸하고, 모터 출력은 0 [%]로 변경됩니다.

[Present Voltage(42)]: #present-voltage
