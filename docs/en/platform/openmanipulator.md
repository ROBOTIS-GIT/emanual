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
| **Chassis Parts** | LINK FRAME(LONG)       |     1      |
| .                 | LINK FRAME(SHORT)      |     1      |
| .                 | RAIL BRACKET(LEFT)     |     1      |
| .                 | RAIL BRACKET(RIGHT)    |     1      |
| .                 | PALM GRIPPER           |     2      |
| .                 | LINK ROD               |     2      |
| .                 | FLANGE BUSH            |     4      |
| .                 | CRANK ARM              |     1      |
| .                 | RAIL BLOCK             |     2      |
| .                 | FR12-S101-K            |     1      |
| .                 | FR12-S102-K            |     2      |
| .                 | FR12-H101-K            |     2      |
| .                 | FR12-H104-K            |     1      |
| **Actuators**     | Dynamixel XM430-W350-T |     5      |
| **Cables**        | CABLE-X3P-100          |     1      |
| .                 | CABLE-X3P-180          |     2      |
| .                 | CABLE-X3P-240          |     2      |
| **Tools**         | Screw Driver           |     1      |
| .                 | Wrench-1.5             |     1      |
| .                 | Wrench-2.0             |     1      |
| .                 | Wrench-2.5             |     1      |
| **Miscellaneous** | X-SP                   |     24     |
| .                 | NUT-M2.5               |     16     |
| .                 | NUT-M3                 |     4      |
| .                 | FHS-M2.5x14            |     12     |
| .                 | WB-M2x3                |     38     |
| .                 | WB-M2x4                |     4      |
| .                 | WB-M2.5x4              |     4      |
| .                 | WB-M2.5x6              |     8      |
| .                 | WB-M2.5x8              |     16     |
| .                 | WB-M2.5x12             |     8      |
| .                 | WB-M2.5x20             |     4      |
| .                 | WB-M3x10               |     4      |
| .                 | DC12-IDLER             |     3      |
| .                 | DC12-IDLER-CAP         |     3      |
| .                 | DC12-P-BEARING         |     3      |
| .                 | RUBBER PAD             |     2      |


- Optional parts

