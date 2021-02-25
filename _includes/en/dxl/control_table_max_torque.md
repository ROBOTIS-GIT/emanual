{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign torque_limit = "Torque Limit(34)" %}
{% assign max_torque = "Max Torque(14)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign torque_limit = "Torque Limit(35)" %}
{% assign max_torque = "Max Torque(15)" %}

{% else %}

{% assign torque_limit = "Torque Limit(34)" %}
{% assign max_torque = "Max Torque(14)" %}

{% endif %}

It is the torque value of maximum output. 0 to 1,023 (0x3FF) can be used, and the unit is about 0.1%.  
For example, Data 1,023 (0x3FF) means that DYNAMIXEL will use 100% of the maximum torque it can produce while Data 512 (0x200) means that DYNAMIXEL will use 50% of the maximum torque.  
When the power is turned on, [{{ torque_limit }}](#torque-limit) is reset to the value of {{ max_torque }}.
