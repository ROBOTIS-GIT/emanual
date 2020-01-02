---
layout: archive
lang: en
ref: manipulator_h_ros_example
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/manipulator_h/ros_example/
sidebar:
  title: MANIPULATOR-H
  nav: "manipulator_h"
product_group: manipulator_h
page_number: 7
---

<div style="counter-reset: h1 6"></div>

# [ROS Example](#ros-example)

{% capture notice_01 %}
**NOTE**:
- This instructions has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
{: .notice--info}

## [Manipulator Manager](#manipulator-manager)

### Bring up the robot in Rviz
```
$ roslaunch manipulator_h_bringup robotis_manipulator.launch   
```
![](/assets/images/platform/manipulator_h/manipulator_h_rviz.png)
  

### Run manipulator manager
```
$ sudo bash
[sudo] password for robotis:   
# roslaunch manipulator_h_manager manipulator_h_manager.launch   
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
/dev/ttyUSB0 added. (baudrate: 1000000)
(/dev/ttyUSB0) [ID:  1] H54-200-S500-R added. 
(/dev/ttyUSB0) [ID:  2] H54-200-S500-R added. 
(/dev/ttyUSB0) [ID:  3] H54-100-S500-R added. 
(/dev/ttyUSB0) [ID:  4] H54-100-S500-R added. 
(/dev/ttyUSB0) [ID:  5] H42-20-S300-R added. 
(/dev/ttyUSB0) [ID:  6] H42-20-S300-R added. 
[ INFO] [1552279834.361381084]: Load offsets...
```
{% capture notice_01 %}
**TIP**:
- If you can't load DYNAMIXEL's, please check your DYNAMIXEL's settings using [this page](/docs/en/platform/manipulator_h/getting_started/#prerequisite).
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

## [GUI Program](#gui-program)

### Run GUI program
You can use the GUI program to manipulate the Manipulator-H.

```
$ rosrun manipulator_h_gui manipulator_h_gui
```

![](/assets/images/platform/manipulator_h/manipulator_h_gui.png)  

To control manipulator, first click the `set mode` button.   

Set the manipulator to initial pose, click the `go to initial pose` button.   

To check the joint angles of the manipulator, click the `Get current joint values` button. And To check the pose in the task space, click the `Get current pose` button.   

To move the manipulator in the joint space. Enter the joint angles. Then click the `Send Des Joint Val.` button. And, to move the manipulator in the task space. Enter the kinematics pose of the end-effector(tool) in the task space. Then click the `Send Des Pos.` button.  

## [Simulation](#simulation)

{% capture notice_01 %}
**NOTE**:
- The test is done on `ROS Kinetic Kame` installed in `Ubuntu 16.04`.
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_h/ros_setup/#install-ros-packages)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

### Launch Gazebo
Load the manipulator on Gazebo simulator and click on Play `▶` button.
```
$ roslaunch manipulator_h_gazebo manipulator_h_gazebo.launch   
```
![](/assets/images/platform/manipulator_h/manipulator_h_gazebo.png)  

### Manipulator manager for Gazebo simulator

```
$ roslaunch manipulator_h_manager manipulator_h_manager_gazebo.launch 
```

If the manipulator manger has been launched successfully, the terminal will show the following message.

```
SUMMARY
========

PARAMETERS
 * /gazebo: True
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
/dev/ttyUSB0 added. (baudrate: 1000000)
(/dev/ttyUSB0) [ID:  1] H54-200-S500-R added. 
(/dev/ttyUSB0) [ID:  2] H54-200-S500-R added. 
(/dev/ttyUSB0) [ID:  3] H54-100-S500-R added. 
(/dev/ttyUSB0) [ID:  4] H54-100-S500-R added. 
(/dev/ttyUSB0) [ID:  5] H42-20-S300-R added. 
(/dev/ttyUSB0) [ID:  6] H42-20-S300-R added. 
[ INFO] [1552279834.361381084]: Load offsets...
```
