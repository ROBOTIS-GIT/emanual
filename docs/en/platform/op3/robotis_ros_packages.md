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

# [ROBOTIS ROS packages](#robotis-ros-packages)

## [Robotis OP3](#robotis-op3)

### [Robotis ROS Modules](#robotis-ros-modules)

#### Motion Module

##### [op3_action_module]

###### Overview  
`op3_action_module` manages OP3 actions.  
This module is compiled as a libary so that it can be loaded from the `op3_manager`.
Action contains all joint angles per each time frame.

###### Getting started  
- Download & Build  
 > Reference : [Installing ROBOTIS ROS Package]

  - Usage  
    Motion Module is used in the form of lib in the manager.  
    > Reference : [Creating new robot manager]

- ROS API  
- Subscribed Topics  
  `/robotis/action/page_num`([std_msgs/Int32]{: .popup})  
  &emsp;&emsp; The page number of action to run in the Module.  
  &emsp;&emsp; 1 ~ 255 : play action  
  &emsp;&emsp; -1 : stop action  
  &emsp;&emsp; -2 : brake action  

- Published Topics  
  `/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
  &emsp;&emsp; Message that describes status of action_module.  

- Services  
  `/robotis/action/is_running`([op3_action_module_msgs/IsRunning]{: .popup})  
  &emsp;&emsp; Service that checks whether the action is running or not.  


###### Parameters
  `/action file path`(string, default : "op3_action_module/data/motion_4095.bin")  
  &emsp;&emsp; File path that indicates the location of action libraries for OP3.  





##### [op3_base_module]

###### Overview  
`op3_base_module` is a module for initial posture.  
This module is compiled to a library to be used in [op3_manager].  


###### Getting started  
- Download & Build  
  > Reference : [Installing ROBOTIS ROS Package]

- Usage  
  The Motion Module is used in the manager in the form of library.  
  > Reference : [Creating new robot manager]

###### ROS API  
- Subscribed Topics  
  `/robotis/base/ini_pose`([std_msgs/String]{: .popup})  
  &emsp;&emsp; This message will have OP3 to take the initial posture(This command is effective even when the base &emsp;&emsp; module is inactive).  

- Published Topics  
  `/robotis/enable_ctrl_module`([std_msgs/String]{: .popup})  
  &emsp;&emsp; This message activates `op3_base_module` to take the initial posture.  

  `/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
  &emsp;&emsp; This message notifies the status of `op3_base_module`.  

###### Data  
- Init posture  

 - data file path : [/op3_base_module/data/ini_pose.yaml]  

 - YAML format
   - mov_time : Estimated time to move to target points(unit in second)  
   - via_num : Number of waypoints  
   - via_time : Estimated time between waypoints(array structure)   
   - via_pose : Angle of every joint for each waypoint(unit in degree, array structure)  
   - tar_pose : Target joint angles for initial posture

##### [op3_head_control_module]

###### Overview
This chapter explains the module to control OP3's head.  
This module is compiled to a library to be used in [op3_manager].  


###### Getting started  
- Download & Build
  > Reference : [Installing ROBOTIS ROS Package]    

- Usage
  The Motion Module is used in the manager in the form of library.  
  > Reference : [Creating new robot manager]

###### ROS API
- Subscribed Topics  
  `/robotis/head_control/scan_command`([std_msgs/String]{: .popup})  
  &emsp;&emsp; This message will request a looking around head motion to scan the environment.  

  `/robotis/head_control/set_joint_states`([sensor_msgs/JointState]{: .popup})  
  &emsp;&emsp; Head joints will rotate to corresponding angles written in the message.  

  `/robotis/head_control/set_joint_states_offset`([sensor_msgs/JointState]{: .popup})  
  &emsp;&emsp; Head joints will adjust angles by offset values written in the message.  


- Published Topics  
  `/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
  &emsp;&emsp; This message notifies the status of head_control_module.  

##### [op3_walking_module]

###### Overview
This chapter explains the module to control OP3 walking.  
This module is compiled to a library to be used in [op3_manager].  

###### Getting started
- Download & Build
  > Reference : [Installing ROBOTIS ROS Package]

- Usage
  The Motion Module is used in the manager in the form of library.  
  > Reference : [Creating new robot manager]

###### ROS API
- Subscribed Topics  
  `/robotis/walking/command`([std_msgs/String]{: .popup})  
  &emsp;&emsp; This message requests start and stop for walking.  

  `/robotis/walking/set_params`([op3_walking_module_msgs/WalkingParam]{: .popup})  
  &emsp;&emsp; This message sets necessary parameters for walking. For details, refer to [WalkingParam.msg].  

- Published Topics  
  `/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
  &emsp;&emsp; This message notifies the status of op3_walking_module.  

- Services  
  `/robotis/walking/get_params`([op3_walking_module_msgs/GetWalkingParam]{: .popup})  
  &emsp;&emsp; This service acquires walking parameters.  


###### Parameters
`/walking_param_path`(string, default : "op3_walking_module/config/param.yaml")  
&emsp;&emsp; File path that indicates the location of the walking parameters.  

