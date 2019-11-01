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

{% capture notice_01 %}
**NOTE**:
- This instructions were tested on `Ubuntu 18.04` and `ROS 2 Dashing Diatamata`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **Remote PC**.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

{% capture notice_02 %}
{% include en/platform/turtlebot3/ros_book_info.md %}
{% endcapture %}
<div class="notice--success">{{ notice_02 | markdownify }}</div>

TurtleBot3 supports development environment that can be programmed and developed with a virtual robot in the simulation. There are two development environments to do this, one is using fake node and 3D visualization tool RViz and the other is using the 3D robot simulator Gazebo.

The fake node method is suitable for testing with the robot model and movement, but it can not use sensors. If you need to test SLAM and Navigation, we recommend using Gazebo, which can use sensors such as IMU, LDS, and camera in the simulation.

## [TurtleBot3 Simulation using Fake Node](#turtlebot3-simulation-using-fake-node)

To launch the virtual robot, execute the `turtlebot3_fake_node.launch.py` file in the `turtlebot3_fake_node` package as shown below. The `turtlebot3_fake_node` is a very simple simulation node that can be run without having an actual robot. You can even control the virtual TurtleBot3 in RViz with a teleoperation node.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_fake_node turtlebot3_fake_node.launch.py
```

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

## [TurtleBot3 Simulation using Gazebo](#turtlebot3-simulation-using-gazebo)

There are two ways to simulate using Gazebo. first method is to use with ROS through `turtlebot3_gazebo` package and second method is to use only gazebo and `turtlebot3_gazebo_plugin` plugin without using ROS.

**WARNING** : Do not proceed to this instruction on SBC in TurtleBot3. Please follow steps with **Remote PC**.
{: .notice--warning}

### [ROS packages for Gazebo](#ros-packages-for-gazebo)

Add GAZEBO_MODEL_PATH.

```bash
$ echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models' >> ~/.bashrc
$ source ~/.bashrc
```
**NOTE**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice}

#### [Simulate in Various World](#simulate-in-various-world)

##### 1) Empty World

The following command can be used to test the virtual TurtleBot3 on the `empty world` of the gazebo default environment.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo empty_world.launch.py
```

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_empty_world.png)

2. Load TurtleBot3 on TurtleBot3 world.

##### 2) TurtleBot3 World

`TurtleBot3 world` is a map consists of simple objects that makes up the shape of TurtleBot3 symbol. TurtleBot3 world is mainly used for testing such as SLAM and Navigation.
 
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

![](/assets/images/platform/turtlebot3/ros2/gazebo_world.png)

##### 3) TurtleBot3 House

`TurtleBot3 House` is a map made with house drawings. It is suitable for testing related to more complex task performance.

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_house.launch.py
```

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_house.png)

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_house1.png)

#### [Drive TurtleBot3](#drive-turtlebot3)

##### 1) Teleoperation on Gazebo

In order to control a TurtleBot3 with a keyboard, please launch teleoperation feature with below command in a new terminal window.

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

##### 2) Collision Avoidance

In order to autonomously drive a TurtleBot3 around the **TurtleBot3 world**, open a new terminal window and enter below command.

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

Open a new terminal window and enter below command.

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_gazebo turtlebot3_drive
```

#### [Execute RViz](#execute-rviz)

RViz visualizes published topics while simulation is running. You can launch RViz in a new terminal window by entering below command.

``` bash
$ ros2 launch turtlebot3_bringup rviz2.launch.py
``` 

#### [Virtual SLAM with TurtleBot3](#virtual-slam-with-turtlebot3)

For virtual SLAM in Gazebo, instead of running the actual robot, you can select the various environments and robot models mentioned above, and the SLAM-related commands will use the ROS packages used in the [SLAM][slam] section.

##### Virtual SLAM Execution Procedure

The following commands are examples of using the TurtleBot3 Waffle Pi model and the turtlebot3_world environment.

- Launch Gazebo

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

- Launch Cartographer SLAM

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_cartographer cartographer.launch.py use_sim_time:=True
```

- Remotely Control TurtleBot3

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

- Save the Map

```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```

When you run the dependent packages and move the robot in virtual space and create a map as shown below, you can create a map as shown in figure below.

![](/assets/images/platform/turtlebot3/ros2/gazebo_cartographer.png)

#### [Virtual Navigation with TurtleBot3](#virtual-navigation-with-turtlebot3)

**NOTE** :
You should set some parameters to use simulation time.
If you need futher information about it, go on [navigation2 repo](https://github.com/ros-planning/navigation2/tree/master/nav2_bringup)
{: .notice--info}

For virtual Navigation in Gazebo, instead of running the actual robot, you can select the various environments and robot models mentioned above, and the Navigation-related commands will use the ROS packages used in the [Navigation][navigation] section.

##### Virtual Navigation Execution Procedure

Terminate all applications that were executed during the virtual SLAM practice and execute
related packages in the following instruction, the robot will appear on the previously generated map. After setting the initial position of the robot on the map, set the destination to run the navigation as shown in figure below. The initial position only needs to be set once.

- Execute Gazebo

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

- Execute Navigation

```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=$HOME/map.yaml
```
**NOTE**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice}

- Click `2D Pose Estimate` button in a menu bar, and then point exact pose of turtlebot3 on a map.
- If TurtleBot3 is close to a costmap or nearby the map, click `Navigation2 Goal` button in a menu bar, and then point goal pose on the map.

![](/assets/images/platform/turtlebot3/ros2/gazebo_navigation2.png)
