---
layout: popup
---

- File: `op3_offset_tuner_msgs/srv/GetPresentJointOffsetData.srv`

- Message Definition
 ```c
 ---
 JointOffsetPositionData[] present_data_array
 ```

- Description
The service to get offset data of each joint.

  - Request
    * `empty`

  - Response
    * `JointOffsetPositionData[] present_data_array`([op3_offset_tuner_msgs/JointOffsetPositionData])  
&emsp;&emsp; Array of the offset parameter data of each joint  

[op3_offset_tuner_msgs/JointOffsetPositionData]: /docs/en/platform/msgs/op3_JointOffsetPositionData_msg/#op3-jointoffsetpositiondata-msg
