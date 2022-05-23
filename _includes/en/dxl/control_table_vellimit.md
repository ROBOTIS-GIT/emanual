Velocity Limit(44) indicates the maximum value of Goal Velocity(104). For more details, see [Goal Velocity(104)](#goal-velocity104).

{% if page.product_group =='xl330' or page.product_group=='xc330'%}

|   Unit   | Value Range |
|:--------:|:-----------:|
| 0.229rpm |  0 ~ 2,047  |

{% else %}

|   Unit   | Value Range |
|:--------:|:-----------:|
| 0.229rpm |  0 ~ 1,023  |

**NOTE**: The default value of Velocity Limit(44) has been decreased since Firmware V42.
{: .notice}
{% endif %}
