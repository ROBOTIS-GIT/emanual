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

**NOTE**: Before you make `open_manipulator_with_tb3`, please make sure `turtlebot3` and `open_manipulator` packages have been installed previously.
{: .notice--info}

- Install dependent packages for the OpenManipulator.

  ```bash
  $ cd ~/catkin_ws/src/
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_msgs.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_simulations.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_perceptions.git
  $ sudo apt-get install ros-kinetic-smach*
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

  **TIP**: The Dynamixel ids can be changed in [`open_manipulator_driver.h`][manipulator_id] in turtlebot3_with_open_manipulator folder 
  {: .notice--success}

- When firmware upload is completed, `jump_to_fw` text string will be printed on the screen.

## [Bringup](#bringup)

  **NOTE**: Please double check the OpenCR usb port name in [`turtlebot3_core.launch][turtlebot3_core]
  {: .notice--info}

  ```bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_tools robot.launch
  ```

## [SLAM](#slam)

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3_tools slam.launch use_platform:=true
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_slam.png)

## [Navigation](#navigation)

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3_tools navigation.launch use_platform:=true
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_navigation.png)

## [MoveIt!](#moveit)

- In order to run [MoveIt!](https://moveit.ros.org/), open a new terminal window and enter the command below.

  ```bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_tools manipulation.launch use_platform:=true
  ```

  ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_sim_1.jpg)

  ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_sim_2.jpg)

- In order to control gripper of OpenManipulator, please use topic publish with the command below in a new terminal window.

  ```bash
  $ rosservice call /om_with_tb3/gripper "planning_group: ''
  joint_position:
    joint_name:
    - ''
    position:
    - 0.15
    max_accelerations_scaling_factor: 0.0
    max_velocity_scaling_factor: 0.0
  path_time: 0.0"
  ```

  ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gripper.png)

## [Simulation](#simulation)

- Load TurtleBot3 with OpenManipulator on Gazebo simulator and click `Play` button

  ```bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_gazebo empty_world.launch
  ```

  ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gazebo_1.png)

- Type `rostopic list` to check which topic is activated.

  ``` bash
  $ rostopic list
  ```

  ``` bash
  /clock
  /gazebo/link_states
  /gazebo/model_states
  /gazebo/parameter_descriptions
  /gazebo/parameter_updates
  /gazebo/set_link_state
  /gazebo/set_model_state
  /gazebo_gui/parameter_descriptions
  /gazebo_gui/parameter_updates
  /gazebo_ros_control/pid_gains/gripper/parameter_descriptions
  /gazebo_ros_control/pid_gains/gripper/parameter_updates
  /gazebo_ros_control/pid_gains/gripper/state
  /gazebo_ros_control/pid_gains/gripper_sub/parameter_descriptions
  /gazebo_ros_control/pid_gains/gripper_sub/parameter_updates
  /gazebo_ros_control/pid_gains/gripper_sub/state
  /gazebo_ros_control/pid_gains/joint1/parameter_descriptions
  /gazebo_ros_control/pid_gains/joint1/parameter_updates
  /gazebo_ros_control/pid_gains/joint1/state
  /gazebo_ros_control/pid_gains/joint2/parameter_descriptions
  /gazebo_ros_control/pid_gains/joint2/parameter_updates
  /gazebo_ros_control/pid_gains/joint2/state
  /gazebo_ros_control/pid_gains/joint3/parameter_descriptions
  /gazebo_ros_control/pid_gains/joint3/parameter_updates
  /gazebo_ros_control/pid_gains/joint3/state
  /gazebo_ros_control/pid_gains/joint4/parameter_descriptions
  /gazebo_ros_control/pid_gains/joint4/parameter_updates
  /gazebo_ros_control/pid_gains/joint4/state
  /om_with_tb3/camera/parameter_descriptions
  /om_with_tb3/camera/parameter_updates
  /om_with_tb3/camera/rgb/camera_info
  /om_with_tb3/camera/rgb/image_raw
  /om_with_tb3/camera/rgb/image_raw/compressed
  /om_with_tb3/camera/rgb/image_raw/compressed/parameter_descriptions
  /om_with_tb3/camera/rgb/image_raw/compressed/parameter_updates
  /om_with_tb3/camera/rgb/image_raw/compressedDepth
  /om_with_tb3/camera/rgb/image_raw/compressedDepth/parameter_descriptions
  /om_with_tb3/camera/rgb/image_raw/compressedDepth/parameter_updates
  /om_with_tb3/camera/rgb/image_raw/theora
  /om_with_tb3/camera/rgb/image_raw/theora/parameter_descriptions
  /om_with_tb3/camera/rgb/image_raw/theora/parameter_updates
  /om_with_tb3/cmd_vel
  /om_with_tb3/gripper_position/command
  /om_with_tb3/gripper_sub_position/command
  /om_with_tb3/imu
  /om_with_tb3/joint1_position/command
  /om_with_tb3/joint2_position/command
  /om_with_tb3/joint3_position/command
  /om_with_tb3/joint4_position/command
  /om_with_tb3/joint_states
  /om_with_tb3/odom
  /om_with_tb3/scan
  /rosout
  /rosout_agg
  /tf
  /tf_static
  ```

- OpenManipulator in Gazebo is controllered by ROS message. For example, to use below command make publish joint position (radian).

  ```bash
  $ rostopic pub /om_with_tb3/joint4_position/command std_msgs/Float64 "data: -0.21" --once
  ```

## [Pick and Place](#pick-and-place)

We provide the pick and place example for mobile manipulation. This example is used [smach][smach](task-level architecture) to send action to robot.

### Bringup gazebo simulator

```bash
$ roslaunch open_manipulator_with_tb3_gazebo rooms.launch use_platform:=false
```

### Launch navigation, moveIt!

```bash
$ roslaunch open_manipulator_with_tb3_tools rooms.launch use_platform:=false
```

### Launch task controller

```bash
$ roslaunch open_manipulator_with_tb3_tools task_controller.launch 
```
**TIP**: Smach provides state graph. Try to run smach viewer and how to robot can pick and place. `rosrun smach_viewer smach_viewer.py`
{: .notice--success}

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_pick.png)

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_place.png)


[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
[manipulator_id]: https://github.com/ROBOTIS-GIT/OpenCR/blob/ef4e71be84dd899b03e359703be93c5000c5954a/arduino/opencr_arduino/opencr/libraries/turtlebot3/examples/turtlebot3_with_open_manipulator/turtlebot3_with_open_manipulator_core/open_manipulator_driver.h#L27
[turtlebot3_core]: https://github.com/ROBOTIS-GIT/turtlebot3/blob/467c76bc4fa2e34162f57107388839d82d3bcc0e/turtlebot3_bringup/launch/turtlebot3_core.launch#L5
[smach]: http://wiki.ros.org/smach