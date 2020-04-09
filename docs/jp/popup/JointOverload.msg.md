---
layout: popup
---

- File: `thormang3_alarm_module_msgs/JointOverload.msg`

- Message Definition
 ```
std_msgs/Header header
string[]        name
float64[]       overload
float64[]       current
 ```

- Description
thormang3_alarm_module sends a topic about overload and current at each process time.

    * `header`  
&emsp;&emsp; header for time stamp  
    * `name`
&emsp;&emsp; joint list  
    * `overload`  
&emsp;&emsp; caculated overload of each joint  
    * `current`
&emsp;&emsp; present current of each joint  
