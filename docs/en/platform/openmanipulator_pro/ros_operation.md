---
layout: archive
lang: en
ref: openmanipulator_pro_ros_operation
read_time: true
share: false
author_profile: false
permalink: /docs/en/platform/openmanipulator_pro/ros_operation/
sidebar:
  title: OpenMANIPULATOR-PRO
  nav: "openmanipulator_pro"

---

<div style="counter-reset: h1 5"></div>

# [[ROS] Operation](#ros-operation)

{% capture notice_01 %}
**NOTE**:
- This instructions has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on PC ROS packages installed in. Please run the instructions below on your PC ROS packages installed in.
- Make sure to run the [OpenMANIPULATOR Manager](/docs/en/platform/openmanipulator_pro/ros_manipulator_manager/#ros-manipulator-manager) instructions before running the instruction below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
{: .notice--info}

## [GUI Program](#gui-program)

You can use the GUI program to manipulate OpenMANIPULATOR-PRO. This program shows the status of and allows users to control OpenMANIPULATOR-PRO.

```
$ rosrun manipulator_h_gui manipulator_h_gui
```

![](/assets/images/platform/manipulator_h/manipulator_h_gui.png)  

To control manipulator, first click the `set mode` button.   

Set the manipulator to initial pose, click the `go to initial pose` button.   

To check the joint angles of the manipulator, click the `Get current joint values` button. And To check the pose in the task space, click the `Get current pose` button.   

To move the manipulator in the joint space. Enter the joint angles. Then click the `Send Des Joint Val.` button. And, to move the manipulator in the task space. Enter the kinematics pose of the end-effector(tool) in the task space. Then click the `Send Des Pos.` button.  

## [MoveIt!](#moveit)
**Coming Soon!**



[std_msgs/String]: /docs/en/popup/std_msgs_string/
[std_msgs/Float64]: /docs/en/popup/std_msgs_float64_msg/
[geometry_msgs/Pose]: /docs/en/popup/geometry_msgs_Pose_msg/
[robotis_controller_msgs/StatusMsg]: /docs/en/popup/StatusMsg.msg/
[manipulator_manipulation_module_msgs/JointPose]: /docs/en/popup/JointPose.msg/
[manipulator_manipulation_module_msgs/KinematicsPose]: /docs/en/popup/KinematicsPose.msg/
[manipulator_manipulation_module_msgs/GetJointPose]: /docs/en/popup/GetJointPose.srv/
[manipulator_manipulation_module_msgs/GetKinematicsPose]: /docs/en/popup/GetKinematicsPose.srv/
