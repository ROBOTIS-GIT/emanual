---
layout: archive
lang: en
ref: raspberry_pi_3_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/raspberry_pi_3_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 6"></div>
<div style="counter-reset: h2 2"></div>
<div style="counter-reset: h3 0"></div>

<!--[dummy Header 1]>
  <h1 id="setup"><a href="#setup">Setup</a></h1>
  <h2 id="sbc-setup"><a href="#sbc-setup">SBC Setup</a></h2>
<![end dummy Header 1]-->

### [Raspberry Pi 3 Setup](#raspberry_pi_3_setup)

{% capture notice_01 %}
**WARNING**:
- The contents in this chapter corresponds to the `Raspberry Pi 3` which will be the main computer of **TurtleBot3 Burger and Waffle Pi**. Do **NOT** apply this instruction to your Remote PC (your desktop PC or laptop).
- Setup work requires Power and Time. So battery is not suitable. We recommend using SMPS (AC adapter) during this work.
{% endcapture %}
<div class="notice--warning">{{ notice_01 | markdownify }}</div>

{% capture notice_02 %}
**NOTE**: There are two ways to install Linux and ROS to Raspberry Pi 3. 
- First method: If you prefer Ubuntu MATE, please take the first method `Install Linux (Ubuntu MATE)` below. This method should install the ROS and dependency packages after installing the Linux images. This instruction takes about 1 hours to install ROS and related packages for TurtleBot3.
- Second method: We provide the Linux distro based on Raspbian. They are pre-installed with ROS and ROS-packages related TurtleBot3. It is available immediately without additional installation. If you want to use it, please take the second method `Install Linux based on Raspbian` below. 
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify }}</div>

#### [Install Linux (Ubuntu MATE)](#install-linux-ubuntu-mate)

##### [1) Install Ubuntu MATE on TurtleBot PC](#1-install-ubuntu-mate-on-turtlebot-pc)
**WARNING**: The microSD card should have at least **8 GB** of empty space in order to install Linux (Ubuntu MATE) on Raspberry Pi 3.
{: .notice--warning}

**[Remote PC]** Download `Ubuntu MATE 16.04` image for the Raspberry Pi 3 on your remote PC from the link below.

