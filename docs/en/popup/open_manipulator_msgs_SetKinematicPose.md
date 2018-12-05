---
layout: popup
---

- File: `open_manipulator_msgs/SetKinematicPose.srv`

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
    * `kinematic_pose`
&emsp;&emsp; The kinematic pose of the OpenManipulator end-effector relative to the base frame.

    * `path_time`
&emsp;&emsp; Total time of the trajectory.

  - Response
    * `is_planned`
&emsp;&emsp; Whether the path is created.
