---
layout: archive
lang: en
ref: openmanipulator
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/
sidebar:
  title: OpenManipulator
  nav: "openmanipulator"
---

# [Overview](#overview)

![](/assets/images/platform/openmanipulator/OpenManipulator.png)

![](/assets/images/platform/openmanipulator/OpenManipulator_Introduction.png)

ROS-enabled OpenManipulator is a full open robot platform consisting of **OpenSoftware**​, **OpenHardware** and **OpenCR(Embedded board)​**.

## [OpenSoftware](#opensoftware)
OpenManipulator are based on ROS ​and OpenSource. ROS official hardware platform ,TurtleBot series has been supporting ‘TurtleBot Arm’. The OpenManipulator has full hardware compatibility with TurtleBot3​, and allows users to control it more easily by linking with the MoveIT! package. Even if you do not have a real robot, you can control the robot in the Gazebo simulator​.

## [OpenHardware](#openhardware)
The OpenManipulator is oriented towards Open Hardware​. Most of the components except for some frames are uploaded as [STL files](http://www.robotis.com/service/download.php?no=690) that can be 3d printing. This allows users to modify the length of the link and the design of the robot to suit the intended use. The open manipulator also uses the **Dynamixel X ​series** used in TurtleBot 3. Dynamixel has a modular form and adopts daisy chain method. This allows users to easily change and add joints for some torque and degree of freedom they need. Taking advantage of these advantages, we are planning a total of seven different types (For example, Chain, SCARA, Link, Planar, Delta, Stewart and Linear) of OpenManipulator.

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_OnShape.jpg)

## [OpenCR (Embedded board)](#opencr-embedded-board)
The OpenManipulator can also be controlled via [OpenCR] (Open-source Control module for ROS), the control board of TurtleBot3. OpenCR's computing power and real-time control are used to support forward, inverse kinematics, and profile control examples. In addition, OpenCR can interoperate with many functions provided by ROS through message communication with ROS, which will evolve into ROS 2.0 in the future.

## [Dynamixel Examples](#dynamixel-examples)

OpenManipulator is composed by [Dynamixel X series](http://emanual.robotis.com/docs/en/dxl/x/xm430-w350/) and [3D printing parts](http://www.robotis.com/service/download.php?no=767). Dynamixel has a modular form and adopts daisy chain method. This allows users to easily change and add joints for some torque and degree of freedom they need. Moreover, growing 3D printing technology makes anyone can make anything they want with low cost and rapid time. We suggest some examples of links and safety parts. Taking advantage of these advantages, we are planning a total of seven different types of OpenManipulator.

## [Introduction Video](#introduction-video)

<iframe src="https://player.vimeo.com/video/236147296" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
<p><a href="https://vimeo.com/236147296">ROSCon 2017 Vancouver Day 1: Introducing OpenManipulator; the full open robot platform</a> from <a href="https://vimeo.com/osrfoundation">OSRF</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

<iframe width="560" height="315" src="https://www.youtube.com/embed/B2pnXtooKOg" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube.com/embed/P82pZsqpBg0" frameborder="0" allowfullscreen></iframe>

# [Specification](#specification)

## [Hardware Specification](#hardware-specification)

| Items               | Unit    | RM-X52-TNM                              |
|---------------------|---------|-----------------------------------------|
| **Actuator**        |         | Dynamixel XM430-W350-T                  |
| **Input Voltage**   | V       | 12                                      |
| **DOF**             | -       | 5 (4 DOF + 1 DOF Gripper)               |
| **Payload**         | g       | 500                                     |
| **Speed(Joint)**    | RPM     | 46                                      |
| **Weight**          | kg (lb) | 0.70  (1.54)                            |
| **Reach**           | mm (in) | 380   (14.9)                            |
| **Gripper Stroke**  | mm (in) | 20~75 (0.79~2.95)                       |
| **Communication**   | -       | TTL (Level Multidrop BUS)               |
| **Software**        | -       | ROS, Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -       | PC, OpenCR                              |

## [Dimension](#dimension)

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_spec_side.png)

<!-- ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_spec_gripper.jpg) -->

# [Hardware Setup](#hardware-setup)

## [Part Lists](#part-lists)

