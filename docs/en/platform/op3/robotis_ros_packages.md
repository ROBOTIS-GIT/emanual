---
layout: archive
lang: en
ref: op3_robotis_ros_packages
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/robotis_ros_packages/
tabs: "Revision"
tab_title1: "2025 ~"
tab_title2: "~ 2023"
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
product_group: op3
page_number: 4
---

<style>body {counter-reset: h1 3 !important;}</style>

{::options parse_block_html="true" /}
<section data-id="{{ page.tab_title1 }}" class="tab_contents">

# [ROBOTIS ROS Packages](#robotis-ros-packages)

## [ROBOTIS OP3](#robotis-op3)

### [ROBOTIS ROS Modules](#robotis-ros-modules)

#### Motion Module

##### [op3_action_module](#op3-action-module)

###### Overview  
`op3_action_module` manages OP3 actions.  
This module is compiled as a libary so that it can be loaded in the `op3_manager`.
Actions contain all joint angles required for each time frame to define a complete motion.

###### Getting started  
- Download & Build  
  > Reference : [Installing ROBOTIS ROS Package]

- Usage  
  The Action Module is used in the form of a library in the manager to call actions to have the OP3 execute.
  > Reference : [Creating new robot manager]

###### ROS API  
- Subscribed Topics  
  `/robotis/action/page_num`([std_msgs/msg/Int32]{: .popup})  
  &emsp;&emsp; The page number of the action to run with the Module.  
  &emsp;&emsp; -&emsp;1 ~ 255 : play action  
  &emsp;&emsp; -&emsp;-1 : stop action  
  &emsp;&emsp; -&emsp;-2 : brake action  

  `/robotis/action/start_action`([op3_action_module_msgs/msg/StartAction]{: .popup})  
  &emsp;&emsp; Messages that contain a page number will cause that action to be played and any specified joint name and angles will be applied to the action execution result.    

- Published Topics  
  `/robotis/status`([robotis_controller_msgs/msg/StatusMsg]{: .popup})  
  &emsp;&emsp; Message that describes the current status of action_module.  

  `/robotis/movement_done`([std_msgs/msg/String]{: .popup})  
  &emsp;&emsp; Message published after the robot has finished its movement.  
  &emsp;&emsp; -&emsp;action : action finished  
  &emsp;&emsp; -&emsp;action_failed : action failed  

- Services  
  `/robotis/action/is_running`([op3_action_module_msgs/srv/IsRunning]{: .popup})  
  &emsp;&emsp; Service that checks whether an action is running or not.  

###### Parameters
  `/action file path`(string, default : "op3_action_module/data/motion_4095.bin")  
  &emsp;&emsp; File path that indicates the location of action libraries for OP3.  

##### [op3_base_module](#op3-base-module)

###### Overview  
`op3_base_module` is the module managing the initial default posture.  
This module is compiled as a library to be used in [op3_manager].  

###### Getting started  
- Download & Build  
  > Reference : [Installing ROBOTIS ROS Package]

- Usage  
  The Base Module is used in the manager in the form of library.  
  > Reference : [Creating new robot manager]

###### ROS API  
- Subscribed Topics  
  `/robotis/base/ini_pose`([std_msgs/msg/String]{: .popup})  
  &emsp;&emsp; Sending a message on this topic will have OP3 move to it's initial default posture. (This command is will still execute even when the base &emsp;&emsp; module is inactive).  

- Published Topics  
  `/robotis/enable_ctrl_module`([std_msgs/msg/String]{: .popup})  
  &emsp;&emsp; This message activates `op3_base_module` and has the OP3 move to it's initial posture.  

  `/robotis/status`([robotis_controller_msgs/msg/StatusMsg]{: .popup})  
  &emsp;&emsp; This message publishes the status of the `op3_base_module`.  

###### Data  
- Init posture  

 - data file path : [/op3_base_module/data/ini_pose.yaml]  

 - YAML format  
   - mov_time : Estimated time to move to target points (in seconds)  
   - via_num : Number of waypoints  
   - via_time : Estimated time between waypoints (as an array)   
   - via_pose : Angle of every joint for each waypoint (in degrees, as an array)  
   - tar_pose : Target joint angles for initial posture

##### [op3_head_control_module](#op3-head-control-module)

###### Overview
Controls the OP3's head movement.
This module is compiled to a library to be used in [op3_manager].  

###### Getting started  
- Download & Build  
  > Reference : [Installing ROBOTIS ROS Package]    

- Usage  
  The Head Module is used in the manager in the form of library.  
  > Reference : [Creating new robot manager]

###### ROS API
- Subscribed Topics  
  `/robotis/head_control/scan_command`([std_msgs/msg/String]{: .popup})  
  &emsp;&emsp; Publishing a message on this topic will request a "looking around" head motion to scan the environment.  

  `/robotis/head_control/set_joint_states`([sensor_msgs/msg/JointState]{: .popup})  
  &emsp;&emsp; Head joints will rotate to match angles written in messages published to this topic.  

  `/robotis/head_control/set_joint_states_offset`([sensor_msgs/msg/JointState]{: .popup})  
  &emsp;&emsp; Head joints will adjust their current angles according to offset values written in messages published to this topic.  


- Published Topics  
  `/robotis/status`([robotis_controller_msgs/msg/StatusMsg]{: .popup})  
  &emsp;&emsp; This message notifies the status of head_control_module.  

##### [op3_walking_module](#op3-walking-module)

###### Overview
This module controls the OP3's walking state.
This module is compiled as a library to be used in [op3_manager].  

###### Getting started
- Download & Build
  > Reference : [Installing ROBOTIS ROS Package]

- Usage
  The Walking Module is used in the manager in the form of library.  
  > Reference : [Creating new robot manager]

###### ROS API
- Subscribed Topics  
  `/robotis/walking/command`([std_msgs/msg/String]{: .popup})  
  &emsp;&emsp; Messages on this topic request starts and stops for walking.  

  `/robotis/walking/set_params`([op3_walking_module_msgs/msg/WalkingParam]{: .popup})  
  &emsp;&emsp; Messages on this topic set necessary parameters for walking. For details, refer to [WalkingParam.msg].  

- Published Topics  
  `/robotis/status`([robotis_controller_msgs/msg/StatusMsg]{: .popup})  
  &emsp;&emsp; This topic publishes the current status of the op3_walking_module.  

