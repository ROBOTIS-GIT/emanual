---
layout: popup
---

- File : `open_manipulator_msgs/OpenManipulatorState.msg`

- Compact Message Definition

  ```c
    ########################################
    # CONSTANTS
    ########################################
    string IS_MOVING = "IS_MOVING"
    string STOPPED = "STOPPED"
    string ACTUATOR_ENABLED = "ACTUATOR_ENABLED"
    string ACTUATOR_DISABLED = "ACTUATOR_DISABLED"

    ########################################
    # Messages
    ########################################
    string open_manipulator_moving_state
    string open_manipulator_actuator_state
  ```

- Description
&emsp;&emsp; This topic msessage indicates the status of OpenMANIPULATOR.

  * `string open_manipulator_moving_state`
&emsp;&emsp; This parameter indicates whether the torque of the actuator(Dynamixel) is enable("ACTUATOR_ENABLE") or disable("ACTUATOR_DISABLE").

  * `string open_manipulator_actuator_state`
&emsp;&emsp; This parameter indicates whether OpenMANIPULATOR is "MOVING" or "STOPPED" along the trajectory.
