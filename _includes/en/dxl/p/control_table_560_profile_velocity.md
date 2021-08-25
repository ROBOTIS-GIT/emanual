When the [Drive Mode(10)] is **Velocity-based Profile**, Profile Velocity(560) sets the maximum velocity of the Profile.  
When the [Drive Mode(10)] is **Time-based Profile**, Profile Velocity(560) sets the time span to reach the velocity (the total time) of the Profile.  
The Profile Velocity(560) is to be applied to **Position Control Mode** or **Extended Position Control Mode**  on the [Operating Mode(11)].  
For more details, see [What is the Profile](#what-is-the-profile)

| Velocity-based Profile |          Values          | Description                         |
|:----------------------:|:------------------------:|:------------------------------------|
|          Unit          |      0.01 [rev/min]      | Sets velocity of the Profile        |
|         Range          | 0 ~ [Velocity Limit(44)] | '0' represents an infinite velocity |

| Time-based Profile |  Values   | Description                                                                                                                                                                                   |
|:------------------:|:---------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|        Unit        | 1 [msec]  | Sets the time span for the Profile                                                                                                                                                            |
|       Range        | 0 ~ 32737 | '0' represents an infinite velocity.<br>Profile Acceleration(556, Acceleration time) will not exceed 50% of Profile Velocity (560, the time span to reach the velocity of the Profile) value. |

**NOTE**: Time-based Profile is available from firmware v12.
{: .notice}
