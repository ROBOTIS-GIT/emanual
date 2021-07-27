---
layout: archive
lang: en
ref: openmanipulator_x_ros_applications
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_x/ros_applications/
tabs: "ROS"
tab_title1: Kinetic
tab_title2: Noetic
tab_title3: Dashing
sidebar:
  title: "OpenMANIPULATOR-X"
  nav: "openmanipulator_x"
product_group: openmanipulator_x
page_number: 13
---

<div style="counter-reset: h1 10"></div>

{::options parse_block_html="true" /}

# [Applications](#applications)

## [Master and Slave](#master-and-slave)

In this example, if the user is holding the master OpenMANIPULATOR, the slave OpenMANIPULATOR-X moves like master robot. Recording mode allows you to save the trajectory as you move the master OpenMANIPULATOR-X and play it back to the slave OpenMANIPULATOR.

<iframe width="560" height="315" src="https://www.youtube.com/embed/kTS3Yx75mLo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [Setup OpenMANIPULATOR-X](#setup-openmanipulator-x)

Since you need to control two OpenManipulators on one PC, use two U2D2s and two OpenManipulators to connect as shown below.

![](/assets/images/platform/openmanipulator_x/OpenManipulator_master_slave_connection.png)

![](/assets/images/platform/openmanipulator_x/OpenManipulator_master_slave.png)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/setup_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/setup_dashing.md %}
</section>

### [Install Package](#install-package)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/install_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/install_dashing.md %}
</section>


### [Execute Example](#execute-example)

<section data-id="{{ page.tab_title1 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/execute_kinetic.md %}
</section>

<section data-id="{{ page.tab_title3 }}" class="tab_contents">
{% include en/platform/openmanipulator_x/applications/execute_dashing.md %}
</section>


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
