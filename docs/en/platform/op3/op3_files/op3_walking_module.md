### 1. Overview
This chapter explains the module to control OP3 walking.  
This module is compiled to a library to be used in [op3_manager].  


### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package]

#### 2.2 Usage
The Motion Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

### 3. ROS API
#### 3.1 Subscribed Topics
`/robotis/walking/command`([std_msgs/String]{: .popup})  
&emsp;&emsp; This message requests start and stop for walking.  

`/robotis/walking/set_params`([op3_walking_module_msgs/WalkingParam]{: .popup})  
&emsp;&emsp; This message sets necessary parameters for walking. For details, refer to [WalkingParam.msg].  


#### 3.2 Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
&emsp;&emsp; This message notifies the status of op3_walking_module.  


#### 3.3 Services
`/robotis/walking/get_params`([op3_walking_module_msgs/GetWalkingParam]{: .popup})  
&emsp;&emsp; This service acquires walking parameters.  


### 4. Parameters
`/walking_param_path`(string, default : "op3_walking_module/config/param.yaml")  
&emsp;&emsp; File path that indicates the location of the walking parameters.  

### 5. Data
#### 5.1 Walking parameters

 - data file path : [/op3_walking_module/config/param.yaml]

 - YAML format
   - x_offset: offset in the x-direction (front and back) [m]  

     ![](/assets/images/platform/op3/op3_walking_module_image142.jpg)
   - y_offset: offset in the y-direction (left and right) [m]  

     ![](/assets/images/platform/op3/op3_walking_module_image143.jpg)
   - z_offset: offset in the z-direction (up and down) [m]  
&emsp;&emsp;
     ![](/assets/images/platform/op3/op3_walking_module_image144.jpg)
   - roll_offset: roll offset (x-coordinate) [degree]  

     ![](/assets/images/platform/op3/op3_walking_module_image145.jpg)
   - pitch_offset: pitch offset (y-coordinate) [degree]  

     ![](/assets/images/platform/op3/op3_walking_module_image146.jpg)
   - yaw_offset: yaw offset (z-coordinate) [degree]  

     ![](/assets/images/platform/op3/op3_walking_module_image2.gif)
   - hip_pitch_offset: pitch offset (y-coordinate) at the hip level. Values are for Dynamixel position values for hip pitch joints. [degree]  

      ![](/assets/images/platform/op3/op3_walking_module_image147.jpg)
   - period_time: Time required for ROBOTIS-OP3 to complete two full steps (left and right foot) [ms]  

     ![](/assets/images/platform/op3/op3_walking_module_image148.jpg)
   - dsp_ratio: Time ratio of the period when both feet are touching the ground to the period of walking cycle.  

     ![](/assets/images/platform/op3/op3_walking_module_image149.jpg)
   - foot_height: foot elevation during walk [m]  

     ![](/assets/images/platform/op3/op3_walking_module_image152.jpg)
   - swing_right_left: swing to either left or right during walk [m]

     ![](/assets/images/platform/op3/op3_walking_module_image153.jpg)
   - swing_top_down: up and down body swing during walk [m]  

     ![](/assets/images/platform/op3/op3_walking_module_image154.jpg)
   - pelvis_offset: roll offset (x-coordinate) at the pelvis level. Values are for Dynamixel position values for hip roll joints [degree]  

     ![](/assets/images/platform/op3/op3_walking_module_image155.jpg)
   - arm_swing_gain: Arm swing gain with respect to Step forward/back. If the left foot moves forward then the right arm swings.

   - balance_hip_roll_gain: Gain with respect to the gyroscope roll

   - balance_knee_gain: Gain with respect to the gyroscope pitch

   - balance_ankle_roll_gain: Gain with respect to the gyroscope roll

   - balance_ankle_pitch_gain: Gain with respect to the gyroscope pitch

   - p_gain: not yet implemented

   - i_gain: not yet implemented

   - d_gain: not yet implemented

[&lt;&lt; Back](ROBOTIS-OP3-Modules.md)


[Creating new robot manager]:Creating-new-robot-manager.md
[std_msgs/String]:/docs/en/popup/std_msgs_string/
[op3_manager]:op3_manager.md

[op3_walking_module_msgs/WalkingParam]:/docs/en/popup/op3_WalkingParam.msg/
[WalkingParam.msg]:/docs/en/popup/op3_WalkingParam.msg/
[robotis_controller_msgs/StatusMsg]:/docs/en/popup/StatusMsg.msg/
[op3_walking_module_msgs/GetWalkingParam]:/docs/en/popup/op3_GetWalkingParam.srv/
[/op3_walking_module/config/param.yaml]:https://github.com/ROBOTIS-GIT/ROBOTIS-OP3/blob/master/op3_walking_module/config/param.yaml
[Installing ROBOTIS ROS Package]:OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages  
