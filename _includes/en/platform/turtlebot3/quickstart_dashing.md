# Quick Start Guide

<iframe width="560" height="315" src="https://www.youtube.com/embed/8w3xhG1GPdo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [PC Setup](#pc-setup)

**WARNING**: The contents in this chapter corresponds to the `Remote PC` (your desktop or laptop PC) which will control TurtleBot3. Do not apply this instruction to your TurtleBot3.
{: .notice--danger}

**NOTE**: This instruction was tested on Linux with `Ubuntu 18.04` and `ROS2 Dashing Diademata`.
{: .notice--info}

### [Download and Install Ubuntu on PC](#download-and-install-ubuntu-on-pc)

1. Download the proper `Ubuntu 18.04 LTS Desktop` image for your PC from the links below.
  - [Ubuntu 18.04 LTS Desktop image (64-bit)](http://releases.ubuntu.com/18.04/ubuntu-18.04.5-desktop-amd64.iso){: .blank}

2. Follow the instruction below to install Ubuntu on PC.
  - [Install Ubuntu desktop](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview)


### [Install ROS 2 on Remote PC](#install-ros-2-on-remote-pc)

Open the terminal with `Ctrl`+`Alt`+`T` and enter below commands one at a time.  
In order to check the details of the easy installation script, please refer to [the script file](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros2_dashing.sh).  
```bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros2_dashing.sh
$ chmod 755 ./install_ros2_dashing.sh
$ bash ./install_ros2_dashing.sh
```

If the above installation fails, please refer to [the official ROS2 Dashing installation guide](https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/).


### [Install Dependent ROS 2 Packages](#install-dependent-ros-2-packages)

1. Open the terminal with `Ctrl`+`Alt`+`T` from **Remote PC**.
2. Install Colcon
  ```bash
$ sudo apt install python3-colcon-common-extensions
  ```
3. Install Gazebo9
  ```bash
$ curl -sSL http://get.gazebosim.org | sh
  ```

4. Uninstall Gazebo11 if installed previously
  ```bash
$ sudo apt remove gazebo11 libgazebo11-dev
$ sudo apt install gazebo9 libgazebo9-dev
$ sudo apt install ros-dashing-gazebo-ros-pkgs
  ```
5. Install Cartographer
  ```bash
$ sudo apt install ros-dashing-cartographer
$ sudo apt install ros-dashing-cartographer-ros
  ```
6. Install Navigation2
  ```bash
$ sudo apt install ros-dashing-navigation2
$ sudo apt install ros-dashing-nav2-bringup
  ```
7. Install vcstool
  ```bash
$ sudo apt install python3-vcstool
  ```

### [Install TurtleBot3 Packages](#install-turtlebot3-packages)

```bash
$ source /opt/ros/dashing/setup.bash
$ sudo apt install ros-dashing-turtlebot3-msgs
$ sudo apt install ros-dashing-turtlebot3
```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) **Click here to expand about building TurtleBot3 packages with source code.**
{: .notice--success}
</summary>
In case you need to build the TurtleBot3 packages with source code, please use the commands below.  
Building the source code provides most up to date contents which may have resolved known issues.  
Make sure to remove the binary packages to avoid redundancy.  
```bash
$ sudo apt remove ros-dashing-turtlebot3-msgs
$ sudo apt remove ros-dashing-turtlebot3
$ mkdir -p ~/turtlebot3_ws/src
$ cd ~/turtlebot3_ws/src/
$ git clone -b dashing-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone -b dashing-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
$ colcon build --symlink-install
$ source ~/.bashrc
```
</details>

### [Environment Configuration](#environment-configuration)

1. Set the ROS environment for PC.
  ```bash
$ echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
$ echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
$ source ~/.bashrc
  ```

If you have installed TurtleBot3 using `apt install` command, you can ignore the warning below.  
```bash
bash: /home/{$YOUR_ACCOUNT}/turtlebot3_ws/install/setup.bash: No such file or directory
```
