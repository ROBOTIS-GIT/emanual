---
layout: archive
lang: en
ref: navigation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/navigation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 9"></div>

# [Navigation](#navigation)

**WARNING**: Be careful when running the robot on the table as the robot might fall.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **Remote PC**.
- Make sure to run the [Bringup](/docs/en/platform/turtlebot3/bringup/#bringup) instructions before running the instructions below.
- The navigation uses the a data created in [SLAM](/docs/en/platform/turtlebot3/slam/#slam). Please make sure to have a map data.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

The Navigation locates TurtleBot3 to the calculated position in the map by combining actual sensor data and anticipated position data.

## [Run the Navigation Nodes](#run-the-navigation-nodes)

**[Remote PC]** Launch the navigation file.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

**TIP**: The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
{: .notice--success}

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/map.yaml
```
**[Remote PC]** Before starting the navigation, RViz should be updated with initial location and pose of TurtleBot3. To upate the initial data, follow the instruction below.

- Click the `2D Pose Estimate` button.
- Click on the approxtimate point in the map where the TurtleBot3 is located and drag the cursor to indicate the direction where TurtleBot3 faces.

Every green arrow stands for an expected position of TurtleBot3. The laser scanner will draw approximate figures of wall on the map. If the drawing doesn't show the figures incorrectly, repeat localizing the TurtleBot3 from clicking `2D Pose Estimate` button above.

**[Remote PC]** If TurtleBot3 is localized, it will automatically create the path to the target position. In order to set a goal position, follow the instruction below.

- Click the `2D Nav Goal` button.
- Click on a specific point in the map to set a goal position and drag the cursor to the direction where TurtleBot should be facing at the end.

Setting a goal position might fail if the path to the goal position cannot be created.
If you wish to stop the robot before it reaches to the goal position, set the current position of TurtleBot3 as a goal position.

<iframe width="640" height="360" src="https://www.youtube.com/embed/VYlMywwYALU" frameborder="0" allowfullscreen></iframe>

[Reference doc](http://wiki.ros.org/turtlebot_navigation/Tutorials/Autonomously%20navigate%20in%20a%20known%20map)

[Bringup]: /docs/en/platform/turtlebot3/bringup/
[SLAM]: /docs/en/platform/turtlebot3/slam/
