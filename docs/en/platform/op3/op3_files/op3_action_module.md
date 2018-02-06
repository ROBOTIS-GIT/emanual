### 1. Overview  
`op3_action_module` manages OP3 actions.  
This module is compiled as a libary so that it can be loaded from the `op3_manager`.
Action contains all joint angles per each time frame.

### 2. Getting started  
#### 2.1 Download & Build  
 > Reference : [Installing ROBOTIS ROS Package](OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md)  

#### 2.2 Usage  
Motion Module is used in the form of lib in the manager.  
> Reference : [Creating new robot manager](Creating_new_robot_manager.md)

### 3. ROS API  
#### 3.1 Subscribed Topics  
`/robotis/action/page_num`([std_msgs/Int32]{: .popup})  
&emsp;&emsp; The page number of action to run in the Module.  
&emsp;&emsp; 1 ~ 255 : play action  
&emsp;&emsp; -1 : stop action  
&emsp;&emsp; -2 : brake action  

#### 3.2 Published Topics  
`/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})  
&emsp;&emsp; Message that describes status of action_module.  

#### 3.3 Services  
`/robotis/action/is_running`([op3_action_module_msgs/IsRunning]{: .popup})  
&emsp;&emsp; Service that checks whether the action is running or not.  


### 4. Parameters  
`/action file path`(string, default : "op3_action_module/data/motion_4095.bin")  
&emsp;&emsp; File path that indicates the location of action libraries for OP3.  


<br>[&lt;&lt; Back]

[std_msgs/Int32]: /docs/en/popup/std_msgs_int32_message/

[robotis_controller_msgs/StatusMsg]:/docs/en/popup/StatusMsg.msg/
[op3_action_module_msgs/IsRunning]:/docs/en/popup/op3_IsRunning.srv/
[&lt;&lt; Back]:[ROBOTIS-OP3-Modules.md]
