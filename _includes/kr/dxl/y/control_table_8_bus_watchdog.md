Bus Watchdog(8)은 특정할 수 없는 오류에 의해 제어기와 장치의 통신(RS485)이 단절된 경우, 장치를 정지시키기 위한 안전장치(Fail-safe) 입니다.  
Bus Watchdog 기능은 Torque Enable(512)가 ‘1’(Torque ON)인 경우, 제어기와 장치의 통신 간격(시간)을 감시합니다.  
측정된 통신 간격(시간)이 Bus Watchdog(8)의 설정값 보다 클 경우, 장치는 정지합니다.  이때 Bus Watchdog(8)은 ‘-1’(Bus Watchdog Error)로 변경됩니다.  
Bus Watchdog Error 상태가 되면, Goal Value(Goal PWM(524), Goal Current(526), Goal Velocity(528), Goal Position(532))의 Access(접근 속성)은 읽기 전용(Read Only)로 변경됩니다.  
따라서 Goal Value에 새로운 값을 쓸 경우, Status Packet은 Error 필드를 통해서 Data Range Error를 전송합니다.  
Bus Watchdog Error 해제는 Bus Watchdog(8)의 값을 ‘0’으로 변경하거나 Error Clear Packet을 전송하여 가능합니다.

**참고** : Data Range Error에 대한 자세한 사항은 [프로토콜](https://emanual.robotis.com/docs/kr/dxl/protocol2/#status-packet)을 참고해주세요.
{: .notice}

다음은 Bus Watchdog 기능의 동작 예시입니다.

{% capture bus_watchdog_ex1 %}
Operating Mode(33)를 속도 제어 모드로 설정한 후, Torque Enable(512)를 ‘1’로 변경 합니다.  
Goal Velocity(528)에 ‘50’을 쓰면, 장치는 CCW 방향으로 회전합니다.  
Bus Watchdog(546)의 값을 ‘100’(2,000 [ms])으로 변경합니다.(Bus Watchdog 기능 활성화)  
2,000[msec] 동안 Instruction packet이 수신되지 않으면, 장치는 고정된 감속도로 정지합니다.  
Bus Watchdog(8)의 값은 ‘-1’(Bus Watchdog Error)으로 변경됩니다. 이때 Goal Value의 접근속성(Access)은 모두 읽기전용(Read Only)으로 변경됩니다.  
Goal Velocity(528)에 ‘150’을 쓰면, Status Packet을 통해 Data Range Error를 회신합니다.  
Bus Watchdog(8)의 값을 ‘0’으로 변경하거나 Error Clear Packet을 전송하면, Bus Watchdog Error가 해제됩니다.  
Goal Velocity(528)에 ‘150’을 쓰면, 장치는 CCW 방향으로 회전합니다.
{% endcapture %}

<div class="notice--success">{{ bus_watchdog_ex1 | markdownify }}</div>