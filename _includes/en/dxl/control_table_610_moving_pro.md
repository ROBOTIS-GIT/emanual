This value indicates whether DYNAMIXEL PRO is in motion or not. If absolute value of Present Velocity(615) is greater than Moving Threshold(17), Moving(610) is set to '1'. Otherwise, it will be cleared to '0'. However, this value will always be set to '1' regardless of Present Velocity(615) while Profile is in progress with Goal Position(596) instruction.

| Value | Description     |
| :------------- | :------------- |
| 0 | Movement is not detected |
| 1 | Movement is detected, or Profile is in progress(Goal Position(596) instruction is being processed) |
