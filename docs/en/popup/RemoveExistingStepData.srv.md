---
layout: popup
---

- File: `thormang3_walking_module_msgs/RemoveExistingStepData.srv`

- Message Definition
 ```
 ---
 int32 result
 ```

- Description
A service to delete existing StepData.

  - Request
    * `empty`

  - Response
    * ` int32 result`
&emsp;&emsp; Result of the "RemoveExistingStepData" Service

| Name                       | Value | Description                                    |
|----------------------------|-------|------------------------------------------------|
| NO_ERROR                   | 0x00  | There is no error.                             |
| ROBOT_IS_WALKING_NOW       | 0x400 | The Thormang3 is walking now.                  |