|            | Part Name  |  Quantity  |
|------------|------------|:----------:|
| **Powers** | [SMPS 12V5A](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=1369&keyword=smps) |     1      |
| **Boards** | [OpenCR](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3289&GC=GD0B0100)     |     1      |
| .          | [U2D2](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3288&keyword=u2d2)       |     1      |
| **Plate**  | Base Plate-02 |     1      |
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

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- If you want to control OpenManipulator on OpenCR(Embedded board) instead of ROS, please set it up as described in [How to Control on OpenCR](/docs/en/platform/openmanipulator/#how-to-control-on-opencr).
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

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
$ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-industrial-core
```

```
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
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

# [Controller](#controller)

Open Manipulator Controller is provided for basic manipulation of OpenManipulator. You can control the dynamixel of OpenManipulator and check states of OpenManipulator through [messages](/docs/en/platform/openmanipulator/#message-list) of the controller. 

**NOTE**: This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

## [Run roscore](#run-roscore)

Run roscore.

```
$ roscore
```

## [Launch Controller](#launch-controller)

Launch Open Manipulator Controller to start [Basic Manipulation](/docs/en/platform/openmanipulator/#basic-manipulation).

```
$ roslaunch open_manipulator_controller open_manipulator_controller.launch
```

**WARNING**: If you start the controller in a pose where the components of OpenManipulator are in contact with each other, the OpenManipulator will not move by joint limit. 
It is recommended to place the Open Manipulator in the following Pose and start the control.  
<img src="/assets/images/platform/openmanipulator/open_manipulator_start_pose.png" width="250">
<!-- ![](/assets/images/platform/openmanipulator/open_manipulator_start_pose.png) -->
{: .notice--warning}

If OpenManipulator controller launched successfully, the terminal will represent below messages.

```
SUMMARY
========

PARAMETERS
 * /open_manipulator/control_period: 0.01
 * /open_manipulator/moveit_sample_duration: 0.05
 * /open_manipulator/planning_group_name: arm
 * /open_manipulator/using_moveit: False
 * /open_manipulator/using_platform: True
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator (open_manipulator_controller/open_manipulator_controller)

ROS_MASTER_URI=http://localhost:11311

process[open_manipulator-1]: started with pid [23452]
Joint Dynamixel ID : 11, Model Name : XM430-W350
Joint Dynamixel ID : 12, Model Name : XM430-W350
Joint Dynamixel ID : 13, Model Name : XM430-W350
Joint Dynamixel ID : 14, Model Name : XM430-W350
Gripper Dynamixel ID : 15, Model Name :XM430-W350
[ INFO] [1544509070.096942788]: Succeeded to init /open_manipulator
```

{% capture notice_01 %}
**TIP**: 
- If you can't load Dynamixels, please check your Dynamixels information. You can use [find_dynamixel example](/docs/en/software/dynamixel/dynamixel_workbench/#find-dynamixels) in Dynamixel-Workbench packages.   
`rosrun dynamixel_workbench_controllers find_dynamixel /dev/ttyUSB0`  
Even if you can't find any Dynamixels, please check firmware to use ROBOTIS software ([R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/) or [R+ Manager 1.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/))
- If you want to change Dynamixel ID, Please check [`OpenManipulator.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/be2859a0506b4e941a19435c0a07562b41768a27/open_manipulator_libs/src/OpenManipulator.cpp#L40) in open_manipulator_lib folder. The default ID is that **joint is 11, 12, 13, 14 and gripper is 15**
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

**NOTE**: open_manipulator_controller is compatible with [Protocol 2.0](/docs/en/dxl/protocol2/). Because [Protocol 1.0](/docs/en/dxl/protocol1/) doesn't support SyncRead instructions that makes access multiple Dynamixels simultaneously. [`MX2`](/docs/en/dxl/mx/mx-64-2/), `X` and `Pro` series can be controllered by Protocol 2.0 but `AX`, `RX`, `EX` series can't. 
{: .notice--info}

## [Check Setting](#check-setting)

### [Manipulator Description](#manipulator-description)

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [Open Manipulator controller](/docs/en/platform/openmanipulator/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Publish a topic message to check the OpenManipulator setting.

```
$ rostopic pub /open_manipulator/option std_msgs/String "print_open_manipulator_setting"
```

<**Manipulator Description**> will be printed on the terminal launch the open_manipulator_controller. It is shown that present state of the OpenManipulator.  
This parameter is descripted on OpenManipulator.cpp in open_manipulator_libs pkg  
`~/catkin_ws/src/open_manipulator/open_manipulator_libs/src/OpenManipulator.cpp`

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
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Load an OpenManipulator on RViz.

```
$ roslaunch open_manipulator_description open_manipulator_rviz.launch
```

{% capture notice_01 %}
**NOTE**: 
- When the user launch the Rviz with the [OpenManipulator controller](/docs/en/platform/openmanipulator/#launch-controller), the OpenManipulator model of Rviz is synchronized with the actual OpenManipulator.
- If the user wants to check only model of OpenManipulator without control the actual OpenManipulator, the user can launch the Rviz without the OpenManipulator controller.
The user can change each joint by GUI, if the user launch only Rviz by executing the following command :
`$ roslaunch open_manipulator_description open_manipulator_rviz.launch use_gui:=true`
- `Red Box` is showing end-effector position.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/openmanipulator/OpenManipulator_rviz.png)

# [Basic Manipulation](#basic-manipulation)

<iframe width="560" height="315" src="https://www.youtube.com/embed/dctx7Y6zNKA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [Message List](#message-list)

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [Open Manipulator controller](/docs/en/platform/openmanipulator/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Open Manipulator Controller provides **topic** and **service** messages to control manipulator and check the states of manipulator.

### [Topic](#topic)

#### [Topic Monitor](#topic-monitor)

In order to check the topics of OpenManipulator Controller, we will use [rqt][rqt] provided by ROS. The rqt is a Qt-based framework for GUI development for ROS. The rqt is a tool that allows users to easily see the topic status by displaying all the topics in the topic list. There are topic names, types, bandwidth, Hz, value in GUI.

Run the rqt.
``` bash
$ rqt
```
![](/assets/images/platform/openmanipulator/rqt_om.png)

**TIP**: If rqt is not displayed, select the `plugin` -> `Topics` -> `Topic Monitor`.
{: .notice--success}

When rqt is first run, the topic values are not monitored. To monitor the topic, click the checkbox next to each topic.

![](/assets/images/platform/openmanipulator/rqt_1.png)

If you want to see more detail topic message, click the `▶` button next to each checkbox.

![](/assets/images/platform/openmanipulator/rqt_2.png)


[rqt]: http://wiki.ros.org/rqt

#### [Published Topic List](#published-topic-list)

**Published Topic List** :
The topic list is published by open_manipulator_controller.
- `/open_manipulator/joint_states`
- `/open_manipulator/gripper/kinematics_pose`
- `/open_manipulator/states`

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}

`/open_manipulator/joint_states`([sensor_msgs/JointState]{: .popup}) is a message indicating the states of the joints in OpenManipulator. **"name"** of this message indicates joint component names OpenManipulator have.  **"effort"** indicates currents of the joint Dynamixels. **"position"** and **"velocity"** indicates the angle and angular velocity of each joints.

![](/assets/images/platform/openmanipulator/rqt_joint_states.png)

`/open_manipulator/gripper/kinematics_pose`([open_manipulator_msgs/KinematicsPose]{: .popup}) is a message indicating the pose(position and orientation) in [task space]{: .popup}. **"position"** indicates x, y, and z value of the center of the end-effector(tool). **"Orientation"** indicates the direction of the end-effector(tool) as quaternion.

![](/assets/images/platform/openmanipulator/rqt_kinematic_pose.png)

`/open_manipulator/states`([open_manipulator_msgs/OpenManipulatorState]{: .popup}) is a message indicating the status of OpenManipulator. **"open_manipulator_actuator_state"** indicates whether the torque of the actuator(Dynamixel) is enable("ACTUATOR_ENABLE") or disable("ACTUATOR_DISABLE"). **"open_manipulator_moving_state"** indicates whether OpenManipulator is "MOVING" or "STOPPED" along the trajectory.

![](/assets/images/platform/openmanipulator/rqt_states.png)

#### [Subscribed Topic List](#published-topic-list)

**Subscribed Topic List**: 
The topic list is subscribed by open_manipulator_controller.
- `/open_manipulator/option`

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}

`/open_manipulator/option`([std_msgs::String]{: .popup}) is used to set OpenManipulator options (std :: string type). 
- **"print_open_manipulator_setting"** : request display "Manipulator Description" to open_manipulator_controller. 

 
![](/assets/images/platform/openmanipulator/rqt_option.png)


In addition, you can monitor topics through rqt whenever you have a topic added in your controller.


### [Service](#service)


#### [Service Server List](#service-server-list)

**NOTE**: These services are messages to operate the OpenManipulator or to change the status of the Dynamixels of OpenManipulator.
{: .notice--info}


**Service Server List** :
This is Service Server list of open_manipulator_controller.

- `/open_manipulator/goal_joint_space_path` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the angle of the target joint and the total time of the trajectory.
  

- `/open_manipulator/goal_task_space_path` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_position_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_orientation_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_joint_space_path_to_present` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory from present joint angle in the [joint space]{: .popup}. The user inputs the angle of the target joint to be changed and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_to_present` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the task space. The user inputs the kinematics pose to be changed of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_to_present_position_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_to_present_orientation_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_tool_control` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to move the tool of OpenManipulator. 

- `/open_manipulator/set_actuator_state` ([open_manipulator_msgs/SetActuatorState]{: .popup})  
The user can use this service to control the state of actucators.   
If the user set true at set_actuator_state valuable, the actuator will be enabled.  
If the user set false at set_actuator_state valuable, the actuator will be disabled.

- `/open_manipulator/goal_drawing_trajectory` ([open_manipulator_msgs/SetDrawingTrajectory]{: .popup})  
The user can use this service to create a drawing trajectory. The user can create the circle, the rhombus, the heart, and the straight line trajectory.

## [GUI Program](#gui-program)

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [Open Manipulator controller](/docs/en/platform/openmanipulator/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

  The user can use GUI program to manipulate the OpenManipulator.  Launch `open_manipulator_control_gui` node.  This program shows the status of the manipulator and provides the ability to operate the manipulator.

  ```
  $ roslaunch open_manipulator_control_gui open_manipulator_control_gui.launch
  ```
  To manipulate the OpenManipulator, first click the `Timer Start` button.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_GUI.png)  

  The user can check the states of the OpenManipulator (joint states, kinematics pose).  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_GUI2.png)  

  The user can manipulate the OpenManipulator in the [joint space]{: .popup}. Enter the joint angles and total time of the trajectory. Then click the `send` button.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_GUI3.png)  

  The user can manipulate the OpenManipulator in the [task space]{: .popup}. Enter the kinematics pose of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory. Then click the `send` button.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_GUI4.png)  
  
  The user can create a drawing trajectory with the OpenManipulator. First, choose the drawing trajectory type(line, circle, rhombus, heart). And enter the parameters according to the drawing trajectory type and the total time of the drawing trajectory. Then click the `send` button.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_GUI5.png)  

