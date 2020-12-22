The DYNAMIXEL can protect itself by detecting dangerous situations that could occur during the operation.  
Each Bit is inclusively processed with the ‘OR’ logic, therefore, multiple options can be generated.  
For instance, when ‘0x05’ (binary : 00000101) is defined in {% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} [Shutdown(18)], {% elsif page.product_group=='dxl_pro' %} [Shutdown(48)], {% else %} [Shutdown(63)], {% endif %} DYNAMIXEL can detect both Input Voltage Error(binary : 00000001) and Overheating Error(binary : 00000100).  
If those errors are detected, {% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} [Torque Enable(24)] {% elsif page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Torque Enable(512)] {% elsif page.product_group=='dxl_pro' %} [Torque Enable(562)] {% else %} [Torque Enable(64)] {% endif %} is cleared to ‘0’ and the motor output becomes 0 [%].  
REBOOT is the only method to reset {% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %} [Torque Enable(24)] {% elsif page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Torque Enable(512)] {% elsif page.product_group=='dxl_pro' %} [Torque Enable(562)] {% else %} [Torque Enable(64)] {% endif %} to ‘1’(Torque ON) after the shutdown.  
{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %}{% else %} Check [Alert Bit(0x80)] in a error field of Status Packet or a present status via {% if page.product_group=='dxl_pro' %} [Hardware Error Status(892)] {% elsif page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %} [Hardware Error Status(518)] {% else %} [Hardware Error Status(70)] {% endif %} {% endif %}. The followings are detectable situations. 

{% if page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %}
|  Bit  |        Item         | Description                                                                                                             |
|:-----:|:-------------------:|:------------------------------------------------------------------------------------------------------------------------|
| Bit 7 |          0          | -                                                                                                                       |
| Bit 6 |  Instruction Error  | Detects that undefined Instruction is transmitted or the Action command is delivered without the reg_write command      |
| Bit 5 |   Overload Error    | Detects that persistent load exceeds maximum output                                          |
| Bit 4 |   CheckSum Error    | Detects that the Checksum of the transmitted Instruction Packet is invalid                                              |
| Bit 3 |     Range Error     | Detects that the command is given beyond the range of usage                                                             |
| Bit 2 |  OverHeating Error  | Detects that the internal temperature exceeds the set temperature                                                       |
| Bit 1 |  Angle Limit Error  | Detects that Goal Position is written with the value that is not between CW Angle Limit and CCW Angle Limit             |
| Bit 0 | Input Voltage Error | Detects that input voltage exceeds the configured operating voltage                      |
{% elsif page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %}
|  Bit  |               Item               | Description                                                                     |
|:-----:|:--------------------------------:|:--------------------------------------------------------------------------------|
| Bit 7 |                -                 | Not used, always '0'                                                            |
| Bit 6 |                -                 | Not used, always '0'                                                            |
| Bit 5 |     Overload Error(Default)      | Detects that persistent load exceeds maximum output                              |
| Bit 4 | Electrical Shock Error(Default)  | Detects electric shock on the circuit or insufficient power to operate the motor |
| Bit 3 |   Motor Encoder Error(Default)   | Detects malfunction of the motor encoder                                         |
| Bit 2 |        OverHeating Error         | Detects that internal temperature exceeds the configured operating temperature        |
| Bit 1 | Motor Hall Sensor Error(Default) | Detects that Motor hall sensor value exceeds normal range                                    |
| Bit 0 |       Input Voltage Error        | Detects that input voltage exceeds the configured operating voltage                   |
{% else %}
|  Bit  |                                                           Item                                                            | Description                                                                     |
|:-----:|:-------------------------------------------------------------------------------------------------------------------------:|:--------------------------------------------------------------------------------|
| Bit 7 |                                                             -                                                             | Unused, Always '0'                                                              |
| Bit 6 |                                                             -                                                             | Unused, Always '0'                                                              |
| Bit 5 |                                                  Overload Error(default)                                                  | Detects that persistent load that exceeds maximum output                              |
| Bit 4 |                                              Electrical Shock Error(default)                                              | Detects electric shock on the circuit or insufficient power to operate the motor |
| Bit 3 |                                                    Motor Encoder Error                                                    | Detects malfunction of the motor encoder                                         |
| Bit 2 |                                                OverHeating Error(default)                                                 | Detects that internal temperature exceeds the configured operating temperature        |
| Bit 1 |                                                             -                                                             | Unused, Always '0'                                                              |{% if page.product_group=='xl330' %}
| Bit 0 |                                                Input Voltage Error (default)                                              | Detects that input voltage exceeds the configured operating voltage                   |{% else %} 
| Bit 0 |                                                   Input Voltage Error                                                     | Detects that input voltage exceeds the configured operating voltage                   |{% endif %}
 
{% endif %}
 
{% if page.product_group=='dxl_xw540' %}
{% capture shutdown_01 %}
**NOTE** : If Shutdown occurs, **reboot the device**.
- H/W REBOOT : Turn off and turn on the power again
- S/W REBOOT : Transmit REBOOT Instruction (For more details, refer to the [Reboot](/docs/en/dxl/protocol2/#reboot) section of e-Manual.)
{% endcapture %}
<div class="notice">{{ shutdown_01 | markdownify }}</div>

{% elsif page.product_group=='dxl_ax' or page.product_group=='dxl_dx' or page.product_group=='dxl_ex' or page.product_group=='dxl_rx' or page.product_group=='dxl_mx' %}
**NOTE** : If Shutdown occurs, **LED will flicker every second.**
{: .notice}
{% else %}
{% capture shutdown_01 %}
**NOTE** : 
{% if page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' %}1. If Shutdown occurs, **Dynamic brake** will be activated.{% else %}{% endif %}
2. If Shutdown occurs, **LED will flicker every second**. {% if page.product_group=='dxl_pro' or page.product_group=='dxl_pro_a' or page.product_group=='dxl_p' or page.product_group=='xl330' %}{% else %}(**Firmware v41 or above**){% endif %}
3. If Shutdown occurs, **reboot the device**.
- H/W REBOOT : Turn off and turn on the power again
- S/W REBOOT : Transmit REBOOT Instruction (For more details, refer to the [Reboot](/docs/en/dxl/protocol2/#reboot) section of e-Manual.)
{% endcapture %}
<div class="notice">{{ shutdown_01 | markdownify }}</div>
{% endif %}

[Shutdown(18)]: #shutdown 
[Shutdown(48)]: #shutdown 
[Shutdown(63)]: #shutdown
[Torque Enable(24)]: #torque-enable
[Torque Enable(64)]: #torque-enable
[Torque Enable(512)]: #torque-enable
[Torque Enable(562)]: #torque-enable
[Hardware Error Status(70)]: #hardware-error-status
[Hardware Error Status(518)]: #hardware-error-status
[Hardware Error Status(892)]: #hardware-error-status
