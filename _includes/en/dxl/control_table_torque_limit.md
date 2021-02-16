{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign shutdown = "Alarm LED(17)/Shutdown(18)" %}
{% assign torque_limit = "Torque Limit(34)" %}
{% assign max_torque = "Max Torque(14)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign shutdown = "Shutdown(18)" %}
{% assign torque_limit = "Torque Limit(35)" %}
{% assign max_torque = "Max Torque(15)" %}

{% else %}

{% assign shutdown = "Alarm LED(17)/Shutdown(18)" %} 
{% assign torque_limit = "Torque Limit(34)" %}
{% assign max_torque = "Max Torque(14)" %}

{% endif %}

It is the value of the maximum torque limit.  
0 ~ 1,023(0x3FF) is available, and the unit is about 0.1%.  
For example, if the value is 512, it is about 50%; that means only 50% of the maximum torque will be used.  
When the power is turned on, {{ torque_limit }} is reset to the value of [{{ max_torque }}].  

**NOTE** : If the function of [{{ shutdown }}](#shutdown) is triggered, the motor loses its torque because {{ torque_limit }} becomes 0. Once error conditions are resolved and {{ torque_limit }} is changed to the value other than 0, the motor can be operated again.
{: .notice}