## [Teleoperation](#teleoperation)
{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [Open Manipulator controller](/docs/en/platform/openmanipulator/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

<iframe width="560" height="315" src="https://www.youtube.com/embed/FGHBMJByJ7k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [Keyboard](#keyboard)

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}
 
  Launch `open_manipulator_teleop_keyboard` node for simple teleoperation test using the keyboard.

  ```
  $ roslaunch open_manipulator_teleop open_manipulator_teleop_keyboard.launch 
  ```
  If the node is successfully launched, the following instruction will be appeared to the terminal window.


  ```
  ---------------------------
  Control Your OpenManipulator!
  ---------------------------
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
        
  1 : init pose
  2 : home pose
        
  q to quit
  ---------------------------
  Present Joint Angle J1: 0.000 J2: 0.000 J3: 0.000 J4: 0.000
  Present Kinematics Position X: 0.000 Y: 0.000 Z: 0.000
  ---------------------------
  ```

### [PS4 Joystick](#ps4-joystick)
Connect PS4 joystick to the PC via Bluetooth or with USB cable.  

Install packages for teleoperation using PS4 joystick.

``` 
$ sudo apt-get install ros-kinetic-joy ros-kinetic-joystick-drivers ros-kinetic-teleop-twist-joy
$ sudo pip install ds4drv
```
Launch teleoperation packages for PS4 joystick.
```
$ sudo ds4drv
$ roslaunch open_manipulator_teleop open_manipulator_teleop_joystick.launch
```

### [XBOX 360 Joystick](#xbox-360-joystick)
Connect XBOX 360 joystick to the PC with Wireless Adapter or USB cable.

Install packages for teleoperation using XBOX 360 joystick.

``` 
$ sudo apt-get install xboxdrv ros-kinetic-joy ros-kinetic-joystick-drivers ros-kinetic-teleop-twist-joy
```
Launch teleoperation packages for XBOX 360 joystick.
```
$ sudo xboxdrv --silent
$ roslaunch open_manipulator_teleop open_manipulator_teleop_joystick.launch
```

## [MoveIt!](#moveit)

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

Before you launch MoveIt!, let's check `open_manipulator_moveit` launch file.

  ```
  <launch>
    <arg name="use_robot_name"         default="open_manipulator"/>

    <arg name="dynamixel_usb_port"     default="/dev/ttyUSB0"/>
    <arg name="dynamixel_baud_rate"    default="1000000"/>

    <arg name="control_period"         default="0.010"/>

    <arg name="use_platform"           default="true"/>

    <arg name="use_moveit"             default="false"/>
    <arg name="planning_group_name"    default="arm"/>
    <arg name="moveit_sample_duration" default="0.050"/>

    <group if="$(arg use_moveit)">
      <include file="$(find open_manipulator_controller)/launch/open_manipulator_moveit.launch">
        <arg name="sample_duration" value="$(arg moveit_sample_duration)"/>
      </include>
    </group>

    <node name="$(arg use_robot_name)" pkg="open_manipulator_controller" type="open_manipulator_controller" output="screen" args="$(arg dynamixel_usb_port) $(arg dynamixel_baud_rate)">
        <param name="using_platform"       value="$(arg use_platform)"/>
        <param name="using_moveit"         value="$(arg use_moveit)"/>
        <param name="planning_group_name"  value="$(arg planning_group_name)"/>
        <param name="control_period"       value="$(arg control_period)"/>
        <param name="moveit_sample_duration"  value="$(arg moveit_sample_duration)"/>
    </node>

  </launch>
  ```

**Parameters List** :
The parameters list is supposed to set loading [move_group](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/move_group_interface/move_group_interface_tutorial.html) package.
- `use_moveit`
- `planning_group_name`
- `moveit_sample_duration`

`use_moveit` is a parameter to set whether user use MoveIt!  
`planning_group_name` is a parameter when you set in [setup_assistant](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/setup_assistant/setup_assistant_tutorial.html#step-4-add-planning-groups)  
`moveit_sample_duration` is a parameter is to set sampling time when joint trajectory is planned from MoveIt!

After set the parameters, load a controller.

  ```
  $ roslaunch open_manipulator_controller open_manipulator_controller.launch use_moveit:=true
  ```

  ![](/assets/images/platform/openmanipulator/moveit_launch.png)  

**Service Server List** :
This is Service Server list of open_manipulator_controller.

- `/open_manipulator/moveit/get_joint_position` ([open_manipulator_msgs/GetJointPosition]{: .popup})  
The user can use this service to receives a joint position which is calculated by move_group.  

- `/open_manipulator/moveit/get_kinematics_pose` ([open_manipulator_msgs/GetKinematicsPose]{: .popup})  
The user can use this service to receives a kinematics pose which is calculated by move_group.

- `/open_manipulator/moveit/set_joint_position` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup} by move_group. The user inputs the angle of the target joint and the total time of the trajectory.
  
- `/open_manipulator/moveit/set_kinematics_pose` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup} by move_group. The user inputs the kinematics pose(orientation only) of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

