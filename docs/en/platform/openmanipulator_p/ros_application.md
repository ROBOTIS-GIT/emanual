---
layout: archive
lang: en
ref: openmanipulator_p_ros_applications
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_p/ros_applications/
sidebar:
  title: "OpenMANIPULATOR-P"
  nav: "openmanipulator_p"
product_group: openmanipulator_p
page_number: 11
---

<div style="counter-reset: h1 10"></div>

# [[ROS] Application](#ros-application)

## [Master and Slave](#master-and-slave)

In this example, if the user is holding the master OpenMANIPULATOR, the slave OpenMANIPULATOR-P moves like master robot. Recording mode allows you to save the trajectory as you move the master OpenMANIPULATOR-P and play it back to the slave OpenMANIPULATOR.

### [Setup OpenMANIPULATOR-P](#setup-openmanipulator-p)
Since you need to control two OpenManipulators on one PC, use two U2D2s and two OpenManipulators to connect as shown below.

![](/assets/images/platform/openmanipulator_x/OpenManipulator_master_slave_connection.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_master_slave.png)

#### [Master OpenMANIPULATOR](#master-openmanipulator)
Master OpenMANIPULATOR-P is a robot that is controlled by the user. This is easy to move because no torque is applied to DYNAMIXEL. DYNAMIXEL of master OpenMANIPULATOR-P sets the ID as below and the baudrate as 1000000bps.

|  Name   | DYNAMIXEL ID |
|:-------:|:------------:|
| Joint 1 |      1      |
| Joint 2 |      2      |
| Joint 3 |      3      |
| Joint 4 |      4      |
| Joint 5 |      5      |
| Joint 6 |      6      |
| Gripper |      7      |

#### [Slave OpenMANIPULATOR](#slave-openmanipulator)
Slave OpenMANIPULATOR-P moves synchronously with Master OpenMANIPULATOR. DYNAMIXEL of slave OpenMANIPULATOR-P sets the ID as below and the baudrate as 1000000bps. This is the same as the default OpenMANIPULATOR-P setting.

|  Name   | DYNAMIXEL ID |
|:-------:|:------------:|
| Joint 1 |      1      |
| Joint 2 |      2      |
| Joint 3 |      3      |
| Joint 4 |      4      |
| Joint 5 |      5      |
| Joint 6 |      6      |
| Gripper |      7      |

### [Install Package](#install-package)
Run the following command in a terminal window.

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_p_applications.git
$ cd ~/catkin_ws && catkin_make
```
If the catkin_make command has been completed without any errors, all the preparations are done.

### [Execute Example](#execute-example)
Please, open the terminal window, run roscore as entering following command.

``` bash
$ roscore
```

After run roscore, Run **the controller of slave OpenMANIPULATOR**. Open the other terminal window and enter the following command in the terminal.      
`dynamixel_usb_port` is a parameter to set use port to connected with DYNAMIXEL of slave OpenMANIPULATOR. It should be set **/dev/ttyUSB@** and it is different from use port of master OpenMANIPULATOR.

``` bash
$ roslaunch open_manipulator_p_master_slave open_manipulator_p_master_slave.launch usb_port:=/dev/ttyUSB1
```

{% capture warning_01 %}
**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-P. It might stop operation because of joint position out of range.  
The picture on the below is showing you the ideal pose of OpenMANIPULATOR-P. Please adjust each joints along with the following picture when DYNAMIXEL torque isn't enabled.    
  
<img src="/assets/images/platform/openmanipulator_p/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

If the master OpenMANIPULATOR-P controller has been launched successfully, the terminal will show the following message.

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

And Open the other terminal window and enter the following command in the terminal. This command is to run **the controller of master OpenMANIPULATOR-P**.     
`usb_port` is a parameter to set use port to connected with DYNAMIXEL of master OpenMANIPULATOR. It should be set **/dev/ttyUSB@** and it is different from use port of slave OpenMANIPULATOR.

``` bash
$ roslaunch open_manipulator_master_slave open_manipulator_master.launch usb_port:=/dev/ttyUSB1
```

If the slave OpenMANIPULATOR-P controller has been launched successfully, the terminal will show the following message.

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
Joint Dynamixel ID : 1, Model Name : XM430-W350
Joint Dynamixel ID : 2, Model Name : XM430-W350
Joint Dynamixel ID : 3, Model Name : XM430-W350
Joint Dynamixel ID : 4, Model Name : XM430-W350
Gripper Dynamixel ID : 5, Model Name :XM430-W350
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
