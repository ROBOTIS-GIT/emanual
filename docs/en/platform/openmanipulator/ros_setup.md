---
layout: archive
lang: en
ref: openmanipulator
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator/ros_setup/
sidebar:
  title: OpenManipulator RM-X52-TNM
  nav: "openmanipulator"
---

<div style="counter-reset: h1 4"></div>

# [[ROS] Setup](#ros-setup)

**NOTE** : The following instruction has been tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

**WARNING** : If you would like to control OpenManipulator on OpenCR (Embedded board) instead of using ROS, please set it up as described in [[OpenCR] Setup](/docs/en/platform/openmanipulator/opencr-setup/#opencr-setup).
{: .notice--warning}


## [Install Ubuntu on PC](#install-ubuntu-on-pc)

Download and install `Ubuntu 16.04` on your PC.

- [Download link](https://www.ubuntu.com/download/alternative-downloads)

If you need more help with installing Ubuntu, check out the step-by-step guide from the link below.

- [Install ubuntu desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

## [Install ROS on PC](#install-ros-on-pc)

![](/assets/images/platform/turtlebot3/logo_ros.png)

The following script will allow you to simplify the ROS installation procedure. Run the following command in a terminal window. The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key to open a terminal is `Ctrl`+`Alt`+`t`. After installing ROS, please reboot PC.

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_kinetic.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh)
{: .notice--info}

If you prefer manual installation, please following the link below.

- [Manual installation of ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)

## [Install ROS Packages](#install-ros-packages)
Install dependent packages for OpenManipulator. Run the following command in a terminal window.

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
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git
$ cd ~/catkin_ws && catkin_make
```

If the catkin_make command has been completed without any errors, all the preparations for using OpenManipulator are done.

## [Communication Converter](#communication-converter)

## [U2D2](#u2d2)

Connect micro USB (connected to PC), Dynamixel(OpenManipulator), and 12V Power to U2D2 and U2D2 power hub board as shown below.

<img src="/assets/images/platform/openmanipulator/OpenManipulator_u2d2_setup.png" width="500">

**NOTE** : U2D2 and U2D2 power hub board are required when operating OpenManipulator using U2D2.
{: .notice}

**NOTE** : If you are using OpenCR instead of U2D2 to connect to PC, please refer to OpenCR Setting section.
{: .notice--info}

The following commands allow to use USB port

``` bash
$ rosrun open_manipulator_controller create_udev_rules
```

**TIP**: This entered command set USB latency timer to **1 ms**. If you would like to see the setting, run the following command in a terminal.  
`cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer`
{: .notice--success}

## [OpenCR](#opencr)
This section explains how to set up OpenCR as a communication board between ROS Packages of PC and DYNAMIXEL of OpenManipulator.  
If you want to operate OpenManipulator on embedded system (OpenCR) without ROS, please refer [[OpenCR] Setup](/docs/en/platform/openmanipulator/opencr-setup/#opencr-setup).

Connect micro USB (connected to PC), Dynamixel(OpenManipulator), and 12V Power to OpenCR as shown below.

<img src="/assets/images/platform/openmanipulator/OpenManipulator_opencr_setup.png" width="500">

Please refer the detailed description of [OpenCR](http://emanual.robotis.com/docs/en/parts/controller/opencr10/)

Download Arduino IDE and load OpenCR board on it

- [Arduino IDE for using OpenCR](/docs/en/platform/openmanipulator/opencr_setup/#arduino-ide-setup)

Find `usb to dxl` example source codes.

Go to `Examples` → `OpenCR` → `10.Etc` → `usb_to_dxl` on Arduino IDE for OpenCR.

![](/assets/images/platform/openmanipulator/OpenManipulator_opencr_utd_setup.png)

Upload the `usb to dxl` example source to OpenCR.


