---
layout: popup
---

- File: `open_manipulator_msgs/SetJointPosition.srv`

- Service Definition
 ```c
JointPosition joint_position
float64 path_time
---
bool is_planned
```

- Description
This service creates a trajectory in the joint space.

  - Request
    * `joint_position`
&emsp;&emsp; Goal position of the joints to create a trajectory.

    * `path_time`
&emsp;&emsp; Total time of the trajectory.

  - Response
    * `is_planned`
&emsp;&emsp; Whether the path is created.
