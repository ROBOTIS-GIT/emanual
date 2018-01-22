### 1. Overview
The GUI Node that can adjust offset of ROBOTIS-OP3.  
It is used with the [op3_offset_tuner_server](op3_offset_tuner_server.md).  


### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3-Recovery-of-ROBOTIS-OP3#24-installation-robotis-ros-packages.md)  

#### 2.2 Run
```
$ rosrun op3_offset_tuner_client op3_offset_tuner_client
```  

#### 2.3 Usage
> Reference : [How to use offset tuner](OP3-How-to-use-offset-tuner.md)  



### 3. ROS API

#### 3.1 Published Topics
`/robotis/offset_tuner/joint_offset_data`([op3_offset_tuner_msgs/JointOffsetData](op3_JointOffsetData.msg))     
&emsp;&emsp; The topic transfers Joint offset   

`/robotis/offset_tuner/torque_enable`([op3_offset_tuner_msgs/JointTorqueOnOffArray](op3_JointTorqueOnOffArray.msg))    
&emsp;&emsp; The topic executes Torque on/off command   

`/robotis/offset_tuner/command`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))    
&emsp;&emsp; The topic transfers other commands(save, initial posture, etc).   

#### 3.2 Services
`/robotis/offset_tuner/get_present_joint_offset_data`([op3_offset_tuner_msgs/GetPresentJointOffsetData](op3_GetPresentJointOffsetData.srv))  
&emsp;&emsp; The service obtains saved joint offset

<br>[&lt;&lt; Back](ROBOTIS-OP3-Tools.md)
