---
layout: archive
lang: en
ref: turtlebot3_raspberry_pi_3_setup
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/raspberry_pi_3_setup/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 6"></div>

# [Raspberry Pi 3 Setup](#raspberry_pi_3_setup)

## [Install Linux(Ubuntu MATE)](#install-linux-ubuntu-mate)

**Warning :** The SDcard should have at least **8 GB** of empty space in order to install Linux on Raspberry Pi 3.
{: .notice--warning}

**[Remote PC]** Download `Ubuntu MATE 16.04` on the Raspberry Pi 3 from the link below.

- [Ubuntu MATE](https://ubuntu-mate.org/download/)

![](/assets/images/platform/turtlebot3/preparation/download_ubuntu_mate_image.png)

**[Remote PC]** In order to install Ubuntu MATE from an image file, it is recommended using GNOME Disks with `Restore Disk Image...` option, which natively supports XZ compressed image.

``` bash
$ sudo apt-get install gnome-disk-utility
```

<iframe width="640" height="480" src="https://www.youtube.com/embed/V_6GNyL6Dac" frameborder="0" allowfullscreen></iframe>

**Tip :** It is recommended using `GNOME Disks`, but other applications such as `ddrescue` on Linux can be used.
{: .notice--info}

``` bash
$ sudo apt-get install gddrescue xz-utils
$ unxz ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img.xz
$ sudo ddrescue -D --force ubuntu-mate-16.04.2-desktop-armhf-raspberry-pi.img /dev/sdx
```

**Tip :** It is recommended using `GNOME Disks`, but other applications such as `Win32 Disk Imager` on Windows can be used. [Win32 Disk Imager](https://sourceforge.net/projects/win32diskimager/)
{: .notice--info}

### [Install ROS](#install-ros)

**Warning :** The contents in this chapter corresponds to the Raspberry Pi 3 which will be the main computer of **TurtleBot3 Burger and Waffle Pi**. Do **NOT** apply this instruction to your Remote PC (your desktop PC or laptop).
{: .notice--warning}

**Note :** This instruction takes about 2 hours to install ROS and related packages for TurtleBot3. Elapsed time may vary depending on network environment.
{: .notice--info}

![](/assets/images/platform/turtlebot3/logo_ros.png)

**Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is Ctrl-Alt-T.
{: .notice--info}

``` bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic_rp3.sh && chmod 755 ./install_ros_kinetic_rp3.sh && bash ./install_ros_kinetic_rp3.sh
```

**Note :** In order to check which packages are installed, please check this link out. [install_ros_kinetic_rp3](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic_rp3.sh)
{: .notice--info}

**Note :** After install ROS, please reboot Raspberry Pi 3.
{: .notice--info}

If you prefer manual installation, please following the link below.

- [Install ROS on Ubuntu](http://wiki.ros.org/kinetic/Installation/Ubuntu)

### [Install Dependent Packages](#install-dependent-packages)

The next step is to install dependent packages for TurtleBot3 control.

Download packages from github

``` bash
$ cd ~/catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
```

**Note :** If you want to use Raspberry Pi Camera, please check related appendix for [Raspberry Pi Camera](http://emanual.robotis.com/docs/en/platform/turtlebot3/appendix_raspi_cam/#appendix-raspberry-pi-camera)
{: .notice--info}

Delete some packages that are only used in Remote PC

``` bash
$ cd ~/catkin_ws/src/turtlebot3
$ sudo rm -r turtlebot3_description/ turtlebot3_teleop/ turtlebot3_navigation/ turtlebot3_slam/ turtlebot3_example/
```

Install dependent packages

``` bash
$ sudo apt-get install ros-kinetic-rosserial-python ros-kinetic-tf
```

**Note :** After install packages, please reboot Raspberry Pi 3.
{: .notice--info}

Build packages

``` bash
$ cd ~/catkin_ws && catkin_make
```

If catkin_make command is completed without any errors, the preparation for TurtleBot3 is done.

### [USB Settings](#usb-settings)

**[TurtleBot]** The following commands allow to use USB port for OpenCR1.0 without acquiring root permission.

``` bash
$ rosrun turtlebot3_bringup create_udev_rules
```

### [Network Configuration](#network-configuration)

![](/assets/images/platform/turtlebot3/software/network_configuration.png)

ROS requires IP addresses in order to communicate between TurtleBot3 and remote PC.

Enter the below command on the terminal window of the SBC in TurtleBot3 to find out the IP address of TurtleBot3.

``` bash
$ ifconfig
```

Texts in the rectangle is the IP address of the `TurtleBot`.

![](/assets/images/platform/turtlebot3/software/network_configuration4.png)

Enter the following command.

``` bash
$ nano ~/.bashrc
```

Press ' `alt+/` ' to end line of the file.

Replace the `localhost` in the ROS_MASTER_URI address with the IP address acquired from [Remote PC Network Configuration](http://emanual.robotis.com/docs/en/platform/turtlebot3/pc_setup/#network-configuration). Also replace the `localhost` in the ROS_HOSTNAME address with the IP address acquired from the above terminal window, which is the IP address of TurtleBot3.

![](/assets/images/platform/turtlebot3/software/network_configuration5.png)

Then, source the bashrc with below command.

``` bash
$ source ~/.bashrc
```

[ros]: http://wiki.ros.org

## [Install Linux based on Raspbian](#install-linux-based-on-raspbian)