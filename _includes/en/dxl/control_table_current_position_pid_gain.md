Below figure is a block diagram describing the current-based position controller in Current-based Position Control Mode. As Current-based Position Control Mode is quite similar to Position Control Mode, differences will be focused in the following steps. The differences are highlighted with a green marker in the block diagram as well.
1. Feedforward and PID controller calculates desired current based on desired trajectory.
2. [Goal Current(102)] decides the final desired current by setting a limit on the calculated desired current.
3. Current controller calculates PWM output for the motor based on the final desired current.
4. [Goal PWM(100)] sets a limit on the calculated PWM output and decides the final PWM value.
5. The final PWM value is applied to the motor through an Inverter, and the horn of DYNAMIXEL is driven.
6. Results are stored at [Present Position(132)], [Present Velocity(128)], [Present PWM(124)] and [Present Current(126)].

![](/assets/images/dxl/current_position_controller_pid_gain.jpg)

**NOTE** : K<sub>a</sub> is an Anti-windup Gain that cannot be modified by users.  
For more details about the PID controller and Feedforward controller, please refer to the [PID Controller](http://en.wikipedia.org/wiki/PID_controller) and [Feed Forward](https://en.wikipedia.org/wiki/Feed_forward_(control)).
{: .notice}
