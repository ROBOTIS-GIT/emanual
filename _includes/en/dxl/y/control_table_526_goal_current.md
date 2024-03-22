In current control mode, the Goal Current (526) value operates as the target current value. In velocity control mode, position control mode, and extended position control mode, it operates within the limit of the current controller input (current). Goal Current(526) cannot exceed the [Current Limit(66)].

| Unit       | Range                                      |  Control Mode                                           |               Description                  |
|:----------:|:------------------------------------------:| :-------------------------------------------------------|:-------------------------------------------|
| 0.01 [A]   | - Current Limit(66) ~ Current Limit(66)    | Current control<br />Velocity control, Position control |  800 = 8[A] Current output<br />500 = Maximum output current limited to 5[A] |

**Note** : If a current exceeding the device's rated current is continuously applied to the motor, an Overload Error will occur. Please only use currents exceeding the rating momentarily.
{: .notice}