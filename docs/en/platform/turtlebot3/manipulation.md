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
product_group: turtlebot3
page_number: 23
---

<div style="counter-reset: h1 11"></div>

# [[ROS 1] Manipulation](#ros-1-manipulation)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- If you want more specfic information about OpenMANIPULATOR, please refer to the [OpenMANIPULATOR e-Manual](/docs/en/platform/openmanipulator/).
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning} 

{% capture notice_02 %}
{% include en/platform/turtlebot3/ros_book_info.md %}
{% endcapture %}
<div class="notice--success">{{ notice_02 | markdownify }}</div>

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

## [TurtleBot3 with OpenMANIPULATOR](#turtlebot3-with-openmanipulator)

![](/assets/images/platform/turtlebot3/manipulation/tb3_with_opm_logo.png)

The OpenMANIPULATOR by ROBOTIS is one of the manipulators that support ROS, and has the advantage of being able to easily manufacture at a low cost by using DYNAMIXEL actuators with 3D printed parts.

The OpenMANIPULATOR has the advantage of being compatible with TurtleBot3 Waffle and Waffle Pi. Through this compatibility can compensate for the lack of freedom and can have greater completeness as a service robot with the the SLAM and Navigation capabilities that the TurtleBot3 has. TurtleBot3 and OpenMANIPULATOR can be used as a `mobile manipulator` and can do things like the following videos.

<iframe width="560" height="315" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/P82pZsqpBg0" frameborder="0" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/DLOq8yNcCoE" frameborder="0" allowfullscreen></iframe>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning} 

## [Software Setup](#software-setup)

