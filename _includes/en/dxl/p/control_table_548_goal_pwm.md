{% if page.ref=='rh_p12_rn' or page.ref=='rh_p12_rna' %}
Goal PWM(548) cannot exceed [PWM Limit(36)] and is used to limit the output power.  
Please refer to the Gain section in order to see how Goal PWM(548) affects to internal controller.

{% else %}
In case of PWM Control Mode, both PID controller and Feedforward controller are deactivated while Goal PWM(548) value is directly controlling the motor through an Inverter.  
In other control modes, Goal PWM(548) is used to limit the output torque.  
Goal PWM(548) cannot exceed [PWM Limit(36)].  
Please refer to the Gain section in order to see how Goal PWM(548) affects to different control modes.
{% endif %}

|      Unit       |               Range                |
|:---------------:|:----------------------------------:|
| about 0.0498 [%] | -[PWM Limit(36)] ~ [PWM Limit(36)] |

[PWM Limit(36)]: #pwm-limit36
