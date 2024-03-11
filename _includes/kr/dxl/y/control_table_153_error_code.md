장치에 발생한 문제에 대한 코드를 나타냅니다. 에러 해제가 가능한 에러는 Error Clear Packet(링크)으로 초기화 가능합니다.

| 값 |           이름               | Torque ON  | *Hold | 에러헤제 | 설명                                                          |
|:--:|:----------------------------:|:---------:|:-----:|:--------:|:-------------------------------------------------------------|
| 0  | No Error                     | -         | -     | -        | 에러 없음                                                     |
| 1  | Over Voltage Error           | N         | -     | Y        | 장치 인가 전압이 [Max Voltage Limit(60)] 범위를 넘음            |
| 2  | Low Voltage Error            | N         | -     | Y        | 장치 인가 전압이 [Min Voltage Limit(62)] 범위를 넘음            |
| 3  | Inverter Overheating Error   | N         | -     | Y        | Inverter의 온도가 [Inverter Temperature Limit(56)]을 넘음      |
| 4  | Motor Overheating Error      | N         | -     | Y        | Motor의 온도가 [Motor Temperature Limit(57)]을 넘음            |
| 5  | Overload Error               | N         | -     | Y        | 정격 전류를 초과하는 전류를 장시간 사용                          |
| 7  | Inverter Error               | N         | -     | N        | Inverter에 문제가 발생함                                       |
| 9  | Battery Warning              | Y         | N     | N        | Multi-Turn 배터리 전압이 낮음. 교체 권장                        |
| 10 | Batter Error                 | N         | -     | N        | Multi-Turn 배터리 전압이 너무 낮아 문제 발생                    |
| 11 | Magnet Error                 | N         | -     | N        | Multi-Turn 위치를 잃어버림. Multi-Turn Clear 필요              |
| 12 | Multi-Turn Error             | N         | -     | N        | Multi-Turn IC에 문제가 발생함                                  |
| 13 | Encoder Error                | N         | -     | N        | Encoder IC에 문제가 발생함                                     |
| 14 | Hall Sensor Error            | N         | -     | N        | Hall Sensor에 문제가 발생함                                    |
| 15 | Calibration Error            | N         | -     | N        | Calibration 데이터를 찾을 수 없음                               |
| 17 | Following Error              | Y         | Y     | Y        | 위치제어에서 Error 값이 [Following Error Threshold(44)]보다     |
| 18 | Bus Watchdog Error           | Y         | Y     | Y        | Bus Watchdog Error가 발생함                                    |
| 19 | Over Speed Error             | Y         | Y     | Y        | [Velocity Limit(72)] 보다 120% 이상의 속도로 회전함             |
| 20 | Position Limit Reached Error | Y         | Y     | Y        | 위치제어모드에서 현재 위치가 [Max/Min Position Limit(76, 84)]<br /> + [Position Limit Threshold(38)] 영역 내에서 밖으로 벗어남 |


**참고** : *Hold 상태는 Torque On 상태에서 Goal Value Write가 불가능한 상태입니다. 위치제어, 속도제어모드의 경우 감속 정지 후 현재 위치를 유지하며, 전류제어의 경우 Dynamic Brake 모드가 됩니다.
{: .notice}