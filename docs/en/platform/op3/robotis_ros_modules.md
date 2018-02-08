---
layout: archive
lang: en
ref: op3_robotis_ros_modules
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/robotis_ros_modules/
sidebar:
  title: ROBOTIS-OP3
  nav: "op3"
---

<div style="counter-reset: h1 3"></div>

# [Robotis Ros Packages](#robotis-ros-packages)

## [ROBOTIS-OP3 Modules]

### Motion Module

#### [op3_action_module]

##### Overview  
`op3_action_module` manages OP3 actions.  
This module is compiled as a libary so that it can be loaded from the `op3_manager`.
Action contains all joint angles per each time frame.

##### Getting started  
###### Download & Build  
 > Reference : [Installing ROBOTIS ROS Package]

###### Usage  
Motion Module is used in the form of lib in the manager.  
> Reference : [Creating new robot manager]

##### ROS API  
###### Subscribed Topics  
`/robotis/action/page_num`([std_msgs/Int32]{: .popup})  
&emsp;&emsp; The page number of action to run in the Module.  
&emsp;&emsp; 1 ~ 255 : play action  
&emsp;&emsp; -1 : stop action  
&emsp;&emsp; -2 : brake action  

###### Published Topics  
`/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
&emsp;&emsp; Message that describes status of action_module.  

###### Services  
`/robotis/action/is_running`([op3_action_module_msgs/IsRunning]{: .popup})  
&emsp;&emsp; Service that checks whether the action is running or not.  


##### Parameters  
`/action file path`(string, default : "op3_action_module/data/motion_4095.bin")  
&emsp;&emsp; File path that indicates the location of action libraries for OP3.  





#### [op3_base_module]

##### Overview  
`op3_base_module` is a module for initial posture.  
This module is compiled to a library to be used in [op3_manager].  


##### Getting started  
###### Download & Build  
 > Reference : [Installing ROBOTIS ROS Package]

###### Usage  
The Motion Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

##### ROS API  
###### Subscribed Topics  
`/robotis/base/ini_pose`([std_msgs/String]{: .popup})  
&emsp;&emsp; This message will have OP3 to take the initial posture(This command is effective even when the base module is inactive).  


###### Published Topics  
`/robotis/enable_ctrl_module`([std_msgs/String]{: .popup})  
&emsp;&emsp; This message activates `op3_base_module` to take the initial posture.  

`/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
&emsp;&emsp; This message notifies the status of `op3_base_module`.  

##### Data  
###### Init posture  

 - data file path : [/op3_base_module/data/ini_pose.yaml]  

 - YAML format
   - mov_time : Estimated time to move to target points(unit in second)  
   - via_num : Number of waypoints  
   - via_time : Estimated time between waypoints(array structure)   
   - via_pose : Angle of every joint for each waypoint(unit in degree, array structure)  
   - tar_pose : Target joint angles for initial posture

#### [op3_head_control_module]

##### Overview
This chapter explains the module to control OP3's head.  
This module is compiled to a library to be used in [op3_manager].  


##### Getting started  
###### Download & Build
 > Reference : [Installing ROBOTIS ROS Package]    

###### Usage
The Motion Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

##### ROS API
###### Subscribed Topics
`/robotis/head_control/scan_command`([std_msgs/String]{: .popup})  
&emsp;&emsp; This message will request a looking around head motion to scan the environment.  

`/robotis/head_control/set_joint_states`([sensor_msgs/JointState]{: .popup})  
&emsp;&emsp; Head joints will rotate to corresponding angles written in the message.  

`/robotis/head_control/set_joint_states_offset`([sensor_msgs/JointState]{: .popup})  
&emsp;&emsp; Head joints will adjust angles by offset values written in the message.  


###### Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})
&emsp;&emsp; This message notifies the status of head_control_module.  

#### [op3_walking_module]

##### Overview
This chapter explains the module to control OP3 walking.  
This module is compiled to a library to be used in [op3_manager].  


##### Getting started
###### Download & Build
 > Reference : [Installing ROBOTIS ROS Package]

###### Usage
The Motion Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

##### ROS API
###### Subscribed Topics
`/robotis/walking/command`([std_msgs/String]{: .popup})  
&emsp;&emsp; This message requests start and stop for walking.  

`/robotis/walking/set_params`([op3_walking_module_msgs/WalkingParam]{: .popup})  
&emsp;&emsp; This message sets necessary parameters for walking. For details, refer to [WalkingParam.msg].  


###### Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
&emsp;&emsp; This message notifies the status of op3_walking_module.  


