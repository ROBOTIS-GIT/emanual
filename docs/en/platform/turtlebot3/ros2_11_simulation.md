---
layout: archive
lang: en
ref: ros_2
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2_simulation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 31
---

<div style="counter-reset: h1 19"></div>

# [Simulation](#simulation)

**WARNING** : Do not proceed to this instruction on SBC in TurtleBot3. Please follow steps with **Remote PC**.
{: .notice--warning}

1. Add GAZEBO_MODEL_PATH.
```bash
$ echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models' >> ~/.bashrc
$ source ~/.bashrc
```
    **NOTE**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
    {: .notice}

1. Load TurtleBot3 on TurtleBot3 world.
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```
    ![](/assets/images/platform/turtlebot3/ros2/gazebo_world.png)

3. Launch Cartographer.
```bash
$ ros2 launch turtlebot3_cartographer cartographer.launch.py use_sim_time:=True
```

4. Run teleoperation node.
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

5. Save the map.
```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```
    ![](/assets/images/platform/turtlebot3/ros2/gazebo_cartographer.png)

**NOTE** :
You should set some parameters to use simulation time.
If you need futher information about it, go on [navigation2 repo](https://github.com/ros-planning/navigation2/tree/master/nav2_bringup)
{: .notice--info}

6.Export the model of TurtleBot3, then launch Navigation2 with following commands.
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=$HOME/map.yaml
```
**NOTE**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice}

- Click `2D Pose Estimate` button in a menu bar, and then point exact pose of turtlebot3 on a map.
- If TurtleBot3 is close to a costmap or nearby the map, click `Navigation2 Goal` button in a menu bar, and then point goal pose on the map.

![](/assets/images/platform/turtlebot3/ros2/gazebo_navigation2.png)
