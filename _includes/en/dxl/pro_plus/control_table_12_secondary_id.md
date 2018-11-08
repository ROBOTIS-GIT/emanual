Set the device’s Secondary ID. Secondary ID(12) is a value to identify each device, just like the ID(7).
However, unlike ID(7), Secondary ID(12) is not a unique value.
Therefore, devices with the same Secondary ID value form a group.
The differences between Secondary ID(12) and ID(7) are as follows :
1. Secondary ID(12) is not a unique value. i.e., a lot of devices may have the same Secondary ID value.
2. ID(7) has a higher priority than Secondary ID(12). i.e., if Secondary ID(12) and ID(7) are the same, ID(7) will be applied first.
3. The EEPROM area of the Control Table cannot be modified with Secondary ID(12). Only the RAM area can be modified.
4. If Instruction Packet ID is the same as Secondary ID(12), the Status Packet will not be returned.
5. If the value of Secondary ID(12) is 253 or higher, the Secondary ID function is deactivated.

|Values|Description|
| :---: | :---: |
|0 ~ 252|Activate Secondary ID function|
|253 ~ 255|Deactivate Secondary ID function, Default value ‘255’|

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
