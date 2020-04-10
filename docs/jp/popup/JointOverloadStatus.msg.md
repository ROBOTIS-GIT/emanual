---
layout: popup
---

- File: `thormang3_alarm_module_msgs/JointOverloadStatus.msg`

- Message Definition
 ```
std_msgs/Header header
string[]        name
int16[]         status
int16[]         warning_count
int16[]         error_count
 ```

- Description  
When the event occurs, thormang3_alarm_module_msgs publishs this message.

    * `header`  
&emsp;&emsp; header for time stamp  
    * `name`
&emsp;&emsp; joint list  
    * `status`  
&emsp;&emsp; overload status of each joint  
    * `warning_count`
&emsp;&emsp; accumulated warning count  
    * `error_count`
&emsp;&emsp; accumulated error count  
