---
layout: archive
lang: en
ref: manipulator_h_ros_example
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/manipulator_h/ros_example/
sidebar:
  title: MANIPULATOR-H
  nav: "manipulator_h"
---

<div style="counter-reset: h1 3"></div>

# [ROS example](#ros-example)

## [Manipulator manager](#manipulator-maneger)

### Overview
* Bring up the robot in Rviz
```
$ roslaunch manipulator_h_bringup robotis_manipulator.launch   
```
* Run manipulator manager
```
$ sudo bash
[sudo] password for robotis:   
# roslaunch manipulator_h_manager manipulator_h_manager.launch   
```

## [GUI program](#gui-program)

### Overview
* Run GUI program
```
$ rosrun manipulator_h_gui manipulator_h_gui
```

### How to operate
1. Click `set mode`   
2. Click `go to initial pose`

### Joint Space Control
1. Change the values in `joint space control` tab
2. Click `send` button`

### Task Space Control
1. Change the values in `task space control` tab
2. Click `send` button

## [Simulation](#simulation)

### Overview
How to execute Gazebo simulation

### Additional installation for Gazebo
[[Gazebo installation|Gazebo installation]]

### How to execute Gazebo
* Load Robotis Manipulator in Gazebo
```
$ roslaunch manipulator_h_gazebo manipulator_h_gazebo.launch   
```

### [manipulator_manager] for Gazebo
* Set up the `manipulator_h_manager.launch` for Gazebo simulation      
```
<param name="gazebo"                   value="false"     type="bool"/>
<param name="gazebo_robot_name"        value="robotis_manipulator_h" />
```

* manipulator_h_manager execution

```
$ roslaunch manipulator_h_manager manipulator_h_manager.launch
```