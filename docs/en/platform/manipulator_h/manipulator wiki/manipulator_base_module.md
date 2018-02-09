###1. Overview
manipulator base module

###2. ROS API

#### 2.1 Subscribed Topics
`/robotis/base/ini_pose_msg` ([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))    
&emsp;&emsp; Message for initial pose

`/robotis/base/set_mode_msg` ([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))    
&emsp;&emsp; Message for set mode

`/robotis/base/joint_pose_msg` ([[manipulator_manipulation_module_msgs/JointPose|manipulator_base_module_msgs]])   
&emsp;&emsp; Message for joint space control

`/robotis/base/kinematics_pose_msg` ([[manipulator_manipulation_module_msgs/KinematicsPose|manipulator_base_module_msgs]])   
&emsp;&emsp; Message for task space control

#### 2.2 Published Topics
`/robotis/status`([[robotis_controller_msgs/StatusMsg|StatusMsg.msg]])    
&emsp;&emsp; Message for current state

#### 2.3 Services
`/robotis/base/get_joint_pose` ([[manipulator_manipulation_module_msgs/GetJointPose|manipulator_base_module_msgs]])   
&emsp;&emsp; Service to read current joint value

`/robotis/base/get_kinematics_pose` ([[manipulator_manipulation_module_msgs/GetKinematicsPose|manipulator_base_module_msgs]])   
&emsp;&emsp; Service to read current end effector's pose

<br>
[&lt;&lt; Back](ROBOTIS MANIPULATOR Module)