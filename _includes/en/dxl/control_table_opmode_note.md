
{% capture present_pos_notice_01 %}
**NOTE** : {% if page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Present Position(580)](#present-position) {% elsif page.product_group=='dxl_pro' %} [Present Position(611)](#present-position) {% else %} [Present Position(132)](#present-position) {% endif %} represents a 4 byte continuous range from -2,147,483,648 to 2,147,483,647 when Torque is turned off regardless of Operating Mode(11).  
However, {% if page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Present Position(580)](#present-position) {% elsif page.product_group=='dxl_pro' %} [Present Position(611)](#present-position) {% else %} [Present Position(132)](#present-position) {% endif %} will be reset to an absolute position value within one full rotation in the following cases:
1. When the Operating Mode(11) is changed to **Position Control Mode**.
2. When torque is turned on in **Position Control Mode**.
3. When the actuator is turned on or when rebooted using a [Reboot Instruction](/docs/en/dxl/protocol2/#reboot).

Note that a {% if page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Present Position(580)](#present-position) {% elsif page.product_group=='dxl_pro' %} [Present Position(611)](#present-position) {% else %} [Present Position(132)](#present-position) {% endif %} value that has been reset to the absolute value within a single rotation will still be affected  by the configured{% if page.product_group=='dxl_pro' %} [Homing Offset(13)](#homing-offset) {% else %} [Homing Offset(20)](#homing-offset) {% endif %} value.


{% endcapture %}
<div class="notice">{{ present_pos_notice_01 | markdownify }}</div>
