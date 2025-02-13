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
page_number: 6
---

<style>body {counter-reset: h1 5 !important;}</style>

{::options parse_block_html="true" /}
<section data-id="{{ page.tab_title1 }}" class="tab_contents">

# [Simulation](#simulation)
### Overview
This manual describes how to use simulation tools (Gazebo and Webots) for the ROBOTIS-OP3 robot. Install or download the below required packages. Note that all the below packages need to be installed or downloaded to to use simulation properly. 

### Gazebo 
* [Gazebo Tutorials]   
* [Gazebo Installation]   
*  ※ Before install Gazebo, please check the table of compatible ROS and Gazebo Combinations [here](https://gazebosim.org/docs/harmonic/ros_installation/). 

### Additional Installation for Gazebo
If you are using ros2 jazzy, the following packages need to be installed.
```
$ sudo apt install ros-jazzy-ros2-control
$ sudo apt install ros-jazzy-ros2-controllers
$ sudo apt install ros-jazzy-ros-gz 
$ sudo apt install ros-jazzy-gz-ros2-control
```

### Webots 
[Webots Tutorials]   
[Webots Installation]   

### Additional Installation for Webots
If you are using ros2 jazzy, the following packages need to be installed.
```
$ sudo apt-get install ros-jazzy-webots-ros2
```

### Download Packages
[ROBOTIS OP3 Common]   
[ROBOTIS OP3 Simulations]   


## [Gazebo Simulation](#gazebo-simulation)

### How to execute Gazebo Simulation
USe the below command to call ROBOTIS-OP3 in Gazebo
```
$ ros2 launch op3_gazebo_ros2 robot_sim.launch.py 
```
<!-- the launch file name may be changed later -->

![](/assets/images/platform/op3/op3_gazebo2.png)

### [op3_manager] for Simulation  

* Launch op3_manager for simulation   
```
$ ros2 launch op3_manager op3_simulation.launch.py
```

* Please refer to below tutorials for the rest procedures.   
[OP3 Tutorials]

<!-- not supported in ros2 but want to keep due to possible re-usability
### To improve gazebo simulation

* Change joint gain   
[Controller File]{: .popup}
* Edit physics engine   
[World File]{: .popup}
-->


## [Webots Simulation](#webots-simulation)

### How to execute Webots Simulation
USe the below command to call ROBOTIS-OP3 in Gazebo
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

* Please refer to below tutorials for the rest procedures.   
[OP3 Tutorials]



[Gazebo Tutorials]: https://gazebosim.org/docs/harmonic/getstarted/   
[Gazebo Installation]: https://gazebosim.org/docs/harmonic/install/   
[ROBOTIS OP3 Common]: /docs/en/platform/op3/robotis_ros_packages/#op3-common   
<!-- may need to change op3 simulation link  -->   
[ROBOTIS OP3 Simulations]: https://github.com/ROBOTIS-GIT/ROBOTIS-OP3-Simulations 
[op3_manager]: /docs/en/platform/op3/robotis_ros_packages/#op3-manager     
[OP3 Tutorials]: /docs/en/platform/op3/tutorials/#tutorials   
<!-- not supported in ros2 but want to keep due to possible re-usability
<!-- [Controller File]: /docs/en/popup/position_controller.yaml/   -->
<!-- [World File]: /docs/en/popup/robotis_op3_gazebo_worlds_empty.world/   -->

[Webots Tutorials]: https://cyberbotics.com/doc/guide/tutorials   
[Webots Installation]: https://cyberbotics.com/doc/guide/installation-procedure   

</section>

<section data-id="{{ page.tab_title2 }}" class="tab_contents">
{% include en/platform/op3/simulation_rev2.md %}
</section>