###### Services
`/robotis/walking/get_params`([op3_walking_module_msgs/GetWalkingParam]{: .popup})  
&emsp;&emsp; This service acquires walking parameters.  


##### Parameters
`/walking_param_path`(string, default : "op3_walking_module/config/param.yaml")  
&emsp;&emsp; File path that indicates the location of the walking parameters.  

##### Data
###### Walking parameters

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





#### [op3_online_walking_module]

##### Overview
This chapter explains the module to control OP3's walking.  
This module is compiled to a library to be used in [op3_manager].  
Online walking algorithm is described in this book ([Introduction to Humanoid Robotics]).


##### Getting started  
###### Download & Build
 > Reference : [Installing ROBOTIS ROS Package]

###### Usage
The Motion Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

##### ROS API
###### Subscribed Topics
`/robotis/online_walking/reset_body`  
([std_msgs/Bool]{: .popup})  
&emsp;&emsp; This message will reset the body pose to default value.  

`/robotis/online_walking/goal_joint_pose`  
([op3_online_walking_module_msgs/JointPose]{: .popup})  
&emsp;&emsp; This message will set desired pose in joint space.  

`/robotis/online_walking/goal_kinematics_pose`  
([op3_online_walking_module_msgs/KinematicsPose]{: .popup})  
&emsp;&emsp; This message will set desired pose in task space.  

`/robotis/online_walking/foot_step_command`  
([op3_online_walking_module_msgs/FootStepCommand]{: .popup})  
&emsp;&emsp; This message will set walking command.  

`/robotis/online_walking/foot_step_command`  
([op3_online_walking_module_msgs/FootStepCommand]{: .popup})  
&emsp;&emsp; This message will execute desired walking performance.  

`/robotis/online_walking/walking_param`  
([op3_online_walking_module_msgs/WalkingParam]{: .popup})  
&emsp;&emsp; This message will set walking parameter.

`/robotis/online_walking/body_offset`  
([geometry_msgs/Pose]{: .popup})  
&emsp;&emsp; This message will set desired body offset.

`/robotis/online_walking/foot_distance`  
([std_msgs/Float64]{: .popup})  
&emsp;&emsp; This message will set desired foot distance between left and right foot.

`/robotis/online_walking/footsteps_2d`  
([op3_online_walking_module_msgs/Step2DArray]{: .popup})  
&emsp;&emsp; This message will set desired foot step from foot step generator.


###### Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
&emsp;&emsp; This message notifies the status of head_control_module.  

`/robotis/movement_done`([std_msgs/String]{: .popup})  
&emsp;&emsp; This message notifies the end of movement.  

`/robotis/pelvis_pose`([geometry_msgs/PoseStamped]{: .popup})  
&emsp;&emsp; This message send desired pelvis pose for localization.  

###### Service Server
`/robotis/online_walking/get_joint_pose`  
([op3_online_walking_module_msgs/GetJointPose]{: .popup})  
&emsp;&emsp; This service is used to get current desired joint pose.  

`/robotis/online_walking/get_kinematics_pose`  
([op3_online_walking_module_msgs/GetKinematicsPose]{: .popup})  
&emsp;&emsp; This service is used to get current desired kinematics pose.  

###### Service Client
`/robotis/online_walking/get_preview_matrix`  
([op3_online_walking_module_msgs/GetPreviewMatrix]{: .popup})  
&emsp;&emsp; This service is used to calculate matrix for online walking.  



#### Sensor Module


#### [open_cr_module]

##### Overview
This chapter introduces the module that utilizes OpenCR as sensor and IO interface.
This module provides Gyro, Acceleration, Button and LED functions.

  > Reference : [OPENCR]

##### Getting started
###### Download & Build
 > Reference : [Installing ROBOTIS ROS Package]   

###### Usage
The Sensor Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

##### ROS API
###### Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
&emsp;&emsp; This message notifies the status of open_cr_module.  

&emsp;&emsp; This message contains IMU data from OpenCR.  
`/robotis/open_cr/imu`([sensor_msgs/Imu]{: .popup})  

`/robotis/open_cr/button`([std_msgs/String]{: .popup})  
&emsp;&emsp; This message notifies the status of the button connected to OpenCR GPIO.  


### [OP3 Manager]
The package that controls OP3 using framework and various modules.   

### Others

#### [op3_balance_control]

##### Overview  
`op3_balance_control` is a library for balance control.  
This library is used to improve walking performance.  
Currently, this library is not implemented because of sensors (ft & IMU).  
We will update how to used is library.  


