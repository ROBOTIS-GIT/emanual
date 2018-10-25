Bus Watchdog(546) is a safety feature(Fail-safe) that stops the device if the communication(RS485, TTL) between the controller and the device is disconnected due to an unidentified error. The "communication" can be seen as all the Instruction Packets defined in the protocol.

|       |   Value   | Description                                                     |
|:-----:|:---------:|:----------------------------------------------------------------|
| Unit  | 20 [msec] | -                                                               |
| Range |     0     | Deactivates Bus Watchdog Function and clears Bus Watchdog Error |
| Range |  1 ~ 127  | Activates Bus Watchdog                                          |
| Range |    -1     | Bus Watchdog Error Status                                       |

The Bus Watchdog monitors the communication interval time between the controller and the device when Torque Enable(512) is ‘1’.  
If the measured communication interval time is longer than Bus Watchdog(546), the device will be stopped and Bus Watchdog(546) value will be set to ‘-1’ (Bus Watchdog Error).  
If Bus Watchdog Error occurs, goal values such as Goal PWM(548), Goal Current(550), Goal Velocity(552) and Goal Position(564) will be changed to read-only-access.  
Therefore, attempting to write a new value to these address will fail and return Range Error in the Status Packet.
Writing '0' to Bus Watchdog(546) will clear the Bus Watchdog Error.

**NOTE** : For details of Range Error, please refer to the [Protocol 2.0].
{: .notice}

[Protocol 2.0]: /docs/en/dxl/protocol2/

The following is the example of Bus Watchdog function.

1. After setting the Operating Mode(11) to Velocity Control Mode, change the Torque Enable(512) to `1`.
2. If `50` is written to the Goal Velocity(552), the device will rotate in CCW direction.
3. Change the value of Bus Watchdog(546) to `100`(2,000 [ms]). (Activate Bus Watchdog Function)
4. If no instruction packet is received within 2,000 [ms], the device will stop with the predefined decelerating value.
5. Bus Watchdog(546) value is set to `-1` (Bus Watchdog Error). At this time, the access property of goal values will be changed to read-only.
6. If `150` is written to the Goal Velocity(552), Range Error will be returned via Status Packet.
7. If Bus Watchdog(546) value is changed to `0`, Bus Watchdog Error will be cleared.
8. If `150` is written in the Goal Velocity(552), the device will rotate in CCW direction.
