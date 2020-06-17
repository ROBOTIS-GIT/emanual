**NOTE** : The Max Torque and the Stall Torque of Performance Graph are different in measurement methods.
Stall torque is a measured value of the momentary torque that it can reach. This is generally how RC servos are measured.
The Performance graph is also called as N-T curves, which is measured with the gradually increasing load.
The actual motor operation environment is closer to the performance graph, not stall torque method.
For this reason, the performance graph is broadly used in the industrial field.
Generally, Max Torque of the Performance Graph is less than the Stall Torque.
{: .notice}

{% capture caution_power %}
**CAUTION : When supplying power**
- It is recommended using ROBOTIS controller or SMPS2DYNAMIXEL.
- Do not connect or disconnect DYNAMIXEL when power is being supplied.
{% if page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' or page.ref=='xh430-v210' or page.ref=='xh430-v350'or page.ref=='xh540-v150' or page.ref=='xh540-v270' %}
- In case of DYNAMIXEL PRO and DYNAMIXEL-P series, please supply power through 24V power port.
{% else %}
{% endif %}

{% endcapture %}

<div class="notice--warning">{{ caution_power | markdownify }}</div>
