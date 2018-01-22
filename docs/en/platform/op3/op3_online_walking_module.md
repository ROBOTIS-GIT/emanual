### 1. Overview
This chapter explains the module to control OP3's walking.  
This module is compiled to a library to be used in [op3_manager](op3_manager.md).  
Online walking algorithm is described in this book ([Introduction to Humanoid Robotics](http://www.springer.com/gp/book/9783642545351)).


### 2. Getting started  
#### 2.1 Download & Build
 > Reference : [Installing ROBOTIS ROS Package](OP3-Recovery-of-ROBOTIS-OP3#24-installation-robotis-ros-packages.md)    

#### 2.2 Usage
The Motion Module is used in the manager in the form of library.  
> Reference : [Creating new robot manager](Creating-new-robot-manager.md)

### 3. ROS API
#### 3.1 Subscribed Topics
`/robotis/online_walking/reset_body`  
([std_msgs::Bool](http://docs.ros.org/api/std_msgs/html/msg/Bool.html))  
&emsp;&emsp; This message will reset the body pose to default value.  

`/robotis/online_walking/goal_joint_pose`  
([op3_online_walking_module_msgs::JointPose](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_JointPose.msg))  
&emsp;&emsp; This message will set desired pose in joint space.  

`/robotis/online_walking/goal_kinematics_pose`  
([op3_online_walking_module_msgs::KinematicsPose](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_KinematicsPose.msg))  
&emsp;&emsp; This message will set desired pose in task space.  

`/robotis/online_walking/foot_step_command`  
([op3_online_walking_module_msgs::FootStepCommand](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_FootStepCommand.msg))  
&emsp;&emsp; This message will set walking command.  

`/robotis/online_walking/foot_step_command`  
([op3_online_walking_module_msgs::FootStepCommand](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_FootStepCommand.msg))  
&emsp;&emsp; This message will execute desired walking performance.  

`/robotis/online_walking/walking_param`  
([op3_online_walking_module_msgs::WalkingParam](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_online_WalkingParam.msg))  
&emsp;&emsp; This message will set walking parameter.

`/robotis/online_walking/body_offset`  
([geometry_msgs::Pose](http://docs.ros.org/api/geometry_msgs/html/msg/Pose.html))  
&emsp;&emsp; This message will set desired body offset.

`/robotis/online_walking/foot_distance`  
([std_msgs::Float64](http://docs.ros.org/api/std_msgs/html/msg/Float64.html))  
&emsp;&emsp; This message will set desired foot distance between left and right foot.

`/robotis/online_walking/footsteps_2d`  
([op3_online_walking_module_msgs::Step2DArray](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_Step2DArray.msg))  
&emsp;&emsp; This message will set desired foot step from foot step generator.


#### 3.2 Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg](StatusMsg.msg))  
&emsp;&emsp; This message notifies the status of head_control_module.  

`/robotis/movement_done`([std_msgs/String](http://docs.ros.org/api/std_msgs/html/msg/String.html))  
&emsp;&emsp; This message notifies the end of movement.  

`/robotis/pelvis_pose`([geometry_msgs/PoseStamped](http://docs.ros.org/api/geometry_msgs/html/msg/PoseStamped.html))  
&emsp;&emsp; This message send desired pelvis pose for localization.  

#### 3.3 Service Server
`/robotis/online_walking/get_joint_pose`  
([op3_online_walking_module_msgs/GetJointPose](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_GetJointPose.srv))  
&emsp;&emsp; This service is used to get current desired joint pose.  

`/robotis/online_walking/get_kinematics_pose`  
([op3_online_walking_module_msgs/GetKinematicsPose](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_KinematicsPose.msg))  
&emsp;&emsp; This service is used to get current desired kinematics pose.  

#### 3.4 Service Client
`/robotis/online_walking/get_preview_matrix`  
([op3_online_walking_module_msgs/GetPreviewMatrix](https://github.com/ROBOTIS-GIT/ROBOTIS-Documents/wiki/op3_GetPreviewMatrix.srv))  
&emsp;&emsp; This service is used to calculate matrix for online walking.  


[&lt;&lt; Back](ROBOTIS-OP3-Modules.md)
