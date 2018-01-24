---
layout: archive
lang: en
ref: turtlebot3_manipulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/manipulation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 12"></div>

# [Manipulation](#manipulation)

`Note` This instruction was tested on <kbd>Ubuntu 16.04</kbd>, <kbd>Linux Mint 18.1</kbd> and <kbd>ROS Kinetic Kame</kbd>.
{: .notice--info}

`Note` If you want more specfic information about OpenManipulator, please refer to the [OpenManipulator e-Manual](/docs/en/platform/openmanipulator/)
{: .notice--info}

<iframe width="640" height="360" src="https://www.youtube.com/embed/qbht0ssv8M0" frameborder="0" allowfullscreen></iframe>

<iframe width="640" height="360" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" allowfullscreen></iframe>

`Tip` The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is Ctrl-Alt-T.
{: .notice--info}

Install dependent packages for the Open-Manipulator.

```bash
$ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-dynamixel-sdk ros-kinetic-dynamixel-workbench-toolbox ros-kinetic-robotis-math ros-kinetic-industrial-core
```

```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator.git
$ cd ~/catkin_ws && catkin_make
```

If catkin_make command is completed without any errors, the preparation for Open-Manipulator is done.

## [Gazebo (3D)](#gazebo-3d)

Below command will load the Open-Manipulator on Gazebo environment.

```bash
$ roslaunch open_manipulator_gazebo open_manipulator_gazebo.launch
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gazebo_1.png)

In order to control Open-Manipulator, please use topic publish with below command in a new terminal window.

```bash
$ rostopic pub /open_manipulator_chain/joint2_position/command std_msgs/Float64 "data: 1.0" --once
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gazebo_2.png)

In order to run Open-Manipulator simulation with MoveIt!, open a new terminal window and enter below command.

```bash
$ roslaunch open_manipulator_moveit open_manipulator_demo.launch use_gazebo:=true
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_sim_1.png)

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_sim_2.png)

In order to control gripper, please use topic publish with below command in a new terminal window.

```bash
$ rostopic pub /robotis/open_manipulator/gripper std_msgs/String "data: 'grip_on'" --once
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gripper.png)

## [Platform](#platform)

Below command will load the Open-Manipulator with DYNAMIXEL X-series.

```bash
$ roslaunch open_manipulator_dynamixel_ctrl dynamixel_controller.launch
```

In order to run Open-Manipulator simulation with MoveIt!, open a new terminal window and enter below command.

```bash
$ roslaunch open_manipulator_moveit open_manipulator_demo.launch
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_real_1.png)

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_real_2.jpg)

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_real_3.png)

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_real_4.jpg)

## [TurtleBot3 Waffle with Open-Manipulator](#turtlebot3-waffle-with-openmanipulator)

Install dependent packages for the Open-Manipulator.

```bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/catkin_ws && catkin_make
```

Below command will load the TurtleBot3 Waffle with Open-Manipulator on Rviz.

```bash
$ roslaunch open_manipulator_with_tb3 open_manipulator_chain_with_tb3_rviz.launch
```

![](/assets/images/platform/turtlebot3/manipulation/TurtleBot3_with_Open_Manipulator.png)
