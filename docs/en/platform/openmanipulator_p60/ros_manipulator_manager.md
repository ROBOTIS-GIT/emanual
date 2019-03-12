---
layout: archive
lang: en
ref: openmanipulator_p60_ros_manipulator_manager
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_p60/ros_manipulator_manager/
sidebar:
  title: OpenManipulator RM-P60-RNH
  nav: "openmanipulator_p60"
---

<div style="counter-reset: h1 4"></div>

# [[ROS] Manipulator Manager](#ros-manipulator-manager)

{% capture notice_01 %}
**NOTE**:
- This instructions has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Launch Manager](#launch-manager)

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
{: .notice--info}

```
$ sudo bash
[sudo] password for robotis:   
# roslaunch manipulator_h_manager open_manipulator_p60_manager.launch   
```

If the manipulator manger has been launched successfully, the terminal will show the following message.

```
SUMMARY
========

PARAMETERS
 * /gazebo: False
 * /gazebo_robot_name: robotis_manipulat...
 * /init_file_path: /home/user/catkin...
 * /offset_table: /home/user/catkin...
 * /robot_file_path: /home/user/catkin...
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    manipulator_h_manager (manipulator_h_manager/manipulator_h_manager)

ROS_MASTER_URI=http://localhost:11311

process[manipulator_h_manager-1]: started with pid [19408]
[ INFO] [1552279834.246020783]: manager->init
/dev/ttyUSB0 added. (baudrate: 2000000)
(/dev/ttyUSB0) [ID:  1] H54P-200-S500-R added. 
(/dev/ttyUSB0) [ID:  2] H54P-200-S500-R added. 
(/dev/ttyUSB0) [ID:  3] H54P-100-S500-R added. 
(/dev/ttyUSB0) [ID:  4] H54P-100-S500-R added. 
(/dev/ttyUSB0) [ID:  5] H42P-020-S300-R added. 
(/dev/ttyUSB0) [ID:  6] H42P-020-S300-R added. 
[ INFO] [1552279834.361381084]: Load offsets...
```

## [Check Setting](#check-setting)
### [RViz](#rviz)
```
$ roslaunch manipulator_h_bringup robotis_manipulator.launch   
```
![](/assets/images/platform/openmanipulator_p60/rviz.png)
  
## [Message List](#message-list)
### [Topic](#topic)

#### ROS Message Type
* JointPose.msg   
  * `name` : target joint name ([std_msgs/String]{: .popup})    
  * `value` : target joint value ([std_msgs/Float64]{: .popup})    
* KinematicsPose.msg    
  * `name` : target kinematics group ([std_msgs/String]{: .popup})    
  * `pose` : target Pose ([geometry_msgs/Pose]{: .popup})   

#### Subscribed Topics
`/robotis/base/ini_pose_msg` ([std_msgs/String]{: .popup})    
&emsp;&emsp; Message for initial pose

`/robotis/base/set_mode_msg` ([std_msgs/String]{: .popup})    
&emsp;&emsp; Message for set mode

`/robotis/base/joint_pose_msg` ([manipulator_manipulation_module_msgs/JointPose]{: .popup})   
&emsp;&emsp; Message for joint space control

`/robotis/base/kinematics_pose_msg` ([manipulator_manipulation_module_msgs/KinematicsPose]{: .popup})   
&emsp;&emsp; Message for task space control

#### Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})    
&emsp;&emsp; Message for current state


### [Service](#service)

#### ROS Service Type   
* GetJointPose.srv   
  * Request : `joint_name` : joint name ([std_msgs/String]{: .popup})   
  * Response : `joint_value` : joint value ([std_msgs/Float64]{: .popup})   
* GetKinematicsPose.srv     
  * Request : `group_name` : kinematics group ([std_msgs/String]{: .popup})   
  * Response : `group_pose` : kinematics pose ([geometry_msgs/Pose]{: .popup})   

#### Services
`/robotis/base/get_joint_pose` ([manipulator_manipulation_module_msgs/GetJointPose]{: .popup})   
&emsp;&emsp; Service to read current joint value

`/robotis/base/get_kinematics_pose` ([manipulator_manipulation_module_msgs/GetKinematicsPose]{: .popup})   
&emsp;&emsp; Service to read current end effector's pose
