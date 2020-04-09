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
product_group: turtlebot3
page_number: 18
---

<div style="counter-reset: h1 8"></div>
<div style="counter-reset: h2 2"></div>

<!--[dummy Header 1]>
  <h1 id="basic-operation"><a href="#basic-operation">Basic Operation</a></h1>
<![end dummy Header 1]-->

## [Basic Examples](#basic-examples)

**WARNING**: Make sure to run the [Bringup][bringup] instruction before performing this examples, and be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**:
- This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instruction is supposed to be running on the remote PC. Follow the instruction on your **Remote PC**.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

{% capture notice_02 %}
{% include en/platform/turtlebot3/ros_book_info.md %}
{% endcapture %}
<div class="notice--success">{{ notice_02 | markdownify }}</div>

<iframe width="560" height="315" src="https://www.youtube.com/embed/Xg1pKFQY5p4" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning} 

### [Move using Interactive Markers](#move-using-interactive-markers)

The TurtleBot3 can be moved by [Interactive Markers][interactive_markers] on RViz. You can move the TurtleBot3 to rotate or linear using Interactive Markers.

**[Remote PC]** Open a new terminal and launch the remote file.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`,` waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

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

**[Remote PC]** Launch the obstacle file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_obstacle.launch
```

### [Point Operation](#point-operation)

The TurtleBot3 can be moved by 2D `point (x, y)` and `z-angular`. For example, if you insert (0.5, 0.3, 60), TurtleBot3 moves to point (x = 0.5m, y = 0.3m) and then rotates 60 deg.

**[Remote PC]** launch the pointop file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_pointop_key.launch
```

### [Patrol](#patrol)

The TurtleBot3 can be moved by custom routes. There are three routes(rectangle, triangle and circle). This example uses action topic. Action client translates patrol data(mode, area, count) to action server. And then action server translates `cmd_vel` to TurtleBot3. Please refer to the above [tutorial video][tutorial_video] for more detailed usage.

**[Remote PC]** Launch the patrol server file.
``` bash
$ rosrun turtlebot3_example turtlebot3_server
```
**[Remote PC]** Launch the patrol client file.
``` bash
$ roslaunch turtlebot3_example turtlebot3_client.launch
```

[bringup]: /docs/en/platform/turtlebot3/bringup/#bringup
[interactive_markers]: http://wiki.ros.org/interactive_markers
[tutorial_video]: https://youtu.be/Xg1pKFQY5p4
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
