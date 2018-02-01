### 1. Overview   
ROBOTIS-OP3 Offset Tuner Node   
Data related to the Offset can be Tuned, Loaded and Saved.   
It is used with the [op3_offset_tuner_client].  


### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md)  


#### 2.2 Run
Execute the launch file to start offset tuner server.  
`op3_offset_tuner_server` has a direct control over ROBOTIS-OP3, therefore other control programs such as `op3_manager`, `op3_action_editor` and `op3_walking_tuner` should not be running.
Before executing the `op3_offset_tuner_server` launch file, other programs should be terminated.    
```
$ roslaunch op3_offset_tuner_server op3_offset_tuner_server.launch
```  

#### 2.3 Usage
> Reference : [How to use offset tuner](OP3_How_to_use_offset_tuner.md)  


### 3. ROS API

#### 3.1 Subscribed Topics
* `/robotis/base/send_tra`([std_msgs/String])  
&emsp;&emsp; The topic informs the start and end of trajectory following.  

* `/robotis/offset_tuner/joint_offset_data`([op3_offset_tuner_msgs/JointOffsetData])  
&emsp;&emsp; The topic updates joint offset related parameters.  

* `/robotis/offset_tuner/torque_enable`([op3_offset_tuner_msgs/JointTorqueOnOffArray])  
&emsp;&emsp; The topic transfers Torque enable/disable command for joints.

* `/robotis/offset_tuner/command`([std_msgs/String])  
&emsp;&emsp; The topic transfers command to the [op3_offset_tuner_client].  
&emsp;&emsp; - "save"     : Saves current offset to yaml  
&emsp;&emsp; - "ini_pose" : Take the initial posture for offset tuning  


#### 3.2 Services
* `robotis/offset_tuner/get_present_joint_offset_data`([op3_offset_tuner_msgs/GetPresentJointOffsetData])  
&emsp;&emsp; The service obtains current offset data from the [op3_offset_tuner_client].  

#### 4. Parameters
`/offset_path`(string, default : "")  
&emsp;&emsp; The yaml file path to save offsets.   

`/robot_file_path`(string, default : "")  
&emsp;&emsp; This path indicates the location of .robot file that contains robot description data.  

`/init_file_path`(string, default : "")  
&emsp;&emsp; This path indicates the location of the file that contains initialization information of each joint.  



<br>[&lt;&lt; Back]


[std_msgs/String]:(http://docs.ros.org/api/std_msgs/html/msg/String.html)
[op3_offset_tuner_client]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_offset_tuner_client
[How to use offset tuner]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/OP3-How-to-use-offset-tuner
[op3_offset_tuner_msgs/JointOffsetData]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/JointOffsetData.msg
[op3_offset_tuner_msgs/JointTorqueOnOffArray]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/JointTorqueOnOffArray.msg
[op3_offset_tuner_msgs/GetPresentJointOffsetData]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/GetPresentJointOffsetData.srv

[&lt;&lt; Back]:[ROBOTIS-OP3-Tools.md]
