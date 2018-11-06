These values indicate Gains of Velocity Control Mode. Gains of the device's internal controller can be calculated from Gains of the Control Table as shown below. Velocity P Gain of the device's internal controller is abbreviated to K<sub>V</sub>P and that of the Control Table is abbreviated to K<sub>V</sub>P<sub>(TBL)</sub>.

|                           |  Controller Gain  |   Range    |          Description          |
|:-------------------------:|:-----------------:|:----------:|:-----------------------------:|
|   Velocity I Gain(524)    |  K<sub>V</sub>I   | 0 ~ 32,767 |    Velocity Integral Gain     |
|   Velocity P Gain(526)    |  K<sub>V</sub>P   | 0 ~ 32,767 |  Velocity Proportional Gain   |
| Feedforward 2nd Gain(536) | K<sub>FF1st</sub> | 0 ~ 32,767 | Acceleration Feedforward Gain |

Below figure is a block diagram describing the velocity controller in Velocity Control Mode. When the instruction is received by the device, it takes following steps until driving the device.

{% capture velocity_gain_ex1 %}
1. An Instruction from the user is transmitted via communication bus, then registered to Goal Velocity(552).
2. Goal Velocity(552) is converted to desired velocity trajectory by Profile Acceleration(556).
3. The desired velocity trajectory is stored at Velocity Trajectory(584).
4. PI controller calculates PWM output for the motor based on the desired velocity trajectory.
5. Goal PWM(584) sets a limit on the calculated PWM output and decides the final PWM value.
6. The final PWM value is applied to the motor through an Inverter, and the device is driven.
7. Results are stored at Present Position(580), Present Velocity(576), Present PWM(572) and Present Current(574).
{% endcapture %}

<div class="notice--success">{{ velocity_gain_ex1 | markdownify }}</div>

![](/assets/images/dxl/pro/proplus_velocity_controller.png)

**NOTE** : K<sub>v</sub>A stands for Anti-windup Gain that cannot be modified by users. For more details about the PID controller, please refer to the [PID Controller at wikipedia](http://en.wikipedia.org/wiki/PID_controller).
{: .notice}
