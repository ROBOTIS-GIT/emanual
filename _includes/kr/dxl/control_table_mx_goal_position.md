
이동 시키고자 하는 목표지점의 위치 값입니다.  
0 ~ 4,095 (0xFFF)까지 사용 가능하며 단위는 0.088&deg; 입니다.  
CW/CCW Angle Limit의 벗어난 값을 사용하게 되면 Status Packet 중 ERROR의 Angle Limit Error Bit (Bit1) 가 ‘1’로 설정되어 반환되고, Alram LED/Shutdown의 플래그(flag)중 Angle Limit Error가 설정되어 있다면 기능이 발휘됩니다.

![](/assets/images/dxl/mx/mx_position.png)

> 위 그림은 다이나믹셀을 정면에서 보았을 때의 그림입니다.

다중 회전 모드일 때 값의 범위는 -28,672 ~ 28,672로 늘어나게 되며 0에서부터 CW, CCW 각 방향으로 7바퀴씩 회전 할 수 있습니다.  
만약 Resolution Divider와 같이 사용한다면 회전 횟수를 더 증가 시킬 수 있습니다.

`Note` 휠 모드로 동작시에는 Goal Position값이 사용되지 않습니다.
{: .notice}
