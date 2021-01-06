 The Bus Watchdog(98) is a safety device (Fail-safe) to stops the DYNAMIXEL if the communication between the controller and DYNAMIXEL communication (RS485, TTL) is disconnected due to an unspecified error.
The communication is defined as all the Instruction Packet in the DYNAMIXEL Protocol.

|       | Values  | Description                                                |
|:------|:-------:|:-----------------------------------------------------------|
| Range |    0    | Deactivate Bus Watchdog Function, Clear Bus Watchdog Error |
| Range | 1 ~ 127 | Activate Bus Watchdog  (Unit: 20 [msec])                   |
| Range |   -1    | Bus Watchdog Error Status                                  |

The Bus Watchdog function monitors the communication interval (time) between the controller and DYNAMIXEL when [Torque Enable(64)] is '1'(Torque ON).  
If the measured communication interval (time) is larger than the set value of Bus Watchdog(98), the DYNAMIXEL will stop. Bus Watchdog(98) will be changed to '-1' (Bus Watchdog Error).
If the Bus Watchdog Error screen appears, the Goal Value ([Goal PWM(100)], {% if page.product_group!='dxl_xl430' %}[Goal Current(102)], {% else %}{% endif %}[Goal Velocity(104)], [Goal Position(116)]) will be changed to read-only-access.
Therefore, if a new value is written to the Goal Value, the Status Packet will send the Data Range Error via its Error field.
If the value of Bus Watchdog(98) is changed to '0', Bus Watchdog Error will be cleared.

**NOTE** : For details of the Data Range Error, please refer to the [Protocol 2.0]
{: .notice}

{% if page.product_group !='xl330' %}
**NOTE**: Bus Watchdog (98) is available from firmware v38.
{: .notice}
{% endif %}

#### [Bus Watchdog (98) Example](#bus-watchdog-98-example)

The following is the example of the operation of the Bus Watchdog function.
1. After setting the [Operating Mode(11)] to speed control mode, change the [Torque Enable(64)] to '1'.
2. If '50' is written in the [Goal Velocity(104)], the DYNAMIXEL will rotate in CCW direction.
3. Change the value of [Bus Watchdog(98)] to '100' (2,000 [ms]). (Activate Bus Watchdog Function)
4. If no instruction packet is received for 2,000 [ms], the DYNAMIXEL will stop. When it stops, the [Profile Acceleration(108)] and [Profile Velocity(112)] are applied as '0'.
5. The value of [Bus Watchdog(98)] changes to '-1' (Bus Watchdog Error). At this time, the access to the Goal Value will be changed to read-only.
6. If '150' is written to the [Goal Velocity(104)], the Data Range Error will be returned via Status Packet.
7. If the value of [Bus Watchdog(98)] is changed to '0', Bus Watchdog Error will be cleared.
8. If “150” is written in the [Goal Velocity(104)], the DYNAMIXEL will rotate in CCW direction.


[Protocol 2.0]: /docs/en/dxl/protocol2/#status-packet
