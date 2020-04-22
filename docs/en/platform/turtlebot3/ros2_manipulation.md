---
layout: archive
lang: en
ref: ros2_manipulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2_manipulation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 36
---

<div style="counter-reset: h1 21"></div>

# [[ROS 2] Manipulation](#ros-2-manipulation)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 18.04` and `ROS Dashing Diademata`.
- More information on OpenMANIPULATOR-X is availabe at [OpenMANIPULATOR e-Manual](/docs/en/platform/openmanipulator/).
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [TurtleBot3 with OpenMANIPULATOR](#turtlebot3-with-openmanipulator)

![](/assets/images/platform/turtlebot3/manipulation/tb3_with_opm_logo.png)

The OpenMANIPULATOR by ROBOTIS is one of the manipulators that support ROS platform, and has the advantage of being able to easily manufacture at a low cost by using DYNAMIXEL actuators with 3D printed parts.
The OpenMANIPULATOR has the advantage of being compatible with TurtleBot3 Waffle and Waffle Pi. Through this compatibility can compensate for the lack of freedom and can have greater completeness as a service robot with the the SLAM and Navigation capabilities that the TurtleBot3 has. TurtleBot3 and OpenMANIPULATOR can be used as a `mobile manipulator` and can do things like the following videos.
fds
<iframe width="560" height="315" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/P82pZsqpBg0" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/DLOq8yNcCoE" frameborder="0" allowfullscreen></iframe>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning} 

## [Software Setup](#software-setup)

**NOTE**: Be sure to install `turtlebot3` and `open_manipulator` packages, before installation of `open_manipulator_with_tb3` packages.
{: .notice--info}

- Install dependent packages for the OpenMANIPULATOR with TurtleBot3.

**[TurtleBot3]**

1. Open a terminal on **TurtleBot3**. 
2. Install dependent packages using the following commands.
  ```bash
  $ cd ~/turtlebot3_ws/src/
  $ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
  $ cd ~/turtlebot3_ws && colcon build --symlink-install
  ```

**[Remote PC]**

1. Open a terminal on **Remote PC**. 
2. Install dependent packages using the following commands.
  ```bash
  $ cd ~/robotis_ws/src/
  $ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
  $ cd ~/robotis_ws && colcon build --symlink-install
  ```
  - If `colcon build` command is complete without any errors, go to the step 3.  
  
3. Load TurtleBot3 Waffle (or Waffle Pi) with OpenMANIPULATOR on RViz.
    - Open a terminal on **Remote PC**.
    - Execute RViz using the following command. 
      ```bash
      $ ros2 launch turtlebot3_manipulation_description turtlebot3_manipulation_rviz.launch.py
      ```

      ![](/assets/images/platform/turtlebot3/manipulation/TurtleBot3_with_Open_Manipulator.png)

## [Hardware Setup](#hardware-setup)

