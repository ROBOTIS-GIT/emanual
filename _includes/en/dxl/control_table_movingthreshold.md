The Moving Threshold(24) determines whether the DYNAMIXEL is in motion or not.  
When the absolute value of [Present Velocity(128)] is greater than the Moving Threshold(24), [Moving(122)] is set to ‘1’. Otherwise it is cleared to ‘0’.

|      Unit       |   Range   |                 Description                  |
|:---------------:|:---------:|:--------------------------------------------:|
| about 0.229 rpm | 0 ~ 1,023 | All velocity related Data uses the same unit |
