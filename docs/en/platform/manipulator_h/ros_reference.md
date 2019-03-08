---
layout: archive
lang: en
ref: manipulator_h_ros_reference
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/manipulator_h/ros_reference/
sidebar:
  title: MANIPULATOR-H
  nav: "manipulator_h"
---

<div style="counter-reset: h1 7"></div>

# [ROS Reference](#ros-reference)

## [ROS package description](#ros-package-description)

### robotis_manipulator_bringup   

`launch` : launch file to bring up the robot in Rviz

### robotis_manipulator_description   

`doc` : document for robotis manipulator joint & link information   
`launch` : launch file to confirm the urdf model   
`meshes` : STL files of each link   
`urdf` : urdf files to create robot model   

### robotis_manipulator_gazebo

`config` : yaml files of gazebo simulation controller   
`launch` : launch files to execute gazebo simulation   
`worlds` : world file for gazebo simulation

### robotis_manipulator_gui

GUI program using `qt creater`

## [ROS message type](#ros-message-type)

## [ROS message API](#ros-message-api)




### [manipulator_base_module](#manipulator_base_module)

#### Overview
manipulator base module

#### ROS API

##### Subscribed Topics
`/robotis/base/ini_pose_msg` ([std_msgs/String]{: .popup})    
&emsp;&emsp; Message for initial pose

`/robotis/base/set_mode_msg` ([std_msgs/String]{: .popup})    
&emsp;&emsp; Message for set mode

`/robotis/base/joint_pose_msg` ([manipulator_manipulation_module_msgs/JointPose]{: .popup})   
&emsp;&emsp; Message for joint space control

`/robotis/base/kinematics_pose_msg` ([manipulator_manipulation_module_msgs/KinematicsPose]{: .popup})   
&emsp;&emsp; Message for task space control

##### Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})    
&emsp;&emsp; Message for current state

##### Services
`/robotis/base/get_joint_pose` ([manipulator_manipulation_module_msgs/GetJointPose]{: .popup})   
&emsp;&emsp; Service to read current joint value

`/robotis/base/get_kinematics_pose` ([manipulator_manipulation_module_msgs/GetKinematicsPose]{: .popup})   
&emsp;&emsp; Service to read current end effector's pose

### [manipulator_base_module_msgs](#manipulator_base_module_msgs)

