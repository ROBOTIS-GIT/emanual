The Home Offset(20) adjusts the home position. The offest value is added to the [Present Position(132)].  

**Present Position(132) = Actual Position + Homing Offset(20)**

|        Unit         |                  Value Range                  |
|:-------------------:|:---------------------------------------------:|
| about 0.088 [&deg;] | -1,044,479 ~ 1,044,479<br />(-255 ~ 255[rev]) |

**NOTE** : In case of the Position Control Mode(Joint Mode) that rotates less than 360 degrees, any invalid Homing Offset(20) values will be ignored(valid range : -1,024 ~ 1,024).
{: .notice}

**WARNING** : Even if [Drive Mode(10)](#drive-mode10) is set to the Reverse Mode, the sign of Homing Offset(20) value is not reversed.
{: .notice--warning}
