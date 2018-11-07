0점의 위치를 조절 할 수 있습니다. 이 값은 Present Position(580)에 더해지게 됩니다.  
Present Position = 실제 위치 + Homing offset(20) 이 됩니다.

| 단위      | 값의 범위                      |
| :-------: | :----------------------------: |
| 1 [pulse] | -2,147,483,648 ~ 2,147,483,647 |

{% capture homing_offset %}  
**참고** : 위치제어 모드(관절 모드)의 경우, Homing Offset(20)은 (-90 ~ 90 [&deg;]) 범위보다 클 경우 무시됩니다.

![](/assets/images/dxl/pro_plus/h54p_homming.png)
{% endcapture %}
<div class="notice">{{ homing_offset | markdownify }}</div>
