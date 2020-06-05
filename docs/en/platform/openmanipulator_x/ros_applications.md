---
layout: archive
lang: en
ref: openmanipulator_x_ros_applications
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_applications/
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 11
---

<div style="counter-reset: h1 10"></div>

# [[ROS] Applications](#ros-applications)

## [Master and Slave](#master-and-slave)

In this example, if the user is holding the master OpenMANIPULATOR, the slave OpenMANIPULATOR-X moves like master robot. Recording mode allows you to save the trajectory as you move the master OpenMANIPULATOR-X and play it back to the slave OpenMANIPULATOR.

<iframe width="560" height="315" src="https://www.youtube.com/embed/kTS3Yx75mLo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [Setup OpenMANIPULATOR-X](#setup-openmanipulator-x)
Since you need to control two OpenManipulators on one PC, use two U2D2s and two OpenManipulators to connect as shown below.

![](/assets/images/platform/openmanipulator_x/OpenManipulator_master_slave_connection.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_master_slave.png)

#### [Master OpenMANIPULATOR-X](#master-openmanipulators-x)
Master OpenMANIPULATOR-X is a robot that is controlled by the user. This is easy to move because no torque is applied to dynamixel. DYNAMIXEL of master OpenMANIPULATOR-X sets the ID as below and the baudrate as 1000000bps.

|  Name   | DYNAMIXEL ID |
|:-------:|:------------:|
| Joint 1 |      21       |
| Joint 2 |      22       |
| Joint 3 |      23       |
| Joint 4 |      24       |
| Gripper |      25       |

#### [Slave OpenMANIPULATOR-X](#slave-openmanipulators-x)
Slave OpenMANIPULATOR-X moves synchronously with Master OpenMANIPULATOR. DYNAMIXEL of slave OpenMANIPULATOR-X sets the ID as below and the baudrate as 1000000bps. This is the same as the default OpenMANIPULATOR-X setting.

|  Name   | DYNAMIXEL ID |
|:-------:|:------------:|
| Joint 1 |      11      |
| Joint 2 |      12      |
| Joint 3 |      13      |
| Joint 4 |      14      |
| Gripper |      15      |

### [Install Package](#install-package)
Run the following command in a terminal window.

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_applications.git
$ cd ~/catkin_ws && catkin_make
```
If the catkin_make command has been completed without any errors, all the preparations are done.

### [Execute Example](#execute-example)
Please, open the terminal window, run roscore as entering following command.

``` bash
$ roscore
```

After run roscore, Run **the controller of slave OpenMANIPULATOR-X**. Open the other terminal window and enter the following command in the terminal.      
`dynamixel_usb_port` is a parameter to set use port to connected with DYNAMIXEL of slave OpenMANIPULATOR. It should be set **/dev/ttyUSB@** and it is different from use port of master OpenMANIPULATOR.

``` bash
$ roslaunch open_manipulator_controller open_manipulator_controller.launch dynamixel_usb_port:=/dev/ttyUSB0
```

{% capture warning_01 %}

**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. It might stop operation because of joint position out of range.  
The picture on the below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque isn't enabled.    
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

If the master OpenMANIPULATOR-X controller has been launched successfully, the terminal will show the following message.

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

And Open the other terminal window and enter the following command in the terminal. This command is to run **the controller of master OpenMANIPULATOR**.     
`usb_port` is a parameter to set use port to connected with DYNAMIXEL of master OpenMANIPULATOR. It should be set **/dev/ttyUSB@** and it is different from use port of slave OpenMANIPULATOR.

``` bash
$ roslaunch open_manipulator_master_slave open_manipulator_master.launch usb_port:=/dev/ttyUSB1
```

If the slave OpenMANIPULATOR-X controller has been launched successfully, the terminal will show the following message.

```
SUMMARY
========

PARAMETERS
 * /open_manipulator/open_manipulator_master/gripper_id: 5
 * /open_manipulator/open_manipulator_master/joint1_id: 1
 * /open_manipulator/open_manipulator_master/joint2_id: 2
 * /open_manipulator/open_manipulator_master/joint3_id: 3
 * /open_manipulator/open_manipulator_master/joint4_id: 4
 * /open_manipulator/open_manipulator_master/service_call_period: 0.01
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /open_manipulator/
    open_manipulator_master (open_manipulator_master_slave/open_manipulator_master)

ROS_MASTER_URI=http://localhost:11311

process[open_manipulator/open_manipulator_master-1]: started with pid [32026]
Joint Dynamixel ID : 21, Model Name : XM430-W350
Joint Dynamixel ID : 22, Model Name : XM430-W350
Joint Dynamixel ID : 23, Model Name : XM430-W350
Joint Dynamixel ID : 24, Model Name : XM430-W350
Gripper Dynamixel ID : 25, Model Name :XM430-W350
```

So, you can see the following message in the terminal window. You can check the current control mode and robot status(joint angle, tool position).

```
-----------------------------
Control Your OpenMANIPULATOR!
-----------------------------
Present Control Mode
Master - Slave Mode
-----------------------------
1 : Master - Slave Mode
2 : Start Recording Trajectory
3 : Stop Recording Trajectory
4 : Play Recorded Trajectory
-----------------------------
Present Joint Angle J1: -0.170 J2: 0.367 J3: -0.046 J4: 0.959
Present Tool Position: 0.000
-----------------------------
```
There are four control modes. Please enter that number in the terminal.

1. Master-Slave Mode: Master robot and slave robot move synchronously.
2. Start Recording Trajectory: Master robot and slave robot move synchronously and the controller records the moving trajectory.
3. Stop Recording Trajectory: Ends the recording.
4. Play Recorded Trajectory: The trajectory recorded in the 2nd mode is reproduced only by the slave robot.

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
