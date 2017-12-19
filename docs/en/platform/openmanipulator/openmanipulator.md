---
layout: archive
lang: en
ref: openmanipulator
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/openmanipulator/
sidebar:
  title: OpenManipulator
  nav: "openmanipulator"
---

# [Introduction](#introduction)

![](/assets/images/platform/openmanipulator/OpenManipulator_Introduction.jpg)

ROS-enabled OpenManipulator is a full open robot platform consisting of **OpenSoftware**​, **OpenHardware** and **OpenCR(Embedded board)​**.

## OpenSoftware
OpenManipulator are based on ROS ​and OpenSource. ROS official hardware platform ,TurtleBot series has been supporting ‘TurtleBot Arm’. The OpenManipulator has full hardware compatibility with TurtleBot3​, and allows users to control it more easily by linking with the MoveIT! package. Even if you do not have a real robot, you can control the robot in the Gazebo simulator​.

## OpenHardware
The OpenManipulator is oriented towards Open Hardware​. Most of the components except for some frames are uploaded as [STL files](https://cad.onshape.com/documents/9442f03bd8ccac084fda9dd3/w/039e8dbd53e0782540ea5b0d/e/9d3986b1e15cd5dce9557032) that can be 3d printing. This allows users to modify the length of the link and the design of the robot to suit the intended use. The open manipulator also uses the **Dynamixel X ​series** used in TurtleBot 3. Dynamixel has a modular form and adopts daisy chain method. This allows users to easily change and add joints for some torque and degree of freedom they need. Taking advantage of these advantages, we are planning a total of seven different types (For example, Chain, SCARA, Link, Planar, Delta, Stewart and Linear) of OpenManipulator.

## OpenCR (Embedded board)
The OpenManipulator can also be controlled via [OpenCR](https://github.com/ROBOTIS-GIT/OpenCR/wiki) (Open-source Control module for ROS), the control board of TurtleBot3. OpenCR's computing power and real-time control are used to support forward, inverse kinematics, and profile control examples. In addition, OpenCR can interoperate with many functions provided by ROS through message communication with ROS, which will evolve into ROS 2.0 in the future.

## Examples

OpenManipulator is composed by [Dynamixel X series](http://en.robotis.com/index/product.php?cate_code=101210) and [3D printing parts](https://cad.onshape.com/documents/9442f03bd8ccac084fda9dd3/w/039e8dbd53e0782540ea5b0d/e/9d3986b1e15cd5dce9557032). Dynamixel has a modular form and adopts daisy chain method. This allows users to easily change and add joints for some torque and degree of freedom they need. Moreover, growing 3D printing technology makes anyone can make anything they want with low cost and rapid time. We suggest some examples of links and safety parts. Taking advantage of these advantages, we are planning a total of seven different types of OpenManipulator.

## Related Video

<iframe src="https://player.vimeo.com/video/236147296" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
<p><a href="https://vimeo.com/236147296">ROSCon 2017 Vancouver Day 1: Introducing OpenManipulator; the full open robot platform</a> from <a href="https://vimeo.com/osrfoundation">OSRF</a> on <a href="https://vimeo.com">Vimeo</a>.</p>

# [OpenManipulator Chain](#openmanipulator-chain)

## [Specification](#chain-spec)

|                     |  Unit     | Chain with XM430-W350                     |
| -----------------   | --------- | ----------------------------------------- |
| **Input Voltage**   |  V        |  12                                       |
| **DOF**             |  -        |  5 (4 DOF + 1 DOF Gripper)                |
| **Payload**         |  g        |  1000 ~ 1300 (2.20 ~ 2.86)                |
| **Speed(Joint)**    |  rad/sec  |  4.82                                     |
| **Weight**          |  kg(lb)   |  0.7 (1.54)                               |
| **Reach**           |  mm (in)  |  380 (14.9)                               |
| **Rated Voltage**   |  VDC      |  12                                       |
| **Communication**   |  -        |  RS-485 (Multi Drop Bus)                  |
| **Power(Joint)**    |  W        |  27.6                                     |
| **Software**        |  -        |  ROS, Dynamixel SDK, Arduino, Processing  |
| **Main Controller** |  -        |  Laptop PC, OpenCR                        |

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_spec_side.png)

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_spec_gripper.jpg)

## [Hardware Setup](#chain-hardware-setup)

[Parts of OpenManipulator](https://docs.google.com/a/robotis.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit?usp=sharing)

[CAD Files](https://goo.gl/NsqJMu)

* Items that are painted in purple are purchased on ROBOTIS SHOP
* Items that are painted in green are purchased on shopping mall
* Items that are painted in yellow are 3D printing parts

## [Software Setup](#chain-software-setup)

### ROS

 <iframe width="560" height="315" src="https://www.youtube.com/embed/Qhvk5cnX2hM" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

 <iframe width="560" height="315" src="https://www.youtube.com/embed/B2pnXtooKOg" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

* Install dependent packages for the OpenManipulator.

 ```
 $ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-dynamixel-sdk ros-kinetic-dynamixel-workbench-toolbox ros-kinetic-robotis-math ros-kinetic-industrial-core 
 ```

 ```
 $ cd ~/catkin_ws/src/

 $ git clone https://github.com/ROBOTIS-GIT/open_manipulator.git

 $ cd ~/catkin_ws && catkin_make 
 ```

* If catkin_make command is completed without any errors, preparation for OpenManipulator is done.

### Gazebo(3D)

* Below command will load the OpenManipulator on Gazebo environment.

 ```
 $ roslaunch open_manipulator_gazebo open_manipulator_gazebo.launch
 ```

 ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gazebo_1.jpg)

* In order to control OpenManipulator, please use topic publish with below command in a new terminal window.

 ```
 $ rostopic pub /open_manipulator_chain/joint2_position/command std_msgs/Float64 "data: 1.0" --once
 ```

 ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gazebo_2.jpg)

* In order to run OpenManipulator simulation with MoveIt!, open a new terminal window and enter below command.

 ```
 $ roslaunch open_manipulator_moveit open_manipulator_demo.launch use_gazebo:=true
 ```

 ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_sim_1.png)

 ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_sim_2.png)

