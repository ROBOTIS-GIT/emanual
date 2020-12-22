The Min Voltage Limit(32) and Max Voltage Limit(34) determine the maximum and minimum operating voltages.  
When the [Present Input Voltage(144)] indicating the present input voltage to the device exceeds the range of Max Voltage Limit(32) and Min Voltage Limit(34), the Input Voltage error Bit(0x10) in the [Hardware Error Status(70)](#hardware-error-status70) will be set, and the Status Packet will send Alert Bit(0x80) via the Error field.  
If Input Voltage Error Bit(0x10) in the [Shutdown(63)] is set, [Torque Enable(64)] will be set to ‘0’(Torque OFF).  
For more details, please refer to the [Shutdown(63)] section.

{% if page.product_group=='dxl_xl430' %}
|     Unit      | Value Range |  Description   |
|:-------------:|:-----------:|:--------------:|
| About 0.1 [V] |  65 ~ 140   | 6.5 ~ 14.0 [V] |

{% elsif page.product_group=='xl330' %}

|     Unit      | Value Range |  Description  |
|:-------------:|:-----------:|:-------------:|
| About 0.1 [V] |   31 ~ 70   | 3.1 ~ 7.0 [V] |

{% else %}
|     Unit      | Value Range |  Description   |
|:-------------:|:-----------:|:--------------:|
| About 0.1 [V] |  95 ~ 160   | 9.5 ~ 16.0 [V] |
{% endif %}
