---
layout: popup
---

- File: `op3_action_module_msgs/IsRunning.srv`

- Message Definition
 ```
 ---
 bool is_running
 ```

- Description
A service that identifies whether OP3 is playing the action or not.  

  - Request  
* `empty`   

  - Response
* `bool is_running`   
&emsp;&emsp; True will be returned if OP3 is playing the action. Otherwise, False will be returned.   



