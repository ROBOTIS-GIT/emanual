{% if page.product_group=='dxl_y_m' %}
{% assign secondary_id= "[Secondary ID(10)]" %}
{% assign id= "[ID(7)]" %}
{% endif %}

The {{ secondary_id }} is another value that can be used to identify devices on the DYNAMIXEL network, similar to {{ id }}.  
There are several important differences between {{ id }} and {{ secondary_id }}:
1. The Secondary ID does not need to be a unique value. This means that multiple devices can share the same Secondary ID value, allowing the creation of device groups.
2. The primary ID has a higher priority than the Secondary ID. If the Secondary ID and ID are the same, the primary ID takes precedence. 
You cannot use the Secondary ID to change values in the EEPROM area of the control table. Only values in the RAM area can be changed. 
3. If a command is sent to a servo’s Secondary ID, no Status Packet will be returned. 
4. If the value of the Secondary ID is 253 or higher, the Secondary ID functionality is disabled.


|  Value    | Description                                               |
|:---------:|:----------------------------------------------------------|
|  0 ~ 252  | Enable Secondary ID function                              |
| 253 ~ 255 | Disable Secondary ID function,<br />Default value : ‘255’ |

Here is an example scenario with 5 devices with IDs ranging from 1 to 5:

{% capture secondary_id_ex1 %}
1. Set the Secondary ID (12) to '5' for all 5 devices. 
2. Send a Write Instruction Packet (ID = 1, LED (513) = 255).
3. The device with ID '1' turns on its LED and returns a Status Packet. 
4. Send a Write Instruction Packet (ID = 5, LED (513) = 255): 
5. All 5 devices turn on their LEDs. 
6. However, only device ID '5' returns a Status Packet. 
7. Set the Secondary ID (12) to '100' for all 5 devices. 
8. Send a Write Instruction Packet (ID = 100, LED (513) = 0): All 5 devices turn off their LEDs. Since there is no device with ID '100', no Status Packet is returned.
{% endcapture %}

<div class="notice">{{ secondary_id_ex1 | markdownify }}</div>

