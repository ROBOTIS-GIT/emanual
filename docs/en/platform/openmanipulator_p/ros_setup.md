---
layout: archive
lang: en
ref: openmanipulator_p_ros_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_p/ros_setup/
sidebar:
  title: "OpenMANIPULATOR-P"
  nav: "openmanipulator_p"
product_group: openmanipulator_p
page_number: 4
---

<div style="counter-reset: h1 3"></div>

# [[ROS] Setup](#ros-setup)

{% capture notice_01 %}
**NOTE** : 
- The test is done on `ROS Kinetic Kame` installed in `Ubuntu 16.04`.
- The test is done on `ROS Melodic Morenia`installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions - [Install ROS Packages](/docs/en/platform/openmanipulator_p/ros_setup/#install-ros-packages)
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Install Ubuntu on a PC](#install-ubuntu-on-pc)

Download and install `Ubuntu 16.04` or `Ubuntu 18.04` on your PC.

- [Download Ubuntu](https://www.ubuntu.com/download/alternative-downloads)
- [Tutorial - Install Ubuntu Desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

## [Install ROS on PC](#install-ros-on-pc)

![](/assets/images/platform/openmanipulator_p/logo_ros.png)

The following script will allow you to simplify the ROS installation procedure. Run the following commands in a terminal window. The terminal application can be found with the Ubuntu search icon on the left side of the corner on a screen. The shortcut key to open a terminal is `Ctrl`+`Alt`+`t`. After installing ROS, please reboot PC.

**WARNING** : Install either `ROS Kinetic Kame` or `ROS Melodic Morenia` on your PC. 
{: .notice--warning}

### [ROS Kinetic Kame](#ros-kinetic-kame)

``` bash
$ sudo apt-get update && sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

If you prefer manual installation, please follow the link below.

- [Manual installation of ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_kinetic.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh)
{: .notice--info}


### [ROS Melodic Morenia](#ros-melodic-morenia)

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_melodic.sh && chmod 755 ./install_ros_melodic.sh && bash ./install_ros_melodic.sh
```
If you prefer manual installation, please follow the link below.

- [Manual installation of ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu)

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_melodic.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_melodic.sh)
{: .notice--info}

## [Install ROS Packages](#install-ros-packages)

Install dependent packages for OpenMANIPULATOR-P. Run the following commands in a terminal window.

**WARNING** : Install either of `ROS Kinetic Kame` or `ROS Melodic Morenia` on your PC. 
{: .notice--warning}


### [ROS Kinetic Kame Package](#ros-kinetic-kame-package)

``` bash
$ sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-industrial-core
```

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_p.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_p_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git
$ cd ~/catkin_ws && catkin_make
```

### [ROS Melodic Morenia Package](#ros-melodic-morenia-package)

``` bash
$ sudo apt-get install ros-melodic-ros-controllers ros-melodic-gazebo* ros-melodic-moveit* ros-melodic-industrial-core
```

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
$ git clone https://github.com/ROBOTIS-GIT/dynamixel-workbench-msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_p.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/open_manipulator_p_simulations.git
$ git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git
$ cd ~/catkin_ws && catkin_make
```

If the catkin_make command has been completed without any errors, all the preparations for using OpenMANIPULATOR-P are done.

## [Communication Converter](#communication-converter)

### [U2D2](#u2d2)

U2D2 is a small size USB communication converter that enables to control and operate DYNAMIXEL with PC.

#### Connection

In order to connect a PC to DYNAMIXEL, use U2D2. Be sure to read the following instruction for the right use of the product. 

- [U2D2](/docs/en/parts/interface/u2d2/)
- [U2D2 power hub board](/docs/en/parts/interface/u2d2_power_hub/)

#### USB Latency Timer Setting
In Linux(Ubuntu platform) environment, USB latency time is set to 16ms by default. Follow the steps below to set the communication latency time to the lowest value (1ms) between DYNAMIXEL's and PC connected via USB.

Open a terminal window and run the roscore.

``` bash
$ roscore
```

With the roscore running, open a new terminal window and enter the following command to set usb latency time.

``` bash
$ rosrun open_manipulator_p_controller create_udev_rules
```

**TIP**: This entered command set USB latency timer to **1 ms**. If you would like to see the setting, run the following command in a terminal.  
`cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer`
{: .notice--success}
