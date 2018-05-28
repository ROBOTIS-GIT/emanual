Bus Watchdog(546)은 특정할 수 없는 오류에 의해 제어기와 다이나믹셀의 통신(RS485)이 단절된 경우, 다이나믹셀을 정지시키기 위한 안전장치(Fail-safe) 입니다.  
여기서 통신이란 다이나믹셀 프로토콜에서 정의된 모든 Instruction Packet을 의미합니다.

|       | 값       | 설명 |
| :---: | :---:    | :------------- |
| 단위 | 20 [msec] | - |
| 범위 | 0         | Bus Watchdog 기능 비활성화, Bus Watchdog Error 해제 |
| 범위 | 1 ~ 127   | Bus Watchdog 활성화 |
| 범위 | -1        | Bus Watchdog Error 상태 |

Bus Watchdog 기능은 Torque Enable(512)가 ‘1’인 경우, 제어기와 다이나믹셀의 통신 간격(시간)을 감시합니다.  
측정된 통신 간격(시간)이 Bus Watchdog(546) 보다 클 경우, 다이나믹셀은 정지합니다.  
이때 Bus Watchdog(546)은 ‘-1’(Bus Watchdog Error)로 변경됩니다.  
Bus Watchdog Error 상태가 되면, Goal Value(Goal PWM(548), Goal Current(550), Goal Velocity(552), Goal Position(564))의 Access(접근 속성)은 읽기 전용(Read Only)로 변경됩니다.  
따라서 Goal Value에 새로운 값을 쓸 경우, Status packet을 통해 Range Error를 회신합니다.  
Bus Wathdog(546)의 값을 ‘0’으로 변경하면, Bus Watchdog Error는 해제됩니다.

`참고` Range Error에 대한 자세한 사항은 [프로토콜]을 참고해주세요.
{: .notice}

[프로토콜]: /docs/kr/dxl/protocol2/#status-packet

다음은 Bus Watchdog 기능의 동작 예시입니다.
1. Operating Mode(11)를 속도 제어 모드로 설정한 후, Torque Enable(512)를 ‘1’로 변경 합니다.
2. Goal Velocity(552)에 ‘50’을 쓰면, 다이나믹셀은 CCW 방향으로 회전합니다.
3. Bus Watchdog(546)의 값을 ‘100’(2,000 [ms])으로 변경합니다.(Bus Watchdog 기능 활성화)
4. 2,000[msec] 동안 Instruction packet이 수신되지 않으면, 다이나믹셀은 정지합니다. 정지할 때 Profile Acceleration(556)과 Profile Velocity(560)는 ‘0’으로 적용됩니다.
5. Bus Watchdog(546)의 값은 ‘-1’(Bus Watchdog Error)으로 변경됩니다. 이때 Goal Value의 접근속성(Access)은 모두 읽기전용(Read Only)으로 변경됩니다.
6. Goal Velocity(552)에 ‘150’을 쓰면, Status Packet을 통해 Range Error가 회신합니다.
7. Bus Watchdog(546)의 값을 ‘0’으로 변경하면, Bus Watchdog Error가 해제됩니다.
8. Goal Velocity(552)에 ‘150’을 쓰면, 다이나믹셀은 CCW 방향으로 회전합니다.