- Services  
  `/robotis/walking/get_params`([op3_walking_module_msgs/msg/GetWalkingParam]{: .popup})  
  &emsp;&emsp; This service reads walking parameters.  

###### Parameters
`/walking_param_path`(string, default : "op3_walking_module/config/param.yaml")  
&emsp;&emsp; File path that indicates the location of walking parameters.  

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

   - hip_pitch_offset: pitch offset (y-coordinate) at the hip level. Values are for DYNAMIXEL position values for hip pitch joints. [degree]  
     ![](/assets/images/platform/op3/op3_walking_module_image147.jpg)

   - period_time: Time required for ROBOTIS-OP3 to complete two full steps (left and right foot) [ms]  
     ![](/assets/images/platform/op3/op3_walking_module_image148.jpg)

   - dsp_ratio: Time ratio of the period when both feet are touching the ground to the period of time with only one foot on the ground in each walking cycle.  
     ![](/assets/images/platform/op3/op3_walking_module_image149.jpg)

   - foot_height: foot elevation during walk [m]  
     ![](/assets/images/platform/op3/op3_walking_module_image152.jpg)

   - swing_right_left: swing to either left or right during walk [m]  
     ![](/assets/images/platform/op3/op3_walking_module_image153.jpg)

   - swing_top_down: up and down body swing during walk [m]  
     ![](/assets/images/platform/op3/op3_walking_module_image154.jpg)

   - pelvis_offset: roll offset (x-coordinate) at the pelvis level. Values are for DYNAMIXEL position values for hip roll joints [degree]  
     ![](/assets/images/platform/op3/op3_walking_module_image155.jpg)

   - arm_swing_gain: Arm swing gain with respect to Step forward/back. If the left foot moves forward then the right arm swings.  

   - balance_hip_roll_gain: Gain with respect to the gyroscope roll  

   - balance_knee_gain: Gain with respect to the gyroscope pitch  

   - balance_ankle_roll_gain: Gain with respect to the gyroscope roll  

   - balance_ankle_pitch_gain: Gain with respect to the gyroscope pitch  

   - p_gain: not yet implemented  

   - i_gain: not yet implemented  

   - d_gain: not yet implemented  


##### [op3_direct_control_module](#op3-direct-control-module)

###### Overview  
This module allows for direct control over OP3 joints.

###### Getting started  
- Download & Build  
  > Reference : [Installing ROBOTIS ROS Package]

- Usage  
  The Direct Control Module is used in the form of lib in the manager.  
  > Reference : [Creating new robot manager]

###### ROS API  
- Subscribed Topics  
  `/robotis/direct_control/set_joint_states`([sensor_msgs/msg/JointState]{: .popup})  
  &emsp;&emsp; Listens for messages that include parameters and joint information for the joint the user wants to move.  

- Published Topics  
  `/robotis/status`([robotis_controller_msgs/msg/StatusMsg]{: .popup})  
  &emsp;&emsp; Message that describes the current status of the action_module.  

###### Parameters  
  `/robotis/direct_control/default_moving_time`(double, default : 0.5)  
  &emsp;&emsp; minimum time to move to target position  

  `/robotis/direct_control/default_moving_angle`(double, default : 30)  
  &emsp;&emsp; angular movement speed per second for moving to target position
  
  `/robotis/direct_control/check_collision`(bool, default : true)  
  &emsp;&emsp; enable pseudo self-collision checking  
  
##### [op3_tuning_module](#op3-tuning-module)

###### Overview  
This module is used for motion tuning and gain adjustment.

###### Getting started  
- Download & Build  
  > Reference : [Installing ROBOTIS ROS Package]

- Usage  
  The Tuning Module is used in the form of lib in the manager.  
  > Reference : [Creating new robot manager]

###### ROS API  
- Subscribed Topics  
  `/robotis/tuning_module/tuning_pose`([std_msgs/msg/String]{: .popup})  
  &emsp;&emsp; Listens for messages to change the posture for gain tuning

  `/robotis/tuning_module/joint_offset_data`([op3_tuning_module_msgs/msg/JointOffsetData]{: .popup})  
  &emsp;&emsp; Listens for messages used to change the offset of joints

  `/robotis/tuning_module/joint_gain_data`([op3_tuning_module_msgs/msg/JointOffsetData]{: .popup})  
  &emsp;&emsp; Listens for messages used to change joint gains

  `/robotis/tuning_module/torque_enable`([op3_tuning_module_msgs/msg/JointTorqueOnOffArray]{: .popup})  
  &emsp;&emsp; Listens for messages to enable or disable torque to joints

  `/robotis/tuning_module/command`([std_msgs/msg/String]{: .popup})  
  &emsp;&emsp; Listens for command messages to save gains or offsets

- Published Topics  
  `/robotis/status`([robotis_controller_msgs/msg/StatusMsg]{: .popup})  
  &emsp;&emsp; Describes the current status of the action_module.    

  `/robotis/enable_ctrl_module`([std_msgs/msg/String]{: .popup})  
  &emsp;&emsp; Messages publishing updates for motion module changes from the robotis_controller  

  `/robotis/sync_write_item`([robotis_controller_msgs/msg/SyncWriteItem]{: .popup})  
  &emsp;&emsp; Messages to sync write directly to DYNAMIXELs using robotis_controller  

  `/robotis/enable_offset`([std_msgs/msg/Bool]{: .popup})  
  &emsp;&emsp; Messages for turning on / off offsets in robotis_controller  
    
- Service Server  
  `/robotis/tuning_module/get_present_joint_offset_data`  ([op3_tuning_module_msgs/msg/GetPresentJointOffsetData]{: .popup})  
  &emsp;&emsp; Service to request joint state information, including offset  
   
- Service Client  
  `/robotis/set_present_ctrl_modules`([robotis_controller_msgs/msg/SetModule]{: .popup})  
  &emsp;&emsp; Service for changing the motion module of robotis_controller  

  `/robotis/load_offset`([robotis_controller_msgs/msg/LoadOffset]{: .popup})  
  &emsp;&emsp; Service to apply new offsets to robotis_controller  
  

