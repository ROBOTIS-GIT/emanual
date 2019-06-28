This address can switch between DYNAMIXEL Protocol and Modbus-RTU Protocol.  

| Value |  Protocol   | Description                                                                                           |
|:-----:|:-----------:|:------------------------------------------------------------------------------------------------------|
|   2   |     2.0     | [DYNAMIXEL Protocol 2.0]                                                                              |
|  10   | Modebus-RTU | [Industrial Standard Protocol]{: .blank}<br>![](/assets/images/dxl/pro_plus/protocol_mode_modbus.png) |

[DYNAMIXEL Protocol 2.0]: /docs/en/dxl/protocol2/
[Industrial Standard Protocol]: http://modbus.org/docs/PI_MBUS_300.pdf

**WARNING** : In order to change the Protocol Type of PRO+, please use [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/) as R+ Manager 2.0 does not support Modbus
{: .notice--warning}

{% capture warn01 %} 
**WARNING** : Modebus-RTU dose not support the next data below.    
[Return Delay Time(9)](#return-delay-time9)  
[Secondary ID(12)](#secondary-id12)  
[Status Return Level(516)](#status-return-level516)  
[Registered Instruction(517)](#registered-instruction517)  
{% endcapture %}
<div class="notice--warning">{{ warn01 | markdownify }}</div>
