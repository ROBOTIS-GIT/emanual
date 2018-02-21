---
layout: popup
---

- File: `op3_online_walking_module_msgs/Step2D.msg`

- Message Definition
 ```
 geometry_msgs/Pose2D step2d   # step pose as relative offset to last leg

 uint8 moving_foot   

 uint8 LEFT_FOOT_SWING  = 1 # Left foot constant
 uint8 RIGHT_FOOT_SWING = 2 # Right foot constant
 uint8 STANDING         = 3 # Standing constant
 
 ```

- Description

* `step2d`   
&emsp;&emsp; foot step data      
* `moving_foot`    
&emsp;&emsp; swing leg   
