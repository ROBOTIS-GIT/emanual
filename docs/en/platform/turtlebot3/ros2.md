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
product_group: turtlebot3
page_number: 26
---

<div style="counter-reset: h1 14"></div>

# [ROS2](#ros2)

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 18.04` and `ROS2 Dashing Diademata`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **[Remote PC]**. However, the part marked **[TurtleBot]** is the content that runs on SBC of TurtleBot3.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

This chapter shows some demos using TurtleBot3 with **ROS2** and **Gazebo9**. In order to implement these demos, you have to install some packages.

<!-- **NOTE**: This application must be set ROS2 firmware version `1.0.0` or higher and must be used only `ROS2` not ROS.
{: .notice--info} -->

## [Setup](#setup)

### [PC setup](#pc-setup)

**NOTE**: All demos have been tested in `Ubuntu 18.04` installed `ROS2 Dashing Diademata`.
If you got stuck during installation, please following [ROS Answers][ROS Answers].
{: .notice--info}

#### Install Ubuntu on Remote PC
- [Ubuntu 18.04](http://releases.ubuntu.com/18.04/)

#### Install ROS2 on Remote PC
- [ROS2 Installation](https://index.ros.org/doc/ros2/Installation/Dashing/)

#### Install TurtleBot3 ROS2 Packages
**[Remote PC]** Download turtlebot3 packages and install some dependencies for ROS2

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
# Install Navigation2 dependencies
$ sudo apt install -y \
    libsdl-image1.2 \
    libsdl-image1.2-dev \
    libsdl1.2debian \
    libsdl1.2-dev \
    ros-dashing-test-msgs \
    ros-dashing-tf2-sensor-msgs
# Install vcstool
$ sudo apt install python3-vcstool
```

```bash
$ mkdir -p ~/turtlebot3_ws/src
$ cd ~/turtlebot3_ws
$ wget https://raw.githubusercontent.com/ROBOTIS-GIT/turtlebot3/ros2/turtlebot3.repos
$ vcs import src < turtlebot3.repos
$ colcon build --symlink-install
```

```bash
$ echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
$ source ~/.bashrc
```

