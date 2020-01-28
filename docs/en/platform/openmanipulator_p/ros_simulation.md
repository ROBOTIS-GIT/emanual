---
layout: archive
lang: en
ref: openmanipulator_p_ros_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_p/ros_simulation/
sidebar:
  title: "OpenMANIPULATOR-P"
  nav: "openmanipulator_p"
product_group: openmanipulator_p
page_number: 7
---

<div style="counter-reset: h1 6"></div>

# [[ROS] Simulation](#ros-simulation)

{% capture notice_01 %}
**NOTE**:
- The test is done on `ROS Kinetic Kame` installed in `Ubuntu 16.04`.
- The test is done on `ROS Melodic Morenia`installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_p/ros_setup/#install-ros-packages)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Launch gazebo](#launch-gazebo)

Load OpenManipulator-PRO on Gazebo simulator and click on Play `▶` button.

  ``` bash
  $ roslaunch open_manipulator_p_gazebo open_manipulator_p_gazebo.launch
  ```

  ![](/assets/images/platform/openmanipulator_p/launch_gazebo.png)

Enter `rostopic list` to list up the activated topics.

  ```
  /clock
  /gazebo/link_states
  /gazebo/model_states
  /gazebo/parameter_descriptions
  /gazebo/parameter_updates
  /gazebo/set_link_state
  /gazebo/set_model_state
  /gazebo_gui/parameter_descriptions
  /gazebo_gui/parameter_updates
  /open_manipulator_p/joint1_position/command
  /open_manipulator_p/joint2_position/command
  /open_manipulator_p/joint3_position/command
  /open_manipulator_p/joint4_position/command
  /open_manipulator_p/joint5_position/command
  /open_manipulator_p/joint6_position/command
  /open_manipulator_p/joint_states
  /rosout
  /rosout_agg
  ```

## [Controller for gazebo](#controller-for-gazebo)

Launch the open_manipulator_p_controller for gazebo simulation.

  ``` bash
  $ roslaunch open_manipulator_p_controller open_manipulator_p_controller.launch use_platform:=false
  ```
{% capture notice_01 %}
**NOTE**:
- To control the OpenManipulator-PRO in the Gazebo environment using the OpenManipulator-PRO Controller, the controller must set the **use_platform** parameter to **false** because it needs to send messages to gazebo instead of Platform.
- If you want to manipulate the OpenManipulator-PRO using Moveit within the Gazebo simulator, you should also convert the **use_moveit** to **true** in open_manipulator_p_controller launch file.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

If the OpenManipulator-PRO controller for gazebo simulation Launched successfully, the terminal will represent below messages.

```
SUMMARY
========

PARAMETERS
 * /open_manipulator_p/control_period: 0.01
 * /open_manipulator_p/moveit_sample_duration: 0.05
 * /open_manipulator_p/planning_group_name: arm
 * /open_manipulator_p/using_moveit: False
 * /open_manipulator_p/using_platform: False
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator_p (open_manipulator_p_controller/open_manipulator_p_controller)

ROS_MASTER_URI=http://192.168.3.149:11311

process[open_manipulator_p-1]: started with pid [4388]
[INFO] Ready to simulate /open_manipulator_p on Gazebo
```
**NOTE** : In OpenMAIPULATOR-PRO controller for gazebo simulation, Joint and Gripper DYNAMIXEL are not enable, following messages will not be displayed :  
Joint Dynamixel ID : 1, Model Name : PRO-PLUS-PH54-200-S500-R  
Joint Dynamixel ID : 2, Model Name : PRO-PLUS-PH54-200-S500-R  
Joint Dynamixel ID : 3, Model Name : PRO-PLUS-PH54-100-S500-R  
Joint Dynamixel ID : 4, Model Name : PRO-PLUS-PH54-100-S500-R  
Joint Dynamixel ID : 5, Model Name : PRO-PLUS-PH42-020-S300-R  
Joint Dynamixel ID : 6, Model Name : PRO-PLUS-PH42-020-S300-R  
{: .notice--info}

Open an [open_manipulator_p_control_gui](/docs/en/platform/openmanipulator_p/ros_operation/#gui-program) to control OpenMANIPULATOR-P

[OpenCR]: /docs/en/parts/controller/opencr10/
[OpenCR Manual]: /docs/en/parts/controller/opencr10/
[rc100]: /docs/en/parts/communication/rc-100/
[bt410]: /docs/en/parts/communication/bt-410/

[open_manipulator_p_msgs/GetJointPosition]: /docs/en/popup/open_manipulator_p_msgs_GetJointPosition/
[open_manipulator_p_msgs/GetKinematicsPose]: /docs/en/popup/open_manipulator_p_msgs_GetKinematicsPose/
[open_manipulator_p_msgs/SetJointPosition]: /docs/en/popup/open_manipulator_p_msgs_SetJointPosition/
[open_manipulator_p_msgs/SetKinematicsPose]: /docs/en/popup/open_manipulator_p_msgs_SetKinematicsPose/
[open_manipulator_p_msgs/SetActuatorState]: /docs/en/popup/open_manipulator_p_msgs_SetActuatorState/
[open_manipulator_p_msgs/SetDrawingTrajectory]: /docs/en/popup/open_manipulator_p_msgs_SetDrawingTrajectory/

[sensor_msgs/JointState]: /docs/en/popup/sensor_msgs_JointState_msg/
[open_manipulator_p_msgs/KinematicsPose]: /docs/en/popup/open_manipulator_p_msgs_KinematicsPose/
[open_manipulator_p_msgs/OpenManipulatorState]: /docs/en/popup/open_manipulator_p_msgs_OpenManipulatorState/
[std_msgs::String]: /docs/en/popup/std_msgs_string/

[task space]: /docs/en/popup/open_manipulator_p_coordinates/
[joint space]: /docs/en/popup/open_manipulator_p_coordinates/