[CAD files](http://www.robotis.com/service/download.php?no=767) (TurtleBot3 Waffle Pi + OpenMANIPULATOR)

![](/assets/images/platform/turtlebot3/manipulation/hardware_setup.png)

- Detach lidar sensor and shift it front of TurtleBot3 (Red circle represents position of bolts).
- Attach OpenMANIPULATOR on the TurtleBot3 (Yellow circle represents position of bolts).

![](/assets/images/platform/turtlebot3/manipulation/assemble_points.png)

![](/assets/images/platform/turtlebot3/manipulation/assemble.png)

- Connect OpenMANIPULATOR-X to Raspberry Pi 3 using a U2D2 and to OpenCR for power.

## [Bringup](#bringup)

Be sure to read [Bringup](/docs/en/platform/turtlebot3/ros2_bringup/#bringup) manual before use of the following instruction.
{: .notice--warning}

**[TurtleBot3]** 

1. Open a terminal on **TurtleBot3**. 
2. Launch turtlebot3_manipulation_controller using the following command.
  ```bash
  $ ros2 launch turtlebot3_manipulation_controller turtlebot3_manipulation_controller.launch.py
  ```
<!-- 
**[TurtleBot3]** Launch rpicamera node
```bash
$ ROS_NAMESPACE=om_with_tb3 roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
``` -->/docs/en/platform/turtlebot3/ros2_manipulation/

## [SLAM](#slam)

Be sure to read [SLAM](http://emanual.robotis.com/docs/en/platform/turtlebot3/ros2_slam/#slam) manual before use of the following instruction.
{: .notice--warning}

### [Run SLAM Nodes](#run_slam_nodes)

**[Remote PC]** 

1. Open a terminal on **Remote PC**. 
2. Launch **slam node** using the following command.
```bash
$ ros2 launch turtlebot3_cartographer cartographer.launch.py
```

### [Run Teleoperation Nodes](#run_teleoperation_nodes)

**[Remote PC]** 

1. Open a terminal on **Remote PC**. 
2. Launch **teleop node** using the following command.
```bash
$ ros2 run turtlebot3_manipulation_teleop turtlebot3_manipulation_teleop_keyboard
```

3. Manipulate OpenMANIPULATOR-X on TurtleBot3 using the virtual controller. Simply type the keys without using an **Enter** key. 
    
    ```bash
    ---------------------------
    Control TurtleBot3 + OpenManipulatorX
    ---------------------------
    8 : increase linear velocity
    2 : decrease linear velocity
    4 : increase angular velocity
    6 : decrease angular velocity
    5 : base stop

    w : increase x axis in task space
    s : decrease x axis in task space
    a : increase y axis in task space
    d : decrease y axis in task space
    z : increase z axis in task space
    x : decrease z axis in task space

    y : increase joint 1 angle
    h : decrease joint 1 angle
    u : increase joint 2 angle
    j : decrease joint 2 angle
    i : increase joint 3 angle
    k : decrease joint 3 angle
    o : increase joint 4 angle
    l : decrease joint 4 angle

    g : gripper open
    f : gripper close
           
    0 : init pose
    1 : home pose
           
    q to quit
    ---------------------------
    Present Linear Velocity: 0.000, Angular Velocity: 0.000
    Present Joint Angle J1: 0.000 J2: 0.000 J3: 0.000 J4: 0.000
    Present Kinematics Position X: 0.000 Y: 0.000 Z: 0.000
    ---------------------------
    ```
    
### [Save the Map](#save_the_map)

**[Remote PC]** 

1. Open a terminal on **Remote PC**. 
2. Launch **map_saver node** using the following command.
```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```

    ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_slam.png)

## [Navigation](#navigation)

Be sure to read [Navigation](/docs/en/platform/turtlebot3/ros2_navigation2/#navigation2) manual before use of the following instruction.
{: .notice--warning}

1. Open a terminal on **Remote PC**. 
2. Launch the navigation file using the following command.
```bash
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py map:=$HOME/map.yaml
```

    ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_navigation.png)

## [Simulation](#simulation)

It will be released soon !
{: .notice--info} 

<!-- - Load TurtleBot3 with OpenMANIPULATOR on Gazebo simulator and click `Play` button

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

- OpenMANIPULATOR in Gazebo is controllered by ROS message. For example, to use below command make publish joint position (radian).

```bash
$ rostopic pub /om_with_tb3/joint4_position/command std_msgs/Float64 "data: -0.21" --once
``` -->

## [Pick and Place](#pick-and-place)

It will be released soon ! 
{: .notice--info}

<!-- ```bash

We provide the pick and place example for mobile manipulation. This example is used [smach][smach](task-level architecture) to send action to robot.

### Bringup gazebo simulator

```bash
$ roslaunch open_manipulator_with_tb3_gazebo rooms.launch use_platform:=false
```

### Launch task controller


$ roslaunch open_manipulator_with_tb3_tools task_controller.launch 
```
**TIP**: Smach provides state graph. Try to run smach viewer and how to robot can pick and place. `rosrun smach_viewer smach_viewer.py`
{: .notice--success} 

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_pick.png)

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_place.png) -->
