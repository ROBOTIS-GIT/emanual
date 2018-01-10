---
layout: archive
lang: en
ref: turtlebot3_sbc_common_software_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/sbc_common_software_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 5"></div>
<div style="counter-reset: h2 3"></div>

# [SBC Software Setup](#sbc-software-setup)

## [Install ROS and Packages (Burger and Waffle)](#install-ros-and-packages-burger-and-waffle)

**Warning :** The contents in this chapter corresponds to the SBC of `TurtleBot3` (Raspberry Pi 3 or Intel® Joule™) which will be the main computer of TurtleBot3. Do **NOT** apply this instruction to your Remote PC (your desktop PC or laptop).
{: .notice--warning}

**Note :** This instruction takes about 2 hours to install ROS and TurtleBot3 related packages. Elapsed time may vary depending on network environment.
{: .notice--info}

![](/assets/images/platform/turtlebot3/logo_ros.png)

**[TurtleBot]** There are two ways to install [ROS][ros]. If you prefer manual installation, please take the second method.

### [First Method](#first-method)

**[TurtleBot]** Install [ROS][ros] by using a simple installation script file.

**Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is Ctrl-Alt-T.
{: .notice--info}

**[TurtleBot Burger]**

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic_rp3.sh && chmod 755 ./install_ros_kinetic_rp3.sh && bash ./install_ros_kinetic_rp3.sh
```

**[TurtleBot Waffle]**

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

**Note :** After install ROS, please reboot Raspberry Pi or Intel® Joule™.
{: .notice--info}

### [Second Method](#second-method)

**[TurtleBot]** You can start from "[1.2 Setup your sources.list][12-setup-your-sourceslist]" and keep following the instruction until "[1.7 Getting rosinstall][17-getting-rosinstall]" from below ROS installation instruction link.

- http://wiki.ros.org/kinetic/Installation/Ubuntu

**Note :** In order to see which packages are installed, please check this link out. https://raw.githubusercontent.com/oroca/oroca-ros-pkg/kinetic/ros_install.sh
{: .notice--info}

### [Install Dependent Packages](#install-dependent-packages)

**[TurtleBot]** The next step is to install dependent packages for TurtleBot3 control.

``` bash
$ sudo apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation
```

``` bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/catkin_ws && catkin_make
```

If catkin_make command is completed without any errors, the preparation for TurtleBot3 is done.

## [USB Settings (Burger and Waffle)](#usb-settings-burger-and-waffle)

**[TurtleBot]** The following commands allow to use USB port for OpenCR1.0 without acquiring root permission.

``` bash
$ cd ~/catkin_ws/src/turtlebot3
$ sudo cp ./99-turtlebot3-cdc.rules /etc/udev/rules.d/
$ sudo udevadm control --reload-rules
$ sudo udevadm trigger
```

## [Network Configuration (Burger and Waffle)](#network-configuration-burger-and-waffle)

![](/assets/images/platform/turtlebot3/software/network_configuration.png)

ROS requires IP addresses in order to communicate between TurtleBot3 and remote PC.

**[TurtleBot]** Enter the below command on the terminal window of the SBC in TurtleBot3 to find out the IP address of TurtleBot3.

``` bash
$ ifconfig
```

Texts in the rectangle is the IP address of the `TurtleBot`.

![](/assets/images/platform/turtlebot3/software/network_configuration4.png)

**[TurtleBot]** Enter the following command.

``` bash
$ gedit ~/.bashrc
```

**[TurtleBot]** Replace the `localhost` in the ROS_MASTER_URI address with the IP address acquired from [Remote PC Network Configuration][remote-pc-network-configuration]. Also replace the `localhost` in the ROS_HOSTNAME address with the IP address acquired from the above terminal window, which is the IP address of TurtleBot3.

![](/assets/images/platform/turtlebot3/software/network_configuration5.png)

**[TurtleBot]** Then, source the bashrc with below command.

``` bash
$ source ~/.bashrc
```

[12-setup-your-sourceslist]: http://wiki.ros.org/kinetic/Installation/Ubuntu#Installation.2BAC8-Ubuntu.2BAC8-Sources.Setup_your_sources.list
[17-getting-rosinstall]: http://wiki.ros.org/kinetic/Installation/Ubuntu#Getting_rosinstall
[remote-pc-network-configuration]: http://turtlebot3.robotis.com/en/latest/pc_software.html#network-configuration
[ros]: http://wiki.ros.org