###### Data
- Walking parameters

 - data file path : [/op3_walking_module/config/param.yaml]

 - YAML format
   - x_offset: offset in the x-direction (front and back) [m]  

     ![](/assets/images/platform/op3/op3_walking_module_image142.jpg)
     
   - y_offset: offset in the y-direction (left and right) [m]  

     ![](/assets/images/platform/op3/op3_walking_module_image143.jpg)
     
   - z_offset: offset in the z-direction (up and down) [m]  

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





##### [op3_online_walking_module]

###### Overview
This chapter explains the module to control OP3's walking.  
This module is compiled to a library to be used in [op3_manager].  
Online walking algorithm is described in this book ([Introduction to Humanoid Robotics]).


###### Getting started  
- Download & Build
 > Reference : [Installing ROBOTIS ROS Package]

- Usage
The Motion Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

###### ROS API
- Subscribed Topics  
  `/robotis/online_walking/reset_body` ([std_msgs/Bool]{: .popup})  
 &emsp;&emsp;This message will reset the body pose to default value.  

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


- Published Topics  
  `/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
&emsp;&emsp; This message notifies the status of head_control_module.  

  `/robotis/movement_done`([std_msgs/String]{: .popup})  
&emsp;&emsp; This message notifies the end of movement.  

  `/robotis/pelvis_pose`([geometry_msgs/PoseStamped]{: .popup})  
&emsp;&emsp; This message send desired pelvis pose for localization.  

- Service Server  
  `/robotis/online_walking/get_joint_pose`  
([op3_online_walking_module_msgs/GetJointPose]{: .popup})  
&emsp;&emsp; This service is used to get current desired joint pose.  

  `/robotis/online_walking/get_kinematics_pose`  
([op3_online_walking_module_msgs/GetKinematicsPose]{: .popup})  
&emsp;&emsp; This service is used to get current desired kinematics pose.  

- Service Client
  `/robotis/online_walking/get_preview_matrix`  
([op3_online_walking_module_msgs/GetPreviewMatrix]{: .popup})  
&emsp;&emsp; This service is used to calculate matrix for online walking.  



##### Sensor Module


##### [open_cr_module]

###### Overview
This chapter introduces the module that utilizes OpenCR as sensor and IO interface.
This module provides Gyro, Acceleration, Button and LED functions.

  > Reference : [OPENCR]

###### Getting started
- Download & Build
 > Reference : [Installing ROBOTIS ROS Package]   

###### Usage
The Sensor Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

###### ROS API
- Published Topics  
  `/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
&emsp;&emsp; This message notifies the status of open_cr_module.  

  `/robotis/open_cr/imu`([sensor_msgs/Imu]{: .popup})  
&emsp;&emsp; This message contains IMU data from OpenCR.  

  `/robotis/open_cr/button`([std_msgs/String]{: .popup})  
&emsp;&emsp; This message notifies the status of the button connected to OpenCR GPIO.  


### [OP3 Manager](#op3-manager)
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





## [ROBOTIS OP3 msgs](#robotis-op3-msgs)

### Module msgs

#### [op3_action_module_msgs](#op3-action-module-msgs)

##### Overview
The followings are Messages and Services used for the [op3_action_module].  

##### ROS Message Type
* [StartAction.msg]{: .popup}

##### ROS Service Type
* [IsRunning.srv]{: .popup}

#### [op3_walking_module_msgs](#op3-walking-module-msgs)

##### Overview
Messages and Services used in the [op3_walking_module]

##### ROS Message Type
* [WalkingParam.msg]{: .popup}  

##### ROS Service Type  
* [GetWalkingParam.srv]{: .popup}
* [SetWalkingParam.srv]{: .popup}

#### [op3_online_walking_module_msgs](#op3-online-module-msgs)

##### Overview
Messages and Services used in the [op3_online_walking_module]  

##### ROS Message Type
* [FootStepArray.msg]{: .popup}
* [FootStepCommand.msg]{: .popup}
* [JointPose.msg]{: .popup}
* [KinematicsPose.msg]{: .popup}
* [PreviewRequest.msg]{: .popup}
* [PreviewResponse.msg]{: .popup}
* [Step2D.msg]{: .popup}
* [Step2DArray.msg]{: .popup}
* [WalkingParam.msg]{: .popup}

##### ROS Service Type  
* [GetJointPose.srv]{: .popup}
* [GetKinematicsPose.srv]{: .popup}
* [GetPreviewMatrix.srv]{: .popup}


### Tool msgs

#### [op3_offset_tuner_msgs](#op3-offset-tuner-msgs)

##### Overview
The following are Messages and Service used for the [op3_offset_tuner_server] and the [op3_offset_tuner_client].  

##### ROS Message Type
 * [JointOffsetData.msg]{: .popup}
 * [JointOffsetPositionData.msg]{: .popup}
 * [JointTorqueOnOff.msg]{: .popup}
 * [JointTorqueOnOffArray.msg]{: .popup}

##### ROS Service Type  
 * [GetPresentJointOffsetData.srv]{: .popup}





### [ROBOTIS OP3 Demo](#robotis-op3-Demo)

#### [ball_detector](#ball-detector)

