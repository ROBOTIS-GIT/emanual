 When the [Drive Mode(10)] is **Velocity-based Profile**, Profile Acceleration(108) sets acceleration of the Profile.  
 When the [Drive Mode(10)] is **Time-based Profile**, Profile Acceleration(108) sets accelerating time of the Profile.  
 Be aware that the Profile Acceleration(108) is to be applied in all control mode except **Current Control Mode** or **PWM Control Mode** on the [Operating Mode(11)].  
 
 For more detailed information, see [What is the Profile](#what-is-the-profile)

| Velocity-based Profile |            Values             | Description                             |
|:----------------------:|:-----------------------------:|:----------------------------------------|
|          Unit          | 214.577 [rev/min<sup>2</sup>] | Sets acceleration of the Profile        |
|         Range          |           0 ~ 32767           | '0' stands for an infinite acceleration |

| Time-based Profile |  Values   | Description                                                                                                                                |
|:------------------:|:---------:|:-------------------------------------------------------------------------------------------------------------------------------------------|
|        Unit        | 1 [msec]  | Sets accelerating time of the Profile                                                                                                      |
|       Range        | 0 ~ 32737 | '0' stands for an infinite accelerating time('0 [msec]').<br>Profile Acceleration(108) will not exceed 50% of Profile Velocity(112) value. |

{% if page.product_group=='xl330' %}

{% else %}

**NOTE** : Time-based Profile is available from the firmware version 42.
{: .notice}

{% endif %}
