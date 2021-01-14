다이나믹셀은 Instruction Packet을 수신하면, Return Delay Time(9) 만큼 대기한 후 Status Packet을 반환 합니다.  
0 ~ 254 (0xFE) 까지 사용 가능하며 단위는 2 [μsec] 입니다.  
예를 들어, 값이 10일 경우 20 [μsec] 만큼 시간이 지난 후에 Status Packet을 반환합니다.

|   단위   |  범위   |                  상세설명                  |
|:--------:|:-------:|:------------------------------------------:|
| 2 [μsec] | 0 ~ 254 | 초기값: ‘250’(500 [μs]) <br> 최대 508 [μs] |

**주의** : Return Delay Time(9)은 Modbus-RTU 프로토콜에서 동작되지 않습니다.   
{: .notice--warning}
