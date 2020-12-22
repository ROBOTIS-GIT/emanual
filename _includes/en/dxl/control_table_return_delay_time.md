{% if page.product_group=='dxl_mx2' or page.product_group=='xl330' or page.product_group=='dxl_x430' or page.product_group=='dxl_xl430' or page.product_group=='dxl_xw540' or page.product_group=='dxl_x540' or page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' or page.product_group=='rh_p12_rn' or page.product_group=='rh_p12_rna' %}
{% assign return_delay = "9" %}
{% else %}
{% assign return_delay = "5" %}
{% endif %}

If the DYNAMIXEL receives an Instruction Packet, it will return the Status Packet after the time of the set Return Delay Time({{ return_delay }}).  
Note that the range of values is 0 to 254 (0XFE) and its unit is 2 [μsec]. For instance, if the Return Delay Time({{ return_delay }}) is set to ‘10’, the Status Packet will be returned after 20[μsec] when the Instruction Packet is received.

|  Unit   | Value Range | Description                                                    |
|:-------:|:-----------:|:---------------------------------------------------------------|
| 2[μsec] |   0 ~ 254   | Default value ‘250’(500[μsec]) <br> Maximum value: '508'[μsec] |
