---
layout: archive
lang: en
ref: openmanipulator_x_ros_controls
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_controls/
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 10
---

<div style="counter-reset: h1 9"></div>

# [[ROS] Controls](#ros-controls)

## [MoveIt!](#moveit)
MoveIt is a set of packages for your robot to manipulate for Motion Planning, Manipulation, Inverse Kinematics, Control, 3D Perception and Collision Checking. 

The following instruction describes how to install moveit package and to use MoveIt with OpenMAIPULATOR-X.

### [Install MoveIt Packages](#install-moveit-packages)
```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_controls.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_dependencies.git
$ cd ~/catkin_ws && catkin_make
```

### [Launch MoveIt!](#launch-moveit) 
Launch **MoveIt!** with the following command.
``` bash
$ roslaunch open_manipulator_controllers joint_trajectory_controller.launch sim:=false
```
  ![](/assets/images/platform/openmanipulator_x/moveit_launch.png)  

<!--
![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_1.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_2.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_3.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_4.png) 
-->

#### [Using MoveIt! with Gazebo](#using-moveit-with-gazebo)
Gazebo is a tool to simulate and test your robot in a virtual enviroment, without an actual robot.  

Also, you can use MoveIt feature using your virtual robot in the gazebo enviroment with the following command.

For more information on Gazebo, See [Simulation](/docs/en/platform/openmanipulator_x/ros_simulation/#ros-simulation)

```bash
# Gazebo Simulation
$ roslaunch open_manipulator_controllers joint_trajectory_controller.launch
```

## [Gravity Compensation](#gravity-compensation)
Let OpenMANIPULATOR-X compensate gravity forces by using the Gravity Compensation packages

This section describes how to install and use Gravity Compensation feature with OpenMANIPULATOR-X.

### [Install Gravity Compensation Packages](#install-gravity-compensation-packages)
```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_controls.git
$ cd ~/catkin_ws && catkin_make
```

### [Set Operating Mode to Current Mode](#set-operating-mode-to-current-mode)
Set your DYNAMXEL's Operating Mode to Current Mode via [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/)

![](/assets/images/platform/openmanipulator_x/omx_gravity_current_mode_setting.png)

### [Run Gravity Compensation Package](#run-gravity-compensation-package)
Run the gravity compensation package with OpenMANIPULATOR-X.

```bash
$ roslaunch open_manipulator_controllers gravity_compensation_controller.launch
```
