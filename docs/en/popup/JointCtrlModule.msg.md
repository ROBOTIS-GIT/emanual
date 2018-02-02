---
layout: popup
---

- File: `robotis_controller_msgs/JointCtrlModule.msg`

- Message Definition
 ```
  string[] joint_name
  string[] module_name
 ```

- Description
 The message designates motion modules that controls specific joints.

* `joint_name`
&emsp;&emsp; Name of the joints to be designated with motion modules.

* `module_name`
&emsp;&emsp; Name of the motion module to control each joint.