{% capture notice_02 %}
**NOTE**: 
If you get any build errors or warnings from dependencies, please refer to below documents.
- [Related a document for Cartographer](https://google-cartographer.readthedocs.io/en/latest/)
- [Related a document for Cartographer_ros](https://google-cartographer-ros.readthedocs.io/en/latest/)
- [Related a document for Navigation2](https://github.com/ros-planning/navigation2/blob/master/README.md)
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify }}</div>

### [SBC setup](#sbc-setup)

**[TurtleBot]** Install Raspbian Stretch

1. Download [Raspbian Stretch with desktop and recommended software](https://www.raspberrypi.org/downloads/raspbian/)
1. Unzip the download file and burn image to your microSD card(>8GB)
1. The following instructions show how to set sbc directly without burning the image.

```bash
$ export ROS2_DISTRO=dashing    #distro you want
$ cd && wget https://github.com/ROBOTIS-GIT/turtlebot3/raw/ros2/turtlebot3_sbc_settings/$ROS2_DISTRO/tb3_sbc_settings.tar.bz2
$ tar -xjf tb3_sbc_settings.tar.bz2
$ cd tb3_sbc_settings
$ ./install.sh
```
If the installation is completed normally, the message "Complete!" Is displayed.

{% capture notice_03 %}
**NOTE**: 
This instruction only supports a specific version of ROS2.
You can modify the script(.sh) to suit your tastes. But we do not have a guarantee for this.

Most of the errors are due to the dependency of each software.
Therefore, if you need detailed information on interdependency, please refer to the following documents.
- [Related a document for ROS2](https://index.ros.org/doc/ros2/Releases/#distribution-details)
- [Related a document for FastRTPS](https://github.com/ros2/rmw_fastrtps)
- [Related a document for Micro-XRCE-DDS](https://github.com/eProsima/Micro-XRCE-DDS)
- [Related a document for ros2arduino](https://github.com/ROBOTIS-GIT/ros2arduino)
- [Related a document for TurtleBot3 ros2 packages](https://github.com/ROBOTIS-GIT/turtlebot3/tree/ros2)
{% endcapture %}
<div class="notice--info">{{ notice_03 | markdownify }}</div>

### [OpenCR setup](#opencr-setup)

**[TurtleBot]** Upload firmware for ROS2.

```bash
$ export OPENCR_PORT=/dev/ttyACM0   #OpenCR port
$ export OPENCR_MODEL=burger        #tb3 model you want
$ cd ~/tb3_sbc_settings && ./opencr_fw_update.sh ${OPENCR_PORT} ${OPENCR_MODEL}
```
If uploading the firmware succeeds, some message will be displayed in the terminal like below.

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

{% capture notice_04 %}
**NOTE**: 
This is also possible through the following instructions.

```bash
$ export ROS2_DISTRO=dashing        #distro you want
$ rm -rf opencr_update.tar.bz2
$ wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS2/$ROS2_DISTRO/opencr_update.tar.bz2
$ tar -xjf ./opencr_update.tar.bz2
$ cd opencr_update
$ export OPENCR_PORT=/dev/ttyACM0   #OpenCR port
$ export OPENCR_MODEL=burger        #tb3 model you want
$ ./update.sh $OPENCR_PORT $OPENCR_MODEL
```
{% endcapture %}
<div class="notice--info">{{ notice_04 | markdownify }}</div>

**[TurtleBot]** Reset OpenCR using `RESET` button.
    
![](/assets/images/parts/controller/opencr10/bootloader_19.png)

## [Bringup](#bringup)

### Bringup TurtleBot3
**[TurtleBot], [RemotePC]** Sync time between TurtleBot and RemotePC

```bash
$ sudo apt-get install ntpdate
$ sudo ntpdate ntp.ubuntu.com
```

**[TurtleBot]** Run two Micro-XRCE-DDS Agent for OpenCR and Lidar, and run Lidar Micro-XRCE-DDS Client

```bash
$ cd ~/tb3_sbc_settings && ./run.sh
```

If it is executed normally, the following screen will be displayed. This script is also included, so please read it carefully.

```bash
pi@raspberrypi:~/turtlebot3_sbc_setting $ ./run.sh 
bash: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)

########################################################################
Run two Agent and one Client for LDS & OpenCR
########################################################################
nohup: nohup: appending output to 'nohup.out'
ignoring input and appending output to 'nohup.out'
nohup: ignoring input and appending output to 'nohup.out'

Two MicroXRCEAgents and one MicroXRCEClient listed below are running in the background.
 - MicroXRCEAgent #for lidar using UDP
 - MicroXRCEAgent #for OpenCR using Serial
 - turtlebot3_lidar_xrce_client #MicroXRCE client application for publishing lidar data
Please refer to the note below to check its execution status or to terminate it.

========== NOTE ==========
This script uses the nohup command to run multiple processes in the background.
Therefore, to terminate these processes, use the kill command like below

 use 'ps | grep "MicroXRCEAgent"' command for checking process ID
 kill [PID number]

Also, logs running in the background are stored in nohup.out in the current folder where this command was executed.
==========================

pi@raspberrypi:~/turtlebot3_sbc_setting $ 
```

**[Remote PC]** Launch robot include robot_state_publisher and turtlebot3_node

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_bringup robot.launch.py
```

If the node is successfully launched, the following instruction will be appeared to the terminal window.
```bash
[INFO] [launch]: process[robot_state_publisher-1]: started with pid [24824]
[INFO] [launch]: process[turtlebot3_ros-2]: started with pid [24825]
Initialize urdf model from file: /home/ost/turtlebot3_ws/install/turtlebot3_description/share/turtlebot3_description/urdf/turtlebot3_burger.urdf
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
[INFO] [turtlebot3_node]: Init TurtleBot3 Node Main
Adding fixed segment from base_footprint to base_link
Adding fixed segment from base_link to caster_back_link
Adding fixed segment from base_link to imu_link
Adding fixed segment from base_link to base_scan
Adding moving segment from base_link to wheel_left_link
Adding moving segment from base_link to wheel_right_link
```

And you can check topic list as shown below

```bash
$ ros2 topic list
/cmd_vel
/imu
/joint_states
/motor_power
/odom
/parameter_events
/reset
/robot_description
/rosout
/scan
/sensor_state
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
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
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

The **SLAM (Simultaneous Localization And Mapping)** is a technique to draw a map by estimating current location in an arbitrary space. The SLAM is a well-known feature of TurtleBot from its predecessors. The video here shows you how accurately TurtleBot3 can draw a map with its compact and affordable platform.

**[TurtleBot], [RemotePC]** Sync time between TurtleBot and RemotePC

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

**[Remote PC]** Save the map

```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/wzz54a8ppxI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

## [Navigation2](#navigation2)

- [Related a document for Navigation2](https://github.com/ros-planning/navigation2/blob/master/README.md)

**Navigation** is to move the robot from one location to the specified destination in a given environment. For this purpose, a map that contains geometry information of furniture, objects, and walls of the given environment is required. As described in the previous [Cartographer](/docs/en/platform/turtlebot3/ros2/#cartographer) section, the map was created with the distance information obtained by the sensor and the pose information of the robot itself.

The navigation enables a robot to move from the current pose to the designated goal pose on the map by using the map, robot’s encoder, IMU sensor, and distance sensor. The procedure for performing this task is as follows.

### [Run Navigation2 Nodes] 

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py
```

## [Simulation](#simulation)

**[Remote PC]** Add **GAZEBO_MODEL_PATH**
  ```bash
  $ echo '# Add gazebo model path' >> ~/.bashrc
  $ echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models' >> ~/.bashrc
  $ source ~/.bashrc
  ```
**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

**[Remote PC]** Load TurtleBot3 on turtlebot3 world
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
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

**[Remote PC]** Run teleoperation node
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

**[Remote PC]** Save the map

```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```

![](/assets/images/platform/turtlebot3/ros2/gazebo_cartographer.png)

<iframe width="560" height="315" src="https://www.youtube.com/embed/PUr9k8CRNE0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

**[Remote PC]** Load Navigation2
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py
```

You should set some parameters to use simulation time. If you need futher information about it, please following [navigation2 repo](https://github.com/ros-planning/navigation2/tree/master/nav2_bringup)

```bash
$ ros2 param set /world_model use_sim_time True
$ ros2 param set /global_costmap/global_costmap use_sim_time True
$ ros2 param set /local_costmap/local_costmap use_sim_time True
```

![](/assets/images/platform/turtlebot3/ros2/gazebo_navigation2.png)

<iframe width="560" height="315" src="https://www.youtube.com/embed/aQh8JqSrmCs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[ROS Answers]: https://answers.ros.org/questions/
[ROS2 Issue]: https://github.com/ros2/ros2/issues
[How to set sbc for turtlebot3 with ros2]: /docs/en/popup/turtlebot3_ros2_sbc_setting
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
