{::options parse_block_html="true" /}

# Quick Start Guide

## [PC Setup](#pc-setup)

**WARNING**: The contents in this chapter corresponds to the `Remote PC` (your desktop or laptop PC) which will control TurtleBot3. Do not apply this instruction to your TurtleBot3.
{: .notice--danger}

**NOTE**: This instruction was tested on Windows with `Windows 10 IoT Enterprise` and `ROS1 Melodic Morenia`.
{: .notice--info}

### [Setup Remote PC](#setup-remote-pc)

If you do not already have `Windows 10` on your Remote PC (Desktop, Laptop or SBC), you can download a trial of Windows 10 IoT Enterprise from the following link:

- [Download Windows 10 IoT Enterprise(Trial)][windows_download_link]

### [Setup TurtleBot3 Workspace](#setup-turtlebot3-workspace)

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

### [Network Configuration](#network-configuration)

To communicate from a Windows 10 system to a remote single board computer (SBC) running on the turtlebot, set the following environment variables:

```bash
> set ROS_MASTER_URI=http://<IP address of the SBC>:11311
> set ROS_HOSTNAME=<name of the windows computer>
```