##### Overview
 This chapter explain ball detecting package for ROBOTIS OP3's vision demonstration.  
 The package utilizes OpenCV library in order to search for a ball with a specific color.


##### Getting started
###### Download & Build
  > Reference : [Installing ROBOTIS ROS Package]    

###### Run
 - Standalone   
 Execute the program with a `.launch` file in order to load ROS parameters of ball_detector.  
    ```
    $ roslaunch ball_detector ball_detector.launch
    ```

 - Launch with usb_cam package  
 Execute the program with a `.launch` file in order to load ROS parameters.  
    ```
    $ roslaunch ball_detector ball_detector_from_usb_cam.launch
    ```
   > Reference : [`usb_cam`]  
   > Reference : The following software must be pre-installed to use `usb_cam` package.  
   > `$ sudo apt-get install v4l-utils`

##### ROS API
###### Subscribed Topics  
 `~/enable`([std_msgs/Bool]{: .popup})  
 &emsp;&emsp; OP3 will start searching for a ball with a `True` message, and stop with a `False` message.  

 `~/image_in`([sensor_msgs/Image]{: .popup})  
 &emsp;&emsp; The message in this topic contains camera input image for ball searching.  

 `~/cameraInfo_in`([sensor_msgs/CameraInfo]{: .popup})  
 &emsp;&emsp; The message in this topic contains camera information of the corresponding input image.  

###### Published Topics  
 `~/image_out`([sensor_mgsg/Image]{: .popup})  
 &emsp;&emsp; The message in this topic contains an output image after the ball searching process.  

 `~/camera_info`([sensor_msgs/CameraInfo]{: .popup})  
 &emsp;&emsp; The message in this topic contains camera information of the output image.  

 `~/circle_set`([ball_detector/circleSetStamped]{: .popup})  
 &emsp;&emsp; Detected ball information
   - `header`([std_msgs/Header]{: .popup}) : Header information
   - `circles`([geometry_msgs/Point]{: .popup}) : Detecetd balls
     - `x` X coordinate of the center of ball in the image coordinate system
     - `y` Y coordinate of the center of ball in the image coordinate system
     - `z` Radius of the detected ball


##### Parameters
 `/yaml_path`(string, default : "")  
 &emsp;&emsp; The path of the yaml file that saves parameters.

 `/gaussian_blur_size`(int, default : )  
 &emsp;&emsp;   

 `/gaussian_blur_sigma`(double, default : )  
 &emsp;&emsp;   

 `/canny_edge_th`(double, default : )  
 &emsp;&emsp;   

 `/hough_accum_resolution`(double, default : )  
 &emsp;&emsp;   

 `/min_circle_dist`(double, default : )  
 &emsp;&emsp;   

 `/hough_accum_th`(double, default : )  
 &emsp;&emsp;   

 `/min_radius`, `/max_radius`(int, default : )  
 &emsp;&emsp; Minimum and maximum radius of the ball to detect

 `/filter_h_min`, `/filter_h_max`(int, default : )  
 &emsp;&emsp; Minimum and maximum value of H filter in HSV color representation  
 > Reference : [HSV color]

 `/filter_s_min`, `/filter_s_max`(int, default : )  
 &emsp;&emsp; Minimum and maximum value of S filter in HSV color representation  

 `/filter_v_min`, `/filter_v_max`(int, default : )  
 &emsp;&emsp; Minimum and maximum value of V filter in HSV color representation  

 `/use_second_filter`(bool, default : )  
 &emsp;&emsp; Enable second color filter  

 `/filter_debug`(bool, default : )  
 &emsp;&emsp; Enable output image for debugging  

##### How to change the parameters
###### using the `.yaml`


###### using the `dynamic_reconfigure`


#### [op3_demo](#op3_demo)

##### Overview
 Basic demonstrations of OP3 are playing soccer, vision and sequence of various actions.  
 Playing soccer and action sequence are originated from OP2.  
 Face detection and tracking will be demonstrated for vision.  


##### Getting started
###### Download & Build
  > Reference : [Installing ROBOTIS ROS Package]  

###### Run
 - Execute `.launch` file to initiate demonstration  
   ```
   $ roslaunch op3_demo demo.launch
   ```
 - With a successful launch of the program, OP3 will announce that it is ready for the demonstration.  

###### Usage
  > Reference : [How to execute Default Demo]

 - Button Functions  
 From the left, each button is assigned for Mode, Start, User and Reset.  
   - Mode button  
     - short press : In Ready Mode, mode button switches to the next demo(soccer → vision → action)  
     - long press : While playing a specific demo, press and hold the mode button to return to demo Ready Mode.  

   - Start button  
     - short press : Play selected demo from Ready Mode. If demo is running, start button will pause or resume demo.    

   - User button  

   - Reset button  
     - Reset button will cut off the power to all Dynamixel.  

##### ROS API
 ROS APIs used in each demo will be explained in corresponding wiki pages.  

###### Subscribed Topics
 `/robotis/open_cr/button"`([std_msgs/String]{: .popup}
 )  
 &emsp;&emsp; The message in this topic is used to process button control.

