회전 방향을 설정할 수 있습니다. 

|     값      |         동작모드         | 설명                                                                                                                                                                              |
|:-----------:|:------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Bit 7(0x80) |            -             | 미사용, 항상 '0' ‘0’                                                                                                                                                              |
| Bit 6(0x40) |     Dynamic Brake ON     | **[0]** Dynamic Brake OFF: Torque OFF 상태에서 Dynamic Brake 비활성화 <br />**[1]** Dynamic Brake ON: Torque OFF 상태에서 Dynamic Brake 활성화                                     |
| Bit 5(0x20) |            -             | 미사용, 항상 '0' ‘0’                                                                                                                                                              |
| Bit 4(0x10) |            -             | 미사용, 항상 '0' ‘0’                                                                                                                                                              |
| Bit 3(0x08) |            -             | 미사용, 항상 '0' ‘0’                                                                                                                                                              |
| Bit 2(0x04) |  Profile Configuration   | **[0]** Velocity-based Profile: 속도를 기준으로 Profile 생성<br />**[1]** Time-based Profile: 시간을 기준으로 Profile 생성<br />※ 자세한 사항은 [Profile](#profile)를 참고하세요. |
| Bit 1(0x02) |            -             | 미사용, 항상 '0' ‘0’                                                                                                                                                              |
| Bit 0(0x01) |   Normal/Reverse Mode    | **[0]** Normal Mode: 반시계방향(CCW)이 양수값, 시계방향(CW)이 음수값<br />**[1]** Reverse Mode: 시계방향(CW)이 양수값, 반시계방향(CCW)이 음수값                                   |
