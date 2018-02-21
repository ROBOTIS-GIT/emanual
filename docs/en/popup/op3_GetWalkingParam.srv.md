---
layout: popup
---

- File: `op3_walking_module_msgs/GetWalkingParam.srv`

- Message Definition
 ```
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
* `WalkingParam parameters`([op3_walking_module_msgs/WalkingParam]{: .popup})   
&emsp;&emsp; Parameters that are appplied on current op3_walking_module.   
&emsp;&emsp; For details, refer to [WalkingParam.msg].  


[op3_walking_module_msgs/WalkingParam]: /docs/en/popup/op3_WalkingParam.msg/
[WalkingParam.msg]: /docs/en/popup/op3_WalkingParam.msg/
