Modbus Protocol FW에서 Factory Reset, Reboot, Clear를 요청하는 항목입니다. Standard FW에서는 동작하지 않습니다. 각 항목별 값의 범위와 설명은 다음과 같습니다.

| 모드버스 주소  |           명칭            | 값 범위, 설명                                                                                                           |
| :-----------: | :-----------------------: | :-------------------------------------------------------------------------------------------------------------------- |
|     41001     | Factory Reset Instruction | 0x00FF (255): 모든 값 초기화<br>0x0001 (1): ID를 제외한 모든 값 초기화<br>0x0002 (2): ID와 통신속도를 제외한 모든 값 초기화 |
|     41002     |    Reboot Instruction     | 값에 상관 없이 Write하면 재부팅                                                                                         |
|     41003     |    Clear Instruction      | 0x0100 (256): MT초기화<br>0x0200 (512): Error Clear                                                                    |