---
layout: popup
---

- File: `op3_offset_tuner_msgs/srv/GetPresentJointOffsetData.srv`

- Message Definition
 ```
 ---
 JointOffsetPositionData[] present_data_array
 ```

- Description
The service to get offset data of each joint.

  - Request
* `empty`

  - Response
* `JointOffsetPositionData[] present_data_array`([op3_offset_tuner_msgs/JointOffsetPositionData](op3_JointOffsetPositionData.msg))  
&emsp;&emsp; Array of the offset parameter data of each joint  

<br>[&lt;&lt; Back](op3_offset_tuner_msgs.md)
