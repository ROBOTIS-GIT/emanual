---
layout: archive
lang: en
ref: ros2_openmanipulator_p_ros_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/openmanipulator_p/ros2_setup/
sidebar:
  title: "OpenMANIPULATOR-P"
  nav: "openmanipulator_p"
product_group: openmanipulator_p
page_number: 9
---

<div style="counter-reset: h1 8"></div>

# [[ROS 2] Setup](#ros-setup)

{% capture notice_01 %}
**NOTE** :  
- The test is done on `ROS 2 Dashing Diademata` installed in `Ubuntu 18.04`.
- Make sure ROS dependencies are installed before performing these instructions. - [Install ROS 2 Packages](/docs/en/platform/openmanipulator_p/ros2_setup/#install-ros-2-packages).
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

## [Install Ubuntu on PC](#install-ubuntu-on-pc)

Download and install `Ubuntu 18.04` on your PC. Tutoral guide will be helpful for you.

- [Download Ubuntu](https://www.ubuntu.com/download/alternative-downloads)
- [Tutorial - Install Ubuntu Desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

## [Install ROS 2 on PC](#install-ros2-on-pc)

![](/assets/images/platform/openmanipulator_p/logo_ros.png)

As OpenMANIPULATOR-P operates on Robot Operating System(ROS), it requies to intall `ROS 2 Dashing Diademata`.
The following script will allow you to simplify the ROS 2 installation procedure. Run the following commands in a terminal window. After installing ROS 2, please reboot PC.

**NOTE**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`+`Alt`+`t`.
{: .notice--info} 
``` bash
$ sudo apt update && sudo apt upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/open_manipulator/ros2/install_ros_dashing.sh && chmod 755 ./install_ros_dashing.sh && bash ./install_ros_dashing.sh
```

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_dashing.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/open_manipulator/ros2/install_ros_dashing.sh)
{: .notice--info}

If you prefer a manual installation, following link guides you how to install ROS 2 on your PC,
- [Manual Installation of ROS 2 Dashing Diademata](https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/)

## [Install ROS 2 Packages](#install-ros-2-packages)

Install dependent packages for OpenMANIPULATOR-P. Run the following commands in a terminal window.


``` bash
$ sudo apt install ros-dashing-python* ros-dashing-rqt*
```

``` bash
$ cd ~/robotis_ws/src/
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/dynamixel-workbench.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_p.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/open_manipulator_dependencies.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/robotis_manipulator.git
$ cd ~/robotis_ws && colcon build --symlink-install
```

## [Communication Converter](#communication-converter)

### [U2D2](#u2d2)

#### Connection
Connect micro USB (connected to PC), DYNAMIXEL's(OpenMANIPULATOR-P), and 12V Power to U2D2 and U2D2 power hub board as shown below.

**NOTE** : Please refer to [U2D2 e-Manual](/docs/en/parts/interface/u2d2/) and [U2D2 power hub board e-manual](/docs/en/parts/interface/u2d2_power_hub/) for detailed connection of U2D2 and U2D2 power hub board.
{: .notice--info}

#### USB Latency Timer Setting
In Linux(Ubuntu platform) environment, USB latency time is set to 16ms by default. Follow the steps below to set the communication latency time to the lowest value (1ms) between DYNAMIXEL's and PC connected via USB.

Open a terminal window and run the following command to set usb latency time.

``` bash
$ ros2 run open_manipulator_p_controller create_udev_rules
```

**TIP**: This entered command set USB latency timer to **1 ms**. If you would like to see the setting, run the following command in a terminal.  
`cat /sys/bus/usb-serial/devices/ttyUSB0/latency_timer`
{: .notice--success}
