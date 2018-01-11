### 1. Overview
This chapter explains the module to control OP3's head.  
This module is compiled to a library to be used in [op3_manager](op3_manager).  


### 2. Getting started  
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3-Recovery-of-ROBOTIS-OP3#24-installation-robotis-ros-packages)    

#### 2.2 Usage
The Motion Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager](Creating new robot manager)

### 3. ROS API
#### 3.1 Subscribed Topics
`/robotis/head_control/scan_command`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))  
&emsp;&emsp; This message will request a looking around head motion to scan the environment.  

`/robotis/head_control/set_joint_states`([sensor_msgs/JointState](http://docs.ros.org/api/sensor_msgs/html/msg/JointState.html))  
&emsp;&emsp; Head joints will rotate to corresponding angles written in the message.  

`/robotis/head_control/set_joint_states_offset`([sensor_msgs/JointState](http://docs.ros.org/api/sensor_msgs/html/msg/JointState.html))  
&emsp;&emsp; Head joints will adjust angles by offset values written in the message.  


#### 3.2 Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg](StatusMsg.msg))  
&emsp;&emsp; This message notifies the status of head_control_module.  


[&lt;&lt; Back](ROBOTIS-OP3-Modules)
