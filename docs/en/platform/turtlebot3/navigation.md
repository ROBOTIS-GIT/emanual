---
layout: archive
lang: en
ref: turtlebot3_navigation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/navigation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
---

<div style="counter-reset: h1 10"></div>

# [Navigation](#navigation)

**Note :** This instruction was tested on `Ubuntu 16.04` and `ROS Kinetic Kame` version.
{: .notice--info}

**Warning :** Make sure to run the [Bringup](#bringup) instruction before performing Navigation.
{: .notice--warning}

**Warning :** The navigation uses the a data created in [SLAM](#slam). Please make sure to have a map data.
{: .notice--warning}

**Warning :** Be careful when testing the robot on the table as the robot might fall.
{: .notice--warning}

The Navigation locates TurtleBot3 to the calculated position in the map by combining actual sensor data and anticipated position data.


## [Perform Navigation](#perform-navigation)

**Tip :** The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. Shortcut key for terminal is <kbd>Ctrl</kbd>-<kbd>Alt</kbd>-<kbd>T</kbd>.
{: .notice--info}

**[Remote PC]** Launch the navigation file.
If you have TurtleBot3 Burger,

``` bash
  export TURTLEBOT3_MODEL=burger
  roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/map.yaml
```

If you have TurtleBot3 Waffle,

``` bash
  export TURTLEBOT3_MODEL=waffle
  roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/map.yaml
```

**[Remote PC]** Launch the Rviz.

``` bash
  rosrun rviz rviz -d `rospack find turtlebot3_navigation`/rviz/turtlebot3_nav.rviz
```

**[Remote PC]** Before starting the navigation, RViz should be updated with initial location and pose of TurtleBot3. To upate the initial data, follow the instruction below.

- Click the <kbd>2D Pose Estimate</kbd> button.
- Click on the approxtimate point in the map where the TurtleBot3 is located and drag the cursor to indicate the direction where TurtleBot3 faces.

Every green arrow stands for an expected position of TurtleBot3. The laser scanner will draw approximate figures of wall on the map. If the drawing doesn't show the figures incorrectly, repeat localizing the TurtleBot3 from clicking <kbd>2D Pose Estimate</kbd> button above.

**[Remote PC]** If TurtleBot3 is localized, it will automatically create the path to the target position. In order to set a goal position, follow the instruction below.

- Click the <kbd>2D Nav Goal</kbd> button.
- Click on a specific point in the map to set a goal position and drag the cursor to the direction where TurtleBot should be facing at the end.

Setting a goal position might fail if the path to the goal position cannot be created.
If you wish to stop the robot before it reaches to the goal position, set the current position of TurtleBot3 as a goal position.


<figure class="video_container">
  <iframe width="640" height="360" src="https://www.youtube.com/embed/VYlMywwYALU" frameborder="0" allowfullscreen></iframe>
</figure>

Reference doc: http://wiki.ros.org/turtlebot_navigation/Tutorials/Autonomously%20navigate%20in%20a%20known%20map
