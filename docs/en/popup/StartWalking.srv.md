---
layout: popup
---

- File: `thormang3_walking_module_msgs/WalkingStart.srv`

- Message Definition
 ```
 ---
 int32 result
 ```

- Description
A service to start walking THORMANG3 with existing StepData.

  - Request
* `empty`

  - Response
* ` int32 result`
&emsp;&emsp; Result of the "WalkingStart" Service.

| Name                       | Value | Description                                  |
|----------------------------|-------|----------------------------------------------|
| NO_ERROR                   | 0x00  | There is no error.                           |
| NOT_ENABLED_WALKING_MODULE | 0x02  | The thormang3_walking_module is not enabled. |
| NO_STEP_DATA               | 0x10  | There is no step data.                       |
| ROBOT_IS_WALKING_NOW       | 0x400 | The Thormang3 is walking now.                |



