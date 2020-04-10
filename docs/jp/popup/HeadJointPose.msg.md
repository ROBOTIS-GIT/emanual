---
layout: popup
---

- File: `thormang3_head_control_module_msgs/HeadJointPose.msg`

- Message Definition
```c
float64               	 	mov_time
sensor_msgs/JointState 		angle
```

- Description
This message is used for controlling of head joints.
Head joints move "angle" for "mov_time" sec(s).   

  * `float64 mov_time`  
  &emsp;&emsp; time(second) to move  
  * `sensor_msgs/JointState angle`  
  &emsp;&emsp; angle(radian) to move of head joints  
