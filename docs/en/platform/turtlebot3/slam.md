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

**NOTE:** This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

**TIP:** It is recommended to use a joystick pad instead of the keyboard for easier control.
{: .notice--info}

**WARNING:** Make sure to run the [Bringup][Bringup] instruction before performing SLAM.
{: .notice--warning}

The Simultaneous Localization and Mapping, or SLAM, is a technique to draw a map by estimating current location in an arbitrary space.

The SLAM is a well-known feature of TurtleBot from its predecessors. The video here shows you how accurately TurtleBot3 can draw a map with its compact and affordable platform.

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

## [Create a Map with Teleoperation](#create-a-map-with-teleoperation)

**TIP:** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is Ctrl-Alt-T.
{: .notice--info}

**[Remote PC]** Open a new terminal and launch the SLAM file.

**TIP:** TB3_MODEL = `burger`, `waffle`, `waffle_pi` 
{: .notice--info}

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_slam turtlebot3_slam.launch
```

**[Remote PC]** Visualize the model in 3D with RViz.

``` bash
$ rosrun rviz rviz -d `rospack find turtlebot3_slam`/rviz/turtlebot3_slam.rviz
```

**[Remote PC]** Teleoperation with Keyboard

``` bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

## [Save the Map](#save-the-map)

**[Remote PC]** Open a new terminal and run the map saver node.

``` bash
$ rosrun map_server map_saver -f ~/map
```

**map.pgm** and **map.yaml** files will be created in the `~/` ($HOME directory : `/home/<username>`) directory.

[Bringup]: /docs/en/platform/turtlebot3/bringup/