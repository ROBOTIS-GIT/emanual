### 1. Overview  
`op3_action_module` manages OP3 actions.  
This module is compiled as a libary so that it can be loaded from the `op3_manager`.
Action contains all joint angles per each time frame.

### 2. Getting started  
#### 2.1 Download & Build  
 > Reference : [Installing ROBOTIS ROS Package](OP3-Recovery-of-ROBOTIS-OP3#24-installation-robotis-ros-packages)  
  
#### 2.2 Usage  
Motion Module is used in the form of lib in the manager.  
> Reference : [[Creating new robot manager]]

### 3. ROS API  
#### 3.1 Subscribed Topics  
`/robotis/action/page_num`([std_msgs/Int32](http://docs.ros.org/api/std_msgs/html/msg/Int32.html))  
&emsp;&emsp; The page number of action to run in the Module.  
&emsp;&emsp; 1 ~ 255 : play action  
&emsp;&emsp; -1 : stop action  
&emsp;&emsp; -2 : brake action  

#### 3.2 Published Topics  
`/robotis/status`([robotis_controller_msgs/StatusMsg](StatusMsg.msg))  
&emsp;&emsp; Message that describes status of action_module.  

#### 3.3 Services  
`/robotis/action/is_running`([op3_action_module_msgs/IsRunning](op3_IsRunning.srv))  
&emsp;&emsp; Service that checks whether the action is running or not.  


### 4. Parameters  
`/action file path`(string, default : "op3_action_module/data/motion_4095.bin")  
&emsp;&emsp; File path that indicates the location of action libraries for OP3.  


<br>&lt;&lt; [Back](ROBOTIS-OP3-Modules.md)