#### Overview
[manipulator_base_module](#manipulator_base_module)'s Message & Service  

#### ROS Message Type
* JointPose.msg   
  * `name` : target joint name ([std_msgs/String]{: .popup})    
  * `value` : target joint value ([std_msgs/Float64]{: .popup})    
* KinematicsPose.msg    
  * `name` : target kinematics group ([std_msgs/String]{: .popup})    
  * `pose` : target Pose ([geometry_msgs/Pose]{: .popup})   

#### ROS Service Type   
* GetJointPose.srv   
  * Request : `joint_name` : joint name ([std_msgs/String]{: .popup})   
  * Response : `joint_value` : joint value ([std_msgs/Float64]{: .popup})   
* GetKinematicsPose.srv     
  * Request : `group_name` : kinematics group ([std_msgs/String]{: .popup})   
  * Response : `group_pose` : kinematics pose ([geometry_msgs/Pose]{: .popup})   


### [manipulator_kinematics_dynamcis](#manipulator_kinematics_dynamcis)

#### Overview

  manipulator_kinematics_dynamics provides joint & link information and basic robotics function.

#### Getting started

  To use this library, it is necessary to set the `CMakeList.txt` and `package.xml` of each module

  In `CMakeList.txt`,
  ```
  find_package( manipulator_kinematics_dynamics )   
  target_link_libraries( manipulator_kinematics_dynamics )   
  ```

  In `package.xml`,
  ```
  <build_depend>manipulator_kinematics_dynamics</build_depend>   
  ```

#### Functions

##### LinkData.cpp

  `name` : Joint name   
  `parent` : Parent joint ID   
  `sibling` : Sibling joint ID   
  `child` : Child joint ID   
  `mass` : Mass   
  `relative_position` : Joint relative position (relative to parent)   
  `joint_axis` : Joint axis vector (relative to parent)   
  `center_of_mass` : Center of mass (Link Local)   
  `inertia` : Moment of Inertia (Link Local)   
  `joint_limit_max` : Joint upper limit   
  `joint_limit_min` : Joint lower limit    
  `joint_angle` : Joint angle   
  `joint_velocity` : Joint velocity   
  `joint_acceleration` : Joint acceleration      
  `position`: Link position   
  `orientation` : Link orienataion   
  `transformation` : Link transformation matrix   

##### ManipulatorKinematicsDynamics.cpp

  ```cpp
  ManipulatorKinematicsDynamics(TREE_SELECT tree)
  ```
  > * description : ROBOTIS MANIPULATOR joint & link information

  ```cpp
  std::vector<int> findRoute( int to )
  ```
  > * description : find kinematics tree
  > * arguments : start joint id
  > * return value : vector ( n x 1 )

  ```cpp
  std::vector<int> findRoute( int from , int to )
  ```
  > * description : find kinematics tree
  > * arguments : start joint id and end joint id
  > * return value : vector ( n x 1 )

  ```cpp
  double TotalMass( int joint_ID )
  ```
  > * description : calculate total mass
  > * arguments : start joint id
  > * return value : total mass

  ```cpp
  Eigen::MatrixXd CalcMC( int joint_ID )
  Eigen::MatrixXd CalcCOM( Eigen::MatrixXd MC )
  ```
  > * description : calculate center of mass
  > * arguments : start joint id
  > * return value : 3 x 1 matrix

  ```cpp
  void ForwardKinematics( int joint_ID )
  ```
  > * description : calculate forward kinematics
  > * arguments : start joint id

  ```cpp
  Eigen::MatrixXd CalcJacobian( std::vector<int> idx )
  ```
  > * description : calculate forward kinematics
  > * arguments : vector ( n x 1 )
  > * return value : 6 x n matrix

  ```cpp
  bool InverseKinematics
  ( int to,
    Eigen::MatrixXd tar_position, Eigen::MatrixXd tar_orientation,
    int max_iter,                 double ik_err )
  ```
  > * description : calculate inverse kinematics
  > * arguments : end joint id, target position, target orientation, max iteration, calculation error
  > * return value : true or false

  ```cpp
  bool InverseKinematics
  ( int from,                     int to,
    Eigen::MatrixXd tar_position, Eigen::MatrixXd tar_orientation,
    int max_iter,                 double ik_err )
  ```
  > * description : calculate inverse kinematics
  > * arguments : start joint id, end joint id, target position, target orientation, max iteration, calculation error
  > * return value : true or false

### [manipulator_manager](#manipulator-manager)

#### Overview
`manipulator_manager` is a package to apply ROBOTIS Framework to ROBOTIS Manipulator.   
If you want to create new manager, please refer the link as below.
> Ref. : [Creating new robot manager]

#### ROS API
##### Parameters
launch parameters

`gazebo` (bool, default: false)  
&emsp;&emsp; Select using simulation (gazebo) mode or real robot mode.  

`gazebo_robot_name` (string, default: "")  
&emsp;&emsp; robot name for joint_states topic name using gazebo mode.  
&emsp;&emsp; ex) If the `gazebo_robot_name` is `robotis_manipulator`, subscribing topic is  
&emsp;&emsp;&emsp; `/robotis_manipulator/joint_states`.

`offset_file_path` (string, default: "")  
&emsp;&emsp; The file path that includes joint offset information and initial pose of tuning offset.

`robot_file_path` (string, default: "")  
&emsp;&emsp; The file `.robot` 's path that includes robot information.



[std_msgs/String]: /docs/en/popup/std_msgs_string/
[std_msgs/Float64]: /docs/en/popup/std_msgs_float64_msg/
[geometry_msgs/Pose]: /docs/en/popup/geometry_msgs_Pose_msg/
[robotis_controller_msgs/StatusMsg]: /docs/en/popup/StatusMsg.msg/
[manipulator_manipulation_module_msgs/JointPose]: /docs/en/popup/JointPose.msg/
[manipulator_manipulation_module_msgs/KinematicsPose]: /docs/en/popup/KinematicsPose.msg/
[manipulator_manipulation_module_msgs/GetJointPose]: /docs/en/popup/GetJointPose.srv/
[manipulator_manipulation_module_msgs/GetKinematicsPose]: /docs/en/popup/GetKinematicsPose.srv/
[Creating new robot manager]: /docs/en/software/robotis_framework_packages/tutorials/#creating-new-robot-manager
[manipulator_manager]: /docs/en/platform/manipulator_h/manipulator_ros/#manipulator-manager
