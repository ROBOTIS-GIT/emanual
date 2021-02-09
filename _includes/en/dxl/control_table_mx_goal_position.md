Set the DYNAMIXEL's goal position through the Goal Position(30).  
0 to 4,095 (0xFFF) is available.  The unit is 0.088 [&deg;].
If the Goal Position(30) is set over the [CW/CCW Angle Limit(6, 8)](#cwccw-angle-limit6-8), the Status Packet transmits Angle Limit Error Bit (0x01) via its ERROR field. In the case, providing that Angle Limit Error Bit(0x01) in [Alarm LED/Shutdown](#alarm-led17-shutdown18) is set, the Alarm LED will start blinking and the motor's output will be 0 [%].

![](/assets/images/dxl/mx/mx_position.png)  

> The picture above is the front view of DYNAMIXEL.

In multi-turn mode DYNAMIXEL has a range from -28,672 to 28,672 (can turn up to 7 revolutions in either CW or CCW direction).
When resolution divider is set to a different value revolutions can increase.

**NOTE** : If it is set to Wheel Mode, Goal Position value is not used.
{: .notice}
