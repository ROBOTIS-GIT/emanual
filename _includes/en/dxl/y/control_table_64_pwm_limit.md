This is the limit value of output PWM. A value greater than the PWM Limit (64) cannot be input in [Goal PWM(524)]. The PWM Limit(64) is a common output limit value applied to all control modes, and reducing the PWM output will decrease both the torque and speed of the device. For more details, please refer to the Gain section of the respective control mode.

| Unit    | Range     | Description                                                     |
| :-----: | :-------: | :-------------------------------------------------------------: |
| 0.1 [%] | 0 ~ 1,000 | 500 = PWM Duty 50[%] Output<br />1,000 = PWM Duty 100[%] Output |

**Caution** : If the voltage applied to the device is less than 24[V], it can output up to the applied voltage.
{: .notice--warning}