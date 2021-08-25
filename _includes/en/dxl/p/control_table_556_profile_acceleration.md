When the [Drive Mode(10)] is **Velocity-based Profile**, Profile Acceleration(556) sets acceleration of the Profile.  
When the [Drive Mode(10)] is **Time-based Profile**, Profile Acceleration(556) sets acceleration time of the Profile.  
The Profile Acceleration(556) is to be applied in all control mode except **Current Control Mode** or **PWM Control Mode** on the [Operating Mode(11)].  
For more details, see [What is the Profile](#what-is-the-profile)

| Velocity-based Profile |            Values            | Description                             |
|:----------------------:|:----------------------------:|:----------------------------------------|
|          Unit          | 0 ~ [Acceleration Limit(40)] | Sets acceleration of the Profile        |
|         Range          |          0 ~ 32767           | '0' represents an infinite acceleration |

| Time-based Profile |  Values   | Description                                                                                                                                                                                                        |
|:------------------:|:---------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|        Unit        | 1 [msec]  | Sets accelerating time of the Profile                                                                                                                                                                              |
|       Range        | 0 ~ 32737 | '0' represents an infinite acceleration time('0 [msec]').<br>Profile Acceleration(556, Acceleration time) will not exceed 50% of Profile Velocity (112, the time span to reach the velocity of the Profile) value. |


**NOTE** : When Profile Velocity(560) is set to '0', the profile's acceleration will be ignored.
{: .notice}

**NOTE** : Time-based Profile is available from firmware 12. 
{: .notice}
