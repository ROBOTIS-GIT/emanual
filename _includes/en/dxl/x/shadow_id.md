Secondary(Shadow) ID(12) allows the assignment of a secondary ID to a DYNAMIXEL.  
The Secondary ID(12) can be used to group DYNAMIXELs and to synchronize their movement unlike the primary [ID(7)], which must be unique, any number of connected DYNAMIXELs may share a Secondary ID(12).
There are several important differences between the primary [ID(7)] and Secondary ID(12):
- [ID(7)] has a greater priority than Secondary ID(12). If Secondary ID(12) and [ID(7)] are the same, the actuator will respond as if commands are sent only to it's primary [ID(7)].
- [The EEPROM area](#control-table-of-eeprom-area) of [the Control Table](#control-table) cannot be modified with control packets addressed to a Secondary ID(12). 
- Status Packets will not be returned for commands sent to Secondary ID(12).
- If the value of Secondary ID(12) is 253 or higher, the Secondary ID function will be deactivated.

|  Values   |                      Description                      |
|:---------:|:-----------------------------------------------------:|
|  0 ~ 252  |            Activate Secondary ID function             |
| 253 ~ 255 | Deactivate Secondary ID function, Default value ‘255’ |

#### [Secondary ID(12) Example](#secondary-id12-example) 

See the following Secondary ID(12) example for a demonstration. Note that the assigned [ID(7)] for the DYNAMIXELs in the example are '1', '2', '3', '4' and '5'.

{% if page.product_group=='dxl_xw540' or page.product_group=='dxl_xw430'%}

1. Set the Secondary ID of the five connected DYNAMIXELs to '5'
2. Send a Write Instruction Packet([ID(7)] = 1, [Torque Enable(64)] = 1).
3. The DYNAMIXEL with [ID(7)] '1' turns on its torque and a Status Packet will be returned.
4. Send a Write Instruction Packet([ID(7)] = 5, [Torque Enable(64)] = 1).
5. All DYNAMIXELs turn on their torque, but a status packet will only be returned by the actuator with the [ID(7)] of '5'.
6. Set the Secondary ID(12) of all DYNAMIXELs to ‘100’.
7. Send a Write Instruction Packet([ID(7)] = 100, [Torque Enable(64)] = 0).
8. All DYNAMIXELs turn off their torque. As no DYNAMIXEL uses [ID(7)] 100, a Status Packet will not be returned.

{% else %}

1. Set the Secondary ID of the five connected DYNAMIXELs to '5'
2. Send a Write Instruction Packet([ID(7)] = 1, [LED(65)] = 1).
3. The DYNAMIXEL with [ID(7)]1' turns on its LED and a Status Packet will be returned.
4. Send Write Instruction Packet([ID(7)] = 5, [LED(65)] = 1).
5. All DYNAMIXELs turn on their LED, but only the actuator with an [ID(7)] of '5' will return a Status Packet.
6. Set the Secondary ID of all DYNAMIXELs to ‘100’.
7. Send Write Instruction Packet([ID(7)] = 100, [LED(65)] = 0).
8. All DYNAMIXELs turn off their LED. As no DYNAMIXEL uses ID 100, no Status Packet will be returned.

{% endif %}
