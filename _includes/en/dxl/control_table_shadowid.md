Set Secondary ID(12) of an unit. 

Unlike, ID(7) which should not overlap with other DYNAMIXELs, Secondary ID(12) can share the same ID to group DYNAMIXELs, and to synchronize the movement of units. 

The differences between Secondary ID(12) and ID(7) are as follows
- Secondary ID(12) is not a unique value. devices can share the same Secondary ID.
- ID(7) has a greater priority than the Secondary ID(12). If Secondary ID(12) and ID(7) has the same value, ID(7) will be applied first.
- The EEPROM area of the Control Table cannot be modified using Secondary ID(12). The RAM area can be modified only with the Secondary ID(12), .
- If Instruction Packet ID is the same as Secondary ID(12), a Status Packet will not be returned.
- If the value of Secondary ID(12) is 253 or higher, the Secondary ID function is deactivated.

|  Values   |                      Description                      |
|:---------:|:-----------------------------------------------------:|
|  0 ~ 252  |            Activate Secondary ID function             |
| 253 ~ 255 | Deactivate Secondary ID function, Default value ‘255’ |

#### [Example of Secondary ID(12)](#example-of-secondary-id12)

See the following example of using Secondary ID(12). Note that all DYNAMAIXELs use a different ID (1 to 5)

{% if page.product_group=='dxl_xw540' %}

1. Set Secondary ID of all DYNAMIXELs to '5'.
2. Send Write Instruction Packet(ID(7) = 1, Torque Enable(64) = 1).
3. The DYNAMIXEL with ID '1' turns on its torque by the Instruction Packet, and Status Packet will be returned.
4. Send Write Instruction Packet(ID = 5, Torque Enable(64) = 1).
5. All DYNAMIXELs turns on their torque, but Status Packet of ID '5' will be returned only.
6. Set the Secondary ID of all DYNAMIXELs to ‘100’.
7. Send Write Instruction Packet(ID = 100, Torque Enable(64) = 0).
8. All DYNAMIXELs turns off their torque. As no DYNAMIXEL uses ID 100, but uses the same Secondary ID, the Status Packet will not be returned.

{% else %}

1. Set Secondary ID of all DYNAMIXELs to '5'.
2. Send Write Instruction Packet(ID(7) = 1, LED(65) = 1).
3. The DYNAMIXEL with ID '1' turns on its LED by the Instruction Packet, and Status Packet will be returned.
4. Send Write Instruction Packet(ID = 5, LED(65) = 1).
5. All DYNAMIXELs turns on their LED, but Status Packet of ID '5' will be returned only.
6. Set the Secondary ID of all DYNAMIXELs to ‘100’.
7. Send Write Instruction Packet(ID = 100, Torque Enable(64) = 0).
8. All DYNAMIXELs turns off their LED. As no DYNAMIXEL uses ID 100, but uses the same Secondary ID, the Status Packet will not be returned.

{% endif %}
