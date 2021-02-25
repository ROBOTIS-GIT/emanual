{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign shutdown = "Alarm LED(17)/Shutdown(18)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign shutdown = "Shutdown(18)" %}

{% else %}

{% assign shutdown = "Alarm LED(17)/Shutdown(18)" %} 

{% endif %}

Goal Position(30)을 통해 목표위치를 설정할 수 있습니다. 0 ~ 1,023 (0x3FF)까지 사용 가능하며 단위는 0.29 [&deg;] 입니다.  
[CW/CCW Angle Limit(6, 8)](#cwccw-angle-limit6-8)의 범위를 벗어난 목표위치를 지령을 할 경우, Status Packet은 ERROR 필드를 통해서 Angle Limit Error Bit (0x01)를 전송합니다. [{{ shutdown }}](#shutdown)의 설정 중에서 Angle Limit Error Bit(0x01)가 설정되어 있다면 Alarm LED가 점멸하고, 모터 출력은 0 [%]로 변경됩니다.

![](/assets/images/dxl/dx/dx_series_goal_position.png)

> 위 그림은 다이나믹셀을 정면에서 보았을 때의 그림입니다.

**참고** : 바퀴 모드로 설정되어 있는 경우 이 값은 사용되지 않습니다.
{: .notice}
