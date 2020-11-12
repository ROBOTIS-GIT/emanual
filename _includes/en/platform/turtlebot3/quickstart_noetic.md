{::options parse_block_html="true" /}

# Quick Start Guide

<iframe width="560" height="315" src="https://www.youtube.com/embed/ji2kQXgCjeM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [PC Setup](#pc-setup)

**WARNING**: The contents in this chapter corresponds to the `Remote PC` (your desktop or laptop PC) which will control TurtleBot3. Do not apply this instruction to your TurtleBot3.
{: .notice--danger}

**NOTE**: This instruction was tested on Linux with `Ubuntu 20.04` and `ROS1 Noetic Ninjemys`.
{: .notice--info}

### [Download and Install Ubuntu on PC](#download-and-install-ubuntu-on-pc)

1. Download the proper `Ubuntu 20.04 LTS Desktop` image for your PC from the links below.
  - [Ubuntu 20.04 LTS Desktop image (64-bit)](https://releases.ubuntu.com/20.04/ubuntu-20.04.1-desktop-amd64.iso)

2. Follow the instruction below to install Ubuntu on PC.
  - [Install Ubuntu desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

### [Install ROS 1 on Remote PC](#install-ros-1-on-remote-pc)

Open the terminal with `Ctrl`+`Alt`+`T` and enter below commands one at a time.  
In order to check the details of the easy installation script, please refer to [the script file](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_noetic.sh).  
```bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_noetic.sh
$ chmod 755 ./install_ros_noetic.sh 
$ bash ./install_ros_noetic.sh
```

If the above installation fails, please refer to [the official ROS1 Noetic installation guide](http://wiki.ros.org/noetic/Installation/Ubuntu).

### [Install Dependent ROS 1 Packages](#install-dependent-ros-1-packages)

```bash
$ sudo apt-get install ros-noetic-joy ros-noetic-teleop-twist-joy ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc ros-noetic-rgbd-launch ros-noetic-depthimage-to-laserscan ros-noetic-rosserial-arduino ros-noetic-rosserial-python ros-noetic-rosserial-server ros-noetic-rosserial-client ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro  ros-noetic-compressed-image-transport ros-noetic-rqt-image-view ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers
```

### [Install TurtleBot3 Packages](#install-turtlebot3-packages)

```bash
$ source /opt/ros/noetic/setup.bash
$ sudo apt-get install ros-noetic-turtlebot3-msgs
$ sudo apt-get install ros-noetic-turtlebot3
```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) **Click here to expand more details about TurtleBot3 package installation.**
{: .notice--success}
</summary>
In case you need to download the source codes and build them, please use the commands below.  
Make sure to remove the identical packages to avoid redundancy.  
```bash
$ sudo apt-get remove ros-noetic-turtlebot3-msgs
$ sudo apt-get remove ros-noetic-turtlebot3
$ mkdir -p ~/catkin_ws/src
$ cd ~/catkin_ws/src/
$ git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/catkin_ws && catkin_make
$ echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
```
</details>

### [Network Configuration](#network-configuration)

![](/assets/images/platform/turtlebot3/software/network_configuration.png)

1. Connect PC to a WiFi device and find the assigned IP address with the command below.  
  ```bash
$ ifconfig
  ```  
  ![](/assets/images/platform/turtlebot3/software/network_configuration2.png)

2. Open the file and update the ROS IP settings with the command below.  
  ```bash
$ nano ~/.bashrc
  ```

3. Press `Ctrl`+`END` or `Alt`+`/` to move the cursor to the end of line.  
  Modify the address of `localhost` in the `ROS_MASTER_URI` and `ROS_HOSTNAME` with the IP address acquired from the above terminal window.  
  ![](/assets/images/platform/turtlebot3/software/network_configuration3.png)

4. Source the bashrc with below command.  
  ```bash
$ source ~/.bashrc
  ```
