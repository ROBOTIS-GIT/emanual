---
layout: popup
---

- File: `thormang3_walking_module_msgs/SetJointFeedBackGain.srv`


- Message Definition
 ```
 float32           updating_duration
 JointFeedBackGain feedback_gain
 ---
 int32 result

 int32 NO_ERROR                       = 0
 int32 NOT_ENABLED_WALKING_MODULE     = 2
 int32 PREV_REQUEST_IS_NOT_FINISHED   = 32
 ```

- Description
A service that can modify joint feedback gain.

  - Request
* ` float32      updating_duration`
&emsp;&emsp; Time duration when updating joint feedback gain.
&emsp;&emsp; The gains are gradually updated based on configured time.
&emsp;&emsp; 0 or negative value will update the joint feedback gain immediately.

* `JointFeedBackGain feedback_gain`([thormang3_walking_module_msgs/JointFeedBackGain](JointFeedBackGain.msg))
&emsp;&emsp; The joint feedback gain to be applied

  - Response
* ` int32 result`
&emsp;&emsp; Result of the "SetJointFeedBackGain" Service

| Name                           | Value | Description                                   |
|--------------------------------|-------|-----------------------------------------------|
| NO_ERROR                       | 0x00  | There is no error.                            |
| NOT_ENABLED_WALKING_MODULE     | 0x02  | The thormang3_walking_module is not enabled.  |
| PREV_REQUEST_IS_NOT_FINISHED   | 0x20  | The previous request is not finished.         |


<br>
[[&lt;&lt; Back|thormang3_walking_module_msgs]]
