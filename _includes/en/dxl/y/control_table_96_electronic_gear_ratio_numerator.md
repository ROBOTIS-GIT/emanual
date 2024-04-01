{% if page.product_group=='dxl_y_m' %}
{% assign present_velocity= "[Present Velocity(548)]" %}
{% assign present_position= "[Present Position(552)]" %}
{% assign goal_velocity= "[Goal Velocity(528)]" %}
{% assign goal_position= "[Goal Position(532)]" %}
{% assign position_trajectory= "[Position Trajectory(560)]" %}
{% assign velocity_trajectory= "[Velocity Trajectory(564)]" %}
{% endif %}

The Electronic Gear Ratio allows the configuration of the number of motor pulses to your desired output scale, to ensure accurate position control even when the actuator is paired with an external reduction. The Electronic Gear Ratio is applied during the calculation of {{ present_velocity }}, {{ present_position }}, {{ goal_velocity }}, {{ goal_position }}, {{ position_trajectory }} and {{ velocity_trajectory }} calculation. The Electronic Gear Ratio is applied as follows when used in Position Control Mode:

![](/assets/images/dxl/y/dy_equation_1_en.jpg)

![](/assets/images/dxl/y/electronic_gear.PNG)

Here is an example of electronic gear ratio configuration:

Re: Electronic Gear Ratio   R: Actual Gear Ratio  L: Ball Screw Lead

| System Form                        | Setting Unit  | Description                             |
|:----------------------------------:|:-------------:|:----------------------------------------|
| Direct Drive System                | 0.01 [deg]    | DYNAMIXEL-Y Resolution: 524,288 [pulse/rev]<br />![](/assets/images/dxl/y/dy_equation_2.jpg)  |
| Gearbox Attachment<br />R = 100:1  | 0.01 [deg]    | DYNAMIXEL-Y Resolution: 524,288 [pulse/rev]<br />![](/assets/images/dxl/y/dy_equation_2.jpg)  |
| Ball Screw System<br />L: 10mm/rev | 0.01 [mm]     | DYNAMIXEL-Y Resolution: 524,288<br /><br />![](/assets/images/dxl/y/dy_equation_3.jpg)  |
