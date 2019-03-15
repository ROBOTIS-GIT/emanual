---
layout: archive
lang: en
ref: openmanipulator
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/getting_started/
sidebar:
  title: OpenManipulator RM-X52-TNM
  nav: "openmanipulator"
---

<div style="counter-reset: h1 2"></div>

# [Getting Started](#getting-started)
This chapter is for users who are new to OpenManipulator RM-X52-TNM. The manual has an enormous amount of content, but this chapter explains how information is divided.


## [About OpenManipulator](#about-openmanipulator)
<!-- <img src="/assets/images/platform/openmanipulator/OpenManipulator2.png" width="1200"> -->

ROS-enabled OpenManipulator RM-X52-TNM is a full open robot platform consisting of **OpenSoftware**​, **OpenHardware** and **OpenCR(Embedded board)​**. First of all, collect information from the [Overview](/docs/en/platform/openmanipulator) and [Specification](/docs/en/platform/openmanipulator/specification) pages to get an overall understanding of OpenManipulator RM-X52-TNM.


## [OpenManipulator Setup](#openmanipulator-setup)
When you have enough understanding about OpenManipulator RM-X52-TNM from above step, it is recommended to proceed in the following order.

### [Hardware Setup](#hardware-setup)

1. `Check the Part List` : The OpenManipulator RM-X52-TNM only contains the parts required to configure the OpenManipulator body. For controlling and operating the OpenManipulator, the optional parts is necessary. 
Please check [the part list page](/docs/en/platform/openmanipulator/assembly/#part-list), prepare the every requaired parts.
The [SMPS 12V5A](http://en.robotis.com/shop_en/item.php?it_id=903-0124-200) is necessary to supply the 12V power to the dynamixels of OpenManipulator RM-X52-TNM. The [Base Plate-02](http://en.robotis.com/shop_en/item.php?it_id=905-0026-000)
is used to secure the OpenManipulator to the workspace. 
The controller or communication board you need to prepare depends on your development environment. If you want to develop on an embedded system, prepare [OpenCR](http://en.robotis.com/shop_en/item.php?it_id=903-0257-000) and PC. To use the ROS, prepare your PC and either the [U2D2](http://en.robotis.com/shop_en/item.php?it_id=902-0132-000) + [U2D2 Power Hub Board](http://en.robotis.com/shop_en/item.php?it_id=902-0145-000) or [OpenCR](http://en.robotis.com/shop_en/item.php?it_id=903-0257-000).  
To summarize, the parts to prepare are shown in the table below.

2. `Assembly` : The OpenManipulator RM-X52-TNM is provided as a non-assembled part to the box. Assemble the OpenManipulator according to the instructions of [Assembly Manual](/docs/en/platform/openmanipulator/assembly/#assembly-manual). 

- **Parts**

|                 | ROS environment           | Embedded environment      | 
|:---------------:|:-------------------------:|:-------------------------:|
| **Manipulator** |[OpenManipulator RM-X52-TNM](http://en.robotis.com/shop_en/item.php?it_id=905-0024-000)             |[OpenManipulator RM-X52-TNM](http://en.robotis.com/shop_en/item.php?it_id=905-0024-000)             |
| **Plate**       |[Base Plate-02](http://en.robotis.com/shop_en/item.php?it_id=905-0026-000)                         |[Base Plate-02](http://en.robotis.com/shop_en/item.php?it_id=905-0026-000)                         |
| **Powers**      |[SMPS 12V5A](http://en.robotis.com/shop_en/item.php?it_id=903-0124-200)                            |[SMPS 12V5A](http://en.robotis.com/shop_en/item.php?it_id=903-0124-200)                            |
| **Boards**      |[OpenCR](http://en.robotis.com/shop_en/item.php?it_id=903-0257-000) or [U2D2](http://en.robotis.com/shop_en/item.php?it_id=902-0132-000)+[U2D2 Power Hub Board](http://en.robotis.com/shop_en/item.php?it_id=902-0145-000)    |[OpenCR](http://en.robotis.com/shop_en/item.php?it_id=903-0257-000)| 


### [Board Connection](#board-connection)
To set up the software on the OpenManipulator and run it, you need to connect your PC and the OpenManipulator RM-X52-TNM to the electrical board.
You can use OpenCR alone or U2D2 and U2D2 Power Hub Board, as the electrical board. A simple connection diagram is shown below. Refer to [ROS] setup or [OpenCR] setup page for detailed connection method.

<img src="/assets/images/platform/openmanipulator/connection.png" width="600">


### [Software Setup](#software-setup)
OpenManipulator RM-X52-TNM surpports bath of ROS develop environment and an embedded system (OpenCR). Choose the development environment you want to run OpenManipulator, and configure the software for the environment.

#### ROS Environment
In the ROS development environment, you can run OpenManipulator using various packages provided by ROS as well as our ROS package. In this case, all the processes to run OpenManipulator are done in PC, and electric board is used only to convert the digital signal coming from PC into the communication signal used in dynamixel. If you want to run OpenManipulator in ROS environment, please install Linux, ROS and ROS package on PC according to [[ROS] Setup](/docs/en/platform/openmanipulator/ros_setup/#ros-setup) chapter.

<!-- <img src="/assets/images/platform/openmanipulator/ros_enabled.png" width="150" border="0"> -->

#### Embedded System
If you use OpenManipulator in an embedded system (OpenCR), you can easily apply your algorithm  to run OpenManipulator with an easy-to-use system such as the Arduino IDE. In this case, the main process for running the OpenManipulator is done inside the embedded system, and commands can be sent to the embedded system using the GUI program of the PC, the joystick controller, or a simple sensor. If you want to run the OpenManipulator on an embedded system, install the software on your PC and set up OpenCR by following the [[OpenCR] Setup](/docs/en/platform/openmanipulator/opencr_setup/#opencr-setup) chapter.

<!-- <img src="/assets/images/platform/openmanipulator/with_opencr.png" width="150"> -->

## [Let's try Basic Operation](#lets-try-basic-operation)

### [Basic Operation on ROS Environment](#basic-operation-on-ros-environment)
Once you have completed the above steps, run OpenManipulator RM-X52-TNM through the provided Controller package. You can command the OpenManipulator to move specific position via ROS messages. Refer to the following page to run the controller package and test whether it works well. 

- [Controller Package](/docs/en/platform/openmanipulator/ros_controller_package)

After you have successfully run the controller package, you can run OpenManipulator by publishing ROS messages to the controller package using the packages we provide. The following basic operation example is provided as a package for ROS message publishing.

- [GUI Program](/docs/en/platform/openmanipulator/ros_operation/#gui-program)
- [Teleoperation](/docs/en/platform/openmanipulator/ros_operation/#teleoperation)

OpenManipulator can also be operated using MoveIt!. You can run the controller package that uses MoveIt! by changing the variables in the launch file of the controller package. Please refer to the following chapters and try out various motions with MoveIt!.

- [MoveIt!](/docs/en/platform/openmanipulator/ros_operation/#moveit)

<img src="/assets/images/platform/openmanipulator/ros_basic_operation.png" width="800">

### [Basic Operation on Embedded System](##basic-operation-on-embedded-system)
OpenManipulator RM-X52-TNM can be operated not only with ROS but also with simple embedded system (OpenCR). In the embedded system (OpenCR), the control process for operating the OpenManipulator operates inside OpenCR. Refer to the following page to upload the controller to OpenCR.

- [Upload Controller](/docs/en/platform/openmanipulator/opencr_operation/#upload-controller)

There are various methods to send commands to the controller running within OpenCR. We provide the Processing source code as an example of sending commands over the USB port and receiving the status of the manipulator. We also configured the controller to operate the manipulator using the RC100 controller. Try to control the OpenManipulator using OpenCR referring to the following page.

- [GUI Program (Processing)](/docs/en/platform/openmanipulator/opencr_operation/#gui-program)
- [Teleoperation RC100](/docs/en/platform/openmanipulator/opencr_operation/#teleoperation-rc100)

<img src="/assets/images/platform/openmanipulator/opencr_basic_operation.png" width="540">


## [Challenge Applications](#challenge-applications)
Do you want to apply the OpenManipulator RM-X52-TNM to real work? Try applying the new ROS package to the OpenManipulator. Can be applied to various tasks. We provide examples of AR marker recognition using Astra pro, Realsence D435, and Raspberry Pi Camera V2. Refer the example below to challenge the camera-based manipulation applications.

- [Camera Application](/docs/en/platform/openmanipulator/ros_applications/#camera-application)

Do you want to run the OpenManipulator in a space that is not accessible to humans? And you want simple, intuitive motionplanning? The master-slave application is the answer. We have provided an example that makes it easy to create motion by linking the two OpenManipulators and operating the master manipulator with hand guide teaching. Try the master-slave application by following the link below.

- [Master Slave](/docs/en/platform/openmanipulator/ros_applications/#master-slave)

<img src="/assets/images/platform/openmanipulator/OpenManipulator_application.png" width="760">


## [Let's design my own manipulator](#lets-design-my-own-manipulator)

### [Mobile Manipulation](#mobile-manipulation)
OpenManipulator has a complete hardware combination with Turtlebot3 waffle. Challenge your mobile manipulation by assembling TurtleBot3 waffle and OpenManipulator.

- [Mobile Manipulation](/docs/en/platform/openmanipulator/mobile_manipulation/#mobile-manipulation)

<img src="/assets/images/platform/turtlebot3/manipulation/hardware_setup.png" width="200">

### [Tool Modification](#tool-modification)
We are proposing a way to replace and manipulate tool(gripper) of manipulator to take advantage of OpenManipulator for a wider range of applications. Try the new application using the Pen holder or Vacuum gripper as shown in the example below, and create your own tool to challenge more applications.

- [Tool Modiffication](/docs/en/platform/openmanipulator/tool_modification/#tool-modiffication)

<img src="/assets/images/platform/openmanipulator/OpenManipulator_tool_modi.png" width="600">

### [OpenManipulator Friends](#openmanipulator-friends)
Modify the hardware(DOF, structure) and software(kinematics, trajectory) of OpenManipulator and manipulate your own OpenManipulator. We provide a variety of the OpenManipulator friends as examples of hardware transformations. Try to control the manipulator with different structure and enjoy it. And try out the kinematics solving algorithm for the different structure.

- [OpenManipulator Friends](/docs/en/platform/openmanipulator/friends/#friends)

<img src="/assets/images/platform/openmanipulator/OpenManipulator_friends.png" width="760">


<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/4PK3I1JfSzc" frameborder="0" allowfullscreen></iframe> -->
<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/WR9_1AheOok" frameborder="0" allowfullscreen></iframe> -->
<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/UtFnywz4hdY" frameborder="0" allowfullscreen></iframe> -->
<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/vFyphQwdV6I" frameborder="0" allowfullscreen></iframe> -->
<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/9YUWLAm24yA" frameborder="0" allowfullscreen></iframe> -->
<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/3FumPqbOs5k" frameborder="0" allowfullscreen></iframe> -->
