---
layout: popup
---

- File: `manipulation_module_msgs/GetJointPose.srv`

- Service Definition
 ```
 string    joint_name
 ---
 float64   joint_value
 ```

- Description
A service to read a pose of a specific joint.

  - Request
* `joint_name`
&emsp;&emsp; Name of the joint to request pose data.

  - Response
* `joint_value`
&emsp;&emsp; Pose value from the joint.



