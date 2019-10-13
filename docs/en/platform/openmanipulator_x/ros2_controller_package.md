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
page_number: 11
---

<div style="counter-reset: h1 10"></div>

# [[ROS 2] Controller Package](#ros-controller-package)

OpenMANIPULATOR-X controller provides basic manipulation of OpenMANIPULATOR-X. You can control DYNAMIXEL's of OpenMANIPULATOR-X and check states of OpenMANIPULATOR-X through [messages](/docs/en/platform/openmanipulator_x/ros2_controller_package/#message-list) of the controller.

{% capture notice_01 %}
**NOTE**:
- The test is done on `ROS 2 Dashing Diademata` installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions. - [Install ROS 2 Packages](/docs/en/platform/openmanipulator_x/ros2_setup/#install-ros-2-packages)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Launch Controller](#launch-controller)

Please, open a terminal then run the following command in the terminal.

``` bash
$ ros2 run open_manipulator_x_controller open_manipulator_x_controller 
```

{% capture warning_01 %}

**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. If joints are set inappropriately, OpenMANIPULATOR-X might not start operating.
The picture of OpenMANIPULATOR-X below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque isn't enabled.    
        
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
- If you would like to change Dynamixel ID, please check [`open_manipulator_x.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/be2859a0506b4e941a19435c0a07562b41768a27/open_manipulator_libs/src/OpenManipulator.cpp#L40) in the open_manipulator_lib folder. The default ID is **11, 12, 13, 14** for joints and **15** for the gripper
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

{% capture notice_02 %}
**NOTE**: OpenMANIPULATOR-X controller is compatible with [Protocol 2.0](/docs/en/dxl/protocol2/) which supports `MX 2.0`, `X` and `Pro` series. [Protocol 1.0](/docs/en/dxl/protocol1/) does not support SyncRead instructions to access to multiple DYNAMIXEL's simultaneously.  
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify}}</div>

## [Check Setting](#check-setting)

### [Manipulator Description](#manipulator-description)

{% capture notice_01 %}
**NOTE**:
- The test is done on `ROS 2 Dashing Diademata` installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions. - [Install ROS 2 Packages](/docs/en/platform/openmanipulator_x/ros2_setup/#install-ros-2-packages)
- Make sure to run the [OpenMANIPULATOR-X controller](/docs/en/platform/openmanipulator_x/ros2_controller_package/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Publish a topic message to check the OpenMANIPULATOR-X setting.

``` bash
$ ros2 topic pub /open_manipulator_x/option std_msgs/msg/String "data: print_open_manipulator_x_setting"
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
$ ros2 launch open_manipulator_x_description open_manipulator_x_rviz.launch.py 
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

`Message List` for `ROS 2 Dashing Diademata` will be released soon!
{: .notice}

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