###### Parameters  
  `offset_file_path`(string, default : `~/data/tune_pose.yaml`)  
  &emsp;&emsp; This path indicates the location of the file that contains the offset data for each joint.  

  `init_file_path`(string, default : `~/data/offset.yaml`)  
  &emsp;&emsp; This path indicates the location of the file that contains initialization information for each joint  

##### Sensor Module

##### [open_cr_module](#open-cr-module)

###### Overview  
   
This module provides OpenCR sensor and IO interface control for Gyro, Acceleration, Button and LED functions.

  > Reference : [OPENCR]

###### Getting started
- Download & Build  
  > Reference : [Installing ROBOTIS ROS Package]   

###### Usage
The Sensor Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

###### ROS API
- Published Topics  
  `/robotis/status`([robotis_controller_msgs/msg/StatusMsg]{: .popup})  
&emsp;&emsp; This message contains the current status of the open_cr_module.  

  `/robotis/open_cr/imu`([sensor_msgs/msg/Imu]{: .popup})  
&emsp;&emsp; This message contains current IMU data from the OpenCR.  

  `/robotis/open_cr/button`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; This message contains the status of the buttons connected to the OpenCR GPIO.  

### [OP3 Manager](#op3-manager)

#### Overview  
`op3_manager` package controls the ROBOTIS Framework on the ROBOTIS OP3.  
Refer to the below link to create a new robot manager.  
> Reference : [Creating new robot manager]

#### Getting started  
##### Download & Build  
 > Reference : [Installing ROBOTIS ROS Package]

##### Run  
Execute the program with a `.launch` file in order to load ROS parameters.  
The command should be executed under the root account to configure the correct Tread attributes.  
`op3_manager` has direct control over ROBOTIS-OP3, other control programs such as `op3_walking_tuner` and `op3_action_editor` should not be running.  
Before executing the `op3_manager` launch file, other programs should be terminated.  
```bash
$ sudo bash  
[sudo] password for robotis:   
# ros2 launch op3_manager op3_manager.launch.py  
```

#### ROS API  

##### Parameters  
launch parameters  

`gazebo` (bool, default: false)  
&emsp;&emsp; Whether to run the program in gazebo mode.  

`gazebo_robot_name` (string, default: "")  
&emsp;&emsp; Configure the robot name for the joint_state topic when running in gazebo mode.  
&emsp;&emsp; ex) If `op3` is the `gazebo_robot_name`, `/op3/joint_states` will be the joint state node.

`offset_file_path` (string, default: "")  
&emsp;&emsp; This path indicates the location of the file that contains offset data of each joint and initial posture data for offset adjustment.

`robot_file_path` (string, default: "")  
&emsp;&emsp; This path indicates the location of the .robot file that contain robot description data.

`init_file_path` (string, default: "")  
&emsp;&emsp; This path indicates the location of the file that contains initialization information for each joint.

`device_name` (string, default: "/dev/ttyUSB0")  
&emsp;&emsp; This port is used to communicate with the OpenCR that manages the DYNAMIXEL power supply.

`baud_rate` (int, default: "2000000")  
&emsp;&emsp; This baud rate is used to communicate with the OpenCR that manages the DYNAMIXEL power supply.

#### Modules  

##### Motion Modules
 1. [op3_action_module] : This manages all joint actions.  
 2. [op3_base_module] : This module manages initial posture and basic functions.  
 3. [op3_head_control_module] : This module controls the OP3's head.  
 4. [op3_walking_module] : This module controls walking.  
 5. [op3_direct_control_module] :  This module controls ROBOTIS-OP3 joints directly.  
 6. [op3_tuning_module] : This module is used to tune the gain and offset.  

##### Sensor Module  
 1. [open_cr_module] : This module is required to use the OpenCR as a sensor.  

#### Source  
Structure of the `op3_manager`:
 - Initialize with Robot file (`.robot`)and Joint initialize file (`.yaml`).  
 - Apply offset file(`.yaml`).  
 - Add modules (each module manages calculation for control or sensor related functions).  
 - Initiate timer in the controller.  
 - According to the frequency stated in the `.robot` file, exchange data with DYNAMIXEL and OpenCR.


```cpp
...

// initialize robot
if (controller->initialize(g_robot_file, g_init_file) == false)
{
  ROS_ERROR("ROBOTIS Controller Initialize Fail!");
  return -1;
}

// load offset
if (g_offset_file != "")
  controller->loadOffset(g_offset_file);

sleep(1);

/* Add Sensor Module */
controller->addSensorModule((SensorModule*) OpenCRModule::getInstance());

/* Add Motion Module */
controller->addMotionModule((MotionModule*) ActionModule::getInstance());
controller->addMotionModule((MotionModule*) BaseModule::getInstance());
controller->addMotionModule((MotionModule*) HeadControlModule::getInstance());
controller->addMotionModule((MotionModule*) WalkingModule::getInstance());

// start timer
controller->startTimer();

...
```

### Others

#### [op3_balance_control](#op3-balance-control)

##### Overview  
`op3_balance_control` is a library for balance control.  
This library is used to improve walking performance.  
Currently, this library is not implemented because of sensor requirements (ft & IMU).  

#### [op3_localization](#op3-localization)

##### Overview  
`op3_localization` is a ros node for localization.  
This node publishes TF data from /world to /body_link.  

##### ROS API

###### Subscribed Topics
`/robotis/pelvis_pose`([geometry_msgs/msg/PoseStamped]{: .popup})  
&emsp;&emsp; This topic will receive the body_link pose from /world.  

`/robotis/pelvis_pose_reset`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; This topic will reset the body_link pose to default value.  


## [ROBOTIS OP3 msgs](#robotis-op3-msgs)

### Module msgs

#### [op3_action_module_msgs](#op3-action-module-msgs)

##### Overview
The followings are Messages and Services used for the [op3_action_module].  

##### ROS Message Type
* [op3_action_module_msgs/msg/StartAction]{: .popup}

##### ROS Service Type
* [op3_action_module_msgs/srv/IsRunning]{: .popup}

#### [op3_walking_module_msgs](#op3-walking-module-msgs)

##### Overview
Messages and Services used in the [op3_walking_module]

##### ROS Message Type
* [WalkingParam.msg]{: .popup}  

##### ROS Service Type  
* [GetWalkingParam.srv]{: .popup}
* [SetWalkingParam.srv]{: .popup}


