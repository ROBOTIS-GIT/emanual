Set Secondary ID(12) of an unit. 

Unlike ID(7) which should not overlap with other DYNAMIXELs', Secondary ID(12) can share the same ID to group DYNAMIXELs, and to synchronize the movement of units. 

The differences between Secondary ID(12) and ID(7) are as follows :
1. Secondary ID(12) is not a unique value. i.e., devices can have the same Secondary ID.
2. ID(7) has a greater priority than the Secondary ID(12). If Secondary ID(12) and ID(7) are the same, ID(7) will be applied first.
3. The EEPROM area of the Control Table cannot be modified using Secondary ID(12). With Secondary ID, the RAM area can be modified only.
4. If Instruction Packet ID is the same as Secondary ID(12), a Status Packet will not be returned.
5. If the value of Secondary ID(12) is 253 or higher, the Secondary ID function is deactivated.

|  Values   |                      Description                      |
|:---------:|:-----------------------------------------------------:|
|  0 ~ 252  |            Activate Secondary ID function             |
| 253 ~ 255 | Deactivate Secondary ID function, Default value ‘255’ |

The following are examples of operation when there are five devices with ID (7) set from 1 to 5.

{% capture secondary_id_ex1 %}
1. Set all five devices' Secondary ID(12) to '5'.
2. Send Write Instruction Packet(ID = 1, LED Red(513) = 255).
3. Turn on the LED of the device with ID '1' and return the Status Packet.
4. Send Write Instruction Packet(ID = 5, LED Red(513) = 255).
5. Turn on the LED of five devices. However, Status Packet of the device with ID ‘5’ will be returned.
6. Set the Secondary ID(12) of all five devices to ‘100’.
7. Send Write Instruction Packet(ID = 100, LED Red(513) = 0).
8. Turn off the LED of the five devices. However, as there is no device with ID ‘100’, Status Packet is not returned.
{% endcapture %}

<div class="notice--success">{{ secondary_id_ex1 | markdownify }}</div>

**WARNING** : Modebus-RTU dose not support Secondary ID(12).    
{: .notice--warning}
