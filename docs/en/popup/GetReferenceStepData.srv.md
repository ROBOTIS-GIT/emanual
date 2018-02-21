---
layout: popup
---

- File: `thormang3_walking_module_msgs/GetReferenceStepData.srv`

- Message Definition

 ```c
 ---
 StepData reference_step_data
 ```


- Description
A service that acquires current status of THORMANG3 from the [thormang3_walking_module].
System time and pose of current [thormang3_walking_module] are provided in StepData format.
&emsp;

  - Request
    * `empty`
&emsp;&emsp;

  - Response
    * `StepData reference_step_data`([thormang3_walking_module_msgs/StepData])
&emsp;&emsp; Reference Step Data



[thormang3_walking_module]: /docs/en/platform/thormang3/thormang3_ros_packages/#thormang3_walking_module
[thormang3_walking_module_msgs/StepData]: /docs/en/popup/StepData.msg/
