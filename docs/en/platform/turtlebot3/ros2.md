---
layout: archive
lang: en
ref: ros_2
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 26
---

<div style="counter-reset: h1 14"></div>


# [ROS 2](#ros-2)

{% capture notice_01 %}
**NOTE**:
- The test is done on `Ubuntu 18.04` and `ROS 2 Dashing Diademata`.
- These instructions are supposed to be performed with a remote PC and SBC in TurtleBot.
- You can ask any questions on [ROS Answers](https://answers.ros.org/questions/) if you are in touble to follow the instruction.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

This chapter shows demos using TurtleBot3 with **ROS 2** and **Gazebo 9**. In order to implement them, you need to install some packages.


## [Setup](#setup)

### [PC setup](#pc-setup)

#### Install Ubuntu on Remote PC

To set ROS (Robot Operating System) on **romote PC**, please install Ubuntu 18.04 on **remote PC**. Tutorial guide will be helpful for you to install it.

- [Download Ubuntu 18.04](http://releases.ubuntu.com/18.04/)
- [Tutorial - Install Ubuntu Desktop](https://tutorials.ubuntu.com/tutorial/tutorial-install-ubuntu-desktop#0)

#### Install ROS 2 on Remote PC

![](/assets/images/platform/turtlebot3/logo_ros.png)

As TurtleBot3 operates on Robot Operating System(ROS), it requies to intall `ros-dashing-desktop` debian packages for `ROS 2 Dashing Diademata` on Ubuntu platform installed in **remote PC**. Following link will guide you for installing ROS 2.

- [ROS 2 Installation Guide](https://index.ros.org/doc/ros2/Installation/Dashing/)

#### Install ROS 2 Dependency Packages

Install ROS 2 dependency packages on **Remote PC**.

```bash
# Install Cartographer dependencies
$ sudo apt install -y \
    google-mock \
    libceres-dev \
    liblua5.3-dev \
    libboost-dev \
    libboost-iostreams-dev \
    libprotobuf-dev \
    protobuf-compiler \
    libcairo2-dev \
    libpcl-dev \
    python3-sphinx
# Install Gazebo9
$ curl -sSL http://get.gazebosim.org | sh
$ sudo apt install ros-dashing-gazebo-*
# Install Cartographer
$ sudo apt install ros-dashing-cartographer
# Install Navigation2
$ sudo apt install ros-dashing-navigation2
$ sudo apt install ros-dashing-nav2-bringup
# Install vcstool
$ sudo apt install python3-vcstool
```

#### Install TurtleBot3 ROS 2 Packages

Download `turtlebot3` packages and install `turtlebot3` packages and ROS 2 dependency packages on **Remote PC**.

```bash
$ mkdir -p ~/turtlebot3_ws/src
$ cd ~/turtlebot3_ws
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/ros2/turtlebot3.repos
$ vcs import src < turtlebot3.repos
$ colcon build --symlink-install
```

#### Save bash command for Setup
```bash
$ echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
$ echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
$ source ~/.bashrc
```

{% capture notice_02 %}
**NOTE**:
Related documents will be helpful for you to fix the problem of any build errors or warnings from dependencies files.  
**ROS related documents** :  
- [Cartographer](https://google-cartographer.readthedocs.io/en/latest/)
- [Cartographer_ros](https://google-cartographer-ros.readthedocs.io/en/latest/)
- [Navigation2](https://github.com/ros-planning/navigation2/blob/master/README.md)
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify }}</div>

### [SBC setup](#sbc-setup)

#### Download and Install Ubuntu Image File

**WARNING** : Do not proceed to this instruction on SBC in TurtleBot3. Please follow steps with **Remote PC**.
{: .notice--warning}

1. Go on [Ubuntu releases](http://cdimage.ubuntu.com/ubuntu/releases/bionic/release) to download an image file.
2. Download `Raspberry Pi 3 (64-bit ARM) preinstalled server image` on **remote PC**
3. Burn the image file to a microSD card.

**TIP** : You can use `GNOME Disks` to burn `Ubuntu Server 18.04 image` to microSD.
{: .notice}

#### Initialization Process for Raspberry Pi 3

**WARNING** : Do not proceed to this instruction on **remote PC**. Please follow steps with **SBC in TurtleBot3**.
{: .notice--warning}

To communicate between **remote PC** and **TurtleBot3**, install `Ubuntu Server 18.04 image` file on Raspberry Pi 3.
1. Boot up Raspberry Pi 3 after insert a microSD card which has the image file into a microSD card slot on SBC in TurtleBot3.  
  (You can connect HDMI cable, keyboard and mouse into the TurtleBot3)
2. Log in with default username(`ubuntu`) and password(`ubuntu`).  
  (After log in, system will ask you whether you change the password or not)
3. You can configure WiFi network setting by utilizing a [netplan](https://netplan.io/). Refer to [Example for Netwrok Configuration](#example-for-network-configuration).

**NOTE** : TurtleBot3 is a mobile robot to run [SLAM](/docs/en/platform/turtlebot3/slam/#slam) and [Navigation](/docs/en/platform/turtlebot3/navigation/#navigation) using wireless network, so that connecting TurtleBot3 to WIFI is recommanded.
{: .notice}

#### Example for Network Configuration


1. Create a folder, and then open it with the following commands.
  ```bash
  $ sudo touch /etc/netplan/01-netcfg.yaml
  $ sudo nano /etc/netplan/01-netcfg.yaml
  ```
2. After opening the file, configure a network setting. Refer to the network setting below.
```yaml
network:
    version: 2
    renderer: networkd
    ethernets:
      eth0:
        dhcp4: yes
        dhcp6: yes
        optional: true
    wifis:
      wlan0:
        dhcp4: yes
        dhcp6: yes
        access-points:
          "your-wifi-name":
            password: "your-wifi-password"
```

3. After Configuration, remote PC can connect to a SBC in TurtleBot3 by following steps.

4. Apply all configuration for the renderers, and then restart Raspberry Pi 3.
```bash
$ sudo netplan apply
```

5. Set the systemed to prevent boot-up delay even if there is no network at startup. Run a command below to set mask the systemd process using the following command.
```bash
$ systemctl mask systemd-networkd-wait-online.service
```

**NOTE** : From now, you can use SSH. If you want remote PC to connect to SBC and to install ROS and TurtleBot3 software, run a command below.
{: .notice}

```bash
$ ssh ubuntu@<NETWORK IP of Raspberry PI>
```

#### Add swap space

1. Create a file while it will be used for swap
```bash
$ sudo fallocate -l 1G /swapfile
```

2. Give `read` and `write` permissions to the file
```bash
$ sudo chmod 600 /swapfile
```

3. Use `mkswap` to set up a Linux swap area. 
```bash
$ sudo mkswap /swapfile
```

4. After creating a file, activate the file to start using it. 
```bash
$ sudo swapon /swapfile
```

5. Open `/etc/fstab` file with `nano` command, as swap areas are listed in `/etc/fastab`.
```bash
$ sudo nano /etc/fstab
```

6. Copy a sentence below, then paste it the file you opened.
```
/swapfile swap swap defaults 0 0
```

7. Verify swap area with `free` syntax whether it is allocated. It will present a table consisting of six colums and three rows of data. 
```bash
$ sudo free -h
```

#### Intall ROS 2 Dashing Diademata

**WARNING** : Do not proceed to this instruction on **remote PC**. Please follow steps with **SBC in TurtleBot3**.
{: .notice--warning}

As TurtleBot3 operates on Robot Operating System(ROS), it requies to intall `ROS 2 Dashing Diademata` on Ubuntu installed in **SBC of TurtleBot3**. Following link will guide you for installing ROS 2.

- [ROS 2 Installation Guide](https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/)

1. Update and upgrade your software
```bash
$ sudo apt update && sudo apt upgrade
```
1. Setup locale
```bash
$ sudo locale-gen en_US en_US.UTF-8
$ sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
$ export LANG=en_US.UTF-8
```
1. Setup sources
```bash
$ sudo apt update && sudo apt install curl gnupg2 lsb-release
$ curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
$ sudo sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'
```
1. Install ROS 2 packages
```bash
$ sudo apt update
$ sudo apt install ros-dashing-ros-base
```

#### Install TurtleBot3 Packages

**WARNING** : Do not proceed to this instruction on remote PC. Please follow steps with **SBC in TurtleBot3**.
{: .notice--warning}

```bash
$ sudo apt install python3-argcomplete python3-colcon-common-extensions libboost-system-dev
$ mkdir -p ~/turtlebot3_ws/src && cd ~/turtlebot3_ws/src
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/turtlebot3.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/DynamixelSDK.git
$ cd ~/turtlebot3_ws/src/turtlebot3
$ rm -r turtlebot3_cartographer turtlebot3_navigation2
$ cd ~/turtlebot3_ws/
$ source /opt/ros/dashing/setup.bash
$ colcon build --symlink-install --parallel-workers 1
```

#### Environment Setup

##### Domain ID Allocation
In DDS communication, `ROS_DOMAIN_ID` must be matched between **remote PC** and **TurtleBot3** for wireless communication under the same network environment. Following commands shows how to assign a `ROS_DOMAIN_ID` to SBC in TurtleBot3.
- A default ID of **TurtleBot3** is set as `0`.  
- To configure the `ROS_DOMAIN_ID` of Remote PC and SBC in TurtleBot3 to `30` is recommendable.  

```bash
$ echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
$ echo 'export ROS_DOMAIN_ID=30 #TURTLEBOT3' >> ~/.bashrc
$ source ~/.bashrc
```
**WARNING** : Do not **OVERLAP** any IDs between you and other users. It will cause a conflict of communication between users under the same network environment.
{: .notice--warning}

##### OpenCR Port Set up

Following commands show how to assign OpenCR port authorization to TurtleBot3.
```bash
$ cd ~/turtlebot3_ws/src/turtlebot3/turtlebot3_bringup 
$ sudo cp ./99-turtlebot3-cdc.rules /etc/udev/rules.d/ 
$ sudo udevadm control --reload-rules 
$ sudo udevadm trigger
```

#### [References](#references)

[https://wiki.ubuntu.com/ARM/RaspberryPi](https://wiki.ubuntu.com/ARM/RaspberryPi)  
[https://discourse.ros.org/t/setting-up-the-turtlebot3-with-ros2-on-ubuntu-server-iot-18-04/10090](https://discourse.ros.org/t/setting-up-the-turtlebot3-with-ros2-on-ubuntu-server-iot-18-04/10090)  
[https://netplan.io](https://netplan.io)  
[https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/](https://index.ros.org/doc/ros2/Installation/Dashing/Linux-Install-Debians/)  
[https://index.ros.org/doc/ros2/Tutorials/Colcon-Tutorial/](https://index.ros.org/doc/ros2/Tutorials/Colcon-Tutorial/)  
[https://linuxize.com/post/how-to-add-swap-space-on-ubuntu-18-04/](https://linuxize.com/post/how-to-add-swap-space-on-ubuntu-18-04/)

### [OpenCR setup](#opencr-setup)

**WARNING** : Do not proceed to this instruction on remote PC. Please follow steps with **SBC in TurtleBot3**.
{: .notice--warning}

#### Install dependencies to run 32bit executables.
```bash
$ sudo dpkg --add-architecture armhf
$ sudo apt-get update
$ sudo apt-get install libc6:armhf
```

#### Download OpenCR binaries & tools for uploading.
```bash
$ cd && rm -rf opencr_update.tar.bz2
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS2/latest/opencr_update.tar.bz2
$ tar -xjf ./opencr_update.tar.bz2
```

#### Upload ROS 2 firmware of TurtleBot3 to OpenCR.

##### For TurtleBot3 Burger.
```bash
# Set a port for OpenCR 
$ export OPENCR_PORT=/dev/ttyACM0
# Set a model of TurtleBot3 you are using
$ export OPENCR_MODEL=burger
$ cd ~/opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr
```

The following window shows you the result of a firmware upload of TurtleBot3 Burger to OpenCR.  
Make sure `jump_to_fw` message is displayed on the bottom of the window. 

```bash
aarch64
arm
OpenCR Update Start..
opencr_ld_shell ver 1.0.0
opencr_ld_main
[  ] file name   	: burger.opencr
[  ] file size   	: 168 KB
[  ] fw_name     	: burger
[  ] fw_ver      	: V180903R1
[OK] Open port   	: /dev/ttyACM0
[  ]
[  ] Board Name  	: OpenCR R1.0
[  ] Board Ver   	: 0x17020800
[  ] Board Rev   	: 0x00000000
[OK] flash_erase 	: 0.96s
[OK] flash_write 	: 1.92s
[OK] CRC Check   	: 10E28C8 10E28C8 , 0.006000 sec
[OK] Download
[OK] jump_to_fw
```

##### For TurtleBot3 Waffle and Waffle Pi.

```bash
# Set a port for OpenCR 
$ export OPENCR_PORT=/dev/ttyACM0
# Set a model of TurtleBot3 you are using
$ export OPENCR_MODEL=waffle
$ cd ~/opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr
```

The following window shows you the result of a firmware upload of TurtleBot3 Waffle/Waffle Pi to OpenCR.  
Make sure `jump_to_fw` message is displayed on the bottom of the window.  

```bash
aarch64
arm
OpenCR Update Start..
opencr_ld_shell ver 1.0.0
opencr_ld_main
[  ] file name   	: waffle.opencr
[  ] file size   	: 168 KB
[  ] fw_name     	: waffle
[  ] fw_ver      	: V180903R1
[OK] Open port   	: /dev/ttyACM0
[  ]
[  ] Board Name  	: OpenCR R1.0
[  ] Board Ver   	: 0x17020800
[  ] Board Rev   	: 0x00000000
[OK] flash_erase 	: 0.96s
[OK] flash_write 	: 1.92s
[OK] CRC Check   	: 10E28C8 10E28C8 , 0.006000 sec
[OK] Download
[OK] jump_to_fw
```

Reset OpenCR using RESET button.

![](/assets/images/parts/controller/opencr10/bootloader_19.png)

After few seconds, particular sound will be played. 

## [Bringup](#bringup)

### Bringup TurtleBot3

1. Launch a model of your TurtleBot3 including node of `robot_state_publisher` and `turtlebot3_node`.

    **NOTE**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
    {: .notice}
    
    **NOTE**: Please follow steps with **SBC in TurtleBot3**.
    {: .notice}

    ```bash
    $ export TURTLEBOT3_MODEL=${TB3_MODEL}
    $ ros2 launch turtlebot3_bringup robot.launch.py
    ```

2. If the node is successfully launched, the following instruction will appeared on the terminal window.
```bash
[INFO] [launch]: All log files can be found below /home/ubuntu/.ros/log/2019-08-19-01-24-19-009803-ubuntu-15310
[INFO] [launch]: Default logging verbosity is set to INFO
urdf_file_name : turtlebot3_burger.urdf
[INFO] [robot_state_publisher-1]: process started with pid [15320]
[INFO] [hlds_laser_publisher-2]: process started with pid [15321]
[INFO] [turtlebot3_ros-3]: process started with pid [15322]
[robot_state_publisher-1] Initialize urdf model from file: /home/ubuntu/turtlebot_ws/install/turtlebot3_description/share/turtlebot3_description/urdf/turtlebot3_burger.urdf
[robot_state_publisher-1] Parsing robot urdf xml string.
[robot_state_publisher-1] Link base_link had 5 children
[robot_state_publisher-1] Link caster_back_link had 0 children
[robot_state_publisher-1] Link imu_link had 0 children
[robot_state_publisher-1] Link base_scan had 0 children
[robot_state_publisher-1] Link wheel_left_link had 0 children
[robot_state_publisher-1] Link wheel_right_link had 0 children
[robot_state_publisher-1] got segment base_footprint
[robot_state_publisher-1] got segment base_link
[robot_state_publisher-1] got segment base_scan
[robot_state_publisher-1] got segment caster_back_link
[robot_state_publisher-1] got segment imu_link
[robot_state_publisher-1] got segment wheel_left_link
[robot_state_publisher-1] got segment wheel_right_link
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Init TurtleBot3 Node Main
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Init DynamixelSDKWrapper
[turtlebot3_ros-3] [INFO] [DynamixelSDKWrapper]: Succeeded to open the port(/dev/ttyACM0)!
[turtlebot3_ros-3] [INFO] [DynamixelSDKWrapper]: Succeeded to change the baudrate!
[robot_state_publisher-1] Adding fixed segment from base_footprint to base_link
[robot_state_publisher-1] Adding fixed segment from base_link to caster_back_link
[robot_state_publisher-1] Adding fixed segment from base_link to imu_link
[robot_state_publisher-1] Adding fixed segment from base_link to base_scan
[robot_state_publisher-1] Adding moving segment from base_link to wheel_left_link
[robot_state_publisher-1] Adding moving segment from base_link to wheel_right_link
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Start Calibration of Gyro
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Calibration End
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Add Motors
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Add Wheels
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Add Sensors
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create battery state publisher
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create imu publisher
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create sensor state publisher
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create joint state publisher
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Add Devices
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create motor power server
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create reset server
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Succeeded to create sound server
[turtlebot3_ros-3] [INFO] [turtlebot3_node]: Run!
[turtlebot3_ros-3] [INFO] [diff_drive_controller]: Init Odometry
[turtlebot3_ros-3] [INFO] [diff_drive_controller]: Run!
```
3. After then, you can check topic and service list as shown below  
**Topic**
```bash
$ ros2 topic list
/battery_state
/cmd_vel
/imu
/joint_states
/magnetic_field
/odom
/parameter_events
/robot_description
/rosout
/scan
/sensor_state
/tf
/tf_static
```
**Service List**
```bash
$ ros2 service list
/diff_drive_controller/describe_parameters
/diff_drive_controller/get_parameter_types
/diff_drive_controller/get_parameters
/diff_drive_controller/list_parameters
/diff_drive_controller/set_parameters
/diff_drive_controller/set_parameters_atomically
/hlds_laser_publisher/describe_parameters
/hlds_laser_publisher/get_parameter_types
/hlds_laser_publisher/get_parameters
/hlds_laser_publisher/list_parameters
/hlds_laser_publisher/set_parameters
/hlds_laser_publisher/set_parameters_atomically
/launch_ros/describe_parameters
/launch_ros/get_parameter_types
/launch_ros/get_parameters
/launch_ros/list_parameters
/launch_ros/set_parameters
/launch_ros/set_parameters_atomically
/motor_power
/reset
/sound
/turtlebot3_node/describe_parameters
/turtlebot3_node/get_parameter_types
/turtlebot3_node/get_parameters
/turtlebot3_node/list_parameters
/turtlebot3_node/set_parameters
/turtlebot3_node/set_parameters_atomically
```

### Rviz2

**WARNING** : Do not proceed to this instruction on SBC in TurtleBot3. Please follow steps with **Remote PC**.
{: .notice--warning}

1. Run `RViz2` on **remote PC**
```bash
$ ros2 launch turtlebot3_bringup rviz2.launch.py
```

![](/assets/images/platform/turtlebot3/ros2/platform_teleop.png)

## [Teleoperation](#teleoperation)

1. Run teleoperation node on **remote PC**
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

2. If the node is successfully run, the following instruction will be appeared to the terminal window.  
    ```bash
    Control Your TurtleBot3!
    ---------------------------
    Moving around:
            w
       a    s    d
            x

    w/x : increase/decrease linear velocity (Burger : ~ 0.22, Waffle and Waffle Pi : ~ 0.26)
    a/d : increase/decrease angular velocity (Burger : ~ 2.84, Waffle and Waffle Pi : ~ 1.82)

    space key, s : force stop

    CTRL-C to quit
    ```

## [Cartographer](#cartographer)
**Cartographe related documents** :
- [Cartographer](https://google-cartographer.readthedocs.io/en/latest/)
- [Cartographer_ros](https://google-cartographer-ros.readthedocs.io/en/latest/)

**WARNING** : Do not proceed to this instruction on SBC in TurtleBot3. Please follow steps with **Remote PC**.
{: .notice--warning}

**SLAM (Simultaneous Localization And Mapping)** is a technique to draw a map by estimating current location in an arbitrary space. The SLAM is a well-known feature of TurtleBot from its predecessors. The video here shows you how accurately TurtleBot3 can draw a map with its compact and affordable platform.

1. Lauch `turtlebot3_cartographer cartographer.launch.py`
```bash
$ ros2 launch turtlebot3_cartographer cartographer.launch.py
```
    ![](/assets/images/platform/turtlebot3/ros2/platform_cartographer.png)
2. Save the map
```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```
<iframe width="560" height="315" src="https://www.youtube.com/embed/wzz54a8ppxI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## [Navigation2](#navigation2)

**Navigation** is to move a robot from one location to the specified destination in a given environment. For this purpose, a map that contains geometry information of furniture, objects, and walls of the given environment is required. As described in the previous [Cartographer](/docs/en/platform/turtlebot3/ros2/#cartographer) section, the map was created with the distance information obtained by the sensor and the pose information of the robot itself.

**Navigation** enables a robot to move from the current pose to the designated goal pose on the map by using the map, robot’s encoder, IMU sensor, and distance sensor. The procedure for performing this task is as follows.

**Naviagation2 related document** :  
- [Naviagation2](https://github.com/ros-planning/navigation2/blob/master/README.md)

### [Run Navigation2 Nodes](#run-navigation-nodes)

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py map:=$HOME/map.yaml
```

- Click `2D Pose Estimate` button in a menu bar, and then point exact pose of TurtleBot3 on a map.

![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_1.png)
> 2D Pose Estimate

- If TurtleBot3 is close to a costmap or nearby the costmap map, click `Navigation2 Goal` button in a menu bar, and then point goal pose on the map.

![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_2.png)
> Navigation2 Goal

## [Simulation](#simulation)

**WARNING** : Do not proceed to this instruction on SBC in TurtleBot3. Please follow steps with **Remote PC**.
{: .notice--warning}

1. Add GAZEBO_MODEL_PATH.
```bash
$ echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models' >> ~/.bashrc
$ source ~/.bashrc
```
    **NOTE**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
    {: .notice}

1. Load TurtleBot3 on TurtleBot3 world.
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```
    ![](/assets/images/platform/turtlebot3/ros2/gazebo_world.png)

3. Launch Cartographer.
```bash
$ ros2 launch turtlebot3_cartographer cartographer.launch.py use_sim_time:=True
```

4. Run teleoperation node.
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

5. Save the map.
```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```
    ![](/assets/images/platform/turtlebot3/ros2/gazebo_cartographer.png)

<iframe width="560" height="315" src="https://www.youtube.com/embed/PUr9k8CRNE0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**NOTE** :
You should set some parameters to use simulation time.
If you need futher information about it, go on [navigation2 repo](https://github.com/ros-planning/navigation2/tree/master/nav2_bringup)
{: .notice--info}

6.Export the model of TurtleBot3, then launch Navigation2 with following commands.
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=$HOME/map.yaml
```
**NOTE**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice}

- Click `2D Pose Estimate` button in a menu bar, and then point exact pose of turtlebot3 on a map.
- If TurtleBot3 is close to a costmap or nearby the map, click `Navigation2 Goal` button in a menu bar, and then point goal pose on the map.

![](/assets/images/platform/turtlebot3/ros2/gazebo_navigation2.png)

<iframe width="560" height="315" src="https://www.youtube.com/embed/aQh8JqSrmCs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