|                   | Part Name              |  Quantity  |
|-------------------|------------------------|:----------:|
| **Chassis Parts** | LONG LINK FRAME        |     1      |
| .                 | SHORT LINK FRAME       |     1      |
| .                 | RAIL BRACKET(LEFT)     |     1      |
| .                 | RAIL BRACKET(RIGHT)    |     1      |
| .                 | PALM GRIPPER           |     2      |
| .                 | LINK ROD               |     2      |
| .                 | FLANGE BUSH            |     4      |
| .                 | CRANK ARM              |     1      |
| .                 | RAIL BLOCK             |     2      |
| .                 | FR12_S101_K            |     1      |
| .                 | FR12_S102_K            |     2      |
| .                 | FR12_H101_K            |     2      |
| .                 | FR12_H104_K            |     1      |
| **Actuators**     | Dynamixel XM430-W350-T |     5      |
| **Cables**        | CABLE_3P_100MM         |     1      |
| .                 | CABLE_3P_180MM         |     3      |
| .                 | CABLE_3P_240MM         |     1      |
| **Tools**         | SCREW_DRIER_DEFAULT    |     1      |
| .                 | Wrench_Hex_1_5X90      |     1      |
| .                 | Wrench_Hex_2_0X100     |     1      |
| .                 | Wrench_Hex_2_5X110     |     1      |
| **Miscellaneous** | DC12_A01_SPACER_RING   |     24     |
| .                 | WB_M2_5X12_NYLOK       |     8      |
| .                 | NUT_M2_5(0.45P)        |     16     |
| .                 | NUT_M3                 |     4      |
| .                 | WB_M2X03               |     42     |
| .                 | WB_M2X04               |     4      |
| .                 | WB_M2_5X06             |     8      |
| .                 | WB_M2_5X08             |     16     |
| .                 | FHS_M2_5X14            |     12     |
| .                 | WB_M3X10               |     4      |
| .                 | WB_M2_5X04             |     8      |
| .                 | HN12_I101              |     3      |
| .                 | IGUS_JFM_1113_05       |     3      |
| .                 | DC12_CAP_IDLE          |     3      |
| .                 | GRIPPER_PAD            |     2      |


- Optional parts

|            | Part Name  |  Quantity  |
|------------|------------|:----------:|
| **Powers** | SMPS 12V5A |     1      |
| .          | A/C Cord   |     1      |
| **Boards** | OpenCR     |     1      |
| .          | U2D2       |     1      |
| **Plate**  | .          |     1      |
| .          | .          |     1      |


