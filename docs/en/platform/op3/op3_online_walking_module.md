### 1. Overview
This chapter explains the module to control OP3's walking.  
This module is compiled to a library to be used in [op3_manager](op3_manager.md).  
Online walking algorithm is described in this book ([Introduction to Humanoid Robotics]).


### 2. Getting started  
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3_Recovery_of_ROBOTIS_OP3#24_installation_robotis_ros_packages)    

#### 2.2 Usage
The Motion Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager]

### 3. ROS API
#### 3.1 Subscribed Topics
`/robotis/online_walking/reset_body`  
([std_msgs::Bool])  
&emsp;&emsp; This message will reset the body pose to default value.  

`/robotis/online_walking/goal_joint_pose`  
([op3_online_walking_module_msgs::JointPose])  
&emsp;&emsp; This message will set desired pose in joint space.  

`/robotis/online_walking/goal_kinematics_pose`  
([op3_online_walking_module_msgs::KinematicsPose])  
&emsp;&emsp; This message will set desired pose in task space.  

`/robotis/online_walking/foot_step_command`  
([op3_online_walking_module_msgs::FootStepCommand])  
&emsp;&emsp; This message will set walking command.  

`/robotis/online_walking/foot_step_command`  
([op3_online_walking_module_msgs::FootStepCommand])  
&emsp;&emsp; This message will execute desired walking performance.  

`/robotis/online_walking/walking_param`  
([op3_online_walking_module_msgs::WalkingParam])  
&emsp;&emsp; This message will set walking parameter.

`/robotis/online_walking/body_offset`  
([geometry_msgs::Pose])  
&emsp;&emsp; This message will set desired body offset.

`/robotis/online_walking/foot_distance`  
([std_msgs::Float64])  
&emsp;&emsp; This message will set desired foot distance between left and right foot.

`/robotis/online_walking/footsteps_2d`  
([op3_online_walking_module_msgs::Step2DArray])  
&emsp;&emsp; This message will set desired foot step from foot step generator.


#### 3.2 Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg])  
&emsp;&emsp; This message notifies the status of head_control_module.  

`/robotis/movement_done`([std_msgs/String])  
&emsp;&emsp; This message notifies the end of movement.  

`/robotis/pelvis_pose`([geometry_msgs/PoseStamped])  
&emsp;&emsp; This message send desired pelvis pose for localization.  

#### 3.3 Service Server
`/robotis/online_walking/get_joint_pose`  
([op3_online_walking_module_msgs/GetJointPose])  
&emsp;&emsp; This service is used to get current desired joint pose.  

`/robotis/online_walking/get_kinematics_pose`  
([op3_online_walking_module_msgs/GetKinematicsPose])  
&emsp;&emsp; This service is used to get current desired kinematics pose.  

#### 3.4 Service Client
`/robotis/online_walking/get_preview_matrix`  
([op3_online_walking_module_msgs/GetPreviewMatrix])  
&emsp;&emsp; This service is used to calculate matrix for online walking.  


[&lt;&lt; Back](ROBOTIS-OP3-Modules.md)

[op3_manager]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_manager

[Introduction to Humanoid Robotics]:(http://www.springer.com/gp/book/9783642545351)
[std_msgs::Bool]:(http://docs.ros.org/api/std_msgs/html/msg/Bool.html)
[op3_online_walking_module_msgs::JointPose]:(https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_JointPose.msg)
[op3_online_walking_module_msgs::KinematicsPose]:(https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_KinematicsPose.msg)
[op3_online_walking_module_msgs::FootStepCommand]:(https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_FootStepCommand.msg)
[op3_online_walking_module_msgs::FootStepCommand]:(https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_FootStepCommand.msg)
[op3_online_walking_module_msgs::WalkingParam]:(https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_online_WalkingParam.msg)
[geometry_msgs::Pose]:(http://docs.ros.org/api/geometry_msgs/html/msg/Pose.html)  
[std_msgs::Float64]:(http://docs.ros.org/api/std_msgs/html/msg/Float64.html)
[op3_online_walking_module_msgs::Step2DArray]:(https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_Step2DArray.msg)
[robotis_controller_msgs/StatusMsg]:(StatusMsg.msg)
[std_msgs/String]:(http://docs.ros.org/api/std_msgs/html/msg/String.html)
[geometry_msgs/PoseStamped]:(http://docs.ros.org/api/geometry_msgs/html/msg/PoseStamped.html)
[op3_online_walking_module_msgs/GetJointPose]:(https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_GetJointPose.srv)
[op3_online_walking_module_msgs/GetKinematicsPose]:(https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_KinematicsPose.msg)
[op3_online_walking_module_msgs/GetPreviewMatrix]:(https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_GetPreviewMatrix.srv)
[op3_online_walking_module_msgs/GetPreviewMatrix]:(https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_GetPreviewMatrix.srv)

[Creating new robot manager]:https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/Creating-new-robot-manager
