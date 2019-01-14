---
layout: popup
---

- File: `open_manipulator_msgs/SetJointPosition.srv`

- Service Definition
 ```c
string planning_group
JointPosition joint_position
float64 path_time
---
bool is_planned
```

- Description
This service creates a trajectory in the joint space.

  - Request
    * `string planning_group`
&emsp;&emsp; Planning Group which set MoveIt! configuration

    * `JointPosition joint_position`([open_manipulator_msgs/JointPosition])
&emsp;&emsp; Goal position of the joints to create a trajectory.

    * `float64 path_time`
&emsp;&emsp; Total time of the trajectory.

  - Response
    * `bool is_planned`
&emsp;&emsp; Whether the path is created.


[open_manipulator_msgs/JointPosition]: /docs/en/popup/open_manipulator_msgs_JointPosition/