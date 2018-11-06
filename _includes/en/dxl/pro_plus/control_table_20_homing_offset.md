Users can adjust the Home position by setting Home Offset(20). The Homing Offset value is added to the Present Position(580).  
Present Position(580) = Actual Position + Homing Offset(20).

|   Unit    |          Value Range           |
|:---------:|:------------------------------:|
| 1 [pulse] | -2,147,483,648 ~ 2,147,483,647 |

{% capture homing_offset %}  
**NOTE** : Homing Offset(20) value that exceeds the range of (-90 ~ 90 [&deg;]) will be ignored in Position Control Mode(Joint Mode).

![](/assets/images/dxl/pro/pro_54_homming.png)
{% endcapture %}
<div class="notice">{{ homing_offset | markdownify }}</div>
