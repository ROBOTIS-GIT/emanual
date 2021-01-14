
{% if page.product_group == 'dxl_p' %}

This address can switch between DYNAMIXEL Protocol 2.0 and Modbus-RTU Protocol.  
In order to use Modbus-RTU with DYNAMIXEL-P, please update the firmware to V11 or above.

{% elsif page.product_group == 'rh_p12_rna' %}

This address can switch between RH-P12-RN(A) and Modbus-RTU Protocol.  
In order to use Modbus-RTU with RH-P12-RN(A), please update the firmware to V12 or above.

{% endif %}

| Value | Description                                                                                                |
|:-----:|:-----------------------------------------------------------------------------------------------------------|
|   2   | [DYNAMIXEL Protocol 2.0]                                                                                   |
|  10   | [Modbus-RTU, Industrial Standard Protocol]{: .blank}<br>![](/assets/images/dxl/p/protocol_mode_modbus.png) |

[DYNAMIXEL Protocol 2.0]: /docs/en/dxl/protocol2/
[Modbus-RTU, Industrial Standard Protocol]: http://modbus.org/docs/PI_MBUS_300.pdf

**WARNING** : In order to change the Protocol Type(13) of DYNAMIXEL-P series, use [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/) as R+ Manager 2.0 does not support Modbus-RTU.
{: .notice--warning}

{% capture warn01 %}
**WARNING** : The following data of the Control Table will not be used for Modbus-RTU.  
[Return Delay Time(9)](#return-delay-time9)  
[Secondary ID(12)](#secondary-id12)  
[Status Return Level(516)](#status-return-level516)  
[Registered Instruction(517)](#registered-instruction517)  
[Indirect Address](#indirect-address)  
[Indirect Data](#indirect-data)
{% endcapture %}
<div class="notice--warning">{{ warn01 | markdownify }}</div>
