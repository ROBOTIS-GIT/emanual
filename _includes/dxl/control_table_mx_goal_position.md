It is a position value of destination.
0 to 4,095 (0xFFF) is available.  The unit is 0.088&deg;.
If Goal Position is out of the range, Angle Limit Error Bit (Bit1) of Status Packet is returned as ‘1’ and Alarm is triggered as set in Alarm LED/Shutdown.

![](/emanual/assets/images/dxl/mx/mx_position.png)
The picture above is the front view of Dynamixel

In multi-turn mode Dynamixel has a range from -28,672 to 28,672 (can turn up to 7 revolutions in either CW or CCW direction).
When resolution divider is set to a different value revolutions can increase.

`Note` If it is set to Wheel Mode, Goal Position value is not used.
{: .notice}
