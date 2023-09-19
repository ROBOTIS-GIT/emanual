
{% if page.product_group == 'dxl_p' %}

Select the active communications protocol for your DYNAMIXEL actuator.
In order to use Modbus-RTU you must update to firmware version V11 or higher.

{% elsif page.product_group == 'rh_p12_rna' %}

Select the active communications protocol for your DYNAMIXEL actuator.
In order to use Modbus-RTU on your RH-P12-RN(A) servo you must update to firmware version V12 or higher.

{% endif %}

| Value | Description                                                                                                |
|:-----:|:-----------------------------------------------------------------------------------------------------------|
|   2   | [DYNAMIXEL Protocol 2.0]                                                                                   |
|  10   | [Modbus-RTU, Industrial Standard Protocol]{: .blank}<br>![](/assets/images/dxl/p/protocol_mode_modbus.png) |

[DYNAMIXEL Protocol 2.0]: /docs/en/dxl/protocol2/
[Modbus-RTU, Industrial Standard Protocol]: http://modbus.org/docs/PI_MBUS_300.pdf

**WARNING**: [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/) is required to change the communications protocol of your DYNAMIXEL servo, as R+ Manager 2.0 does not support Modbus-RTU communication.
{: .notice--warning}

{% capture warn01 %}
**WARNING** : The following Control Table items are not supported by Modbus-RTU communications.
[Return Delay Time(9)](#return-delay-time9)  
[Secondary ID(12)](#secondary-id12)  
[Status Return Level(516)](#status-return-level516)  
[Registered Instruction(517)](#registered-instruction517)  
[Indirect Address](#indirect-address)  
[Indirect Data](#indirect-data)
{% endcapture %}

<div class="notice--warning">{{ warn01 | markdownify }}</div>
