{% if page.product_group=='dxl_mx2' or page.product_group=='xl330' or page.product_group=='dxl_x430' or page.product_group=='dxl_xl430' or page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430' or page.product_group=='dxl_x540' or page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' or page.product_group=='rh_p12_rn' or page.product_group=='rh_p12_rna' %}
{% assign return_delay = "9" %}
{% else %}
{% assign return_delay = "5" %}
{% endif %}

When a DYNAMIXEL receives an Instruction Packet, it will return a Status Packet response after the configured Return Delay Time({{ return_delay }}) has passed.    The range of configurable values for this setting is 0 to 254 (0XFE) in units of 2 [μsec]. For instance, if the Return Delay Time({{ return_delay }}) is set to ‘10’, a Status Packet will be returned 20[μsec] after an Instruction Packet is received.

|  Unit   | Value Range | Description                                                    |
|:-------:|:-----------:|:---------------------------------------------------------------|
| 2[μsec] |   0 ~ 254   | Default value ‘250’(500[μsec]) <br> Maximum value: '508'[μsec] |
