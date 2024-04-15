{% assign velocity_limit= "[Velocity Limit(72)]" %}

In velocity control mode, the Goal Velocity value is used to specify the target velocity value.  
In position control mode and extended position control mode, it is used to set a limit on the maximum movement velocity. Goal Velocity cannot exceed the configured {{ velocity_limit }}.

| Unit       | Range                                         |  Control Mode                                                 |               Description                  |
|:----------:|:---------------------------------------------:| :-------------------------------------------------------------|:-------------------------------------------|
| 0.01 [RPM] | - Velocity Limit(72) ~ Velocity Limit(72)     |  Current control<br />Velocity control<br />Position control  | Unused<br />80,000 = Rotates at 800[RPM] speed<br />500,000 = Maximum rotational speed limited to 5,000[RPM] |

**Note** : If the electronic gear ratio is not 1, the Goal Velocity value will be multiplied by this ratio before being applied to the controller.
{: .notice}

