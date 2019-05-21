---
layout: archive
lang: en
ref: openmanipulator_pro_ros_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_pro/ros_setup/
sidebar:
  title: OpenMANIPULATOR-PRO
  nav: "openmanipulator_pro"
---

<div style="counter-reset: h1 3"></div>

# [[ROS] Setup](#ros-setup)

- The OpenMANIPULATOR ROS program is based on **Linux Ununtu 16.04** OS and **ROS Kinetic Kame**.

## [Install Ubuntu on PC](#install-ubuntu-on-pc)

Download and install `Ubuntu 16.04` on your PC.

- [Download link](https://www.ubuntu.com/download/alternative-downloads)

If you need more help with installing Ubuntu, check out the step-by-step guide from the link below.

- [Install ubuntu desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

## [Install ROS on PC](#install-ros-on-pc)

![](/assets/images/platform/openmanipulator_pro/logo_ros.png)

The following script will allow you to simplify the ROS installation procedure. Run the following commands in a terminal window. The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key to open a terminal is `Ctrl`+`Alt`+`t`. After installing ROS, please reboot PC.

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_kinetic.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh)
{: .notice--info}

If you prefer manual installation, please follow the link below.

- [Manual installation of ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)

## [Install ROS Package](#install-ros-package)

Install dependent packages for OpenMANIPULATOR-PRO ROS program. Run the following commands in a terminal window.

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
{: .notice--info}

``` bash
$ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-industrial-core
```

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_pro.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_pro_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_pro_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git
$ cd ~/catkin_ws && catkin_make
```

If the catkin_make command has been completed without any errors, all the preparations for using OpenMANIPULATOR-PRO are done.
