The Velocity PI Gains(76, 78) indicate gains of Velocity Control Mode.  
Gains of DYNAMIXEL’s internal controller can be calculated from Gains of the Control Table as shown below.  
The constant in each equations include sampling time.  
Velocity P Gain of DYNAMIXEL’s internal controller is abbreviated to K<sub>V</sub>P and that of the Control Table is abbreviated to K<sub>V</sub>P<sub>(TBL)</sub>.

|                     | Controller Gain |                   Conversion Equations                   |   Range    | Description |
|:-------------------:|:---------------:|:--------------------------------------------------------:|:----------:|:-----------:|
| Velocity I Gain(76) | K<sub>V</sub>I  | K<sub>V</sub>I = K<sub>V</sub>I<sub>(TBL)</sub> / 65,536 | 0 ~ 16,383 |   I Gain    |
| Velocity P Gain(78) | K<sub>V</sub>P  |  K<sub>V</sub>P = K<sub>V</sub>P<sub>(TBL)</sub> / 128   | 0 ~ 16,383 |   P Gain    |

Below figure is a block diagram describing the velocity controller in Velocity Control Mode. When the instruction transmitted from the user is received by DYNAMIXEL, it takes following steps until driving the horn.
1. An Instruction from the user is transmitted via DYNAMIXEL bus, then registered to [Goal Velocity(104)].
2. [Goal Velocity(104)] is converted to desired velocity trajectory by [Profile Acceleration(108)].
3. The desired velocity trajectory is stored at [Velocity Trajectory(136)].
4. PI controller calculates PWM output for the motor based on the desired velocity trajectory.
5. [Goal PWM(100)] sets a limit on the calculated PWM output and decides the final PWM value.
6. The final PWM value is applied to the motor through an Inverter, and the horn of DYNAMIXEL is driven.
7. Results are stored at [Present Position(132)], [Present Velocity(128)], [Present PWM(124)] and {% if page.product_group=='dxl_xl430' %}[Present Load(126)]{% else %}[Present Current(126)]{% endif %}.

![](/assets/images/dxl/velocity_controller_pi_gain.jpg)


**NOTE** : K<sub>a</sub> stands for Anti-windup Gain and &beta; is a conversion coefficient of position and velocity that cannot be modified by users. For more details about the PID controller, please refer to the [PID Controller at wikipedia](http://en.wikipedia.org/wiki/PID_controller).
{: .notice}
