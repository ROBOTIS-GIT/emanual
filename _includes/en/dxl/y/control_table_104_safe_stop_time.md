{% if page.product_group=='dxl_y_m' %}
{% assign torque_enable= "[Torque Enable(512)]" %}
{% endif %}

Safe Stop Time is used to configure the amount of time the actuator will use to decelerate if torque is disabled while the actuator is in motion.
When the value of {{ torque_enable }} is changed from '1' (Torque ON) to '0' (Torque OFF), the servo will stop operation and cut off the signal supplied to the inverter. If the device is in motion, it will decelerate to a stop according to the allotted time duration specified by Safe Stop Time to prevent damage. 

| Unit |   Range      | Initial Value |
|:----:|:------------:|:-------------:|
| [ms] | 0 ~ 32,767   |   200         |


**Note** : In Current Control mode, only Dynamic Brake deceleration is used to stop the actuator.
{: .notice}
