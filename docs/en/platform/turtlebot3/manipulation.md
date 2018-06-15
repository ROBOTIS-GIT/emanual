---
layout: archive
lang: en
ref: manipulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/manipulation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 11"></div>

# [Manipulation](#manipulation)

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- If you want more specfic information about OpenManipulator, please refer to the [OpenManipulator e-Manual](/docs/en/platform/openmanipulator/).
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

{% capture notice_02 %}
{% include en/platform/turtlebot3/ros_book_info.md %}
{% endcapture %}
<div class="notice--success">{{ notice_02 | markdownify }}</div>

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

## [TurtleBot3 with OpenManipulator](#turtlebot3-with-openmanipulator)

![](/assets/images/platform/turtlebot3/manipulation/tb3_with_opm_logo.png)

The OpenManipulator by ROBOTIS is one of the manipulators that support ROS, and has the advantage of being able to easily manufacture at a low cost by using Dynamixel actuators with 3D printed parts. 

The OpenManipulator has the advantage of being compatible with TurtleBot3 Waffle and Waffle Pi. Through this compatibility can compensate for the lack of freedom and can have greater completeness as a service robot with the the SLAM and Navigation capabilities that the TurtleBot3 has. TurtleBot3 and OpenManipulator can be used as a `mobile manipulator` and can do things like the following videos.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/P82pZsqpBg0" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/DLOq8yNcCoE" frameborder="0" allowfullscreen></iframe>

## [Software Setup](#software-setup)

- Install dependent packages for the OpenManipulator.

  ```bash
  $ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-dynamixel-sdk ros-kinetic-dynamixel-workbench-toolbox ros-kinetic-ar-track-alvar ros-kinetic-ar-track-alvar-msgs ros-kinetic-industrial-core 
  ```

  ```bash
  $ cd ~/catkin_ws/src/
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_perception.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_msgs.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_simulations.git
  $ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
  $ cd ~/catkin_ws && catkin_make
  ```

- If `catkin_make` command is completed without any errors, the preparation for OpenManipulator is done. Then load a TurtleBot3 Waffle or Waffle Pi with OpenManipulator on RViz.

  **TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
  {: .notice--success}

  ```bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_description open_manipulator_with_tb3_rviz.launch 
  ```

  ![](/assets/images/platform/openmanipulator/TurtleBot3_with_Open_Manipulator.png)

## [Hardware Setup](#hardware-setup)

- [CAD files](http://www.robotis.com/service/download.php?no=767) (TurtleBot3 Waffle Pi + OpenManipulator)

  ![](/assets/images/platform/turtlebot3/manipulation/hardware_setup.png)

- First, detach lidar sensor and shift it front of TurtleBot3 (Red circle represents position of bolts). 
- Second, attach OpenManipulator on the TurtleBot3 (Yellow circle represents position of bolts).

  ![](/assets/images/platform/turtlebot3/manipulation/assemble_points.png)

  ![](/assets/images/platform/turtlebot3/manipulation/assemble.png)

## [OpenCR Setup](#opencr-setup)

- Before you following step, please setup Arduino IDE.

  - [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

- OpenCR firmware (or the source) for TurtleBot3 with Openmanipulator is to control DYNAMIXEL and sensors in the ROS. The firmware is located in OpenCR example which is downloaded by the board manager.

- Go to `File` → `Examples` → `TurtleBot3` → `turtlebot3_with_open_manipulator` → `turtlebot3_with_open_manipulator_core`.

  ![](/assets/images/platform/turtlebot3/manipulation/upload_core.png)

- Click `Upload` button to upload the firmware to OpenCR.

  ![](/assets/images/platform/turtlebot3/manipulation/upload_core_1.png)

  **NOTE**: If error occurs while uploading firmware, go to `Tools` → `Port` and check if correct port is selected. Press `Reset` button on the OpenCR and try to upload the firmware again.
  {: .notice--info}
  
- When firmware upload is completed, `jump_to_fw` text string will be printed on the screen.

## [Bringup](#bringup)

- Bringup TurtleBot3 with OpenManipulator.

  - [Bringup TurtleBot3](/docs/en/platform/turtlebot3/bringup/#bringup-turtlebot3)

- Launch `open_manipulator_with_tb3_model` file.

  ```bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_description open_manipulator_with_tb3_model.launch use_gazebo:=false
  ```

## [SLAM](#slam)

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3_tools open_manipulator_with_tb3_slam.launch use_gazebo:=false open_rviz:=true
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_slam.png)

## [Navigation](#navigation)

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3_tools open_manipulator_with_tb3_navigation.launch use_gazebo:=false open_rviz:=true
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_navigation.png)

## [Find AR marker](#find-ar-marker)

- We used the [ar_track_alvar](http://wiki.ros.org/ar_track_alvar) package to get the pose of the AR marker.

  ```bash
  $ roslaunch open_manipulator_ar_markers ar_pose.launch
  ```

## [MoveIt!](#moveit)

- In order to run [MoveIt!](https://moveit.ros.org/), open a new terminal window and enter the command below.

  ```bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_tools open_manipulator_with_tb3_manipulation.launch use_gazebo:=false open_rviz:=true
  ```

  ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_sim_1.jpg)

  ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_sim_2.jpg)

- In order to control gripper of OpenManipulator, please use topic publish with the command below in a new terminal window.

  ```
  $ rostopic pub /open_manipulator_with_tb3/gripper std_msgs/String "data: 'grip_off'" --once
  ```

  ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gripper.png)

## [Pick and Place](#pick-and-place)

We provide the pick and place example for mobile manipulation. This example is launched by controller that is to automatically start and stop navigation stack, MoveIt!, pick and place launch file by communicating ROS messages. User can modified this node to apply their environments. 

```bash
$ roslaunch open_manipulator_with_tb3_tools open_manipulator_with_tb3_controller.launch
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_pick.png)

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_place.png)

## [Simulation](#simulation)

- Load TurtleBot3 with OpenManipulator on Gazebo simulator and click `Play` button

  ```bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_gazebo open_manipulator_with_tb3_gazebo.launch 
  ```

  ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gazebo_1.png)

- Type `rostopic list` to check which topic is activated.

  ``` bash
  $ rostopic list
  ```

  ``` bash
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

- OpenManipulator in Gazebo is controllered by ROS message. For example, to use below command make publish joint position (radian).

  ```bash
  $ rostopic pub /joint4_position/command std_msgs/Float64 "data: 0.21" --once
  ```

[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
