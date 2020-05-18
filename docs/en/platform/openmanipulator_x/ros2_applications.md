---
layout: archive
lang: en
ref: ros2_openmanipulator_x_applications
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros2_applications/
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 18
---

<div style="counter-reset: h1 17"></div>

# [[ROS 2] Applications](#ros-2-applications)

## [Master and Slave](#master-slave)

In this example, if the user is holding the master OpenManipulator, the slave OpenManipulator-X moves like master robot. Recording mode allows you to save the trajectory as you move the master OpenManipulator-X and play it back to the slave OpenManipulator.

<iframe width="560" height="315" src="https://www.youtube.com/embed/kTS3Yx75mLo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [Setup OpenManipulator-X](#setup-openmanipulator-x)
Since you need to control two OpenManipulators on one PC, use two U2D2s and two OpenManipulators to connect as shown below.

![](/assets/images/platform/openmanipulator_x/OpenManipulator_master_slave_connection.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_master_slave.png)
#### Master OpenManipulator
Master OpenManipulator-X is a robot that is controlled by the user. This is easy to move because no torque is applied to dynamixel. DYNAMIXEL of master OpenManipulator-X sets the ID as below and the baudrate as 1000000bps.

|  Name   | DYNAMIXEL ID |
|:-------:|:------------:|
| Joint 1 |      1       |
| Joint 2 |      2       |
| Joint 3 |      3       |
| Joint 4 |      4       |
| Gripper |      5       |

#### Slave OpenManipulator
Slave OpenManipulator-X moves synchronously with Master OpenManipulator. DYNAMIXEL of slave OpenManipulator-X sets the ID as below and the baudrate as 1000000bps. This is the same as the default OpenManipulator-X setting.

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
$ cd ~/robotis_ws/src/
$ git clone -b ros https://github.com/ROBOTIS-GIT/open_manipulator_applications.git
$ cd ~/robotis_ws && colcon build --symlink-install  
```
If the catkin_make command has been completed without any errors, all the preparations are done.

### [Execute Example](#execute-example)

Run **the controller of slave OpenManipulator**. Open the other terminal window and enter the following command in the terminal.      
`dynamixel_usb_port` is a parameter to set use port to connected with Dynamixel of slave OpenManipulator. It should be set **/dev/ttyUSB@** and it is different from use port of master OpenManipulator.

``` bash
$ ros2 launch open_manipulator_x_controller open_manipulator_x_controller.launch.py  
```

{% capture warning_01 %}

**WARNING** :  
Please check each joint position before running OpenMANIPULATOR-X. It might stop operation because of joint position out of range.  
The picture on the below is showing you the ideal pose of OpenMANIPULATOR-X. Please adjust each joints along with the following picture when DYNAMIXEL torque isn't enabled.    
  
<img src="/assets/images/platform/openmanipulator_x/open_manipulator_start_pose.png" width="250">
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

And Open the other terminal window and enter the following command in the terminal. This command is to run **the controller of master OpenManipulator**.     
`usb_port` is a parameter to set use port to connected with Dynamixel of master OpenManipulator. It should be set **/dev/ttyUSB@** and it is different from use port of slave OpenManipulator.

If the master OpenManipulator-X controller has been launched successfully, the terminal will show the following message.

```
port_name and baud_rate are set to /dev/ttyUSB0, 1000000 
Joint Dynamixel ID : 11, Model Name : XM430-W350
Joint Dynamixel ID : 12, Model Name : XM430-W350
Joint Dynamixel ID : 13, Model Name : XM430-W350
Joint Dynamixel ID : 14, Model Name : XM430-W350
Gripper Dynamixel ID : 15, Model Name :XM430-W350
[INFO] Succeeded to Initialise OpenManipulator-X Controller
```

And Open the other terminal window and enter the following command in the terminal. This command is to run **the controller of master OpenManipulator**.     
`usb_port` is a parameter to set use port to connected with DYNAMIXEL of master OpenManipulator. It should be set **/dev/ttyUSB@** and it is different from use port of slave OpenManipulator.

``` bash
$ ros2 run open_manipulator_x_master_slave open_manipulator_x_master_slave
```

If the slave OpenManipulator-X controller has been launched successfully, the terminal will show the following message.

```
port_name and baud_rate are set to /dev/ttyUSB1, 1000000 
Joint Dynamixel ID : 1, Model Name : XM430-W350
Joint Dynamixel ID : 2, Model Name : XM430-W350
Joint Dynamixel ID : 3, Model Name : XM430-W350
Joint Dynamixel ID : 4, Model Name : XM430-W350
Gripper Dynamixel ID : 5, Model Name :XM430-W350
```

So, you can see the following message in the terminal window. You can check the current control mode and robot status(joint angle, tool position).

```
-----------------------------
Control Your OpenManipulator!
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
