Configure the secondary ID of your DYNAMIXEL servo.

Unlike the primary ID(7) overlapping Secondary ID(12) settings are allowed, allowing simple synchronization of multiple DYNAMIXEL actuators.

The primary and secondary IDs differ in several ways.
1. Secondary ID(12) do not need to be unique, and can be shared among any number of DYNAMIXEL servos. 
2. The primary ID(7) has a greater priority than the Secondary ID(12). If the Secondary ID(12) and primary ID(7) are the same, the servo will act as if the instruction has been sent only to it's primary ID.
3. The EEPROM area of the Control Table cannot be modified using Secondary ID(12), changes can only be made to the RAM area when addressed to secondary IDs.
4. Status packets will not be returned for instructions sent to secondary IDs.
5. The secondary ID function is completely disabled when it has been set to a value higher than 253.

|  Values   |                                      Description                                     |
|:---------:|:------------------------------------------------------------------------------------:|
|  0 ~ 252  |            Enable the secondary ID feature with the configured ID value.             |
| 253 ~ 255 |  Deactivate the Secondary ID function. The Default value  of the setting is ‘255’.   |

The following example showcases some of the functionality of DYNAMIXEL's secondary ID function using DYNAMIXELs with primary ID's from 1-5:

{% capture secondary_id_ex1 %}
1. Set all five devices' Secondary ID(12) to '5'.
2. Send a Write Instruction Packet to ID 1 turning on the LED: LED Red(513) = 255.
3. DYNAMIXEL ID 1's LED will illuminate, and a status packet will be returned.
4. Send a Write Instruction Packet to ID 5 turning on the LED:  LED Red(513) = 255.
5. The LEDs of all five devices will turn on, but a status packet will only be returned from DYNAMIXEL ID 5.
6. Set the Secondary ID(12) of all five devices to ‘100’.
7. Send a Write Instruction Packet to ID 100: LED Red(513) = 0.
8. The LEDs of all five devices will turn off, but no status packet will be returned as there is no device with primary ID 100.
{% endcapture %}

<div class="notice--success">{{ secondary_id_ex1 | markdownify }}</div>

**WARNING** : Modbus-RTU communication does not support Secondary ID(12) functionality.    
{: .notice--warning}
