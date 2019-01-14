---
layout: popup
---

- File : `open_manipulator_msgs/JointPosition.msg`

- Compact Message Definition

  ```c
    string   joint_name
    float64  position
    float64    max_accelerations_scaling_factor
    float64    max_velocity_scaling_factor
  ```

- Description
&emsp;&emsp; This topic msessage indicates the position of joint. 

  - `string joint_name`
&emsp;&emsp; The name of joints

  - `float64 max_accelerations_scaling_factor`
&emsp;&emsp; maximum acceleration scaling factor for making joint trajectory from MoveIt!

  - `float64 max_velocity_scaling_factor`
&emsp;&emsp; maximum velocity scaling factor for making joint trajectory from MoveIt!

[open_manipulator_msgs/JointPosition]: /docs/en/popup/open_manipulator_msgs_JointPosition/