In case of PWM Control Mode, both PID controller and Feedforward controller are deactivated while Goal PWM(100) value is directly controlling the motor through an Inverter. In other control modes, this value is used to limit PWM value. This value cannot exceed PWM Limit(36). Please refer to the Gain section in order to see how Goal PWM(100) affects to different control modes.

| Range  | Description |
| :----: | :---------: |
| -PWM Limit(36) ~ PWM Limit(36) | Initial Value of PWM Limit(36) : ‘885’ |
