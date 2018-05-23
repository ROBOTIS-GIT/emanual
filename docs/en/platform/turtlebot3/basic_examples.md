---
layout: archive
lang: en
ref: basic_examples
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/basic_examples/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 8"></div>
<div style="counter-reset: h2 2"></div>

## [Basic Examples](#basic-examples)

{% capture notice_01 %}
**NOTE**: 
- This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This examples are supposed to be running on the remote PC. Follow the instruction on your **Remote PC**.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**WARNING**: Make sure to run the [Bringup][bringup] instruction before performing this examples, and be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

<iframe width="560" height="315" src="https://www.youtube.com/embed/Xg1pKFQY5p4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

### [Move using Interactive Markers](#move-using-interactive-markers)

The TurtleBot3 can be moved by [Interactive Markers][interactive_markers] on RViz. You can move the TurtleBot3 to rotate or linear using Interactive Markers.

**[Remote PC]** Open a new terminal and launch the remote file. Before executing this command, you have to specify the model name of TurtleBot3. `${TB3_MODEL}` is the name of the model you are using in `burger`,` waffle`, or `waffle_pi`.

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is `Ctrl`-`Alt`-`T`.
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

### [Obstacle Detection](#obstacle-detection)

The TurtleBot3 can be moved or stopped by LDS data. When the TurtleBot3 moves, it stops when it detects an obstacle ahead.

**[Remote PC]** Run the obstacle file.
``` bash
$ rosrun turtlebot3_example turtlebot3_obstacle.py
```

### [Point Operation](#point-operation)

The TurtleBot3 can be moved by 2D `point (x, y)` and `z-angular`. For example, if you insert (0.5, 0.3, 60), TurtleBot3 moves to point (x = 0.5m, y = 0.3m) and then rotates 60 deg.

**[Remote PC]** launch the pointop file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_pointop_key.launch
```

### [Patrol](#patrol)

The TurtleBot3 can be moved by custom routes. There are three routes(rectangle, triangle and circle). This example uses action topic. Action client translates patrol data(mode, area, count) to action server. And then action server translates `cmd_vel` to TurtleBot3. Please refer to the above [tutorial video][tutorial_video] for more detailed usage.

**[Remote PC]** Run the patrol server file.
``` bash
$ rosrun turtlebot3_example turtlebot3_server.py
```
**[Remote PC]** Run the patrol client file.
``` bash
$ rosrun turtlebot3_example turtlebot3_client.py
```

[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[interactive_markers]: http://wiki.ros.org/interactive_markers
[tutorial_video]: https://youtu.be/Xg1pKFQY5p4