###### Published Topics
 `/robotis/base/ini_pose`([std_msgs/String]{: .popup}
 )  
 &emsp;&emsp; The message in this topic is used for initial posture of ROBOTIS-OP3.

 `/robotis/sync_write_item`([std_msgs/String]{: .popup}
 )  
 &emsp;&emsp; This topic has a message to sync write data on ROBOTIS-OP3   
 &emsp;&emsp; ex) LED controls

 `/play_sound_file`([std_msgs/String]{: .popup}
 )  
 &emsp;&emsp; The message in this topic contains path of the voice file for verbal announcement.


##### Demos
 The followings are the list of available demonstration.  
 Buttons on the back of ROBOTIS-OP3 can be used to select and play demo.  
###### [Soccer Demo](#soccer-demo)
   OP3 will search for a colored ball selected by the user and play with it.

###### [Vision Demo](#vision-demo)
   OP3 will detect face and trace it.

###### [Action Demo](#action-demo)
   OP3 will play sequence of pre-defined actions while speaking.



### [ROBOTIS OP3 Common](#robotis-op3-common)

#### [robotis_op3_description](#robotis_op3_description)

##### Overview
 ROBOTIS OP3 URDF Model  

 ![](/assets/images/platform/op3/op3_urdf_rviz.png)

##### Make a URDF Model
 [URDF-ROS Wiki]

##### Package
 `doc` : document for ROBOTIS OP3 joint & link information   
 `launch` : launch file to execute Rviz   
 `stl` : STL files of ROBOTIS OP3's each parts   
 `src` : ROS node for Rviz to publish imaginary gripper joint   
 `urdf` : urdf & xacro files for Thormang3 model

#### [robotis_op3_gazebo](#robotis_op3_gazebo)

##### Overview
 ROBOTIS OP3 Gazebo Simulation

##### Gazebo with ROS
 [Connect to ROS]

##### Package
 `config` : ROS controller for gazebo   
 `launch` : launch files to execute gazebo simulation   
 `worlds` : simulation environments   


### [ROBOTIS OP3 Tools](#robotis-op3-tools)

#### [op3_action_editor](#op3_action_editor)

##### Overview   
 ROBOTIS-OP3 Action Editor Node   
 This chapter explains how to create and edit action file used in the [op3_action_module] of ROBOTIS-OP3.   

###### Action File
 The action file contains ROBOTIS-OP3’s poses and time data. The current position describes positions of Dynamixels which converted from actual Dynamixel resolution to 4095 resolution. The action file is written as binary file so users can read its contents with op3_action_editor. ROBOTIS currently provides a default action file with source code. It is located in "op3_action_module/data" directory.  

 The action file contains 256 pages. Each page can store up to 7 stages (or steps) of action data. The default action file does not use all pages and user can add own actions by writing them on the empty page.   


##### Getting started
###### Download & Build
  > Reference : [Installing ROBOTIS ROS Package]  

###### Run
 Execute the launch file.  
  `op3_action_editor` has a direct control over ROBOTIS-OP3, therefore other control programs such as `op3_manager`, `op3_offset_tuner` and `op3_walking_tuner` should not be running.  
 Before executing the `op3_action_editor` launch file, other programs should be terminated.  
 ```
 $ roslaunch op3_action_editor op3_action_editor.launch
 ```  

###### UI

 ![](/assets/images/platform/op3/thormang3_action_editor_tui.jpg)

 **Page number**: Page number is the listed page number. If user wants to create a new action poses, user can use any empty page.  
 **Page title**: ROBOTIS recommends user to use a page title when creating a new action on an empty page.  
 **Current position**: The current position describes position of Dynamixel which converted from actual Dynamixel resolution to 4095 resolution. This data is represented by STP7 in op3_action_editor. Sometimes the position may be read as ---- in op3_action_editor. This means position of the Dynamixel has not been read (or torque is off).
 If user turns the Dynamixel off, current position cannot be read until turn it back on.
 User can turn off the torque of specific Dynamixels. This is very convenient when acquiring position values directly from Dynamixels for a new robot posture instead of calculating those values. To do that, turn off the torque of desired Dynamixels, then make a posture and hold the robot joint by hand until turn the torque back on. The robot will be remaining at current posture and user can read position values of corresponding Dynamixels.  
 **Steps or stages**: Each page can store up to 7 steps, from STP0 to STP6. However, some actions may be required more than 7 stages to perform completely. This can be resolved by simply using multiple pages and link them with “Next”.  
 **Next**: “Next” indicates whether to continue action on a different page. To continue actions, just list the page number where the action is to be continued. Number 0 indicates that action does not continue onto another page (default value). Linking page does not have to have the numerical order.  
 **Play Count**: “Play Count” is the number of times the action of the page is to be played.  
 **Exit**: There might be some cases when an action has to be stopped. In these cases, the robot may be in unstable position. “Exit” is much like "Next", so "Exit" should be linked to a page where ROBOTIS-OP3 can return to a stable pose. If "Exit" is 0, it means that there is no linked exit page (default value).  
 Tip: When calling an action requires multiple pages, ROBOTIS strongly suggests user to call the action from the starting page. For example, “clap” starts at page 7 and ends at page 8. This means you should call page 7 when calling “clap.” Calling the page 8 may cause unexpected behavior of the robot.  
 **STP7**: "STP7" column is the current position of the Dynamixel which converted to 4095 resolution from its original resolution. "----" means that torque has been released.  
 **PauseTime**: "PauseTime" is the pause duration period for motion playback for step STP[x].  
 **Time(x 8msec)** : "Time" is the time period for ROBOTIS-OP3 to complete step STP[x]. Each time unit account for 8ms of time.  

 It is strongly advised that when user tests user’s own newly-created or edited actions, there should be small incremental changes in position, speed/time, and pause values for the sake of ROBOTIS-OP3's stability.  


