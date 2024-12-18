 When the [Drive Mode(10)] is **Velocity-based Profile**, Profile Acceleration(108) sets the maximum allowable acceleration of the generated Profile.  
 When the [Drive Mode(10)] is **Time-based Profile**, Profile Acceleration(108) sets the allowed acceleration time of the generated Profile.  
 The Profile Acceleration(108) is used in all control modes except **Current Control Mode** and **PWM Control Mode**.
 
 For more detailed information, see [What is the Profile](#what-is-the-profile)

| Velocity-based Profile |            Values             | Description                             |
|:----------------------:|:-----------------------------:|:----------------------------------------|
|          Unit          | 214.577 [rev/min<sup>2</sup>] | Sets maximum acceleration of the Profile        |
|         Range          |           0 ~ 32767           | '0' represents an infinite maximum acceleration |

| Time-based Profile |  Values   | Description                                                                                                                                                                                           |
|:------------------:|:---------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|        Unit        | 1 [msec]  | Sets allowed acceleration time of the Profile                                                                                                                                                                 |
|       Range        | 0 ~ 32737 | '0' represents an infinite acceleration time('0 [msec]').<br>Profile Acceleration(108) can not exceed 50% of the configured Profile Velocity (112) value. |

{% if page.product_group=='xl330' %}

{% else %}

**NOTE** : Time-based Profiles are available starting from firmware version 42.
{: .notice}

{% endif %}
