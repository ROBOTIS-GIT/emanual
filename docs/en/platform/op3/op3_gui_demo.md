### 1. Overview   
`op3_gui_demo` is a GUI software to control ROBOTIS-OP3.  
Within this program, user can perform module settings, walking tuner, head joint control and play actions.  
<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gui_diagram.png?raw=true" align="bottom"/>

### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3-Recovery-of-ROBOTIS-OP3#24-installation-robotis-ros-packages.md)  

#### 2.2 Run
Execute the launch file.  
```
$ roslaunch op3_gui_demo op3_demo.launch
```  

#### 2.3 UI
<img src="https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/blob/master/wiki-images/ROBOTIS-OP3/op3_gui.png?raw=true" align="bottom"/>

#### 2.4 Usage
> Reference : [How to execute GUI program](OP3-How-to-execute-GUI-program.md)  


### 3. ROS API
#### 3.1 Subscribed Topics
`/robotis/status`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))  
&emsp;&emsp; This message describes status of ROBOTIS-OP3.

`/robotis/present_joint_ctrl_modules`([robotis_controller_msgs/JointCtrlModule](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/JointCtrlModule.msg))  
&emsp;&emsp; This message reports which module is currently in use for ROBOTIS-OP3.

`/robotis/head_control/present_joint_states`([sensor_msgs/JointState](http://docs.ros.org/api/sensor_msgs/html/msg/JointState.html))  
&emsp;&emsp; This message reports present angles for each joint.  


#### 3.2 Published Topics
`/robotis/base/ini_pose`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))  
&emsp;&emsp; This message will have ROBOTIS-OP3 to take the initial posture.

`/robotis/enable_ctrl_module`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))  
&emsp;&emsp; This message notifies framework to activate a specific module for ROBOTIS-OP3.  

`/robotis/sync_write_item`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))  
&emsp;&emsp; This message contains data to be written to ROBOTIS-OP3 with the Sync Write command.  
&emsp;&emsp; ex) LED control

`/robotis/head_control/set_joint_states_offset`([sensor_msgs/JointState](http://docs.ros.org/api/sensor_msgs/html/msg/JointState.html))  
&emsp;&emsp; This message controls head joints.

`/play_sound_file`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))  
&emsp;&emsp; This message contains the path of voice files for speaking.

`/robotis/walking/command"`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))  
&emsp;&emsp; This message commands walking module of ROBOTIS-OP3.

`/robotis/walking/set_params"`([op3_walking_module_msgs/WalkingParam](op3_WalkingParam.msg))  
&emsp;&emsp; This message configures walking parameters of the walking module.

`/robotis/action/page_num`([std_msgs/Int32](http://docs.ros.org/api/std_msgs/html/msg/Int32.html))  
&emsp;&emsp; This message transfers page number to action_module to play actions.


#### 3.3 Services
`/robotis/get_present_joint_ctrl_modules`([robotis_controller_msgs/GetJointModule](GetJointModule.srv))  
&emsp;&emsp; This service acquires which module is currently in use for ROBOTIS-OP3.  

`/robotis/walking/get_params`([op3_walking_module_msgs/GetWalkingParam](op3_GetWalkingParam.srv))  
&emsp;&emsp; This service acquires walking parameters.  


### 4. Parameters
`/demo_config`(string, default : "/op3_gui_demo/config/demo_config.yaml")  
&emsp;&emsp; This yaml file saves joint names, available modules, list of module preset button.  


<br>[&lt;&lt; Back](ROBOTIS-OP3-Tools.md)
