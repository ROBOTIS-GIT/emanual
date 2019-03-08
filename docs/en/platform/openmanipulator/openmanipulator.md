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

![](/assets/images/platform/openmanipulator/OpenManipulator_Introduction.jpg)

ROS-enabled OpenManipulator is a full open robot platform consisting of **OpenSoftware**​, **OpenHardware** and **OpenCR(Embedded board)​**.

## [OpenSoftware](#opensoftware)
OpenManipulator are based on ROS ​and OpenSource. ROS official hardware platform ,TurtleBot series has been supporting ‘TurtleBot Arm’. The OpenManipulator has full hardware compatibility with TurtleBot3​. Users can also control it more easily by linking it with the MoveIt! package. Even if you do not have an actual robot, you can control the robot in the Gazebo simulator​.

## [OpenHardware](#openhardware)
OpenManipulator is an open-hardware oriented platform​. Most of the components are uploaded as [STL files](http://www.robotis.com/service/download.php?no=690) so that users can easily 3d print them. It also allows users to modify the length of the links or the design of the robot for their own purposes. OpenManipulator is made of **Dynamixel X ​Series** which is used in TurtleBot 3.
![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_OnShape.png)

## [OpenCR (Embedded board)](#opencr-embedded-board)
OpenManipulator can also be controlled using [OpenCR] (Open-source Control module for ROS), the control board used in TurtleBot3. The computing power and real-time controllability of OpenCR can support forward and inverse kinematics, and [profile control](http://emanual.robotis.com/docs/en/dxl/x/xm430-w350/#profile-acceleration108) examples. Moreover, OpenCR is compatible with many functions provided by ROS through message-communicating with ROS. OpenCR wil support ROS 2.0 in the near future.

## [Dynamixel Examples](#dynamixel-examples)

OpenManipulator is composed of [Dynamixel X series](http://emanual.robotis.com/docs/en/dxl/x/xm430-w350/) and [3D printing parts](http://www.robotis.com/service/download.php?no=767). Dynamixel has a modular form and adopts the daisy chain method. It allows users to easily add or remove joints for their own use. Taking advantage of this characteristic, users can build seven different types of OpenManipulator robots: Chain, SCARA, Link, Planar, Delta, Stewart and Linear.

## [Introduction Video](#introduction-video)

<iframe src="https://player.vimeo.com/video/236147296" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
<p><a href="https://vimeo.com/236147296">ROSCon 2017 Vancouver Day 1: Introducing OpenManipulator; the full open robot platform</a> from <a href="https://vimeo.com/osrfoundation">OSRF</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

<iframe width="560" height="315" src="https://www.youtube.com/embed/B2pnXtooKOg" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

# [Specification](#specification)

## [Hardware Specification](#hardware-specification)

| Items               | Unit    | RM-X52-TNM                              |
|:--------------------|:--------|:----------------------------------------|
| **Actuator**        |         | Dynamixel XM430-W350-T                  |
| **Input Voltage**   | V       | 12                                      |
| **DOF**             | -       | 5 (4 DOF + 1 DOF Gripper)               |
| **Payload**         | g       | 500                                     |
| **Speed(Joint)**    | RPM     | 46                                      |
| **Weight**          | kg (lb) | 0.70  (1.54)                            |
| **Reach**           | mm (in) | 380   (14.9)                            |
| **Gripper Stroke**  | mm (in) | 20~75 (0.79~2.95)                       |
| **Communication**   | -       | TTL Level Multidrop BUS                 |
| **Software**        | -       | ROS, Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -       | PC, OpenCR                              |

## [Dimension](#dimension)

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_spec_side.png)

<!-- ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_spec_gripper.jpg) -->

## [Repeatability](#repeatability)

** Coming Soon **

# [Getting Started](#getting-started)
This chapter is for users who are new to OpenManipulator. The manual has an enormous amount of content, but this chapter explains how information is divided.

## [About OpenManipulator](#about-openmanipulator)
First of all, collect information from the Overview and Specifications pages to get an overall understanding of OpenManipulator.

## [OpenManipulator Setup](#openmanipulator-setup)
When you have enough understanding about OpenManipulator from above step, here are the hardware and software setups. It is recommended to proceed in the following order.

1. [Hardware Setup](/docs/en/platform/openmanipulator/#hardware-setup): The OpenManipulator is delivered as a non-assembled part to the box. Assemble the OpenManipulator according to the instructions.  
[U2D2](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3288&keyword=u2d2) + [U2D2 Power Hub Board](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3332&GC=GD0B01) or [OpenCR](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3289&GC=GD0B0100) is required to operate OpenManipulator.
Please prepare [U2D2](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3288&keyword=u2d2) + [U2D2 Power Hub Board](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3332&GC=GD0B01) or [OpenCR](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3289&GC=GD0B0100) when you want to operate on ROS environment, prepare [OpenCR](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3289&GC=GD0B0100) when you want to operate on embedded system.
In both case,  [SMPS 12V5A](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=1369&keyword=smps) is required to supply powers to DYNAMIXEL.

2. [Software Setup](/docs/en/platform/openmanipulator/#pc-setup): If you want to run OpenManipulator in ROS environment, please install Linux, ROS and ROS package on PC according to [PC Setup](/docs/en/platform/openmanipulator/#pc-setup) chapter. If you want to run the OpenManipulator on an embedded system, install the software on your PC and set up OpenCR by following the [How to control on OpenCR](/docs/en/platform/openmanipulator/#how-to-control-on-opencr) chapter.

<img src="/assets/images/platform/openmanipulator/OpenManipulator_all_setup.png" width="500">

## [Let's try basic manipulation](#lets-try-basic-manipulation)
Once you have completed the above steps, run OpenManipulator through the provided Controller package. You can command the OpenManipulator to move specific position via ROS messages. As package for publishing messages, we provid the following examples.

- [GUI Program](/docs/en/platform/openmanipulator/#gui-program)
- [Teleoperation](/docs/en/platform/openmanipulator/#teleoperation)

OpenManipulator can also be operated using MoveIt!. You can run the controller package that uses MoveIt! by changing the variables in the launch file of the controller package. Please refer to the following chapters and try out various motions with MoveIt!.

- [MoveIt!](/docs/en/platform/openmanipulator/#moveit)

If you want to use the embedded system (OpenCR) to operate the OpenManipulator, you can use the Processing and RC100 controllers to perform various manipulations by referring to the following chapters.

- [Basic Manipulation on OpenCR](/docs/en/platform/openmanipulator/#basic-manipulation-on-opencr)


![](/assets/images/platform/openmanipulator/OpenManipulator_basic_manipul.png)

## [Challenge Various Applications](#challenge-various-applications)

We provide examples of AR marker recognition using Astra pro, Realsence D435, and Raspberry Pi Camera V2. Refer the example below to challenge the camera-based manipulation applications.

- [Camera Application](/docs/en/platform/openmanipulator/#camera-application)

We are proposing a way to replace and manipulate tool(gripper) of manipulator to take advantage of OpenManipulator for a wider range of applications. Try the new application using the Pen holder or Vacuum gripper as shown in the example below, and create your own tool to challenge more applications.

- [Tool Modiffication](/docs/en/platform/openmanipulator/#tool-modiffication)

OpenManipulator has a complete hardware combination with Turtlebot3 waffle. Challenge your mobile manipulation by assembling TurtleBot3 waffle and OpenManipulator.

- [Mobile Manipulation](/docs/en/platform/openmanipulator/#mobile-manipulation)

![](/assets/images/platform/openmanipulator/OpenManipulator_application.png)

## [Let's design my own manipulator](#lets-design-my-own-manipulator)

Modify the hardware(DOF, structure) and software(kinematics, trajectory) of OpenManipulator and manipulate your own OpenManipulator.  
We provide a variety of [OpenManipulator Friends](/docs/en/platform/openmanipulator/#friends) as examples of hardware transformations. Try to control the manipulator with different structure and enjoy it. And try out the kinematics solving algorithm for the different structure.

<img src="/assets/images/platform/openmanipulator/OpenManipulator_friends.png" width="800">

# [Assembly](#assembly)

## [Part Lists](#part-lists)

- Necessary Parts

|                   | Part Name              | Quantity |
|:------------------|:-----------------------|:--------:|
| **Chassis Parts** | LINK FRAME(LONG)       |    1     |
| .                 | LINK FRAME(SHORT)      |    1     |
| .                 | RAIL BRACKET(LEFT)     |    1     |
| .                 | RAIL BRACKET(RIGHT)    |    1     |
| .                 | PALM GRIPPER           |    2     |
| .                 | LINK ROD               |    2     |
| .                 | FLANGE BUSH            |    4     |
| .                 | CRANK ARM              |    1     |
| .                 | RAIL BLOCK             |    2     |
| .                 | FR12-S101-K            |    1     |
| .                 | FR12-S102-K            |    2     |
| .                 | FR12-H101-K            |    2     |
| .                 | FR12-H104-K            |    1     |
| **Actuators**     | Dynamixel XM430-W350-T |    5     |
| **Cables**        | CABLE-X3P-100          |    1     |
| .                 | CABLE-X3P-180          |    2     |
| .                 | CABLE-X3P-240          |    2     |
| **Tools**         | Screw Driver           |    1     |
| .                 | Wrench-1.5             |    1     |
| .                 | Wrench-2.0             |    1     |
| .                 | Wrench-2.5             |    1     |
| **Miscellaneous** | X-SP                   |    24    |
| .                 | NUT-M2.5               |    16    |
| .                 | NUT-M3                 |    4     |
| .                 | FHS-M2.5x14            |    12    |
| .                 | WB-M2x3                |    38    |
| .                 | WB-M2x4                |    4     |
| .                 | WB-M2.5x4              |    4     |
| .                 | WB-M2.5x6              |    8     |
| .                 | WB-M2.5x8              |    16    |
| .                 | WB-M2.5x12             |    8     |
| .                 | WB-M2.5x20             |    4     |
| .                 | WB-M3x10               |    4     |
| .                 | DC12-IDLER             |    3     |
| .                 | DC12-IDLER-CAP         |    3     |
| .                 | DC12-P-BEARING         |    3     |
| .                 | RUBBER PAD             |    2     |


- Optional Parts

|            | Part Name                                                                                        | Quantity |
|:-----------|:-------------------------------------------------------------------------------------------------|:--------:|
| **Powers** | [SMPS 12V5A](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=1369&keyword=smps)        |    1     |
| **Boards** | [OpenCR](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3289&GC=GD0B0100)             |    1     |
| .          | [U2D2](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3288&keyword=u2d2)              |    1     |
| .          | [U2D2 Power Hub Board](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3332&GC=GD0B01) |    1     |
| **Plate**  | [Base Plate-02](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3331)                  |    1     |
| .          | .                                                                                                |    1     |


<!-- - [Parts of OpenManipulator](https://docs.google.com/a/robotis.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit?usp=sharing) -->

<!-- [DIY Manual](https://drive.google.com/open?id=1c5U0v2dQhYiulqiWI0VQMameG82WCc-4rl6J6zlQejA) -->

## [3D Printed Parts](#3d-printed-parts)

We provide the 3D CAD files of OpenManipulator parts. User can easily modify and print them.

- 3D CAD Files ([Onshape](http://www.robotis.com/service/download.php?no=690), [Thingiverse](https://www.thingiverse.com/thing:3069574))

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_OnShape.png)

## [Assembly Manual](#assembly-manual)

OpenManipulator is delivered as unassembled parts in the box. Follow the following instruction to assemble it.

- `Download PDF` [Assembly Manual for OpenManipulator](http://www.robotis.com/service/download.php?no=1255)

- `Assembly Video`

<iframe width="560" height="315" src="https://www.youtube.com/embed/eJTIeDepmNo" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [Connection](#connection)

Connect micro USB (connected to PC), Dynamixel(OpenManipulator), and 12V Power to U2D2 and U2D2 power hub board as shown below.

<img src="/assets/images/platform/openmanipulator/OpenManipulator_u2d2_setup.png" width="500">

**NOTE** : U2D2 and U2D2 power hub board are required when operating OpenManipulator using U2D2.
{: .notice}

**TIP** : You can replace U2D2 with OpenCR1.0. In this case, please follow the instruction in [OpenCR Settings](#opencr-settings) section.
{: .notice--success}

# [[ROS] PC Setup](#ros-pc-setup)

**NOTE** : The following instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

**WARNING** : If you would like to control OpenManipulator on OpenCR (Embedded board) instead of using ROS, please set it up as described in [How to Control on OpenCR](/docs/en/platform/openmanipulator/#how-to-control-on-opencr).
{: .notice--warning}


## [Install Ubuntu on PC](#install-ubuntu-on-pc)

Download and install `Ubuntu 16.04` on your PC.

- [Download link](https://www.ubuntu.com/download/alternative-downloads)

If you need more help with installing Ubuntu, check out the step-by-step guide from the link below.

- [Install ubuntu desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

## [Install ROS on PC](#install-ros-on-pc)

![](/assets/images/platform/turtlebot3/logo_ros.png)

The following script will allow you to simplify the ROS installation procedure. Run the following command in a terminal window. The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key to open a terminal is `Ctrl`+`Alt`+`t`. After installing ROS, please reboot PC.

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
Install dependent packages for OpenManipulator. Run the following command in a terminal window.

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
{: .notice--info}

``` bash
$ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-industrial-core
```

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git
$ cd ~/catkin_ws && catkin_make
```

If the catkin_make command has been completed without any errors, all the preparations for using OpenManipulator are done.

## [U2D2 Settings](#u2d2-settings)

**NOTE** : If you are using OpenCR instead of U2D2 to connect to PC, please refer to OpenCR Setting section.
{: .notice--info}

The following commands allow to use USB port

``` bash
$ rosrun open_manipulator_controller create_udev_rules
```

**TIP**: This entered command set USB latency timer to **1 ms**. If you would like to see the setting, run the following command in a terminal.  
`cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer`
{: .notice--success}

## [OpenCR Settings](#opencr-settings)
This section explains how to set up OpenCR as a communication board between ROS Packages of PC and DYNAMIXEL of OpenManipulator.  
If you want to operate OpenManipulator on embedded system (OpenCR) without ROS, please refer [how to control on opencr](/docs/en/platform/openmanipulator/#how-to-control-on-opencr).

Connect micro USB (connected to PC), Dynamixel(OpenManipulator), and 12V Power to OpenCR as shown below.

<img src="/assets/images/platform/openmanipulator/OpenManipulator_opencr_setup.png" width="500">

Please refer the detailed description of [OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/)

Download Arduino IDE and load OpenCR board on it

- [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

Find `usb to dxl` example source codes.

Go to `Examples` → `OpenCR` → `10.Etc` → `usb_to_dxl` on Arduino IDE for OpenCR.

![](/assets/images/platform/openmanipulator/OpenManipulator_opencr_utd_setup.png)

Upload the `usb to dxl` example source to OpenCR.

# [[ROS] Controller](#ros-controller)

The OpenManipulator controller provides basic manipulation of OpenManipulator. You can control the dynamixel of OpenManipulator and check states of OpenManipulator through [messages](/docs/en/platform/openmanipulator/#message-list) of the controller.

**NOTE**: This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

## [Run roscore](#run-roscore)

Run roscore.

``` bash
$ roscore
```

## [Launch Controller](#launch-controller)

Before you launch controller, let's check `open_manipulator_controller` launch file in `open_manipulator_controller` package.

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
        <arg name="robot_name"      value="$(arg use_robot_name)"/>
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

**Parameters List** : The parameters list is used to set control environments.
- `use_robot_name`
- `dynamixel_usb_port`
- `dynamixel_baud_rate`
- `control_period`
- `use_platform`
- `use_moveit`
- `planning_group_name`
- `moveit_sample_duration`

`use_robot_name` is a parameter to set manipulator name(namespace of ROS messages).  
`dynamixel_usb_port` is a parameter to set use port to connected with Dynamixel of OpenManipulator. If you use U2D2, it should be set **/dev/ttyUSB@**. If you use OpenCR, it should be set **/dev/ttyACM@** (@ indicates the port number connected to the Dynamixel).  
`dynamixel_baud_rate` is a parameter to set baud rate of dynamixel. default baud rate of dynamixel used in OpenManipulator is 1000000.  
`control_period` is a parameter to set communication period between dynamixel and PC (control loop time).  
`use_platform` is a parameter that sets whether to use the actual OpenManipulator or OpenManipulator simulation. please refer [Gazebo Simulation](/docs/en/platform/openmanipulator/#gazebo-simulation) chapter.  
`use_moveit`, `planning_group_name` and `moveit_sample_duration` are parameters supposed to set loading [move_group](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/move_group_interface/move_group_interface_tutorial.html) package. please refer [MoveIt!](/docs/en/platform/openmanipulator/#moveit) chapter.

After set the parameters, launch the OpenManipulator controller to start [basic manipulation](/docs/en/platform/openmanipulator/#basic-manipulation).

``` bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch
```

**WARNING**: It is recommended to place OpenManipulator at the following pose and start the controller so that each component of OpenManipulator does not conflict.  
<img src="/assets/images/platform/openmanipulator/open_manipulator_start_pose.png" width="250">
<!-- ![](/assets/images/platform/openmanipulator/open_manipulator_start_pose.png) -->
{: .notice--warning}

If the OpenManipulator controller has been launched successfully, the terminal will show the following message.

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
- If you can't load Dynamixels, please check your Dynamixels settings using the following command from the Dynamixel-Workbench packages.   
`rosrun dynamixel_workbench_controllers find_dynamixel /dev/ttyUSB0`  
Even if you can't find any Dynamixels, please check firmware to use ROBOTIS software ([R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/) or [R+ Manager 1.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/))
- If you would like to change Dynamixel ID, please check [`OpenManipulator.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/be2859a0506b4e941a19435c0a07562b41768a27/open_manipulator_libs/src/OpenManipulator.cpp#L40) in the open_manipulator_lib folder. The default ID is **11, 12, 13, 14** for joints and **15** for the gripper
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

**NOTE**: open_manipulator_controller is compatible with [Protocol 2.0](/docs/en/dxl/protocol2/). Since [Protocol 1.0](/docs/en/dxl/protocol1/) doesn't support SyncRead instructions that has access to multiple Dynamixels simultaneously. Protocol 2.0 supports [`MX2`](/docs/en/dxl/mx/mx-64-2/), `X` and `Pro` series, but it does not support `AX`, `RX` and `EX`.
{: .notice--info}

## [Check Setting](#check-setting)

### [Manipulator Description](#manipulator-description)

{% capture notice_01 %}
**NOTE**:
- The below instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [Open Manipulator controller](/docs/en/platform/openmanipulator/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Publish a topic message to check the OpenManipulator setting.

``` bash
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
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be run on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Load OpenManipulator on RViz.

``` bash
$ roslaunch open_manipulator_description open_manipulator_rviz.launch
```

{% capture notice_01 %}
**NOTE**:
- If you launched the [OpenManipulator controller](/docs/en/platform/openmanipulator/#launch-controller) before launching the open_manipulator_controller file, the robot model on Rviz would be synchronized with the actual robot.
- If the user would like to check only model of OpenManipulator without control the actual OpenManipulator, the user can launch the Rviz without the OpenManipulator controller.
The user can change each joint by GUI, if the user launch only Rviz by executing the following command :
`$ roslaunch open_manipulator_description open_manipulator_rviz.launch use_gui:=true`

{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/openmanipulator/OpenManipulator_rviz.png)

## [Message List](#message-list)

{% capture notice_01 %}
**NOTE**:
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [Open Manipulator controller](/docs/en/platform/openmanipulator/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Open Manipulator Controller provides **topic** and **service** messages to control manipulator and check the states of manipulator.

### [Topic](#topic)

#### [Topic Monitor](#topic-monitor)

In order to check the topics of OpenManipulator controller, you can use [rqt][rqt] provided by ROS. Rqt is a Qt-based framework for GUI development for ROS. Rqt allows users to easily see topic status by displaying all topics on a topic list. You can see topic name, type, bandwidth, Hz and value on rqt.

Run rqt.
``` bash
$ rqt
```
 <img src="/assets/images/platform/openmanipulator/rqt_om.png" width="1000">

**TIP**: If rqt is not displayed, select the `plugin` -> `Topics` -> `Topic Monitor`.
{: .notice--success}

Topics without their checkboxes clicked will not be monitored. To monitor topics, click on the checkboxes next to topic names.

 <img src="/assets/images/platform/openmanipulator/rqt_1.png" width="1000">

If you would like to see more detail topic message, click the `▶` button next to each checkbox.

 <img src="/assets/images/platform/openmanipulator/rqt_2.png" width="1000">

[rqt]: http://wiki.ros.org/rqt

#### [Published Topic List](#published-topic-list)

**Published Topic List** :
A list of topics that the open_manipulator_controller publishes.
- `/open_manipulator/joint_states`
- `/open_manipulator/gripper/kinematics_pose`
- `/open_manipulator/states`

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}

`/open_manipulator/joint_states`([sensor_msgs/JointState]{: .popup}) is a message indicating the states of joints of OpenManipulator. **"name"** indicates joint component names.  **"effort"** shows currents of the joint Dynamixels. **"position"** and **"velocity"** indicates angles and angular velocities of joints.

 <img src="/assets/images/platform/openmanipulator/rqt_joint_states.png" width="1000">

`/open_manipulator/gripper/kinematics_pose`([open_manipulator_msgs/KinematicsPose]{: .popup}) is a message indicating pose (position and orientation) in [task space]{: .popup}. **"position"** indicates the x, y and z values of the center of the end-effector (tool). **"Orientation"** indicates the direction of the end-effector (tool) as quaternion.

 <img src="/assets/images/platform/openmanipulator/rqt_kinematic_pose.png" width="1000">

`/open_manipulator/states`([open_manipulator_msgs/OpenManipulatorState]{: .popup}) is a message indicating the status of OpenManipulator. **"open_manipulator_actuator_state"** indicates whether actuators (Dynamixels) are enabled ("ACTUATOR_ENABLE") or disabled ("ACTUATOR_DISABLE"). **"open_manipulator_moving_state"** indicates whether OpenManipulator is moving along the trajectory ("IS_MOVING") or stopped ("STOPPED").

 <img src="/assets/images/platform/openmanipulator/rqt_states.png" width="1000">

#### [Subscribed Topic List](#published-topic-list)

**Subscribed Topic List**:
A list of topics that the open_manipulator_controller subscribes.
- `/open_manipulator/option`

**NOTE**: These topics are messages for checking the status of the robot regardless of the robot's motion.
{: .notice--info}

`/open_manipulator/option`([std_msgs::String]{: .popup}) is used to set OpenManipulator options.
- **"print_open_manipulator_setting"** : request the open_manipulator_controller controller to display "Manipulator Description".

 <img src="/assets/images/platform/openmanipulator/rqt_option.png" width="1000">


In addition, you can monitor topics through rqt whenever you have a topic added in your controller.


### [Service](#service)


#### [Service Server List](#service-server-list)

**NOTE**: These services are messages to operate OpenManipulator or to change the status of the Dynamixels of OpenManipulator.
{: .notice--info}


**Service Server List** :
A list of service servers that open_manipulator_controller has.

- `/open_manipulator/goal_joint_space_path` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup}. The user inputs the angle of the target joint and the total time of the trajectory.


- `/open_manipulator/goal_task_space_path` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_position_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_orientation_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_joint_space_path_from_present` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory from present joint angle in the [joint space]{: .popup}. The user inputs the angle of the target joint to be changed and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_from_present` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the task space. The user inputs the kinematics pose to be changed of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_from_present_position_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. The user inputs the kinematics pose(position only) of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_task_space_path_from_present_orientation_only` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory from present kinematics pose in the [task space]{: .popup}. The user inputs the kinematics pose(orientation only) of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

- `/open_manipulator/goal_tool_control` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to move the tool of OpenManipulator.

- `/open_manipulator/set_actuator_state` ([open_manipulator_msgs/SetActuatorState]{: .popup})  
The user can use this service to control the state of actucators.   
If the user set true at set_actuator_state valuable, the actuator will be enabled.  
If the user set false at set_actuator_state valuable, the actuator will be disabled.

- `/open_manipulator/goal_drawing_trajectory` ([open_manipulator_msgs/SetDrawingTrajectory]{: .popup})  
The user can use this service to create a drawing trajectory. The user can create the circle, the rhombus, the heart, and the straight line trajectory.

# [[ROS] Operation](#ros-operation)

<iframe width="560" height="315" src="https://www.youtube.com/embed/dctx7Y6zNKA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [GUI Program](#gui-program)

{% capture notice_01 %}
**NOTE**:
- This instructions has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [Open Manipulator controller](/docs/en/platform/openmanipulator/#launch-controller) instructions before running the instruction below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

  You can use the GUI program to manipulate OpenManipulator. Launch `open_manipulator_control_gui` node.  This program shows the status of and allows users to control OpenManipulator.

  ``` bash
  $ roslaunch open_manipulator_control_gui open_manipulator_control_gui.launch
  ```
  To controll OpenManipulator, first click on the `Timer Start` button.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_GUI.png)  

  To check the status of the OpenManipulator (joint states, kinematics pose).  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_GUI2.png)  

  To manipulate the OpenManipulator in the [joint space]{: .popup}. Enter the joint angles and total time of the trajectory. Then click the `send` button.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_GUI3.png)  

  To manipulate the OpenManipulator in the [task space]{: .popup}. Enter the kinematics pose of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory. Then click the `send` button.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_GUI4.png)  

  To create a drawing trajectory with the OpenManipulator. First, choose the drawing trajectory type(line, circle, rhombus, heart). And enter the parameters according to the drawing trajectory type and the total time of the drawing trajectory. Then click the `send` button.  
  ![](/assets/images/platform/openmanipulator/OpenManipulator_GUI5.png)  

## [Teleoperation](#teleoperation)
{% capture notice_01 %}
**NOTE**:
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be run on PC with ROS packages installed in. Please run the instruction below on your PC ROS packages installed in.
- Make sure to run [Open Manipulator controller](/docs/en/platform/openmanipulator/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

<iframe width="560" height="315" src="https://www.youtube.com/embed/FGHBMJByJ7k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [Keyboard](#keyboard)

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

  Launch `open_manipulator_teleop_keyboard` node for simple teleoperation test using the keyboard.

  ``` bash
  $ roslaunch open_manipulator_teleop open_manipulator_teleop_keyboard.launch
  ```
  If the node is successfully launched, the following instruction will appeare in the terminal window.

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

Install packages for teleoperation using PS4 joystick.

``` bash
$ sudo apt-get install ros-kinetic-joy ros-kinetic-joystick-drivers ros-kinetic-teleop-twist-joy
$ sudo pip install ds4drv
```

Connect PS4 joystick to the PC via Bluetooth using the following command

``` bash
$ sudo ds4drv
```

Enter pairing mode with PS4 by pressing and holding Playstation button + share button for 10 sec. If the light on PS4 turns blue, enter the following commands in terminal and control OpenManipulator.

``` bash
$ export ROS_NAMESPACE=/open_manipulator
$ roslaunch teleop_twist_joy teleop.launch

$ roslaunch open_manipulator_teleop open_manipulator_teleop_joystick.launch
```

### [XBOX 360 Joystick](#xbox-360-joystick)

Install packages for teleoperation using XBOX 360 joystick.

``` bash
$ sudo apt-get install xboxdrv ros-kinetic-joy ros-kinetic-joystick-drivers ros-kinetic-teleop-twist-joy
```
Connect XBOX 360 joystick to the PC with Wireless Adapter or USB cable, and launch teleoperation packages for XBOX 360 joystick.

``` bash
$ sudo xboxdrv --silent

$ export ROS_NAMESPACE=/open_manipulator
$ roslaunch teleop_twist_joy teleop.launch

$ roslaunch open_manipulator_teleop open_manipulator_teleop_joystick.launch
```

## [MoveIt!](#moveit)

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

Before you launch controller using MoveIt!, check `open_manipulator_controller` launch file in `open_manipulator_controller` package.

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
        <arg name="robot_name"      value="$(arg use_robot_name)"/>
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
The below parameters can be used to load [move_group](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/move_group_interface/move_group_interface_tutorial.html) package.
- `use_moveit`
- `planning_group_name`
- `moveit_sample_duration`

`use_moveit` is a parameter to set whether to use MoveIt!  
`planning_group_name` is a parameter to set in [setup_assistant](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/setup_assistant/setup_assistant_tutorial.html#step-4-add-planning-groups)  
`moveit_sample_duration` is a parameter to set sampling time when joint trajectory is planned from MoveIt!

After set the parameters, launch the open_manipulator_controller.

  ``` bash
  $ roslaunch open_manipulator_controller open_manipulator_controller.launch use_moveit:=true
  ```

**Warning!**     
When launching the controller to use MoveIt!, [OpenManipulator launch file](/docs/en/platform/openmanipulator/#launch-controller) must be turned off.
{: .notice--warning}

  ![](/assets/images/platform/openmanipulator/moveit_launch.png)  

**Service Server List** :
A list of MoveIt!-related service server that open_manipulator_controller has.

- `/open_manipulator/moveit/get_joint_position` ([open_manipulator_msgs/GetJointPosition]{: .popup})  
The user can use this service to receives a joint position which is calculated by move_group.  

- `/open_manipulator/moveit/get_kinematics_pose` ([open_manipulator_msgs/GetKinematicsPose]{: .popup})  
The user can use this service to receives a kinematics pose which is calculated by move_group.

- `/open_manipulator/moveit/set_joint_position` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup} by move_group. The user inputs the angle of the target joint and the total time of the trajectory.

- `/open_manipulator/moveit/set_kinematics_pose` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup} by move_group. The user inputs the kinematics pose(orientation only) of the OpenManipulator end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

**TIP**: If you would like to use inverse kinematics with `position_only`, check `open_manipulator_moveit` -> `config` -> `kinematics.yaml` and set `position_only_ik` parameter to **True**.
{: .notice--success}

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_1.png)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_2.png)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_3.png)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_4.png)


# [[ROS] Simulation](#ros-simulation)

{% capture notice_01 %}
**NOTE**:
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be run on PC with ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Controller for gazebo](#controller-for-gazebo)

Launch the open_manipulator_controller for gazebo simulation.

  ``` bash
  $ roslaunch open_manipulator_controller open_manipulator_controller.launch use_platform:=false
  ```
{% capture notice_01 %}
**NOTE**:
- To control the OpenManipulator in the Gazebo environment using the Open Manipulator Controller, the controller must set the **use_platform** parameter to **false** because it needs to send messages to gazebo instead of Platform.
- If you want to manipulate the OpenManipulator using Moveit within the Gazebo simulator, you should also convert the **use_moveit** to **ture** in open_manipulator_controller launch file.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

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

Load OpenManipulator on Gazebo simulator and click on Play `▶` button.

  ``` bash
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

# [[ROS] Examples](#ros-examples)

## [Camera Application](#camera-application)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

### [Astra Pro](#astra-pro)

#### Overview
![](/assets/images/platform/openmanipulator/OpenManipulator_camera_Astra_pro.png)  

The [Astra Series](https://orbbec3d.com/product-astra/) was designed to further improve on the attributes that set Orbbec 3D cameras apart from existing 3D cameras on the market. Astra 3D cameras provide computer vision that enables dozens of functions such as face recognition, gesture recognition, human body tracking, three-dimensional measurement, environment perception, and three-dimensional map reconstruction.

#### Specifications

| Items                                 | Specifications               |
|:--------------------------------------|:-----------------------------|
| RGB Image Resolution and Frame Rate   | 1280 x 720, @30fps           |
| Depth Imgae Resolution and Frame Rate | 640 x 480, @30fps            |
| FOV (Field-of-View)                   | 60°H x 49.5°V x 73°D         |
| Range                                 | 0.6m - 8m                    |
| USB Port                              | USB 2.0                      |
| Dimensions                            | 165mm x 30mm x 40mm          |
| Operating Systems                     | Android/Linux/Windows 7/8/10 |
| SDK                                   | Astra SDK or OpenNI          |
| Microphones                           | 2 (Built - in)               |

#### User Guide

##### Installation
The following commands will install relevant Astra Pro library.
  ``` bash
  $ sudo apt-get install ros-kinetic-rgbd-launch ros-kinetic-libuvc-camera
  ```
  ``` bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/orbbec/ros_astra_camera.git
  $ git clone https://github.com/ROBOTIS-GIT/ros_astra_launch.git
  $ cd ~/catkin_ws && catkin_make
  $ roscd astra_camera && ./scripts/create_udev_rules
  ```
##### Execution  
Run the following command.
  ``` bash
  $ sudo chmod a+rw /dev/bus/usb/${USB}/${PORT}
  $ roslaunch ros_astra_launch astra_pro.launch
  ```

You can use rviz or image_view to verify driver. You can select data topic name related to Astra Pro from drop down menu at the top of the application.
  ``` bash
  $ rqt_image_view
  ```

#### Reference
- [ORBBEC Astra Pro](https://orbbec3d.com/product-astra-pro/)    
- [Astra Pro ROS package](https://github.com/orbbec/ros_astra_camera)

### [Realsense D435](#realsense-d435)

#### Overview
![](/assets/images/platform/openmanipulator/OpenManipulator_camera_Realsense_D435.png)  

The [Intel® RealSense™ Depth Camera D435](https://realsense.intel.com/depth-camera/#D415_D435) is a USB-powered depth camera and consists of a pair of depth sensors, RGB sensor, and infrared projector. It is ideal for makers and developers to add depth perception capability to their prototype development. The D435 is designed to best fit your prototype.

#### Specifications

| Items                                | Specifications                        |
|:-------------------------------------|:--------------------------------------|
| Use Environment                      | Indoor/Outdoor                        |
| RGB Sensor Resolution and Frame Rate | 1920 x 1080 at 30 fps                 |
| RGB Sensor FOV                       | 69.4°(H) x 42.5°(V) x 77°(D) (+/- 3°) |
| Depth Stream Output Resolution       | Up to 1280 x 720                      |
| Depth Stream Output Frame Rate       | Up to 90 fps                          |
| Depth Field of View (FOV)            | 85.2°(H) x 58°(V) x 94°(D) (+/- 3°)   |
| Minimum Depth Distance (Min-Z)       | 0.2m                                  |
| Maximum Range                        | Approx.10 meters                      |
| Dimension                            | 90 mm x 25 mm x 25 mm                 |
| Connectors                           | USB 3.0 Type - C                      |

#### User Guide

##### Installation
The following commands will install relevant Intel® RealSense™ Depth Camera D435 library.
  ``` bash
  $ sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u
  $ sudo apt-get install librealsense2-dev ros-kinetic-rgbd-launch
  ```
  ``` bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/intel-ros/realsense.git
  $ cd ~/catkin_ws && catkin_make
  ```
##### Execution  
Run the following command.
  ``` bash
  $ roslaunch realsense2_camera rs_camera.launch
  ```

You can use rviz or image_view to verify driver. You can select data topic name related to Intel® RealSense™ Depth Camera D435 from drop down menu at the top of the application.
  ``` bash
  $ rqt_image_view
  ```

#### Reference
- [Intel® RealSense™ Depth Camera D435](https://realsense.intel.com/depth-camera/#D415_D435)    
- [Realsense ROS package](https://github.com/intel-ros/realsense)

### [Raspberry Pi Camera V2](#raspberry-pi-camera-v2)

#### Overview
![](/assets/images/platform/turtlebot3/appendix_raspi_cam/Pi-Camera-front.jpg)

Please refer the detailed description of [Raspberry Pi Camera V2](/docs/en/platform/turtlebot3/appendix_raspi_cam/#overview)


#### Specifications

Please refer the detailed Specification of [Raspberry Pi Camera V2](/docs/en/platform/turtlebot3/appendix_raspi_cam/#specifications)

#### User Guide

##### Installation

**Warning!**     
Raspberry pi must be installed before setting up the Raspberry Pi Camera V2.    
Please check this link out. [Raspberry Pi 3 Setup](/docs/en/platform/turtlebot3/raspberry_pi_3_setup/)
{: .notice--warning}

**[Raspberry Pi]** Setting up the camera hardware

``` bash
$ sudo raspi-config
```

![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-1.png)

Select **3 Interfacing Options**    
![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-2.png)

Select **P1 Camera**    
![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-3.png)

Enable camera interface    
![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-4.png)    
![](/assets/images/platform/turtlebot3/appendix_raspi_cam/pi-cam-hardware-setting-5.png)

After **reboot Raspberry Pi**, to test that the system is installed and working, try the following command:

``` bash
$ raspistill -v -o test.jpg
```
The display should show a five-second preview from the camera and then take a picture, saved to the file *test.jpg*

The following commands will install relevant Raspberry Pi Camera packages on your ROS system.

- If you use Ubuntu in Raspberry Pi, enter the following command     
``` bash
$ sudo apt-get install ros-kinetic-compressed-image-transport ros-kinetic-camera-info-manager
```

``` bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/UbiquityRobotics/raspicam_node.git
$ cd ~/catkin_ws && catkin_make
```
##### Execution  

**Warning!**     
Before you run `rqt_image_view` in Remote PC, check your Raspberry Pi and Remote PC whether they are connected. Please check this link out.    
[Raspberry Pi 3 Setup](/docs/en/platform/turtlebot3/raspberry_pi_3_setup/#5-network-configuration)    
[Remote PC Setup](/docs/en/platform/turtlebot3/pc_setup/#network-configuration)
{: .notice--warning}

**[Remote PC]** Run the following command

``` bash
$ roscore
$ rqt_image_view
```

**[Raspberry Pi]** Run the following command.
``` bash
$ roslaunch raspicam_node camerav2_1280x960.launch
```


##### Reference

- [Raspberry Pi Camera](https://www.raspberrypi.org/documentation/hardware/camera/README.md)
- [Getting Started](https://projects.raspberrypi.org/en/projects/getting-started-with-picamera)
- [Pi Camera ROS package](https://github.com/UbiquityRobotics/raspicam_node)

### [AR Marker](#ar-marker)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- The `open_manipulator_perceptions` package requires [`ar_track_alvar`](http://wiki.ros.org/ar_track_alvar) package.
- Make sure to run the [Open Manipulator controller](/docs/en/platform/openmanipulator/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

#### Installation

{% capture notice_01 %}
**NOTE**:
- To use the **Raspberry Pi Camera V2**, install it on the **Remote PC**
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

  ``` bash
  $ sudo apt-get install ros-kinetic-ar-track-alvar ros-kinetic-ar-track-alvar-msgs
  ```
  ``` bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_perceptions.git
  $ cd ~/catkin_ws && catkin_make
  ```

#### Execution
You have to change the parameters according to the type of camera. Run the following command.

##### Astra Pro
  ``` bash
  $ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=astra_pro
  ```
##### Realsense D435
  ``` bash
  $ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=realsense_d435
  ```
##### Raspberry Pi Camera V2
**[Raspberry Pi]**
  ``` bash
  $ roslaunch raspicam_node camerav2_1280x960.launch
  ```
**[Remote PC]**
  ``` bash
  $ roslaunch open_manipulator_ar_markers ar_pose.launch camera_model:=raspicam
  ```

##### Rviz
When the camera recognizes the AR marker, the pose of the AR marker is shown on Rviz.
![](/assets/images/platform/openmanipulator/OpenManipulator_AR_Marker.png)  

## [Mobile Manipulation](#mobile-manipulation)

  <iframe width="560" height="315" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/P82pZsqpBg0" frameborder="0" allowfullscreen></iframe>

  <iframe width="560" height="315" src="https://www.youtube.com/embed/DLOq8yNcCoE" frameborder="0" allowfullscreen></iframe>

  **TIP**: You can get a more information about it in [Manipulation section of TurtleBot3](/docs/en/platform/turtlebot3/manipulation/#manipulation)
  {: .notice--success}

Install dependent packages

  ``` bash
  $ cd ~/catkin_ws/src
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
  $ git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_msgs.git
  $ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
  $ sudo apt-get install ros-kinetic-smach*
  $ cd ~/catkin_ws && catkin_make
  ```

Load a TurtleBot3 Waffle or Waffle Pi with OpenManipulator on RViz.

  **TIP**: TB3_MODEL =  `waffle`, `waffle_pi`
  {: .notice--success}

  ``` bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_description open_manipulator_with_tb3_rviz.launch
  ```

![](/assets/images/platform/openmanipulator/TurtleBot3_with_Open_Manipulator.png)

# [How to Control on OpenCR](#how-to-control-on-opencr)

OpenManipulator is compatible with **OpenCR**. We offer API to easily control manipulator.
This API supports Dynamixel, Dynamixel X including protocol 1.0 and 2.0. Furthermore, this code can be used for Friends of OpenManipulator.
User can make thier code in **Arduino IDE** and simulate or control using **Processing** GUI.

<iframe width="560" height="315" src="https://www.youtube.com/embed/fT1Wv6qHknI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**NOTE**: OpenManipulator controller with OpenCR does not use ROS
The way OpenManipulator is controlled by OpenCR (embedded system) and ROS is completely different. In the method using ROS, the controller runs in PC, but in OpenCR control, the controller runs in OpenCR without ROS.
{: .notice--info}

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

Upload the example source to OpenCR.

**Tip**: If an error of `cmd_read_board_name fail: 0xF020` occurs constantly during upload, please refer to [OpenCR e-manual](http://emanual.robotis.com/docs/en/parts/controller/opencr10/#firmware-recovery-mode) to enter the firmware recovery mode and upload the source code again after entering mode.
.
{: .notice--success}



## [Processing](#processing)

Download Processing and load OpenCR board on it

- [Download Processing](https://processing.org/download/)

Open Processing and Go to `Tools` → `Add Tool..`. Search `ControlP5` and install it.

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing_1.png)

Download processing source code for OpenManipulator.

``` bash
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_processing.git
```

Open processing source code file
(`open_manipulator_processing` → `Chain` → `Chain.pde`) on Processing IDE, and Run it.

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




# [Tool Modification](#tool-modification)
## [Vacuum Gripper](#vaccum-gripper)

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/TR6DS9Zg_5I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Hardware Setup
#### Part List

|                          | Part Name                                      | Quantity | Link                                                                                                                                                                                                                                                                         |
|:-------------------------|:-----------------------------------------------|:---------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **3D Printed Tool Part** | Vacuum Holder                                  | 1        | [Download Link](https://www.thingiverse.com/thing:3069574)                                                                                                                                                                                                                   |
| **Vacuum System**        | ARDUINO 4 RELAYS SHIELD                        | 1        | [shop Link](https://store.arduino.cc/usa/arduino-4-relays-shield)                                                                                                                                                                                                            |
| .                        | 12V Air Pump Motor                             | 1        | [shop Link](https://www.amazon.com/dp/B00DYA21PU/ref=sxbs_sxwds-stppvp_1?pf_rd_p=d45777d6-4c64-4117-8332-1659db52e64f&pd_rd_wg=4GrxM&pf_rd_r=B6N50VB3NHQT92HY91GK&pd_rd_i=B00DYA21PU&pd_rd_w=hP7Ev&pd_rd_r=f1ca7704-2522-4488-a625-16e3a8803027&ie=UTF8&qid=1547619718&sr=1) |
| .                        | UD0640-20-C (Air Tube 6Ø)                      | 1        | [shop Link](https://us.misumi-ec.com/vona2/detail/221000039579/?HissuCode=UD0640-20-C&PNSearch=UD0640-20-C&KWSearch=UD0640-20-C&searchFlow=results2type)                                                                                                                     |
| .                        | UD0860-20-C (Air Tube 8Ø)                      | 1        | [shop Link](https://us.misumi-ec.com/vona2/detail/221000039579/?HissuCode=UD0860-20-C&PNSearch=UD0860-20-C&KWSearch=UD0860-20-C&searchFlow=results2type)                                                                                                                     |
| .                        | MSCNL6-1 (Coupling 6Ø)                         | 1        | [shop Link](https://us.misumi-ec.com/vona2/detail/110300335060/?HissuCode=MSCNL6-1&PNSearch=MSCNL6-1&KWSearch=MSCNL6-1&searchFlow=results2type)                                                                                                                              |
| .                        | MSCNL8-1 (Coupling 8Ø)                         | 2        | [shop Link](https://us.misumi-ec.com/vona2/detail/110300335060/?HissuCode=MSCNL8-1&PNSearch=MSCNL8-1&KWSearch=MSCNL8-1&searchFlow=results2type)                                                                                                                              |
| .                        | MVPKE8 (Suction Cup)                           | 1        | [shop Link](https://us.misumi-ec.com/vona2/detail/110300346620/?HissuCode=MVPKE8&PNSearch=MVPKE8&KWSearch=MVPKE8&searchFlow=results2type)                                                                                                                                    |
| .                        | MHE3-M1H-3/2G-1/8 (Control Valve)              | 1        | [shop Link](https://www.festo.com/cat/en-us_us/products_MH2?CurrentIDCode1=MHE3-M1H-3%2F2G-1%2F8&CurrentPartNo=525146)                                                                                                                                                       |
| .                        | NEBV-Z4WA2L-P-E-2.5-N-LE2-S1 (Cable for Valve) | 1        | [shop Link](https://www.festo.com/cat/en-us_us/products_NEBV_V?CurrentIDCode1=NEBV-Z4WA2L-P-E-2.5-N-LE2&CurrentPartNo=8003577)                                                                                                                                               |

### Software Setup
Please refer the detailed description of [How to Control on OpenCR](/docs/en/platform/openmanipulator/#how-to-control-on-opencr)    
Download Arduino IDE and load OpenCR board on it

- [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

Find example source codes.

Go to `Examples` → `OpenManipulator` → `example` → `Chain` → `open_manipulator_chain_vacuum` on Arduino IDE for OpenCR.

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_arduino.png)


## [Pen Holder](#pen-holder)

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/SIpV8Vuua_c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Hardware Setup

|                          | Part Name  | Quantity | Link                                                       |
|:-------------------------|:-----------|:---------|:-----------------------------------------------------------|
| **3D Printed Tool Part** | Pen Holder | 1        | [Download Link](https://www.thingiverse.com/thing:3069574) |

### Software Setup
Please refer the detailed description of [How to Control on OpenCR](/docs/en/platform/openmanipulator/#how-to-control-on-opencr)    
Download Arduino IDE and load OpenCR board on it

- [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

Find example source codes.

Go to `Examples` → `OpenManipulator` → `example` → `Chain` → `open_manipulator_chain_pen` on Arduino IDE for OpenCR.

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_arduino.png)


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

| Items               | Unit    |                                    |
|:--------------------|:--------|:-----------------------------------|
| **Actuator**        |         | Dynamixel XM430-W350-T             |
| **Input Voltage**   | V       | 12                                 |
| **DOF**             | -       | 4 (3 DOF + 1 End-Effector)         |
| **Speed(Joint)**    | RPM     | 46                                 |
| **Reach**           | mm (in) | 276 (10.87)                        |
| **Communication**   | -       | TTL (Level Multidrop BUS)          |
| **Software**        | -       | Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -       | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_spec_side.png)

### Hardware Setup

#### Part Lists

|                   | Part Name              | Quantity | Link                                                                                                                      |
|:------------------|:-----------------------|:-------------------------------------------------------------------------------------------------------------------------------------|
| **Chassis Parts** | BASE FRAME             | 1|[Download Link](https://www.thingiverse.com/thing:3069581)                                                                         |
| .                 | PEN HOLDER             | 1|[Download Link](https://www.thingiverse.com/thing:3069581)                                                                         |
| .                 | FRM BASE               | 1|[Download Link](https://www.thingiverse.com/thing:3069581)                                                                         |
| .                 | TAP HOLDER             | 1|[Download Link](https://www.thingiverse.com/thing:3069581)                                                                         |
| .                 | FR12_H101_K            | 4|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2768&GC=GD0B0001)                                            |
| .                 | FR12_S102_K            | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2766&GC=GD0B0001)                                            |
| .                 | HN12_I101              | 4|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2759&GC=GD0B0006)                                            |
| **Actuators**     | Dynamixel XM430-W350-T | 4|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                            |
| **Cables**        | CABLE_3P_130MM         | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2347&GC=GD0B0105&page=2)                                     |
| .                 | CABLE_3P_240MM         | 1|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)                                     |
| **Miscellaneous** | WB_M2X03               | 24|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2%0900000070373%3A%3A3)      |
| .                 | WB_M2_5X4              | 14|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2.5%0900000070373%3A%3A8)    |
| .                 | WB_M2_5X06             | 8|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2.5%0900000070373%3A%3A3%2C6) |
| .                 | WB_M2_5X12             | 2|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2.5%0900000070373%3A%3A8)     |
| .                 | FHS_M2_5X14            | 12|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3)         |
| .                 | NUT_M2_5(0.45P)        | 8|[Shop Link](https://us.misumi-ec.com/vona2/detail/110300250540/?Inch=0&CategorySpec=00000070281%3A%3A2.5)                          |

For more information, please refer to [BOM](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1200068410).

<!-- [Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1916070381) -->

#### 3D Printed Parts

- CAD Files ([Onshape](http://www.robotis.com/service/download.php?no=691), [Thingiverse](https://www.thingiverse.com/thing:3069581))

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries.

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Scara` → `open_manipulator_scara` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Scara` → `Scara.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_Processing.png)

### Video

 <iframe width="560" height="315" src="https://www.youtube.com/embed/4PK3I1JfSzc" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [OpenManipulator Link](#openmanipulator-link)

![](/assets/images/platform/openmanipulator/OpenManipulator_Link.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_Capture.png)

| Items                    | Unit    |                                    |
|:-------------------------|:--------|:-----------------------------------|
| **Actuator**             |         | Dynamixel XM430-W350-T             |
| **DOF**                  | -       | 3                                  |
| **Payload With Suction** | g (lb)  | 500 (1.10)                         |
| **Speed(Joint)**         | rad/sec | 4.82                               |
| **Weight**               | kg(lb)  | 0.55 (1.21)                        |
| **Reach**                | mm (in) | 350 (13.78)                        |
| **Communication**        | -       | TTL (Level Multidrop BUS)          |
| **Software**             | -       | Dynamixel SDK, Arduino, Processing |
| **Main Controller**      | -       | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_spec.png)

### Hardware Setup

#### Part Lists

|                   | Part Name                        | Quantity | Link                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|:------------------|:---------------------------------|:---------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Plate**         | Base Plate-02                    | 1        | [Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=3331)                                                                                                                                                                                                                                                                                                                                                                                                    |
| **Chassis Parts** | BASE LINK                        | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | ROTATION BASE                    | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | HOLDER A                         | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | HOLDER B                         | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | LINK 50                          | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | LINK 200 A                       | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | LINK 50 FOR 250                  | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | LINK 200 FOR 250                 | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | LINK 200 B                       | 4        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | TRIANGLE LINK                    | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| .                 | TOOL LINK                        | 1        | [Download Link](https://www.thingiverse.com/thing:3069557)                                                                                                                                                                                                                                                                                                                                                                                                                     |
| **Actuators**     | Dynamixel XM430-W350-T           | 3        | [Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                                                                                                                                                                                                                                                                                                                                                                        |
| **Cables**        | CABLE_3P_180MM                   | 2        | [Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2755&GC=GD0B0105&page=2)                                                                                                                                                                                                                                                                                                                                                                                 |
| .                 | CABLE_3P_240MM                   | 1        | [Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)                                                                                                                                                                                                                                                                                                                                                                                 |
| **Miscellaneous** | FHS_M2x3mm                       | 16       | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2%0900000071552%3A%3A3)                                                                                                                                                                                                                                                                                                                                                   |
| .                 | FHS_M2x6mm                       | 4        | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2%0900000071552%3A%3A6)                                                                                                                                                                                                                                                                                                                                                   |
| .                 | FHS_M2.5x5mm                     | 8        | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3A%3A5)                                                                                                                                                                                                                                                                                                                                                 |
| .                 | FHS_M2.5x10mm                    | 4        | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3A%3A10)                                                                                                                                                                                                                                                                                                                                                |
| .                 | FHS_M3x10mm                      | 4        | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3a%3a2.5%0900000071552%3a%3a10&curSearch=%7b%22field%22%3a%22%40search%22%2c%22seriesCode%22%3a%22221000547315%22%2c%22innerCode%22%3a%22%22%2c%22sort%22%3a1%2c%22specSortFlag%22%3a0%2c%22allSpecFlag%22%3a0%2c%22page%22%3a1%2c%22pageSize%22%3a%2260%22%2c%2200000071822%22%3a%22nvd00000000000002%22%2c%2200000071552%22%3a%22mig00000001426443%22%7d&Tab=wysiwyg_area_0) |
| .                 | NUT_M2                           | 4        | [Shop Link](https://us.misumi-ec.com/vona2/detail/110300250540/?Inch=0&CategorySpec=00000070281%3A%3A2)                                                                                                                                                                                                                                                                                                                                                                        |
| .                 | NUT_M2.5                         | 4        | [Shop Link](https://us.misumi-ec.com/vona2/detail/110300250540/?Inch=0&CategorySpec=00000070281%3A%3A2.5)                                                                                                                                                                                                                                                                                                                                                                      |
| .                 | PSCBRJ6-9                        | 18       | [Shop Link](https://us.misumi-ec.com/vona2/detail/110302637270/?HissuCode=PSCBRJ6-9&PNSearch=PSCBRJ6-9&KWSearch=PSCBRJ6-9&searchFlow=results2type)                                                                                                                                                                                                                                                                                                                             |
| .                 | MSRB6-1.0                        | 40       | [Shop Link](https://us.misumi-ec.com/vona2/detail/110100142970/?HissuCode=MSRB6-1.0&PNSearch=MSRB6-1.0&KWSearch=MSRB6-1.0&searchFlow=results2type)                                                                                                                                                                                                                                                                                                                             |
| .                 | NSFMR6-38                        | 1        | [Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-38&PNSearch=NSFMR6-38&KWSearch=NSFMR6-38&searchFlow=results2products)                                                                                                                                                                                                                                                                                                                         |
| .                 | NSFMR6-42                        | 1        | [Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-42&PNSearch=NSFMR6-42&KWSearch=NSFMR6-42&searchFlow=results2products)                                                                                                                                                                                                                                                                                                                         |
| .                 | NSFMR6-24                        | 6        | [Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-24&PNSearch=NSFMR6-24&KWSearch=NSFMR6-24&searchFlow=results2products)                                                                                                                                                                                                                                                                                                                         |
| .                 | Ball Bearing(O.D 10mm / I.D 6mm) | 20       | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000531116/?CategorySpec=unitType%3a%3a1%0900000044017%3a%3amig00000001446936%0900000043985%3a%3amig00000001455783&Inch=0)                                                                                                                                                                                                                                                                                                 |

<!-- [Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1110711693) -->

#### 3D Printed Parts

CAD Files ([Onshape](http://www.robotis.com/service/download.php?no=692), [Thingiverse](https://www.thingiverse.com/thing:3069557))

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries.

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Link` → `open_manipulator_link` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Link` → `Link.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_Processing.png)

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/WR9_1AheOok" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## [OpenManipulator Planar](#openmanipulator-planar)

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar_Capture.png)

| Items               | Unit |                                    |
|:--------------------|:-----|:-----------------------------------|
| **Actuator**        |      | Dynamixel XM430-W350-T             |
| **Input Voltage**   | V    | 12                                 |
| **DOF**             | -    | 3                                  |
| **Speed(Joint)**    | RPM  | 46                                 |
| **Communication**   | -    | TTL (Level Multidrop BUS)          |
| **Software**        | -    | Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -    | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar_spec.png)

### Hardware Setup

#### Part Lists

|                   | Part Name                        | Quantity | Link                                                                                                                                                                        |
|:------------------|:---------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Chassis Parts** | BASE FRAME                       | 1|[Download Link](https://www.thingiverse.com/thing:3064437)                                                                                                                           |
| .                 | laser_gripper                    | 1|[Download Link](https://www.thingiverse.com/thing:3064437)                                                                                                                           |
| .                 | link_100                         | 3|[Download Link](https://www.thingiverse.com/thing:3064437)                                                                                                                           |
| .                 | link_120                         | 3|[Download Link](https://www.thingiverse.com/thing:3064437)                                                                                                                           |
| .                 | HN12_I101                        | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2759&GC=GD0B0006)                                                                                              |
| **Actuators**     | Dynamixel XM430-W350-T           | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                                                                              |
| **Cables**        | CABLE_3P_240MM                   | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)                                                                                       |
| **Miscellaneous** | WB_M2_5X12                       | 24|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/?Inch=0&CategorySpec=00000070644%3A%3A2.5%0900000070373%3A%3A8)                                                      |
| .                 | FHS_M2_5X14                      | 12|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3)                                                           |
| .                 | NSFMR6-24                        | 6     | [Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-26&PNSearch=NSFMR6-26&KWSearch=NSFMR6-26&searchFlow=results2products)                         |
| .                 | Ball Bearing(O.D 10mm / I.D 6mm) | 24    | [Shop Link](https://us.misumi-ec.com/vona2/detail/221000531116/?CategorySpec=unitType%3a%3a1%0900000044017%3a%3amig00000001446936%0900000043985%3a%3amig00000001455783&Inch=0) |

For more information, please refer to [BOM](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1200068410).

#### 3D Printed Parts

CAD Files ([Onshape](https://cad.onshape.com/documents/03dca3ccd6175a054a517d7a/w/bd02756435abc4861fbe19d3/e/512dba920820826220bb1be1), [Thingiverse](https://www.thingiverse.com/thing:3064437))

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries.

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Planar` → `open_manipulator_planar` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Planar` → `Planar.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/UtFnywz4hdY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [OpenManipulator Delta](#openmanipulator-delta)

![](/assets/images/platform/openmanipulator/OpenManipulator_Delta.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Delta_Capture.png)

| Items               | Unit |                                    |
|:--------------------|:-----|:-----------------------------------|
| **Actuator**        |      | Dynamixel XM430-W350-T             |
| **Input Voltage**   | V    | 12                                 |
| **DOF**             | -    | 3                                  |
| **Speed(Joint)**    | RPM  | 46                                 |
| **Communication**   | -    | TTL (Level Multidrop BUS)          |
| **Software**        | -    | Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -    | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Delta_spec.png)

### Hardware Setup

#### Part Lists

|                   | Part Name              | Quantity | Link                                                                                                                                                      |
|:------------------|:-----------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Chassis Parts** | BASE FRAME             | 1|[Download Link](https://www.thingiverse.com/thing:3217182)                                                                                                         |
| .                 | Delta_centre           | 1|[Download Link](https://www.thingiverse.com/thing:3217182)                                                                                                         |
| .                 | Delta_gripper          | 1|[Download Link](https://www.thingiverse.com/thing:3217182)                                                                                                         |
| .                 | link                   | 3|[Download Link](https://www.thingiverse.com/thing:3217182)                                                                                                         |
| .                 | HN12_I101              | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2759&GC=GD0B0006)                                                                            |
| **Actuators**     | Dynamixel XM430-W350-T | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                                                            |
| **Cables**        | CABLE_3P_240MM         | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)                                                                     |
| **Miscellaneous** | WB_M2_5X12             | 24|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101) |
| .                 | FHS_M2_5X14            | 12|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000547315/?Inch=0&CategorySpec=00000071822%3A%3A2.5%0900000071552%3)                                         |
| .                 | NSFMR6-24              | 6|[Shop Link](https://jp.misumi-ec.com/vona2/detail/110300086920/?HissuCode=NSFMR6-26&PNSearch=NSFMR6-26&KWSearch=NSFMR6-26&searchFlow=results2products)             |
| .                 | Rod End Bearing(D 3mm) | 12|[Shop Link](https://us.misumi-ec.com/vona2/detail/110300371730/?HissuCode=PHSOM3&PNSearch=PHSOM3&KWSearch=phsom3&searchFlow=results2type)                         |

For more information, please refer to [BOM](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1200068410).

#### 3D Printed Parts

CAD Files ([Onshape](https://cad.onshape.com/documents/cc6fdde79eccc8c21ff6048b/w/5275a0e3ad2bfd7d5bc573ac/e/485c206801d5b810c0c4297a), [Thingiverse](https://www.thingiverse.com/thing:3217182))

![](/assets/images/platform/openmanipulator/OpenManipulator_Delta_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries.

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Delta` → `open_manipulator_delta` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Delta` → `Delta.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/vFyphQwdV6I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [OpenManipulator Stewart](#openmanipulator-stewart)

![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_Capture.png)

| Items               | Unit |                                    |
|:--------------------|:-----|:-----------------------------------|
| **Actuator**        |      | Dynamixel XM430-W350-T             |
| **Input Voltage**   | V    | 12                                 |
| **DOF**             | -    | 6                                  |
| **Speed(Joint)**    | RPM  | 46                                 |
| **Communication**   | -    | TTL (Level Multidrop BUS)          |
| **Software**        | -    | Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -    | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_spec_side.png)
![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_spec_bottom.png)
![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_spec_top.png)

### Hardware Setup

#### Part Lists

|                   | Part Name              | Quantity | Link                                                                                                                                                        |
|:------------------|:-----------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Chassis Parts** | BASE FRAME             | 1|[Download Link](https://www.thingiverse.com/thing:3272579)                                                                                                           |
| .                 | stewart_conv           | 6|[Download Link](https://www.thingiverse.com/thing:3272579)                                                                                                           |
| .                 | st_link_new            | 6|[Download Link](https://www.thingiverse.com/thing:3272579)                                                                                                           |
| .                 | PHSOM3                 | 12|[Shop Link](https://kr.misumi-ec.com/vona2/detail/110300371730/?HissuCode=PHSOM3&PNSearch=PHSOM3&KWSearch=phsom3&searchFlow=results2type)                           |
| .                 | SPJW6-100-M3-N3        | 6|[Shop Link](https://kr.misumi-ec.com/vona2/detail/110302636140/?HissuCode=SPJW6-100-M3-N3&PNSearch=SPJW6-100-M3-N3&KWSearch=SPJW6-100-M3-N3&searchFlow=results2type) |
| .                 | HN12_I101              | 6|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2759&GC=GD0B0006)                                                                              |
| **Actuators**     | Dynamixel XM430-W350-T | 6|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                                                              |
| **Cables**        | CABLE_3P_130MM         | 6|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2347&GC=GD0B0105&page=2)                                                                       |
| **Miscellaneous** | WB_M3X08               | 24|[Shop Link](https://us.misumi-ec.com/vona2/detail/221000551286/)                                                                                                    |
| .                 | NUT_M3                 | 24|[Shop Link](https://us.misumi-ec.com/vona2/detail/110300250540/)                                                                                                    |

For more information, please refer to [BOM](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1200068410).

#### 3D Printed Parts

CAD Files ([Onshape](https://cad.onshape.com/documents/7dd4f10904b98bdc250fd542/w/a3a3f0239f81db22c2393e00/e/83b69168ebe68946a7da5f22), [Thingiverse](https://www.thingiverse.com/thing:3272579))

![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries. 

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Stewart` → `open_manipulator_stewart` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Stewart` → `Stewart.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/9YUWLAm24yA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [OpenManipulator Linear](#openmanipulator-linear)

![](/assets/images/platform/openmanipulator/OpenManipulator_Linear.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Linear_Capture.png)

| Items               | Unit |                                    |
|:--------------------|:-----|:-----------------------------------|
| **Actuator**        |      | Dynamixel XM430-W350-T             |
| **Input Voltage**   | V    | 12                                 |
| **DOF**             | -    | 3                                  |
| **Speed(Joint)**    | RPM  | 46                                 |
| **Communication**   | -    | TTL (Level Multidrop BUS)          |
| **Software**        | -    | Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -    | PC, OpenCR                         |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Linear_spec.png)

### Hardware Setup

#### Part Lists

|                   | Part Name                              | Quantity | Link                                                                                                                           |
|:------------------|:---------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------|
| **Chassis Parts** | BASE FRAME                             | 1|[Download Link](https://www.thingiverse.com/thing:3069581)                                                                              |
| .                 | linear_x_holder                        | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_z_holder                        | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_griper_bt                       | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_y_holder                        | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_y_holder_mr                     | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | LINEAR_Y_HOLDER                        | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_y_guide_holder                  | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_pully_conv                      | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | linear_pully_conv_dummy                | 1|[Download Link](https://www.thingiverse.com/thing:3255864)                                                                              |
| .                 | Aluminum Extrusion - 6 series, Base 30 | 8|[Shop Link](https://us.misumi-ec.com/vona2/detail/110302686450/?HissuCode=HFSLB6-3030-%5b50-1800%2f0.5%5d&searchFlow=results2similartn) |
| **Actuators**     | Dynamixel XM430-W350-T                 | 3|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2923&GC=GD080101)                                                 |
| **Cables**        | CABLE_3P_240MM                         | 1|[Shop Link](http://www.robotis-shop-en.com/?act=shop_en.goods_view&GS=2926&GC=GD0B0105&page=3)                                          |

For more information, please refer to [BOM](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1200068410).

#### 3D Printed Parts

CAD Files ([Onshape](https://cad.onshape.com/documents/056051479aa43c1d3575467b/w/e4a798df49f872fa4589217b/e/85be5fe21aa7c9c76732a701), [Thingiverse](https://www.thingiverse.com/thing:3255864))

![](/assets/images/platform/openmanipulator/OpenManipulator_Linear_OnShape.png)

### Software Setup

Download the [`OpenCR`](https://github.com/ROBOTIS-GIT/OpenCR) and [`open_manipulator_processing`](https://github.com/ROBOTIS-GIT/open_manipulator_processing) libraries. 

#### OpenCR

Go to `Examples` → `OpenManipulator` → `example` → `Arduino` → `Linear` → `open_manipulator_linear` on Arduino IDE for OpenCR.

#### Processing

Open processing source code file (`open_manipulator_processing` → `Linear` → `Linear.pde`) on Processing IDE.

**NOTE**: Upload **OpenCR example source code** to OpenCR before run **processing source code**.
{: .notice--info}

### Video

<iframe width="560" height="315" src="https://www.youtube.com/embed/3FumPqbOs5k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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
