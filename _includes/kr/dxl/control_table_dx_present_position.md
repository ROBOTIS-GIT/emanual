{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign present_position = "Present Position(36)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign present_position = "Present Position(37)" %}

{% else %}

{% assign present_position = "Present Position(36)" %} 

{% endif %}

장치의 현재 위치 값입니다. {{ present_position }} 값의 범위는 0 ~ 1,023(0x3FF)이며 단위는 0.29 [&deg;] 입니다.

![](/assets/images/dxl/dx/dx_series_goal_position.png)

> 위 그림은 해당 모델의 전면이 기준입니다.

**주의** : 바퀴 모드로 설정되어 있는 경우 {{ present_position }}을 회전량 또는 움직인 거리를 측정하는 용도로 사용할 수 없습니다.
{: .notice--warning}
