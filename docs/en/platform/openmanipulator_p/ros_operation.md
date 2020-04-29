---
layout: archive
lang: en
ref: openmanipulator_p_ros_operation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_p/ros_operation/
sidebar:
  title: "OpenMANIPULATOR-P"
  nav: "openmanipulator_p"
product_group: openmanipulator_p
page_number: 6
---

<div style="counter-reset: h1 5"></div>

# [[ROS] Operation](#ros-operation)

## [GUI Program](#gui-program)

{% capture notice_01 %}
**NOTE**:
- The test is done on `ROS Kinetic Kame` installed in `Ubuntu 16.04`.
- The test is done on `ROS Melodic Morenia`installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_p/ros_setup/#install-ros-packages)
- Make sure to run the [OpenMANIPULATOR-P controller](/docs/en/platform/openmanipulator_p/ros_controller_package/#launch-controller) instructions before running the instruction below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

You can use the GUI program to manipulate OpenMANIPULATOR-P. Launch `open_manipulator_p_control_gui` node. This program shows the status of and allows users to control OpenMANIPULATOR-P.

```bash
$ roslaunch open_manipulator_p_control_gui open_manipulator_p_control_gui.launch
```

  To controll OpenMANIPULATOR-P, first click the `Timer Start` button.  
  
  ![](/assets/images/platform/openmanipulator_p/OpenManipulator_GUI.png) 

  Check the status of the OpenMANIPULATOR-P (joint states, kinematics pose).  
  
  ![](/assets/images/platform/openmanipulator_p/OpenManipulator_GUI2.png) 
  
  To manipulate the OpenMANIPULATOR-P in the [joint space]{: .popup}. Enter the joint angles and total time of the trajectory. Then click the `send` button.  
  
  ![](/assets/images/platform/openmanipulator_p/OpenManipulator_GUI3.png)  

  To manipulate the OpenMANIPULATOR-P in the [task space]{: .popup}. Enter the kinematics pose of the OpenMANIPULATOR-P end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory. Then click the `send` button.  
  
  ![](/assets/images/platform/openmanipulator_p/OpenManipulator_GUI4.png)    

  To create a drawing trajectory with OpenMANIPULATOR-P. First, choose the drawing trajectory type(line, circle, rhombus, heart). And enter the parameters according to the drawing trajectory type and the total time of the drawing trajectory. Then click the `send` button.  
    
  ![](/assets/images/platform/openmanipulator_p/OpenManipulator_GUI5.png) 

## [Teleoperation](#teleoperation)
{% capture notice_01 %}
**NOTE**:
- The test is done on `ROS Kinetic Kame` installed in `Ubuntu 16.04`.
- The test is done on `ROS Melodic Morenia`installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_p/ros_setup/#install-ros-packages)
- Make sure to run [OpenMANIPULATOR-P controller](/docs/en/platform/openmanipulator_p/ros-controller-package/#launch-controller) instructions before use of the instruction
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

### [Keyboard](#keyboard)

**TIP**: Terminal can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for Terminal is `Ctrl`+`Alt`+`t`.
{: .notice--success}

Launch `open_manipulator_p_teleop_keyboard` node for simple teleoperation test using the keyboard.  


``` bash
$ roslaunch open_manipulator_p_teleop open_manipulator_p_teleop_keyboard.launch
```
If the node is successfully launched, the following instruction will appear in the terminal window.  

```
---------------------------------
Control Your OpenManipulator-PRO!
---------------------------------
w : increase x axis in task space
s : decrease x axis in task space
a : increase y axis in task space
d : decrease y axis in task space
z : increase z axis in task space
x : decrease z axis in task space

r : increase joint 1 angle
f : decrease joint 1 angle
t : increase joint 2 angle
g : decrease joint 2 angle
y : increase joint 3 angle
h : decrease joint 3 angle
u : increase joint 4 angle
j : decrease joint 4 angle
i : increase joint 5 angle
k : decrease joint 5 angle
o : increase joint 6 angle
l : decrease joint 6 angle
v : gripper open
b : gripper close
       
1 : init pose
2 : home pose
       
q to quit
-------------------------------------------------------------------------------
Present Joint Angle J1: 0.000 J2: 0.000 J3: 0.000 J4: 0.000 J5: 0.000 J6: 0.000
Present Kinematics Position X: 0.000 Y: 0.000 Z: 0.000
-------------------------------------------------------------------------------

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

Enter pairing mode with PS4 by pressing and holding Playstation button + share button for 10 sec. If the light on PS4 turns blue, enter the following commands in terminal and control OpenMANIPULATOR-P.

``` bash
$ export ROS_NAMESPACE=/open_manipulator_p
$ roslaunch teleop_twist_joy teleop.launch
$ roslaunch open_manipulator_p_teleop open_manipulator_p_teleop_joystick.launch
```

### [XBOX 360 Joystick](#xbox-360-joystick)

Install packages for teleoperation using XBOX 360 joystick.

``` bash
$ sudo apt-get install xboxdrv ros-kinetic-joy ros-kinetic-joystick-drivers ros-kinetic-teleop-twist-joy
```
Connect XBOX 360 joystick to the PC with Wireless Adapter or USB cable, and launch teleoperation packages for XBOX 360 joystick.

``` bash
$ sudo xboxdrv --silent
$ export ROS_NAMESPACE=/open_manipulator_p
$ roslaunch teleop_twist_joy teleop.launch
$ roslaunch open_manipulator_p_teleop open_manipulator_p_teleop_joystick.launch
```

[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenCR Manual]: /docs/en/parts/controller/opencr10/

[open_manipulator_p_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_p_msgs_GetJointPosition/
[open_manipulator_p_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_p_msgs_GetKinematicsPose/
[open_manipulator_p_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_p_msgs_SetJointPosition/
[open_manipulator_p_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_p_msgs_SetKinematicsPose/
[open_manipulator_p_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_p_msgs_SetActuatorState/
[open_manipulator_p_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_p_msgs_SetDrawingTrajectory/

[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[_open_manipulator_p_msgs/KinematicsPose]: /docs/en/popup/_open_manipulator_p_msgs_KinematicsPose/
[_open_manipulator_p_msgs/OpenManipulatorState]: /docs/en/popup/_open_manipulator_p_msgs_OpenManipulatorState/
[std_msgs::String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/_open_manipulator_p_coordinates/
[joint space]: /docs/en/popup/_open_manipulator_p_coordinates/




[std_msgs/String]: /docs/en/popup/std_msgs_string/
[std_msgs/Float64]: /docs/en/popup/std_msgs_float64_msg/
[geometry_msgs/Pose]: /docs/en/popup/geometry_msgs_Pose_msg/
[robotis_controller_msgs/StatusMsg]: /docs/en/popup/StatusMsg.msg/
[manipulator_manipulation_module_msgs/JointPose]: /docs/en/popup/JointPose.msg/
[manipulator_manipulation_module_msgs/KinematicsPose]: /docs/en/popup/KinematicsPose.msg/
[manipulator_manipulation_module_msgs/GetJointPose]: /docs/en/popup/GetJointPose.srv/
[manipulator_manipulation_module_msgs/GetKinematicsPose]: /docs/en/popup/GetKinematicsPose.srv/
