It is a position value of destination.
0 ~ 1,023 (0x3FF) is available.  The unit is 0.29&deg;.
If Goal Position is out of the range, Angle Limit Error Bit (Bit 1) of Status Packet is returned as ‘1’ and Alarm is triggered as set in Alarm LED/Shutdown.

![](/assets/images/dxl/dx/dx_series_goal_position.png)
The picture above is the front view of DYNAMIXEL

**NOTE** : If it is set to Wheel Mode, Goal Position value is not used.
{: .notice}
