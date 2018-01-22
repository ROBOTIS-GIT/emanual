### File: [`op3_walking_module_msgs/WalkingParam.msg`](https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-msgs/blob/master/op3_walking_module_msgs/msg/WalkingParam.msg)

### Message Definition
```
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

### Description
These are the parameters used in the Walking Algorithm.  

**walking init pose**  
* `float32 init_x_offset`
&emsp;&emsp; offset in the x-direction (front and back) [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image142.jpg" align="bottom" height="200px" />

* `float32 init_y_offset`
&emsp;&emsp; offset in the y-direction (left and right) [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image143.jpg" align="bottom" height="200px" />

* `float32 init_z_offset`
&emsp;&emsp; offset in the z-direction (up and down) [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image144.jpg" align="bottom" height="250px" />

* `float32 init_roll_offset`
&emsp;&emsp; roll offset (x-coordinate) [rad]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image145.jpg" align="bottom" height="220px" />

* `float32 init_pitch_offset`
&emsp;&emsp; pitch offset (y-coordinate) [rad]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image146.jpg" align="bottom" height="220px" />

* `float32 init_yaw_offset`
&emsp;&emsp; yaw offset (z-coordinate) [rad]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image2.gif" align="bottom" height="100px" />


**time parameter**  
* `float32 period_time`
&emsp;&emsp; Time required for ROBOTIS-OP3 to complete two full steps (left and right foot) [ms]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image148.jpg" align="bottom" height="200px" />

* `float32 dsp_ratio`
&emsp;&emsp; Time ratio of the period when both feet are touching the ground to the period of walking cycle.  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image149.jpg" align="bottom" height="250px" />


**walking parameter**  
* `float32 x_move_amplitude`
&emsp;&emsp; Differential distance (x-direction) between ROBOTIS-OP3's left and right foot during walk [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image150.jpg" align="bottom" height="200px" />

* `float32 y_move_amplitude`
&emsp;&emsp; Differential distance (y-direction) between ROBOTIS-OP3's left and right foot during walk [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image151.jpg" align="bottom" height="200px" />

* `float32 z_move_amplitude`
&emsp;&emsp; This is ROBOTIS-OP3's foot elevation during walk  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image152.jpg" align="bottom" height="200px" />

* `float32 angle_move_amplitude`
&emsp;&emsp; Direction of ROBOTIS-OP3's stepping (towards left or right). The head also aims at the direction [rad]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image3.gif" align="bottom" height="100px" />


**balance parameter**  
* `bool balance_enable`
&emsp;&emsp; Turn on balance algorithm  

* `float32 balance_hip_roll_gain`
&emsp;&emsp; Gain with respect to the gyroscope roll

* `float32 balance_knee_gain`
&emsp;&emsp; Gain with respect to the gyroscope pitch

* `float32 balance_ankle_roll_gain`
&emsp;&emsp; Gain with respect to the gyroscope roll

* `float32 balance_ankle_pitch_gain`
&emsp;&emsp; Gain with respect to the gyroscope pitch

* `float32 y_swap_amplitude`
&emsp;&emsp; swing to either left or right during walk [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image153.jpg" align="bottom" height="220px" />

* `float32 z_swap_amplitude`
&emsp;&emsp; up and down body swing during walk [m]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image154.jpg" align="bottom" height="200px" />

* `float32 arm_swing_gain`
&emsp;&emsp; Arm swing gain with respect to Step forward/back. If the left foot moves forward then the right arm swings.

* `float32 pelvis_offset`
&emsp;&emsp; roll offset (x-coordinate) at the pelvis level. Values are for Dynamixel position values for hip roll joints [rad]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image155.jpg" align="bottom" height="200px" />

* `float32 hip_pitch_offset`
&emsp;&emsp; pitch offset (y-coordinate) at the hip level. Values are for Dynamixel position values for hip pitch joints. [rad]  
&emsp;&emsp; <img src="http://support.robotis.com/ko/images/product/darwin-op/image147.jpg" align="bottom" height="200px" />


**gain parameter**   
* `int32 p_gain`
&emsp;&emsp; not yet implemented

* `int32 i_gain`
&emsp;&emsp; not yet implemented

* `int32 d_gain`
&emsp;&emsp; not yet implemented



<br>[&lt;&lt; Back](op3_walking_module_msgs.md)
