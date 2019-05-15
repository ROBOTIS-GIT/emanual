---
layout: archive
lang: en
ref: openmanipulator_pro_ros_controller_package.md
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_pro/ros-controller-package/
sidebar:
  title: OpenMANIPULATOR-PRO
  nav: "openmanipulator_pro"
---

<div style="counter-reset: h1 4"></div>

# [ROS] Controller Package(#ros-controller-package)

The OpenMANIPULATOR-PRO controller provides basic manipulation of OpenMANIPULATOR. You can control the dynamixel of OpenMANIPULATOR-PRO and check states of OpenMANIPULATOR-PRO through [messages](/docs/en/platform/openmanipulator_pro/ros_controller_package/#message-list) of the controller.  
 

**NOTE**:  
- This instructions has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

## [Launch Controller](#launch-controller)


Before you launch controller, let’s check open_manipulator_pro_controller launch file in open_manipulator_pro_controller package.  

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
**Parameters List** : The parameters list is used to set control environments.  
- `use_robot_name`
- `dynamixel_usb_port`
- `dynamixel_baud_rate`
- `control_period`
- `use_platform`
- `use_moveit`
- `planning_group_name`
- `moveit_sample_duration`

`use_robot_name` is a parameter to set manipulator name(namespace of ROS messages).  
`dynamixel_usb_port` is a parameter to set use port to connected with Dynamixel of OpenMANIPULATOR. If you use U2D2, it should be set **/dev/ttyUSB@**. If you use OpenCR, it should be set **/dev/ttyACM@** (@ indicates the port number connected to the Dynamixel).  
`dynamixel_baud_rate` is a parameter to set baud rate of dynamixel. default baud rate of dynamixel used in OpenMANIPULATOR-PRO is 1000000.  
`control_period` is a parameter to set communication period between dynamixel and PC (control loop time).  
`use_platform` is a parameter that sets whether to use the actual OpenMANIPULATOR-PRO or OpenMANIPULATOR-PRO simulation. please refer [ROS Simulation](/docs/en/platform/openmanipulator_pro/ros_simulation/#ros-simulation) chapter.  
`use_moveit`, `planning_group_name` and `moveit_sample_duration` are parameters supposed to set loading [move_group](http://docs.ros.org/kinetic/api/moveit_tutorials/html/doc/move_group_interface/move_group_interface_tutorial.html) package. please refer [MoveIt!](/docs/en/platform/openmanipulator_pro/ros-operation/#moveit) chapter.

After set the parameters, launch the OpenMANIPULATOR-PRO controller to start [[ROS] Operation](/docs/en/platform/openmanipulator_pro/ros_operation/#ros-operation).

Please, open the terminal window, run roscore as entering following command.

``` bash
$ roscore
```

After run roscore, open the other terminal window and enter the following commands in the terminal.  

``` bash
$ roslaunch open_manipulator_pro_controller open_manipulator_pro_controller.launch
```
If the OpenMANIPULATOR-PRO controller has been launched successfully, the terminal will show the following message.  

```
SUMMARY
========

PARAMETERS
 * /gazebo: False
 * /gazebo_robot_name: robotis_manipulat...
 * /init_file_path: /home/user/catkin...
 * /offset_table: /home/user/catkin...
 * /robot_file_path: /home/user/catkin...
 * /rosdistro: kinetic
 * /rosversion: 1.12.14

NODES
  /
    open_manipulator_pro_manager (open_manipulator_pro_manager/open_manipulator_pro_manager)

ROS_MASTER_URI=http://localhost:11311

process[open_manipulator_pro_manager-1]: started with pid [19408]
[ INFO] [1552279834.24ro20783]: manager->init
/dev/ttyUSB0 added. (baudrate: 1000000)
(/dev/ttyUSB0) [ID:  1] H54P-200-S500-R added.
(/dev/ttyUSB0) [ID:  2] H54P-200-S500-R added.
(/dev/ttyUSB0) [ID:  3] H54P-100-S500-R added.
(/dev/ttyUSB0) [ID:  4] H54P-100-S500-R added.
(/dev/ttyUSB0) [ID:  5] H42P-020-S300-R added.
(/dev/ttyUSB0) [ID:  6] H42P-020-S300-R added.
[ INFO] [1552279834.361381084]: Load offsets...
```

{% capture notice_01 %}
**TIP**:  
- If you can't load Dynamixels, please check your Dynamixels settings using the following command from the Dynamixel-Workbench packages.   
`rosrun dynamixel_workbench_controllers find_dynamixel /dev/ttyUSB0`  
Even if you can't find any Dynamixels, please check firmware to use ROBOTIS software ([R+ Manager 2.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/) or [R+ Manager 1.0](http://emanual.robotis.com/docs/en/software/rplus2/manager/))  
- If you would like to change Dynamixel ID, please check [`OpenManipulator.cpp`](https://github.com/ROBOTIS-GIT/open_manipulator/blob/be2859a0506b4e941a19435c0a07562b41768a27/open_manipulator_libs/src/OpenManipulator.cpp#L40) in the open_manipulator_lib folder. The default ID is **11, 12, 13, 14** for joints and **15** for the gripper  
{% endcapture %}
<div class="notice--success">{{ notice_01 | markdownify }}</div>

**NOTE**: open_manipulator_pro_controlle is compatible with [Protocol 2.0](/docs/en/dxl/protocol2/). Since [Protocol 1.0](/docs/en/dxl/protocol1/) doesn't support SyncRead instructions that has access to multiple Dynamixels simultaneously.   Protocol 2.0 supports [`MX2`](/docs/en/dxl/mx/mx-64-2/), `X` and `Pro` series, but it does not support `AX`, `RX` and `EX`.  
{: .notice--info}

## [Check Setting](#check-setting)

### [Manipulator Description](#manipulator-description)

{% capture notice_01 %}
**NOTE**:  
- The below instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.  
- This instruction is supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.  
- Make sure to run the [OpenMANIPULATOR-PRO controller](/docs/en/platform/openmanipulator_pro/ros_controller_package/#launch-controller) instructions before running the instructions below.  
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Publish a topic message to check the OpenMANIPULATOR-PRO setting.

``` bash
$ rostopic pub /open_manipulator_pro/option std_msgs/String "print_open_manipulator_setting"
```

### [RViz](#rviz)

{% capture notice_01 %}
**NOTE**:  
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be run on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Load OpenMANIPULATOR-PRO on RViz.

``` bash
$ roslaunch open_manipulator_pro_description open_manipulator_rviz.launch
```
{% capture notice_01 %}
**NOTE**:  
- If you launched the [OpenMANIPULATOR-PROcontroller](/docs/en/platform/openmanipulator_pro/ros_controller_package/#launch-controller) before launching the open_manipulator_controller file, the robot model on RViz would be synchronized with the actual robot.
- If the user would like to check only model of OpenMANIPULATOR-PRO without control the actual OpenMANIPULATOR, the user can launch the RViz without the OpenMANIPULATOR-PRO controller.
The user can change each joint by GUI, if the user launch only RViz by executing the following command :
`$ roslaunch open_manipulator_description open_manipulator_rviz.launch use_gui:=true`

{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

![](/assets/images/platform/openmanipulator_pro/rviz.png)


## [Message List](#message-list)


{% capture notice_01 %}
**NOTE**:  
- This instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.  
- This instruction is supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.  
- Make sure to run the [OpenMANIPULATOR-PRO controller](/docs/en/platform/openmanipulator_pro/ros_controller_package/#launch-controller) instructions before running the instructions below.  
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

OpenMANIPULATOR-PRO Controller provides **topic** and **service** messages to control manipulator and check the states of manipulator.  


### [Topic](#topic)

#### ROS Message Type
* JointPose.msg   
  * `name` : target joint name ([std_msgs/String]{: .popup})    
  * `value` : target joint value ([std_msgs/Float64]{: .popup})    
* KinematicsPose.msg    
  * `name` : target kinematics group ([std_msgs/String]{: .popup})    
  * `pose` : target Pose ([geometry_msgs/Pose]{: .popup})   

#### Subscribed Topics
`/robotis/base/ini_pose_msg` ([std_msgs/String]{: .popup})    
&emsp;&emsp; Message for initial pose

`/robotis/base/set_mode_msg` ([std_msgs/String]{: .popup})    
&emsp;&emsp; Message for set mode

`/robotis/base/joint_pose_msg` ([manipulator_manipulation_module_msgs/JointPose]{: .popup})   
&emsp;&emsp; Message for joint space control

`/robotis/base/kinematics_pose_msg` ([manipulator_manipulation_module_msgs/KinematicsPose]{: .popup})   
&emsp;&emsp; Message for task space control

#### Published Topics
`/robotis/status`([robotis_controller_msgs/StatusMsg]{: .popup})    
&emsp;&emsp; Message for current state


### [Service](#service)

#### ROS Service Type   
* GetJointPose.srv   
  * Request : `joint_name` : joint name ([std_msgs/String]{: .popup})   
  * Response : `joint_value` : joint value ([std_msgs/Float64]{: .popup})   
* GetKinematicsPose.srv     
  * Request : `group_name` : kinematics group ([std_msgs/String]{: .popup})   
  * Response : `group_pose` : kinematics pose ([geometry_msgs/Pose]{: .popup})   

#### Services
`/robotis/base/get_joint_pose` ([manipulator_manipulation_module_msgs/GetJointPose]{: .popup})   
&emsp;&emsp; Service to read current joint value

`/robotis/base/get_kinematics_pose` ([manipulator_manipulation_module_msgs/GetKinematicsPose]{: .popup})   
&emsp;&emsp; Service to read current end effector's pose


[std_msgs/String]: /docs/en/popup/std_msgs_string/
[std_msgs/Float64]: /docs/en/popup/std_msgs_Float64_msg/
[geometry_msgs/Pose]: /docs/en/popup/geometry_msgs_Pose_msg/
[robotis_controller_msgs/StatusMsg]: /docs/en/popup/StatusMsg.msg/
[manipulator_manipulation_module_msgs/JointPose]: /docs/en/popup/JointPose.msg/
[manipulator_manipulation_module_msgs/KinematicsPose]: /docs/en/popup/KinematicsPose.msg/
[manipulator_manipulation_module_msgs/GetJointPose]: /docs/en/popup/GetJointPose.srv/
[manipulator_manipulation_module_msgs/GetKinematicsPose]: /docs/en/popup/GetKinematicsPose.srv/
