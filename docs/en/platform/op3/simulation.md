---
layout: archive
lang: en
ref: op3_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/op3/simulation/
tabs: "Revision"
tab_title1: "2025 ~"
tab_title2: "~ 2023"
sidebar:
  title: ROBOTIS OP3
  nav: "op3"
product_group: op3
page_number: 7
---

<style>body {counter-reset: h1 6 !important;}</style>

{::options parse_block_html="true" /}
<section data-id="{{ page.tab_title1 }}" class="tab_contents">

# [Simulation](#simulation)

## Overview
This manual page will describe how to use the Gazebo and Webots simulation environments with the ROBOTIS-OP3 robot. Install the required packages below to begin. Note that all required packages must be installed to to use simulation properly. 

## [Gazebo Installation](#gazebo-installation)

### Gazebo 
* [Gazebo Tutorials]   
* [Gazebo Installation]   

  **CAUTION** : Before installing Gazebo, please reference this [table of compatible ROS and Gazebo Combinations to verify your configuration is supported](https://gazebosim.org/docs/harmonic/ros_installation/).  
  {: .notice--warning}

### Additional Packages for Gazebo
To use the Gazebo simulation environment you'll need to install the following packages:
* [ROS2 Control](https://control.ros.org/rolling/index.html)
* [ROS2 Controllers](https://control.ros.org/rolling/doc/ros2_controllers/doc/controllers_index.html)
* [ROS GZ](https://github.com/gazebosim/ros_gz)
* [GZ ROS2 Control](https://github.com/ros-controls/gz_ros2_control)

If you are using ROS2 jazzy, the following commands will install the required packages.
```
$ sudo apt install ros-jazzy-ros2-control
$ sudo apt install ros-jazzy-ros2-controllers
$ sudo apt install ros-jazzy-ros-gz 
$ sudo apt install ros-jazzy-gz-ros2-control
```

## [Webots Installation](#webots-installation)

## Webots 
* [Webots Tutorials]   
* [Webots Installation]   

### Additional Installation for Webots
To use the Gazebo simulation environment you'll need to install the following packages:
* [Webots ROS2](https://github.com/cyberbotics/webots_ros2)
If you are using ROS2 jazzy, the following commands will install the required packages.
```
$ sudo apt-get install ros-jazzy-webots-ros2
```

### Download Packages  
* [ROBOTIS OP3 Common]   
* [ROBOTIS OP3 Simulations]   


## [How to execute Gazebo Simulation](#how-to-execute-gazebo-simulation)

### How to Execute
Use the command below to launch the ROBOTIS-OP3 Gazebo simulation.
```
$ ros2 launch op3_gazebo_ros2 robot_sim.launch.py 
```
<!-- the launch file name may change later -->

![](/assets/images/platform/op3/op3_gazebo2.png)

### [op3_manager] for Simulation  

* Launch op3_manager for simulation   
```
$ ros2 launch op3_manager op3_simulation.launch.py
```

* Please refer to the tutorials below for the additional simulation and control procedures.   
[OP3 Tutorials]

<!-- not supported in ros2 but want to keep due to possible re-usability
### To improve gazebo simulation

* Change joint gain   
[Controller File]{: .popup}
* Edit physics engine   
[World File]{: .popup}
-->

## [How to execute Webots Simulation](#how-to-execute-webots-simulation)

### How to execute
Use the command below to launch the ROBOTIS-OP3 in Webots
```
$ ros2 launch op3_webots_ros2 robot_launch.py 
```
<!-- the launch file name may be changed later -->

![](/assets/images/platform/op3/op3_webots.png)

### [op3_manager] for Simulation  

* Launch op3_manager for simulation   
```
$ ros2 launch op3_manager op3_simulation.launch.py
```

* Please refer to the tutorials below for additional simulation procedures.
[OP3 Tutorials]



[ROBOTIS OP3 Common]: /docs/en/platform/op3/robotis_ros_packages/#robotis-op3-common
[op3_manager]: /docs/en/platform/op3/robotis_ros_packages/#op3-manager
[OP3 Tutorials]: /docs/en/platform/op3/tutorials/#tutorials

[Gazebo Tutorials]: https://gazebosim.org/docs/harmonic/getstarted/   
[Gazebo Installation]: https://gazebosim.org/docs/harmonic/install/   
<!-- may need to change op3 simulation link  -->   
[ROBOTIS OP3 Simulations]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Simulations 
<!-- not supported in ros2 but want to keep due to possible re-usability
<!-- [Controller File]: /docs/en/popup/position_controller.yaml/   -->
<!-- [World File]: /docs/en/popup/robotis_op3_gazebo_worlds_empty.world/   -->

[Webots Tutorials]: https://cyberbotics.com/doc/guide/tutorials   
[Webots Installation]: https://cyberbotics.com/doc/guide/installation-procedure   

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/op3/simulation_rev2.md %}
</section>
