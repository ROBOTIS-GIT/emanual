# Kinetic Quick Start Guide

## [PC Setup](#pc-setup)

Download and install the `Ubuntu 16.04` on the `Remote PC (your desktop or laptop PC)` from the following link.

- [Download link][ubuntu_download_link]

## [Install ROS 1 on Remote PC](#install-ros-1-on-remote-pc)

```bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh
```

## [Install Dependent ROS 1 Packages](#install-dependent-ros-1-packages)

The next step is to install dependent packages for TurtleBot3 control on Remote PC.

```bash
$ sudo apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers
```

```bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/catkin_ws && catkin_make
```

## [Network Configuration](#network-configuration)

```bash
$ ifconfig
```

Text strings in the rectangle is the IP address of the `Remote PC`.

![](/assets/images/platform/turtlebot3/software/network_configuration2.png)

Enter the below command.

```bash
$ nano ~/.bashrc
```

Press `alt+/` to end line of the file.

Modify the address of `localhost` in the `ROS_MASTER_URI` and `ROS_HOSTNAME` with the IP address acquired from the above terminal window.

![](/assets/images/platform/turtlebot3/software/network_configuration3.png)

Then, source the bashrc with below command.

```bash
$ source ~/.bashrc
```

[ubuntu_download_link]: https://www.ubuntu.com/download/alternative-downloads
