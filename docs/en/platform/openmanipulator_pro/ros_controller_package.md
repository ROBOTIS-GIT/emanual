---
layout: archive
lang: en
ref: openmanipulator_pro_ros_controller_package.md
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_pro/ros_controller_package/
sidebar:
  title: "OpenMANIPULATOR-PRO"
  nav: "openmanipulator_pro"
product_group: openmanipulator_pro
page_number: 5
---

<div style="counter-reset: h1 4"></div>

# [[ROS] Controller Package](#ros-controller-package)

You can control each joint of OpenMANIPULATOR-PRO and check states of OpenMANIPULATOR-PRO through [messages](/docs/en/platform/openmanipulator_pro/ros_controller_package/#message-list) by utilizing an exclusive controller program.
 

{% capture notice_01 %}
**NOTE** :  
- The test is done on `ROS Kinetic Kame` installed in `Ubuntu 16.04`.
- The test is done on `ROS Melodic Morenia`installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_pro/ros_setup/#install-ros-packages)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Launch Controller](#launch-controller)

Before launching the controller, please check `open_manipulator_pro_controller` launch file in `open_manipulator_pro_controller` package.  

```
<launch>
 <arg name="use_robot_name"         default="open_manipulator_pro"/>

 <arg name="dynamixel_usb_port"     default="/dev/ttyUSB0"/>
 <arg name="dynamixel_baud_rate"    default="1000000"/>

 <arg name="control_period"         default="0.010"/>

 <arg name="use_platform"           default="true"/>

 <arg name="use_moveit"             default="false"/>
 <arg name="planning_group_name"    default="arm"/>
 <arg name="moveit_sample_duration" default="0.050"/>

 <group if="$(arg use_moveit)">
   <include file="$(find open_manipulator_pro_controller)/launch/open_manipulator_pro_moveit.launch">
     <arg name="robot_name"      value="$(arg use_robot_name)"/>
     <arg name="sample_duration" value="$(arg moveit_sample_duration)"/>
   </include>
 </group>

 <node name="$(arg use_robot_name)" pkg="open_manipulator_pro_controller" type="open_manipulator_pro_controller" output="screen" args="$(arg dynamixel_usb_port) $(arg dynamixel_baud_rate)">
     <param name="using_platform"       value="$(arg use_platform)"/>
     <param name="using_moveit"         value="$(arg use_moveit)"/>
     <param name="planning_group_name"  value="$(arg planning_group_name)"/>
     <param name="control_period"       value="$(arg control_period)"/>
     <param name="moveit_sample_duration"  value="$(arg moveit_sample_duration)"/>
 </node>

</launch>
  
```
**Parameters List** : The following parameters set control environments.  
- `use_robot_name`
- `dynamixel_usb_port`
- `dynamixel_baud_rate`
- `control_period`
- `use_platform`
- `use_moveit`
- `planning_group_name`
- `moveit_sample_duration`

`use_robot_name` is a parameter to set manipulator name(namespace of ROS messages).  
`dynamixel_usb_port` is a parameter to set USB port to connect with DYNAMIXEL of OpenMANIPULATOR-PRO. If you use U2D2, it should be set **/dev/ttyUSB@**. If you use OpenCR, it should be set **/dev/ttyACM@** (@ indicates the port number connected to the DYNAMIXEL).  
`dynamixel_baud_rate` is a parameter to set baud rate of DYNAMIXEL. default baud rate of DYNAMIXEL used in OpenMANIPULATOR-PRO is 1000000.  
`control_period` is a parameter to set communication period between DYNAMIXEL and PC (control loop time).  
`use_platform` is a parameter that sets whether to use the actual OpenMANIPULATOR-PRO or OpenMANIPULATOR-PRO simulation. please refer [[ROS] Simulation](/docs/en/platform/openmanipulator_pro/ros_simulation/#ros-simulation) chapter.  
`use_moveit`, `planning_group_name` and `moveit_sample_duration` are parameters to load [move_group](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/move_group_interface/move_group_interface_tutorial.html) package. please refer to [MoveIt!](/docs/en/platform/openmanipulator_pro/ros_operation/#moveit) chapter.

After setting those parameters, launch the OpenMANIPULATOR-PRO controller to start [[ROS] Operation](/docs/en/platform/openmanipulator_pro/ros_operation/#ros-operation).

Please, open a terminal then run roscore along with following command.

``` bash
$ roscore
```

After running roscore, open  another Terminal then wrtie the following commands in Terminal.  

``` bash
$ roslaunch open_manipulator_pro_controller open_manipulator_pro_controller.launch
```

**WARNING**: It is recommended to place OpenMANIPULATOR-PRO at the following pose and start the controller so that each component of OpenMANIPULATOR-PRO does not conflict.  
<img src="/assets/images/platform/openmanipulator_pro/open_manipulator_start_pose.png" width="250">
<!-- ![](/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png) -->
{: .notice--warning}


Follwing message will be shown in a terminal after the process is done successfully.  

```
SUMMARY
========

PARAMETERS
 * /open_manipulator_pro/control_period: 0.01
 * /open_manipulator_pro/moveit_sample_duration: 0.05
 * /open_manipulator_pro/planning_group_name: arm
 * /open_manipulator_pro/using_moveit: False
 * /open_manipulator_pro/using_platform: True
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator_pro (open_manipulator_pro_controller/open_manipulator_pro_controller)

ROS_MASTER_URI=http://192.168.3.149:11311

process[open_manipulator_pro-1]: started with pid [12510]
Joint Dynamixel ID : 1, Model Name : PRO-PLUS-H54P-200-S500-R
Joint Dynamixel ID : 2, Model Name : PRO-PLUS-H54P-200-S500-R
Joint Dynamixel ID : 3, Model Name : PRO-PLUS-H54P-100-S500-R
Joint Dynamixel ID : 4, Model Name : PRO-PLUS-H54P-100-S500-R
Joint Dynamixel ID : 5, Model Name : PRO-PLUS-H42P-020-S300-R
Joint Dynamixel ID : 6, Model Name : PRO-PLUS-H42P-020-S300-R
[INFO] Succeeded to init /open_manipulator_pro
```

{% capture notice_01 %}
**TIP**:  
- If you can't load DYNAMIXEL, please check your DYNAMIXEL settings by using the following command from the DYNAMIXEL-Workbench packages.   
`rosrun dynamixel_workbench_controllers find_dynamixel /dev/ttyUSB0`  
if DYNAMIXEL aren't recoginized, please check firmware with ROBOTIS software ([R+ Manager 2.0](/docs/en/software/rplus2/manager/) or [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-update))
- If you would like to change Dynamixel ID, please check [`open_manipulator_pro.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/be2859a0506b4e941a19435c0a07562b41768a27/open_manipulator_pro_libs/src/OpenManipulator.cpp#L40) in the open_manipulator_pro_lib folder. The default ID is **11, 12, 13, 14 ,15 and 16** for joints.
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

**NOTE**: OpenMANIPULATOR-PRO controller is compatible with [Protocol 2.0](/docs/en/dxl/protocol2/). [Protocol 1.0](/docs/en/dxl/protocol1/) doesn't support SyncRead instructions that access to multiple DYNAMIXEL simultaneously. Protocol 2.0 supports `MX 2.0`, `X`, `Pro`, `Pro +` series, but it does not support `AX`, `RX` and `EX`.  
{: .notice--info}

## [Check Setting](#check-setting)

### [Manipulator Description](#manipulator-description)

{% capture notice_01 %}
**NOTE**:  
- The test is done on `ROS Kinetic Kame` installed in `Ubuntu 16.04`.
- The test is done on `ROS Melodic Morenia`installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_pro/ros_setup/#install-ros-packages)
- Make sure to run the [OpenMANIPULATOR-PRO controller](/docs/en/platform/openmanipulator_pro/ros_controller_package/#launch-controller) instructions before running the instructions below.  
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Publish a topic message to check the OpenMANIPULATOR-PRO setting.

``` bash
$ rostopic pub /open_manipulator_pro/option std_msgs/String "print_open_manipulator_prp_setting"
```
<**Manipulator Description**> will be printed on Terminal.  
Launch the open_manipulator_controller. It is shown that present states of the OpenMANIPULATOR-PRO.  
This parameter is descripted on OpenMANIPULATOR.cpp in open_manipulator_libs package.  
`~/catkin_ws/src/open_manipulator_pro/open_manipulator_pro_libs/src/open_manipulator_pro.cpp`

```
----------<Manipulator Description>----------
<Degree of Freedom>
6.000
<Number of Components>
7.000

<World Configuration>
[Name]
-World Name : world
-Child Name : joint1
[Static Pose]
-Position : 
(0.000, 0.000, 0.000)
-Orientation : 
(1.000, 0.000, 0.000
0.000, 1.000, 0.000
0.000, 0.000, 1.000)
[Dynamic Pose]
-Linear Velocity : 
(0.000, 0.000, 0.000)
-Linear acceleration : 
(0.000, 0.000, 0.000)
-Angular Velocity : 
(0.000, 0.000, 0.000)
-Angular acceleration : 
(0.000, 0.000, 0.000)

<gripperConfiguration> 
[Component Type]
Tool
[Name]
-Parent Name : joint6
[Actuator]
-Actuator Name : 
-ID :  -1
-Joint Axis : 
(0.000, 0.000, 0.000)
-Coefficient :  -0.015
-Position Limit : 
  Maximum : 0.010, Minimum : -0.010
[Actuator Value]
-Position :  0.000
-Velocity :  0.000
-Acceleration :  0.000
-Effort :  0.000
[Constant]
-Relative Position from parent component : 
(0.000, 0.000, 0.000)
-Relative Orientation from parent component : 
(1.000, 0.000, 0.000
0.000, 1.000, 0.000
0.000, 0.000, 1.000)
-Mass :  0.064
-Inertia Tensor : 
(0.000, 0.000, -0.000
0.000, 0.000, -0.000
-0.000, -0.000, 0.000)
-Center of Mass : 
(0.036, 0.025, -0.000)
[Variable]
-Position : 
(0.223, -0.000, -0.001)
-Orientation : 
(0.006, -0.004, 1.000
-0.001, 1.000, 0.004
-1.000, -0.001, 0.006)
-Linear Velocity : 
(0.000, 0.000, 0.000)
-Linear acceleration : 
(0.000, 0.000, 0.000)
-Angular Velocity : 
(0.000, 0.000, 0.000)
-Angular acceleration : 
(0.000, 0.000, 0.000)

<
joint1Configuration> [Component Type]
Active Joint
[Name]
-Parent Name : world
-Child Name 1 : joint2
[Actuator]
-Actuator Name : joint_dxl
-ID :  1
-Joint Axis : 
(0.000, 0.000, 1.000)
-Coefficient :  1.000
-Position Limit : 
  Maximum : 3.142, Minimum : -3.142
[Actuator Value]
-Position :  -0.001
-Velocity :  0.000
-Acceleration :  0.000
-Effort :  0.000
[Constant]
-Relative Position from parent component : 
(0.000, 0.000, 0.126)
-Relative Orientation from parent component : 
(1.000, 0.000, 0.000
0.000, 1.000, 0.000
0.000, 0.000, 1.000)
-Mass :  0.098
-Inertia Tensor : 
(0.000, -0.000, -0.000
-0.000, 0.000, 0.000
-0.000, 0.000, 0.000)
-Center of Mass : 
(-0.000, 0.001, 0.047)
[Variable]
-Position : 
(0.000, 0.000, 0.126)
-Orientation : 
(1.000, 0.001, 0.000
-0.001, 1.000, 0.000
0.000, 0.000, 1.000)
-Linear Velocity : 
(0.000, 0.000, 0.000)
-Linear acceleration : 
(0.000, 0.000, 0.000)
-Angular Velocity : 
(0.000, 0.000, 0.000)
-Angular acceleration : 
(0.000, 0.000, 0.000)

<
joint2Configuration> [Component Type]
Active Joint
[Name]
-Parent Name : joint1
-Child Name 1 : joint3
[Actuator]
-Actuator Name : joint_dxl
-ID :  2
-Joint Axis : 
(0.000, 1.000, 0.000)
-Coefficient :  1.000
-Position Limit : 
  Maximum : 3.142, Minimum : -3.142
[Actuator Value]
-Position :  0.517
-Velocity :  0.000
-Acceleration :  0.000
-Effort :  0.000
[Constant]
-Relative Position from parent component : 
(0.000, 0.000, 0.033)
-Relative Orientation from parent component : 
(1.000, 0.000, 0.000
0.000, 1.000, 0.000
0.000, 0.000, 1.000)
-Mass :  0.139
-Inertia Tensor : 
(0.000, 0.000, -0.000
0.000, 0.000, -0.000
-0.000, -0.000, 0.000)
-Center of Mass : 
(0.010, 0.000, 0.102)
[Variable]
-Position : 
(0.000, 0.000, 0.159)
-Orientation : 
(0.869, 0.001, 0.494
-0.001, 1.000, -0.000
-0.494, 0.000, 0.869)
-Linear Velocity : 
(0.000, 0.000, 0.000)
-Linear acceleration : 
(0.000, 0.000, 0.000)
-Angular Velocity : 
(0.000, 0.000, 0.000)
-Angular acceleration : 
(0.000, 0.000, 0.000)

<
joint3Configuration> [Component Type]
Active Joint
[Name]
-Parent Name : joint2
-Child Name 1 : joint4
[Actuator]
-Actuator Name : joint_dxl
-ID :  3
-Joint Axis : 
(0.000, 1.000, 0.000)
-Coefficient :  1.000
-Position Limit : 
  Maximum : 3.142, Minimum : -3.142
[Actuator Value]
-Position :  0.915
-Velocity :  0.000
-Acceleration :  0.000
-Effort :  0.000
[Constant]
-Relative Position from parent component : 
(0.030, 0.000, 0.264)
-Relative Orientation from parent component : 
(1.000, 0.000, 0.000
0.000, 1.000, 0.000
0.000, 0.000, 1.000)
-Mass :  0.133
-Inertia Tensor : 
(0.000, -0.000, -0.000
-0.000, 0.000, 0.000
-0.000, 0.000, 0.000)
-Center of Mass : 
(0.091, 0.000, 0.000)
[Variable]
-Position : 
(0.157, -0.000, 0.374)
-Orientation : 
(0.138, 0.001, 0.990
-0.000, 1.000, -0.001
-0.990, 0.000, 0.138)
-Linear Velocity : 
(0.000, 0.000, 0.000)
-Linear acceleration : 
(0.000, 0.000, 0.000)
-Angular Velocity : 
(0.000, 0.000, 0.000)
-Angular acceleration : 
(0.000, 0.000, 0.000)

<
joint4Configuration> [Component Type]
Active Joint
[Name]
-Parent Name : joint3
-Child Name 1 : joint5
[Actuator]
-Actuator Name : joint_dxl
-ID :  4
-Joint Axis : 
(1.000, 0.000, 0.000)
-Coefficient :  1.000
-Position Limit : 
  Maximum : 3.142, Minimum : -3.142
[Actuator Value]
-Position :  -0.007
-Velocity :  0.000
-Acceleration :  0.000
-Effort :  0.000
[Constant]
-Relative Position from parent component : 
(0.195, 0.000, 0.030)
-Relative Orientation from parent component : 
(1.000, 0.000, 0.000
0.000, 1.000, 0.000
0.000, 0.000, 1.000)
-Mass :  0.143
-Inertia Tensor : 
(0.000, 0.000, -0.000
0.000, 0.000, 0.000
-0.000, 0.000, 0.000)
-Center of Mass : 
(0.044, 0.000, 0.009)
[Variable]
-Position : 
(0.213, -0.000, 0.185)
-Orientation : 
(0.138, -0.006, 0.990
-0.000, 1.000, 0.006
-0.990, -0.001, 0.138)
-Linear Velocity : 
(0.000, 0.000, 0.000)
-Linear acceleration : 
(0.000, 0.000, 0.000)
-Angular Velocity : 
(0.000, 0.000, 0.000)
-Angular acceleration : 
(0.000, 0.000, 0.000)

<
joint5Configuration> [Component Type]
Active Joint
[Name]
-Parent Name : joint4
-Child Name 1 : joint6
[Actuator]
-Actuator Name : joint_dxl
-ID :  5
-Joint Axis : 
(0.000, 1.000, 0.000)
-Coefficient :  1.000
-Position Limit : 
  Maximum : 3.142, Minimum : -3.142
[Actuator Value]
-Position :  0.132
-Velocity :  0.000
-Acceleration :  0.000
-Effort :  0.000
[Constant]
-Relative Position from parent component : 
(0.063, 0.000, 0.000)
-Relative Orientation from parent component : 
(1.000, 0.000, 0.000
0.000, 1.000, 0.000
0.000, 0.000, 1.000)
-Mass :  0.143
-Inertia Tensor : 
(0.000, 0.000, -0.000
0.000, 0.000, 0.000
-0.000, 0.000, 0.000)
-Center of Mass : 
(0.044, 0.000, 0.009)
[Variable]
-Position : 
(0.222, -0.000, 0.122)
-Orientation : 
(0.006, -0.006, 1.000
-0.001, 1.000, 0.006
-1.000, -0.001, 0.006)
-Linear Velocity : 
(0.000, 0.000, 0.000)
-Linear acceleration : 
(0.000, 0.000, 0.000)
-Angular Velocity : 
(0.000, 0.000, 0.000)
-Angular acceleration : 
(0.000, 0.000, 0.000)

<
joint6Configuration> [Component Type]
Active Joint
[Name]
-Parent Name : joint5
-Child Name 1 : gripper
[Actuator]
-Actuator Name : joint_dxl
-ID :  6
-Joint Axis : 
(1.000, 0.000, 0.000)
-Coefficient :  1.000
-Position Limit : 
  Maximum : 3.142, Minimum : -3.142
[Actuator Value]
-Position :  0.002
-Velocity :  0.000
-Acceleration :  0.000
-Effort :  -2.690
[Constant]
-Relative Position from parent component : 
(0.123, 0.000, 0.000)
-Relative Orientation from parent component : 
(1.000, 0.000, 0.000
0.000, 1.000, 0.000
0.000, 0.000, 1.000)
-Mass :  0.143
-Inertia Tensor : 
(0.000, 0.000, -0.000
0.000, 0.000, 0.000
-0.000, 0.000, 0.000)
-Center of Mass : 
(0.044, 0.000, 0.009)
[Variable]
-Position : 
(0.223, -0.000, -0.001)
-Orientation : 
(0.006, -0.004, 1.000
-0.001, 1.000, 0.004
-1.000, -0.001, 0.006)
-Linear Velocity : 
(0.000, 0.000, 0.000)
-Linear acceleration : 
(0.000, 0.000, 0.000)
-Angular Velocity : 
(0.000, 0.000, 0.000)
-Angular acceleration : 
(0.000, 0.000, 0.000)
---------------------------------------------
```



### [RViz](#rviz)

{% capture notice_01 %}
**NOTE**:  
- The test is done on `ROS Kinetic Kame` installed in `Ubuntu 16.04`.
- The test is done on `ROS Melodic Morenia`installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_pro/ros_setup/#install-ros-packages)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Load OpenMANIPULATOR-PRO on RViz.

``` bash
$ roslaunch open_manipulator_pro_description open_manipulator_pro_rviz.launch
```

{% capture notice_01 %}
**NOTE**:
- If you launched the [OpenMANIPULATOR-PRO controller](/docs/en/platform/openmanipulator_pro/ros_controller_package/#launch-controller) before launching the open_manipulator_pro_controller file, the robot model on RViz would be synchronized with the actual robot.
- If users would like to check only model of OpenMANIPULATOR-PRO without OpenMANIPULATOR-PRO, the user can launch the RViz without the OpenMANIPULATOR-PRO controller.  
The user can change each joint by GUI, if the user launch only RViz by executing the following command :
`$ roslaunch open_manipulator_pro_description open_manipulator_pro_rviz.launch use_gui:=true`


{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/openmanipulator_pro/rviz.png)


## [Message List](#message-list) 


{% capture notice_01 %}
**NOTE**:  
- The test is done on `ROS Kinetic Kame` installed in `Ubuntu 16.04`.
- The test is done on `ROS Melodic Morenia`installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_pro/ros_setup/#install-ros-packages) 
- Make sure to run the [OpenMANIPULATOR-PRO controller](/docs/en/platform/openmanipulator_pro/ros_controller_package/#launch-controller) instructions before running the instructions below.  
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

OpenMANIPULATOR-PRO Controller provides **topic** and **service** messages to control manipulator and check the states of manipulator.  


### [Topic](#topic)

#### [Topic Monitor](#topic-monitor)

In order to check the topics of OpenMANIPULATOR-PRO controller, you can use [rqt][rqt] provided by ROS. Rqt is a Qt-based framework for GUI development for ROS. Rqt allows users to easily see topic status by displaying all topics on a topic list. You can see topic name, type, bandwidth, Hz and value on rqt.

Run rqt.
``` bash
$ rqt
```

![](/assets/images/platform/openmanipulator_pro/rqt1.png)  


**TIP**: If rqt is not displayed, select the `plugin` -> `Topic Monitor` -> `OpenMANIPULATOR-PRO`.
{: .notice--success}

Topics without a check mark will not be monitored. To monitor topics, click the checkboxes next. 

![](/assets/images/platform/openmanipulator_pro/rqt2.png)  


If you would like to see more details about topic message, click the `▶` button next to each checkbox.  

![](/assets/images/platform/openmanipulator_pro/rqt3.png)   

[rqt]: http://wiki.ros.org/rqt

#### [Published Topic List](#published-topic-list)

**Published Topic List** :
A list of topics that the open_manipulator_pro_controller publishes.
- `/open_manipulator/states`
- `/open_manipulator/joint_states`
- `/open_manipulator/gripper/kinematics_pose`
- `/open_manipulator/*joint_name*_position/command`
- `/open_manipulator/rviz/moveit/update_start_state`

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}

`/open_manipulator/joint_states`([sensor_msgs/JointState]{: .popup}) is a message indicating the states of joints of OpenMANIPULATOR-PRO. **"name"** indicates joint component names.  **"effort"** shows currents of the joint DYNAMIXEL. **"position"** and **"velocity"** indicates angles and angular velocities of joints.

 <!-- <img src="/assets/images/platform/openmanipulator_x/rqt_joint_states.png" width="1000"> -->

`/open_manipulator/gripper/kinematics_pose`([open_manipulator_msgs/KinematicsPose]{: .popup}) is a message indicating pose (position and orientation) in [task space]{: .popup}. **"position"** indicates the x, y and z values of the center of the end-effector (tool). **"Orientation"** indicates the direction of the end-effector (tool) as quaternion.

 <!-- <img src="/assets/images/platform/openmanipulator_x/rqt_kinematic_pose.png" width="1000"> -->

`/open_manipulator/states`([open_manipulator_msgs/OpenManipulatorState]{: .popup}) is a message indicating the status of OpenMANIPULATOR-PRO. **"open_manipulator_actuator_state"** indicates whether actuators (DYNAMIXEL) are enabled ("ACTUATOR_ENABLE") or disabled ("ACTUATOR_DISABLE"). **"open_manipulator_moving_state"** indicates whether OpenMANIPULATOR-PRO is moving along the trajectory ("IS_MOVING") or stopped ("STOPPED").

 <!-- <img src="/assets/images/platform/openmanipulator_x/rqt_states.png" width="1000"> -->

`/open_manipulator/*joint_name*_position/command`([std_msgs/Float64]{: .popup}) are the messages to publish goal position of each joint to gazebo simulation node. `*joint_name*` shows the name of each joint. The messages will only be published if you run the controller package with the `use_platform` parameter set to `false`.

`/rviz/moveit/update_start_state`([std_msgs/Empty]{: .popup}) is a message to update start state of moveit! trajectory. This message will only be published if you run the controller package with the `use_moveit` parameter set to `true`.

#### [Subscribed Topic List](#published-topic-list)

**Subscribed Topic List**:
A list of topics that the open_manipulator_pro_controller subscribes.
- `/open_manipulator/option`
- `/open_manipulator/move_group/display_planned_path`
- `/open_manipulator/move_group/goal`
- `/open_manipulator/execute_trajectory/goal`

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}

`/open_manipulator/option`([std_msgs/String]{: .popup}) is used to set OpenMANIPULATOR-PRO options. **"print_open_manipulator_setting"** : is to request the open_manipulator_pro_controller to display "Manipulator Description".

<!-- <img src="/assets/images/platform/openmanipulator_pro/rqt_option.png" width="1000">  --->

`/open_manipulator/option`([moveit_msgs/DisplayTrajectory]{: .popup}) is used to subscribe a planned joint trajectory published from moveit!

`/move_group/goal`([moveit_msgs/MoveGroupActionGoal]{: .popup}) is used to subscribe a planning option data published from moveit!

`/move_group/execute_trajectory/goal`([moveit_msgs/ExecuteTrajectoryActionGoal]{: .popup}) is used to subscribe states of trajectory execution published from moveit!

In addition, you can monitor topics through rqt whenever you have a topic added in your controller.


### [Service](#service)


#### [Service Server List](#service-server-list)

**NOTE**: These services are messages to operate OpenMANIPULATOR-PRO or to change the status of the DYNAMIXEL of OpenMANIPULATOR-PRO.
{: .notice--info}


**Service Server List** :
A list of service servers that open_manipulator_pro_controller has.

- `/open_manipulator/goal_joint_space_path` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the angle of the target joint and the total time of the trajectory.

- `/open_manipulator/goal_joint_space_path_to_kinematics_pose` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the kinematics pose of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_joint_space_path_to_kinematics_position` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_joint_space_path_to_kinematics_orientation` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_position_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_orientation_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_joint_space_path_from_present` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory from present joint angle in the [joint space]{: .popup}. The user inputs the angle of the target joint to be changed and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_from_present` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the task space. The user inputs the kinematics pose to be changed of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_from_present_position_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_from_present_orientation_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_tool_control` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to move the tool of OpenMANIPULATOR_PRO.

- `/open_manipulator/set_actuator_state` ([open_manipulator_msgs/SetActuatorState]{: .popup})  
The user can use this service to control the state of actucators.   
If the user set true at set_actuator_state valuable, the actuator will be enabled.  
If the user set false at set_actuator_state valuable, the actuator will be disabled.

- `/open_manipulator/goal_drawing_trajectory` ([open_manipulator_msgs/SetDrawingTrajectory]{: .popup})  
The user can use this service to create a drawing trajectory. The user can create the circle, the rhombus, the heart, and the straight line trajectory.

- `/moveit/get_joint_position` ([open_manipulator_msgs/GetJointPosition]{: .popup})  
This service is used when using moveit! The user can use this service to receives a joint position which is calculated by move_group.

- `/moveit/get_kinematics_pose` ([open_manipulator_msgs/GetKinematicsPose]{: .popup})  
This service is used when using moveit! The user can use this service to receives a kinematics pose which is calculated by move_group.

- `/moveit/set_joint_position` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
This service is used when using moveit! The user can use this service to create a trajectory in the [joint space]{: .popup} by move_group. The user inputs the angle of the target joint and the total time of the trajectory.

- `/moveit/set_kinematics_pose` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
This service is used when using moveit! The user can use this service to create a trajectory in the [task space]{: .popup} by move_group. The user inputs the kinematics pose of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

[open_manipulator_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/
[open_manipulator_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/
[open_manipulator_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_msgs_SetActuatorState/
[open_manipulator_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_msgs_SetDrawingTrajectory/
[std_msgs/Float64]: /docs/en/popup/std_msgs_Float64_msg/
[std_msgs/Empty]: /docs/en/popup/std_msgs_Empty_msg/
[moveit_msgs/DisplayTrajectory]: /docs/en/popup/moveit_msgs_DisplayTrajectory_msg/
[moveit_msgs/MoveGroupActionGoal]: /docs/en/popup/moveit_msgs_MoveGroup_action/
[moveit_msgs/ExecuteTrajectoryActionGoal]: /docs/en/popup/moveit_msgs_ExecuteTrajectory_action/


[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[open_manipulator_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_KinematicsPose/
[open_manipulator_msgs/OpenManipulatorState]: /docs/en/popup/open_manipulator_msgs_OpenManipulatorState/
[std_msgs/String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/
