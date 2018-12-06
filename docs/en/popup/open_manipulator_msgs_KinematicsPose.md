---
layout: popup
---

- File : `open_manipulator_msgs/KinematicsPose.msg`

- Compact Message Definition

  ```c
    geometry_msgs/Pose  pose
    float64    max_accelerations_scaling_factor
    float64    max_velocity_scaling_factor
    float64    tolerance
  ```

- Description
&emsp;&emsp; This topic msessage indicates the pose of the end-effector in the task space. The end-effector is included in topic name.

  - `geometry_msgs/Pose pose`
&emsp;&emsp; The kinematics pose of the OpenManipulator end-effector in the task space.

  - `float64 max_accelerations_scaling_factor`
&emsp;&emsp; 

  - `float64 max_velocity_scaling_factor`
&emsp;&emsp; 

  - `float64 tolerance`
&emsp;&emsp; 

[open_manipulator_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_KinematicsPose/