---
layout: popup
---

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

  * `StepPositionData position_data`([thormang3_walking_module_msgs/StepPositionData])
&emsp;&emsp; Position related Step Data Parameter
  * `StepTimeData  time_data` ([thormang3_walking_module_msgs/StepTimeData])
&emsp;&emsp; Time related Step Data Parameter

[thormang3_walking_module_msgs/StepPositionData]: /docs/en/platform/msgs/StepPositionData_msg/#steppositiondata-msg
[thormang3_walking_module_msgs/StepTimeData]: /docs/en/platform/msgs/StepTimeData_msg/#steptimedata-msg
[thormang3_walking_module]:   /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3-walking-module
