장치에 발생한 문제에 대한 코드를 나타냅니다. 장치에 발생하는 에러 목록은 아래와 같습니다.

| 값        |           이름               | Torque ON  | *Hold | 에러헤제 | 설명                                                          |
|:---------:|:----------------------------:|:---------:|:-----:|:--------:|:-------------------------------------------------------------|
| 0 (0x00)  | No Error                     | -         | -     | -        | 에러 없음                                                     |
| 1 (0x01)  | Over Voltage Error           | N         | -     | Y        | 장치 인가 전압이 [Max Voltage Limit(60)] 범위를 넘음            |
| 2 (0x02)  | Low Voltage Error            | N         | -     | Y        | 장치 인가 전압이 [Min Voltage Limit(62)] 범위를 넘음            |
| 3 (0x03)  | Inverter Overheating Error   | N         | -     | Y        | 인버터의 온도가 [Inverter Temperature Limit(56)]을 넘음        |
| 4 (0x04)  | Motor Overheating Error      | N         | -     | Y        | 모터의 온도가 [Motor Temperature Limit(57)]을 넘음            |
| 5 (0x05)  | Overload Error               | N         | -     | N        | 정격 전류를 초과하는 전류를 장시간 사용                          |
| 7 (0x07)  | Inverter Error               | N         | -     | N        | 인버터에 문제가 발생함                                         |
| 9 (0x09)  | Battery Warning              | Y         | N     | N        | Multi-turn 배터리 전압이 낮음. 교체 권장                        |
| 10 (0x0A) | Battery Error                | N         | -     | N        | Multi-turn 배터리 전압이 너무 낮아 문제 발생                    |
| 11 (0x0B) | Magnet Error                 | N         | -     | N        | Multi-turn 위치를 잃어버림.                                   |
| 12 (0x0C) | Multi-turn Error             | N         | -     | N        | Multi-turn IC에 문제가 발생함. Multi-turn Clear 필요           |
| 13 (0x0D) | Encoder Error                | N         | -     | N        | Encoder IC에 문제가 발생함                                     |
| 14 (0x0E) | Hall Sensor Error            | N         | -     | N        | Hall Sensor에 문제가 발생함                                    |
| 15 (0x0F) | Calibration Error            | N         | -     | N        | Calibration 데이터를 찾을 수 없음                               |
| 17 (0x11) | Following Error              | Y         | Y     | Y        | 위치제어에서 Error 값이 [Following Error Threshold(44)]보다 큼  |
| 18 (0x12) | Bus Watchdog Error           | Y         | Y     | Y        | Bus Watchdog Error가 발생함                                    |
| 19 (0x13) | Over Speed Error             | Y         | Y     | Y        | [Velocity Limit(72)] 보다 120% 이상의 속도로 회전함             |
| 20 (0x14) | Position Limit Reached Error | Y         | Y     | Y        | 위치제어모드에서 현재 위치가 [Max/Min Position Limit(76, 84)]<br /> + [Position Limit Threshold(38)] 영역 내에서 밖으로 벗어남 |


**참고** : *Hold 상태는 Torque On 상태가 유지되고 Goal Value Write가 불가능한 상태입니다. 위치제어, 속도제어모드의 경우 감속 정지 후 현재 위치를 유지하며, 전류제어의 경우 Dynamic Brake 모드가 됩니다.
{: .notice}


#### [에러 해제 방법](#에러-해제-방법)

장치에 에러가 발생한 경우 에러 해제가 가능한 에러에 대해서는 아래 방법으로 해결 가능합니다.   
1. Error Clear Packet: 에러 해제가 가능한 에러는 [Error Clear Packet]으로 초기화 가능합니다.
2. Dynamixel Wizard 2.0: 우측 Error Code 옆에 Clear 버튼을 눌러 에러 해제가 가능합니다.

![](/assets/images/dxl/y/clear_error.png)