**TIP**: If someone want to use inverse kinematics with `position_only`. Please check `open_manipulator_moveit` -> `config` -> `kinematics.yaml`. And change a parameter(position_only_ik) to **True**.
{: .notice--success}

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_1.png)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_2.png)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_3.png)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_4.png)


# [Gazebo Simulation](#gazebo-simulation)

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Controller for gazebo](#controller-for-gazebo)

Launch an OpenManipulator controller for gazebo simulation.

  ```
  $ roslaunch open_manipulator_controller open_manipulator_controller.launch use_platform:=false
  ```
**NOTE** : To control the OpenManipulator in the Gazebo environment using the Open Manipulator Controller, the controller must set the **use_platform** parameter to **false** because it needs to send messages to gazebo instead of Platform.
{: .notice--info}

If the OpenManipulator controller for gazebo simulation Launched successfully, the terminal will represent below messages.

```
SUMMARY
========

PARAMETERS
 * /open_manipulator/control_period: 0.01
 * /open_manipulator/moveit_sample_duration: 0.05
 * /open_manipulator/planning_group_name: arm
 * /open_manipulator/using_moveit: False
 * /open_manipulator/using_platform: False
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator (open_manipulator_controller/open_manipulator_controller)

ROS_MASTER_URI=http://localhost:11311

process[open_manipulator-1]: started with pid [9820]
[ INFO] [1544506914.862653563]: Ready to simulate /open_manipulator on Gazebo
```
**NOTE** : In OpenManipulator controller for gazebo simulation, Joint and Gripper Dynamixel are not enable, following messages will not display :  
Joint Dynamixel ID : 11, Model Name : XM430-W350  
Joint Dynamixel ID : 12, Model Name : XM430-W350  
Joint Dynamixel ID : 13, Model Name : XM430-W350  
Joint Dynamixel ID : 14, Model Name : XM430-W350  
Gripper Dynamixel ID : 15, Model Name :XM430-W350
{: .notice--info}


## [Launch gazebo](#launch-gazebo)

Load an OpenManipulator on Gazebo simulator and click Play button `▶`.

  ```
  $ roslaunch open_manipulator_gazebo open_manipulator_gazebo.launch
  ```

A red box is pointing end-effector link.

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gazebo_1.png)

