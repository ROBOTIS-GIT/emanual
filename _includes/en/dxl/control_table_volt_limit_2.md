
These values are maximum and minimum operating voltages.
When present input voltage acquired from Present Input Voltage(144) exceeds the range of Max Voltage Limit(32) and Min Voltage Limit(34), Input Voltage Error Bit(0x01) in the Hardware Error Status(70) are set.  
If Input Voltage Error Bit(0x10) is configured in the [Shutdown(63)], [Torque Enable(64)] is cleared to ‘0’ and Torque is disabled.  
For more details, please refer to the [Shutdown(63)] section.

{% if page.product_group=='dxl_xl430' %}
|     Unit      | Value Range |  Description   |
|:-------------:|:-----------:|:--------------:|
| About 0.1 [V] |  65 ~ 140   | 6.5 ~ 14.0 [V] |
{% else %}
|     Unit      | Value Range |  Description   |
|:-------------:|:-----------:|:--------------:|
| About 0.1 [V] |  95 ~ 160   | 9.5 ~ 16.0 [V] |
{% endif %}
