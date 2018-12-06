---
layout: popup
---

- File: `open_manipulator_msgs/SetKinematicsPose.srv`

- Service Definition
 ```c
KinematicsPose kinematics_pose
float64 path_time
---
bool is_planned
```

- Description
This service creates a trajectory in the task space.

  - Request
    * `KinematicsPose kinematics_pose`
&emsp;&emsp; The kinematics pose of the OpenManipulator end-effector relative to the base frame.

    * `float64 path_time`
&emsp;&emsp; Total time of the trajectory.

  - Response
    * `bool is_planned`
&emsp;&emsp; Whether the path is created.

[open_manipulator_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_KinematicsPose/