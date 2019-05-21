---
layout: archive
lang: en
ref: openmanipulator_pro_ros_controller_package.md
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_pro/ros_controller_package/
sidebar:
  title: OpenMANIPULATOR-PRO
  nav: "openmanipulator_pro"
---

<div style="counter-reset: h1 4"></div>

# [[ROS] Controller Package](#ros-controller-package)

The OpenMANIPULATOR-PRO controller provides basic manipulation of OpenMANIPULATOR-PRO. You can control DYNAMIXEL of OpenMANIPULATOR-PRO and check states of OpenMANIPULATOR-PRO through [messages](/docs/en/platform/openmanipulator_pro/ros_controller_package/#message-list) of the controller.  
 

**NOTE**: This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

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
`use_platform` is a parameter that sets whether to use the actual OpenMANIPULATOR-PRO or OpenMANIPULATOR-PRO simulation. please refer [ROS Simulation](/docs/en/platform/openmanipulator_pro/ros_simulation/#ros-simulation) chapter.  
`use_moveit`, `planning_group_name` and `moveit_sample_duration` are parameters to load [move_group](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/move_group_interface/move_group_interface_tutorial.html) package. please refer to [MoveIt!](/docs/en/platform/openmanipulator_pro/ros_operation/#moveit) chapter.

After setting those parameters, launch the OpenMANIPULATOR-PRO controller to start [[ROS] Operation](/docs/en/platform/openmanipulator_pro/ros_operation/#ros-operation).

Please, open the Terminal then run roscore along with following command.

``` bash
$ roscore
```

After running roscore, open  another Terminal then wrtie the following commands in Terminal.  

``` bash
$ roslaunch open_manipulator_pro_controller open_manipulator_pro_controller.launch
```
Follwing message will be shown in the Terminal after the process done successfully.  

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
    open_manipulator_pro_manager (open_manipulator_pro_manager/open_manipulator_pro_manager)

ROS_MASTER_URI=http://localhost:11311

process[open_manipulator_pro_manager-1]: started with pid [19408]
[ INFO] [1552279834.24ro20783]: manager->init
/dev/ttyUSB0 added. (baudrate: 1000000)
(/dev/ttyUSB0) [ID:  1] H54P-200-S500-R added.
(/dev/ttyUSB0) [ID:  2] H54P-200-S500-R added.
(/dev/ttyUSB0) [ID:  3] H54P-100-S500-R added.
(/dev/ttyUSB0) [ID:  4] H54P-100-S500-R added.
(/dev/ttyUSB0) [ID:  5] H42P-020-S300-R added.
(/dev/ttyUSB0) [ID:  6] H42P-020-S300-R added.
[ INFO] [1552279834.361381084]: Load offsets...
```

{% capture notice_01 %}
**TIP**:  
- If you can't load DYNAMIXEL, please check your DYNAMIXEL settings by using the following command from the Dynamixel-Workbench packages.   
`rosrun dynamixel_workbench_controllers find_dynamixel /dev/ttyUSB0`  
if DYNAMIXEL aren't recoginized, please check firmware with ROBOTIS software ([R+ Manager 2.0](/docs/en/software/rplus2/manager/) or [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-update))
- If you would like to change Dynamixel ID, please check [`open_manipulator_pro.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/be2859a0506b4e941a19435c0a07562b41768a27/open_manipulator_pro_libs/src/OpenManipulator.cpp#L40) in the open_manipulator_lib folder. The default ID is The default ID is **11, 12, 13, 14 ,15 and 16** for joints.
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

**NOTE**: OpenMANIPULATOR-PRO controller is compatible with [Protocol 2.0](/docs/en/dxl/protocol2/). [Protocol 1.0](/docs/en/dxl/protocol1/) doesn't support SyncRead instructions that access to multiple DYNAMIXEL simultaneously. Protocol 2.0 supports `MX 2.0`, `X`, `Pro`, `Pro +` series, but it does not support `AX`, `RX` and `EX`.  
{: .notice--info}

## [Check Setting](#check-setting)

### [Manipulator Description](#manipulator-description)

{% capture notice_01 %}
**NOTE**:  
- The below instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.  
- This instruction is supposed to be run on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.  
- Make sure to run the [OpenMANIPULATOR-PRO controller](/docs/en/platform/openmanipulator_pro/ros_controller_package/#launch-controller) instructions before running the instructions below.  
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Publish a topic message to check the OpenMANIPULATOR-PRO setting.

``` bash
$ rostopic pub /open_manipulator_pro/option std_msgs/String "print_open_manipulator_setting"
```
<**Manipulator Description**> will be printed on Terminal.  
Launch the open_manipulator_controller. It is shown that present states of the OpenMANIPULATOR-PRO.  
This parameter is descripted on OpenMANIPULATOR.cpp in open_manipulator_libs package.  
`~/catkin_ws/src/open_manipulator_pro/open_manipulator_pro_libs/src/open_manipulator_pro.cpp`

```
    ----------<Manipulator Description>----------
    <Degree of freedom>
    4.000
    <Size of Components>
    5.000

    <Configuration of world>
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

    <Configuration of gripper>
    [Component Type]
      Tool
    [Name]
    -Parent Name : joint4
    [Actuator]
    -Actuator Name : tool_dxl
    -ID :  15
    -Joint Axis :
    (0.000, 0.000, 0.000)
    -Coefficient :  -0.015
    -Limit :
        Maximum : 0.010, Minimum : -0.010
    [Actuator Value]
    -Value :  0.008
    -Velocity :  0.000
    -Acceleration :  0.000
    -Effort :  0.000
    [Constant]
    -Relative Position from parent component :
    (0.130, 0.000, 0.000)
    -Relative Orientation from parent component :
    (1.000, 0.000, 0.000
    0.000, 1.000, 0.000
    0.000, 0.000, 1.000)
    -Mass :  0.000
    -Inertia Tensor :
    (1.000, 0.000, 0.000
    0.000, 1.000, 0.000
    0.000, 0.000, 1.000)
    -Center of Mass :
    (0.000, 0.000, 0.000)
    [Variable]
    -Position :
    (0.138, -0.005, 0.015)
    -Orientation :
    (-0.006, 0.043, 0.999
    0.000, 0.999, -0.043
    -1.000, 0.000, -0.006)
    -Linear Velocity :
    (0.000, 0.000, 0.000)
    -Linear acceleration :
    (0.000, 0.000, 0.000)
    -Angular Velocity :
    (0.000, 0.000, 0.000)
    -Angular acceleration :
    (0.000, 0.000, 0.000)

    <Configuration of joint1>
    [Component Type]
      Active Joint
    [Name]
    -Parent Name : world
    -Child Name 1 : joint2
    [Actuator]
    -Actuator Name : joint_dxl
    -ID :  11
    -Joint Axis :
    (0.000, 0.000, 1.000)
    -Coefficient :  1.000
    -Limit :
        Maximum : 3.142, Minimum : -3.142
    [Actuator Value]
    -Value :  -0.043
    -Velocity :  0.000
    -Acceleration :  0.000
    -Effort :  0.000
    [Constant]
    -Relative Position from parent component :
    (0.012, 0.000, 0.017)
    -Relative Orientation from parent component :
    (1.000, 0.000, 0.000
    0.000, 1.000, 0.000
    0.000, 0.000, 1.000)
    -Mass :  0.000
    -Inertia Tensor :
    (1.000, 0.000, 0.000
    0.000, 1.000, 0.000
    0.000, 0.000, 1.000)
    -Center of Mass :
    (0.000, 0.000, 0.000)
    [Variable]
    -Position :
    (0.012, 0.000, 0.017)
    -Orientation :
    (0.999, 0.043, 0.000
    -0.043, 0.999, 0.000
    0.000, 0.000, 1.000)
    -Linear Velocity :
    (0.000, 0.000, 0.000)
    -Linear acceleration :
    (0.000, 0.000, 0.000)
    -Angular Velocity :
    (0.000, 0.000, 0.000)
    -Angular acceleration :
    (0.000, 0.000, 0.000)

    <Configuration of joint2>
    [Component Type]
      Active Joint
    [Name]
    -Parent Name : joint1
    -Child Name 1 : joint3
    [Actuator]
    -Actuator Name : joint_dxl
    -ID :  12
    -Joint Axis :
    (0.000, 1.000, 0.000)
    -Coefficient :  1.000
    -Limit :
        Maximum : 1.571, Minimum : -2.050
    [Actuator Value]
    -Value :  -0.052
    -Velocity :  0.000
    -Acceleration :  0.000
    -Effort :  0.000
    [Constant]
    -Relative Position from parent component :
    (0.000, 0.000, 0.058)
    -Relative Orientation from parent component :
    (1.000, 0.000, 0.000
    0.000, 1.000, 0.000
    0.000, 0.000, 1.000)
    -Mass :  0.000
    -Inertia Tensor :
    (1.000, 0.000, 0.000
    0.000, 1.000, 0.000
    0.000, 0.000, 1.000)
    -Center of Mass :
    (0.000, 0.000, 0.000)
    [Variable]
    -Position :
    (0.012, 0.000, 0.075)
    -Orientation :
    (0.998, 0.043, -0.052
    -0.043, 0.999, 0.002
    0.052, 0.000, 0.999)
    -Linear Velocity :
    (0.000, 0.000, 0.000)
    -Linear acceleration :
    (0.000, 0.000, 0.000)
    -Angular Velocity :
    (0.000, 0.000, 0.000)
    -Angular acceleration :
    (0.000, 0.000, 0.000)

    <Configuration of joint3>
    [Component Type]
      Active Joint
    [Name]
    -Parent Name : joint2
    -Child Name 1 : joint4
    [Actuator]
    -Actuator Name : joint_dxl
    -ID :  13
    -Joint Axis :
    (0.000, 1.000, 0.000)
    -Coefficient :  1.000
    -Limit :
        Maximum : 1.530, Minimum : -1.571
    [Actuator Value]
    -Value :  0.546
    -Velocity :  0.000
    -Acceleration :  0.000
    -Effort :  0.000
    [Constant]
    -Relative Position from parent component :
    (0.024, 0.000, 0.128)
    -Relative Orientation from parent component :
    (1.000, 0.000, 0.000
    0.000, 1.000, 0.000
    0.000, 0.000, 1.000)
    -Mass :  0.000
    -Inertia Tensor :
    (1.000, 0.000, 0.000
    0.000, 1.000, 0.000
    0.000, 0.000, 1.000)
    -Center of Mass :
    (0.000, 0.000, 0.000)
    [Variable]
    -Position :
    (0.029, -0.001, 0.204)
    -Orientation :
    (0.880, 0.043, 0.474
    -0.038, 0.999, -0.020
    -0.474, 0.000, 0.880)
    -Linear Velocity :
    (0.000, 0.000, 0.000)
    -Linear acceleration :
    (0.000, 0.000, 0.000)
    -Angular Velocity :
    (0.000, 0.000, 0.000)
    -Angular acceleration :
    (0.000, 0.000, 0.000)

    <Configuration of joint4>
    [Component Type]
      Active Joint
    [Name]
    -Parent Name : joint3
    -Child Name 1 : gripper
    [Actuator]
    -Actuator Name : joint_dxl
    -ID :  14
    -Joint Axis :
    (0.000, 1.000, 0.000)
    -Coefficient :  1.000
    -Limit :
        Maximum : 2.000, Minimum : -1.800
    [Actuator Value]
    -Value :  1.083
    -Velocity :  0.000
    -Acceleration :  0.000
    -Effort :  -2.690
    [Constant]
    -Relative Position from parent component :
    (0.124, 0.000, 0.000)
    -Relative Orientation from parent component :
    (1.000, 0.000, 0.000
    0.000, 1.000, 0.000
    0.000, 0.000, 1.000)
    -Mass :  0.000
    -Inertia Tensor :
    (1.000, 0.000, 0.000
    0.000, 1.000, 0.000
    0.000, 0.000, 1.000)
    -Center of Mass :
    (0.000, 0.000, 0.000)
    [Variable]
    -Position :
    (0.138, -0.005, 0.145)
    -Orientation :
    (-0.006, 0.043, 0.999
    0.000, 0.999, -0.043
    -1.000, 0.000, -0.006)
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
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be run on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Load OpenMANIPULATOR-PRO on RViz.

``` bash
$ roslaunch open_manipulator_pro_description open_manipulator_pro_rviz.launch
```

{% capture notice_01 %}
**NOTE**:
- If you launched the [OpenMANIPULATOR-PRO controller](/docs/en/platform/openmanipulator_pro/ros_controller_package/#launch-controller) before launching the open_manipulator_pro_controller file, the robot model on RViz would be synchronized with the actual robot.
- If the user would like to check only model of OpenMANIPULATOR-PRO without OpenMANIPULATOR-PRO, the user can launch the RViz without the OpenMANIPULATOR-PRO controller.  
The user can change each joint by GUI, if the user launch only RViz by executing the following command :
`$ roslaunch open_manipulator_description open_manipulator_pro_rviz.launch use_gui:=true`

{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/openmanipulator_pro/rviz.png)


## [Message List](#message-list) 


{% capture notice_01 %}
**NOTE**:  
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.  
- This instruction is supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.  
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

comming soon

**TIP**: If rqt is not displayed, select the `plugin` -> `Topic Monitor` -> ` OpenMANIPULATOR-PRO`.
{: .notice--success}

Clicked topics without a check mark clicked will not be monitored. To monitor topics, click the checkboxes next. 

comming soon  


If you would like to see more details about topic message, click the `▶` button next to each checkbox.  

comming soon  

[rqt]: http://wiki.ros.org/rqt

#### [Published Topic List](#published-topic-list)

**Published Topic List** :
A list of topics that the open_manipulator_pro_controller publishes.
- `/open_manipulator_pro/states`
- `/open_manipulator_pro/joint_states`
- `/open_manipulator_pro/gripper/kinematics_pose`
- `/open_manipulator_pro/*joint_name*_position/command`
- `/open_manipulator_pro/rviz/moveit/update_start_state`

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}

`/open_manipulator_pro/joint_states`([sensor_msgs/JointState]{: .popup}) is a message indicating the states of joints of OpenMANIPULATOR-PRO. **"name"** indicates joint component names.  **"effort"** shows currents of the joint DYNAMIXEL. **"position"** and **"velocity"** indicates angles and angular velocities of joints.

 <!-- <img src="/assets/images/platform/openmanipulator_x/rqt_joint_states.png" width="1000"> -->

`/open_manipulator_pro/gripper/kinematics_pose`([open_manipulator_pro_msgs/KinematicsPose]{: .popup}) is a message indicating pose (position and orientation) in [task space]{: .popup}. **"position"** indicates the x, y and z values of the center of the end-effector (tool). **"Orientation"** indicates the direction of the end-effector (tool) as quaternion.

 <!-- <img src="/assets/images/platform/openmanipulator_x/rqt_kinematic_pose.png" width="1000"> -->

`/open_manipulator_pro/states`([open_manipulator_pro_msgs/OpenManipulatorState]{: .popup}) is a message indicating the status of OpenMANIPULATOR-PRO. **"open_manipulator_pro_actuator_state"** indicates whether actuators (DYNAMIXEL) are enabled ("ACTUATOR_ENABLE") or disabled ("ACTUATOR_DISABLE"). **"open_manipulator_pro_moving_state"** indicates whether OpenMANIPULATOR-PRO is moving along the trajectory ("IS_MOVING") or stopped ("STOPPED").

 <!-- <img src="/assets/images/platform/openmanipulator_x/rqt_states.png" width="1000"> -->

`/open_manipulator_pro/*joint_name*_position/command`([std_msgs/Float64]{: .popup}) are the messages to publish goal position of each joint to gazebo simulation node. `*joint_name*` shows the name of each joint. The messages will only be published if you run the controller package with the `use_platform` parameter set to `false`.

`/rviz/moveit/update_start_state`([std_msgs/Empty]{: .popup}) is a message to update start state of moveit! trajectory. This message will only be published if you run the controller package with the `use_moveit` parameter set to `true`.

#### [Subscribed Topic List](#published-topic-list)

**Subscribed Topic List**:
A list of topics that the open_manipulator_pro_controller subscribes.
- `/open_manipulator_pro/option`
- `/open_manipulator_pro/move_group/display_planned_path`
- `/open_manipulator_pro/move_group/goal`
- `/open_manipulator_pro/execute_trajectory/goal`

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}

`/open_manipulator_pro/option`([std_msgs/String]{: .popup}) is used to set OpenMANIPULATOR-PRO options. **"print_open_manipulator_setting"** : is to request the open_manipulator_pro_controller to display "Manipulator Description".

<img src="/assets/images/platform/openmanipulator_pro/rqt_option.png" width="1000"> 

`/open_manipulator_pro/option`([moveit_msgs/DisplayTrajectory]{: .popup}) is used to subscribe a planned joint trajectory published from moveit!

`/move_group/goal`([moveit_msgs/MoveGroupActionGoal]{: .popup}) is used to subscribe a planning option data published from moveit!

`/move_group/execute_trajectory/goal`([moveit_msgs/ExecuteTrajectoryActionGoal]{: .popup}) is used to subscribe states of trajectory execution published from moveit!

In addition, you can monitor topics through rqt whenever you have a topic added in your controller.


### [Service](#service)


#### [Service Server List](#service-server-list)

**NOTE**: These services are messages to operate OpenMANIPULATOR-PRO or to change the status of the DYNAMIXEL of OpenMANIPULATOR-PRO.
{: .notice--info}


**Service Server List** :
A list of service servers that open_manipulator_pro_controller has.

- `/open_manipulator_pro/goal_joint_space_path` ([open_manipulator_pro_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the angle of the target joint and the total time of the trajectory.

- `/open_manipulator_pro/goal_joint_space_path_to_kinematics_pose` ([open_manipulator_pro_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the kinematics pose of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator_pro/goal_joint_space_path_to_kinematics_position` ([open_manipulator_pro_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator_pro/goal_joint_space_path_to_kinematics_orientation` ([open_manipulator_pro_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator_pro/goal_task_space_path` ([open_manipulator_pro_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator_pro/goal_task_space_path_position_only` ([open_manipulator_pro_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator_pro/goal_task_space_path_orientation_only` ([open_manipulator_pro_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator_pro/goal_joint_space_path_from_present` ([open_manipulator_pro_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory from present joint angle in the [joint space]{: .popup}. The user inputs the angle of the target joint to be changed and the total time of the trajectory.

- `/open_manipulator_pro/goal_task_space_path_from_present` ([open_manipulator_pro_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the task space. The user inputs the kinematics pose to be changed of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator_pro/goal_task_space_path_from_present_position_only` ([open_manipulator_pro_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator_pro/goal_task_space_path_from_present_orientation_only` ([open_manipulator_pro_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator_pro/goal_tool_control` ([open_manipulator_pro_msgs/SetJointPosition]{: .popup})  
The user can use this service to move the tool of OpenMANIPULATOR_PRO.

- `/open_manipulator_pro/set_actuator_state` ([open_manipulator_pro_msgs/SetActuatorState]{: .popup})  
The user can use this service to control the state of actucators.   
If the user set true at set_actuator_state valuable, the actuator will be enabled.  
If the user set false at set_actuator_state valuable, the actuator will be disabled.

- `/open_manipulator_pro/goal_drawing_trajectory` ([open_manipulator_pro_msgs/SetDrawingTrajectory]{: .popup})  
The user can use this service to create a drawing trajectory. The user can create the circle, the rhombus, the heart, and the straight line trajectory.

- `/moveit/get_joint_position` ([open_manipulator_pro_msgs/GetJointPosition]{: .popup})  
This service is used when using moveit! The user can use this service to receives a joint position which is calculated by move_group.

- `/moveit/get_kinematics_pose` ([open_manipulator_pro_msgs/GetKinematicsPose]{: .popup})  
This service is used when using moveit! The user can use this service to receives a kinematics pose which is calculated by move_group.

- `/moveit/set_joint_position` ([open_manipulator_pro_msgs/SetJointPosition]{: .popup})  
This service is used when using moveit! The user can use this service to create a trajectory in the [joint space]{: .popup} by move_group. The user inputs the angle of the target joint and the total time of the trajectory.

- `/moveit/set_kinematics_pose` ([open_manipulator_pro_msgs/SetKinematicsPose]{: .popup})  
This service is used when using moveit! The user can use this service to create a trajectory in the [task space]{: .popup} by move_group. The user inputs the kinematics pose of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

[open_manipulator_pro_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_pro_msgs_GetJointPosition/
[open_manipulator_pro_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_pro_msgs_GetKinematicsPose/
[open_manipulator_pro_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_pro_msgs_SetJointPosition/
[open_manipulator_pro_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_pro_msgs_SetKinematicsPose/
[open_manipulator_pro_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_pro_msgs_SetActuatorState/
[open_manipulator_pro_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_pro_msgs_SetDrawingTrajectory/
[std_msgs/Float64]: /docs/en/popup/std_msgs_Float64_msg/
[std_msgs/Empty]: /docs/en/popup/std_msgs_Empty_msg/
[moveit_msgs/DisplayTrajectory]: /docs/en/popup/moveit_msgs_DisplayTrajectory_msg/
[moveit_msgs/MoveGroupActionGoal]: /docs/en/popup/moveit_msgs_MoveGroup_action/
[moveit_msgs/ExecuteTrajectoryActionGoal]: /docs/en/popup/moveit_msgs_ExecuteTrajectory_action/


[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[open_manipulator_pro_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_pro_msgs_KinematicsPose/
[open_manipulator_pro_msgs/OpenManipulatorState]: /docs/en/popup/open_manipulator_pro_msgs_OpenManipulatorState/
[std_msgs/String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/open_manipulator_pro_coordinates/
[joint space]: /docs/en/popup/open_manipulator_pro_coordinates/
