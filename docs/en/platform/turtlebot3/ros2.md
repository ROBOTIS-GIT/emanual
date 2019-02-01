---
layout: archive
lang: en
ref: ros2
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 14"></div>

# [ROS2](#ros2)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 18.04` and `ROS2 Crystal Clemmys`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **[Remote PC]**. However, the part marked **[TurtleBot]** is the content that runs on SBC of TurtleBot3.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

This chapter shows some demos using TurtleBot3 with ROS2 and Gazebo9. In order to implement these demos, you have to install some packages.

<!-- **NOTE**: This application must be set ROS2 firmware version `1.0.0` or higher and must be used only `ROS2` not ROS.
{: .notice--info} -->

## [Setup](#setup)

### [PC setup](#pc-setup)

**NOTE**: All demos have been tested in `Ubuntu 18.04` and `macOS High Sierra` installed `ROS2 Crystal Clemmys`.
If you got stuck during installation, please following [ROS Answers][ROS Answers] or [ROS2 Issue][ROS2 Issue].
{: .notice--info}

#### [Install Ubuntu on Remote PC]
- [Ubuntu 18.04](http://releases.ubuntu.com/18.04/)

#### [Install ROS2 on Remote PC]
- [ROS2 Installation](https://index.ros.org/doc/ros2/Installation/)

#### [Install Dependent ROS2 Packages]
**[Remote PC]** Download turtlebot3 packages for ROS2

```bash
$ mkdir -p ~/turtlebot3_ws/src
$ cd ~/turtlebot3_ws/src
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/turtlebot3.git
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
$ cd ~/turtlebot3_ws
$ colcon build --symlink-install
```

### [SBC setup](#sbc-setup)

**[TurtleBot]** Install Raspbian Stretch

1. Download [Raspbian Stretch with desktop and recommended software](https://www.raspberrypi.org/downloads/raspbian/)
1. Unzip the download file and burn image to your microSD card(>8GB)
1. Follow instruction that [How to setup for TurtleBot3 with ROS2][How to set sbc for turtlebot3 with ros2]

### [OpenCR setup](#opencr-setup)

**[TurtleBot]** Upload firmware for ROS2.

```bash
$ cd ~/turtlebot3
$ rm -rf ./opencr_update.tar.xz
$ wget https://github.com/ROBOTIS-GIT/OpenCR_Binaries/raw/master/turtlebot3/ROS2/latest/opencr_update.tar.xz
$ tar -xf ./opencr_update.tar.xz

$ export OPENCR_PORT=/dev/ttyACM0
$ export OPENCR_MODEL=burger
$ cd ./opencr_update
$ ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr
```

If uploading the firmware succeeds, below message will be displayed in the terminal.

```bash
armv7l
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

**[TurtleBot]** Reset OpenCR using RESET button.
![](/assets/images/parts/controller/opencr10/bootloader_19.png)

## [Bringup](#bringup)

### [Bringup TurtleBot3]
**[TurtleBot, RemotePC]** Sync time between TurtleBot and RemotePC

```bash
$ sudo apt-get install ntpdate
$ sudo ntpdate ntp.ubuntu.com
```

**[TurtleBot]** Run Micro-XRCE-DDS Agent for OpenCR

```bash
$ cd ~/turtlebot3 && MicroXRCEAgent serial /dev/ttyACM0
```

**[TurtleBot]** Run Micro-XRCE-DDS Agent for Lidar

```bash
$ cd ~/turtlebot3 && MicroXRCEAgent udp 2018
```

**[TurtleBot]** Run Lidar application

```bash
$ cd ~/turtlebot3 && ./turtlebot3_lidar
```

**[Remote PC]** Launch burger

```bash
$ ros2 launch turtlebot3_bringup burger.launch.py
```

If the node is successfully launched, the following instruction will be appeared to the terminal window.
```bash
[INFO] [launch]: process[robot_state_publisher-1]: started with pid [21355]
[INFO] [launch]: process[time_sync-2]: started with pid [21356]
[INFO] [launch]: process[odometry_publisher-3]: started with pid [21357]
[INFO] [launch]: process[tf_publisher-4]: started with pid [21358]
[INFO] [launch]: process[joint_states_publisher-5]: started with pid [21359]
[INFO] [launch]: process[scan_publisher-6]: started with pid [21360]
Initialize urdf model from file: /home/darby/ros2_overlay_ws/install/turtlebot3_description/share/turtlebot3_description/urdf/turtlebot3_burger.urdf
Parsing robot urdf xml string.
Link base_link had 5 children
Link caster_back_link had 0 children
Link imu_link had 0 children
Link base_scan had 0 children
Link wheel_left_link had 0 children
Link wheel_right_link had 0 children
got segment base_footprint
got segment base_link
got segment base_scan
got segment caster_back_link
got segment imu_link
got segment wheel_left_link
got segment wheel_right_link
[INFO] [time_sync]: Init System Time publisher
Adding fixed segment from base_footprint to base_link
Adding fixed segment from base_link to caster_back_link
Adding fixed segment from base_link to imu_link
Adding fixed segment from base_link to base_scan
Adding moving segment from base_link to wheel_left_link
Adding moving segment from base_link to wheel_right_link
[INFO] [joint_states_publisher]: Init joint_states publisher
[INFO] [scan_publisher]: Init scan publisher
[INFO] [tf_publisher]: Init tf publisher
[INFO] [odometry_publisher]: Init Odometry publisher
```

And you can check topic list as shown below

```bash
$ ros2 topic list
/clock
/cmd_vel
/imu
/joint_states
/motor_power
/odom
/parameter_events
/reset
/robot_description
/scan
/scan_half
/sensor_state
/sound
/tf
/tf_static
/time_sync
/version_info
```

### Rviz2

**[Remote PC]** Run Rviz2

```bash
$ ros2 launch turtlebot3_bringup rviz2.launch.py
```

![](/assets/images/platform/turtlebot3/ros2/platform_teleop.png)

## [Teleoperation](#teleoperation) 

**[Remote PC]** Run teleoperation node
```bash
$ ros2 run turtlebot3_teleop teleop_keyboard
```

If the node is successfully run, the following instruction will be appeared to the terminal window.
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

- [Related a document for Cartographer](https://google-cartographer.readthedocs.io/en/latest/)
- [Related a document for Cartographer_ros](https://google-cartographer-ros.readthedocs.io/en/latest/)

The **SLAM (Simultaneous Localization and Mapping)** is a technique to draw a map by estimating current location in an arbitrary space. The SLAM is a well-known feature of TurtleBot from its predecessors. The video here shows you how accurately TurtleBot3 can draw a map with its compact and affordable platform.

**[RemotePC]** Install Cartographer packages
```bash
$ git clone -b crystal https://github.com/ROBOTIS-GIT/cartographer.git
$ git clone -b crystal https://github.com/ROBOTIS-GIT/cartographer_ros.git
```

**[RemotePC]** Install dependent library for cartographer

- [How to install Ceres-Solver](http://ceres-solver.org/installation.html#linux)

```bash
$ cd ~/turtlebot3_ws/src
$ git clone https://github.com/ros2/pcl_conversions
```

```bash
$ sudo apt install liblua5.3-dev
$ sudo apt install google-mock
$ sudo apt install libpcl-dev
```

**[TurtleBot, RemotePC]** Sync time between TurtleBot and RemotePC

```bash
$ sudo apt-get install ntpdate
$ sudo ntpdate ntp.ubuntu.com
```

**[Remote PC]**

```bash
$ cd ~/turtlebot3_ws && colcon build
$ ros2 launch turtlebot3_cartographer cartographer.launch.py
```

![](/assets/images/platform/turtlebot3/ros2/platform_cartographer.png)

<iframe width="560" height="315" src="https://www.youtube.com/embed/wzz54a8ppxI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## [Navigation2](#navigation2)

- [Related a document for Navigation2](https://github.com/ros-planning/navigation2/blob/master/README.md)

**Navigation** is to move the robot from one location to the specified destination in a given environment. For this purpose, a map that contains geometry information of furniture, objects, and walls of the given environment is required. As described in the previous [Cartographer](/docs/en/platform/turtlebot3/ros2/#cartographer) section, the map was created with the distance information obtained by the sensor and the pose information of the robot itself.

The navigation enables a robot to move from the current pose to the designated goal pose on the map by using the map, robot’s encoder, IMU sensor, and distance sensor. The procedure for performing this task is as follows.

### [Run Navigation2 Nodes] 

```bash
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py
```

## [Simulation](#simulation)

### [Install Gazebo9 on Remote PC]
1. Install [Gazebo9 and gazebo_ros_pkgs](http://gazebosim.org/tutorials?tut=ros2_installing&cat=connect_ros)
1. Add **GAZEBO_MODEL_PATH**
    ```bash
    $ echo 'Add gazebo model path' >> ~/.bashrc
    $ echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/turtlebot3_ws/src/turtlebot3_simulations/turtlebot3_gazebo/models' >> ~/.bashrc
    $ source ~/.bashrc
    ```

### [Install TurtleBot3 simulation packages]
```bash
$ mkdir -p ~/turtlebot3_ws/src
$ cd ~/turtlebot3_ws/src
$ git clone -b ros2 https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
$ cd ~/turtlebot3_ws
$ colcon build --symlink-install
```

**[Remote PC]** Load TurtleBot3 on turtlebot3 world
```bash
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

```bash
$ ros2 param set /gazebo use_sim_time True
```

![](/assets/images/platform/turtlebot3/ros2/gazebo_world.png)

**WARNING**: If you got error messages about `TF_OLD_DATA`, you should retry to set `use_sim_time` parameter onto `/gazebo` node.
{: .notice--warning}

**[Remote PC]** Launch Cartographer
```bash
$ ros2 launch turtlebot3_cartographer cartographer.launch.py use_sim_time:=True
```
![](/assets/images/platform/turtlebot3/ros2/gazebo_cartographer.png)

**[Remote PC]** Load Navigation2
```bash
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py
```

You should set some parameters to use simulation time. If you need futher information about it, please following [navigation2 repo](https://github.com/ros-planning/navigation2/tree/master/nav2_bringup)

```bash
$ ros2 param set /world_model use_sim_time True
$ ros2 param set /global_costmap/global_costmap use_sim_time True
$ ros2 param set /local_costmap/local_costmap use_sim_time True
```

![](/assets/images/platform/turtlebot3/ros2/gazebo_navigation2.png)

[ROS Answers]: https://answers.ros.org/questions/
[ROS2 Issue]: https://github.com/ros2/ros2/issues
[How to set sbc for turtlebot3 with ros2]: /docs/en/popup/turtlebot3_ros2_sbc_setting