---
layout: archive
lang: en
ref: openmanipulator_pro_ros_operation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_pro/ros_operation/
sidebar:
  title: "[ROS] OpenMANIPULATOR-PRO"
  nav: "openmanipulator_pro"
product_group: openmanipulator_pro
page_number: 6
---

<div style="counter-reset: h1 5"></div>

# [[ROS] Operation](#ros-operation)

## [GUI Program](#gui-program)

{% capture notice_01 %}
**NOTE**:
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction has been tested on `Ubuntu 18.04` and `ROS Melodic`
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [OpenMANIPULATOR-PRO controller](/docs/en/platform/openmanipulator_pro/ros_controller_package/#launch-controller) instructions before running the instruction below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

You can use the GUI program to manipulate OpenMANIPULATOR-PRO. Launch `open_manipulator_pro_control_gui` node. This program shows the status of and allows users to control OpenMANIPULATOR-PRO.

```bash
$ roslaunch open_manipulator_pro_control_gui open_manipulator_pro_control_gui.launch
```

  To controll OpenMANIPULATOR-PRO, first click the `Timer Start` button.  
  
  ![](/assets/images/platform/openmanipulator_pro/OpenManipulator_GUI.png) 

  Check the status of the OpenMANIPULATOR-PRO (joint states, kinematics pose).  
  
  ![](/assets/images/platform/openmanipulator_pro/OpenManipulator_GUI2.png) 
  
  To manipulate the OpenMANIPULATOR-PRO in the [joint space]{: .popup}. Enter the joint angles and total time of the trajectory. Then click the `send` button.  
  
  ![](/assets/images/platform/openmanipulator_pro/OpenManipulator_GUI3.png)  

  To manipulate the OpenMANIPULATOR-PRO in the [task space]{: .popup}. Enter the kinematics pose of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory. Then click the `send` button.  
  
  ![](/assets/images/platform/openmanipulator_pro/OpenManipulator_GUI4.png)    

  To create a drawing trajectory with OpenMANIPULATOR-PRO. First, choose the drawing trajectory type(line, circle, rhombus, heart). And enter the parameters according to the drawing trajectory type and the total time of the drawing trajectory. Then click the `send` button.  
    
  ![](/assets/images/platform/openmanipulator_pro/OpenManipulator_GUI5.png) 

## [Teleoperation](#teleoperation)
{% capture notice_01 %}
**NOTE**:
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction has been tested on `Ubuntu 18.04` and `ROS Melodic Morenia`. 
- This instruction is supposed to be run on PC with ROS packages installed in. Please run the instruction below on your PC ROS packages installed in.
- Make sure to run [OpenMANIPULATOR-PRO controller](/docs/en/platform/openmanipulator_pro/ros-controller-package/#launch-controller) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

### [Keyboard](#keyboard)

**TIP**: Terminal can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for Terminal is `Ctrl`+`Alt`+`t`.
{: .notice--success}

Launch `open_manipulator_pro_teleop_keyboard` node for simple teleoperation test using the keyboard.  


``` bash
$ roslaunch open_manipulator_pro_teleop open_manipulator_pro_teleop_keyboard.launch
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

Enter pairing mode with PS4 by pressing and holding Playstation button + share button for 10 sec. If the light on PS4 turns blue, enter the following commands in terminal and control OpenMANIPULATOR-PRO.

``` bash
$ export ROS_NAMESPACE=/open_manipulator_pro
$ roslaunch teleop_twist_joy teleop.launch
$ roslaunch open_manipulator_pro_teleop open_manipulator_pro_teleop_joystick.launch
```

### [XBOX 360 Joystick](#xbox-360-joystick)

Install packages for teleoperation using XBOX 360 joystick.

``` bash
$ sudo apt-get install xboxdrv ros-kinetic-joy ros-kinetic-joystick-drivers ros-kinetic-teleop-twist-joy
```
Connect XBOX 360 joystick to the PC with Wireless Adapter or USB cable, and launch teleoperation packages for XBOX 360 joystick.

``` bash
$ sudo xboxdrv --silent
$ export ROS_NAMESPACE=/open_manipulator_pro
$ roslaunch teleop_twist_joy teleop.launch
$ roslaunch open_manipulator_pro_teleop open_manipulator_pro_teleop_joystick.launch
```


## [MoveIt!](#moveit)

**TIP**: Terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
{: .notice--success}

Before you launch controller using MoveIt!, check `open_manipulator_pro_controller` launch file in `open_manipulator_pro_controller` package.

  ```
  <launch>
    <arg name="use_robot_name"         default="open_manipulator_pro"/>

    <arg name="dynamixel_usb_port"     default="/dev/ttyUSB0"/>
    <arg name="dynamixel_baud_rate"    default="1000000"/>

    <arg name="control_period"         default="0.010"/>

    <arg name="use_platform"           default="true"/>

    <arg name="use_moveit"             default="false"/>
    <arg name="planning_group_name"    default="arm"/>
    <arg name="moveit_sample_duration" default="0.050"/>

    <group if="$(arg use_moveit)">
      <include file="$(find open_manipulator_pro_controller)/launch/open_manipulator_pro_moveit.launch">
        <arg name="robot_name"      value="$(arg use_robot_name)"/>
        <arg name="sample_duration" value="$(arg moveit_sample_duration)"/>
      </include>
    </group>

    <node name="$(arg use_robot_name)" pkg="open_manipulator_pro_controller" type="open_manipulator_pro_controller" output="screen" args="$(arg dynamixel_usb_port) $(arg dynamixel_baud_rate)">
        <param name="using_platform"       value="$(arg use_platform)"/>
        <param name="using_moveit"         value="$(arg use_moveit)"/>
        <param name="planning_group_name"  value="$(arg planning_group_name)"/>
        <param name="control_period"       value="$(arg control_period)"/>
        <param name="moveit_sample_duration"  value="$(arg moveit_sample_duration)"/>
    </node>

  </launch>
  ```

**Parameters List** :
The below The following parameters can be used to load [move_group](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/move_group_interface/move_group_interface_tutorial.html) package.
- `use_moveit`
- `planning_group_name`
- `moveit_sample_duration`

`use_moveit` is a parameter to set whether to use MoveIt!  
`planning_group_name` is a parameter to set in [setup_assistant](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/setup_assistant/setup_assistant_tutorial.html#step-4-add-planning-groups)  
`moveit_sample_duration` is a parameter to set sampling time when joint trajectory is planned from MoveIt!

After setting all the parameters, launch the open_manipulator_pro_controller.

  ``` bash
  $ roslaunch open_manipulator_pro_controller open_manipulator_pro_controller.launch use_moveit:=true
  ```

**Warning!**     
When launching the controller to use MoveIt!, [OpenMANIPULATOR-PRO launch file](/docs/en/platform/openmanipulator_pro/ros_controller_package/#launch-controller) must be turned off.
{: .notice--warning}

  ![](/assets/images/platform/openmanipulator_pro/moveit_launch.png)  
  
**Service Server List** :
A list of MoveIt!-related service server that open_manipulator_pro_controller has.

- `/open_manipulator_pro/moveit/get_joint_position` ([open_manipulator_pro_msgs/GetJointPosition]{: .popup})  
The user can use this service to receive a joint position which is calculated by move_group.  

- `/open_manipulator_pro/moveit/get_kinematics_pose` ([open_manipulator_pro_msgs/GetKinematicsPose]{: .popup})  
The user can use this service to receive a kinematics pose which is calculated by move_group.

- `/open_manipulator_pro/moveit/set_joint_position` ([open_manipulator_pro_msgs/SetJointPosition]{: .popup})  
The user can use this service to create a trajectory in the [joint space]{: .popup} by move_group. The user inputs the angle of the target joint and the total time of the trajectory.

- `/open_manipulator_pro/moveit/set_kinematics_pose` ([open_manipulator_pro_msgs/SetKinematicsPose]{: .popup})  
The user can use this service to create a trajectory in the [task space]{: .popup} by move_group. The user inputs the kinematics pose(orientation only) of the OpenMANIPULATOR-PRO end-effector(tool) in the [task space]{: .popup} and the total time of the trajectory.

**TIP**: If you would like to use inverse kinematics with `position_only`, check `open_manipulator_pro_moveit` -> `config` -> `kinematics.yaml` and set `position_only_ik` parameter to **True**.
{: .notice--success}

[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenCR Manual]: /docs/en/parts/controller/opencr10/
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/

[open_manipulator_pro_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_pro_msgs_GetJointPosition/
[open_manipulator_pro_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_pro_msgs_GetKinematicsPose/
[open_manipulator_pro_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_pro_msgs_SetJointPosition/
[open_manipulator_pro_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_pro_msgs_SetKinematicsPose/
[open_manipulator_pro_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_pro_msgs_SetActuatorState/
[open_manipulator_pro_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_pro_msgs_SetDrawingTrajectory/

[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[_open_manipulator_pro_msgs/KinematicsPose]: /docs/en/popup/_open_manipulator_pro_msgs_KinematicsPose/
[_open_manipulator_pro_msgs/OpenManipulatorState]: /docs/en/popup/_open_manipulator_pro_msgs_OpenManipulatorState/
[std_msgs::String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/_open_manipulator_pro_coordinates/
[joint space]: /docs/en/popup/_open_manipulator_pro_coordinates/




[std_msgs/String]: /docs/en/popup/std_msgs_string/
[std_msgs/Float64]: /docs/en/popup/std_msgs_float64_msg/
[geometry_msgs/Pose]: /docs/en/popup/geometry_msgs_Pose_msg/
[robotis_controller_msgs/StatusMsg]: /docs/en/popup/StatusMsg.msg/
[manipulator_manipulation_module_msgs/JointPose]: /docs/en/popup/JointPose.msg/
[manipulator_manipulation_module_msgs/KinematicsPose]: /docs/en/popup/KinematicsPose.msg/
[manipulator_manipulation_module_msgs/GetJointPose]: /docs/en/popup/GetJointPose.srv/
[manipulator_manipulation_module_msgs/GetKinematicsPose]: /docs/en/popup/GetKinematicsPose.srv/