#### [op3_tuning_module_msgs](#op3-tuning-module-msgs)

##### Overview
Messages and Services used in the [op3_tuning_module]  

##### ROS Message Type
* [JointOffsetData.msg]{: .popup}
* [JointOffsetPositionData.msg]{: .popup}
* [JointTorqueOnOff.msg]{: .popup}
* [JointTorqueOnOffArray.msg]{: .popup}

##### ROS Service Type  
* [GetPresentJointOffsetData.srv]{: .popup}

### Tool msgs

#### [op3_offset_tuner_msgs](#op3-offset-tuner-msgs)

##### Overview
The following Messages and Services are used for the [op3_offset_tuner_server] and the [op3_offset_tuner_client].  

##### ROS Message Type
* [JointOffsetData.msg]{: .popup}
* [JointOffsetPositionData.msg]{: .popup}
* [JointTorqueOnOff.msg]{: .popup}
* [JointTorqueOnOffArray.msg]{: .popup}

##### ROS Service Type  
 * [GetPresentJointOffsetData.srv]{: .popup}

## [ROBOTIS OP3 Demo](#robotis-op3-demo)
### [ball_detector](#ball-detector)

#### Overview
This chapter explain ball detecting package for ROBOTIS OP3's vision demonstration.  
The package utilizes the OpenCV library in order to search for a ball with a specific color.

#### Getting started

##### Download & Build
  > Reference : [Installing ROBOTIS ROS Package]    

##### Run
- Launch with usb_cam package  
Execute the program with a `.launch` file in order to load ROS parameters.  
  ```bash
  $ ros2 launch op3_ball_detector ball_detector_from_usb_cam.launch.py
  ```
  > Reference : [`usb_cam`]  
  > Reference : The following software must be pre-installed to use the `usb_cam` package.  
  > `$ sudo apt-get install v4l-utils`

#### ROS API

##### Subscribed Topics  
`~/enable`([std_msgs/msg/Bool]{: .popup})  
&emsp;&emsp; OP3 will start searching for a ball when a `True` message, and stop when a `False` message is published to this topic.

`~/image_in`([sensor_msgs/msg/Image]{: .popup})  
&emsp;&emsp; The message in this topic contains camera input image for ball searching.  

`~/cameraInfo_in`([sensor_msgs/msg/CameraInfo]{: .popup})  
&emsp;&emsp; The message in this topic contains camera information for the corresponding input image.  

##### Published Topics  
`~/image_out`([sensor_msgs/msg/Image]{: .popup})  
&emsp;&emsp; The message in this topic contains an output image after the ball searching process.  

`~/camera_info`([sensor_msgs/msg/CameraInfo]{: .popup})  
&emsp;&emsp; The message in this topic contains camera information for the output image.  

`~/circle_set`([ball_detector/circleSetStamped]{: .popup})  
&emsp;&emsp; Detected ball information  
  - `header`([std_msgs/msg/Header]{: .popup}) : Header information  
  - `circles`([geometry_msgs/msg/Point]{: .popup}) : Count of detected balls  
    - `x` X coordinate of the center of ball in the image coordinate system  
    - `y` Y coordinate of the center of ball in the image coordinate system  
    - `z` Radius of the detected ball  

#### Parameters
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

> Reference : [HSV color]  

`/filter_h_min`, `/filter_h_max`(int, default : )  
&emsp;&emsp; Minimum and maximum value of H filter in HSV color representation  

`/filter_s_min`, `/filter_s_max`(int, default : )  
&emsp;&emsp; Minimum and maximum value of S filter in HSV color representation  

`/filter_v_min`, `/filter_v_max`(int, default : )  
&emsp;&emsp; Minimum and maximum value of V filter in HSV color representation  

`/use_second_filter`(bool, default : )  
&emsp;&emsp; Enable second color filter  

`/filter_debug`(bool, default : )  
&emsp;&emsp; Enable output image for debugging  

#### How to change the parameters  
> Reference : [How to use ball detector]

##### using the `.yaml`  
- [ball_detector_params.yaml]  
  ```yaml
  gaussian_blur_size: 7
  gaussian_blur_sigma: 2
  canny_edge_th: 100
  hough_accum_resolution: 1
  min_circle_dist: 100
  hough_accum_th: 28
  min_radius: 20
  max_radius: 300
  filter_h_min: 350
  filter_h_max: 15
  filter_s_min: 200
  filter_s_max: 255
  filter_v_min: 60
  filter_v_max: 255
  use_second_filter: false
  filter2_h_min: 30
  filter2_h_max: 355
  filter2_s_min: 0
  filter2_s_max: 40
  filter2_v_min: 200
  filter2_v_max: 255
  ellipse_size: 2
  filter_debug: false
  ```

##### using the `dynamic_reconfigure`  
  ![](/assets/images/platform/op3/ball_detector_node_02.png)

### [op3_demo](#op3-demo)

#### Overview
The included basic demonstrations for OP3 are playing soccer, vision based face tracking and a sequence of various simple actions.  

#### Getting started

##### Download & Build
  > Reference : [Installing ROBOTIS ROS Package]  

##### Run
- Execute `.launch` file to initiate demonstration  
 ```bash
 $ ros2 launch op3_demo demo.launch.xml  
 ```
- With a successful launch of the program, OP3 will announce that it is ready for the demonstration.  

##### Usage
  > Reference : [How to execute Default Demo]

 - Button Functions  
 From the left, the buttons are Mode, Start, User and Reset.  
   - Mode button  
     - short press : In Ready Mode, mode button switches to the next demo (soccer > vision > action)  
     - long press : While playing a demo, press and hold the mode button to return to Demo Ready Mode.  

   - Start button  
     - short press : Play selected demo from Ready Mode. If a demo is running, the start button will pause or resume the demo.    

   - User button
    - Additional button provided for user defined features, not used by the included demos.

   - Reset button  
     - Pressing the Reset button will cut off the power to all connected DYNAMIXEL actuators in the OP3.  

#### ROS API
 The ROS APIs used in each demo will be explained in their corresponding sections.  

##### Subscribed Topics
`/robotis/open_cr/button`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; Messages in this topic are used to process button control.

