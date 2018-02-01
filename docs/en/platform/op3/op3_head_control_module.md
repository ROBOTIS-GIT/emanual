### 1. Overview
This chapter explains the module to control OP3's head.  
This module is compiled to a library to be used in [op3_manager](op3_manager.md).  


### 2. Getting started  
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md)    

#### 2.2 Usage
The Motion Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

### 3. ROS API
#### 3.1 Subscribed Topics
`/robotis/head_control/scan_command`([std_msgs/String])  
&emsp;&emsp; This message will request a looking around head motion to scan the environment.  

`/robotis/head_control/set_joint_states`([sensor_msgs/JointState])  
&emsp;&emsp; Head joints will rotate to corresponding angles written in the message.  

`/robotis/head_control/set_joint_states_offset`([sensor_msgs/JointState])  
&emsp;&emsp; Head joints will adjust angles by offset values written in the message.  


#### 3.2 Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg])
&emsp;&emsp; This message notifies the status of head_control_module.  


[&lt;&lt; Back]

[std_msgs/String]:(http://docs.ros.org/api/std_msgs/html/msg/String.html)
[sensor_msgs/JointState]:(http://docs.ros.org/api/sensor_msgs/html/msg/JointState.html)
[Creating new robot manager]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/Creating-new-robot-manager
[robotis_controller_msgs/StatusMsg]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/StatusMsg.msg
[&lt;&lt; Back]:[ROBOTIS-OP3-Modules.md]
