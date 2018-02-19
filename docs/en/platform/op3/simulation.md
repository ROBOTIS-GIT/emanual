---
layout: archive
lang: en
ref: op3_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/simulation/
sidebar:
  title: ROBOTIS-OP3
  nav: "op3"
---

<div style="counter-reset: h1 5"></div>

# [Simulation](#simulation)

## [Gazebo Installation](#gazebo-installation)

### Overview
ROS-Gazebo Package Installation

### Gazebo with ROS
[Gazebo Tutorials]

### Download Package
[ROBOTIS OP3 Common]

### Additional Installation
If ros-indigo-desktop-full was used to install, the following packages need to be installed.
```
# apt-get install ros-kinetic-ros-control
# apt-get install ros-kinetic-ros-controllers
# apt-get install ros-kinetic-gazebo-ros-control
```

## [How to execute Gazebo Simulation](#how-to-execute-gazebo-simulation)

### Overview  
How to set up & execute gazebo simulation

### Recommendation  
If Gazebo is running on the OPC, realtime factor can be decreased, therefore, it is recommended to use a separate PC for Gazebo.

### How to execute  
* The command to call ROBOTIS-OP3 in Gazebo
```
$ roslaunch robotis_op3_gazebo robotis_world.launch
```

![](/assets/images/platform/op3/op3_gazebo.png)
### [op3_manager] for Gazebo  

* Launch op3_manager for gazebo   
```
$ roslaunch op3_manager op3_gazebo.launch
```

* Please refer to below tutorials for the rest procedures.   
[OP3 Tutorials]

### To improve gazebo simulation

* Change joint gain   
[Controller File]
* Edit physics engine   
[World File]




[Gazebo Tutorials]: http://gazebosim.org/tutorials?cat=connect_ros
[ROBOTIS OP3 Common]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-common/

[op3_manager]: [op3_manager.md]

[OP3 Tutorials]: /docs/en/platform/op3/tutorials/#tutorials
[Controller File]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Common/blob/master/robotis_op3_gazebo/config/position_controller.yaml
[World File]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Common/blob/master/robotis_op3_gazebo/worlds/empty.world
