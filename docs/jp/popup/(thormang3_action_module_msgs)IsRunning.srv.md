---
layout: popup
---

- File: `thormang3_action_module_msgs/IsRunning.srv`

- Message Definition

 ```
 ---
 bool is_running
 ```

- Description
A service that identifies whether THORMANG3's action is being played or not.

  - Request
* `empty`

  - Response
* `bool is_running`
&emsp;&emsp; True will be returned if THORMANG3's action is being played. Otherwise, False will be returned.
