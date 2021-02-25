{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} 

{% assign shutdown = "Alarm LED(17)/Shutdown(18)" %}

{% elsif page.product_group == 'dxl_xl320' %}

{% assign shutdown = "Shutdown(18)" %}

{% else %}

{% assign shutdown = "Alarm LED(17)/Shutdown(18)" %} 

{% endif %}

The operating temperature's upper bound of the DYNAMIXEL.

For instance, if the value of the Temperature Limit(11) is set as '80', it means 80 &deg;C
If the operating DYNAMIXEL's internal temperature is over the Temperature Limit(11), the Status Packet transmits Overheating Error Bit (Bit2) via the ERROR field. Providing that Overheating flag is set in the [{{ shutdown }}](#shutdown), the Alarm LED will start blinking and the motor's output will be 0 [%].

|     Unit      | Value Range |
|:-------------:|:-----------:|
| About 1&deg;C |   0 ~ 100   |


**CAUTION** : Do not set the temperature higher than the default value. When the temperature alarm shutdown occurs, wait 20 minutes to cool the temperature before re-use. Keep using the product when the temperature is high can cause severe damage.
{: .notice--warning}
