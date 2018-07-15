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
  nav: "open_manipulator"
---

# [Overview](#overview)

![](/assets/images/platform/openmanipulator/OpenManipulator.png)

![](/assets/images/platform/openmanipulator/OpenManipulator_Introduction.jpg)

ROS-enabled OpenManipulator is a full open robot platform consisting of **OpenSoftware**​, **OpenHardware** and **OpenCR(Embedded board)​**.

## [OpenSoftware](#opensoftware)
OpenManipulator are based on ROS ​and OpenSource. ROS official hardware platform ,TurtleBot series has been supporting ‘TurtleBot Arm’. The OpenManipulator has full hardware compatibility with TurtleBot3​, and allows users to control it more easily by linking with the MoveIT! package. Even if you do not have a real robot, you can control the robot in the Gazebo simulator​.

## [OpenHardware](#openhardware)
The OpenManipulator is oriented towards Open Hardware​. Most of the components except for some frames are uploaded as [STL files](http://www.robotis.com/service/download.php?no=767) that can be 3d printing. This allows users to modify the length of the link and the design of the robot to suit the intended use. The open manipulator also uses the **Dynamixel X ​series** used in TurtleBot 3. Dynamixel has a modular form and adopts daisy chain method. This allows users to easily change and add joints for some torque and degree of freedom they need. Taking advantage of these advantages, we are planning a total of seven different types (For example, Chain, SCARA, Link, Planar, Delta, Stewart and Linear) of OpenManipulator.

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

|                     | Unit    | Chain with XM430-W350                   |
| ------------------- | ------- | --------------------------------------- |
| **Input Voltage**   | V       | 12                                      |
| **DOF**             | -       | 5 (4 DOF + 1 DOF Gripper)               |
| **Payload**         | g       | 300 ~ 1000                              |
| **Speed(Joint)**    | rad/sec | 4.82                                    |
| **Weight**          | kg(lb)  | 0.7 (1.54)                              |
| **Reach**           | mm (in) | 380 (14.9)                              |
| **Rated Voltage**   | VDC     | 12                                      |
| **Communication**   | -       | RS-485 (Multi Drop Bus)                 |
| **Power(Joint)**    | W       | 27.6                                    |
| **Software**        | -       | ROS, Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -       | Laptop PC, OpenCR                       |

## [Dimension](#dimension)

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_spec_side.png)

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_spec_gripper.jpg)

# [Hardware Setup](#hardware-setup)

