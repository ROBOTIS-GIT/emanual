### 1. Overview  
`op3_base_module` is a module for initial posture.  
This module is compiled to a library to be used in [op3_manager](op3_manager).  


### 2. Getting started  
#### 2.1 Download & Build  
 > Reference : [Installing ROBOTIS ROS Package](OP3-Recovery-of-ROBOTIS-OP3#24-installation-robotis-ros-packages)    

#### 2.2 Usage  
The Motion Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager](Creating-new-robot-manager)

### 3. ROS API  
#### 3.1 Subscribed Topics  
`/robotis/base/ini_pose`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))  
&emsp;&emsp; This message will have OP3 to take the initial posture(This command is effective even when the base module is inactive).  


#### 3.2 Published Topics  
`/robotis/enable_ctrl_module`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))  
&emsp;&emsp; This message activates `op3_base_module` to take the initial posture.  

`/robotis/status`([robotis_controller_msgs/StatusMsg](StatusMsg.msg))  
&emsp;&emsp; This message notifies the status of `op3_base_module`.  

### 4. Data  
#### 4.1 Init posture  

 - data file path : [/op3_base_module/data/ini_pose.yaml](https://github.com/ROBOTIS-GIT/ROBOTIS-OP3/blob/master/op3_base_module/data/ini_pose.yaml)  
  
 - YAML format
   - mov_time : Estimated time to move to target points(unit in second)  
   - via_num : Number of waypoints  
   - via_time : Estimated time between waypoints(array structure)   
   - via_pose : Angle of every joint for each waypoint(unit in degree, array structure)  
   - tar_pose : Target joint angles for initial posture

[&lt;&lt; Back](ROBOTIS-OP3-Modules.md)