#### [op3_localization]

##### Overview  
`op3_localization` is ros node for localization.  
This node publish TF data from /world to /body_link.  

##### ROS API
###### Subscribed Topics
`/robotis/pelvis_pose`([geometry_msgs/PoseStamped]{: .popup})  
&emsp;&emsp; This message will set the body_link pose from /world.  

`/robotis/pelvis_pose_reset`([std_msgs/String]{: .popup})  
&emsp;&emsp; This message will reset the body_link pose to default value.  






#### [op3_optimization]


##### Overview  
`op3_optimization` is ros node for online walking pattern generation.  

##### ROS API
###### Service Server  
`/robotis/get_preview_matrix`([op3_online_walking_module_msgs/GetPreviewMatrix]{: .popup})  
&emsp;&emsp; This service will return preview control matrix for online walking pattern generation.  






[ROBOTIS-OP3 Modules]: [ROBOTIS-OP3-Modules.md]
[op3_action_module]: /docs/en/platform/op3/op3_files/op3_action_module/
[op3_base_module]: [op3_base_module.md]
[op3_head_control_module]: [op3_head_control_module.md]
[op3_walking_module]: [op3_walking_module.md]
[op3_online_walking_module]: [op3_online_walking_module.md]
[open_cr_module]: [open_cr_module.md]
[Op3 Manager]: [op3_manager.md]
[op3_balance_control]: [op3_balance_control.md]
[op3_localization]: [op3_localization.md]
[op3_optimization]: [op3_optimization.md]



[std_msgs/Int32]: /docs/en/popup/std_msgs_int32_message/
[std_msgs/String]: /docs/en/popup/std_msgs_string/
[std_msgs/Bool]:/docs/en/popup/std_msgs_bool_msg/
[std_msgs/Float64]:/docs/en/popup/std_msgs_Float64_msg/


[sensor_msgs/JointState]:/docs/en/popup/sensor_msgs_JointState_msg/
[sensor_msgs/Imu]:/docs/en/popup/sensor_msgs_IMU_msg/

[geometry_msgs/Pose]:/docs/en/popup/geometry_msgs_Pose_msg/  
[geometry_msgs/PoseStamped]:/docs/en/popup/geometry_msgs_PoseStamped_msg/

[Creating new robot manager]:Creating_new_robot_manager.md
[Installing ROBOTIS ROS Package]:OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md  

[robotis_controller_msgs/StatusMsg]:/docs/en/popup/StatusMsg.msg/
[op3_action_module_msgs/IsRunning]:/docs/en/popup/op3_IsRunning.srv/


[/op3_base_module/data/ini_pose.yaml]:https://github.com/ROBOTIS-GIT/ROBOTIS-OP3/blob/master/op3_base_module/data/ini_pose.yaml



[op3_manager]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_manage


[op3_walking_module_msgs/WalkingParam]:/docs/en/popup/op3_WalkingParam.msg/
[WalkingParam.msg]:/docs/en/popup/op3_WalkingParam.msg/

[op3_walking_module_msgs/GetWalkingParam]:/docs/en/popup/op3_GetWalkingParam.srv/
[/op3_walking_module/config/param.yaml]:https://github.com/ROBOTIS-GIT/ROBOTIS-OP3/blob/master/op3_walking_module/config/param.yaml


[Introduction to Humanoid Robotics]:http://www.springer.com/gp/book/9783642545351

[op3_online_walking_module_msgs/JointPose]:/docs/en/popup/op3_JointPose.msg/
[op3_online_walking_module_msgs/KinematicsPose]:/docs/en/popup/op3_KinematicsPose.msg/
[op3_online_walking_module_msgs/FootStepCommand]:/docs/en/popup/op3_FootStepCommand.msg/
[op3_online_walking_module_msgs/WalkingParam]:/docs/en/popup/op3_online_WalkingParam.msg/
[op3_online_walking_module_msgs/Step2DArray]:/docs/en/popup/op3_Step2DArray.msg/
[op3_online_walking_module_msgs/GetJointPose]:/docs/en/popup/op3_GetJointPose.srv/
[op3_online_walking_module_msgs/GetKinematicsPose]:/docs/en/popup/op3_KinematicsPose.msg/
[op3_online_walking_module_msgs/GetPreviewMatrix]:/docs/en/popup/op3_GetPreviewMatrix.srv/

[OPENCR]:https://github.com/ROBOTIS-GIT/OpenCR/wiki/arduino_examples_op3
