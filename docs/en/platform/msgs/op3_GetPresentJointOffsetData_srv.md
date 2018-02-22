---
layout: archive
lang: en
ref: msgs_op3_GetPresentJointOffsetData_srv
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/msgs/op3_GetPresentJointOffsetData_srv/
sidebar:
  title: MSGS
  nav: "msgs"
---

# [op3_GetPresentJointOffsetData_srv](#op3-getpresentjointoffsetdata-srv)

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
    * `JointOffsetPositionData[] present_data_array`([op3_offset_tuner_msgs/JointOffsetPositionData]{: .popup})  
&emsp;&emsp; Array of the offset parameter data of each joint  

[op3_offset_tuner_msgs/JointOffsetPositionData]: /docs/en/popup/op3_JointOffsetPositionData.msg/
