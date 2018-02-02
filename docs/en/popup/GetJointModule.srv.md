---
layout: popup
---

- File: `robotis_controller_msgs/GetJointModule.srv`

- Service Definition
 ```
 string[] joint_name
 ---
 string[] joint_name
 string[] module_name
 ```

- Description
This service obtains the name of motion module that controls each joint.

  - Request
* `joint_name`
&emsp;&emsp; Name of the joint to obtain control module.

  - Response
* `joint_name`
&emsp;&emsp; Name of the joint

* `module_name`
&emsp;&emsp; Name of the motion module that controls the joint
