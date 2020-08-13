These gains are used in Position Control Mode and Extended Position Control Mode. Gains of DYNAMIXEL’s internal controller can be calculated from Gains of the Control Table as shown below. The constant in each equations includes sampling time. Position P Gain of DYNAMIXEL’s internal controller is abbreviated to K<sub>P</sub>P and that of the Control Table is abbreviated to K<sub>P</sub>P<sub>(TBL)</sub>.

|                          |  Controller Gain  |                   Conversion Equations                   |   Range    | Description                   |
|:------------------------:|:-----------------:|:--------------------------------------------------------:|:----------:|-------------------------------|
|   Position D Gain(80)    |  K<sub>P</sub>D   |   K<sub>P</sub>D = K<sub>P</sub>D<sub>(TBL)</sub> / 16   | 0 ~ 16,383 | D Gain                        |
|   Position I Gain(82)    |  K<sub>P</sub>I   | K<sub>P</sub>I = K<sub>P</sub>I<sub>(TBL)</sub> / 65,536 | 0 ~ 16,383 | I Gain                        |
|   Position P Gain(84)    |  K<sub>P</sub>P   |  K<sub>P</sub>P = K<sub>P</sub>P<sub>(TBL)</sub> / 128   | 0 ~ 16,383 | P Gain                        |
| Feedforward 2nd Gain(88) | K<sub>FF2nd</sub> |                K<sub>FF2nd(TBL)</sub> / 4                | 0 ~ 16,383 | Feedforward Acceleration Gain |
| Feedforward 1st Gain(90) | K<sub>FF1st</sub> |                K<sub>FF1st(TBL)</sub> / 4                | 0 ~ 16,383 | Feedforward Velocity Gain     |

Below figure is a block diagram describing the position controller in Position Control Mode and Extended Position Control Mode. When the instruction from the user is received by DYNAMIXEL, it takes following steps until driving the horn.
1. An Instruction from the user is transmitted via DYNAMIXEL bus, then registered to [Goal Position(116)].
2. [Goal Position(116)] is converted to desired position trajectory and desired velocity trajectory by [Profile Velocity(112)] and [Profile Acceleration(108)].
3. The desired position trajectory and desired velocity trajectory is stored at [Position Trajectory(140)] and [Velocity Trajectory(136)] respectively.
4. Feedforward and PID controller calculate PWM output for the motor based on desired trajectories.
5. [Goal PWM(100)] sets a limit on the calculated PWM output and decides the final PWM value.
6. The final PWM value is applied to the motor through an Inverter, and the horn of DYNAMIXEL is driven.
7. Results are stored at [Present Position(132)], [Present Velocity(128)], [Present PWM(124)] and {% if page.product_group=='dxl_xl430' %}[Present Load(126)]{% else %}[Present Current(126)]{% endif %}.

![](/assets/images/dxl/position_controller_pid_gain.jpg)

{% capture pid_reference %}
**NOTE:**
- In case of PWM Control Mode, both PID controller and Feedforward controller are deactivated while [Goal PWM(100)](#goal-pwm100) value is directly controlling the motor through an inverter. In this manner, users can directly control the supplying voltage to the motor.
- K<sub>a</sub> is an Anti-windup Gain that cannot be modified by users.  
For more details about the PID controller and Feedforward controller, please refer to the [PID Controller](http://en.wikipedia.org/wiki/PID_controller) and [Feed Forward](https://en.wikipedia.org/wiki/Feed_forward_(control)).
{% endcapture %}
<div class="notice">{{ pid_reference | markdownify }}</div>
