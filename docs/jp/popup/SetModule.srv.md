---
layout: popup
---

- File: `robotis_controller_msgs/SetModule.srv`

- Service Definition
 ```
 string module_name
 ---
 bool result
 ```

- Description
A service to read the states of all joints.

  - Request
    * `module_name`  
&emsp;&emsp; module name that user want to change to  

  - Response
    * `result`  
&emsp;&emsp; 
