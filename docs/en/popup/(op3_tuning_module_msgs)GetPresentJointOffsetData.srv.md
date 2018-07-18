---
layout: popup
---

- File: `op3_tuning_module_msgs/GetPresentJointOffsetData.srv`

- Service Definition
 ```
 ---
 JointOffsetPositionData[] present_data_array
 ```

- Description
A service to read the states of all joints.

  - Request
    * none

  - Response
    * `present_data_array`  
&emsp;&emsp; States of all joints
