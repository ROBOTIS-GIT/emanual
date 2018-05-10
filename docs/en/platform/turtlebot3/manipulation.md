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

<div style="counter-reset: h1 14"></div>

# [Manipulation](#manipulation)

`Note` This instruction was tested on `Ubuntu 16.04`, `Linux Mint 18.1` and `ROS Kinetic Kame`.
{: .notice--info}

`Note` If you want more specfic information about OpenManipulator, please refer to the [OpenManipulator e-Manual](/docs/en/platform/openmanipulator/)
{: .notice--info}

![](/assets/images/platform/turtlebot3/manipulation/tb3_with_opm_logo.png)

<!-- <iframe width="640" height="360" src="https://www.youtube.com/embed/qbht0ssv8M0" frameborder="0" allowfullscreen></iframe> -->

<!-- <iframe width="640" height="360" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" allowfullscreen></iframe> -->

`Tip` The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is Ctrl-Alt-T.
{: .notice--info}

## [Software Setup](#software-setup)

Install dependent packages for the Open-Manipulator.

```bash
$ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-dynamixel-sdk ros-kinetic-dynamixel-workbench-toolbox ros-kinetic-ar-track-alvar ros-kinetic-industrial-core 
```

```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/catkin_ws && catkin_make
```

If catkin_make command is completed without any errors, the preparation for Open-Manipulator is done.

Load a TurtleBot3 Waffle or Waffle Pi with OpenManipulator on RViz.

**Tip :** TB3_MODEL =  `waffle`, `waffle_pi` 
{: .notice--info}

```
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3 open_manipulator_with_tb3_rviz.launch
```

![](/assets/images/platform/openmanipulator/TurtleBot3_with_Open_Manipulator.png)

## [Hardware Setup](#hardware-setup)

First, detach lidar sensor and shift it front of TurtleBot3 (Red circle represents position of bolts)

Second, attach OpenManipulator on the TurtleBot3 (Yellow circle represents position of bolts)

![](/assets/images/platform/turtlebot3/manipulation/assemble_points.png)

![](/assets/images/platform/turtlebot3/manipulation/assemble.png)

## [OpenCR Setup](#opencr-setup)

Before you following step, please setup Arduino IDE

  - [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

OpenCR1.0 firmware (or the source) for TurtleBot3 with Openmanipulator is to control DYNAMIXEL and sensors in the ROS. The firmware is located in OpenCR example which is downloaded by the board manager.

Go to `File` → `Examples` → `TurtleBot3` → `turtlebot3_with_open_manipulator` → `turtlebot3_with_open_manipulator_core`.

![](/assets/images/platform/turtlebot3/manipulation/upload_core.png)

Click `Upload` button to upload the firmware to OpenCR1.0.

![](/assets/images/platform/turtlebot3/manipulation/upload_core_1.png)

`Note` If error occurs while uploading firmware, go to `Tools` → `Port` and check if correct port is selected. Press `Reset` button on the OpenCR1.0 and try to upload the firmware again.
{: .notice--info}
  
**[Remote PC]** When firmware upload is completed, `jump_to_fw` text string will be printed on the screen.

## [Simulation](#simulation)

### [Gazebo](#gazebo)

Load an TurtleBot3 with OpenManipulator on Gazebo simulator and click `Play` button

```bash
$ roslaunch open_manipulator_gazebo open_manipulator_with_tb3_gazebo.launch
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gazebo_1.png)

Type `rostopic list` to check which topic is activated

```
/camera/parameter_descriptions
/camera/parameter_updates
/camera/rgb/camera_info
/camera/rgb/image_raw
/camera/rgb/image_raw/compressed
/camera/rgb/image_raw/compressed/parameter_descriptions
/camera/rgb/image_raw/compressed/parameter_updates
/camera/rgb/image_raw/compressedDepth
/camera/rgb/image_raw/compressedDepth/parameter_descriptions
/camera/rgb/image_raw/compressedDepth/parameter_updates
/camera/rgb/image_raw/theora
/camera/rgb/image_raw/theora/parameter_descriptions
/camera/rgb/image_raw/theora/parameter_updates
/clock
/cmd_vel
/gazebo/link_states
/gazebo/model_states
/gazebo/set_link_state
/gazebo/set_model_state
/grip_joint_position/command
/grip_joint_position/pid/parameter_descriptions
/grip_joint_position/pid/parameter_updates
/grip_joint_position/state
/grip_joint_sub_position/command
/grip_joint_sub_position/pid/parameter_descriptions
/grip_joint_sub_position/pid/parameter_updates
/grip_joint_sub_position/state
/imu
/joint1_position/command
/joint1_position/pid/parameter_descriptions
/joint1_position/pid/parameter_updates
/joint1_position/state
/joint2_position/command
/joint2_position/pid/parameter_descriptions
/joint2_position/pid/parameter_updates
/joint2_position/state
/joint3_position/command
/joint3_position/pid/parameter_descriptions
/joint3_position/pid/parameter_updates
/joint3_position/state
/joint4_position/command
/joint4_position/pid/parameter_descriptions
/joint4_position/pid/parameter_updates
/joint4_position/state
/joint_states
/odom
/rosout
/rosout_agg
/scan
/tf
```

OpenManipulator in Gazebo is controllered by ROS message. For example, below command publish joint position(radian)

```
$ rostopic pub /open_manipulator/joint4_position/command std_msgs/Float64 "data: 0.21" --once
```

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gazebo_2.png)

In order to run MoveIt!, open a new terminal window and enter below command

```
$ roslaunch open_manipulator_moveit open_manipulator_demo.launch use_gazebo:=true
```

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_sim_1.jpg)

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_sim_2.jpg)

In order to control gripper, please use topic publish with below command in a new terminal window.

```
$ rostopic pub /robotis/open_manipulator/gripper std_msgs/String "data: 'grip_on'" --once
```

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gripper.png)

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

Below command will load the TurtleBot3 Waffle with Open-Manipulator on RViz.

```bash
$ roslaunch open_manipulator_with_tb3 open_manipulator_chain_with_tb3_rviz.launch
```

![](/assets/images/platform/turtlebot3/manipulation/TurtleBot3_with_Open_Manipulator.png)
