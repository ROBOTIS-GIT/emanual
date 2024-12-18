The Min Voltage Limit(32) and Max Voltage Limit(34) are used to configure the range of acceptable input voltages.
When the [Present Input Voltage(144)] exits the range between Max Voltage Limit(32) and Min Voltage Limit(34), the Input Voltage error Bit(0x10) in the [Hardware Error Status(70)](#hardware-error-status70) will be set, and the returned Status Packet will contain an Alert Bit(0x80) in the Error field.  
If the Input Voltage Error Bit(0x10) in the [Shutdown(63)] register is set, [Torque Enable(64)] will be set to ‘0’(Torque OFF).  
For more details, please refer to [Shutdown(63)].

{% if page.product_group=='dxl_xl430' %}
|     Unit      | Value Range |  Description   |
|:-------------:|:-----------:|:--------------:|
| About 0.1 [V] |  65 ~ 140   | 6.5 ~ 14.0 [V] |

{% elsif page.product_group=='xl330' or page.ref == 'xc330-m181' or page.ref == 'xc330-m288' %}

|     Unit      | Value Range |  Description  |
|:-------------:|:-----------:|:-------------:|
| About 0.1 [V] |   31 ~ 70   | 3.1 ~ 7.0 [V] |

{% elsif page.ref == 'xc330-t181' or page.ref == 'xc330-t288' %}

|     Unit      | Value Range |  Description   |
|:-------------:|:-----------:|:--------------:|
| About 0.1 [V] |   55 ~ 140   | 5.5 ~ 14.0 [V] |

{% else %}
|     Unit      | Value Range |  Description   |
|:-------------:|:-----------:|:--------------:|
| About 0.1 [V] |  95 ~ 160   | 9.5 ~ 16.0 [V] |
{% endif %}
