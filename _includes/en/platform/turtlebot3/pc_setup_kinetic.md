
<div style="counter-reset: h1 3"></div>
<div style="counter-reset: h2 0"></div>

{::options parse_block_html="true" /}

## [PC Setup](#pc-setup)

**WARNING**: The contents in this chapter corresponds to the `Remote PC` (your desktop or laptop PC) which will control TurtleBot3. Do not apply this instruction to your TurtleBot3.
{: .notice--danger}

**NOTE**: This instruction was tested on Linux with `Ubuntu 16.04` and `ROS1 Kinetic Kame`.
{: .notice--info}

### [Download and Install Ubuntu on PC](#download-and-install-ubuntu-on-pc)

1. Download the proper `Ubuntu 16.04 LTS Desktop` image for your PC from the links below.
  - [Ubuntu 16.04 LTS Desktop image (64-bit)](https://releases.ubuntu.com/16.04.7/ubuntu-16.04.7-desktop-amd64.iso)
  - [Ubuntu 16.04 LTS Desktop image (32-bit)](https://releases.ubuntu.com/16.04.7/ubuntu-16.04.6-desktop-i386.iso)

2. Follow the instruction below to install Ubuntu on PC.
  - [Install Ubuntu desktop](https://www.ubuntu.com/download/desktop/install-ubuntu-desktop)

### [Install ROS 1 on Remote PC](#install-ros-1-on-remote-pc)

Open the terminal with `Ctrl`+`Alt`+`T` and enter below commands one at a time.  
In order to check the details of the easy installation script, please refer to [the script file](https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh).  
```bash
$ sudo apt-get update
$ sudo apt-get upgrade
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh
$ chmod 755 ./install_ros_kinetic.sh 
$ bash ./install_ros_kinetic.sh
```

If the above installation fails, please refer to [the official ROS1 Kinetic installation guide](http://wiki.ros.org/kinetic/Installation/Ubuntu).

### [Install Dependent ROS 1 Packages](#install-dependent-ros-1-packages)

```bash
$ sudo apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy \
  ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc \
  ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan \
  ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python \
  ros-kinetic-rosserial-server ros-kinetic-rosserial-client \
  ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server \
  ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro \
  ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view \
  ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers
```

### [Install TurtleBot3 Packages](#install-turtlebot3-packages)

```bash
$ source /opt/ros/kinetic/setup.bash
$ sudo apt-get install ros-kinetic-turtlebot3-msgs
$ sudo apt-get install ros-kinetic-turtlebot3
```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) **Click here to expand more details about TurtleBot3 package installation.**
{: .notice--success}
</summary>
In case you need to download the source codes and build them, please use the commands below.  
Make sure to remove the identical packages to avoid redundancy.  
```bash
$ sudo apt-get remove ros-kinetic-turtlebot3-msgs
$ sudo apt-get remove ros-kinetic-turtlebot3
$ mkdir -p ~/catkin_ws/src
$ cd ~/catkin_ws/src/
$ git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
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
