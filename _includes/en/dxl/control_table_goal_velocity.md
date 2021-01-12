Use the Goal Velocity(104) to set a desired velocity when the [Operating Mode(11)] is **Velocity Control Mode**. 

Note that the Goal Velocity(104) is not used to limit moving velocity.

|   Unit    |                 Value Range                  |
|:---------:|:--------------------------------------------:|
| 0.229 rpm | -[Velocity Limit(44)] ~ [Velocity Limit(44)] |

**NOTE**: Goal Velocity(104) can not exceed [Velocity Limit(44)].
{: .notice}

**NOTE** : The maximum velocity and maximum torque of DYNAMIXEL is affected by supplying voltage.  
Therefore, if supplying voltage changes, so does the maximum velocity. This manual complies with recommended supply voltage(12[V]).
{: .notice}

**NOTE** : If [Profile Acceleration(108)] and Goal Velocity(104) are modified simultaneously, modified [Profile Acceleration(108)] will be used to process Goal Velocity(104).
{: .notice}
