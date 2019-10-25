---
layout: archive
lang: en
ref: ros_2
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2_navigation2/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 30
---

<div style="counter-reset: h1 18"></div>

# [Navigation2](#navigation2)

**Navigation** is to move a robot from one location to the specified destination in a given environment. For this purpose, a map that contains geometry information of furniture, objects, and walls of the given environment is required. As described in the previous [Cartographer](/docs/en/platform/turtlebot3/ros2/#cartographer) section, the map was created with the distance information obtained by the sensor and the pose information of the robot itself.

**Navigation** enables a robot to move from the current pose to the designated goal pose on the map by using the map, robot’s encoder, IMU sensor, and distance sensor. The procedure for performing this task is as follows.

**Naviagation2 related document** :  
- [Naviagation2](https://github.com/ros-planning/navigation2/blob/master/README.md)

<iframe width="560" height="315" src="https://www.youtube.com/embed/VtyqUuuZAFA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [Run Navigation2 Nodes](#run-navigation2-nodes)

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py map:=$HOME/map.yaml
```

- Click `2D Pose Estimate` button in a menu bar, and then point exact pose of TurtleBot3 on a map.

![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_1.png)
> 2D Pose Estimate

- If TurtleBot3 is close to a costmap or nearby the costmap map, click `Navigation2 Goal` button in a menu bar, and then point goal pose on the map.

![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_2.png)
> Navigation2 Goal
