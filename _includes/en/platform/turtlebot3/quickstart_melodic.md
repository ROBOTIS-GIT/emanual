# Melodic Quick Start Guide

## [[Windows] Setup Remote PC](#windows-setup-remote-pc)

If you do not already have `Windows 10` on your Remote PC (Desktop, Laptop or SBC), you can download a trial of Windows 10 IoT Enterprise from the following link:

- [Download Windows 10 IoT Enterprise(Trial)][windows_download_link]

## [Windows] Setup TurtleBot3 WS

```bash
> mkdir c:\ws\turtlebot3\src
> cd c:\ws\turtlebot3\src
> catkin_init_workspace
> git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs
> git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations
> git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3
> git clone -b melodic-devel https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver
> cd c:\ws\turtlebot3
> rosdep update
> rosdep install --from-paths src --ignore-src -r -y
> catkin_make
> devel\setup.bat
```

### [[Windows] Network Configuration](#windows-network-configuration)

To communicate from a Windows 10 system to a remote single board computer (SBC) running on the turtlebot, set the following environment variables:

```bash
> set ROS_MASTER_URI=http://<IP address of the SBC>:11311
> set ROS_HOSTNAME=<name of the windows computer>
```
