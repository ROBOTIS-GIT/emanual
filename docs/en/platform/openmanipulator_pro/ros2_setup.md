---
layout: archive
lang: en
ref: ros2_openmanipulator_pro_ros_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_pro/ros2_setup/
sidebar:
  title: "OpenMANIPULATOR-PRO"
  nav: "openmanipulator_pro"
product_group: openmanipulator_pro
page_number: 9
---

<div style="counter-reset: h1 8"></div>

# [[ROS2] Setup](#ros-setup)

{% capture notice_01 %}
**NOTE** : 
- The following instruction has been tested on `Ubuntu 18.04` and `ROS2 Dashing Diademata`.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Install Ubuntu on PC](#install-ubuntu-on-pc)

Download and install `Ubuntu 18.04` on your PC.

- [Download link](https://www.ubuntu.com/download/alternative-downloads)

If you need more help with installing Ubuntu, check out the step-by-step guide from the link below.

- [Install ubuntu desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

## [Install ROS on PC](#install-ros-on-pc)

Please follow the link below.

- [Manual Installation of ROS2 Dashing Diademata](https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/)

## [Install ROS Package](#install-ros-package)

Install dependent packages for OpenMANIPULATOR-PRO. Run the following commands in a terminal window.

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
{: .notice--info} 

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/open_manipulator/ros2/install_ros_dashing.sh && chmod 755 ./install_ros_dashing.sh && bash ./install_ros_dashing.sh
```

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_dashing.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh)
{: .notice--info}

If you prefer manual installation, please follow the link below.

``` bash
$ cd ~/robotis_ws/src/
$ git clone https://github.com/rjshim/cmake_modules.git -b ros2-devel
$ git clone https://github.com/rjshim/joint_state_publisher.git -b ros2-devel
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git -b ros2
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git -b ros2
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git -b ros2
$ git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git -b ros2
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git -b ros2
$ cd ~/robotis_ws && colcon build --symlink-install
```

If the colcon build command has been completed without any errors, all the preparations for using OpenMANIPULATOR-PRO are done.
