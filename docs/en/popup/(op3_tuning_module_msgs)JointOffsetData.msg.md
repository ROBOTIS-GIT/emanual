---
layout: popup
---

- File: `op3_tuning_module_msgs/JointOffsetData.msg`

- Message Definition
 ```c
 string   joint_name
 float64  goal_value
 float64  offset_value
 int32    p_gain
 int32    i_gain
 int32    d_gain
 ```

- Description

    * `joint_name`   
&emsp;&emsp; name of joint  
    * `goal_value`    
&emsp;&emsp; goal position of joint  
    * `offset_value`    
&emsp;&emsp; offset position of joint  
    * `p_gain`    
&emsp;&emsp; position p gain of joint   
    * `i_gain`    
&emsp;&emsp; position p gain of joint  
    * `d_gain`    
&emsp;&emsp; position p gain of joint  
