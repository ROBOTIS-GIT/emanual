{% assign error_code= "[Error Code(153)]" %}
{% assign torque_enable= "[Torque Enable(512)]" %}
{% assign goal_pwm= "[Goal PWM(524)]" %}
{% assign goal_current= "[Goal Current(526)]" %}
{% assign goal_velocity= "[Goal Velocity(528)]" %}
{% assign goal_position= "[Goal Position(532)]" %}

Controller State allows the monitoring of the current activity state of the internal motor controller.

| Value |   Label             | Description                                                |
|:-----:|:-------------------:|:-----------------------------------------------------------|
| 0     | Start               | Power has been supplied to the device.                     |
| 1     | Init System         | Device initialization in progress.                         |
| 2     | Inverter OFF        | Torque is OFF, The inverter is turned OFF.              |
| 3     | Dynamic Brake       | Torque is OFF, Dynamic Brake is active.                 |
| 4     | Processing Torque ON   | Operations to enable Torque are in progress.                           |
| 5     | Running             | Torque is ON.                                           |
| 6     | Processing Torque OFF  | Operations to disable Torque are in progress.                          |
| 7     | Detected HW Fault   | A Hardware issue has been detected, and the servo is entering a fault state.                                   |
| 8     | HW Fault            | A Hardware issue has occurred. The issue can be identified using the {{ error_code }} control table item. |


**Note** : When the Controller State is Processing Torque On(4) or Processing Torque Off(6), writing values to {{ torque_enable }}, {{ goal_pwm }}, {{ goal_current }}, {{ goal_velocity }}, {{ goal_position }} cannot be processed, and will result in a "Result Fail" return status packet.
{: .notice}
