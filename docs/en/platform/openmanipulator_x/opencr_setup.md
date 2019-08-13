---
layout: archive
lang: en
ref: openmanipulator_x_opencr_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/opencr_setup/
sidebar:
  title: "[ROS] OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 10
---

<div style="counter-reset: h1 9"></div>

# [[OpenCR] Setup](#opencr-setup)

**WARNING** : This instruction **does not use ROS** to operate OpenMANIPULATOR-X.  
The way OpenMANIPULATOR-X is controlled by OpenCR (embedded system) and ROS is completely different.  
When operating with ROS, the PC becomes a main controller.  
On the other hands, when operating with OpenCR, the OpenCR becomes a main controller.
{: .notice--danger}

OpenMANIPULATOR-X is compatible with **OpenCR**. We offer API to easily control manipulator.
This API supports Dynamixel, Dynamixel X including protocol 1.0 and 2.0. Furthermore, this code can be used for Friends of OpenMANIPULATOR.
User can make thier code in **Arduino IDE** and simulate or control using **Processing** GUI.

<iframe width="560" height="315" src="https://www.youtube.com/embed/fT1Wv6qHknI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [Connection](#connection)

Connect micro USB (connected to PC), Dynamixel(OpenMANIPULATOR), and 12V Power to OpenCR as shown below.

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_opencr_setup.png" width="500">

<img src="/assets/images/platform/openmanipulator_x/OpenManipulator_opencr_setup2.png" width="800">

**NOTE** : Please refer the detailed description of [OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/).
{: .notice}

## [Arduino IDE Setup](#arduino-ide-setup)

- [Instructions for Linux]{: .blank}
- [Instructions for Mac]{: .blank}
- [Instructions for Windows]{: .blank}



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

[Instructions for Linux]: /docs/en/parts/controller/opencr10/#install-on-linux
[Instructions for Mac]: /docs/en/parts/controller/opencr10/#install-on-mac
[Instructions for Windows]: /docs/en/parts/controller/opencr10/#install-on-windows
