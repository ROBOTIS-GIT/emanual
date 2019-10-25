---
layout: archive
lang: en
ref: ros_2
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2_slam/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 29
---

<div style="counter-reset: h1 17"></div>

# [SLAM](#slam)

## [Cartographer](#cartographer)
**Cartographe related documents** :
- [Cartographer](https://google-cartographer.readthedocs.io/en/latest/)
- [Cartographer_ros](https://google-cartographer-ros.readthedocs.io/en/latest/)

**WARNING** : Do not proceed to this instruction on SBC in TurtleBot3. Please follow steps with **Remote PC**.
{: .notice--warning}

**SLAM (Simultaneous Localization And Mapping)** is a technique to draw a map by estimating current location in an arbitrary space. The SLAM is a well-known feature of TurtleBot from its predecessors. The video here shows you how accurately TurtleBot3 can draw a map with its compact and affordable platform.

<iframe width="560" height="315" src="https://www.youtube.com/embed/pJNSxDodhDk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### [Run SLAM Nodes](#run-slam-nodes)

```bash
$ ros2 launch turtlebot3_cartographer cartographer.launch.py
```
    
![](/assets/images/platform/turtlebot3/ros2/platform_cartographer.png)

### [Save the Map](#save-the-map)

```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```