<!-- - [Parts of OpenManipulator](https://docs.google.com/a/robotis.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit?usp=sharing) -->

<!-- [DIY Manual](https://drive.google.com/open?id=1c5U0v2dQhYiulqiWI0VQMameG82WCc-4rl6J6zlQejA) -->

## [3D Printed Parts](#3d-printed-parts)

We offer 3D printed parts to safety. User can modify cad files and 3D Printed it to assemble OpenManipulator.

- CAD Files ([Onshape](http://www.robotis.com/service/download.php?no=690), [Thingiverse](https://www.thingiverse.com/thing:3069574))

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_OnShape.jpg)

## [Assembly Manual](#assembly-manual)

OpenManipulator is delivered as unassembled parts in the boxes. Follow the instructions to assemble it.

- `Download PDF` [Assembly manual for OpenManipulator](http://www.robotis.com/service/download.php?no=1255)

Below video might be help you.

<iframe width="560" height="315" src="https://www.youtube.com/embed/eJTIeDepmNo" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

# [PC Setup](#pc-setup)

**NOTE**: This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}
**NOTE**: If you want to control OpenManipulator on OpenCR(Embedded board) instead of ROS, please set it up as described in [How to Control on OpenCR](/docs/en/platform/openmanipulator/#how-to-control-on-opencr).
{: .notice--info}

## [Install Ubuntu on PC](#install-ubuntu-on-pc)

Download and install the `Ubuntu 16.04` on the `PC (your desktop or laptop PC)` from the following link.

- [Download link](https://www.ubuntu.com/download/alternative-downloads)

If you need more help for installing Ubuntu, check out the step-by-step guide from the link below.

- [Install ubuntu desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

## [Install ROS on PC](#install-ros-on-pc)

![](/assets/images/platform/turtlebot3/logo_ros.png)

The following script will allow you to simplify the ROS installation procedure. Run the following command in a terminal window. The terminal application can be found with the Ubuntu search icon on the top left corner of the screen, or you can use shortcut key for terminal is `Ctrl`+`Alt`+`T`. After install ROS, please reboot PC.

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_kinetic.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh)
{: .notice--info}

If you prefer manual installation, please following the link below.

- [Manual installation of ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)

## [Install ROS Packages](#install-ros-packages)
Install dependent packages for the OpenManipulator. Run the following command in a terminal window.

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`T`.
{: .notice--info}

```
$ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-dynamixel-sdk ros-kinetic-industrial-core
```

```
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/dynamixel_workbench.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel_workbench_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_simulations.git
$ cd ~/catkin_ws && catkin_make
```

If catkin_make command is completed without any errors, preparation for OpenManipulator is done.

## [Usb Settings](#usb-settings)

Run roscore.

``` bash
$ roscore
```

The following commands allow to use USB port

``` bash
$ rosrun open_manipulator_controller create_udev_rules
```
{% capture notice_01 %}
**NOTE**: 
- Please run roscore before rosrun, because rosrun can't operate without roscore. The rosrun and roscore should be run in each other terminal.
- This run file make usb latency timer **1 ms**. If you want to check this setting, Run the following command in a terminal window.  
`cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer`
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

# [Bringup](#bringup)

OpenManipulator 

**NOTE**: This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

## [Run roscore](#run-roscore)

Run roscore.

```
$ roscore
```

## [OpenManipulator Controller](#openmanipulator-controller)

Launch OpenManipulator controller to start [Basic Manipulation](/docs/en/platform/openmanipulator/#basic-manipulation).

```
$ roslaunch open_manipulator_controller open_manipulator_controller.launch
```

If OpenManipulator controller launched successfully, the terminal will represent below messages.

```
SUMMARY
========

PARAMETERS
 * /open_manipulator_controller/baud_rate: 1000000
 * /open_manipulator_controller/usb_port: /dev/ttyUSB0
 * /open_manipulator_controller/using_platform: True
 * /robot_name: open_manipulator
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator_controller (open_manipulator_controller/open_manipulator_controller)

auto-starting new master
process[master]: started with pid [614]
ROS_MASTER_URI=http://localhost:11311

setting /run_id to 389b63dc-f6ba-11e8-acbb-ac9e17829ad5
process[rosout-1]: started with pid [627]
started core service [/rosout]
process[open_manipulator_controller-2]: started with pid [634]
Joint Dynamixel ID : 11, Model Name : XM430-W350
Joint Dynamixel ID : 12, Model Name : XM430-W350
Joint Dynamixel ID : 13, Model Name : XM430-W350
Joint Dynamixel ID : 14, Model Name : XM430-W350
Gripper Dynamixel ID : 15, Model Name :XM430-W350
[INFO] Successed to OpenManipulator initialization
```

## [Check Setting](#check-setting)

### [Manipulator Description](#manipulator-description)

publish a topic message to check the OpenManipulator setting.

```
robotis@spc:~$ rostopic pub /open_manipulator/option std_msgs/String "print_open_manipulator_setting"
```

**NOTE**: <**Manipulator Description**> will be printed on the terminal launch the open_manipulator_controller. It is shown that present state of the OpenManipulator. This parameter is descripted on OpenManipulator.cpp in open_manipulator_libs pkg (~/catkin_ws/src/open_manipulator/open_manipulator_libs/src/OpenManipulator.cpp)
{: .notice--info}

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
 -Value :  0.227
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
(0.974, -0.225, 0.000
 0.225, 0.974, 0.000
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
 -Value :  -0.985
 -Velocity :  0.000
 -Acceleration :  0.000
 -Effort :  -29.590
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
(0.539, -0.225, -0.812
 0.124, 0.974, -0.188
 0.833, 0.000, 0.553)
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
 -Value :  0.635
 -Velocity :  0.000
 -Acceleration :  0.000
 -Effort :  -131.810
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
(-0.079, -0.021, 0.166)
 -Orientation : 
(0.915, -0.225, -0.334
 0.211, 0.974, -0.077
 0.343, 0.000, 0.939)
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
 -Child Name 1 : tool
 [Actuator]
 -Actuator Name : joint_dxl
 -ID :  14
 -Joint Axis : 
(0.000, 1.000, 0.000)
 -Coefficient :  1.000
 -Limit : 
    Maximum : 2.000, Minimum : -1.800
 [Actuator Value]
 -Value :  0.457
 -Velocity :  0.000
 -Acceleration :  0.000
 -Effort :  -40.350
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
(0.035, 0.005, 0.208)
 -Orientation : 
(0.969, -0.225, 0.104
 0.224, 0.974, 0.024
 -0.107, 0.000, 0.994)
 -Linear Velocity : 
(0.000, 0.000, 0.000)
 -Linear acceleration : 
(0.000, 0.000, 0.000)
 -Angular Velocity : 
(0.000, 0.000, 0.000)
 -Angular acceleration : 
(0.000, 0.000, 0.000)

<Configuration of tool>
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
 -Value :  -0.000
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
(0.160, 0.034, 0.194)
 -Orientation : 
(0.969, -0.225, 0.104
 0.224, 0.974, 0.024
 -0.107, 0.000, 0.994)
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

Load an OpenManipulator on RViz.

```
$ roslaunch open_manipulator_description open_manipulator_rviz.launch
```

![](/assets/images/platform/openmanipulator/OpenManipulator_rviz.png)

# [Basic Manipulation](#basic-manipulation)

## [Message List](#message-list)

### [Topic](#topic)

#### [Topic Monitor](#topic-monitor)

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC. Please run the instructions below on your **PC**.
- Make sure to run the [Bringup a OpenManipulator controller](/docs/en/platform/openmanipulator/#bringup-a-openmanipulator-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

In order to check the topics of OpenManipulator Controller, we will use [rqt][rqt] provided by ROS. The rqt is a Qt-based framework for GUI development for ROS. The rqt is a tool that allows users to easily see the topic status by displaying all the topics in the topic list. There are topic names, types, bandwidth, Hz, value in GUI.

**[PC]** Run the rqt.
``` bash
$ rqt
```
![](/assets/images/platform/openmanipulator/rqt_om.png)

**TIP**: If rqt is not displayed, select the `plugin` -> `Topics` -> `Topic Monitor`.
{: .notice--info}

When rqt is first run, the topic values are not monitored. To monitor the topic, click the checkbox next to each topic.

![](/assets/images/platform/openmanipulator/rqt_1.png)

If you want to see more detail topic message, click the `▶` button next to each checkbox.

![](/assets/images/platform/openmanipulator/rqt_2.png)


[rqt]: http://wiki.ros.org/rqt

#### [Published Topic List](#published-topic-list)

{% capture notice_01 %}
**Published Topic List** :
The topic list is published by open_manipulator_controller.
- `/open_manipulator/joint_states`
- `/open_manipulator/kinematics_pose`
- `/open_manipulator/states`
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

- `/open_manipulator/joint_states` is a message indicating the states of the joints in OpenManipulator. **"name"** of this message indicates joint component names OpenManipulator have.  **"effort"** indicates currents of the joint Dynamixels. **"position"** and **"velocity"** indicates the angle and angular velocity of each joints.

![](/assets/images/platform/openmanipulator/rqt_joint_states.png)

- `/open_manipulator/kinematics_pose` is a message indicating the pose(position and orientation) on world coordinate(cartesian) of OpenManipulator gripper. **"position"** indicates x, y, and z value of the center of the tool gripper. **"Orientation"** indicates the direction of the tool gripper as quaternion.

![](/assets/images/platform/openmanipulator/rqt_kinematic_pose.png)

- `/ open_manipulator / states` is a message indicating the status of OpenManipulator. **"open_manipulator_actuator_state"** indicates whether the torque of the actuator(Dynamixel) is enable("ACTUATOR_ENABLE") or disable("ACTUATOR_DISABLE"). **"open_manipulator_moving_state"** indicates whether OpenManipulator is "MOVING" or "STOPPED" along the trajectory.

![](/assets/images/platform/openmanipulator/rqt_states.png)

#### [Subscribed Topic List](#published-topic-list)

{% capture notice_01 %}
**Subscribed Topic List**: 
The topic list is subscribed by open_manipulator_controller.
- `/open_manipulator/option`
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

- `/ open_manipulator / option` is used to set OpenManipulator options (std :: string type). 
  - **"print_open_manipulator_setting"** : request display "Manipulator Description" to open_manipulator_controller. 

 
![](/assets/images/platform/openmanipulator/rqt_option.png)


In addition, you can monitor topics through rqt whenever you have a topic added in your controller.


### [Service](#service)


#### [Service Server List](#service-server-list)

{% capture notice_01 %}
**Service Server List** :
This is Service Server list of open_manipulator_controller.
- `/open_manipulator/goal_joint_space_path`
- `/open_manipulator/goal_task_space_path`
- `/open_manipulator/goal_joint_space_path_to_present`
- `/open_manipulator/goal_task_space_path_to_present`
- `/open_manipulator/goal_tool_control`
- `/open_manipulator/set_actuator_state`
- `/open_manipulator/goal_drawing_trajectory`
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

- `/open_manipulator/goal_joint_space_path` is ...

- `/open_manipulator/goal_task_space_path` is ...

- `/open_manipulator/goal_joint_space_path_to_present` is ...

- `/open_manipulator/goal_task_space_path_to_present` is ...

- `/open_manipulator/goal_tool_control` is ...

- `/open_manipulator/set_actuator_state` is ...

- `/open_manipulator/goal_drawing_trajectory` is ...

## [GUI Program](#gui-program)

  You can use GUI program to manipulate OpenManipulator. This program shows the status of the manipulator and provides the ability to operate the manipulator.
  ```
  $ rosrun open_manipulator_control_gui open_manipulator_control_gui
  ```

![](/assets/images/platform/openmanipulator/OpenManipulator_GUI.png)

## [Teleoperation](#teleoperation)

### [Keyboard](#keyboard)



### [RC100](#rc100)


### [XBOX 360 Joystick](#xbox-360-joystick)


## [Moveit!](#moveit)

To load an OpenManipulator with DYNAMIXEL X-series, you can set parameters for what you've configured for your own OpenManipulator

  ```
  <launch>
    <arg name="use_robot_name"         default="open_manipulator"/>
    <arg name="dynamixel_usb_port"     default="/dev/ttyUSB0"/>
    <arg name="dynamixel_baud_rate"    default="1000000"/>

    <arg name="use_platform"           default="true"/>

    <node pkg="open_manipulator_controller" type="open_manipulator_controller" name="open_manipulator_controller" output="screen">
      <param name="robot_name"           value="$(arg use_robot_name)"/>
      <param name="usb_port"             value="$(arg dynamixel_usb_port)"/>
      <param name="baud_rate"            value="$(arg dynamixel_baud_rate)"/>
      <param name="using_platform"       value="$(arg use_platform)"/>
    </node>
  </launch>
  ```

  ```
  $ roslaunch open_manipulator_controller open_manipulator_controller.launch
  ```

We provide manipulation layer to use MoveIt!. You can handle it using RViz or ROS messages.

  ```
  $ roslaunch open_manipulator_moveit_controller open_manipulator_moveit.launch
  ```

Below services are help you to manipulate OpenManipulator

  ```
  /open_manipulator/get_joint_position
  /open_manipulator/get_kinematics_pose
  /open_manipulator/set_gripper_position
  /open_manipulator/set_joint_position
  /open_manipulator/set_kinematics_pose
  ```

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_1.png)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_2.png)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_3.png)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_4.png)


# [Camera Application](#camera-application)

**Coming Soon**

# [Gazebo Simulation](#gazebo-simulation)

**NOTE** : This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

## [Launch OpenManipulator Controller for gazebo](#launch-openmanipulator-controller-for-gazebo)

Launch an OpenManipulator controller for gazebo simulation.

  ```
  $ roslaunch open_manipulator_controller open_manipulator_controller.launch use_platform:=false
  ```
If the OpenManipulator controller for gazebo simulation Launched successfully, the terminal will represent below messages.

```
SUMMARY
========

PARAMETERS
 * /open_manipulator_controller/baud_rate: 1000000
 * /open_manipulator_controller/usb_port: /dev/ttyUSB0
 * /open_manipulator_controller/using_platform: False
 * /robot_name: open_manipulator
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator_controller (open_manipulator_controller/open_manipulator_controller)

auto-starting new master
process[master]: started with pid [6117]
ROS_MASTER_URI=http://localhost:11311

setting /run_id to 2137abca-f79f-11e8-9533-ac9e17829ad5
process[rosout-1]: started with pid [6130]
started core service [/rosout]
process[open_manipulator_controller-2]: started with pid [6137]
[INFO] Successed to OpenManipulator initialization
```
**NOTE** : In OpenManipulator controller for gazebo simulation, Joint and Gripper Dynamixel are not enable, following messages will not display :  
Joint Dynamixel ID : 11, Model Name : XM430-W350  
Joint Dynamixel ID : 12, Model Name : XM430-W350  
Joint Dynamixel ID : 13, Model Name : XM430-W350  
Joint Dynamixel ID : 14, Model Name : XM430-W350  
Gripper Dynamixel ID : 15, Model Name :XM430-W350
{: .notice--info}


## [Launch OpenManipulator gazebo](#launch-openmanipulator-gazebo)

Load an OpenManipulator on Gazebo simulator and click Play button `▶`.

  ```
  $ roslaunch open_manipulator_gazebo open_manipulator_gazebo.launch
  ```

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gazebo_1.png)

Enter `rostopic list` to list up the activated topics.

  ```
  /clock
  /gazebo/link_states
  /gazebo/model_states
  /gazebo/parameter_descriptions
  /gazebo/parameter_updates
  /gazebo/set_link_state
  /gazebo/set_model_state
  /gazebo_gui/parameter_descriptions
  /gazebo_gui/parameter_updates
  /open_manipulator/grip_joint_position/command
  /open_manipulator/grip_joint_sub_position/command
  /open_manipulator/joint1_position/command
  /open_manipulator/joint2_position/command
  /open_manipulator/joint3_position/command
  /open_manipulator/joint4_position/command
  /open_manipulator/joint_states
  /open_manipulator/kinematics_pose
  /open_manipulator/option
  /open_manipulator/states
  /rosout
  /rosout_agg
  ```

OpenManipulator in Gazebo is controllered by ROS message. For example, use below command to publish joint position(in radian).

  ```
  $ rostopic pub /open_manipulator/joint2_position/command std_msgs/Float64 "data: -1.0" --once
  ```

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gazebo_2.png)


# [How to Control on OpenCR](#how-to-contol-on-opencr)

OpenManipulator is compatible with **OpenCR**. We offer API to easily control manipulator.
This API supports Dynamixel, Dynamixel X including protocol 1.0 and 2.0. Furthermore, this code can be used Friends of OpenManipulator.
User can make thier code in **Arduino IDE** and simulate or control using **Processing** GUI.
## [Setup](#setup)

--hardware setup


## [Arduino IDE](#arduino-ide)

Download Arduino IDE and load OpenCR board on it

- [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

Find example source codes.

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Chain` → `open_manipulator_chain` on Arduino IDE for OpenCR.

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_arduino.png)

## [Processing](#processing)

Download Processing and load OpenCR board on it

- [Download Processing](https://processing.org/download/)

Open Processing and Go to `Tools` → `Add Tool..`. Search `ControlP5` and install it.

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_1.png)

Open processing source code file (`OpenCR`>`arduino`>`opencr_arduino`>`opencr`>`libraries`>`OpenManipulator`>`example`>`Processing`>`Chain`>`Chain.pde`) on Processing IDE, and Run it.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_2.png)


# [Tool Gripper Modification](#tool-gripper-modification)

## [Vacuum Gripper](#vaccum-gripper)




## [Pen Gripper](#pen-gripper)



# [Mobile Manipulation](#mobile-manipulation)

  **TIP**: You can get a more information about it in [Manipulation section of TurtleBot3](/docs/en/platform/turtlebot3/manipulation/#manipulation)
  {: .notice--info}

Install dependent packages

  ```
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_msgs.git
  $ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
  $ cd ~/catkin_ws && catkin_make
  ```

Load a TurtleBot3 Waffle or Waffle Pi with OpenManipulator on RViz.

  **TIP**: TB3_MODEL =  `waffle`, `waffle_pi`
  {: .notice--info}

  ```
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_description open_manipulator_with_tb3_rviz.launch
  ```

![](/assets/images/platform/openmanipulator/TurtleBot3_with_Open_Manipulator.png)

# [Friends](#friends)

  Friends List

  - [OpenManipulator SCARA](/docs/en/platform/openmanipulator/#openmanipulator-scara)
  - [OpenManipulator Link](/docs/en/platform/openmanipulator/#openmanipulator-link)
  - [OpenManipulator Planar](/docs/en/platform/openmanipulator/#openmanipulator-planar)
  - [OpenManipulator Delta](/docs/en/platform/openmanipulator/#openmanipulator-delta)
  - [OpenManipulator Stewart](/docs/en/platform/openmanipulator/#openmanipulator-stewart)
  - [OpenManipulator Linear](/docs/en/platform/openmanipulator/#openmanipulator-linear)

## [OpenManipulator SCARA](#openmanipulator-scara)

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_Capture.png)

| Items               | Unit    |                                         |
| ------------------- | ------- | --------------------------------------- |
| **Actuator**        |         | Dynamixel XM430-W350-T                  |
| **Input Voltage**   | V       | 12                                      |
| **DOF**             | -       | 4 (3 DOF + 1 End-Effector)              |
| **Speed(Joint)**    | RPM     | 46                                      |
| **Reach**           | mm (in) | 276 (10.87)                             |
| **Communication**   | -       | TTL (Level Multidrop BUS)               |
| **Software**        | -       | Dynamixel SDK, Arduino, Processing      |
| **Main Controller** | -       | PC, OpenCR                              |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_spec_side.png)

### Hardware Setup

#### Part Lists

|              | Part Name | Quantity | Link
|---------     |---------- |---------   |
|**Chassis Parts** |BASE FRAME|1|[Download Link](https://www.thingiverse.com/thing:3069581)|
|.                 |PEN HOLDER|1|[Download Link](https://www.thingiverse.com/thing:3069581)|
|.                 |FRM BASE|1|[Download Link](https://www.thingiverse.com/thing:3069581)|
|.                 |TAP HOLDER|1|[Download Link](https://www.thingiverse.com/thing:3069581)|
|.                 |FR12_H101_K|4|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2768&GC=GD0B0001)|
|.                 |FR12_S102_K|3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2766&GC=GD0B0001)|
|.                 |HN12_I101|4|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2759&GC=GD0B0006)|
|**Actuators**     |Dynamixel XM430-W350-T|4|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)|
|**Cables**        |CABLE_3P_130MM|3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2347&GC=GD0B0105&page=2)|
|.                 |CABLE_3P_240MM|1|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)|
|**Miscellaneous** |WB_M2X03|24|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2%0900000070373%3A%3A3)|
|.                 |WB_M2_5X4|14|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2.5%0900000070373%3A%3A8)|
|.                 |WB_M2_5X06|8|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2.5%0900000070373%3A%3A3%2C6)|
|.                 |WB_M2_5X12|2|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2.5%0900000070373%3A%3A8)|
|.                 |FHS_M2_5X14|12|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3)|
|.                 |NUT_M2_5(0.45P)|8|[Shop Link](https://us.misumi-ec.com/vona2/detail/110300250540/?Inch=0&CategorySpec=00000070281%3A%3A2.5)|


<!-- [Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1916070381) -->

#### 3D Printed Parts

- CAD Files ([Onshape](http://www.robotis.com/service/download.php?no=691), [Thingiverse](https://www.thingiverse.com/thing:3069581))

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_OnShape.png)

### Software Setup

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `SCARA` → `open_manipulator_SCARA` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`OpenCR`>`arduino`>`opencr_arduino`>`opencr`>`libraries`>`OpenManipulator`>`example`>`Processing`>`SCARA`>`SCARA.pde`) on Processing IDE, and Run it.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_Processing.png)

### Video

 <iframe width="560" height="315" src="https://www.youtube.com/embed/4PK3I1JfSzc" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [OpenManipulator Link](#openmanipulator-link)

![](/assets/images/platform/openmanipulator/OpenManipulator_Link.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_Capture.png)

| Items                    | Unit    |                                         |
| -------------------      | ------- | --------------------------------------- |
| **Actuator**             |         | Dynamixel XM430-W350-T                  |
| **DOF**                  | -       | 3                                       |
| **Payload With Suction** | g (lb)  | 500 (1.10)                              |
| **Speed(Joint)**         | rad/sec | 4.82                                    |
| **Weight**               | kg(lb)  | 0.55 (1.21)                             |
| **Reach**                | mm (in) | 350 (13.78)                             |
| **Communication**        | -       | TTL (Level Multidrop BUS)               |
| **Software**             | -       | Dynamixel SDK, Arduino, Processing      |
| **Main Controller**      | -       | PC, OpenCR                              |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_spec.png)

### Hardware Setup

#### Part Lists

|                   | Part Name                        | Quantity | Link                                                                                                                                                                           |
|-------------------|----------------------------------|-------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Chassis Parts** | BASE FRAME                       | 1     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| .                 | BASE LINK                        | 1     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| .                 | ROTATION BASE                    | 1     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| .                 | HOLDER A                         | 1     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| .                 | HOLDER B                         | 1     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| .                 | LINK 50                          | 1     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| .                 | LINK 200 A                       | 1     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| .                 | LINK 50 FOR 250                  | 1     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| .                 | LINK 200 FOR 250                 | 1     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| .                 | LINK 200 B                       | 4     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| .                 | TRIANGLE LINK                    | 1     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| .                 | TOOL LINK                        | 1     | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                     |
| **Actuators**     | Dynamixel XM430-W350-T           | 3     | [Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                                                                        |
| **Cables**        | CABLE_3P_180MM                   | 1     | [Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2755&GC=GD0B0105&page=2)                                                                                 |
| .                 | CABLE_3P_240MM                   | 1     | [Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)                                                                                 |
| **Miscellaneous** | FHS_M2x3mm                       | 16    | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2%0900000071552%3A%3A3)                                                   |
| .                 | FHS_M2x6mm                       | 4     | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2%0900000071552%3A%3A6)                                                   |
| .                 | FHS_M2.5x5mm                     | 8     | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3A%3A5)                                                 |
| .                 | FHS_M2.5x10mm                    | 4     | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3A%3A10)                                                |
| .                 | FHS_M3x10mm                      | 4     | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3A%3A10)                                                |
| .                 | NUT_M2                           | 4     | [Shop Link](https://us.misumi-ec.com/vona2/detail/110300250540/?Inch=0&CategorySpec=00000070281%3A%3A2)                                                                        |
| .                 | NUT_M2.5                         | 4     | [Shop Link](https://us.misumi-ec.com/vona2/detail/110300250540/?Inch=0&CategorySpec=00000070281%3A%3A2.5)                                                                      |
| .                 | PSCBRJ6-9                        | 18    | [Shop Link](https://us.misumi-ec.com/vona2/detail/110302637270/?HissuCode=PSCBRJ6-9&PNSearch=PSCBRJ6-9&KWSearch=PSCBRJ6-9&searchFlow=results2type)                             |
| .                 | MSRB6-1.0                        | 40    | [Shop Link](https://us.misumi-ec.com/vona2/detail/110100142970/?HissuCode=MSRB6-1.0&PNSearch=MSRB6-1.0&KWSearch=MSRB6-1.0&searchFlow=results2type)                             |
| .                 | NSFMR6-38                        | 1     | [Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-38&PNSearch=NSFMR6-38&KWSearch=NSFMR6-38&searchFlow=results2products)                         |
| .                 | NSFMR6-42                        | 1     | [Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-42&PNSearch=NSFMR6-42&KWSearch=NSFMR6-42&searchFlow=results2products)                         |
| .                 | NSFMR6-24                        | 6     | [Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-24&PNSearch=NSFMR6-24&KWSearch=NSFMR6-24&searchFlow=results2products)                         |
| .                 | Ball Bearing(O.D 10mm / I.D 6mm) | 20    | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000531116/?CategorySpec=unitType%3a%3a1%0900000044017%3a%3amig00000001446936%0900000043985%3a%3amig00000001455783&Inch=0) |

<!-- [Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1110711693) -->

#### 3D Printed Parts

CAD Files ([Onshape](http://www.robotis.com/service/download.php?no=692), [Thingiverse](https://www.thingiverse.com/thing:3069557))

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_OnShape.png)

### Software Setup

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Link` → `open_manipulator_link` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`OpenCR`>`arduino`>`opencr_arduino`>`opencr`>`libraries`>`OpenManipulator`>`example`>`Processing`>`Link`>`Link.pde`) on Processing IDE, and Run it.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_Processing.png)

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/WR9_1AheOok" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## [OpenManipulator Planar](#openmanipulator-planar)

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar.png)

