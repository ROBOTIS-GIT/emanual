---
layout: archive
lang: en
ref: turtlebot3_pc_software_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/pc_software_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 4"></div>

# [PC Software Setup](#pc-software-setup)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

**Warning :** The contents in this chapter corresponds to the `Remote PC` (your desktop or laptop PC) which will control TurtleBot3. Do NOT apply this instruction to your TurtleBot3.
{: .notice--warning}

**Note :** This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

## [Install Ubuntu on Remote PC (Desktop or Laptop PC)](#install-ubuntu-on-remote-pc-desktop-or-laptop-pc)

**[Remote PC]** Download `Ubuntu 16.04` on the remote PC from the following link.

- [Download link](https://www.ubuntu.com/download/desktop)

If you need more help for installing Ubuntu, check out the step-by-step guide from the link below.

- [Install ubuntu desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

## [Install ROS on Remote PC](#install-ros-on-remote-pc)

![](/assets/images/platform/turtlebot3/logo_ros.png)

**[Remote PC]** There are two ways to install [ROS][ros]. If you prefer manual installation, please take the second method.
In order to develop source code from the remote PC, please configure ROS environment after completing ROS installation.

### [First Method](#first-method)

Install [ROS][ros] by using a simple installation script file

**Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--info}

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

### [Second Method](#second-method)

You can start from "[1.2 Setup your sources.list][12-setup-your-sourceslist]" and keep following the instruction until "[1.7 Getting rosinstall][17-getting-rosinstall]" from below ROS installation instruction link.

- http://wiki.ros.org/kinetic/Installation/Ubuntu

**Note :** In order to check which packages are installed, please check this link out. [install_ros_kinetic](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh)
{: .notice--info}

### [Configure ROS Environment](#configure-ros-environment)
If you are going to modify or develop source code from the remote PC, you'll have to configure ROS environment. Simple instructions are described in the below link and it will take a couple minutes.

- [ROS Environment](http://wiki.ros.org/ROS/Tutorials/InstallingandConfiguringROSEnvironment)

## [Install Dependent packages](#install-dependent-packages)

**[Remote PC]** The next step is to install dependent packages for TurtleBot3 control.

``` bash
$ sudo apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation
```

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/catkin_ws && catkin_make
```

If catkin_make command is completed without any errors, the preparation for TurtleBot3 is done.


## [Network Configuration](#network-configuration)

![](/assets/images/platform/turtlebot3/software/network_configuration.png)

ROS requires IP addresses in order to communicate between TurtleBot3 and the remote PC.

**[Remote PC]** Enter the below command on the terminal window of the remote PC to find out the IP address of the remote PC.

``` bash
$ ifconfig
```

Text strings in the rectangle is the IP address of the `Remote PC`.

![](/assets/images/platform/turtlebot3/software/network_configuration2.png)

**[Remote PC]** Enter the below command.

``` bash
$ gedit ~/.bashrc
```

Modify the address of `localhost` with the IP address acquired from the above terminal window.

![](/assets/images/platform/turtlebot3/software/network_configuration3.png)

**[Remote PC]** Then, source the bashrc with below command.

``` bash
$ source ~/.bashrc
```

[12-setup-your-sourceslist]: http://wiki.ros.org/kinetic/Installation/Ubuntu#Installation.2BAC8-Ubuntu.2BAC8-Sources.Setup_your_sources.list
[17-getting-rosinstall]: http://wiki.ros.org/kinetic/Installation/Ubuntu#Getting_rosinstall
[ros]: http://wiki.ros.org
