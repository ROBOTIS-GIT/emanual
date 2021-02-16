{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign present_position = "Present Position(36)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign present_position = "Present Position(37)" %}

{% else %}

{% assign present_position = "Present Position(36)" %} 

{% endif %}

It is the present position value of DYNAMIXEL.
The range of {{ present_position }} is 0 ~ 1,023 (0x3FF), and the unit is 0.29 [&deg;].

![](/assets/images/dxl/dx/dx_series_goal_position.png)

> The picture above is the front view of DYNAMIXEL.

**CAUTION** : If it is set to Wheel Mode, the {{ present_position }} cannot be used to measure the moving distance and the rotation frequency.
{: .notice--warning}