###### The Contents of The Default Action File
 The below table shows the contents of the default action file.  

 | page number | page title | brief description of page                             | number of pages |
 |-------------|------------|-------------------------------------------------------|-----------------|
 |      1      | walki_init | initial standing pose                                 |        1        |
 |      2      |    hello   | greeting                                              |        1        |
 |      3      |  thank_you | Thank you                                             |        1        |
 |      4      |     yes    | yes                                                   |        1        |
 |      5      |      no    | no                                                    |        1        |
 |      6      |  fighting  | fighting                                              |        1        |
 |      7      |    clap    | clap                                                  |        2        |
 |      9      |   S_H_RE   | ready for shaking hands                               |        1        |
 |     10      |     S_H    | shaking hands                                         |        1        |
 |     11      |   S_H_END  | move to initialpose fram ready pose for shaking hands |        1        |
 |     12      |  scanning  | looking around                                        |        1        |
 |     13      |  ceremony  | ceremony                                              |        1        |


###### Basic Command of Action Editor
 After typing "help", the commend list will appear as shown below.  

 ![](/assets/images/platform/op3/thormang3_action_editor_tui_command_list.jpg)

 **exit**: exits the program.  
 **re**: refreshes the screen.  
 **b**: moves to the previous page.  
 **n**: moves to the next page.  
 **page [index]**: moves to the [index] page. For example typing page 5 outputs data from page 5 on screen.  
 **list**: outputs a list of pages.  
 **new**: initializes current page by clearing all actuator position data.  
 **copy [index]**: copies data from page [index] to current page. For example if you are on page 5 and want to copy page 9 then type copy 9.  
 **set [value]**: sets position value on chosen actuator. For example If you want ID19 (head pan) to have a value of 512 then using the keyboard's directional keys place the cursor on ID19 and type set 512.  
 **save**: saves any changes you've made. the saved motion file (motion_4096.bin can be found at "op3_action_module/data")  
 **play**: plays motion(s) of current page.  
 **name**: changes the name of the current page. You can view the name of the page at the top right portion of the screen. For example, page 2 is titled hello; to change the name type name and press the "ENTER" key. "name:" will appear at the bottom of the screen. Input the desired name for the page, good for instance, and press the "ENTER" key again.  
 **i**: inserts data from STP7 to STP0. Moves data from STP[x] to STP[x + 1] if any.  
 **i [index]**: inserts data from STP7 to STP[index]. Moves data from STP[index] to STP[index + 1] if any.  
 **m [index] [index2]**: moves data from [index2] to [index].  
 **d [index]**: deletes data from STP[index]. Moves data from STP[index] to STP[index - 1].  
 **on/off**: turns on/off torque from all Dynamixels.  
 **on/off [index1] [index2] [index3] …** : turns torque on/off from ID[index1] ID[index2] ID[index3]. For example off 20 releases torque from ID20. Notice that STP7 for ID20 will read [----]. Typing on 20 turns torque from ID20 on again and the screen outputs the current position data of ID20.  



###### Example Action editing with op3_action_editor
 1) Run the op3_action_editor  
 2) Find the page where the "walking_init page" is by typing "list"  
   ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example1.jpg)

 3) Exit the list and go to any blank page by typing "page [x]"(for example, page 15).
   ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example2.jpg)

 4) And copy the page 1 to page [x].  
   ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example3.jpg)

 3) Go to "walking_init" pose by typing "play"  

 5) Turn off the torque of ID 2, 4 and 8 by typing "off 2 4 8"  
   ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example4.jpg)

 6) After getting the desired pose turn torque on again by simple typing on. And insert the pose to step 1 by typing "i 1"  
   ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example5.jpg)

 7) Edit "Pause Time", "Time" of STP1 and "Page Step" as shown below.  
   ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example6.jpg)

 8) Type "play" and check the ROBOTIS-OP3's action  

#### [op3_gui_demo](#op3_gui_demo)


##### Overview   
 `op3_gui_demo` is a GUI software to control ROBOTIS-OP3.  
 Within this program, user can perform module settings, walking tuner, head joint control and play actions.  

 ![](/assets/images/platform/op3/op3_gui_diagram.png)

##### Getting started
###### Download & Build
  > Reference : [Installing ROBOTIS ROS Package]

###### Run
 Execute the launch file.  
 ```
 $ roslaunch op3_gui_demo op3_demo.launch
 ```  

###### UI

 ![](/assets/images/platform/op3/op3_gui.png)

###### Usage
 > Reference : [How to execute GUI program]


