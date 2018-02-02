### 1. Overview
This chapter explains one of basic OP3 demos; soccer.
OP3 will search for a colored ball that is defined by the user, and play with it.

### 2. Getting started
#### 2.1 Usage
 > Reference : [How to execute Default Demo](OP3-How-to-execute-Default-Demo.md)


### 3. ROS API
The followings are ROS APIs used only in the soccer demo.

#### 3.1 Subscribed Topics
- Soccer demo  
  `/ball_tracker/command"`([std_msgs/String])  
  &emsp;&emsp; This message controls soccer demo

  `/robotis/open_cr/button"`([std_msgs/String])  
  &emsp;&emsp; This message processes button maneuver

  `/robotis/open_cr/imu"`([sensor_msgs/Imu])  
  &emsp;&emsp; This message contains IMU data to detect when ROBOTIS-OP3 falls down.

- Ball Tracking  
  `/ball_detector_node/circle_set"`([ball_detector/circleSetStamped])  
  &emsp;&emsp; This message contains location and size of the ball.


- Ball Following  
  `/robotis/goal_joint_states`([sensor_msgs/JointState])  
  &emsp;&emsp; This message acquires current head joint states and use them to calculate for goal joint states to look at the ball.   



#### 3.2 Published Topics
- Soccer demo  
  `/robotis/set_joint_ctrl_modules`([robotis_controller_msgs/JointCtrlModule])  
  &emsp;&emsp; This message configures joint control modules to operate ROBOTIS-OP3.  

  `/robotis/action/page_num`([std_msgs/Int32])  
  &emsp;&emsp; This message transfers page number to action_module to initiate actions such as kicking, standing up.  

- Ball Tracking  
  `/robotis/head_control/set_joint_states_offset`([sensor_msgs/JointState])  
  &emsp;&emsp; This message informs head_control_module about joint state offset to look at the ball that is detected in the image.

  `/robotis/head_control/scan_command`([std_msgs/String])  
  &emsp;&emsp; This message commands OP3 to look around for searching a ball.   

- Ball Following  
  `/robotis/walking/command"`([std_msgs/String])  
  &emsp;&emsp; This message commands walking module of OP3 to walk toward the ball.

  `/robotis/walking/set_params"`([op3_walking_module_msgs/WalkingParam])  
  &emsp;&emsp; This message configures walking parameters in the walking module to follow the ball.


#### 3.3 Services
- Ball Following  
  `/robotis/walking/get_params`([op3_walking_module_msgs/GetWalkingParam])  
  &emsp;&emsp; This service acquires walking parameters  


### 4. Parameters
`demo_config` (string, default : "~/op3_gui_demo/config/demo_config.yaml")  
&emsp;&emsp; This yaml file saves joint names of ROBOTIS-OP3.

<br>[&lt;&lt; Back](op3_demo.md)

[How to execute Default Demo]:[OP3-How-to-execute-Default-Demo.md]


[std_msgs/String]:/docs/en/popup/std_msgs_string/
[sensor_msgs/Imu]:/docs/en/popup/sensor_msgs_IMU_msg/

[ball_detector/circleSetStamped]:/docs/en/popup/ball_detector_CircleSetStamped_msg/
[sensor_msgs/JointState]:/docs/en/popup/sensor_msgs_JointState_msg/
[robotis_controller_msgs/JointCtrlModule]:/docs/en/popup/JointCtrlModule.msg/

[std_msgs/Int32]:/docs/en/popup/std_msgs_int32_message/
[sensor_msgs/JointState]:/docs/en/sensor_msgs_JointState_msg/
[std_msgs/String]:/docs/en/popup/std_msgs_string/
[op3_walking_module_msgs/WalkingParam]:/docs/en/popup/op3_WalkingParam.msg/
[op3_walking_module_msgs/GetWalkingParam]:/docs/en/popup/op3_GetWalkingParam.srv/
