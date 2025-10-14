{% assign pwm_limit= "[PWM Limit(64)]" %}

Goal PWM is used as an upper limiting value for the output PWM of the motor in all control modes. Supplied Goal PWM values cannot exceed the configured {{ pwm_limit }}

| Unit      | Range                               |  Control Mode                                      |               Description                  |
|:---------:|:-----------------------------------:| :---------------------------------------------------|:-------------------------------------------|
| 0.1 [%]  | - PWM Limit(64) ~ PWM Limit(64)     | Current control, Velocity control, Position control |  500 = Maximum output voltage limited to 50[%]<br />1,000 = Maximum output voltage limited to 100[%] |
