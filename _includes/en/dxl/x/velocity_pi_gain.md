The Velocity PI Gains(76, 78) are the configurable gain settings for the DYNAMIXEL PID controller in Velocity Mode.

|                     | Controller Gain |                   Conversion Equations                   |   Range    | Description |
|:-------------------:|:---------------:|:--------------------------------------------------------:|:----------:|:-----------:|
| Velocity I Gain(76) | K<sub>V</sub>I  | K<sub>V</sub>I = K<sub>V</sub>I<sub>(TBL)</sub> / 65,536 | 0 ~ 16,383 |   I Gain    |
| Velocity P Gain(78) | K<sub>V</sub>P  |  K<sub>V</sub>P = K<sub>V</sub>P<sub>(TBL)</sub> / 128   | 0 ~ 16,383 |   P Gain    |

When an instruction transmitted from the user is received by a DYNAMIXEL servo, it takes the following steps to generate a trajectory and execute a motion.
1. An Instruction from the user is transmitted via the DYNAMIXEL bus, then written to [Goal Velocity(104)].
2. [Goal Velocity(104)] is converted to planned velocity trajectory by the configured [Profile Acceleration(108)].
3. The desired velocity trajectory is stored at [Velocity Trajectory(136)].
4. The PI controller calculates PWM output for the motor based on the desired velocity trajectory.
5. [Goal PWM(100)] sets a limit on the calculated PWM output and decides the final PWM value.
6. The final PWM value is applied to the motor through an Inverter, and the horn of the DYNAMIXEL is driven.
7. Results are stored at [Present Position(132)], [Present Velocity(128)], [Present PWM(124)] and {% if page.product_group=='dxl_xl430' %}[Present Load(126)]{% else %}[Present Current(126)]{% endif %}.

The below figure is a block diagram describing the velocity controller in Velocity Control Mode. 
![](/assets/images/dxl/velocity_controller_pi_gain.jpg)


**NOTE** : K<sub>a</sub> Anti-windup Gain and &beta; are conversion coefficients of position and velocity that cannot be modified by users. For more information about PID controllers in general, please refer to the [PID Controller article on Wikipedia](http://en.wikipedia.org/wiki/PID_controller).
{: .notice}
