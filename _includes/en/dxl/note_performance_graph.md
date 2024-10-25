{% capture perform_graph_01 %}
**NOTE** : The given Stall torque rating for a servo is different from it's continuous output rating, and may also differ from it's expected real world performance.

Stall torque is the maximum momentary torque output the servo is capable of, an is generally how RC servos are measured. The Performance graph, or N-T curve, from the above graph is measured under conditions simulating a gradually increasing load.

Generally, the Maximum Torque shown through Performance Graph testing is less than the maximum Stall Torque.

The actual real world performance of the servo will generally be closer to the performance graph measurements, not the rated stall torque.

{% endcapture %}

<div class="notice">{{ perform_graph_01 | markdownify }}</div>

{% capture caution_power %}
**CAUTION - When supplying power:**
{% unless page.product_group == 'dxl_p' or page.product_group == 'dxl_pro' or page.product_group == 'dxl_pro_a' or page.ref == 'xh430-v210'or page.ref == 'xh430-v350'or page.ref == 'xh540-v150' or page.ref == 'xh540-v270' or page.product_group == 'dxl_y_m' or page.product_group == 'dxl_y_b' or page.product_group == 'dxl_y_r' or page.product_group == 'dxl_y_a' or page.ref == 'xw540-h260' %}
- It is recommended to use a ROBOTIS controller or SMPS2DYNAMIXEL power adapter.
{% endunless %}
- Do not connect or disconnect DYNAMIXEL actuator cables while power is being supplied.
{% if page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' or page.ref=='xh430-v210' or page.ref=='xh430-v350'or page.ref=='xh540-v150' or page.ref=='xh540-v270' or page.ref == 'xw540-h260' %}
- For DYNAMIXEL PRO and DYNAMIXEL-P series servos, supply additional power through the 24V accessory power port.
{% else %}
{% endif %}

{% endcapture %}

<div class="notice--warning">{{ caution_power | markdownify }}</div>