##### ROS API
###### Subscribed Topics
 `/robotis/status`([std_msgs/String]{: .popup})  
 &emsp;&emsp; This message describes status of ROBOTIS-OP3.

 `/robotis/present_joint_ctrl_modules`([robotis_controller_msgs/JointCtrlModule]{: .popup})  
 &emsp;&emsp; This message reports which module is currently in use for ROBOTIS-OP3.

 `/robotis/head_control/present_joint_states`([sensor_msgs/JointState]{: .popup})  
 &emsp;&emsp; This message reports present angles for each joint.  


###### Published Topics
 `/robotis/base/ini_pose`([std_msgs/String]{: .popup})  
 &emsp;&emsp; This message will have ROBOTIS-OP3 to take the initial posture.

 `/robotis/enable_ctrl_module`([std_msgs/String]{: .popup})  
 &emsp;&emsp; This message notifies framework to activate a specific module for ROBOTIS-OP3.  

 `/robotis/sync_write_item`([std_msgs/String]{: .popup})  
 &emsp;&emsp; This message contains data to be written to ROBOTIS-OP3 with the Sync Write command.  
 &emsp;&emsp; ex) LED control

 `/robotis/head_control/set_joint_states_offset`([sensor_msgs/JointState]{: .popup})  
 &emsp;&emsp; This message controls head joints.

 `/play_sound_file`([std_msgs/String]{: .popup})  
 &emsp;&emsp; This message contains the path of voice files for speaking.

 `/robotis/walking/command"`([std_msgs/String]{: .popup})  
 &emsp;&emsp; This message commands walking module of ROBOTIS-OP3.

 `/robotis/walking/set_params"`([op3_walking_module_msgs/WalkingParam]{: .popup})  
 &emsp;&emsp; This message configures walking parameters of the walking module.

 `/robotis/action/page_num`([std_msgs/Int32]{: .popup})  
 &emsp;&emsp; This message transfers page number to action_module to play actions.


###### Services
 `/robotis/get_present_joint_ctrl_modules`([robotis_controller_msgs/GetJointModule]{: .popup})  
 &emsp;&emsp; This service acquires which module is currently in use for ROBOTIS-OP3.  

 `/robotis/walking/get_params`([op3_walking_module_msgs/GetWalkingParam]{: .popup})  
 &emsp;&emsp; This service acquires walking parameters.  


##### Parameters
 `/demo_config`(string, default : "/op3_gui_demo/config/demo_config.yaml")  
 &emsp;&emsp; This yaml file saves joint names, available modules, list of module preset button.  

#### [op3_offset_tuner_server](#op3_offset_tuner_server)

##### Overview   
 ROBOTIS-OP3 Offset Tuner Node   
 Data related to the Offset can be Tuned, Loaded and Saved.   
 It is used with the [op3_offset_tuner_client].  


##### Getting started
###### Download & Build
  > Reference : [Installing ROBOTIS ROS Package]  


###### Run
 Execute the launch file to start offset tuner server.  
 `op3_offset_tuner_server` has a direct control over ROBOTIS-OP3, therefore other control programs such as `op3_manager`, `op3_action_editor` and `op3_walking_tuner` should not be running.
 Before executing the `op3_offset_tuner_server` launch file, other programs should be terminated.    
 ```
 $ roslaunch op3_offset_tuner_server op3_offset_tuner_server.launch
 ```  

###### Usage
 > Reference : [How to use offset tuner]  


##### ROS API

###### Subscribed Topics
 * `/robotis/base/send_tra`([std_msgs/String]{: .popup})  
 &emsp;&emsp; The topic informs the start and end of trajectory following.  

 * `/robotis/offset_tuner/joint_offset_data`([op3_offset_tuner_msgs/JointOffsetData]{: .popup})  
 &emsp;&emsp; The topic updates joint offset related parameters.  

 * `/robotis/offset_tuner/torque_enable`([op3_offset_tuner_msgs/JointTorqueOnOffArray]{: .popup})  
 &emsp;&emsp; The topic transfers Torque enable/disable command for joints.

 * `/robotis/offset_tuner/command`([std_msgs/String]{: .popup})  
 &emsp;&emsp; The topic transfers command to the [op3_offset_tuner_client].  
 &emsp;&emsp; - "save"     : Saves current offset to yaml  
 &emsp;&emsp; - "ini_pose" : Take the initial posture for offset tuning  


###### Services
 * `robotis/offset_tuner/get_present_joint_offset_data`([op3_offset_tuner_msgs/GetPresentJointOffsetData]{: .popup})  
 &emsp;&emsp; The service obtains current offset data from the [op3_offset_tuner_client].  

###### Parameters
 `/offset_path`(string, default : "")  
 &emsp;&emsp; The yaml file path to save offsets.   

 `/robot_file_path`(string, default : "")  
 &emsp;&emsp; This path indicates the location of .robot file that contains robot description data.  

 `/init_file_path`(string, default : "")  
 &emsp;&emsp; This path indicates the location of the file that contains initialization information of each joint.  


#### [op3_offset_tuner_client](#op3_offset_tuner_client)

##### Overview
 The GUI Node that can adjust offset of ROBOTIS-OP3.  
 It is used with the [op3_offset_tuner_server].  


