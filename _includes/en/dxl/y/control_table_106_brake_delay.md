Sets the delay time until Brake operation and Goal Update are activated.

| Address|   Label           | Unit | Range      | Description                                                                                |
|:------:|:-----------------:|:----:|:----------:|:-------------------------------------------------------------------------------------------| 
| 106    | Brake Delay       | [ms] | 0 ~ 32,767 |Torque ON: Brake Release occurs after Brake Delay (106)[ms] from the time that the [Torque Enable(512)] value is changed to 1.<br>Torque OFF: The controller turns OFF 100[ms] after the Brake Lock is enabled. |
| 108    | Goal Update Delay | [ms] | 0 ~ 32,767 | Update of Goal Position, Velocity, Current, and PWM values begins after Goal Update Delay(108)[ms] from the point of Brake Release.  |
 


