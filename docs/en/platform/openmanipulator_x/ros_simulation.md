---
layout: archive
lang: en
ref: openmanipulator_x_ros_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_simulation/
sidebar:
  title: OpenMANIPULATOR-X
  nav: "openmanipulator_x"
---

<div style="counter-reset: h1 7"></div>

# [[ROS] Simulation](#ros-simulation)

{% capture notice_01 %}
**NOTE**:
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be run on PC with ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Launch gazebo](#launch-gazebo)

Load OpenManipulator-X on Gazebo simulator and click on Play `▶` button.

  ``` bash
  $ roslaunch open_manipulator_gazebo open_manipulator_gazebo.launch
  ```

A red box is pointing end-effector link.

  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_gazebo_1.png)

Enter `rostopic list` to list up the activated topics.

  ```
  /clock
  /gazebo/link_states
  /gazebo/model_states
  /gazebo/set_link_state
  /gazebo/set_model_state
  /open_manipulator/gripper/kinematics_pose
  /open_manipulator/gripper_position/command
  /open_manipulator/gripper_sub_position/command
  /open_manipulator/joint1_position/command
  /open_manipulator/joint2_position/command
  /open_manipulator/joint3_position/command
  /open_manipulator/joint4_position/command
  /open_manipulator/joint_states
  /open_manipulator/option
  /open_manipulator/states
  /rosout
  /rosout_agg
  ```
Open an [open_manipulator_control_gui](/docs/en/platform/openmanipulator_x/ros_operation/#gui-program)

  ![](/assets/images/platform/openmanipulator_x/OpenManipulator_Chain_gazebo_2.png)

## [Controller for gazebo](#controller-for-gazebo)

Launch the open_manipulator_controller for gazebo simulation.

  ``` bash
  $ roslaunch open_manipulator_controller open_manipulator_controller.launch use_platform:=false
  ```
{% capture notice_01 %}
**NOTE**:
- To control the OpenMANIPULATOR-X in the Gazebo environment using the OpenMANIPULATOR-X Controller, the controller must set the **use_platform** parameter to **false** because it needs to send messages to gazebo instead of Platform.
- If you want to manipulate the OpenMANIPULATOR-X using Moveit within the Gazebo simulator, you should also convert the **use_moveit** to **ture** in open_manipulator_controller launch file.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

If the OpenMANIPULATOR-X controller for gazebo simulation Launched successfully, the terminal will represent below messages.

```
SUMMARY
========

PARAMETERS
 * /open_manipulator/control_period: 0.01
 * /open_manipulator/moveit_sample_duration: 0.05
 * /open_manipulator/planning_group_name: arm
 * /open_manipulator/using_moveit: False
 * /open_manipulator/using_platform: False
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator (open_manipulator_controller/open_manipulator_controller)

ROS_MASTER_URI=http://localhost:11311

process[open_manipulator-1]: started with pid [9820]
[ INFO] [1544506914.862653563]: Ready to simulate /open_manipulator on Gazebo
```
**NOTE** : In OpenMANIPULATOR-X controller for gazebo simulation, Joint and Gripper Dynamixel are not enable, following messages will not display :  
Joint Dynamixel ID : 11, Model Name : XM430-W350  
Joint Dynamixel ID : 12, Model Name : XM430-W350  
Joint Dynamixel ID : 13, Model Name : XM430-W350  
Joint Dynamixel ID : 14, Model Name : XM430-W350  
Gripper Dynamixel ID : 15, Model Name :XM430-W350
{: .notice--info}

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
