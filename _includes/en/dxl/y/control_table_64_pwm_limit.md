{% assign goal_pwm= "[Goal PWM(524)]" %}
PWM Limit is used to configure the maximum PWM output by the servo. In all control modes, the servo will be limited a maximum PWM output equal to the configured PWM limit, and in PWM mode the {{ goal_pwm }} cannot be set to a value higher than the configured PWM Limit. Reducing the PWM limit will limit the maximum output torque and speed of the servo.

| Unit    | Range     | Description                                                     |
| :-----: | :-------: | :-------------------------------------------------------------: |
| 0.1 [%] | 0 ~ 1,000 | 500 = PWM Duty 50[%] Output<br />1,000 = PWM Duty 100[%] Output |

**Caution** : If the input voltage to the servo is less than 24v, output will be limited to the maximum input voltage.
{: .notice--warning}
