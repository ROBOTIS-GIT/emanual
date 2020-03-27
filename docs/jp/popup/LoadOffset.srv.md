---
layout: popup
---

- File: `robotis_controller_msgs/LoadOffset.srv`

- Service Definition
 ```
 ---
 string file_path
 ---
 bool result
 ```

- Description
A service to read the states of all joints.

  - Request
    * `file_path`   
&emsp;&emsp; offset file path to re-load  

  - Response
    * `result`   
&emsp;&emsp; 
