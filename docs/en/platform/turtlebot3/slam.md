---
layout: archive
lang: en
ref: slam
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/slam/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 8"></div>

# [SLAM](#slam)

**WARNING**: Be careful when running the robot on the table as the robot might fall.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **Remote PC**.
- Make sure to run the [Bringup](/docs/en/platform/turtlebot3/bringup/#bringup) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**TIP**: It is recommended to use a joystick pad instead of the keyboard for easier control. For more information on remote control, Please refer to [Teleoperation][teleoperation] page.
{: .notice--success}

The SLAM (Simultaneous Localization and Mapping) is a technique to draw a map by estimating current location in an arbitrary space. The SLAM is a well-known feature of TurtleBot from its predecessors. The video here shows you how accurately TurtleBot3 can draw a map with its compact and affordable platform.

<iframe width="640" height="360" src="https://www.youtube.com/embed/lkW4-dG2BCY" frameborder="0" allowfullscreen></iframe>

* Date: 2016.11.29
* Robot: TurtleBot3 Burger
* Sensor: Laser Distance Sensor
* Packages: Gmapping / Cartographer
* Place: ROBOTIS Labs & HQ, 15th-floor corridor
* Duration: 55 minutes
* Distance: Total 351 meters

<iframe width="640" height="360" src="https://www.youtube.com/embed/7mEKrT_cKWI" frameborder="0" allowfullscreen></iframe>

* Date: 2017.04.20
* Robot: TurtleBot3 Burger and Waffle
* Sensor: 360 Laser Distance Sensor LDS-01
* Packages: Gmapping
* Place: ROBOTIS HQ Education Room
* Duration: About 4 minutes
* Distance: Total 15 meters

## [Run the SLAM Nodes](#run-the-slam-nodes)

**[Remote PC]** Open a new terminal and launch the SLAM file.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
```

{% capture notice_02 %}
**NOTE**: Support for various SLAM methods
- TurtleBot3 supports Gmapping, Cartographer, Hector, and Karto among various SLAM methods. You can do this by changing the `slam_methods:=xxxxx` option.
- The `slam_methods` options include `gmapping`, `cartographer`, `hector`, `karto`, `frontier_exploration`, and you can choose one of them.
- For example, to use Karto, you can use the following:
- $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=karto
{% endcapture %}
<div class="notice--info">{{ notice_02 | markdownify }}</div>

{% capture notice_03 %}
**NOTE**: Install dependency packages for SLAM packages
- For `Gmapping`:
- Packages related to Gmapping have already been installed on [PC Setup](/docs/en/platform/turtlebot3/pc_setup/#install-dependent-ros-packages) page.
- For `Cartographer`:
- sudo apt-get install ros-kinetic-cartographer ros-kinetic-cartographer-ros ros-kinetic-cartographer-ros-msgs ros-kinetic-cartographer-rviz
- For `Hector Mapping`:
- sudo apt-get install ros-kinetic-hector-mapping
- For `Karto`:
- sudo apt-get install ros-kinetic-slam-karto
- For `Frontier Exploration`:
- Frontier Exploration uses gmapping, and the following packages should be installed.
- sudo apt-get install ros-kinetic-frontier-exploration ros-kinetic-navigation-stage
{% endcapture %}
<div class="notice--info">{{ notice_03 | markdownify }}</div>

**TIP**: The Cartographer package developed by Google supports 0.3.0 version in ROS Melodic, but 0.2.0 version in ROS Kinetic. If you need to work on ROS Kinetic, you should download and build the source code as follows. Please refer to [official wiki page](https://google-cartographer-ros.readthedocs.io/en/latest/#building-installation) for more detailed installation instructions.
{: .notice--success}

```sh
$ sudo apt-get install ninja-build libceres-dev libprotobuf-dev protobuf-compiler libprotoc-dev
$ cd ~/catkin_ws/src
$ git clone https://github.com/googlecartographer/cartographer.git
$ git clone https://github.com/googlecartographer/cartographer_ros.git
$ cd ~/catkin_ws
$ src/cartographer/scripts/install_proto3.sh
$ rm -rf protobuf/
$ rosdep install --from-paths src --ignore-src -r -y --os=ubuntu:xenial
$ catkin_make_isolated --install --use-ninja
$ source ~/catkin_ws/install_isolated/setup.bash
$ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=cartographer
```

## [Run the Teleoperation Node](#run-the-teleoperation-node)

**[Remote PC]** Open a new terminal and run the teleoperation node.

``` bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

## [Save the Map](#save-the-map)

**[Remote PC]** Open a new terminal and run the map saver node.

``` bash
$ rosrun map_server map_saver -f ~/map
```

**map.pgm** and **map.yaml** files will be created in the `~/` ($HOME directory : `/home/<username>`) directory.


[teleoperation]: /docs/en/platform/turtlebot3/teleoperation/#teleoperation
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