##### Published Topics
`/robotis/base/ini_pose`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; Messages in this topic are used for the initial posture of ROBOTIS-OP3.

`/robotis/sync_write_item`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; Messages to this topic are used to sync write included data to the ROBOTIS-OP3.
&emsp;&emsp; ex) LED controls

`/play_sound_file`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; Messages to this topic must contain the path a voice file to use for verbal announcement.

#### Demos
The following is the list of available demonstrations.  

##### [Soccer Demo](#soccer-demo)
OP3 will search for a colored ball and play with it.

##### [Vision Demo](#vision-demo)
OP3 will detect faces and follow them.

##### [Action Demo](#action
OP3 will play a sequence of pre-defined actions while speaking.

## [ROBOTIS OP3 Common](#robotis-op3-common)

### [op3_description](#op3-description)

#### Overview
ROBOTIS OP3 URDF Model  

![](/assets/images/platform/op3/op3_urdf_rviz.png)

#### Make a URDF Model
[URDF-ROS Wiki]

#### Package
`doc` : documentation for ROBOTIS OP3 joint & link information   
`launch` : launch file to execute Rviz   
`stl` : STL files of ROBOTIS OP3 parts   
`src` : ROS node for Rviz to publish imaginary gripper joint   
`urdf` : urdf & xacro files for Thormang3 model

### [op3_gazebo](#op3-gazebo)

#### Overview
ROBOTIS OP3 Gazebo Simulation

#### Gazebo with ROS
[Connect to ROS]

#### Package
`config` : ROS controller for gazebo   
`launch` : launch files to execute gazebo simulation   
`worlds` : simulation environments   

## [ROBOTIS OP3 Tools](#robotis-op3-tools)

### [op3_action_editor](#op3-action-editor)

#### Overview   
This section explains how to create and edit action file used in the [op3_action_module] of ROBOTIS-OP3.   

##### Action File
An action file contains ROBOTIS-OP3's poses and time data. The action file is written as binary file so users can read its contents with op3_action_editor. ROBOTIS currently provides a default action file with source code. It is located in "op3_action_module/data" directory.  

The action file contains 256 pages. Each page can store up to 7 stages (or steps) of action data. The default action file does not use all pages and users can add their own actions by writing them on an empty page.   

#### Getting started

##### Download & Build
  > Reference : [Installing ROBOTIS ROS Package]  

##### Run
Run the executor file.  
`op3_action_editor` has direct control over ROBOTIS-OP3, other control programs such as `op3_manager`, `op3_offset_tuner` and `op3_walking_tuner` should not be running.  
```bash
$ ros2 run op3_action_editor executor.py
```

##### UI

![](/assets/images/platform/op3/thormang3_action_editor_tui.jpg)

**Page number**: Page number is the listed page number for the current action. If the user wants to create a new action pose, they can use any empty page.  
**Page title**: ROBOTIS recommends adding a page title when creating a new action on an empty page.  
**Current position**: The current position describes the position of the DYNAMIXEL servos in the OP3. This data is represented by STP7 in op3_action_editor. Sometimes the position may be displayed as ---- in op3_action_editor. This means the position of the DYNAMIXEL has not been read (or torque is off).
If user turns a DYNAMIXEL off, current position cannot be read until turn it back on.
User can turn off the torque to specific DYNAMIXELs. This is very convenient when acquiring position values directly from DYNAMIXELs for a new robot posture instead of calculating those values. To do that, turn off the torque of desired DYNAMIXEL, then move the robot to the desired posture by hand until and turn the torque back on. The robot will remain at the current posture and the user can read position values from the corresponding DYNAMIXEL.  
**Steps or stages**: Each page can store up to 7 steps, from STP0 to STP6. However, some actions may require more than 7 stages to perform completely. This can be resolved by simply using multiple pages and linking them with **Next**: Next indicates whether to continue an action on a different page. To continue actions, just list the page number where the action is to be continued. Number 0 indicates that action does not continue onto another page (default value). Linked page do not have to be in numerical order.  
**Play Count**: Play Count is the number of times the action on the page is to be played. 
**Exit**: There might be some cases when an action has to be stopped. In these cases, the robot may be in an unstable position. Exit is much like "Next", but is used to define an action to help the OP3 return to a stable pose if an action is exited during execution. If "Exit" is 0, it means that there are no linked exit page (default value).  
Tip: When calling an action requires multiple pages, ROBOTIS strongly suggests the user to call the action from the starting page. For example, clap starts at page 7 and ends at page 8. This means you should call page 7 when calling clap. Calling the page 8 may cause unexpected behavior from the robot.  
**STP7**: "STP7" column is the current position of connected DYNAMIXELs. "----" means that torque has been disabled or the servo is not connected.  
**PauseTime**: "PauseTime" is the pause duration period for motion playback for the step STP[x].  
**Time(x 8msec)** : "Time" is the time period for ROBOTIS-OP3 to complete the step STP[x]. Each time unit is 8ms of real time.  

It is strongly advised that when testing newly-created or edited actions, there should be small incremental changes in position, speed/time, and pause values for the sake of ROBOTIS-OP3's stability.  

##### The Contents of The Default Action File
The below table shows the contents of the default action file.  

| page number | page title | brief description of page                              | number of pages |
|:------------|:-----------|:-------------------------------------------------------|:----------------|
| 1           | walki_init | Initial standing pose                                  | 1               |
| 2           | hello      | Greeting                                               | 1               |
| 3           | thank_you  | Thank you                                              | 1               |
| 4           | yes        | Yes                                                    | 1               |
| 5           | no         | No                                                     | 1               |
| 6           | fighting   | Fighting                                               | 1               |
| 7           | clap       | Clap                                                   | 2               |
| 9           | S_H_RE     | Ready for shaking hands                                | 1               |
| 10          | S_H        | Shaking hands                                          | 1               |
| 11          | S_H_END    | Move to initial pose from ready pose for shaking hands | 1               |
| 12          | scanning   | looking around                                         | 1               |
| 13          | ceremony   | ceremony                                               | 1               |

##### Basic Command of Action Editor
The following command list can also be seen inside the action editor by typing 'help'

![](/assets/images/platform/op3/thormang3_action_editor_tui_command_list.jpg)

