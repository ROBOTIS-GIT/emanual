---
layout: archive
lang: en
ref: openmanipulator_x_ros_operation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_operation/
sidebar:
  title: OpenMANIPULATOR-X
  nav: "openmanipulator_x"
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
  To controll OpenMANIPULATOR-X, first click the `Timer Start` button.  
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI.png)  

  Check the status of the OpenMANIPULATOR-X (joint states, kinematics pose).  
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI2.png)  

  To manipulate the OpenMANIPULATOR-X in the [joint space]{: .popup}. Enter the joint angles and total time of the trajectory. Then click the `send` button.  
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI3.png)  

  To manipulate the OpenMANIPULATOR-X in the [task space]{: .popup}. Enter the kinematics pose of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory. Then click the `send` button.  
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI4.png)  

  To create a drawing trajectory with OpenMANIPULATOR-X. First, choose the drawing trajectory type(line, circle, rhombus, heart). And enter the parameters according to the drawing trajectory type and the total time of the drawing trajectory. Then click the `send` button.  
  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_GUI5.png)  

## [Teleoperation](#teleoperation)
{% capture notice_01 %}
**NOTE**:
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be run on PC with ROS packages installed in. Please run the instruction below on your PC ROS packages installed in.
- Make sure to run [OpenMANIPULATOR controller](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) instructions before running the instructions below.
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
  If the node is successfully launched, the following instruction will appeare in the terminal window.

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
Connect XBOX 360 joystick to the PC with Wireless Adapter or USB cable, and launch teleoperation packages for XBOX 360 joystick.

``` bash
$ sudo xboxdrv --silent
$ export ROS_NAMESPACE=/open_manipulator
$ roslaunch teleop_twist_joy teleop.launch
$ roslaunch open_manipulator_teleop open_manipulator_teleop_joystick.launch
```

## [MoveIt!](#moveit)

**TIP**: Terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
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
The following parameters can be used to load [move_group](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/move_group_interface/move_group_interface_tutorial.html) package.
- `use_moveit`
- `planning_group_name`
- `moveit_sample_duration`

`use_moveit` is a parameter to set whether to use MoveIt!  
`planning_group_name` is a parameter to set in [setup_assistant](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/setup_assistant/setup_assistant_tutorial.html#step-4-add-planning-groups)  
`moveit_sample_duration` is a parameter to set sampling time when joint trajectory is planned from MoveIt!

After setting all the parameters, launch the open_manipulator_pro_controller.

  ``` bash
  $ roslaunch open_manipulator_controller open_manipulator_controller.launch use_moveit:=true
  ```


**WARNING** : When launching the controller to use MoveIt!, [OpenMANIPULATOR-X launch file](/docs/en/platform/openmanipulator_x/ros_controller_package/#launch-controller) must be turned off.  
{: .notice--warning}

{% capture warning_01 %}
**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. It might stop operation because of joint position out of range.  
The picture on the below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque isn't enabled.    
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

  ![](/assets/images/platform/openmanipulator_x/moveit_launch.png)  

**Service Server List** :
A list of MoveIt!-related service server that open_manipulator_controller has.

- `/open_manipulator/moveit/get_joint_position` ([open_manipulator_msgs/GetJointPosition]{: .popup})  
The user can use this service to receive a joint position which is calculated by move_group.  

- `/open_manipulator/moveit/get_kinematics_pose` ([open_manipulator_msgs/GetKinematicsPose]{: .popup})  
The user can use this service to receive a kinematics pose which is calculated by move_group.

- `/open_manipulator/moveit/set_joint_position` ([open_manipulator_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup} by move_group. The user inputs the angle of the target joint and the total time of the trajectory.

- `/open_manipulator/moveit/set_kinematics_pose` ([open_manipulator_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup} by move_group. The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-X end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

**TIP**: If you would like to use inverse kinematics with `position_only`, check `open_manipulator_moveit` -> `config` -> `kinematics.yaml` and set `position_only_ik` parameter to **True**.
{: .notice--success}

  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_1.png)

  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_2.png)

  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_3.png)

  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_moveit_real_4.png)


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
