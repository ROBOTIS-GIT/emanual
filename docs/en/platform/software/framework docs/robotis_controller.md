### 1. Overview

This is the main package that controls THORMANG3. This package is responsible for following functions.

1. Initialization  
    1. Load robot information file(.robot) and initialize the robot with the [[robotis_device]] package.  
    2. Configures initial value for each joint by loading initialization file(.yaml).  
    3. Gets ready to use sync write and bulk read for the joint control.
2. Periodically call process() function by the timer (default cycle: 8 msec)  
    1. The startTimer() creates a thread that calls process() function periodically.  
3. What process() does :  
    1. Receives status packets with Bulk Read to get status of each sensors and joints.  
    2. Transfers the result value of the Motion Module with Sync Write.  
    3. Transfers instruction packet to each sensors and joints with Bulk Read.    
    4. Calls process() function of the Sensor Module in the list and saves the result value.  
    5. Calls process() function of the Motion Module in the list and saves the result value.  
    6. Publishes current value and target value in the form of ROS Topic.  

Please refer to the below link to create the Robot Manager that uses `robotis_controller` package.  
> Reference : [Creating new robot manager]

### 2. ROS API
#### 2.1 Subscribed Topics
`/robotis/write_control_table` ([robotis_controller_msgs/WriteControlTable]{: .popup})  
&emsp;&emsp; The message can write multiple item values to a specific joint by using Sync Write.  

`/robotis/sync_write_item` ([robotis_controller_msgs/SyncWriteItem]{: .popup})  
&emsp;&emsp; The message can write a specific item value to multiple joints by using Sync Write.  

`/robotis/set_joint_ctrl_modules` ([robotis_controller_msgs/JointCtrlModule]{: .popup})  
&emsp;&emsp; The message can configure motion modules that controls specific joints.  

`/robotis/enable_ctrl_module` ([std_msgs/String]{: .popup})  
&emsp;&emsp; This message assigns a specific motion module that manages specific joints to a motion control module.

`/robotis/set_control_mode` ([std_msgs/String]{: .popup})  
&emsp;&emsp; The message sets the control mode of `robotis_controller` to ether `DIRECT_CONTROL_MODE` or `MOTION_MODULE_MODE`.

`/robotis/set_joint_states` ([sensor_msgs/JointState]{: .popup})  
&emsp;&emsp; This message includes status data for each joint. The data in this message is transmitted to each joint to control the joint.  

#### 2.2 Published Topics
`/robotis/goal_joint_states` ([sensor_msgs/JointState]{: .popup})  
&emsp;&emsp; The message publishes goal joint status value for each joint.  

`/robotis/present_joint_states` ([sensor_msgs/JointState]{: .popup})  
&emsp;&emsp; The message publishes current joint status value read from each joint.  

`/robotis/present_joint_ctrl_modules` ([robotis_controller_msgs/JointCtrlModule]{: .popup})  
&emsp;&emsp; The message publishes current status of motion module that controls each joint.   

#### 2.3 Services
`/robotis/get_present_joint_ctrl_modules` ([robotis_controller_msgs/GetJointModule]{: .popup})  
&emsp;&emsp; The service to get the configuration of motion module that controls each joint.  

<br>[&lt;&lt; Back](ROBOTIS_Framework.md)


[Creating new robot manager]:Creating_new_robot_manager.md

[std_msgs/String]: /docs/en/popup/std_msgs_string/
[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[robotis_controller_msgs/WriteControlTable]: /docs/en/popup/WriteControlTable.msg/
[robotis_controller_msgs/SyncWriteItem]: /docs/en/popup/SyncWriteItem.msg/
[robotis_controller_msgs/JointCtrlModule]: /docs/en/popup/JointCtrlModule.msg/
[robotis_controller_msgs/GetJointModule]: /docs/en/popup/GetJointModule.srv/
