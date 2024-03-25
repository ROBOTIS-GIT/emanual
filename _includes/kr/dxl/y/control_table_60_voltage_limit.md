동작 전압의 상한 값과 하한 값입니다.  
현재 인가된 전압을 나타내는 [Present Input Voltage(568)]가 Max Voltage Limit(60)와 Min Voltage Limit(62)의 범위를 벗어날 경우 에러가 발생되어 아래 표와 같이 컨트롤테이블의 값이 변경되고 장치가 정지합니다.  
장치에 에러가 발생하였으므로 Status Packet은 Error 필드를 통해서 Alert Bit(0x80)을 전송합니다.


| 주소      | 명칭                | 변경 값                                             | 설명                                                                                       |
|:---------:|:------------------:|:----------------------------------------------------|:------------------------------------------------------------------------------------------|
| 152       | [Controller State]   | 9 (Hardware Fault)                                  | 내부 제어기가 Hardware Fault 상태로 변경됨                                                  |
| 153       | [Error Code]         | 1 (Over Voltage Error)<br />2 (Low Voltage Error)   | 현재 입력 전압이 Max Voltage Limit(60)보다 큼<br />현재 입력 전압이 Over Voltage Limit(61)보다 작음 |
| 512       | [Torque Enable]      | 0 (Torque OFF)                                      | 에러가 발생하여 장치의 토크를 차단                                                         |
| 154 ~ 169 | Error Code History   | Error Code                                          | Error Code History에 현재 발생한 Error Code가 추가됨                                      |

[Controller State]: #controller-state152
[Error Code]: #error-code153
[Torque Enable]: #torque-enable512