[Parts of OpenManipulator](https://docs.google.com/a/robotis.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit?usp=sharing)

[DIY Manual](https://drive.google.com/open?id=1c5U0v2dQhYiulqiWI0VQMameG82WCc-4rl6J6zlQejA)

[CAD Files](http://www.robotis.com/service/download.php?no=690)

![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_OnShape.jpg)

* Items that are painted in purple are purchased on ROBOTIS SHOP
* Items that are painted in green are purchased on shopping mall
* Items that are painted in yellow are 3D printing parts

# [Software Setup](#software-setup)

## [ROS and Gazebo](#ros-and-gazebo)

Install dependent packages for the OpenManipulator.

```
$ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-dynamixel-sdk ros-kinetic-dynamixel-workbench-toolbox ros-kinetic-industrial-core 
```

```
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_simulations.git
$ cd ~/catkin_ws && catkin_make 
```

If catkin_make command is completed without any errors, preparation for OpenManipulator is done.

Load an OpenManipulator on RViz.

```
$ roslaunch open_manipulator_description open_manipulator_rviz.launch 
```

![](/assets/images/platform/openmanipulator/OpenManipulator_rviz.png)

# [Bringup](#bringup)

To load an OpenManipulator with DYNAMIXEL X-series(XM or XL), you can set a arguments what you configure your own Dynamixel

  ```
  <launch>
    <arg name="use_robot_name"         default="open_manipulator"/>
    <arg name="device_name"            default="/dev/ttyUSB0"/>
    <arg name="baud_rate"              default="1000000"/>
    <arg name="protocol_version"       default="2.0"/>

    <arg name="joint_controller"       default="position_mode"/>

    <arg name="joint1_id"              default="1"/>
    <arg name="joint2_id"              default="2"/>
    <arg name="joint3_id"              default="3"/>
    <arg name="joint4_id"              default="4"/>

    <arg name="gripper_controller"     default="current_mode"/>

    <arg name="gripper_id"             default="5"/>

    <node pkg="open_manipulator_dynamixel_ctrl" type="dynamixel_controller" name="dynamixel_controller" required="true" output="screen">
      <param name="robot_name"           value="$(arg use_robot_name)"/>
      <param name="device_name"          value="$(arg device_name)"/>
      <param name="baud_rate"            value="$(arg baud_rate)"/>
      <param name="protocol_version"     value="$(arg protocol_version)"/>

      <param name="joint_controller"     value="$(arg joint_controller)"/>

      <param name="joint1_id"            value="$(arg joint1_id)"/>
      <param name="joint2_id"            value="$(arg joint2_id)"/>
      <param name="joint3_id"            value="$(arg joint3_id)"/>
      <param name="joint4_id"            value="$(arg joint4_id)"/>

      <param name="gripper_controller"   value="$(arg gripper_controller)"/>

      <param name="gripper_id"           value="$(arg gripper_id)"/>
    </node>
  </launch>
  ```

  ```
  $ roslaunch open_manipulator_dynamixel_ctrl dynamixel_controller.launch
  ```

Type `rostopic list` to check which topic is activated

  ```
  /joint_states
  /open_manipulator/goal_gripper_position
  /open_manipulator/goal_joint_position
  /rosout
  /rosout_agg
  ```  

OpenManipulator is controllered by ROS message. For example, to use below command make publish joint position(radian)

  ```
  $ rostopic pub /open_manipulator/goal_joint_position sensor_msgs/JointState "header:
  seq: 0
  stamp: {secs: 0, nsecs: 0}
  frame_id: ''
name: ['']
position: [0]
velocity: [0]
effort: [0]"
  ```
  or using RQT

  ![](/assets/images/platform/openmanipulator/OpenManipulator_rqt.png)

# [Manipulation](#manipulation)

We provide manipulation layer to use MoveIt!. You can handle it using RViz or ROS messages

  ```
  $ roslaunch open_manipulator_moveit open_manipulator_demo.launch use_gazebo:=false
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

In order to control gripper, please use topic publish with below command in a new terminal window
(parameters : `grip_on`, `grip_off`, `neutral`)

  ```
  $ rostopic pub /open_manipulator/gripper std_msgs/String "data: 'grip_on'" --once
  ```

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gripper.png)

# [Mobile Manipulation](#mobile-manipulation)

  **Tip :** You can get a more information about it in [Manipulation section of TurtleBot3](/docs/en/platform/turtlebot3/manipulation/#manipulation)
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

  **Tip :** TB3_MODEL =  `waffle`, `waffle_pi` 
  {: .notice--info}

  ```
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ roslaunch open_manipulator_with_tb3_description open_manipulator_with_tb3_rviz.launch
  ```

![](/assets/images/platform/openmanipulator/TurtleBot3_with_Open_Manipulator.png)

# [Simulation](#gazebo-simulation)

## [Gazebo](#gazebo)

  **NOTE** : This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
  {: .notice--info}

### [Spawn Model](#spawn-model)

Load an OpenManipulator on Gazebo simulator and click `Play` button

  ```
  $ roslaunch open_manipulator_gazebo open_manipulator_gazebo.launch
  ```

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gazebo_1.png)

Type `rostopic list` to check which topic is activated

  ```
  /clock
  /gazebo/link_states
  /gazebo/model_states
  /gazebo/set_link_state
  /gazebo/set_model_state
  /open_manipulator/grip_joint_position/command
  /open_manipulator/grip_joint_position/pid/parameter_descriptions
  /open_manipulator/grip_joint_position/pid/parameter_updates
  /open_manipulator/grip_joint_position/state
  /open_manipulator/grip_joint_sub_position/command
  /open_manipulator/grip_joint_sub_position/pid/parameter_descriptions
  /open_manipulator/grip_joint_sub_position/pid/parameter_updates
  /open_manipulator/grip_joint_sub_position/state
  /open_manipulator/joint1_position/command
  /open_manipulator/joint1_position/pid/parameter_descriptions
  /open_manipulator/joint1_position/pid/parameter_updates
  /open_manipulator/joint1_position/state
  /open_manipulator/joint2_position/command
  /open_manipulator/joint2_position/pid/parameter_descriptions
  /open_manipulator/joint2_position/pid/parameter_updates
  /open_manipulator/joint2_position/state
  /open_manipulator/joint3_position/command
  /open_manipulator/joint3_position/pid/parameter_descriptions
  /open_manipulator/joint3_position/pid/parameter_updates
  /open_manipulator/joint3_position/state
  /open_manipulator/joint4_position/command
  /open_manipulator/joint4_position/pid/parameter_descriptions
  /open_manipulator/joint4_position/pid/parameter_updates
  /open_manipulator/joint4_position/state
  /open_manipulator/joint_states
  /rosout
  /rosout_agg
  ```

OpenManipulator in Gazebo is controllered by ROS message. For example, to use below command make publish joint position(radian)

  ```
  $ rostopic pub /open_manipulator/joint2_position/command std_msgs/Float64 "data: -1.0" --once
  ```

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gazebo_2.png)

## [MoveIt!](#moveit)

You can use MoveIt! to manipulate OpenManipulator. Please refer to [Manipulation part](/docs/en/platform/openmanipulator/#manipulation)

Launch MoveIt!

  ```
  $ roslaunch open_manipulator_moveit open_manipulator_demo.launch use_gazebo:=true
  ```

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_sim_1.jpg)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_moveit_sim_2.jpg)

Gripping (parameters : `grip_on`, `grip_off`, `neutral`)

  ```
  $ rostopic pub /open_manipulator/gripper std_msgs/String "data: 'grip_on'" --once
  ```

  ![](/assets/images/platform/openmanipulator/OpenManipulator_Chain_gripper.png)

# [Embedded board Setup](#embedded-board-setup)

  - **Comming Soon**

## [Arduino IDE](#arduino-ide)

  - [Arduino IDE for using OpenCR](/docs/en/parts/controller/opencr10/#arduino-ide)

## [Processing](#processing)

  - [Download Processing](https://processing.org/download/)

  ![](/assets/images/platform/openmanipulator/OpenManipulator_chain_processing.png)

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

|                     | Unit    | Chain with XM430-W350                   |
| ------------------- | ------- | --------------------------------------- |
| **Input Voltage**   | V       | 12                                      |
| **DOF**             | -       | 4 (3 DOF + 1 End-Effector)              |
| **Speed(Joint)**    | rad/sec | 4.82                                    |
| **Weight**          | kg(lb)  | 0.52 (1.14)                             |
| **Reach**           | mm (in) | 234 (9.21)                              |
| **Rated Voltage**   | VDC     | 12                                      |
| **Communication**   | -       | RS-485 (Multi Drop Bus)                 |
| **Power(Joint)**    | W       | 27.6                                    |
| **Software**        | -       | ROS, Dynamixel SDK, Arduino, Processing |
| **Main Controller** | -       | Laptop PC, OpenCR                       |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_spec_side.png)

### Hardware Setup

[Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1916070381)

[CAD Files](http://www.robotis.com/service/download.php?no=691)

![](/assets/images/platform/openmanipulator/OpenManipulator_SCARA_OnShape.png)

* Items that are painted in purple are purchased on ROBOTIS SHOP
* Items that are painted in green are purchased on shopping mall
* Items that are painted in yellow are 3D printing parts

### Software Setup

  - **Comming Soon**

### Video

 <iframe width="560" height="315" src="https://www.youtube.com/embed/4PK3I1JfSzc" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>

## [OpenManipulator Link](#openmanipulator-link)

![](/assets/images/platform/openmanipulator/OpenManipulator_Link.png)

### Specification

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_Capture.png)

|                          | Unit    | Chain with XM430-W350                   |
| ------------------------ | ------- | --------------------------------------- |
| **Input Voltage**        | V       | 12                                      |
| **DOF**                  | -       | 3                                       |
| **Payload With Suction** | g (lb)  | 400 ~ 450 (0.88 ~ 0.99)                 |
| **Speed(Joint)**         | rad/sec | 4.82                                    |
| **Weight**               | kg(lb)  | 0.53 (1.16)                             |
| **Reach**                | mm (in) | 330 (12.99)                             |
| **Rated Voltage**        | VDC     | 12                                      |
| **Communication**        | -       | RS-485 (Multi Drop Bus)                 |
| **Power(Joint)**         | W       | 27.6                                    |
| **Software**             | -       | ROS, Dynamixel SDK, Arduino, Processing |
| **Main Controller**      | -       | Laptop PC, OpenCR                       |

### Dimension

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_spec_side.png)

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_spec_up.png)

### Hardware Setup

[Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=1110711693)

[CAD Files](http://www.robotis.com/service/download.php?no=692)

![](/assets/images/platform/openmanipulator/OpenManipulator_Link_OnShape.png)

* Items that are painted in purple are purchased on ROBOTIS SHOP
* Items that are painted in green are purchased on shopping mall
* Items that are painted in yellow are 3D printing parts

### Software Setup

  - **Comming Soon**

### Video

  - **Comming Soon**

## [OpenManipulator Planar](#openmanipulator-planar)

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar.png)

### Specification

  - **Comming Soon**

### Dimension

  - **Comming Soon**

### Hardware Setup

[Parts of OpenManipulator](https://docs.google.com/spreadsheets/d/1h46Vw3amU0FZl3JSRS42BNoAaKeJoDlHAJGMKVe05ts/edit#gid=64381687)

[CAD Files](http://www.robotis.com/service/download.php?no=761)

![](/assets/images/platform/openmanipulator/OpenManipulator_Planar_OnShape.png)

* Items that are painted in purple are purchased on ROBOTIS SHOP
* Items that are painted in green are purchased on shopping mall
* Items that are painted in yellow are 3D printing parts

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

[CAD Files](http://www.robotis.com/service/download.php?no=762)

![](/assets/images/platform/openmanipulator/OpenManipulator_Delta_OnShape.png)

* Items that are painted in purple are purchased on ROBOTIS SHOP
* Items that are painted in green are purchased on shopping mall
* Items that are painted in yellow are 3D printing parts

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

[CAD Files](http://www.robotis.com/service/download.php?no=763)

![](/assets/images/platform/openmanipulator/OpenManipulator_Stewart_OnShape.png)

* Items that are painted in purple are purchased on ROBOTIS SHOP
* Items that are painted in green are purchased on shopping mall
* Items that are painted in yellow are 3D printing parts

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

[CAD Files](http://www.robotis.com/service/download.php?no=764)

![](/assets/images/platform/openmanipulator/OpenManipulator_Linear_OnShape.png)

* Items that are painted in purple are purchased on ROBOTIS SHOP
* Items that are painted in green are purchased on shopping mall
* Items that are painted in yellow are 3D printing parts

### Software Setup

  - **Comming Soon**

### Video

  - **Comming Soon**


[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenCR Manual]: /docs/en/parts/controller/opencr10/
