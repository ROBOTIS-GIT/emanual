---
layout: popup
---

- File: `open_manipulator_msgs/GetKinematicsPose.srv`

- Service Definition
 ```c
  string planning_group
  string end_effector_name
  ---
  Header header
  KinematicsPose kinematics_pose
```

- Description
This service receives kinematics pose of end_effector in planning_group

  - Request
    * `string planning_group`
&emsp;&emsp; Planning Group which set MoveIt! configuration

    * `string end_effector_name`
&emsp;&emsp; End-Effector name which is relative to the base frame

  - Response
    * `KinematicsPose kinematics_pose`
&emsp;&emsp; The kinematics pose of the OpenMANIPULATOR end-effector relative to the base frame.


[open_manipulator_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
