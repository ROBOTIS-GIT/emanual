The Moving(122) register indicates whether the connected DYNAMIXEL is in motion or not.  
If the absolute value of [Present Velocity(128)](#present_velocity128) is greater than the configured [Moving Threshold(24)](#moving-threshold24), Moving(122) is set to '1', indicating the actuator is currently in motion.  Otherwise, it will be cleared to '0'.  However, Moving(122) will always be set to '1' regardless of [Present Velocity(128)](#present_velocity128) while a movement Profile is in progress following an updated [Goal Position(116)](#goal-position116) instruction.

| Value | Description     |
| :------------- | :------------- |
| 0 | Movement is not detected |
| 1 | Movement is detected, or a Profile is in progress(Goal Position(116) instruction has been updated) |
