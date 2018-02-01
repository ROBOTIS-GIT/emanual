이동 시키고자 하는 곳의 위치 값입니다. 0 ~ 1,023 (0x3FF)까지 사용 가능하며 단위는 0.29&deg; 입니다.  
CW/CCW Angle Limit의 벗어난 값을 사용하게 되면 Status Packet 중 ERROR의 Angle Limit Error Bit(Bit1)가 '1'로 설정되어 반환되고, Alarm LED/Shutdown의 플래그(flag)중 Angle Limit Error가 설정되어 있다면 기능이 발휘됩니다.

![](/assets/images/dxl/dx/dx_series_goal_position.png)

> 위 그림은 해당 모델의 전면이 기준입니다.

`참고` 바퀴 모드로 설정되어 있는 경우 이 값은 사용되지 않습니다.
{: .notice}