**NOTE**: Before you install `open_manipulator_with_tb3` packages, please make sure `turtlebot3` and `open_manipulator` packages have been installed previously in RemotePC and setup [Raspberry Pi 3](/docs/en/platform/turtlebot3/raspberry_pi_3_setup/#raspberry-pi-3-setup).
{: .notice--info}

1. **[RemotePC]** Download and build the package using the following commands in order to use assembled OpenMANIPULATOR-X.
```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_manipulation.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_manipulation_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_dependencies.git
$ cd ~/catkin_ws && catkin_make
```

<!-- 
```bash
$ cd ~/catkin_ws && catkin_make
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_perceptions.git
$ sudo apt-get install ros-kinetic-smach* ros-kinetic-ar-track-alvar ros-kinetic-ar-track-alvar-msgs
$ cd ~/catkin_ws && catkin_make
```

- If `catkin_make` command is completed without any errors, the preparation for OpenMANIPULATOR is done. Then load a TurtleBot3 Waffle or Waffle Pi with OpenMANIPULATOR on RViz. -->

<!-- **TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

**[RemotePC]**
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3_description open_manipulator_with_tb3_rviz.launch
``` 

![](/assets/images/platform/turtlebot3/manipulation/TurtleBot3_with_Open_Manipulator.png)
-->

## [Hardware Setup](#hardware-setup)

- [CAD files](http://www.robotis.com/service/download.php?no=767) (TurtleBot3 Waffle Pi + OpenMANIPULATOR)

![](/assets/images/platform/turtlebot3/manipulation/hardware_setup.png)

- First, detach lidar sensor and shift it front of TurtleBot3 (Red circle represents position of bolts).
- Second, attach OpenMANIPULATOR on the TurtleBot3 (Yellow circle represents position of bolts).

![](/assets/images/platform/turtlebot3/manipulation/assemble_points.png)

![](/assets/images/platform/turtlebot3/manipulation/assemble.png)

## [OpenCR Setup](#opencr-setup)

{% capture notice_01 %}
**NOTE**: To use OpenMANIPULATOR-X, you need to upload a firmware into OpenCR by using either **shell script** or **Arduino IDE**.
1. **[Shell script](#shell-script)** is highly recommended to upload the firmware as it uses a pre-built binary file
2. **[Arduino IDE](#arduino-ide)**, which builds the provided source code and uploads the generated binary file, can be used to modify TurtleBot3's fimrware.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div> 

**WARNING** : Be sure to connect all DYNAMIXEL's with OpenCR before OpenCR Setup. Otherwise, it may cause unexpected errors for Raspberry Pi. 
{: .notice--warning}

<!-- ### [Shell Script](#shell-script)
**[TurtleBot3]**
```bash
$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=om_with_tb3
$ rm -rf ./opencr_update.tar.bz2
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2 && tar -xvf opencr_update.tar.bz2 && cd ./opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr && cd ..
``` -->

After OpenMANIPULATOR is properly mounted on TurtleBot3, you need to update firmware inside the board to control all DYNAMIXEL’s using OpenCR board. Follow the provided instructions. 

1. **[TurtleBot3 SBC]** Upload a firmware into Raspberry Pi (SBC) with the following commands. 
```bash
$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=om_with_tb3
$ rm -rf ./opencr_update.tar.bz2
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2 
$ tar -xvf opencr_update.tar.bz2 
$ cd ./opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr && cd ..
```

2. When the firmware is completely uploaded, you will see a text string at the terminal: **jump_to_fw**

{% capture notice_01 %}
**WARNING**: When the firmware is completely uploaded, OpenCR board will reboot, and the pose of OpenMANIPULATOR-X changes its pose to the initial pose. Thus, to avoid possible pysical damage by the robot, be sure to make the same pose of the robot as the one in the image before uploading the firmware to OpenCR.  
![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_gazebo_1.png)
{% endcapture %}
<div class="notice--warning">{{ notice_01 | markdownify }}</div> 

### [Arduino IDE](#arduino-ide)
Maintenance for Arduino IDE firmware upload is in progress.
{: .notice}

<!-- **[Remote PC]**
- Before you following step, please setup Arduino IDE.

- [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

- OpenCR firmware (or the source) for TurtleBot3 with OpenMANIPULATOR is to control DYNAMIXEL and sensors in the ROS. The firmware is located in OpenCR example which is downloaded by the board manager.

- Go to `File` → `Examples` → `TurtleBot3` → `turtlebot3_with_open_manipulator` → `turtlebot3_with_open_manipulator_core`.

![](/assets/images/platform/turtlebot3/manipulation/upload_core.png)

- Click `Upload` button to upload the firmware to OpenCR.

![](/assets/images/platform/turtlebot3/manipulation/upload_core_1.png)

**NOTE**: If error occurs while uploading firmware, go to `Tools` → `Port` and check if correct port is selected. Press `Reset` button on the OpenCR and try to upload the firmware again.
{: .notice--info}

**TIP**: The DYNAMIXEL ids can be changed in [`open_manipulator_driver.h`][manipulator_id] in turtlebot3_with_open_manipulator folder 
{: .notice--success}

- When firmware upload is completed, `jump_to_fw` text string will be printed on the screen. -->

## [Bringup](#bringup)

**NOTE**: Be sure that OpenCR port is properly assigned on PC. See [turtlebot3_core.launch][turtlebot3_core].
{: .notice--info}

<!-- 
**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success} -->

<!-- 
1. **[Remote PC]** Run roscore to use ROS 1.
```bash
$ roscore
```

2. **[TurtleBot3 SBC]** Export TurtleBot3 model (Waffle PI) to `.bashrc` file with the following command. 
```bash
$ export TURTLEBOT3_MODEL=waffle_pi
```


    
-->


### [Run roscore](#run-roscore)

**[Remote PC]** Run roscore to use ROS 1.
```bash
$ roscore
```

### [Define TurtleBot3 Model](#define-turtlebot3-model)

**[TurtleBot3 SBC]** Export TurtleBot3 model (Waffle PI) to `.bashrc` file using the following command. 
```bash
$ export TURTLEBOT3_MODEL=waffle_pi
```

**NOTE**: TurtleBot3 Model may differ from the hardware configuration of TurtleBot3 such as `burger` or `waffle`. 
{: .notice--info} 

<!-- 
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ROS_NAMESPACE=om_with_tb3 roslaunch turtlebot3_bringup turtlebot3_robot.launch multi_robot_name:=om_with_tb3 set_lidar_frame_id:=om_with_tb3/base_scan
```  
-->

<!-- 3. **[TurtleBot3 SBC]** Run Bringup node with the following command. This node starts rosserial and LDS sensor.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
``` 
-->

### [Run Bringup](#run-bringup)

**[TurtleBot3 SBC]** Run Bringup node for TurtleBot3, and start rosserial and LDS sensor using following command.

```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

<!-- 
```bash
$ ROS_NAMESPACE=om_with_tb3 roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
```
-->

<!-- [Simulate TurtleBot3 with OpenMANIPULATOR Using Gazebo](#simulate-turtlebot3-with-openmanipulator-using-gazebo) -->

## [Simulation](#simulation)

Simulate TurtleBot3 with OpenMANIPULATOR Using Gazebo by following this section.

### [Run Gazebo](#run-gazebo)
**[Remote PC]** Bring TurtleBot3 with OpenMANIPULATOR into Gazebo world using the following command. 
```bash
$ roslaunch turtlebot3_manipulation_gazebo turtlebot3_manipulation_gazebo.launch
```

![](/assets/images/platform/turtlebot3/manipulation/tb3_omx_gazebo.png)

<!-- **[Remote PC]** Bring model into Gazebo.
**[Remote PC]** Launch Launch robot_state_publisher node.
```bash
$ ROS_NAMESPACE=om_with_tb3 roslaunch open_manipulator_with_tb3_tools om_with_tb3_remote.launch
``` -->

### [Run move_group Node](#run-move-group-node)
**[Remote PC]** In order to use Moveit feature, launch **move_group** node. If you press **\[▶]** button in Gazebo to start simulation, use the following command. Later, the following message will be printed: **You can start planning now!**.
```bash
$ roslaunch turtlebot3_manipulation_moveit_config move_group.launch
```

### [Run RViz](#run-rviz)
**[Remote PC]** Use Moveit feature in RViz by reading `moveit.rviz` file where Moveit enviroment data is configured. You can control the mounted manipulator using Interactive Marker, and simulate the motion of goal position, which feature can prevent a pysical crash by simulating the movement in advance.
```bash
$ roslaunch turtlebot3_manipulation_moveit_config moveit_rviz.launch
```

![](/assets/images/platform/turtlebot3/manipulation/tb3_omx_rviz.png)

<!-- 
**[Remote PC]** 
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3_tools slam.launch use_platform:=true
```

**[Remote PC]** Launch teleop node
```bash
$ ROS_NAMESPACE=om_with_tb3 roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

**[Remote PC]** Launch map_saver node
```bash
$ ROS_NAMESPACE=om_with_tb3 rosrun map_server map_saver -f ~/map
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_slam.png) 
-->

### [Run ROBOTIS GUI Controller](#run-robotis-gui-controller)
**[Remote PC]** You can use ROBOTIS GUI, but not RViz, to control robot arm with Gazebo. The GUI supports **Task Space Control** and **Joint Space Control**. Use one of ways according to your preference.
- `Task Space Control`: It refers to a valid gripping position (a red hexahedron between the gripper in the task space) from the end-effector of the manipulator.
- `Joint Space Control`: It refers to each joint angle.

```bash
$ roslaunch turtlebot3_manipulation_gui turtlebot3_manipulation_gui.launch
```

![](/assets/images/platform/turtlebot3/manipulation/tb3_omx_gui_controller.png)

<!-- ## [Navigation](#navigation)

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch open_manipulator_with_tb3_tools navigation.launch use_platform:=true
```

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_navigation.png) -->

## [Operate the Actual OpenMANIPULATOR](#operate-the-actual-openmanipulator)
Follow the given instruction to operate your robot.

### [Run roscore](#run-roscore)
**[Remote PC]** Run roscore to use ROS 1.
```bash
$ roscore
```

### [Run Bringup](#bringup)
1. **[TurtleBot3 SBC]** Run Bringup node for TurtleBot3, and start rosserial and LDS sensor using following command.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

2. **[Remote PC]** Run Bringup node for OpenMANIPULATOR on TurtleBot3
```bash
$ roslaunch turtlebot3_manipulation_bringup turtlebot3_manipulation_bringup.launch
```

### [Run move_group Node](#run-move-group-node)
```bash
$ roslaunch turtlebot3_manipulation_moveit_config move_group.launch
```

### [Run RViz](#run-rviz)
**[Remote PC]** Run Rviz to visualize data and to use the interactive marker. 
```bash
$ roslaunch turtlebot3_manipulation_moveit_config moveit_rviz.launch
```

### [Run ROBOTIS GUI Controller](#run-robotis-gui-controller)
**[Remote PC]** OpenMANIPULATOR can be controlled with using ROBOTIS GUI controller instead of RVIz tool.  
```bash
$ roslaunch turtlebot3_manipulation_gui turtlebot3_manipulation_gui.launch
```

## [SLAM](#slam)
Use SLAM feature to update an unknown map with TurtleBot3 and OpenMANIPULATOR

![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_slam.png);

### [Run roscore](#run-roscore)
**[Remote PC]** Run roscore to use ROS 1.
```bash
$ roscore
```

### [Run Bringup](#run-bringup)
**[TurtleBot3 SBC]** Run Bringup node for TurtleBot3, and start rosserial and LDS sensor using following command.
```bash
roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**NOTE**: As OpenMANIPULATOR on TurtleBot3 is not neccessory for SLAM, **move_group** and **bringup** nodes, which are the parameters to control OpenMANIPULATOR, are not important to use
{: .notice}

### [Run SLAM Node](#run-slam-node)
**[Remote PC]** Run SLAM node for updating an unknown map with TurtleBot3. This node utilizes gmapping package.
```bash
$ roslaunch turtlebot3_manipulation_slam slam.launch
```

### [Run turtlebot3_teleop_key Node](#run-turtlebot3-teleop-key-node)
1. **[Remote PC]** Update the map where TurtleBot3 will navigate using turtlebot3_teleop_key node.
```bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

2. **[Remote PC]** Once the map is completely updated, run the map_saver node to save the updated map.
```bash
$ rosrun map_server map_saver -f ~/map
```

## [Navigation](#navigation)
Send TurtleBot3 with OpenMANIPULATOR to the desired position in the map using Navigation node. 

### [Run roscore](#run-roscore)
**[Remote PC]** Run roscore to use ROS 1.
```bash
$ roscore
```

### [Run Bringup](#run-bringup)
**[TurtleBot3 SBC]** Run Bringup node for TurtleBot3, and start rosserial and LDS sensor using following command.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

### [Run Navigation Node](#run-navigation-node)
**[Remote PC]** Run Navigation node with the following command, which will call Unified Robot Description Format (urdf) and configuration data of RViz to set GUI enviroment, parmeters for Navigation and updated map.  
```bash
$ roslaunch turtlebot3_manipulation_navigation navigation.launch
```

![](/assets/images/platform/turtlebot3/manipulation/tb3_omx_nav.png)

### [How to Control OpenMANIPULATOR with Navigation](#how-to-control-openmanipulator-with-navigation)
You can run this node to control OpenMANIPULATOR on TurtleBot3 when TurtleBot3 is approaching to a goal position when Navigation node is running. 
However, when TurtleBot3 is in motion, the movement of OpenMANIPULATOR will be unstable by external influences, such as center of gravity, or vibration; so that it is recommended for the manipulator to be used when TurtleBot3 is not driving.

#### [Run Bringup node for OpenMANIPULATOR](#run-bringup-for-openmanipulator)
**[Remote PC]** Run **turtlebot3_manipulation_bringup** node just as use of single OpenMANIPULATOR. This node contains **arm_controller** and **gripper_controller**. 
```bash
$ roslaunch turtlebot3_manipulation_bringup turtlebot3_manipulation_bringup.launch
```

#### [Run move_group Node](#run-move-group-node)
**move_group** node supports two interfaces to control OpenMANIPULATOR; **Moveit!** and **ROBOTIS GUI**. Choose either of them according to your preference. In this section, GUI Controller is introduced only. 
```bash
$ roslaunch turtlebot3_manipulation_moveit_config move_group.launch
```

**NOTE**: For more information on **Moveit!**, see [Moveit!](/docs/en/platform/openmanipulator_x/ros_operation/#moveit).
{: .notice--info}

### [Run GUI Controller](#run-gui-controller)
Using this interface, you can control OpenMANIPULATOR on TurtleBot3
**[Remote PC]** 
```bash
$ roslaunch turtlebot3_manipulation_gui turtlebot3_manipulation_gui.launch
```

<!-- ## [MoveIt!](#moveit)

Maintenance for Moveit is in progress.
{: .notice} -->

<!-- 
- In order to run [MoveIt!](https://moveit.ros.org/), open a new terminal window and enter the command below.

  ```bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_tools manipulation.launch use_platform:=true
  ```

  ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_sim_1.jpg)

  ![](/assets/images/platform/turtlebot3/manipulation/open_manipulator_moveit_sim_2.jpg)

- Below rqt plugins shows example of control OpenMANIPULATOR.

  ![](/assets/images/platform/turtlebot3/manipulation/joint_position_service.png)

  ![](/assets/images/platform/turtlebot3/manipulation/kinematic_position_service.png)

- Get robot status by rosservice messages.

```bash
$ rosservice call /arm/moveit/get_joint_position "planning_group: 'arm'" 
joint_position: 
  joint_name: [joint1, joint2, joint3, joint4]
  position: [-0.003067961661145091, -0.42644667625427246, 1.3084856271743774, -0.8452234268188477]
  max_accelerations_scaling_factor: 0.0
  max_velocity_scaling_factor: 0.0
```

```bash
$ rosservice call /arm/moveit/get_kinematics_pose "planning_group: 'arm'
end_effector_name: ''" 
header: 
  seq: 0
  stamp: 
    secs: 1550714737
    nsecs: 317547871
  frame_id: "/base_footprint"
kinematics_pose: 
  pose: 
    position: 
      x: 0.0918695085861
      y: -0.000263644738325
      z: 0.218597669468
    orientation: 
      x: 1.82347658316e-05
      y: 0.023774433021
      z: -0.000766773548775
      w: 0.999717054001
  max_accelerations_scaling_factor: 0.0
  max_velocity_scaling_factor: 0.0
  tolerance: 0.0
```

- In order to control gripper(**range is -0.01~0.01**) of OpenMANIPULATOR, below service command might be help.

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

-->

<!-- 
## [Pick and Place](#pick-and-place)

Maintenance for Pick and Place is in progress.
{: .notice} -->

<!-- 
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
<!--
-->


<!-- 
## [Simulation](#simulation)

Maintenance for Pick and Place is in progress.
{: .notice} -->


<!--
- Load TurtleBot3 with OpenMANIPULATOR on Gazebo simulator and click `Play` button

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
``` 

-->

[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
[manipulator_id]: https://github.com/ROBOTIS-GIT/OpenCR/blob/ef4e71be84dd899b03e359703be93c5000c5954a/arduino/opencr_arduino/opencr/libraries/turtlebot3/examples/turtlebot3_with_open_manipulator/turtlebot3_with_open_manipulator_core/open_manipulator_driver.h#L27
[turtlebot3_core]: https://github.com/ROBOTIS-GIT/turtlebot3/blob/467c76bc4fa2e34162f57107388839d82d3bcc0e/turtlebot3_bringup/launch/turtlebot3_core.launch#L5
[smach]: http://wiki.ros.org/smach