Enter `rostopic list` to list up the activated topics.

  ```
  /clock
  /gazebo/link_states
  /gazebo/model_states
  /gazebo/set_link_state
  /gazebo/set_model_state
  /open_manipulator/gripper/kinematics_pose
  /open_manipulator/gripper_position/command
  /open_manipulator/gripper_sub_position/command
  /open_manipulator/joint1_position/command
  /open_manipulator/joint2_position/command
  /open_manipulator/joint3_position/command
  /open_manipulator/joint4_position/command
  /open_manipulator/joint_states
  /open_manipulator/option
  /open_manipulator/states
  /rosout
  /rosout_agg
  ```
Open an [open_manipulator_control_gui](/docs/en/platform/openmanipulator/#gui-program)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gazebo_2.png)


# [How to Control on OpenCR](#how-to-control-on-opencr)

OpenManipulator is compatible with **OpenCR**. We offer API to easily control manipulator.
This API supports Dynamixel, Dynamixel X including protocol 1.0 and 2.0. Furthermore, this code can be used Friends of OpenManipulator.
User can make thier code in **Arduino IDE** and simulate or control using **Processing** GUI.

<iframe width="560" height="315" src="https://www.youtube.com/embed/fT1Wv6qHknI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [Setup](#setup) 

Connect micro USB (connected to PC), Dynamixel(OpenManipulator), and 12V Power to OpenCR as shown below. 

<img src="/assets/images/platform/openmanipulator/OpenManipulator_opencr_setup.png" width="500">

Please refer the detailed description of [OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/)


## [Arduino IDE](#arduino-ide)

Download Arduino IDE and load OpenCR board on it

- [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

Find example source codes.

Go to `Examples` → `OpenManipulator` → `example` → `Chain` → `open_manipulator_chain` on Arduino IDE for OpenCR.

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_arduino.png)

## [Processing](#processing)

Download Processing and load OpenCR board on it

- [Download Processing](https://processing.org/download/)

Open Processing and Go to `Tools` → `Add Tool..`. Search `ControlP5` and install it.

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_1.png)

Download processing source code for OpenManipulator. 

```
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_processing.git
```

Open processing source code file 
(`open_manipulator_processing`>`Chain`>`Chain.pde`) on Processing IDE, and Run it.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_2.png)

