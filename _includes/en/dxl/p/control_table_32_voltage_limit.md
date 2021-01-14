These values are maximum and minimum operating voltages.  
When the [Present Input Voltage(592)] exceeds the range of Max Voltage Limit(32) and Min Voltage Limit(34), Input Voltage Error Bit(0x01) is set in the [Hardware Error Status(518)] and Alert Bit(0x80) is set in the Error field of the Status Packet.  
If Input Voltage Error Bit(0x10) is configured in the Shutdown(63), [Torque Enable(512)] will be set to ‘0’ (Torque OFF). For more details, please refer to the [Shutdown(63)] section.

{% if page.ref == 'm42-10-s260-ra' or page.ref == 'rh_p12_rna' %}
|     Unit      | Value Range |
|:-------------:|:-----------:|
| about 0.1 [V] |  150 ~ 300  |
{% else %}
|     Unit      | Value Range |
|:-------------:|:-----------:|
| about 0.1 [V] |  150 ~ 350  | 
{% endif %}
