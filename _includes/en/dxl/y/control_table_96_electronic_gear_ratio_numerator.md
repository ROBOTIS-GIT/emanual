The Electronic Gear Ratio used in [Present Velocity(548)], [Present Position(552)], [Goal Velocity(528)], [Goal Position(532)], [Position Trajectory(560)], [Velocity Trajectory(564)] can be configured by using the Electronic Gear Ratio control table item. This adjusts the control input's pulse units to the desired scale at the output. The Electronic Gear Ratio is applied as follows when used in Position Control Mode.

![](/assets/images/dxl/y/dy_equation_1_en.jpg)

![](/assets/images/dxl/y/electronic_gear.PNG)

Here is an example of electronic gear ratio configuration:

Re: Electronic Gear Ratio   R: Actual Gear Ratio  L: Ball Screw Lead

| System Form                        | Setting Unit  | Description                             |
|:----------------------------------:|:-------------:|:----------------------------------------|
| Direct Drive System                | 0.01 [deg]    | Resolution of DYNAMIXEL-Y: 524,288 [pulse/rev]<br />![](/assets/images/dxl/y/dy_equation_2.jpg)  |
| Gearbox Attachment<br />R = 100:1  | 0.01 [deg]    | Resolution of DYNAMIXEL-Y: 524,288 [pulse/rev]<br />![](/assets/images/dxl/y/dy_equation_2.jpg)  |
| Ball Screw System<br />L: 10mm/rev | 0.01 [mm]     | DYNAMIXEL-Y Pulse per 1Rev = 524,288<br />Resolution of DYNAMIXEL-Y: 524,288 [pulse/rev]<br />![](/assets/images/dxl/y/dy_equation_3.jpg)  |
