---
layout: popup
---

- File: `op3_walking_module_msgs/WalkingParam.msg`]
- Message Definition

 ```c
 ####### walking init pose #######
 float32 init_x_offset
 float32 init_y_offset
 float32 init_z_offset
 float32 init_roll_offset
 float32 init_pitch_offset
 float32 init_yaw_offset

 ####### time parameter #####
 float32 period_time
 float32 dsp_ratio
 float32 step_fb_ratio

 ########## walking parameter ########
 float32 x_move_amplitude
 float32 y_move_amplitude
 float32 z_move_amplitude
 float32 angle_move_amplitude
 bool move_aim_on

 ########## balance parameter ##########
 bool balance_enable
 float32 balance_hip_roll_gain
 float32 balance_knee_gain
 float32 balance_ankle_roll_gain
 float32 balance_ankle_pitch_gain
 float32 y_swap_amplitude
 float32 z_swap_amplitude
 float32 arm_swing_gain
 float32 pelvis_offset
 float32 hip_pitch_offset

 ########## gain parameter ##########
 int32 p_gain
 int32 i_gain
 int32 d_gain

 ```

- Description
These are the parameters used in the Walking Algorithm.  

**walking init pose**  
* ` float32 init_x_offset`
&emsp;&emsp; offset in the x-direction (front and back) [m]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image142.jpg)

* ` float32 init_y_offset`
&emsp;&emsp; offset in the y-direction (left and right) [m]  
&emsp;&emsp;  
![](/assets/images/platform/op3/op3_walking_module_image143.jpg)
* ` float32 init_z_offset`
&emsp;&emsp; offset in the z-direction (up and down) [m]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image144.jpg)
* ` float32 init_roll_offset`
&emsp;&emsp; roll offset (x-coordinate) [rad]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image145.jpg)
* ` float32 init_pitch_offset`
&emsp;&emsp; pitch offset (y-coordinate) [rad]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image146.jpg)
* ` float32 init_yaw_offset`
&emsp;&emsp; yaw offset (z-coordinate) [rad]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image2.gif)


**time parameter**  
* ` float32 period_time`
&emsp;&emsp; Time required for ROBOTIS-OP3 to complete two full steps (left and right foot) [ms]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image148.jpg)
* ` float32 dsp_ratio`
&emsp;&emsp; Time ratio of the period when both feet are touching the ground to the period of walking cycle.  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image149.jpg)

**walking parameter**  
* ` float32 x_move_amplitude`
&emsp;&emsp; Differential distance (x-direction) between ROBOTIS-OP3's left and right foot during walk [m]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image150.jpg)
* ` float32 y_move_amplitude`
&emsp;&emsp; Differential distance (y-direction) between ROBOTIS-OP3's left and right foot during walk [m]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image151.jpg)
* ` float32 z_move_amplitude`
&emsp;&emsp; This is ROBOTIS-OP3's foot elevation during walk  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image152.jpg)
* ` float32 angle_move_amplitude`
&emsp;&emsp; Direction of ROBOTIS-OP3's stepping (towards left or right). The head also aims at the direction [rad]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image3.gif)

**balance parameter**  
* `bool balance_enable`
&emsp;&emsp; Turn on balance algorithm  

* ` float32 balance_hip_roll_gain`
&emsp;&emsp; Gain with respect to the gyroscope roll

* ` float32 balance_knee_gain`
&emsp;&emsp; Gain with respect to the gyroscope pitch

* ` float32 balance_ankle_roll_gain`
&emsp;&emsp; Gain with respect to the gyroscope roll

* ` float32 balance_ankle_pitch_gain`
&emsp;&emsp; Gain with respect to the gyroscope pitch

* ` float32 y_swap_amplitude`
&emsp;&emsp; swing to either left or right during walk [m]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image153.jpg)
* ` float32 z_swap_amplitude`
&emsp;&emsp; up and down body swing during walk [m]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image154.jpg)
* ` float32 arm_swing_gain`
&emsp;&emsp; Arm swing gain with respect to Step forward/back. If the left foot moves forward then the right arm swings.

* ` float32 pelvis_offset`
&emsp;&emsp; roll offset (x-coordinate) at the pelvis level. Values are for Dynamixel position values for hip roll joints [rad]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image155.jpg)
* ` float32 hip_pitch_offset`
&emsp;&emsp; pitch offset (y-coordinate) at the hip level. Values are for Dynamixel position values for hip pitch joints. [rad]  
&emsp;&emsp;
![](/assets/images/platform/op3/op3_walking_module_image147.jpg)

**gain parameter**   
* ` int32 p_gain`
&emsp;&emsp; not yet implemented

* ` int32 i_gain`
&emsp;&emsp; not yet implemented

* ` int32 d_gain`
&emsp;&emsp; not yet implemented
