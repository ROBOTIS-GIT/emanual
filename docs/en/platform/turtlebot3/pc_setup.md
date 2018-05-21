---
layout: archive
lang: en
ref: pc_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/pc_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 0"></div>

## [PC Setup](#pc-setup)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

**WARNING:** The contents in this chapter corresponds to the `Remote PC` (your desktop or laptop PC) which will control TurtleBot3. Do NOT apply this instruction to your TurtleBot3.
{: .notice--warning}

**NOTE:** This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

### [Install Ubuntu on Remote PC](#install-ubuntu-on-remote)

Download and install the `Ubuntu 16.04` on the `Remote PC (Desktop or Laptop PC)` from the following link.

- [Download link][ubuntu_download_link]

If you need more help for installing Ubuntu, check out the step-by-step guide from the link below.

- [Install ubuntu desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

### [Install ROS on Remote PC](#install-ros-on-remote-pc)

![](/assets/images/platform/turtlebot3/logo_ros.png)

The following script will allow you to simplify the ROS installation procedure. Run the following command in a terminal window. The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`. After install ROS, please reboot Remote PC.

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

**NOTE:** In order to check which packages are installed, please check this link out. [install_ros_kinetic.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh)
{: .notice--info}

If you prefer manual installation, please following the link below.

- [Manual installation of ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)


### [Install Dependent ROS Packages](#install-dependent-ros-packages)

The next step is to install dependent packages for TurtleBot3 control.

``` bash
$ sudo apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers
```

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/catkin_ws && catkin_make
```

If catkin_make command is completed without any errors, the preparation for TurtleBot3 is done.


### [Network Configuration](#network-configuration)

![](/assets/images/platform/turtlebot3/software/network_configuration.png)

ROS requires IP addresses in order to communicate between TurtleBot PC and the remote PC. The remote PC and TurtleBot PC should be connected to the same wifi router.

Enter the below command on the terminal window of the remote PC to find out the IP address of the remote PC.

``` bash
$ ifconfig
```

Text strings in the rectangle is the IP address of the `Remote PC`.

![](/assets/images/platform/turtlebot3/software/network_configuration2.png)

Enter the below command.

``` bash
$ nano ~/.bashrc
```

Press ' `alt+/` ' to end line of the file.

Modify the address of `localhost` with the IP address acquired from the above terminal window.

![](/assets/images/platform/turtlebot3/software/network_configuration3.png)

Then, source the bashrc with below command.

``` bash
$ source ~/.bashrc
```

[ubuntu_download_link]: https://www.ubuntu.com/download/alternative-downloads
