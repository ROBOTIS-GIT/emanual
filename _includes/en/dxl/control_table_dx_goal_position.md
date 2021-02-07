Set the DYNAMIXEL's goal position through the Goal Position(30).
0 ~ 1,023 (0x3FF) is available. The unit is 0.29&deg;.
If the Goal Position(30) is set over the CW/CCW Angle Limit, the Status Packet transmits Angle Limit Error Bit (0x01) via its ERROR field. In the case, providing that Angle Limit Error Bit(0x01) in the Alarm LED/Shutdown is set, the Alarm LED will start blinking and the motor's output will be 0 [%].

![](/assets/images/dxl/dx/dx_series_goal_position.png)

> The picture above is the front view of DYNAMIXEL

**NOTE** : If it is set to Wheel Mode, Goal Position value is not used.
{: .notice}
