This value indicates whether DYNAMIXEL is in motion or not.  
If absolute value of [Present Velocity(128)] is greater than Moving Threshold(24), Moving(122) is set to '1'.  
Otherwise, it will be cleared to '0'.  
However, this value will always be set to '1' regardless of [Present Velocity(128)] while Profile is in progress with Goal Position(116) instruction.

| Value | Description     |
| :------------- | :------------- |
| 0 | Movement is not detected |
| 1 | Movement is detected, or Profile is in progress(Goal Position(116) instruction is being processed) |
