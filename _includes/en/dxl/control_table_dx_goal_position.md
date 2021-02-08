Set the DYNAMIXEL's goal position through the Goal Position(30).  
The available position range is 0 to 1,023 (0x3FF) and the per unit value is 0.29 &deg;  
If the Goal Position(30) is set over the [CW/CCW Angle Limit(6, 8)](#cwccw-angle-limit6-8), the Status Packet transmits Angle Limit Error Bit (0x01) via its ERROR field. In the case, providing that Angle Limit Error Bit(0x01) in the Alarm LED/Shutdown is set, the Alarm LED will start blinking and the motor's output will be 0 [%].

![](/assets/images/dxl/dx/dx_series_goal_position.png)

> The picture above is the front view of DYNAMIXEL

**NOTE** : If it is set to Wheel Mode, Goal Position value is not used.
{: .notice}
