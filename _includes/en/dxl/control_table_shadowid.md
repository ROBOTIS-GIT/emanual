It assigns a secondary ID to the DYNAMIXEL.  
The Secondary ID(12) can be shared to group between DYNAMIXELs and to synchronize their movement, unlike [ID(7)] which should not be overlapped. 
Be aware of differences between Secondary ID(12) and ID(7) reading the following.
- Multiple DYNAMIXELs can have the same ID and be grouped under the same Secondary ID(12). 
- ID(7) has a greater priority than the Secondary ID(12). If two items (Secondary ID(12) and ID(7)) are the same each other, ID(7) should be applied first.
- [The EEPROM area](#control-table-of-eeprom-area) of [the Control Table](#control-table) cannot be modified using Secondary ID(12). 
- [The RAM area](#control-table-of-ram-area) can be modified using the Secondary ID(12).
- If Instruction Packet ID is the same as Secondary ID(12), a Status Packet will not be returned.
- If the value of Secondary ID(12) is 253 or higher, the Secondary ID function is deactivated.

|  Values   |                      Description                      |
|:---------:|:-----------------------------------------------------:|
|  0 ~ 252  |            Activate Secondary ID function             |
| 253 ~ 255 | Deactivate Secondary ID function, Default value ‘255’ |

#### [Secondary ID(12) Example](#secondary-id12-example) 

See the following Secondary ID(12) example to understand properly. Note that sample DYNAMAIXELs at the following example use a different ID (1 to 5).

{% if page.product_group=='dxl_xw540' %}

1. Set Secondary ID of all DYNAMIXELs to '5'.
2. Send Write Instruction Packet([ID(7)] = 1, [Torque Enable(64)] = 1).
3. The DYNAMIXEL with ID '1' turns on its torque by the Instruction Packet, and Status Packet will be returned.
4. Send Write Instruction Packet([ID(7)] = 5, [Torque Enable(64)] = 1).
5. All DYNAMIXELs turns on their torque, but Status Packet of ID '5' will be returned only.
6. Set the Secondary ID of all DYNAMIXELs to ‘100’.
7. Send Write Instruction Packet([ID(7)] = 100, [Torque Enable(64)] = 0).
8. All DYNAMIXELs turns off their torque. As no DYNAMIXEL uses ID 100, but uses the same Secondary ID, the Status Packet will not be returned.

{% else %}

1. Set Secondary ID of all DYNAMIXELs to '5'.
2. Send Write Instruction Packet([ID(7)] = 1, [LED(65)] = 1).
3. The DYNAMIXEL with ID '1' turns on its LED by the Instruction Packet, and Status Packet will be returned.
4. Send Write Instruction Packet([ID(7)] = 5, [LED(65)] = 1).
5. All DYNAMIXELs turns on their LED, but Status Packet of ID '5' will be returned only.
6. Set the Secondary ID of all DYNAMIXELs to ‘100’.
7. Send Write Instruction Packet([ID(7)] = 100, [LED(65)] = 0).
8. All DYNAMIXELs turns off their LED. As no DYNAMIXEL uses ID 100, but uses the same Secondary ID, the Status Packet will not be returned.

{% endif %}
