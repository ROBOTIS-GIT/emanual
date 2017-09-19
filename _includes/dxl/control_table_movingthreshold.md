This value helps to determine whether the Dynamixel is in motion or not.
When the absolute value of Present Velocity(128) is greater than the Moving Threshold(24), Moving(122) is set to ‘1’, otherwise it is cleared to ‘0’.

||Values|Description|
| :---: | :---: | :---: |
|Unit|about 0.229 rpm|All velocity related Data uses the same unit|
|Range|0 ~ 1,023|-|

`Note` In case of the Position Control Mode(Joint Mode) that rotates less than 360 degrees, any invalid Homing Offset(20) values will be ignored(valid range : -1,024 ~ 1,024).
{: .notice}
