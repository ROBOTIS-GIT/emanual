---
layout: popup
---

- File: `op3_online_walking_module_msgs/FootStepCommand.msg`

- Message Definition

 ```c
 string  command
 string  start_leg
 int32   step_num
 float64 step_time
 float64 step_length
 float64 side_length
 float64 step_angle
 ```

- Description

    * `command`   
&emsp;&emsp; walking command for direction      
    * `start_leg`    
&emsp;&emsp; leg name for first step   
    * `step_num`    
&emsp;&emsp; step number   
    * `step_time`    
&emsp;&emsp; walking time per one step   
    * `step_length`    
&emsp;&emsp; walking distance per one step    
    * `side_length`    
&emsp;&emsp; walking distance per one side step    
    * `step_angle`    
&emsp;&emsp; walking angle per one rotation step       
