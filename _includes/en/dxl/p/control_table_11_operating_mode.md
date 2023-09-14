Configure the selected operating mode of your DYNAMIXEL.

| Value      | Operating Mode                 | Description                                                                                                                                                                                                                   |
|:-----------|:-------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Current Control Mode           | This mode controls only current/torque regardless of speed and position. This mode is ideal for a gripper or other system that only requires torque control or a system that has additional velocity/position controllers. |
| 1          | Velocity Control Mode          | This mode controls velocity and current, but does not control position.                                                                                                                                                       |
| 3(Default) | Position Control Mode          | This mode controls position, velocity and current. The position range is configured by the [Max Position Limit(48)] and the [Min Position Limit(52)] control table items.                                                                |
| 4          | Extended Position Control Mode | This mode is similar to Position Control Mode, but is not limited by the Position Limit control table items. This allows multi turn position based control for applications requiring continuous rotation.           |
| 16         | PWM(Voltage) Control Mode      | This mode allows direct control over the PWM signal sent to the motor output.                                                                                                                                                                                   |

{% include en/dxl/control_table_opmode_note.md %}

