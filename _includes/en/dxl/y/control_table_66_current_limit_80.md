{% assign goal_current= "[Goal Current(526)]" %}

Current Limit is used to set the maximum output current in current controlled operating modes. The {{ goal_current }} cannot be set to a value greater than the Current Limit. If a value greater than this limit is set, returned status packets will include a Data Limit Error in the Error field.


| Unit     | Range     | Description                                                                    |
| :------: | :-------: | :----------------------------------------------------------------------------: |
| 0.01 [A] | 0 ~ 2,240 | 1,000 = 10[A], 10[A] current limit<br />2,240 = 20.8[A], 20.8[A] current limit |

**Note** : Continuous currents exceeding the rated 10[A] can damage the actuator, and will trigger an Overload Error to protect the device. Only use currents exceeding the rated value for momentary periods.
{: .notice}
