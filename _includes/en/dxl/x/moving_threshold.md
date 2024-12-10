The Moving Threshold(24) is used to determine whether the DYNAMIXEL is considered to be in motion or not.  When the absolute value of the [Present Velocity(128)] is greater than the configured Moving Threshold(24), the DYNAMIXEL is considered in motion and the value of [Moving(122)] is set to ‘1’.

|      Unit       |   Range   |                    Description                    |
|:---------------:|:---------:|:-------------------------------------------------:|
| about 0.229 rpm | 0 ~ 1,023 | All velocity related Data uses the same unit scale|
