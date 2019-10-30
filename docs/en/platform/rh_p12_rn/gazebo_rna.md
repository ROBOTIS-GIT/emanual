---
layout: archive
lang: en
ref: rh_p12_rna_gazebo
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/rh_p12_rna/gazebo/
sidebar:
  title: RH-P12-RN(A)
  nav: "rh_p12_rna"
product_group: rh_p12_rna
page_number: 3
---

<div style="counter-reset: h1 6"></div>

# [Gazebo Simulation](#gazebo-simulation)

## [Gazebo Install](#gazebo-install)
Install ROS-Gazebo package.

### Gazebo with ROS
- Reference : [Gazebo Tutorials](http://gazebosim.org/tutorials?cat=connect_ros)

### Install RH-P12-RN(A) Package
Enter below command in order to download the Gazebo package for RH-P12-RN(A).

```
$ cd catkin_ws/src
$ git clone https://github.com/ROBOTIS-GIT/RH-P12-RN-A
```

### Install Additional Packages
If ROS is installed with ros-kinetic-desktop-full option, additional packages are required.

```
$ sudo apt install ros-kinetic-ros-control
$ sudo apt install ros-kinetic-ros-controllers
$ sudo apt install ros-kinetic-gazebo-ros-control
```

## [Run Simulator](#run-simulator)
How to run Gazebo simulator.

### Recommendation
Since running Gazebo from the controller PC, the realtime factor could be affected, therefore, it is recommended to run Gazebo simulation from different PC.

### How to Operate
Enter below command in order to run RH-P12-RN(A) from Gazebo simulator.

```
$ roslaunch rh_p12_rn_a_gazebo rh_p12_rn_a_gazebo.launch
```

Click the `Play` button from Gazebo.  

![](/assets/images/platform/rh_p12_rn/gazebo_play_button.png)  

In order to control the gripper, use below commands in a new terminal window.  

- Open the grippers

  ```
  $ rostopic pub -1 /rh_p12_rn_a/rh_p12_rn_a_position/command std_msgs/Float64 "data: 0.0"
  ```

- Close the grippers

  ```
  $ rostopic pub -1 /rh_p12_rn_a/rh_p12_rn_a_position/command std_msgs/Float64 "data: 1.1"
  ```
