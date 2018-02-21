---
layout: popup
---

- File: `op3_online_walking_module_msgs/FootStepArray.msg`

- Message Definition

 ```c
   int32 LEFT_FOOT  = 0 # Left foot constant
   int32 RIGHT_FOOT = 1 # Right foot constant

   int32[]                moving_foot
   geometry_msgs/Pose2D[] data

 ```

- Description

    * `moving_foot`   
&emsp;&emsp; swing foot name      
    * `data`    
&emsp;&emsp; target pose   
