---
layout: popup
---

- File: `thormang3_walking_module_msgs/GetReferenceStepData.srv`

- Message Definition

 ```
 ---
 StepData reference_step_data
 ```


- Description
A service that acquires current status of THORMANG3 from the [thormang3_walking_module](thormang3_walking_module).
System time and pose of current [thormang3_walking_module](thormang3_walking_module) are provided in StepData format.
&emsp;

  - Request
* `empty`
&emsp;&emsp;

  - Response
* `StepData reference_step_data`([thormang3_walking_module_msgs/StepData](StepData.msg))
&emsp;&emsp; Reference Step Data

<br>
[[&lt;&lt; Back|thormang3_walking_module_msgs]]