### Specification

  - **Comming Soon**

### Dimension

  - **Comming Soon**

### Hardware Setup

[Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=64381687)

  * Items that are painted in **purple** in above link are purchased on ROBOTIS SHOP
  * Items that are painted in **green** in above link are purchased on shopping mall
  * Items that are painted in **yellow** in above link are 3D printing parts

CAD Files ([Onshape](http://www.robotis.com/service/download.php?no=761), [Thingiverse](https://www.thingiverse.com/thing:3064437))

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar_OnShape.png)

### Software Setup

  - **Comming Soon**

### Video

  - **Comming Soon**

## [OpenManipulator Delta](#openmanipulator-delta)

![](/assets/images/platform/openmanipulator/OpenManipulator_Delta.png)

### Specification

  - **Comming Soon**

### Dimension

  - **Comming Soon**

### Hardware Setup

[Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1521432651)

  * Items that are painted in **purple** in above link are purchased on ROBOTIS SHOP
  * Items that are painted in **green** in above link are purchased on shopping mall
  * Items that are painted in **yellow** in above link are 3D printing parts

[CAD Files](http://www.robotis.com/service/download.php?no=762)

![](/assets/images/platform/openmanipulator/OpenManipulator_Delta_OnShape.png)

### Software Setup

  - **Comming Soon**

### Video

  - **Comming Soon**

## [OpenManipulator Stewart](#openmanipulator-stewart)

![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart.png)

### Specification

  - **Comming Soon**

### Dimension

  - **Comming Soon**

### Hardware Setup

[Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=42267100)

  * Items that are painted in **purple** in above link are purchased on ROBOTIS SHOP
  * Items that are painted in **green** in above link are purchased on shopping mall
  * Items that are painted in **yellow** in above link are 3D printing parts

[CAD Files](http://www.robotis.com/service/download.php?no=763)

![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_OnShape.png)

### Software Setup

  - **Comming Soon**

### Video

  - **Comming Soon**

## [OpenManipulator Linear](#openmanipulator-linear)

![](/assets/images/platform/openmanipulator/OpenManipulator_Linear.png)

### Specification

  - **Comming Soon**

### Dimension

  - **Comming Soon**

### Hardware Setup

[Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1200068410)

  * Items that are painted in **purple** in above link are purchased on ROBOTIS SHOP
  * Items that are painted in **green** in above link are purchased on shopping mall
  * Items that are painted in **yellow** in above link are 3D printing parts

[CAD Files](http://www.robotis.com/service/download.php?no=764)

![](/assets/images/platform/openmanipulator/OpenManipulator_Linear_OnShape.png)

### Software Setup

  - **Comming Soon**

### Video

  - **Comming Soon**


[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenCR Manual]: /docs/en/parts/controller/opencr10/
