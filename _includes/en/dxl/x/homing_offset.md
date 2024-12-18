Homing Offset(20) allows users to adjust the actuator's home position by adding the offset value is to the reported [Present Position(132)].  

**Present Position(132) = Actual Position + Homing Offset(20)**

|        Unit         |                  Value Range                  |
|:-------------------:|:---------------------------------------------:|
| about 0.088 [&deg;] | -1,044,479 ~ 1,044,479<br />(-255 ~ 255[rev]) |

**NOTE** : In Position Control Mode(Joint Mode) when configured to rotate less than 360 degrees, any invalid Homing Offset(20) values will be ignored(valid range : -1,024 ~ 1,024).
{: .notice}

**WARNING** : Even if [Drive Mode(10)](#drive-mode10) is set to Reverse Mode, the sign of the Homing Offset(20) value is not reversed.
{: .notice--warning}
