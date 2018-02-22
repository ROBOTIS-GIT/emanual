---
layout: popup
---

- File: `op3_walking_module_msgs/GetWalkingParam.srv`

- Message Definition
 ```c
 bool	         get_param
 ---
 WalkingParam     parameters
 ```

- Description
This service acquires parameters that are applied on current op3_walking_module.  

  - Request  
    * `bool get_param`   
&emsp;&emsp;

  - Response
    * `WalkingParam parameters`([op3_walking_module_msgs/WalkingParam])   
&emsp;&emsp; Parameters that are appplied on current op3_walking_module.   
&emsp;&emsp; For details, refer to [WalkingParam.msg].  


[op3_walking_module_msgs/WalkingParam]: /docs/en/platform/msgs/op3_WalkingParam_msg/#op3-WalkingParam-msg
[WalkingParam.msg]: /docs/en/platform/msgs/op3_WalkingParam_msg/#op3-WalkingParam-msg
