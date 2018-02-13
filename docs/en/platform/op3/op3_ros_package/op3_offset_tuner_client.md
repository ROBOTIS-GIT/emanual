### 1. Overview
The GUI Node that can adjust offset of ROBOTIS-OP3.  
It is used with the [op3_offset_tuner_server].  


### 2. Getting started
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package]

#### 2.2 Run
```
$ rosrun op3_offset_tuner_client op3_offset_tuner_client
```  

#### 2.3 Usage
> Reference : [How to use offset tuner]



### 3. ROS API

#### 3.1 Published Topics
`/robotis/offset_tuner/joint_offset_data`([op3_offset_tuner_msgs/JointOffsetData]{: .popup})            
&emsp;&emsp; The topic transfers Joint offset   

`/robotis/offset_tuner/torque_enable`([op3_offset_tuner_msgs/JointTorqueOnOffArray]{: .popup})    
&emsp;&emsp; The topic executes Torque on/off command   

`/robotis/offset_tuner/command`([std_msgs/String]{: .popup})    
&emsp;&emsp; The topic transfers other commands(save, initial posture, etc).   

#### 3.2 Services
`/robotis/offset_tuner/get_present_joint_offset_data`([op3_offset_tuner_msgs/GetPresentJointOffsetData]{: .popup})  
&emsp;&emsp; The service obtains saved joint offset

<br>[&lt;&lt; Back]

[How to use offset tuner]:op3_how_to_use_offset_tuner.md
[std_msgs/String]: /docs/en/popup/std_msgs_int32_message/
[op3_offset_tuner_msgs/JointOffsetData]: /docs/en/popup/op3_JointOffsetData.msg/
[op3_offset_tuner_msgs/JointTorqueOnOffArray]: /docs/en/popup/op3_JointTorqueOnOffArray.msg/
[op3_offset_tuner_msgs/GetPresentJointOffsetData]: /docs/en/popup/op3_GetPresentJointOffsetData.srv/
[op3_offset_tuner_server]:op3_offset_tuner_server.md

[Installing ROBOTIS ROS Package]:OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages.md

[&lt;&lt; Back]:robotis_op3_tools.md
