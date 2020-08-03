
{% capture present_pos_notice_01 %}
**NOTE** : {% if page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Present Position(580)](#present-position) {% elsif page.product_group=='dxl_pro' %} [Present Position(611)](#present-position) {% else %} [Present Position(132)](#present-position) {% endif %} represents 4 byte continuous range from -2,147,483,648 to 2,147,483,647 when Torque is turned off regardless of [Operating Mode(11)](#operating-mode11).  
However, {% if page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Present Position(580)](#present-position) {% elsif page.product_group=='dxl_pro' %} [Present Position(611)](#present-position) {% else %} [Present Position(132)](#present-position) {% endif %} will be reset to an absolute position value of one full rotation in following cases:
1. When [Operating Mode(11)](#operating-mode11) is changed to Position Control Mode, {% if page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Present Position(580)](#present-position) {% elsif page.product_group=='dxl_pro' %} [Present Position(611)](#present-position) {% else %} [Present Position(132)](#present-position) {% endif %} will be reset to an absolute position value of a full rotation.
2. When torque is turned on in Position Control Mode, {% if page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Present Position(580)](#present-position) {% elsif page.product_group=='dxl_pro' %} [Present Position(611)](#present-position) {% else %} [Present Position(132)](#present-position) {% endif %} will be reset to an absolute position value of one full rotation.
3. Turning off the power supply.

Notice that {% if page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Present Position(580)](#present-position) {% elsif page.product_group=='dxl_pro' %} [Present Position(611)](#present-position) {% else %} [Present Position(132)](#present-position) {% endif %} value can be affected by {% if page.product_group=='dxl_pro' %} [Homing Offset(13)](#homing-offset) {% else %} [Homing Offset(20)](#homing-offset) {% endif %}.
{% endcapture %}
<div class="notice">{{ present_pos_notice_01 | markdownify }}</div>
