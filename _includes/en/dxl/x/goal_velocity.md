Goal Velocity(104) is used to to set the target velocity when in the **Velocity Control Mode** [Operating Mode(11)]. Goal Velocity(104) is not used to limit moving velocity in any operating modes.

|   Unit    |                 Value Range                  |
|:---------:|:--------------------------------------------:|
| 0.229 rpm | -[Velocity Limit(44)] ~ [Velocity Limit(44)] |

**NOTE**: Goal Velocity(104) can not exceed the configured [Velocity Limit(44)].
{: .notice}

**NOTE** : The maximum velocity and maximum torque of DYNAMIXEL is affected by the supplied voltage. If the input voltage changes, so does the maximum velocity and torque. This manual assumes operation with the recommended input voltage.
{: .notice}

**NOTE** : If [Profile Acceleration(108)] and Goal Velocity(104) are modified simultaneously, the newly modified [Profile Acceleration(108)] will be used to process the updated Goal Velocity(104).
{: .notice}
