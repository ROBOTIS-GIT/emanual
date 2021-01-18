These Gains are used in Position Control Mode and Extended Position Control Mode. Gains of device’s internal controller can be calculated from Gains of the Control Table as shown below. Position P Gain of device’s internal controller is abbreviated to K<sub>P</sub>P.

|                           |  Controller Gain  |   Range    |        Description         |
|:-------------------------:|:-----------------:|:----------:|:--------------------------:|
|   Position D Gain(528)    |  K<sub>P</sub>D   | 0 ~ 32,767 |  Position Derivative Gain  |
|   Position I Gain(530)    |  K<sub>P</sub>I   | 0 ~ 32,767 |   Position Integral Gain   |
|   Position P Gain(532)    |  K<sub>P</sub>P   | 0 ~ 32,767 | Position Proportional Gain |
| Feedforward 1st Gain(538) | K<sub>FF1st</sub> | 0 ~ 32,767 | Velocity Feedforward Gain  |

Below figure is a block diagram describing the position controller in Position Control Mode and Extended Position Control Mode. When the instruction is received by the device, it takes following steps until driving the device.

{% capture position_gain_ex1 %}
1. An Instruction from the user is transmitted via communication bus, then registered to Goal Position(564).
2. Goal Position(564) is converted to desired position trajectory and desired velocity trajectory by Profile Velocity(560) and Profile Acceleration(556).
3. The desired position trajectory and desired velocity trajectory is stored at Position Trajectory(588) and Velocity Trajectory(584) respectively.
4. Feedforward and PID controller calculate PWM output for the motor based on desired trajectories.
5. Goal PWM(548) sets a limit on the calculated PWM output and decides the final PWM value.
6. The final PWM value is applied to the motor through an Inverter, and the device is driven.
7. Results are stored at Present Position(580), Present Velocity(576), Present PWM(572) and Present Current(574).
{% endcapture %}

<div class="notice--success">{{ position_gain_ex1 | markdownify }}</div>

![](/assets/images/dxl/pro/proplus_position_controller.png)

**NOTE** : In case of PWM Control Mode, both PID controller and Feedforward controller are deactivated while Goal PWM(548) value is directly controlling the motor through an Inverter. In this manner, users can directly control the supplying voltage of the motor.
{: .notice}

**NOTE** : K<sub>a</sub> is an Anti-windup Gain that cannot be modified by users. For more details about the PID controller and Feedforward controller, please refer to the [PID Controller](http://en.wikipedia.org/wiki/PID_controller) and [Feed Forward](https://en.wikipedia.org/wiki/Feed_forward_(control)).
{: .notice}
