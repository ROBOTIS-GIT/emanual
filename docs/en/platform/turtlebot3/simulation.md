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

# [Simulation](#simulation)

![](/assets/images/platform/turtlebot3/software/remote_pc_and_turtlebot.png)

<div class="alert alert-warning">
  **Warning :** The contents in this chapter corresponds to the `Remote PC` (your desktop or laptop PC) which will control TurtleBot3. Do **NOT** apply this instruction to your TurtleBot3.
</div>

<div class="alert alert-info">
  **Note :** This instruction was tested on <kbd>Ubuntu 16.04</kbd> and <kbd>ROS Kinetic Kame</kbd>.
</div>

## [TurtleBot3 Fake Node Implementation](#turtlebot3-fake-node-implementation)

<div class="alert alert-info">
  **Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is <kbd>Ctrl</kbd>-<kbd>Alt</kbd>-<kbd>T</kbd>.
</div>

Install dependent packages for TurtleBot3 Simulation.

<div class="alert alert-info">
  **Note :** turtlebot3_simulation package requires **TurtleBot3** (http://turtlebot3.robotis.com/en/latest/pc_software.html#install-dependent-packages) package as a prerequisite.
</div>

``` bash
  cd ~/catkin_ws/src/
  git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
  cd ~/catkin_ws && catkin_make
```

`TurtleBot3 fake node` is a very simple simulation node that can be run without having an actual robot. You can even control the virtual TurtleBot3 in RViz with a teleop node.

``` bash
  export TURTLEBOT3_MODEL=burger
  roslaunch turtlebot3_fake turtlebot3_fake.launch
```

``` bash
  roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/iHXZSLBJHMg" frameborder="0" allowfullscreen></iframe>
</figure>

## [Stage (2D)](#stage-2d)

(TODO)

## [Gazebo (3D)](#gazebo-3d)

<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/xXM5r_SVkWM" frameborder="0" allowfullscreen></iframe>
</figure>

<div class="alert alert-info">
  **Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is <kbd>Ctrl</kbd>-<kbd>Alt</kbd>-<kbd>T</kbd>.
</div>

<div class="alert alert-warning">
  **Warning :** If you are running Gazebo for the first time on your `Remote PC`, it takes a bit longer than usual.
</div>
You should set Turtlebot3 model parameter. Select either burger or waffle for the model parameter in the below command.

``` bash
  export TURTLEBOT3_MODEL=burger
```

Below command will load TurtleBot3 on the default Gazebo environment `TurtleBot3 empty world`.

``` bash
  roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch
```

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_empty_world.png)

If you wish to load more interesting map, please use below command instead of above command.  
`TurtleBot3 world` is a map consists of simple objects that makes up the shape of TurtleBot3 symbol.  
  
``` bash
  export TURTLEBOT3_MODEL=burger
  roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_world_bugger.png)

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_world_waffle.png)

In order to control TurtleBot3 with a keyboard, please launch teleoperation feature with below command in a new terminal window.

``` bash
  roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

In order to run TurtleBot3 simulation that autonomously navigates around the map, open a new terminal window and enter below command.

``` bash
  export TURTLEBOT3_MODEL=burger
  roslaunch turtlebot3_gazebo turtlebot3_simulation.launch
```

RViz visualizes published topics while simulation is running. You can launch RViz in a new terminal window by entering below command.

``` bash
  export TURTLEBOT3_MODEL=burger
  roslaunch turtlebot3_gazebo turtlebot3_gazebo_rviz.launch
```

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_gazebo_rviz.png)