- [Download page](https://ubuntu-mate.org/download/) (Choose ... > Raspberry Pi > 16.04.2 (Xenial) > Download Links)
- [Direct download link](https://ubuntu-mate.org/raspberry-pi/ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz)

**[Remote PC]** In order to write an Ubuntu MATE image to microSD, it is recommended using `GNOME Disks` with `Restore Disk Image...` option, which natively supports XZ compressed image.

``` bash
$ sudo apt-get install gnome-disk-utility
```

<iframe width="640" height="480" src="https://www.youtube.com/embed/V_6GNyL6Dac" frameborder="0" allowfullscreen></iframe>

**TIP**: It is recommended using `GNOME Disks`, but other applications such as `ddrescue` on Linux can be used.
{: .notice--info}

``` bash
$ sudo apt-get install gddrescue xz-utils
$ unxz ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz
$ sudo ddrescue -D --force ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img /dev/sdx
```

**TIP**: It is recommended using `GNOME Disks`, but other applications such as `Win32 Disk Imager` on Windows can be used. [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/)
{: .notice--info}

##### [2) Install ROS on TurtleBot PC](#2-install-ros-on-turtlebot-pc)

![](/assets/images/platform/turtlebot3/logo_ros.png)

**NOTE**: This instruction takes about 1 hours to install ROS and related packages for TurtleBot3. Elapsed time may vary depending on network environment.
{: .notice--info}

**[TurtleBot]** The following script will allow you to simplify the ROS installation procedure. Run the following command in a terminal window on TurtleBot PC. The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`. After install ROS, please reboot TurtleBot PC.

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic_rp3.sh && chmod 755 ./install_ros_kinetic_rp3.sh && bash ./install_ros_kinetic_rp3.sh
```

**NOTE**: In order to check which packages are installed, please check this link out. [install_ros_kinetic_rp3.sh](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic_rp3.sh)
{: .notice--info}

If you prefer manual installation, please following the link below.

- [Manual installation of ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)

##### [3) Install Dependent Packages on TurtleBot PC](#3-install-dependent-packages-on-turtlebot-pc)

The next step is to install dependent packages for TurtleBot3 control.

**[TurtleBot]** Download packages from github

``` bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
```

**NOTE**: If you want to use Raspberry Pi Camera, please check related appendix for [Raspberry Pi Camera][appendix_raspi_cam]
{: .notice--info}

**[TurtleBot]** Delete some packages that are not needed in TurtleBot PC

``` bash
$ cd ~/catkin_ws/src/turtlebot3
$ sudo rm -r turtlebot3_description/ turtlebot3_teleop/ turtlebot3_navigation/ turtlebot3_slam/ turtlebot3_example/
```

**[TurtleBot]** Install dependent packages

``` bash
$ sudo apt-get install ros-kinetic-rosserial-python ros-kinetic-tf
```

**[TurtleBot]** After install packages, please reboot Raspberry Pi 3.

**[TurtleBot]** Build packages

``` bash
$ source /opt/ros/kinetic/setup.bash
$ cd ~/catkin_ws && catkin_make -j1
```

If `catkin_make` command is completed without any errors, the preparation for TurtleBot3 is done.

##### [4) USB Settings](#4-usb-settings)

**[TurtleBot]** The following commands allow to use USB port for OpenCR without acquiring root permission.

``` bash
$ rosrun turtlebot3_bringup create_udev_rules
```

##### [5) Network Configuration](#5-network-configuration)

![](/assets/images/platform/turtlebot3/software/network_configuration.png)

ROS requires IP addresses in order to communicate between TurtleBot PC and the remote PC. The remote PC and TurtleBot PC should be connected to the same wifi router.

Enter the below command on the terminal window of the TurtleBot PC to find out the IP address of TurtleBot.

``` bash
$ ifconfig
```

Texts in the rectangle is the IP address of the `TurtleBot PC`.

![](/assets/images/platform/turtlebot3/software/network_configuration4.png)

Enter the following command.

``` bash
$ nano ~/.bashrc
```

Press `alt+/` to end line of the file.

Replace the `localhost` in the `ROS_MASTER_URI` address with the Remote PC's IP address acquired from [Remote PC Network Configuration][network_configuration]. Also replace the `localhost` in the `ROS_HOSTNAME` address with the IP address acquired from the above terminal window, which is the IP address of TurtleBot PC.

![](/assets/images/platform/turtlebot3/software/network_configuration5.png)

Then, source the bashrc with below command.

``` bash
$ source ~/.bashrc
```

[ros]: http://wiki.ros.org

#### [Install Linux based on Raspbian](#install-linux-based-on-raspbian)

**WARNING**: The SDcard should have at least **8 GB** of empty space in order to install Linux on Raspberry Pi 3.
{: .notice--warning}

We provide the Linux distro image based on Raspbian. They are pre-installed with ROS and ROS-packages related TurtleBot3. It supports the TurtleBot3 Burger and Waffle Pi model. In this distro image, non-free software like Wolfram, Mathematica, Minecraft Pi and Oracle Java SE are removed. 

##### Remote PC
- Download the Linux distro image based on Raspbian for TurtleBot3
  - [download link](http://www.robotis.com/service/download.php?no=730)
  - SHA256: a82e6dff50d6216ae2f557ebb1d8636af7d6c8a260e8df4f7ae7c9c8bdc0da28
- After download, unzip the downloaded file.
- Guide to burn the image to SD card
  - Visit [etcher.io](https://etcher.io/) and download and install the Etcher SD card image utility.
  - Run Etcher and select the Linux image you downloaded on your computer or laptop.
  - Select the SD card drive.
  - Click Burn to transfer the image to the SD card. 
- (other methods to burn) You can use 'dd' command in Linux or use application 'win32diskimager' in Windows. For a complete guide, take a look [here](https://elinux.org/RPi_Easy_SD_Card_Setup#Using_the_Linux_command_line) (for Linux users) and [here](elinux.org/RPi_Easy_SD_Card_Setup#Using_the_Win32DiskImager_program) (for Windows users)

##### TurtleBot PC
- After the installation, you can login with username **pi** and password **turtlebot**. In this case, you have to connect your Raspberry Pi to your monitor using an HDMI cable, and connect your keyboard and mouse to the Raspberry Pi.

- Expand filesystem to use a whole SD card. 
  ```
  sudo raspi-config
  (select 7 Advanced Options > A1 Expand Filesystem)
  ```

- [Guide to connecting to a wireless network](https://www.raspberrypi.org/learning/software-guide/wifi/)

- Synchronize and set computers' date and time by querying a Network Time Protocol (NTP) server
  ```
  sudo apt-get install ntpdate
  sudo ntpdate ntp.ubuntu.com
  ```

- If you want to change the Password, Locale and Timezone setting (Optional):
  1. sudo raspi-config > 1 Change User Password
  1. sudo raspi-config > 4 Localisation Options > I1 Change Locale
  1. sudo raspi-config > 4 Localisation Options > I2 Change Timezone

- Network configuration for ROS [(reference link)][network_configuration]
	```
	nano ~/.bashrc
	(modified the `localhost` below to `Raspberry Pi's IP`)

	export ROS_MASTER_URI=http://localhost:11311
	export ROS_HOSTNAME=localhost
	```

	```
	source ~/.bashrc
	```

##### Remote PC
- Once you're done the wireless configuration, you can connect to Raspberry Pi via SSH from your desktop or laptop [(reference link)][enable_ssh_server_in_raspberry_pi]: 
  ```
  ssh pi@192.168.xxx.xxx (The IP 192.168.xxx.xxx is your Raspberry Pi's IP or hostname)
  ```

{% capture notice_03 %}
**NOTE**: **Differences from the official Raspbian Stretch**
- It based on [Raspbian Stretch with desktop](https://www.raspberrypi.org/downloads/raspbian/), the Raspbian based on Debian Stretch
- Removed non-free software like Wolfram, Mathematica, Minecraft Pi and Oracle Java SE
- Removed libreoffice to reduce image size
- Enabled SSH and Camera function using raspi-config
- Change the password: **turtlebot**
- Installed software for ROS and TurtleBot3
  - [ROS Kinetic Kame](http://wiki.ros.org/kinetic) and dependency software
  - [raspicam_node](https://github.com/UbiquityRobotics/raspicam_node) package for Raspberry Pi Camera
  - [hls_lfcd_lds_driver](https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver) package for Laser Distance Sensor
  - [turtlebot3](https://github.com/ROBOTIS-GIT/turtlebot3) and [turtlebot3_msgs](https://github.com/ROBOTIS-GIT/turtlebot3_msgs) packages for TutleBot3
  - Installed ROS Packages (132 packages): actionlib, actionlib_msgs, angles, bond, bond_core, bondcpp, bondpy, camera_calibration_parsers, camera_info_manager, catkin, class_loader, cmake_modules, collada_parser, collada_urdf, common_msgs, compressed_image_transport, control_msgs, cpp_common, cv_bridge, diagnostic_aggregator, diagnostic_analysis, diagnostic_common_diagnostics, diagnostic_msgs, diagnostic_updater, diagnostics, dynamic_reconfigure, eigen_conversions, eigen_stl_containers, executive_smach, filters, gencpp, geneus, genlisp, genmsg, gennodejs, genpy, geometric_shapes, geometry, geometry_msgs, hls_lfcd_lds_driver, image_transport, joint_state_publisher, kdl_conversions, kdl_parser, message_filters, message_generation, message_runtime, mk, nav_msgs, nodelet, nodelet_core, nodelet_topic_tools, octomap (plain cmake), opencv3 (plain cmake), orocos_kdl (plain cmake), pluginlib, python_orocos_kdl (plain cmake), python_qt_binding, random_numbers, raspicam_node, resource_retriever, robot, robot_model, robot_state_publisher, ros, ros_base, ros_comm, ros_core, rosbag, rosbag_migration_rule, rosbag_storage, rosbash, rosboost_cfg, rosbuild, rosclean, rosconsole, rosconsole_bridge, roscpp, roscpp_core, roscpp_serialization, roscpp_traits, roscreate, rosgraph, rosgraph_msgs, roslang, roslaunch, roslib, roslint, roslisp, roslz4, rosmake, rosmaster, rosmsg, rosnode, rosout, rospack, rosparam, rospy, rosserial_msgs, rosserial_python, rosservice, rostest, rostime, rostopic, rosunit, roswtf, self_test, sensor_msgs, shape_msgs, smach, smach_msgs, smach_ros, smclib, std_msgs, std_srvs, stereo_msgs, tf, tf_conversions, tf2, tf2_kdl, tf2_msgs, tf2_py, tf2_ros, topic_tools, trajectory_msgs, turtlebot3_bringup, turtlebot3_msgs, urdf, urdf_parser_plugin, visualization_msgs, xacro, xmlrpcpp
{% endcapture %}
<div class="notice--info">{{ notice_03 | markdownify }}</div>

[install_linux_ubuntu_mate]: /docs/en/platform/turtlebot3/raspberry_pi_3_setup/#install-linux-ubuntu-mate
[install_linux_based_on_raspbian]: /docs/en/platform/turtlebot3/raspberry_pi_3_setup/#install-linux-based-on-raspbian
[install_ubuntu]: /docs/en/platform/turtlebot3/joule_setup/#install-linux-ubuntu

[appendix_raspi_cam]: /docs/en/platform/turtlebot3/appendix_raspi_cam/#raspberry-pi-camera
[pc_network_configuration]: /docs/en/platform/turtlebot3/pc_setup/#network-configuration
[network_configuration]: #5-network-configuration
[enable_ssh_server_in_raspberry_pi]: /docs/en/platform/turtlebot3/faq/#enable-ssh-server-in-raspberry-pi