##### Getting started
###### Download & Build
  > Reference : [Installing ROBOTIS ROS Package]

###### Run
 ```
 $ rosrun op3_offset_tuner_client op3_offset_tuner_client
 ```  

###### Usage
 > Reference : [How to use offset tuner]



##### ROS API

###### Published Topics
 `/robotis/offset_tuner/joint_offset_data`([op3_offset_tuner_msgs/JointOffsetData]{: .popup})            
 &emsp;&emsp; The topic transfers Joint offset   

 `/robotis/offset_tuner/torque_enable`([op3_offset_tuner_msgs/JointTorqueOnOffArray]{: .popup})    
 &emsp;&emsp; The topic executes Torque on/off command   

 `/robotis/offset_tuner/command`([std_msgs/String]{: .popup})    
 &emsp;&emsp; The topic transfers other commands(save, initial posture, etc).   

###### Services
 `/robotis/offset_tuner/get_present_joint_offset_data`([op3_offset_tuner_msgs/GetPresentJointOffsetData]{: .popup})  
 &emsp;&emsp; The service obtains saved joint offset



#### [op3_walking_tuner](#op3_walking_tuner)

##### Overview   
 This Node tunes walking parameters of ROBOTIS-OP3.  
 Walking tuner function is included in the [op3_gui_demo].  
 `op3_walking_tuner` runs on a terminal window while [op3_gui_demo] creates its own GUI window.    




##### Getting started
###### Download & Build
  > Reference : [Installing ROBOTIS ROS Package]  

  > Reference : `libncurses5-dev` must be pre-installed in order to build `op3_walking_tuner`.  
     ```
     $ sudo apt install libncurses5-dev
     ```  

###### Run
 Execute the launch file.  
 `op3_walking_tuner` has a direct control over ROBOTIS-OP3, therefore other control programs such as `op3_manager`, `op3_action_editor` and `op3_offset_tuner_server` should not be running.  
 Before executing the `op3_walking_tuner` launch file, other programs should be terminated.  
 ```
 $ roslaunch op3_walking_tuner op3_walking_tuner.launch
 ```  


###### UI

 ![](/assets/images/platform/op3/op3_walk_tuner.png)

###### Usage
 Please refer to [How to use walking tuner].








[ROBOTIS-OP3 Modules]: robotis_op3_modules.md
[op3_action_module]: /docs/en/platform/op3/op3_files/op3_action_module/
[op3_base_module]: op3_base_module.md
[op3_head_control_module]: op3_head_control_module.md
[op3_walking_module]: op3_walking_module.md
[op3_online_walking_module]: op3_online_walking_module.md
[open_cr_module]: open_cr_module.md
[Op3 Manager]: op3_manager.md
[op3_balance_control]: op3_balance_control.md
[op3_localization]: op3_localization.md
[op3_optimization]: op3_optimization.md


[std_msgs/Int32]: /docs/en/popup/std_msgs_int32_message/
[std_msgs/String]: /docs/en/popup/std_msgs_string/
[std_msgs/Bool]: /docs/en/popup/std_msgs_bool_msg/
[std_msgs/Float64]: /docs/en/popup/std_msgs_Float64_msg/
[std_msgs/Header]: /docs/en/popup/std_msgs_Header/