**exit**: exits the program.  
**re**: refreshes the screen.  
**b**: moves to the previous page.  
**n**: moves to the next page.  
**page [index]**: moves to the [index] page. Typing page 5 outputs data from page 5 on screen.  
**list**: outputs a list of pages.  
**new**: initializes current page by clearing all actuator position data.  
**copy [index]**: copies data from page [index] to current page. For example if you are on page 5 and want to copy page 9 then type copy 9.  
**set [value]**: sets position value on the chosen actuator. For example If you want ID19 (head pan) to have a value of 512 then using the keyboard's directional keys place the cursor on ID19 and type set 512.  
**save**: saves any changes you've made. The saved motion file motion_4096.bin can be found at "op3_action_module/data"
**play**: plays motion(s) of current page.  
**name**: changes the name of the current page. You can view the name of the page at the top right portion of the screen. For example, page 2 is titled hello; to change the name type name and press the "ENTER" key. "name:" will appear at the bottom of the screen. Input the desired name for the page, good for instance, and press the "ENTER" key again.  
**i**: inserts data from STP7 to STP0. Moves data from STP[x] to STP[x + 1] if any.  
**i [index]**: inserts data from STP7 to STP[index]. Moves data from STP[index] to STP[index + 1] if any.  
**m [index] [index2]**: moves data from [index2] to [index].  
**d [index]**: deletes data from STP[index]. Moves data from STP[index] to STP[index - 1].  
**on/off**: turns on/off torque for all connected DYNAMIXELs.  
**on/off [index1] [index2] [index3]** : turns torque on/off from ID[index1] ID[index2] ID[index3]. For example off 20 releases torque from ID20. Notice that STP7 for ID20 will read [----]. Typing on 20 turns torque from ID20 on again and the screen outputs the current position data of ID20.  

##### Example Action editing with op3_action_editor
1. Run the op3_action_editor  
2. Find the page where the "walking_init page" is by typing "list"  

    ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example1.jpg)

3. Exit the list and go to any blank page by typing "page [x]"(for example, page 15).

    ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example2.jpg)

4. Copy page 1 to page [x].  

    ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example3.jpg)

5. Go to "walking_init" pose by typing "play"  
6. Turn off the torque of ID 2, 4 and 8 by typing "off 2 4 8"  

    ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example4.jpg)

7. After getting the desired pose turn torque on again by typing on, insert the pose to step 1 by typing "i 1"  

    ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example5.jpg)

8. Edit "Pause Time", "Time" of STP1 and "Page Step" as shown below.  

    ![](/assets/images/platform/op3/thormang3_action_editor_tui_action_editing_example6.jpg)

9. Type "play" and check the ROBOTIS-OP3's action  

### [op3_gui_demo](#op3-gui-demo)

#### Overview   
`op3_gui_demo` is a GUI application to control ROBOTIS-OP3.  
Within this program, the user can adjust module settings, walking tuner, head joint control and play actions.  

![](/assets/images/platform/op3/op3_gui_diagram.png)

#### Getting started

##### Download & Build
> Reference : [Installing ROBOTIS ROS Package]

##### Run
Execute the launch file.  
```bash
$ ros2 launch op3_gui_demo op3_demo.launch.py
```

##### UI

![](/assets/images/platform/op3/op3_gui.png)

##### Usage
> Reference : [How to execute GUI program]

#### ROS API

##### Subscribed Topics
`/robotis/status`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; This message describes the current status of the ROBOTIS-OP3.

`/robotis/present_joint_ctrl_modules`([robotis_controller_msgs/msg/JointCtrlModule]{: .popup})  
&emsp;&emsp; This message reports which module is currently in use on the ROBOTIS-OP3.

`/robotis/head_control/present_joint_states`([sensor_msgs/msg/JointState]{: .popup})  
&emsp;&emsp; This message reports present angles for each joint.  

##### Published Topics
`/robotis/base/ini_pose`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; This message will instruct the ROBOTIS-OP3 to move to the initial posture.

`/robotis/enable_ctrl_module`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; This message notifies framework to activate a specific module for ROBOTIS-OP3.  

`/robotis/sync_write_item`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; This message contains data to be written to ROBOTIS-OP3 with the Sync Write command.  
&emsp;&emsp; ex) LED control

`/robotis/head_control/set_joint_states_offset`([sensor_msgs/msg/JointState]{: .popup})  
&emsp;&emsp; This message controls head joints.

`/play_sound_file`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; This message contains the path of voice files for speaking.

`/robotis/walking/command"`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; This message commands walking module of ROBOTIS-OP3.

`/robotis/walking/set_params"`([op3_walking_module_msgs/msg/WalkingParam]{: .popup})  
&emsp;&emsp; This message configures walking parameters of the walking module.

`/robotis/action/page_num`([std_msgs/msg/Int32]{: .popup})  
&emsp;&emsp; This message transfers page number to action_module to play actions.

##### Services
`/robotis/get_present_joint_ctrl_modules`([robotis_controller_msgs/msg/GetJointModule]{: .popup})  
&emsp;&emsp; This service acquires which module is currently in use on the ROBOTIS-OP3.  

`/robotis/walking/get_params`([op3_walking_module_msgs/msg/GetWalkingParam]{: .popup})  
&emsp;&emsp; This service acquires walking parameters.  

#### Parameters
`/demo_config`(string, default : "/op3_gui_demo/config/demo_config.yaml")  
&emsp;&emsp; This yaml file saves joint names, available modules, list of module preset button.  

### [op3_tuner_client](#op3-tuner-client)

#### Overview
A GUI Node that can adjust the offset and gain of the ROBOTIS-OP3.  
It is used with the [op3_manager].  

#### Getting started

##### Download & Build
> Reference : [Installing ROBOTIS ROS Package]

##### Run
```bash
$ ros2 launch op3_tuner_client op3_tuner_client.launch.xml
```

##### Usage
> Reference : [How to use tuner client]

#### ROS API

##### Published Topics
`/robotis/tuning_module/tuning_pose`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; Message that is used to change the posture for gain tuning

`/robotis/tuning_module/joint_offset_data`([op3_tuning_module_msgs/msg/JointOffsetData]{: .popup})  
&emsp;&emsp; Message used to change the joint offset  

`/robotis/tuning_module/joint_gain_data`([op3_tuning_module_msgs/msg/JointOffsetData]{: .popup})  
&emsp;&emsp; Message used to change the joint gain  

