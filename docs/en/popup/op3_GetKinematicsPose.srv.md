---
layout: popup
---

- File: `online_walking_module_msgs/GetKinematicsPose.srv`

- Message Definition

 ```c
 string    name
 ---
 op3_online_walking_module_msgs/KinematicsPose pose
 ```

- Description  
This service acquires parameters that are applied on op3_online_walking_module.  

  - Request  
    * ` string    name`   
&emsp;&emsp; group name (such as body, left_foot, right_foot)

  - Response
    * `KinematicsPose pose`([op3_online_walking_module_msgs/KinematicsPose])     
&emsp;&emsp; For details, refer to [KinematicsPose.msg].


[op3_online_walking_module_msgs/KinematicsPose]: /docs/en/platform/msgs/op3_KinematicsPose_msg/#op3-kinematicspose-msg
[KinematicsPose.msg]: /docs/en/platform/msgs/op3_KinematicsPose_msg/#op3-kinematicspose-msg
