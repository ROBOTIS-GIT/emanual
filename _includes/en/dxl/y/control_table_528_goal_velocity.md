In velocity control mode, the Goal Velocity (528) value operates as the target velocity value.  
In position control mode and extended position control mode, it operates within the limit of the velocity controller input (current). Goal velocity(528) cannot exceed the [Velocity Limit(72)].

| Unit       | Range                                         |  Control Mode                                                 |               Description                  |
|:----------:|:---------------------------------------------:| :-------------------------------------------------------------|:-------------------------------------------|
| 0.01 [RPM] | - Velocity Limit(72) ~ Velocity Limit(72)     |  Current control<br />Velocity control<br />Position control  | Unused<br />80,000 = Rotates at 800[RPM] speed<br />500,000 = Maximum rotational speed limited to 5,000[RPM] |

**Note** : If the electronic gear ratio, expressed as Gear [Ratio Num(96)/Den(100)] value is not 1, the Goal Velocity(528) value will be multiplied by this ratio and applied to the controller.
{: .notice}