`/robotis/tuning_module/torque_enable`([op3_tuning_module_msgs/msg/JointTorqueOnOffArray]{: .popup})  
&emsp;&emsp; Message used to enable/disable the torque of joints  

`/robotis/tuning_module/command`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; Message to execute commands (ex. save gain, save offset)   

##### Services
`/robotis/tuning_module/get_present_joint_offset_data`([op3_tuning_module_msgs/msg/GetPresentJointOffsetData]{: .popup})  
&emsp;&emsp; Service used to get the joint states including offset

### [op3_offset_tuner_server](#op3-offset-tuner-server)

#### Overview   
ROBOTIS-OP3 Offset Tuner Node   
Data related to the Offset can be Tuned, Loaded and Saved.   
It is used with the [op3_offset_tuner_client].  

#### Getting started

##### Download & Build
> Reference : [Installing ROBOTIS ROS Package]  

##### Run
Execute the launch file to start offset tuner server.  
`op3_offset_tuner_server` has direct control over ROBOTIS-OP3, other control programs such as `op3_manager`, `op3_action_editor` and `op3_walking_tuner` should not be running.
```bash
$ ros2 launch op3_offset_tuner_server op3_offset_tuner_server.launch.xml
```

##### Usage
> Reference : [How to use offset tuner]  

#### ROS API

##### Subscribed Topics
* `/robotis/base/send_tra`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; The topic for specifying the start and end of trajectory following.  

* `/robotis/offset_tuner/joint_offset_data`([op3_offset_tuner_msgs/msg/JointOffsetData]{: .popup})  
&emsp;&emsp; The topic for updating joint offset related parameters.  

* `/robotis/offset_tuner/torque_enable`([op3_offset_tuner_msgs/msg/JointTorqueOnOffArray]{: .popup})  
&emsp;&emsp; The topic for updating Torque enable/disable command for joints.

* `/robotis/offset_tuner/command`([std_msgs/msg/String]{: .popup})  
&emsp;&emsp; The topic transfers command to the [op3_offset_tuner_client].  
&emsp;&emsp; - "save"     : Saves current offset to yaml  
&emsp;&emsp; - "ini_pose" : Take the initial posture for offset tuning  

##### Services
* `robotis/offset_tuner/get_present_joint_offset_data`([op3_offset_tuner_msgs/msg/GetPresentJointOffsetData]{: .popup})  
&emsp;&emsp; The service obtains current offset data from the [op3_offset_tuner_client].  

##### Parameters
`/offset_path`(string, default : "")  
&emsp;&emsp; The yaml file path to save offsets.   

`/robot_file_path`(string, default : "")  
&emsp;&emsp; This path indicates the location of .robot file that contains robot description data.  

`/init_file_path`(string, default : "")  
&emsp;&emsp; This path indicates the location of the file that contains initialization information of each joint.  

### [op3_offset_tuner_client](#op3-offset-tuner-client)

#### Overview
The GUI Node that can adjust offset values for ROBOTIS-OP3.  
It is used with the [op3_offset_tuner_server].  

#### Getting started

##### Download & Build
> Reference : [Installing ROBOTIS ROS Package]

##### Run
```
$ rosrun op3_offset_tuner_client op3_offset_tuner_client
```

##### Usage
> Reference : [How to use offset tuner]

#### ROS API

##### Published Topics
`/robotis/offset_tuner/joint_offset_data`([op3_offset_tuner_msgs/msg/JointOffsetData]{: .popup})            
&emsp;&emsp; The topic specifies Joint offset data   

`/robotis/offset_tuner/torque_enable`([op3_offset_tuner_msgs/msg/JointTorqueOnOffArray]{: .popup})    
&emsp;&emsp; The topic executes the Torque on/off command for each DYNAMIXEL

`/robotis/offset_tuner/command`([std_msgs/msg/String]{: .popup})    
&emsp;&emsp; The topic executes other utility commands (save, initial posture, etc).   

##### Services
`/robotis/offset_tuner/get_present_joint_offset_data`([op3_offset_tuner_msgs/msg/GetPresentJointOffsetData]{: .popup})  
&emsp;&emsp; The service obtains saved joint offset values


[std_msgs/msg/Int32]: /docs/en/popup/op3_ros2/std_msgs_int32_message
[std_msgs/msg/String]: /docs/en/popup/op3_ros2/std_msgs_string
[std_msgs/msg/Bool]: /docs/en/popup/op3_ros2/std_msgs_bool_msg
[std_msgs/msg/Float64]: /docs/en/popup/op3_ros2/std_msgs_float64_msg
[std_msgs/msg/Header]: /docs/en/popup/op3_ros2/std_msgs_Header
[sensor_msgs/msg/JointState]: /docs/en/popup/op3_ros2/sensor_msgs_JointState_msg
[sensor_msgs/msg/Imu]: /docs/en/popup/op3_ros2/sensor_msgs_Imu_msg
[sensor_msgs/msg/Image]: /docs/en/popup/op3_ros2/sensor_msgs_Image
[sensor_msgs/msg/CameraInfo]: /docs/en/popup/op3_ros2/sensor_msgs_CameraInfo_msg
[geometry_msgs/msg/Point]: /docs/en/popup/op3_ros2/geometry_msgs_Point_msg/
[geometry_msgs/msg/Pose]: /docs/en/popup/op3_ros2/geometry_msgs_Pose_msg
[geometry_msgs/msg/PoseStamped]: /docs/en/popup/op3_ros2/geometry_msgs_PoseStamped_msg
[robotis_controller_msgs/msg/StatusMsg]: /docs/en/popup/op3_ros2/StatusMsg.msg
[robotis_controller_msgs/msg/JointCtrlModule]: /docs/en/popup/JointCtrlModule.msg
[robotis_controller_msgs/msg/GetJointModule]: /docs/en/popup/GetJointModule.srv/

[op3_action_module_msgs/msg/StartAction]: /docs/en/popup/op3_ros2/op3_StartAction.msg/
[op3_action_module_msgs/srv/IsRunning]: /docs/en/popup/op3_ros2/op3_IsRunning.srv/

