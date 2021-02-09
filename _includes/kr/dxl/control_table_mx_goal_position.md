
Goal Position(30)을 통해 목표위치를 설정할 수 있습니다.  
이동 시키고자 하는 목표지점의 위치 값입니다.  
0 ~ 4,095 (0xFFF)까지 사용 가능하며 단위는 0.088 [&deg;] 입니다.   
[CW/CCW Angle Limit(6, 8)](#cwccw-angle-limit6-8)의 범위를 벗어난 목표위치를 지령을 할 경우, Status Packet은 ERROR 필드를 통해서 Angle Limit Error Bit (0x01)를 전송합니다. [Alarm LED/Shutdown](#alarm-led17-shutdown18)의 설정 중에서 Angle Limit Error Bit(0x01)가 설정되어 있다면 Alarm LED가 점멸하고, 모터 출력은 0 [%]로 변경됩니다.

![](/assets/images/dxl/mx/mx_position.png)

> 위 그림은 장치를 정면에서 보았을 때의 그림입니다.

다중 회전 모드일 때 값의 범위는 -28,672 ~ 28,672로 늘어나게 되며 0에서부터 CW, CCW 각 방향으로 7바퀴씩 회전 할 수 있습니다.  
만약 Resolution Divider와 같이 사용한다면 회전 횟수를 더 증가 시킬 수 있습니다.

**참고** : 휠 모드로 동작시에는 Goal Position값이 사용되지 않습니다.
{: .notice}
