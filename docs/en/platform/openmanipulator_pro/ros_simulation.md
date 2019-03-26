---
layout: archive
lang: en
ref: openmanipulator_pro_ros_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_pro/ros_simulation/
sidebar:
  title: OpenManipulator-PRO
  nav: "openmanipulator_pro"
---

<div style="counter-reset: h1 6"></div>

# [[ROS] Simulation](#ros-simulation)

{% capture notice_01 %}
**NOTE**:
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be run on PC with ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
{: .notice--info}

## [Manager for gazebo](#manager-for-gazebo)

```
$ roslaunch manipulator_h_manager open_manipulator_pro_manager_gazebo.launch
```

If you have a gripper([RH-P12-RN(A)](/docs/en/platform/rh_p12_rna/)), see below. 
```
$ roslaunch manipulator_h_manager open_manipulator_pro_manager_gazebo.launch with_gripper:=true
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
(/dev/ttyUSB0) [ID:  1] H54P-200-S500-R added. 
(/dev/ttyUSB0) [ID:  2] H54P-200-S500-R added. 
(/dev/ttyUSB0) [ID:  3] H54P-100-S500-R added. 
(/dev/ttyUSB0) [ID:  4] H54P-100-S500-R added. 
(/dev/ttyUSB0) [ID:  5] H42P-020-S300-R added. 
(/dev/ttyUSB0) [ID:  6] H42P-020-S300-R added. 
[ INFO] [1552279834.361381084]: Load offsets...
```

## [Launch gazebo](#launch-gazebo)

Load the manipulator on Gazebo simulator and click on Play `▶` button.
```
$ roslaunch manipulator_h_gazebo open_manipulator_pro_gazebo.launch   
```
If you have a gripper([RH-P12-RN(A)](/docs/en/platform/rh_p12_rna/)), see below. 
```
$ roslaunch manipulator_h_gazebo open_manipulator_pro_gazebo.launch with_gripper:=true
```
![](/assets/images/platform/openmanipulator_pro/gazebo.png)  
