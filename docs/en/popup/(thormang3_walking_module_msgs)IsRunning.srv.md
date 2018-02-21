---
layout: popup
---

- File: `thormang3_walking_module_msgs/IsRunning.srv`

- Message Definition

 ```
 ---
 bool is_running
 ```

- Description
A service that identifies whether THORMANG3 is walking or not.

  - Request
* `empty`

  - Response
* `bool is_running`
&emsp;&emsp; True will be returned if THORMANG3 is walking. Otherwise, False will be returned.
