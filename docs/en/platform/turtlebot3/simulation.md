---
layout: archive
lang: en
ref: turtlebot3_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/simulation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 13"></div>

# [Simulation](#simulation)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

**Warning :** The contents in this chapter corresponds to the `Remote PC` (your desktop or laptop PC) which will control TurtleBot3. Do **NOT** apply this instruction to your TurtleBot3.
{: .notice--warning}

**Note :** This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

## [TurtleBot3 Fake Node Implementation](#turtlebot3-fake-node-implementation)

**Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--info}

Install dependent packages for TurtleBot3 Simulation.

**Note :** turtlebot3_simulation package requires [**TurtleBot3**](http://turtlebot3.robotis.com/en/latest/pc_software.html#install-dependent-packages) package as a prerequisite.
{: .notice--info}

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
$ cd ~/catkin_ws && catkin_make
```

`TurtleBot3 fake node` is a very simple simulation node that can be run without having an actual robot. You can even control the virtual TurtleBot3 in RViz with a teleop node.

``` bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_fake turtlebot3_fake.launch
```

``` bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

<iframe width="640" height="360" src="https://www.youtube.com/embed/iHXZSLBJHMg" frameborder="0" allowfullscreen></iframe>

## [Stage (2D)](#stage-2d)

(TODO)

## [Gazebo (3D)](#gazebo-3d)

<iframe width="640" height="360" src="https://www.youtube.com/embed/xXM5r_SVkWM" frameborder="0" allowfullscreen></iframe>

### [Gazebo standalone](#gazebo-standalone)

1. Install library for gazebo7 development

``` bash
$ sudo apt-get install libgazebo7-dev
```

1. Add gazebo plugin path

``` bash
$ export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:${turtlebot3_gazebo_plugin}/build
$ export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:${turtlebot3_gazebo_plugin}/models
```

1. Make and Build

``` bash
$ cd ${turtlebot3_gazebo_plugin}/build
$ cmake ..
$ make
```

1. Excute

**Tip :** TB3_MODEL = `burger`, `waffle`, `waffle_pi` 
{: .notice--info}

``` bash
$ cd ${turtlebot3_gazebo_plugin}
$ gazebo worlds/turtlebot3_${TB3_MODEL}.world
```

1. Teleoperation with keyboard

```
w - set linear velocity up 
x - set linear velocity down
d - set angular velocity up
a - set angular velocity down
s - set all velocity to zero
```

1. Topic subscribe command

  - Show all topic

``` bash
$ gz topic -l
```

  - Subscribe scan data

``` bash
$ gz topic -e /gazebo/default/user/turtlebot3_${TB3_MODEL}/lidar/hls_lfcd_lds/scan
```

  - Subscribe image data

  **Waffle**

``` bash
$ gz topic -e /gazebo/default/user/turtlebot3_waffle/image/intel_realsense_r200/image
```

  **Waffle Pi**
``` bash
$ gz topic -e /gazebo/default/user/turtlebot3_waffle_pi/image/raspberry_pi_cam/image
```

1. Excute listener

``` bash
$ cd ${turtlebot3_gazebo_plugin}/build
$ ./lidar_listener ${TB3_MODEL}
```

``` bash
$ cd ${turtlebot3_gazebo_plugin}/build
$ ./image_listener ${TB3_MODEL}
```

- Reference 

  [Gazebo API](http://osrf-distributions.s3.amazonaws.com/gazebo/api/dev/index.html)

  [How to contribute model](http://gazebosim.org/tutorials?tut=model_contrib&cat=build_robot)
  [How to make model](http://gazebosim.org/tutorials?tut=build_model&cat=build_robot)

  [Tutorial for making Hello World plugin](http://gazebosim.org/tutorials?tut=plugins_hello_world&cat=write_plugin)
  [Tutorial for making model plugin](http://gazebosim.org/tutorials?cat=guided_i&tut=guided_i5)
  [Tutorial for making sensor plugin](http://gazebosim.org/tutorials?tut=contact_sensor)

  [Tutorial for topic subscription](http://gazebosim.org/tutorials?tut=topics_subscribed)

  [Example of Wide-Angle Camera](http://gazebosim.org/tutorials?tut=wide_angle_camera&branch=wideanglecamera)

### [Connect ROS](#connect-ros)

**Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
{: .notice--info}

**Warning :** If you are running Gazebo for the first time on your `Remote PC`, it takes a bit longer than usual.
{: .notice--warning}

You should set Turtlebot3 model parameter. Select either burger or waffle for the model parameter in the below command.

**Tip :** TB3_MODEL = `burger`, `waffle`, `waffle_pi` 
{: .notice--info}

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
```

Below command will load TurtleBot3 on the default Gazebo environment `TurtleBot3 empty world`.

``` bash
$ roslaunch turtlebot3_gazebo_ros turtlebot3_empty_world.launch
```

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_empty_world.png)

If you wish to load more interesting map, please use below command instead of above command.  
`TurtleBot3 world` is a map consists of simple objects that makes up the shape of TurtleBot3 symbol.  
  
``` bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_gazebo_ros turtlebot3_world.launch
```

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_world_bugger.png)

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_world_waffle.png)

In order to control TurtleBot3 with a keyboard, please launch teleoperation feature with below command in a new terminal window.

``` bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

In order to run TurtleBot3 simulation that autonomously navigates around the map, open a new terminal window and enter below command.

``` bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_gazebo_ros turtlebot3_simulation.launch
```

RViz visualizes published topics while simulation is running. You can launch RViz in a new terminal window by entering below command.

``` bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_gazebo_ros turtlebot3_gazebo_rviz.launch
```

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_gazebo_rviz.png)
