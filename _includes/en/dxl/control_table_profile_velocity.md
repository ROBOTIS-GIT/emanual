{% if page.ref == "mx-106-2" or page.ref =="mx-64-2" or page.product_group =="dxl_x430" or page.product_group =="dxl_x540" page.product_group =="dxl_xw540"  %}

{% assign supported_opmode = "**Position Control Mode**, **Extended Position Control Mode** or **Current-based Position Control Mode**" %}

{% else %}

{% assign supported_opmode = "**Position Control Mode** or **Extended Position Control Mode**" %}

{% endif %}

When the [Drive Mode(10)] is **Velocity-based Profile**, Profile Velocity(112) sets the maximum velocity of the Profile.  
When the [Drive Mode(10)] is **Time-based Profile**, Profile Velocity(112) sets the time span to reach the velocity (the total time) of the Profile.  
Be aware that the Profile Velocity(112) is to be only applied to {{ supported_opmode }} on the [Operating Mode(11)].

For more detailed information, see [What is the Profile](#what-is-the-profile).

**NOTE**: Velocity Control Mode only uses [Profile Acceleration(108)] without the Profile Velocity(112).
{: .notice}

| Velocity-based Profile |     Values      | Description                         |
|:----------------------:|:---------------:|:------------------------------------|
|          Unit          | 0.229 [rev/min] | Sets velocity of the Profile        |
|         Range          |    0 ~ 32767    | '0' represents an infinite velocity |

| Time-based Profile |  Values   | Description                                                                                                             |
|:------------------:|:---------:|:------------------------------------------------------------------------------------------------------------------------|
|        Unit        | 1 [msec]  | Sets the time span for the Profile                                                                                      |
|       Range        | 0 ~ 32737 | '0' represents an infinite velocity.<br>Profile Acceleration(108, Acceleration time) will not exceed 50% of Profile Velocity (112, the time span to reach the velocity of the Profile) value. |

{% if page.product_group=='xl330' %}

{% else %}

**NOTE** : Time-based Profile is available from the firmware V42.
{: .notice}

{% endif %}

[Moving Status(123)]: #moving-status123
[Drive Mode(10)]: #drive-mode10
