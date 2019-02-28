---
layout: archive
lang: en
ref: turtlebot3_example
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/example/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 10"></div>

# [Example](#example)

**NOTE** : This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{: .notice--info}

**WARNING** : Make sure to run the [Bringup](#bringup) instruction before performing Example.
{: .notice--warning}

**WARNING** : Be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

**Tip :** The example is supposed to be running on the remote PC. **Follow the instruction on your Remote PC**.
{: .notice--info}


<iframe width="560" height="315" src="https://www.youtube.com/embed/Xg1pKFQY5p4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>


## [rqt common plugin](#rqt-common-plugin)
The rqt is a Qt-based framework for GUI development for ROS. The rqt is a tool that allows users to easily see the topic status by displaying all the topics in the topic list. There are topic names, types, bandwidth, Hz, value in GUI

**[Remote PC]** Run the rqt.
``` bash
$ rqt
```
![](/assets/images/platform/turtlebot3/example/rqt_1.png)

**Tip :** If rqt is not displayed, select the `plugin` -> `Topics` -> `Topic Monitors`.
{: .notice--info}

When rqt is first run, the topic values are not monitored. To monitor the topic, click the checkbox next to each topic.

![](/assets/images/platform/turtlebot3/example/rqt_2.png)

If you want to see more detail topic message, click the `▶` button next to each checkbox.

![](/assets/images/platform/turtlebot3/example/rqt_3.png)


- `/battery_state` indicates a message relating to the battery condition, such as the current battery voltage and remaining capacity.

![](/assets/images/platform/turtlebot3/example/rqt_4.png)

- `/diagnostics` indicates a message the status of the components connected to the turtlebot3, such as a MPU9250, a DYNAMIXEL X, a HLS-LFCD-LDS, a battery and a OpenCR.

![](/assets/images/platform/turtlebot3/example/rqt_5.png)

- `/odom` indicates a message the odometry of the turtlebot3. This topic has orientation and position by the encoder data.  

![](/assets/images/platform/turtlebot3/example/rqt_6.png)

- `/sensor_state` indicates a message the encoder values, battery and torque.

![](/assets/images/platform/turtlebot3/example/rqt_7.png)

- `/scan` indicates a message all of the LDS data, such as angle_max and min, range_max and min, indicates, ranges.

![](/assets/images/platform/turtlebot3/example/rqt_8.png)

In addition, you can monitor topics through rqt whenever you have a topic added.

## [Interactive Markers](#interactive-markers)

Turtlebot3 can be moved by interactive markers on RViz. You can move the turtlebot3 to rotate or linear using interactive markers.

**Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is Ctrl-Alt-T.
{: .notice--info}

**[Remote PC]** Open a new terminal and launch the remote file.
If you have TurtleBot3 Burger,

**Tip :** TB3_MODEL = `burger`, `waffle`, `waffle_pi` 
{: .notice--info}

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_bringup turtlebot3_remote.launch
```

**[Remote PC]** launch the interactive markers file.
``` bash
$ roslaunch turtlebot3_example interactive_markers.launch
```

**[Remote PC]** Visualize the model in 3D with RViz.
``` bash
$ rosrun rviz rviz -d `rospack find turtlebot3_example`/rviz/turtlebot3_interactive.rviz
```


## [Obstacle Detection](#obstacle-detection)

Turtlebot3 can be moved or stopped by LDS data. When the turtlebot3 moves, it stops when it detects an obstacle ahead.

**[Remote PC]** Run the obstacle file.
``` bash
$ rosrun turtlebot3_example turtlebot3_obstacle.py
```

## [Point operation](#point-operation)

Turtlebot3 can be moved by 2D point(x,y) and z-angular. For example, if you insert (0.5, 0.3, 60), turtlebot3 moves to point (x = 0.5m, y = 0.3m) and then rotates 60 deg.

**[Remote PC]** launch the pointop file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_pointop_key.launch
```

**[Remote PC]** Type the goal point. (x = 0.5m, y = 0.3m, degree = 60)
``` bash
0.5 0.3 60
```

## [Patrol](#patrol)

Turtlebot3 can be moved by custom routes. There are three routes(square, triangle and circle). This example uses action topic. Action client translates patrol data(mode, area, count) to action server. And then action server translates `cmd_vel` to turtlebot3.

**[Remote PC]** Run the patrol server file.
``` bash
$ rosrun turtlebot3_example turtlebot3_server.py
```

**[Remote PC]** Run the patrol client file.
``` bash
$ rosrun turtlebot3_example turtlebot3_client.py
```

**[Remote PC]** Type the patrol data.(mode = square, area = 0.5m, count = 2)
``` bash
$ s 0.5 2
```
