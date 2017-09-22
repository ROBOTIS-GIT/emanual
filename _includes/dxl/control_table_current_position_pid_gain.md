Below figure is a block diagram describing the current-based position controller in Current-based Position Control Mode. As Current-based Position Control Mode is quite similar to Position Control Mode, differences will be focused in the following steps. The differences are highlighted with a green marker in the block diagram as well.
1. Feedforward and PID controller calculates target current based on target trajectory.
2. Goal Current(102) decides the final target current by setting a limit on the calculated target current.
3. Current controller calculates PWM output for the motor based on the final target current.
4. Goal PWM(100) sets a limit on the calculated PWM output and decides the final PWM value.
5. The final PWM value is applied to the motor through an Inverter, and the horn of DYNAMIXEL is driven.
6. Results are stored at Present Position(132), Present Velocity(128), Present PWM(124) and Present Current(126).

![](/emanual/assets/images/dxl/current_position_controller_pid_gain.jpg)
