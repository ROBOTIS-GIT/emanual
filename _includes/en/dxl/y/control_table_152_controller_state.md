This indicates the current state of the internal controller.

| Value |   Label             | Description                                                |
|:-----:|:-------------------:|:-----------------------------------------------------------|
| 0     | Start               | Power has been supplied to the device.                     |
| 1     | Init System         | Device initialization in progress.                         |
| 2     | Inverter OFF        | Torque OFF state. The inverter is turned OFF.              |
| 3     | Dynamic Brake       | Torque OFF state. Dynamic Brake is active.                 |
| 4     | Process Torque ON   | Torque ON operation in progress.                           |
| 5     | Running             | Torque ON state.                                           |
| 6     | Process Torque OFF  | Torque OFF operation in progress.                          |
| 7     | Detected HW Fault   | Hardware issue detected.                                   |
| 8     | HW Fault            | Hardware issue. The issue can be identified through the [Error Code(153)]. |


**Note** : When the value of Controller State(152) is '4' Process Torque On, '6' Process Torque Off, writing values to [Torque Enable(512)], [Goal PWM(524)], [Goal Current(526)], [Goal Velocity(528)], [Goal Position(532)] will result in sending a Status Packet with a Result Fail through the Error field.
{: .notice}
