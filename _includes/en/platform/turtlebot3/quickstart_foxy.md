
# Quick Start Guide

<iframe width="560" height="315" src="https://www.youtube.com/embed/8w3xhG1GPdo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [PC Setup](#pc-setup)

**WARNING**: The contents in this chapter corresponds to the `Remote PC` (your desktop or laptop PC) which will control TurtleBot3. Do not apply this instruction to your TurtleBot3.
{: .notice--danger}

**NOTE**: This instruction was tested on Linux with `Ubuntu 20.04` and `ROS2 Foxy Fitzroy`.
{: .notice--info}

### [Download and Install Ubuntu on PC](#download-and-install-ubuntu-on-pc)

1. Download the proper `Ubuntu 20.04 LTS Desktop` image for your PC from the links below.
  - [Ubuntu 20.04 LTS Desktop image (64-bit)](https://releases.ubuntu.com/20.04/){: .blank}

2. Follow the instruction below to install Ubuntu on PC.
  - [Install Ubuntu desktop](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview)


### [Install ROS 2 on Remote PC](#install-ros-2-on-remote-pc)

Open the terminal with `Ctrl`+`Alt`+`T` and enter below commands one at a time.  
In order to check the details of the easy installation script, please refer to [the script file](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros2_foxy.sh).  
```bash
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros2_foxy.sh
$ sudo chmod 755 ./install_ros2_foxy.sh
$ bash ./install_ros2_foxy.sh
```

If the above installation fails, please refer to [the official ROS2 Foxy installation guide](https://index.ros.org/doc/ros2/Installation/Foxy/Linux-Install-Debians/).


### [Install Dependent ROS 2 Packages](#install-dependent-ros-2-packages)

1. Open the terminal with `Ctrl`+`Alt`+`T` from **Remote PC**.
2. Install Gazebo11
  ```bash
$ sudo apt-get install ros-foxy-gazebo-*
  ```
3. Install Cartographer
  ```bash
$ sudo apt install ros-foxy-cartographer
$ sudo apt install ros-foxy-cartographer-ros
  ```
4. Install Navigation2
  ```bash
$ sudo apt install ros-foxy-navigation2
$ sudo apt install ros-foxy-nav2-bringup
  ```

### [Install TurtleBot3 Packages](#install-turtlebot3-packages)

Install TurtleBot3 via Debian Packages.

```bash
$ source ~/.bashrc
$ sudo apt install ros-foxy-dynamixel-sdk
$ sudo apt install ros-foxy-turtlebot3-msgs
$ sudo apt install ros-foxy-turtlebot3
```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) **Click here to expand more details about building TurtleBot3 package from source.**
{: .notice--success}
</summary>
In case you need to build the TurtleBot3 packages with source code, please use the commands below.  
Building the source code provides most up to date contents which may have resolved known issues.  
Make sure to remove the binary packages to avoid redundancy.  
```bash
$ sudo apt remove ros-foxy-turtlebot3-msgs
$ sudo apt remove ros-foxy-turtlebot3
$ mkdir -p ~/turtlebot3_ws/src
$ cd ~/turtlebot3_ws/src/
$ git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone -b foxy-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
$ cd ~/turtlebot3_ws
$ colcon build --symlink-install
$ echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
```
</details>

### [Environment Configuration](#environment-configuration)

1. Set the ROS environment for PC.
  ```bash
$ echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
$ source ~/.bashrc
  ```

If you have installed TurtleBot3 using Debian packages with `apt install` command, you can ignore the warning below.  
```bash
bash: /home/{$YOUR_ACCOUNT}/turtlebot3_ws/install/setup.bash: No such file or directory
```
