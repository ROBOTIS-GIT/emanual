Operating Mode is used to configure the active DYNAMIXEL operating mode in use by the servo.


DYNAMIXEL-Y actuators support three control modes:

| Value      | Operating Mode        | Description                                                                                                                             |
|:-----------|:----------------------|:----------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Current Control Mode  | Controls current. Does not control velocity and position.                                                                               |
| 1          | Velocity Control Mode | Controls velocity and current. Does not control position.                                                                               |
| 3(Default) | Position Control Mode | Controls position, velocity, and current.<br>Movement is restricted to within the range defined by Max and Min [Position Limit(84)].    | 

The control block diagram for each control mode is as follows:

#### [Current Control Mode](#current-control-mode)
![](/assets/images/dxl/y/operating_mode_1_en.png)

#### [Velocity Control Mode](#velocity-control-mode)
![](/assets/images/dxl/y/operating_mode_2_en.png)

#### [Position Control Mode](#position-control-mode)
![](/assets/images/dxl/y/operating_mode_3_en.png)

**Note:** DYNAMIXEL-Y stores persistent Multi-turn information. Even if the power is turned off and on, or if a Reboot Instruction is used, the current Multi-turn position is accurately tracked through even manual rotations while the power is off, and the absolute position value is updated. The Multi-turn position can be reset to '0' using a Clear Instruction.
{: .notice}
