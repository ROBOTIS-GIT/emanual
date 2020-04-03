---
layout: archive
lang: en
ref: openmanipulator_x_ros_operation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_operation/
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 7
---

<div style="counter-reset: h1 6"></div>

# [[ROS] Operation](#ros-operation)

<iframe width="560" height="315" src="https://www.youtube.com/embed/dctx7Y6zNKA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [GUI Program](#gui-program)

{% capture notice_01 %}
**NOTE**:
- This instructions has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [OpenMANIPULATOR-X controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) instructions before running the instruction below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

You can use the GUI program to manipulate OpenMANIPULATOR-X. Launch `open_manipulator_control_gui` node.  This program shows the status of and allows users to control OpenMANIPULATOR-X.

``` bash
$ roslaunch open_manipulator_control_gui open_manipulator_control_gui.launch
```
To control OpenMANIPULATOR-X, first click the `Timer Start` button.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI.png)  

Check the status of OpenMANIPULATOR-X (joint states, kinematics pose).  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI2.png)  

To manipulate OpenMANIPULATOR-X in the [joint space]{: .popup}. Enter the joint angles and total time of the trajectory. Then click the `send` button.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI3.png)  

To manipulate OpenMANIPULATOR-X in the [task space]{: .popup}. Enter the kinematics pose of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory. Then click the `send` button.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI4.png)  

To create a drawing trajectory with OpenMANIPULATOR-X. First, choose the drawing trajectory type(line, circle, rhombus, heart). And enter the parameters according to the drawing trajectory type and the total time of the drawing trajectory. Then click the `send` button.  
![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI5.png)  

## [Teleoperation](#teleoperation)
{% capture notice_01 %}
**NOTE**:
- The test is done on `ROS Kinetic Kame` installed in `Ubuntu 16.04`.
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_x/ros_setup/#install-ros-packages)
- Make sure to run [OpenMANIPULATOR-X controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) instructions before use of the instruction
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

<iframe width="560" height="315" src="https://www.youtube.com/embed/FGHBMJByJ7k" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [Keyboard](#keyboard)

**TIP**: Terminal can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for Terminal is `Ctrl`+`Alt`+`t`.
{: .notice--success}

  Launch `open_manipulator_teleop_keyboard` node for simple teleoperation test using the keyboard.

  ``` bash
  $ roslaunch open_manipulator_teleop open_manipulator_teleop_keyboard.launch
  ```
  If the node is successfully launched, the following instruction will appear in the terminal window.

  ```
  ---------------------------
  Control Your OpenMANIPULATOR-X!
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

Enter pairing mode with PS4 by pressing and holding Playstation button + share button for 10 sec. If the light on PS4 turns blue, enter the following commands in terminal and control OpenMANIPULATOR-X.

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
Connect XBOX 360 joystick to the PC with wireless adapter or USB cable, and launch teleoperation packages for XBOX 360 joystick.

``` bash
$ sudo xboxdrv --silent
$ export ROS_NAMESPACE=/open_manipulator
$ roslaunch teleop_twist_joy teleop.launch
$ roslaunch open_manipulator_teleop open_manipulator_teleop_joystick.launch
```

## [MoveIt!](#moveit)

## [Install MoveIt Packages](#install-moveIt-packages)
```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_controls.git
$ cd ~/catkin_ws && catkin_make
```

### [Launch MoveIt!](#launch-moviit) 
Launch **MoveIt!** with the following command.
``` bash
$ roslaunch open_manipulator_controllers joint_trajectory_controller.launch sim:=false
```
  ![](/assets/images/platform/openmanipulator_x/moveit_launch.png)  

<!--
![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_1.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_2.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_3.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_4.png) 
-->

#### [Using MoveIt! with Gazebo](#using-moveit-with-gazebo)
If you want to use **MoveIt!** in Gazebo simulation enviroment, run the following command.
```bash
# Gazebo Simulation
$ roslaunch open_manipulator_controllers joint_trajectory_controller.launch
```

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