* In order to control gripper, please use topic publish with below command in a new terminal window.

 ```
 $ rostopic pub /robotis/open_manipulator/gripper std_msgs/String "data: 'grip_on'" --once
 ```

 ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gripper.png)

### Platform

* Below command will load the OpenManipulator with DYNAMIXEL X-series.

 ```
 $ roslaunch open_manipulator_dynamixel_ctrl dynamixel_controller.launch
 ```

* In order to run OpenManipulator simulation with MoveIt!, open a new terminal window and enter below command.

 ```
 $ roslaunch open_manipulator_moveit open_manipulator_demo.launch
 ```

 ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_1.png)

 ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_2.png)

 ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_3.png)

 ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_real_4.png)

### TurtleBot3 Waffle with OpenManipulator Chain

* Install dependent packages for the OpenManipulator.

 ```
 $ cd ~/catkin_ws/src

 $ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git

 $ cd ~/catkin_ws && catkin_make
 ```

* Below command will load the TurtleBot3 Waffle with OpenManipulator on Rviz.

 ```
 $ roslaunch open_manipulator_with_tb3 open_manipulator_chain_with_tb3_rviz.launch
 ```

![](/assets/images/platform/openmanipulator/TurtleBot3_with_Open_Manipulator.jpg)

### OpenCR

![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing.png)

[OpenCR WIKI](https://github.com/ROBOTIS-GIT/OpenCR/wiki/arduino_examples_openmanipulator_chain)

## Image of OpenManipulator Chain

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_OnShape.jpg)

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_Capture.jpg)

# [OpenManipulator SCARA](#openmanipulator-scara)

## [Specification](#scara-spec)

|                     |  Unit     | Chain with XM430-W350                     |
| -----------------   | --------- | ----------------------------------------- |
| **Input Voltage**   |  V        |  12                                       |
| **DOF**             |  -        |  4 (3 DOF + 1 End-Effector)               |
| **Speed(Joint)**    |  rad/sec  |  4.82                                     |
| **Weight**          |  kg(lb)   |  0.52 (1.14)                              |
| **Reach**           |  mm (in)  |  234 (9.21)                               |
| **Rated Voltage**   |  VDC      |  12                                       |
| **Communication**   |  -        |  RS-485 (Multi Drop Bus)                  |
| **Power(Joint)**    |  W        |  27.6                                     |
| **Software**        |  -        |  ROS, Dynamixel SDK, Arduino, Processing  |
| **Main Controller** |  -        |  Laptop PC, OpenCR                        |


![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_spec_side.png)

## [Hardware Setup](#scara-hardware-setup)

[Parts of OpenManipulator](https://docs.google.com/a/robotis.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit?usp=sharing)

[CAD Files](https://goo.gl/oVsK8m)

* Items that are painted in purple are purchased on ROBOTIS SHOP
* Items that are painted in green are purchased on shopping mall
* Items that are painted in yellow are 3D printing parts

## [Software Setup](#scara-software-setup)

### OpenCR

[OpenCR WIKI](https://github.com/ROBOTIS-GIT/OpenCR/wiki/arduino_examples_openmanipulator_SCARA)

## Image of OpenManipulator SCARA

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_OnShape.png)

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_Capture.png)

# [OpenManipulator Link](#openmanipulator-link)

## [Specification](#link-spec)

|                          |  Unit     | Chain with XM430-W350                     |
| -----------------        | --------- | ----------------------------------------- |
| **Input Voltage**        |  V        |  12                                       |
| **DOF**                  |  -        |  3                                        |
| **Payload With Suction** |  g (lb)   |  400 ~ 450 (0.88 ~ 0.99)                  |
| **Speed(Joint)**         |  rad/sec  |  4.82                                     |
| **Weight**               |  kg(lb)   |  0.53 (1.16)                              |
| **Reach**                |  mm (in)  |  330 (12.99)                              |
| **Rated Voltage**        |  VDC      |  12                                       |
| **Communication**        |  -        |  RS-485 (Multi Drop Bus)                  |
| **Power(Joint)**         |  W        |  27.6                                     |
| **Software**             |  -        |  ROS, Dynamixel SDK, Arduino, Processing  |
| **Main Controller**      |  -        |  Laptop PC, OpenCR                        |

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_spec_side.png)

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_spec_up.png)

## [Hardware Setup](#link-hardware-setup)

[Parts of OpenManipulator](https://docs.google.com/a/robotis.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit?usp=sharing)

[CAD Files](https://goo.gl/MJ6C8K)

* Items that are painted in purple are purchased on ROBOTIS SHOP
* Items that are painted in green are purchased on shopping mall
* Items that are painted in yellow are 3D printing parts

## [Software Setup](#link-software-setup)

### OpenCR

[OpenCR WIKI](https://github.com/ROBOTIS-GIT/OpenCR/wiki/arduino_examples_openmanipulator_Link)

## Image of OpenManipulator Link

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_OnShape.png)

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_Capture.png)

# [OpenManipulator Planar](#openmanipulator-planar)

**Be released in 2018**

# [OpenManipulator Delta](#openmanipulator-delta)

**Be released in 2018**

# [OpenManipulator Stewart](#openmanipulator-stewart)

**Be released in 2018**

# [OpenManipulator Linear](#openmanipulator-linear)

**Be released in 2018**