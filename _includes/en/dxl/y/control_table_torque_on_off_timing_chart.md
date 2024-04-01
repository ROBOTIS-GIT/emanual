{% if page.product_group=='dxl_y_m' %}
{% assign safe_stop_time= "[Safe Stop Time(104)]" %}
{% assign overexcitation_time= "[Overexcitation Time(112)]" %}
{% endif %}

Timing Chart for the {{ safe_stop_time }} ~ {{ overexcitation_time }} features.

![](/assets/images/dxl/y/torque_on-off_timing_chart.PNG)

**Note** : When the [Controller State(152)] is Process Torque On(4) or Process Torque Off(6), writing values to [Torque Enable(512)], [Goal PWM(524)], [Goal Current(526)], [Goal Velocity(528)], [Goal Position(532)] will result in a "Result Fail" status packet return.
{: .notice}
