 The Bus Watchdog(98) is a fail-safe system used to stop DYNAMIXEL motion if communication between the controller and DYNAMIXEL (RS485, TTL) is disconnected.

|       | Values  | Description                                                |
|:------|:-------:|:-----------------------------------------------------------|
| Range |    0    | Deactivate Bus Watchdog Function, Clear Bus Watchdog Error |
| Range | 1 ~ 127 | Activate Bus Watchdog  (Unit: 20 [msec])                   |
| Range |   -1    | Bus Watchdog Error Active                                  |

The Bus Watchdog function monitors the interval of communications between the controller and DYNAMIXEL when [Torque Enable(64)] is '1'(Torque ON).  
If the measured communication interval is larger than the configured value of Bus Watchdog(98), the DYNAMIXEL will stop. Bus Watchdog(98) will be changed to '-1' and a Bus Watchdog Error will be activated.
When a Bus Watchdog Error screen is active, all Goal Values ([Goal PWM(100)], {% if page.product_group!='dxl_xl430' %}[Goal Current(102)], {% else %}{% endif %}[Goal Velocity(104)], [Goal Position(116)]) will be changed to read-only-access until the error has been cleared.
If the value of Bus Watchdog(98) is changed to '0', active Bus Watchdog Errors will be cleared.

#### [Bus Watchdog (98) Example](#bus-watchdog-98-example)

The following is an example of the operation of the Bus Watchdog failsafe.
1. After setting the [Operating Mode(11)] to speed control mode, change [Torque Enable(64)] to '1'.
2. If '50' is written to [Goal Velocity(104)], the DYNAMIXEL will rotate in a CCW direction.
3. Change the value of [Bus Watchdog(98)] to '100' (2,000 [ms]) to activate the Bus Watchdog function.
4. If no instruction packet is received for 2,000 [ms], the DYNAMIXEL will stop. When it stops, the [Profile Acceleration(108)] and [Profile Velocity(112)] are set to '0'.
5. The value of [Bus Watchdog(98)] changes to '-1' (Bus Watchdog Error). At this time, the access to Goal Values will be changed to read-only.
6. If '150' is written to [Goal Velocity(104)], a Data Range Error will be returned via Status Packet.
7. If the value of [Bus Watchdog(98)] is changed to '0', the Bus Watchdog Error will be cleared.
8. If “150” is written to [Goal Velocity(104)], the DYNAMIXEL will rotate in a CCW direction.


[Protocol 2.0]: /docs/en/dxl/protocol2/#status-packet