[op3_offset_tuner_msgs/msg/JointOffsetData]: /docs/en/popup/op3_JointOffsetData.msg/
[op3_offset_tuner_msgs/msg/JointTorqueOnOffArray]: /docs/en/popup/op3_JointTorqueOnOffArray.msg/
[op3_offset_tuner_msgs/msg/GetPresentJointOffsetData]: /docs/en/popup/op3_GetPresentJointOffsetData.srv/

[op3_tuning_module_msgs/msg/JointOffsetData]: /docs/en/popup/(op3_tuning_module_msgs)JointOffsetData.msg/
[op3_tuning_module_msgs/msg/JointTorqueOnOffArray]: /docs/en/popup/(op3_tuning_module_msgs)JointTorqueOnOffArray.msg/ 

[op3_tuning_module_msgs/msg/GetPresentJointOffsetData]: /docs/en/popup/(op3_tuning_module_msgs)GetPresentJointOffsetData.srv/
[robotis_controller_msgs/msg/SetModule]: /docs/en/popup/SetModule.srv/  
[robotis_controller_msgs/msg/LoadOffset]: /docs/en/popup/LoadOffset.srv/  
[op3_walking_module_msgs/msg/WalkingParam]: /docs/en/popup/op3_WalkingParam.msg/
[WalkingParam.msg]: /docs/en/popup/op3_WalkingParam.msg/
[op3_walking_module_msgs/msg/GetWalkingParam]: /docs/en/popup/op3_GetWalkingParam.srv/
[GetWalkingParam.srv]: /docs/en/popup/op3_GetWalkingParam.srv/
[SetWalkingParam.srv]: /docs/en/popup/op3_SetWalkingParam.srv/
[GetJointPose.srv]: /docs/en/popup/op3_GetJointPose.srv/
[GetKinematicsPose.srv]: /docs/en/popup/op3_GetKinematicsPose.srv/
[GetPreviewMatrix.srv]: /docs/en/popup/op3_GetPreviewMatrix.srv/
[JointOffsetData.msg]: /docs/en/popup/op3_JointOffsetData.msg/
[JointOffsetPositionData.msg]: /docs/en/popup/op3_JointOffsetPositionData.msg/
[JointTorqueOnOff.msg]: /docs/en/popup/op3_JointTorqueOnOff.msg/
[JointTorqueOnOffArray.msg]: /docs/en/popup/op3_JointTorqueOnOffArray.msg/
[GetPresentJointOffsetData.srv]: /docs/en/popup/op3_GetPresentJointOffsetData.srv/
[ball_detector/circleSetStamped]: /docs/en/popup/ball_detector_CircleSetStamped_msg/

[JointOffsetData.msg]: /docs/en/popup/(op3_tuning_module_msgs)JointOffsetData.msg/
[JointOffsetPositionData.msg]: /docs/en/popup/(op3_tuning_module_msgs)JointOffsetPositionData.msg/
[JointTorqueOnOff.msg]: /docs/en/popup/(op3_tuning_module_msgs)JointTorqueOnOff.msg/ 
[JointTorqueOnOffArray.msg]: /docs/en/popup/(op3_tuning_module_msgs)JointTorqueOnOffArray.msg/ 
[GetPresentJointOffsetData.srv]: /docs/en/popup/(op3_tuning_module_msgs)GetPresentJointOffsetData.srv/

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/op3/robotis_ros_packages_rev2.md %}
</section>


[op3_manager]: /docs/en/platform/op3/robotis_ros_packages/#op3-manager
[op3_action_module]: /docs/en/platform/op3/robotis_ros_packages/#op3_action_module
[op3_base_module]: /docs/en/platform/op3/robotis_ros_packages/#op3_base_module
[op3_head_control_module]: /docs/en/platform/op3/robotis_ros_packages/#op3_head_control_module
[op3_walking_module]: /docs/en/platform/op3/robotis_ros_packages/#op3_walking_module
[op3_online_walking_module]: /docs/en/platform/op3/robotis_ros_packages/#op3_online_walking_module
[open_cr_module]: /docs/en/platform/op3/robotis_ros_packages/#open_cr_module

[Creating new robot manager]: /docs/en/software/robotis_framework_packages/tutorials/#creating-new-robot-manager
[Introduction to Humanoid Robotics]: http://www.springer.com/gp/book/9783642545351

[op3_offset_tuner_server]: /docs/en/platform/op3/robotis_ros_packages/#op3_offset_tuner_server
[op3_offset_tuner_client]: /docs/en/platform/op3/robotis_ros_packages/#op3_offset_tuner_client
[`usb_cam`]: http://wiki.ros.org/usb_cam
[HSV color]: https://en.wikipedia.org/wiki/HSL_and_HSV
[How to execute Default Demo]: /docs/en/platform/op3/tutorials/#how-to-exectue-default-demo
[How to execute GUI program]: /docs/en/platform/op3/tutorials/#how-to-exectue-gui-program
[URDF-ROS Wiki]: http://wiki.ros.org/urdf
[Connect to ROS]: http://gazebosim.org/tutorials?cat=connect_ros

[op3_gui_demo]: /docs/en/platform/op3/robotis_ros_packages/#op3_gui_demo
[How to use walking tuner]: /docs/en/platform/op3/tutorials/#how-to-use-walking-tuner
[How to use offset tuner]: /docs/en/platform/op3/tutorials/#how-to-use-offset-tuner
[Installing ROBOTIS ROS Package]: /docs/en/platform/op3/recovery/#installing-robotis-ros-packages
[/op3_walking_module/config/param.yaml]: /docs/en/popup/op3_walking_module_param.yaml/
[/op3_base_module/data/ini_pose.yaml]: /docs/en/popup/op3_base_module_ini_pose.yaml/
[OPENCR]: /docs/en/platform/common/arduino_examples_op3/#opencr-op3

[op3_direct_control_module]: /docs/en/platform/op3/robotis_ros_packages/#op3_direct_control_module
[op3_tuning_module]: /docs/en/platform/op3/robotis_ros_packages/#op3_tuning_module
[How to use tuner client]: /docs/en/platform/op3/tutorials/#how-to-use-tuner-client
[ball_detector_params.yaml]: https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-OP3-Demo/master/op3_ball_detector/config/ball_detector_params.yaml
[How to use ball detector]: /docs/en/platform/op3/tutorials/#how-to-use-ball-detector
