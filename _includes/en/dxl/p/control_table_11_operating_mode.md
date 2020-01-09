Operating mode of the device can be configured.

|Value|Operating Mode| Description     |
| :---- | :------------------------------ | :------------------------------------------- |
| 0 | Current Control Mode | The device only controls current(torque) regardless of speed and position. This mode is ideal for a gripper or a system that only uses current(torque) control or a system that has additional velocity/position controllers.|
| 1 | Velocity Control Mode | This mode controls velocity and current, but does not control position.|
| 3(Default) | Position Control Mode  | This mode controls position, velocity and current.|
| 4 | Extended Position Control Mode  | This mode is similar to the Position Control Mode, but does not limited by the Position Limits. Therefore, the control range will not be bounded between 0 ~ 360 [&deg;] which enables multi-turn position control.|
| 16 | PWM(Voltage) Control Mode | Directly controls with PWM(Voltage) signal.|

{% include en/dxl/control_table_opmode_note.md %}
