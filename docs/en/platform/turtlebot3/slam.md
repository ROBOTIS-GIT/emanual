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
- The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
- Make sure to run the [Bringup](/docs/en/platform/turtlebot3/bringup/#bringup) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

{% capture notice_02 %}
{% include en/platform/turtlebot3/ros_book_info.md %}
{% endcapture %}
<div class="notice--success">{{ notice_02 | markdownify }}</div>

**TIP**: It is recommended to use a joystick pad instead of the keyboard for easier control. For more information on remote control, Please refer to [Teleoperation][teleoperation] page.
{: .notice--success}

The **SLAM (Simultaneous Localization and Mapping)** is a technique to draw a map by estimating current location in an arbitrary space. The SLAM is a well-known feature of TurtleBot from its predecessors. The video here shows you how accurately TurtleBot3 can draw a map with its compact and affordable platform.

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

## [Run SLAM Nodes](#run-slam-nodes)

**[Remote PC]** Run roscore.

``` bash
$ roscore
```

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.

``` bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

**[Remote PC]** Open a new terminal and launch the SLAM file.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
```

{% capture slam_tip %}
**TIP**: When you run the above command, the visualization tool RViz is also executed. If you want to run RViz separately, use one of the following commands.

  - $ rviz -d \`rospack find turtlebot3_slam\`/rviz/turtlebot3_gmapping.rviz
  - $ rviz -d \`rospack find turtlebot3_slam\`/rviz/turtlebot3_cartographer.rviz
  - $ rviz -d \`rospack find turtlebot3_slam\`/rviz/turtlebot3_hector.rviz
  - $ rviz -d \`rospack find turtlebot3_slam\`/rviz/turtlebot3_karto.rviz
  - $ rviz -d \`rospack find turtlebot3_slam\`/rviz/turtlebot3_frontier_exploration.rviz

{% endcapture %}

<div class="notice--info">{{ slam_tip | markdownify }}</div>

{% capture notice_03 %}
**NOTE**: Support for various SLAM methods
- TurtleBot3 supports Gmapping, Cartographer, Hector, and Karto among various SLAM methods. You can do this by changing the `slam_methods:=xxxxx` option.
- The `slam_methods` options include `gmapping`, `cartographer`, `hector`, `karto`, `frontier_exploration`, and you can choose one of them.
- For example, to use Karto, you can use the following:
- $ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=karto
{% endcapture %}
<div class="notice--info">{{ notice_03 | markdownify }}</div>

{% capture notice_04 %}
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
<div class="notice--info">{{ notice_04 | markdownify }}</div>

**TIP**: We tested on cartographer version 0.3.0. The Cartographer package developed by Google supports 0.3.0 version in ROS Melodic, but 0.2.0 version in ROS Kinetic. So if you need to work on ROS Kinetic, instead of downloading the binaries files, you should download and build the source code as follows. Please refer to [official wiki page](https://google-cartographer-ros.readthedocs.io/en/latest/#building-installation) for more detailed installation instructions.
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
```

```sh
$ source ~/catkin_ws/install_isolated/setup.bash
$ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=cartographer
```

## [Run Teleoperation Node](#run-teleoperation-node)

**[Remote PC]** Open a new terminal and run the teleoperation node. The following command allows the user to control the robot to perform SLAM operation manually. It is important to avoid vigorous movements such as changing the speed too quickly or rotating too fast. When building a map using the robot, the robot should scan every corner of the environment to be measured. It requires some experiences to build a clean map, so let’s practice SLAM multiple times to build up know how. The mapping process is shown in figure below.

``` bash
$ export TURTLEBOT3_MODEL=%{TB3_MODEL}
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

``` bash
  Control Your TurtleBot3!
  ---------------------------
  Moving around:
          w
     a    s    d
          x

  w/x : increase/decrease linear velocity
  a/d : increase/decrease angular velocity
  space key, s : force stop

  CTRL-C to quit
```

![](/assets/images/platform/turtlebot3/slam/slam_running_for_mapping.png)

## [Tuning Guide](#tuning-guide)

Gmapping has many parameters to change performances for different environments. You can get an information about whole parameters in [ROS WiKi](http://wiki.ros.org/gmapping) or refer chapter 11 in [ROS Robot Programming](https://community.robotsource.org/t/download-the-ros-robot-programming-book-for-free/51) book.

This tuning guide give some tips for you to configue important parameters. If you want to change performances depends on your environments, this tips might be help you and save your time.

_**maxUrange**_ 
- `turtlebot3_slam/launch/turtlebot3_gmapping.launch`
- This param is set the maximum usable range of the lidar sensor.

_**map_update_interval**_
- `turtlebot3_slam/launch/turtlebot3_gmapping.launch`
- How long (in seconds) between updates to the map. If this set low, map would be updated more often. But it requires greater computational load. Set this param depends on your environments.

![](/assets/images/platform/turtlebot3/slam/tuning_map_update_interval.png)

_**minimumScore**_ 
- `turtlebot3_slam/launch/turtlebot3_gmapping.launch`
- Minimum score for considering the result of the scan matching. This param makes avoid jumping pose estimates.
  If this set properly, you can watch below information.

  ```
  Average Scan Matching Score=278.965
  neff= 100
  Registering Scans:Done
  update frame 6
  update ld=2.95935e-05 ad=0.000302522
  Laser Pose= -0.0320253 -5.36882e-06 -3.14142
  ```

  If this set too high, you can watch below warning.

  ```
  Scan Matching Failed, using odometry. Likelihood=0
  lp:-0.0306155 5.75314e-06 -3.14151
  op:-0.0306156 5.90277e-06 -3.14151
  ```

_**linearUpdate**_ 
- `turtlebot3_slam/launch/turtlebot3_gmapping.launch`
- When robot translates, a scan process each time.

_**angularUpdate**_ 
- `turtlebot3_slam/launch/turtlebot3_gmapping.launch`
- When robot rotates, a scan process each time. Setting this to be smaller than linearUpdate is better.

## [Save Map](#save-map)

**[Remote PC]** Now that you have all the work done, let's run the `map_saver` node to create a map file. The map is drawn based on the robot's odometry, tf information, and scan information of the sensor when the robot moves. These data can be seen in the RViz from the previous example video. The created map is saved in the directory in which `map_saver` is runnig. Unless you specify the file name, it is stored as `map.pgm` and `map.yaml` file which contains map information.

``` bash
$ rosrun map_server map_saver -f ~/map
```

The `-f` option refers to the folder and file name where the map file is saved. If `~/map` is used as an option, `map.pgm` and `map.yaml` will be saved in the map folder of user’s home folder `~/` ($HOME directory : `/home/<username>`).

## [Map](#map)

We will use the two-dimensional `Occupancy Grid Map (OGM)`, which is commonly used in the ROS community. The map obtained from the previous [Save Map](#save-map) section as shown in figure below, **white** is the free area in which the robot can move, **black** is the occupied area in which the robot can not move, and **gray** is the unknown area. This map is used in [Navigation][navigation].

![](/assets/images/platform/turtlebot3/slam/map.png)

The figure below shows the result of creating a large map using TurtleBot3. It took about an hour to create a map with a travel distance of about 350 meters.

![](/assets/images/platform/turtlebot3/slam/large_map.png)

[navigation]: /docs/en/platform/turtlebot3/navigation/#navigation
[teleoperation]: /docs/en/platform/turtlebot3/teleoperation/#teleoperation
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model

## [References](#references)

- gmapping
  - [ROS WIKI](http://wiki.ros.org/gmapping), [Github](https://github.com/ros-perception/slam_gmapping)

- cartographer 
  - [ROS WIKI](http://wiki.ros.org/cartographer), [Github](https://github.com/googlecartographer/cartographer)

- hector
  - [ROS WIKI](http://wiki.ros.org/hector_slam), [Github](https://github.com/tu-darmstadt-ros-pkg/hector_slam)

- karto
  - [ROS WIKI](http://wiki.ros.org/slam_karto), [Github](https://github.com/ros-perception/slam_karto)

- frontier_exploration 
  - [ROS WIKI](http://wiki.ros.org/frontier_exploration), [Github](https://github.com/paulbovbel/frontier_exploration)