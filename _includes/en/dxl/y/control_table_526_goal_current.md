{% if page.product_group=='dxl_y_m' %}
{% assign current_limit= "[Current Limit(66)]" %}
{% endif %}
In current control mode, the Goal Current is used to specify the desired output current. In velocity control mode, position control mode, and extended position control mode it functions as a limit on the current controller's output current. Goal Current cannot exceed the configured {{ current_limit }}.

| Unit       | Range                                      |  Control Mode                                           |               Description                  |
|:----------:|:------------------------------------------:| :-------------------------------------------------------|:-------------------------------------------|
| 0.01 [A]   | - Current Limit(66) ~ Current Limit(66)    | Current control<br />Velocity control, Position control |  800 = 8[A] Current output<br />500 = Maximum output current limited to 5[A] |

**Note** : If a current exceeding the device's rated current is continuously applied to the motor, an Overload Error will occur. Please only use currents exceeding the rating momentarily.
{: .notice}
