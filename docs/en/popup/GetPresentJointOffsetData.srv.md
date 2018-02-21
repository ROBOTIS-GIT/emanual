---
layout: popup
---

- File: `thormang3_offset_tuner_msgs/srv/GetPresentJointOffsetData.srv`

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
* `JointOffsetPositionData[] present_data_array`([thormang3_offset_tuner_msgs/JointOffsetPositionData]{: .popup})
&emsp;&emsp; Array of the offset parameter data of each joint

[thormang3_offset_tuner_msgs/JointOffsetPositionData] :/docs/en/popup/JointOffsetPositionData.msg/
