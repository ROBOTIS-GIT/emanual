---
layout: archive
lang: en
ref: ros_2
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2_basic_operation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 28
---

<div style="counter-reset: h1 16"></div>

# [Basic Operation](#basic_operation)

## [Teleoperation](#teleoperation)

### [Keyboard](#keyboard)

1. Run teleoperation node on **remote PC**
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

2. If the node is successfully run, the following instruction will be appeared to the terminal window.  
    ```bash
    Control Your TurtleBot3!
    ---------------------------
    Moving around:
            w
       a    s    d
            x

    w/x : increase/decrease linear velocity (Burger : ~ 0.22, Waffle and Waffle Pi : ~ 0.26)
    a/d : increase/decrease angular velocity (Burger : ~ 2.84, Waffle and Waffle Pi : ~ 1.82)

    space key, s : force stop

    CTRL-C to quit
    ```

### [RC100](#rc100)

### [PS3 Joystick](#ps3-joystick)
Install
```bash
$ sudo pip install ds4drv
```

Run
```bash
$ sudo ds4drv
$ ros2 run joy joy_node
$ ros2 run teleop_twist_joy teleop_node
```

### [XBOX 360 Joystick](#xbox-360-joystick)
Run
```bash
$ ros2 run joy joy_node
$ ros2 run teleop_twist_joy teleop_node
```

## [Basic Examples](#basic-examples)

### [Move using Interactive Markers](#move-using-interactive-markers)

To be added.

### [Obstacle Detection](#obstacle-detection)

The TurtleBot3 can be moved or stopped by LDS data. When the TurtleBot3 moves, it stops when it detects an obstacle nearby.

**[Remote PC]** Run teleop
``` bash
$ ros2 run turtlebot3_teleop teleop_keyboard /cmd_vel:=/raw_cmd_vel
```

**[Remote PC]** Launch the obstacle file.
``` bash
$ ros2 launch turtlebot3_example turtlebot3_obstacle_detection
```

### [Point Operation](#point-operation)

The TurtleBot3 can be moved by 2D `x`, `y` and `theta`. For example, if you input 0.5, 0.3 and 60. TurtleBot3 moves to point (x = 0.5m, y = 0.3m) and then rotates 60deg.

**[Remote PC]** launch the pointop file.
``` bash
$ ros2 run turtlebot3_example turtlebot3_position_control
```

### [Patrol](#patrol)

The TurtleBot3 draws a circle. This example uses action topic. Action client translates patrol data(radius) to action server. And then action server translates `cmd_vel` to TurtleBot3. 

**[Remote PC]** Launch the patrol server file.
``` bash
$ ros2 run turtlebot3_example turtlebot3_patrol_server
```
**[Remote PC]** Launch the patrol client file.
``` bash
$ ros2 run turtlebot3_example turtlebot3_patrol_client
```