[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[sensor_msgs/Imu]: /docs/en/popup/sensor_msgs_IMU_msg/
[sensor_msgs/Image]: /docs/en/popup/sensor_msgs_Image/
[sensor_msgs/CameraInfo]: /docs/en/popup/sensor_msgs_CameraInfo_msg/


[geometry_msgs/Pose]: /docs/en/popup/geometry_msgs_Pose_msg/  
[geometry_msgs/PoseStamped]: /docs/en/popup/geometry_msgs_PoseStamped_msg/

[robotis_controller_msgs/StatusMsg]: /docs/en/popup/StatusMsg.msg/
[robotis_controller_msgs/JointCtrlModule]: /docs/en/popup/JointCtrlModule.msg/
[robotis_controller_msgs/GetJointModule]: /docs/en/popup/GetJointModule.srv/


[op3_action_module_msgs/IsRunning]: /docs/en/popup/op3_IsRunning.srv/

[op3_walking_module_msgs/WalkingParam]: /docs/en/popup/op3_WalkingParam.msg/
[WalkingParam.msg]: /docs/en/popup/op3_WalkingParam.msg/

[op3_walking_module_msgs/GetWalkingParam]: /docs/en/popup/op3_GetWalkingParam.srv/
[/op3_walking_module/config/param.yaml]:https://github.com/ROBOTIS-GIT/ROBOTIS-OP3/blob/master/op3_walking_module/config/param.yaml

[op3_online_walking_module_msgs/JointPose]: /docs/en/popup/op3_JointPose.msg/
[op3_online_walking_module_msgs/KinematicsPose]: /docs/en/popup/op3_KinematicsPose.msg/
[op3_online_walking_module_msgs/FootStepCommand]: /docs/en/popup/op3_FootStepCommand.msg/
[op3_online_walking_module_msgs/WalkingParam]: /docs/en/popup/op3_online_WalkingParam.msg/
[op3_online_walking_module_msgs/Step2DArray]: /docs/en/popup/op3_Step2DArray.msg/
[op3_online_walking_module_msgs/GetJointPose]: /docs/en/popup/op3_GetJointPose.srv/
[op3_online_walking_module_msgs/GetKinematicsPose]: /docs/en/popup/op3_KinematicsPose.msg/
[op3_online_walking_module_msgs/GetPreviewMatrix]: /docs/en/popup/op3_GetPreviewMatrix.srv/


[Creating new robot manager]:Creating_new_robot_manager.md
[op3_manager]:op3_manager.md

[OPENCR]:https://github.com/ROBOTIS-GIT/OpenCR/wiki/arduino_examples_op3
[Introduction to Humanoid Robotics]:http://www.springer.com/gp/book/9783642545351
[/op3_base_module/data/ini_pose.yaml]:https://github.com/ROBOTIS-GIT/ROBOTIS-OP3/blob/master/op3_base_module/data/ini_pose.yaml



[StartAction.msg]: /docs/en/popup/op3_StartAction.msg/
[IsRunning.srv]: /docs/en/popup/op3_IsRunning.srv/

[WalkingParam.msg]: /docs/en/popup/op3_WalkingParam.msg/
[GetWalkingParam.srv]: /docs/en/popup/op3_GetWalkingParam.srv/
[SetWalkingParam.srv]: /docs/en/popup/op3_SetWalkingParam.srv/

[FootStepArray.msg]: /docs/en/popup/op3_FootStepArray.msg/  
[FootStepCommand.msg]: /docs/en/popup/op3_FootStepCommand.msg/
[JointPose.msg]: /docs/en/popup/op3_JointPose.msg/  
[KinematicsPose.msg]: /docs/en/popup/op3_KinematicsPose.msg/
[PreviewRequest.msg]: /docs/en/popup/op3_PreviewRequest.msg/
[PreviewResponse.msg]: /docs/en/popup/op3_PreviewResponse.msg/
[Step2D.msg]: /docs/en/popup/op3_Step2D.msg/
[Step2DArray.msg]: /docs/en/popup/op3_Step2DArray.msg/
[WalkingParam.msg]: /docs/en/popup/op3_online_WalkingParam.msg/  

[GetJointPose.srv]: /docs/en/popup/op3_GetJointPose.srv/
[GetKinematicsPose.srv]: /docs/en/popup/op3_GetKinematicsPose.srv/
[GetPreviewMatrix.srv]: /docs/en/popup/op3_GetPreviewMatrix.srv/

[op3_offset_tuner_server]: op3_offset_tuner_server.md
[op3_offset_tuner_client]: op3_offset_tuner_client.md

[JointOffsetData.msg]: /docs/en/popup/op3_JointOffsetData.msg/
[JointOffsetPositionData.msg]: /docs/en/popup/op3_JointOffsetPositionData.msg/
[JointTorqueOnOff.msg]: /docs/en/popup/op3_JointTorqueOnOff.msg/
[JointTorqueOnOffArray.msg]: /docs/en/popup/op3_JointTorqueOnOffArray.msg/
[GetPresentJointOffsetData.srv]: /docs/en/popup/op3_GetPresentJointOffsetData.srv/


[ball_detector/circleSetStamped]: /docs/en/popup/ball_detector_CircleSetStamped_msg/

[geometry_msgs/Point]: /docs/en/popup/geometry_msgs_Point_msg/

[`usb_cam`]:http://wiki.ros.org/usb_cam
[HSV color]:https://en.wikipedia.org/wiki/HSL_and_HSV

[How to execute Default Demo]:OP3_How_to_execute_Default_Demo.md

[URDF-ROS Wiki]:http://wiki.ros.org/urdf
[Connect to ROS]:http://gazebosim.org/tutorials?cat=connect_ros
[op3_action_module]:op3_action_module

[How to execute GUI program]:op3_how_to_execute_gui_program.md

[op3_offset_tuner_client]:op3_offset_tuner_client.md
[op3_offset_tuner_server]:op3_offset_tuner_server.md

[op3_offset_tuner_msgs/JointOffsetData]: /docs/en/popup/JointOffsetData.msg/
[op3_offset_tuner_msgs/JointOffsetData]: /docs/en/popup/op3_JointOffsetData.msg/
[op3_offset_tuner_msgs/JointTorqueOnOffArray]: /docs/en/popup/JointTorqueOnOffArray.msg/
[op3_offset_tuner_msgs/JointTorqueOnOffArray]: /docs/en/popup/op3_JointTorqueOnOffArray.msg/
[op3_offset_tuner_msgs/GetPresentJointOffsetData]: /docs/en/popup/GetPresentJointOffsetData.srv/
[op3_offset_tuner_msgs/GetPresentJointOffsetData]: /docs/en/popup/op3_GetPresentJointOffsetData.srv/


[op3_gui_demo]:op3_gui_demo.md
[How to use walking tuner]:op3_how_to_use_walking_tuner.md
[How to use offset tuner]:op3_how_to_use_offset_tuner.md

[Installing ROBOTIS ROS Package]:OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md
