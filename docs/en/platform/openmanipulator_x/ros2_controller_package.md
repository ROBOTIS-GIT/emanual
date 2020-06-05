---
layout: archive
lang: en
ref: ros2_openmanipulator_x_ros_controller_package
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros2_controller_package/
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 13
---

<div style="counter-reset: h1 12"></div>

# [[ROS 2] Controller Package](#ros-2-controller-package)

OpenMANIPULATOR-X controller provides basic manipulation of OpenMANIPULATOR-X. You can control DYNAMIXEL's of OpenMANIPULATOR-X and check states of OpenMANIPULATOR-X through [messages](/docs/en/platform/openmanipulator_x/ros2_controller_package/#message-list) of the controller.

{% capture notice_01 %}
**NOTE**:
- The test is done on `ROS 2 Dashing Diademata` installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions. - [Install ROS 2 Packages](/docs/en/platform/openmanipulator_x/ros2_setup/#install-ros-2-packages)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Launch Controller](#launch-controller)

Open a terminal then run the following command in the terminal.

``` bash
$ ros2 launch open_manipulator_x_controller open_manipulator_x_controller.launch.py  
```

{% capture warning_01 %}

**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. If joints are set inappropriately, OpenMANIPULATOR-X might not start operating.
The picture of OpenMANIPULATOR-X below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque is not enabled.    
        
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

Follwing message will be shown in the Terminal after the process done successfully.  

```
port_name and baud_rate are set to /dev/ttyUSB0, 1000000 
Joint Dynamixel ID : 11, Model Name : XM430-W350
Joint Dynamixel ID : 12, Model Name : XM430-W350
Joint Dynamixel ID : 13, Model Name : XM430-W350
Joint Dynamixel ID : 14, Model Name : XM430-W350
Gripper Dynamixel ID : 15, Model Name :XM430-W350
[INFO] Succeeded to Initialise OpenManipulator-X Controller
```

{% capture notice_01 %}
**TIP**:
- If you can't load DYNAMIXEL, please check firmware to use ROBOTIS software ([R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/) or [DYNAMIXEL Wizard 2.0](/docs/en/software/dynamixel/dynamixel_wizard2/#firmware-update))
- If you would like to change DYNAMIXEL ID, please check [`open_manipulator_x.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/be2859a0506b4e941a19435c0a07562b41768a27/open_manipulator_libs/src/OpenManipulator.cpp#L40) in the open_manipulator_lib folder. The default ID is **11, 12, 13, 14** for joints and **15** for the gripper
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

{% capture notice_02 %}
**NOTE**: OpenMANIPULATOR-X controller is compatible with [Protocol 2.0](/docs/en/dxl/protocol2/) which supports `MX 2.0`, `X` and `Pro` series. [Protocol 1.0](/docs/en/dxl/protocol1/) does not support SyncRead instructions to access to multiple DYNAMIXEL's's simultaneously.  
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify}}</div>

## [Check Setting](#check-setting)

### [Manipulator Description](#manipulator-description)

{% capture notice_01 %}
**NOTE**:
- The test is done on `ROS 2 Dashing Diademata` installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions. - [Install ROS 2 Packages](/docs/en/platform/openmanipulator_x/ros2_setup/#install-ros-2-packages)
- Make sure to run the [OpenMANIPULATOR-X controller](/docs/en/platform/openmanipulator_x/ros2_controller_package/#launch-controller) instructions before use of the instruction
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Publish a topic message to check the OpenMANIPULATOR-X setting.

``` bash
$ ros2 topic pub /option std_msgs/msg/String "data: print_open_manipulator_x_setting"
```

<**Manipulator Description**> will be printed on a terminal. 
Launch the open_manipulator_controller. It is shown that present states of the OpenMANIPULATOR-X.  
This parameter is descripted on open_manipulator_x.cpp in open_manipulator_x_libs package.  
`~/robotis_ws/src/open_manipulator_x/open_manipulator_x_libs/src/open_manipulator_x.cpp`

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
- The test is done on `ROS 2 Dashing Diademata` installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions. - [Install ROS 2 Packages](/docs/en/platform/openmanipulator_x/ros2_setup/#install-ros-2-packages)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Load OpenMANIPULATOR-X on RViz.

``` bash
$ ros2 launch open_manipulator_x_description open_manipulator_x_rviz2.launch.py 
```

{% capture notice_01 %}
**NOTE**:
- If you launched the [OpenMANIPULATOR-X controller](/docs/en/platform/openmanipulator_x/ros2_controller_package/#launch-controller) before launching the open_manipulator_controller file, the robot model on RViz would be synchronized with the actual robot.
- If you would like to check only model of OpenMANIPULATOR-X without control the actual OpenMANIPULATOR, the user can launch the RViz without the OpenMANIPULATOR-X controller.
The user can change each joint by GUI, if the user launch only RViz by executing the following command :
`$ ros2 launch open_manipulator_x_description open_manipulator_x_rviz.launch.py use_gui:=true`

{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/openmanipulator_x/ros2_OpenManipulator_rviz.png)

## [Message List](#message-list)

{% capture notice_01 %}
**NOTE**:
- The test is done on `ROS Kinetic Kame` installed in `Ubuntu 16.04`.
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_x/ros_setup/#install-ros-packages)
- Make sure to run the [OpenMANIPULATOR-X controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

OpenMANIPULATOR-X Controller provides **topic** and **service** messages to control manipulator and check the states of manipulator.

### [Topic](#topic)

#### [Topic Monitor](#topic-monitor)

In order to check the topics of OpenMANIPULATOR-X controller, you can use [rqt][rqt] provided by ROS. Rqt is a Qt-based framework for GUI development for ROS. Rqt allows users to easily see topic status by displaying all topics on a topic list. You can see topic name, type, bandwidth, Hz and value on rqt.

Run rqt.
``` bash
$ rqt
```
 <img src="/assets/images/platform/openmanipulator_x/rqt_om.png" width="1000">

**TIP**: If rqt is not displayed, select the `plugin` -> `Topic Monitor` -> `OpenMANIPULATOR`.
{: .notice--success}

Topics without a check mark will not be monitored. To monitor topics, click the checkbox next.  

 <img src="/assets/images/platform/openmanipulator_x/rqt_1.png" width="1000">

If you would like to see more details about topic message, click the `▶` button next to each checkbox.  

 <img src="/assets/images/platform/openmanipulator_x/rqt_2.png" width="1000">

[rqt]: http://wiki.ros.org/rqt

#### [Published Topic List](#published-topic-list)

**Published Topic List** :
A list of topics that the open_manipulator_controller publishes.
- `/open_manipulator/states`
- `/open_manipulator/joint_states`
- `/open_manipulator/gripper/kinematics_pose`
- `/open_manipulator/*joint_name*_position/command`

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}

`/open_manipulator/joint_states`([sensor_msgs/JointState]{: .popup}) is a message indicating the states of joints of OpenMANIPULATOR-X. **"name"** indicates joint component names.  **"effort"** shows currents of the joint DYNAMIXEL. **"position"** and **"velocity"** indicates angles and angular velocities of joints.

 <!-- <img src="/assets/images/platform/openmanipulator_x/rqt_joint_states.png" width="1000"> -->

`/open_manipulator/gripper/kinematics_pose`([open_manipulator_msgs/KinematicsPose]{: .popup}) is a message indicating pose (position and orientation) in [task space]{: .popup}. **"position"** indicates the x, y and z values of the center of the end-effector (tool). **"Orientation"** indicates the direction of the end-effector (tool) as quaternion.

 <!-- <img src="/assets/images/platform/openmanipulator_x/rqt_kinematic_pose.png" width="1000"> -->

`/open_manipulator/states`([open_manipulator_msgs/OpenManipulatorState]{: .popup}) is a message indicating the status of OpenMANIPULATOR. **"open_manipulator_actuator_state"** indicates whether actuators (DYNAMIXEL) are enabled ("ACTUATOR_ENABLE") or disabled ("ACTUATOR_DISABLE"). **"open_manipulator_moving_state"** indicates whether OpenMANIPULATOR-X is moving along the trajectory ("IS_MOVING") or stopped ("STOPPED").

 <!-- <img src="/assets/images/platform/openmanipulator_x/rqt_states.png" width="1000"> -->

`/open_manipulator/*joint_name*_position/command`([std_msgs/Float64]{: .popup}) are the messages to publish goal position of each joint to gazebo simulation node. `*joint_name*` shows the name of each joint. The messages will only be published if you run the controller package with the `use_platform` parameter set to `false`.

#### [Subscribed Topic List](#published-topic-list)

**Subscribed Topic List**:
A list of topics that the open_manipulator_controller subscribes.
- `/open_manipulator/option`
- `/open_manipulator/execute_trajectory/goal`

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}

`/open_manipulator/option`([std_msgs/String]{: .popup}) is used to set OpenMANIPULATOR-X options. **"print_open_manipulator_setting"** : is to request the open_manipulator_controller to display "Manipulator Description".

 <!-- <img src="/assets/images/platform/openmanipulator_x/rqt_option.png" width="1000"> -->


### [Service](#service)


#### [Service Server List](#service-server-list)

**NOTE**: These services are messages to operate OpenMANIPULATOR-X or to change the status of the DYNAMIXEL of OpenMANIPULATOR.
{: .notice--info}


**Service Server List** :
A list of service servers that open_manipulator_controller has.

- `/open_manipulator/goal_joint_space_path` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the angle of the target joint and the total time of the trajectory.

- `/open_manipulator/goal_joint_space_path_to_kinematics_pose` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the kinematics pose of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_joint_space_path_to_kinematics_position` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_joint_space_path_to_kinematics_orientation` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_position_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_orientation_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_joint_space_path_from_present` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory from present joint angle in the [joint space]{: .popup}. The user inputs the angle of the target joint to be changed and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_from_present` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the task space. The user inputs the kinematics pose to be changed of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_from_present_position_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_from_present_orientation_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_tool_control` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to move the tool of OpenMANIPULATOR.

- `/open_manipulator/set_actuator_state` ([open_manipulator_msgs/SetActuatorState]{: .popup})  
The user can use this service to control the state of actucators.   
If the user set true at set_actuator_state valuable, the actuator will be enabled.  
If the user set false at set_actuator_state valuable, the actuator will be disabled.

- `/open_manipulator/goal_drawing_trajectory` ([open_manipulator_msgs/SetDrawingTrajectory]{: .popup})  
The user can use this service to create a drawing trajectory. The user can create the circle, the rhombus, the heart, and the straight line trajectory.






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
