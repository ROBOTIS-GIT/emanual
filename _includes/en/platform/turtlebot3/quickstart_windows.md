
# Quick Start Guide

## [PC Setup](#pc-setup)

**NOTE**: This instruction was tested on Windows with `Windows 10 IoT Enterprise` and `ROS1 Melodic Morenia`.
{: .notice--info}

### [Setup Remote PC](#setup-remote-pc)

1. If you do not already have `Windows 10` on your Remote PC (Desktop, Laptop or SBC), you can download a trial of Windows 10 IoT Enterprise from the following link:

- [Download Windows 10 IoT Enterprise LTSC(Trial)](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise)

2. Please refer to the [ROS Wiki instructions](https://wiki.ros.org/Installation/Windows) for installing ROS on Windows.

3. Install and build TurtleBot3 packages.

```bash
> mkdir c:\ws\turtlebot3\src
> cd c:\ws\turtlebot3\src
> catkin_init_workspace
> sudo apt install ros-melodic-hls-lfcd-lds-driver
> sudo apt install ros-melodic-turtlebot3-msgs
> sudo apt install ros-melodic-dynamixel-sdk
> git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
> cd c:\ws\turtlebot3
> rosdep update
> rosdep install --from-paths src --ignore-src -r -y
> catkin_make
> devel\setup.bat
```

### [Network Configuration](#network-configuration)

To communicate from a Windows 10 system to a remote single board computer (SBC) running on the turtlebot, set the following environment variables:

```bash
> set ROS_MASTER_URI=http://<IP address of the SBC>:11311
> set ROS_HOSTNAME=<name of the windows computer>
```
