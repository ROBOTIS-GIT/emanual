---
layout: popup
---

- File: `open_manipulator_msgs/GetJointPosition.srv`

- Service Definition
 ```c
  string planning_group
  ---
  JointPosition joint_position
```

- Description
This topic msessage receives the position of joint.

  - Request
    * `string planning_group`
&emsp;&emsp; Planning Group which set MoveIt! configuration

  - Response
    * `JointPosition joint_position`([open_manipulator_msgs/JointPosition])
&emsp;&emsp; Goal position of the joints to create a trajectory.


[open_manipulator_msgs/JointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/