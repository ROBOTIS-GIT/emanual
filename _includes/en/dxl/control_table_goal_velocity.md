In case of Velocity Control Mode, Goal Velocity(104) can be used to set a desired velocity. This value cannot exceed Velocity Limit(44). For now, Goal Velocity(104) is used for desired velocity, but this value is not used to limit the velocity.

|Unit|Value Range|
| :---: | :---: |
| 0.229 rpm | -Velocity Limit(44) ~ Velocity Limit(44) |

**NOTE** : The maximum velocity and maximum torque of DYNAMIXEL is affected by supplying voltage. Therefore, if supplying voltage changes, so does the maximum velocity. This manual complies with recommended supply voltage(12[V]).
{: .notice}

**NOTE** : If Profile Acceleration(108) and Goal Velocity(104) are modified simultaneously, modified Profile Acceleration(108) will be used to process Goal Velocity(104).
{: .notice}
