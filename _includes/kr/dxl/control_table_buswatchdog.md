Bus Watchdog(98)은 특정할 수 없는 오류에 의해 제어기와 장치의 통신(RS485, TTL)이 단절된 경우, 장치를 정지시키기 위한 안전장치(Fail-safe) 입니다.  
여기서 통신이란 프로토콜에서 정의된 모든 Instruction Packet을 의미합니다.

|      |    값     | 설명                                                |
|:----:|:---------:|:----------------------------------------------------|
| 단위 | 20 [msec] | -                                                   |
| 범위 |     0     | Bus Watchdog 기능 비활성화, Bus Watchdog Error 해제 |
| 범위 |  1 ~ 127  | Bus Watchdog 활성화                                 |
| 범위 |    -1     | Bus Watchdog Error 상태                             |

Bus Watchdog 기능은 [Torque Enable(64)]가 ‘1’인 경우, 제어기와 장치의 통신 간격(시간)을 감시합니다.  
측정된 통신 간격(시간)이 Bus Watchdog(98) 보다 클 경우, 장치는 정지합니다.  
이때 Bus Watchdog(98)은 ‘-1’(Bus Watchdog Error)로 변경됩니다.  
Bus Watchdog Error 상태가 되면, Goal Value([Goal PWM(100)], {% if page.product_group!='dxl_xl430' %}[Goal Current(102)], {% else %}{% endif %}[Goal Velocity(104)], [Goal Position(116)])의 Access(접근 속성)은 읽기 전용(Read Only)로 변경됩니다.  
따라서 Goal Value에 새로운 값을 쓸 경우, Status packet을 통해 Range Error를 회신합니다.  
Bus Watchdog(98)의 값을 ‘0’으로 변경하면, Bus Watchdog Error는 해제됩니다.

**참고** : Range Error에 대한 자세한 사항은 [프로토콜 2.0]을 참고하세요.
{: .notice}

#### [Bus Watchdog(98) 동작 예시](#bus-watchdog98-동작-예시)

다음은 Bus Watchdog 기능의 동작 예시입니다.

1. [Operating Mode(11)]를 속도 제어 모드로 설정한 후, [Torque Enable(64)]를 ‘1’로 변경 합니다.
2. [Goal Velocity(104)]에 ‘50’을 쓰면, 장치는 CCW 방향으로 회전합니다.
3. [Bus Watchdog(98)]의 값을 ‘100’(2,000 [msec])으로 변경합니다.(Bus Watchdog 기능 활성화)
4. 2,000 [msec] 동안 Instruction packet이 수신되지 않으면, 장치는 정지합니다. 정지할 때 [Profile Acceleration(108)]과 [Profile Velocity(112)]는 ‘0’으로 적용됩니다.
5. [Bus Watchdog(98)]의 값은 ‘-1’(Bus Watchdog Error)으로 변경됩니다. 이때 Goal Value의 접근속성(Access)은 모두 읽기전용(Read Only)으로 변경됩니다.
6. [Goal Velocity(104)]에 ‘150’을 쓰면, Status Packet을 통해 Range Error가 회신합니다.
7. [Bus Watchdog(98)]의 값을 ‘0’으로 변경하면, Bus Watchdog Error가 해제됩니다.
8. [Goal Velocity(104)]에 ‘150’을 쓰면, 장치는 CCW 방향으로 회전합니다.
