---
layout: archive
lang: en
ref: openmanipulator
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/openmanipulator/
sidebar:
  title: OpenManipulator
  nav: "openmanipulator"
---

# OpenManipulator Chain

## Specification

|                     |  Unit     | Chain with XM430-W350                     |
| -----------------   | --------- | ----------------------------------------- |
| **Input Voltage**   |  V        |  12                                       |
| **DOF**             |  -        |  5 (4 DOF + 1 DOF Gripper)                |
| **Payload**         |  g        |  1000 ~ 1300 (2.20 ~ 2.86)                |
| **Speed(Joint)**    |  rad/sec  |  4.82                                     |
| **Weight**          |  kg(lb)   |  0.7 (1.54)                               |
| **Reach**           |  mm (in)  |  380 (14.9)                               |
| **Rated Voltage**   |  VDC      |  12                                       |
| **Communication**   |  -        |  RS-485 (Multi Drop Bus)                  |
| **Power(Joint)**    |  W        |  27.6                                     |
| **Software**        |  -        |  ROS, Dynamixel SDK, Arduino, Processing  |
| **Main Controller** |  -        |  Laptop PC, OpenCR                        |

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_spec_side.PNG)

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_spec_gripper.JPG)

## Hardware Setup

[Parts of OpenManipulator](https://docs.google.com/a/robotis.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit?usp=sharing)

[CAD Files](https://goo.gl/NsqJMu)

* Items that are painted in purple are purchased on ROBOTIS SHOP
* Items that are painted in green are purchased on shopping mall
* Items that are painted in yellow are 3D printing parts

## Software Setup

### ROS

<iframe width="560" height="315" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

 [![](https://img.youtube.com/vi/B2pnXtooKOg/0.jpg)](https://www.youtube.com/watch?v=B2pnXtooKOg)

* Install dependent packages for the OpenManipulator.

  ```
 $ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-dynamixel-sdk ros-kinetic-dynamixel-workbench-toolbox ros-kinetic-robotis-math ros-kinetic-industrial-core 
 ```

 ```
 $ cd ~/catkin_ws/src/
 ```

 $ `git clone https://github.com/ROBOTIS-GIT/open_manipulator.git`

 $ `cd ~/catkin_ws && catkin_make` 

* If catkin_make command is completed without any errors, the preparation for OpenManipulator is done.

## Gazebo(3D)

* Below command will load the OpenManipulator on Gazebo environment.

 $ `roslaunch open_manipulator_gazebo open_manipulator_gazebo.launch`

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_gazebo_1.jpg)

* In order to control OpenManipulator, please use topic publish with below command in a new terminal window.

 $ `rostopic pub /open_manipulator_chain/joint2_position/command std_msgs/Float64 "data: 1.0" --once`

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_gazebo_2.jpg)

* In order to run OpenManipulator simulation with MoveIt!, open a new terminal window and enter below command.

 $ `roslaunch open_manipulator_moveit open_manipulator_demo.launch use_gazebo:=true`

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_moveit_sim_1.png)

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_moveit_sim_2.png)

* In order to control gripper, please use topic publish with below command in a new terminal window.

 $ `rostopic pub /robotis/open_manipulator/gripper std_msgs/String "data: 'grip_on'" --once`

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_gripper.png)

## Platform

* Below command will load the OpenManipulator with DYNAMIXEL X-series.

 $ `roslaunch open_manipulator_dynamixel_ctrl dynamixel_controller.launch`

* In order to run OpenManipulator simulation with MoveIt!, open a new terminal window and enter below command.

 $ `roslaunch open_manipulator_moveit open_manipulator_demo.launch`

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_moveit_real_1.png)

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_moveit_real_2.png)

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_moveit_real_3.png)

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_moveit_real_4.png)

## TurtleBot3 Waffle with OpenManipulator Chain

* Install dependent packages for the OpenManipulator.

 $ `cd ~/catkin_ws/src`

 $ `git clone https://github.com/ROBOTIS-GIT/turtlebot3.git`

 $ `cd ~/catkin_ws && catkin_make`

* Below command will load the TurtleBot3 Waffle with OpenManipulator on Rviz.

 $ `roslaunch open_manipulator_with_tb3 open_manipulator_chain_with_tb3_rviz.launch`

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/TurtleBot3_with_Open_Manipulator.jpg)

### OpenCR

[OpenCR WIKI](https://github.com/ROBOTIS-GIT/OpenCR/wiki/arduino_examples_openmanipulator_chain)

## Image of OpenManipulator Chain

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_OnShape.jpg)

![](https://raw.githubusercontent.com/ROBOTIS-GIT/ROBOTIS-Documents/master/wiki-images/OpenManipulator/OpenManipulator_Chain_Capture.png)


# [SCARA](#scara)

# [Link](#link)
