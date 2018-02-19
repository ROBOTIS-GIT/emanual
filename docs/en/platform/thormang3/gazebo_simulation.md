---
layout: archive
lang: en
ref: thormang3_gazebo_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/thormang3/gazebo_simulation/
sidebar:
  title: THORMANG3
  nav: "thormang3"
---
<div style="counter-reset: h1 5"></div>

# [Gazebo Simulation](#gazebo-simulation)

## [Install Gazebo](#install-gazebo)
ROS-Gazebo Package Installation

### Gazebo with ROS
[Gazebo Tutorials]

### Additional Installation
If ros-indigo-desktop-full was used to install, the following packages need to be installed.
```
# apt-get install ros-indigo-ros-control
# apt-get install ros-indigo-ros-controllers
# apt-get install ros-indigo-gazebo-ros-control
```

## [Run Simulation](#run-simulation)

How to set up & execute gazebo simulation

### Recommendation  
If Gazebo is running on the OPC, realtime factor can be decreased, therefore, it is recommended to use a separate PC for Gazebo.

### How to execute  
The command to call THORMANG3 in Gazebo
```
$ roslaunch thormang3_gazebo robotis_world.launch
```

![](/assets/images/platform/thormang3/thormang3_076.png)

### [thormang3_manager] for Gazebo  
- Configure simulation setting in the launch file of the thormang3_manager   
  `<param name="gazebo" value="true" type="bool"/>`   
  `<param name="gazebo_robot_name" value="thormang3"/>`   

- Launch thormang3_manager   

  ```
  $ roslaunch thormang3_manager thormang3_manager.launch
  ```

- Please refer to below tutorials for the rest procedures.   
[How to run THORMANG3's program]

[How to run THORMANG3's program]: /docs/en/platform/thormang3/thormang3_operation/#thormang3-operation/
[Gazebo Tutorials]:http://gazebosim.org/tutorials?cat=connect_ros