## [Basic Manipulation on OpenCR](#basic-manipulation-on-opencr)
 
**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

### [Control Interface](#control-interface)
  The user can use processing program to manipulate the OpenManipulator.  
  To manipulate the OpenManipulator, click the toggle button to `CONTROLLER ON`.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_3.png)  

  The user can manipulate the OpenManipulator in the [joint space]{: .popup}.  
  Set the joint angles. Then click the `SEND JOINT ANGLE` button. And set the gripper parameter. Then click the `SET GRIPPER` button.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_4.png)  

  The user can manipulate the OpenManipulator in the ([task space]{: .popup}). Click the `TASK SPACE CONTROL` button to change the tab.  
  Click the desired direction button to manipulate the OpenManipulator.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_5.png)

### [Teleoperation RC100](#teleoperation-rc100)
  
  <iframe width="560" height="315" src="https://www.youtube.com/embed/FGHBMJByJ7k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

  The settings for [ROBOTIS RC-100B][rc100] controller is included in the OpenCR firmware for OpenManipulator. This controller can be used with the Bluetooth module [BT410][bt410]. 
  ![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_teleop.png)

### [Hand guiding](#hand-guiding)
  The user can make the demonstration using hand guiding function.  

  <iframe width="560" height="315" src="https://www.youtube.com/embed/9mE9QgAro8A" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  
  1. Click the `HAND GUIDING` button to change the tab.
  2. Holds the OpenManipulator by hand and click the toggle button to `TORQUE OFF`.   
  3. Move the OpenManipulator to the desired pose by hand.
  4. Click the `SAVE JOINT POSE` to save the present pose.
  5. Repeat step 3 and 4 to create the demonstration.
  6. Click the toggle button to `TORQUE ON`
  7. Click the `MOTION START` button to start the saved poses.

  Click the toggle button to `MOTION REPEAT ON` if you want to repeat the demonstration.  
  The total time of the trajectory between saved poses is the same as 2 seconds.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_6.png)


# [Camera Application](#camera-application)

**Coming Soon**

# [Tool Modification](#tool-modification)

## [Vacuum Gripper](#vaccum-gripper)

**Coming Soon**

## [Pen Holder](#pen-holder)

**Coming Soon**


# [Mobile Manipulation](#mobile-manipulation)

  <iframe width="560" height="315" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/P82pZsqpBg0" frameborder="0" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/DLOq8yNcCoE" frameborder="0" allowfullscreen></iframe>

  **TIP**: You can get a more information about it in [Manipulation section of TurtleBot3](/docs/en/platform/turtlebot3/manipulation/#manipulation)
  {: .notice--success}

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
  {: .notice--success}

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
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/

[open_manipulator_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_msgs_GetJointPosition/
[open_manipulator_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_GetKinematicsPose/
[open_manipulator_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_msgs_SetJointPosition/
[open_manipulator_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_msgs_SetKinematicsPose/
[open_manipulator_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_msgs_SetActuatorState/
[open_manipulator_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_msgs_SetDrawingTrajectory/

[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[open_manipulator_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_msgs_KinematicsPose/
[open_manipulator_msgs/OpenManipulatorState]: /docs/en/popup/open_manipulator_msgs_OpenManipulatorState/
[std_msgs::String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/open_manipulator_coordinates/
[joint space]: /docs/en/popup/open_manipulator_coordinates/