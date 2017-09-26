Goal Velocity(600) can be used to set a target velocity and this value cannot exceed Velocity Limit (32).
In case of Position Control Mode or Extended Position Control Mode, Goal Velocity will be used to limit the velocity.
However, if Goal Velocity is set to '0', Velocity Limit(32) will be used to limit the velocity. (Please refer to the block diagram of Position P Gain)
The Goal Velocity stands for the RPM of the motor before the reduction gears and output RPM after the reduction gears can be calculated using below scale factor.
Output RPM = Goal Velocity * Scale Factor

|Model|Scale Factor(RPM)|
| :---: | :---: |
|H54-200-S500-R<br />H54-100-S500-R|0.00199234|
|H42-20-S300-R|0.00329218|
|M54-60-S250-R<br />M54-40-S250-R|0.00397746|
|M42-10-S260-R|0.00389076|
|L54-50-S290-R|0.00346667|
|L54-50-S500-R<br />L54-30-S500-R|0.00199234|
|L54-30-S400-R|0.00249657|
