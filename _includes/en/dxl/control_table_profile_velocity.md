
When the [Drive Mode(10)] is **Velocity-based Profile**, Profile Velocity(112) sets the maximum velocity of the Profile.  
When the [Drive Mode(10)] is **Time-based Profile**, Profile Velocity(112) sets the time span for the Profile.  
Be aware that the Profile Velocity(112) is to be only applied to **Position Control Mode** or **Extended Position Control Mode** on the [Operating Mode(11)].

For more detailed information, see [What is the Profile](#what-is-the-profile).

**NOTE**: Velocity Control Mode only uses [Profile Acceleration(108)] without the Profile Velocity(112).
{: .notice}

| Velocity-based Profile |     Values      | Description                         |
|:----------------------:|:---------------:|:------------------------------------|
|          Unit          | 0.229 [rev/min] | Sets velocity of the Profile        |
|         Range          |    0 ~ 32767    | '0' stands for an infinite velocity |

| Time-based Profile |  Values   | Description                                                                                                             |
|:------------------:|:---------:|:------------------------------------------------------------------------------------------------------------------------|
|        Unit        | 1 [msec]  | Sets the time span for the Profile                                                                                      |
|       Range        | 0 ~ 32737 | '0' stands for an infinite velocity.<br>[Profile Acceleration(108)] will not exceed 50% of Profile Velocity(112) value. |

{% if page.product_group=='xl330' %}

{% else %}

**NOTE** : Time-based Profile is available from the firmware V42.
{: .notice}

{% endif %}

[Moving Status(123)]: #moving-status123
[Drive Mode(10)]: #drive-mode10
