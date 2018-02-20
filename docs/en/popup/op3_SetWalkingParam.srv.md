---
layout: popup
---

- File: `op3_walking_module_msgs/SetWalkingParam.srv`

- Message Definition
 ```
 WalkingParam        parameters
 ---
 bool                result
 ```

- Description
This service configures parameters in `op3_walking_module` for walking control.  

  - Request  
* `WalkingParam parameters`([op3_walking_module_msgs/WalkingParam](op3_WalkingParam.msg))   
&emsp;&emsp; Walking paramters to be applied on `op3_walking_module`. For details, refer to [WalkingParam.msg](op3_WalkingParam.msg).

  - Response
* `bool result`   
&emsp;&emsp;


