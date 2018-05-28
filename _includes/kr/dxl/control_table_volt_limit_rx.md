
전압 동작 범위의 상한과 하한 값입니다.

|단위|범위|상세설명|
| :---: | :---: | :---: |
|약 0.1 [V]|50 ~ 250|5.0 ~ 25.0 [V]|

상한과 하한 각각 50 ~ 250 (0x32 ~ 0xFA)까지 사용 가능하며, 단위는 0.1 [V]입니다.
예를 들어, 값이 120이면 12 [V]입니다.
[Present Voltage(42)] 현재 전압 값이 이 범위를 벗어날 경우 Status Packet 중 ERROR의 Voltage Range Error Bit(Bit0)가 ‘1’로 설정되어 반환되고, Alram LED(Address 17)과 Shutdown(Address 18)의 플래그(flag)중 입력 전압 에러(Input Voltage Error)가 설정되어 있다면 기능이 발휘됩니다.

[Present Voltage(42)]: #present-voltage
