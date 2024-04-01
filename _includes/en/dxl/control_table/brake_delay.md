Brake Delay allows the configuration of the delay time between torque being enabled or disabled and the brake system engaging, and Goal Update Delay allows configuration of the time between the brake disengaging and the controller updating registered goal values.

| Address|   Label           | Unit | Range      | Description                                                                                |
|:------:|:-----------------:|:----:|:----------:|:-------------------------------------------------------------------------------------------| 
| 106    | Brake Delay       | [ms] | 0 ~ 32,767 |Torque ON: The brakes will be released (106)[ms] after the [Torque Enable(512)] value is changed to 1.<br>Torque OFF: The motor controller will turn off 100[ms] after the brake is enabled. |
| 108    | Goal Update Delay | [ms] | 0 ~ 32,767 | Updating of Goal Position, Velocity, Current, and PWM values begins Goal Update Delay[ms] after brake release.  |
 


