---
layout: archive
lang: en
ref: msgs_StepData_msg
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/msgs/StepData_msg/
sidebar:
  title: MSGS
  nav: "msgs"
---

# [StepData_msg](#stepdata-msg)

- File: `thormang3_walking_module_msgs/StepData.msg`

- Message Definition
 ```c
 StepPositionData position_data
 StepTimeData     time_data
 ```

- Description
The format of StepData used in the [thormang3_walking_module].
Users can define most parameters required for the StepData.
&emsp;

  * `StepPositionData position_data`([thormang3_walking_module_msgs/StepPositionData]{: .popup})
&emsp;&emsp; Position related Step Data Parameter
  * `StepTimeData  time_data` ([thormang3_walking_module_msgs/StepTimeData]{: .popup})
&emsp;&emsp; Time related Step Data Parameter

[thormang3_walking_module_msgs/StepPositionData]: /docs/en/popup/StepPositionData.msg
[thormang3_walking_module_msgs/StepTimeData]: /docs/en/popup/StepTimeData.msg
[thormang3_walking_module]:   /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-walking-module
