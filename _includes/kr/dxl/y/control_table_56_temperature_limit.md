인버터와 모터의 동작 온도의 상한 값입니다.  
현재 내부온도를 나타내는 [Present Inverter Temperature(570)]나 [Present Motor Temperature(571)]의 값이 각각 Inverter Temperature Limit(56), Motor Temperature Limit(57)보다 높아지면 Error가 발생되어 아래 표와 같이 컨트롤테이블의 값이 변경되고 장치가 정지합니다.  
Error가 발생한 후에는 Status Packet은 Error 필드를 통해서 Alert Bit(0x80)을 전송합니다.


| 주소      | 명칭                | 변경 값                                             | 설명                                                                                       |
|:---------:|:------------------:|:----------------------------------------------------|:------------------------------------------------------------------------------------------|
| 152       | [Controller State]   | 9 (Hardware Fault)                                  | 내부 제어기가 Hardware Fault 상태로 변경됨                                                  |
| 153       | [Error Code]         | 3 (Inverter Overheating)<br />4 (Motor Overheating) | 인버터의 온도가 Inverter Temperature Limit(56) 보다 높음<br />모터의 온도가 Motor Temperature Limit(57) 보다 높음 |
| 512       | [Torque Enable]      | 0 (Torque OFF)                                      | 에러가 발생하여 장치의 토크를 차단                                                         |
| 154 ~ 169 | Error Code History | Error Code                                          | Error Code History에 현재 발생한 Error Code가 추가됨                                        |

[Controller State]: #controller-state152
[Error Code]: #error-code153
[Torque Enable]: #torque-enable512