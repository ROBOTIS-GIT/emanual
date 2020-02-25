---
layout: archive
lang: en
ref: ros2_simulation
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2_simulation/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 32
---

<div style="counter-reset: h1 20"></div>

# [[ROS 2] Simulation](#ros-2-simulation)

{% capture notice_02 %}
{% include en/platform/turtlebot3/ros_book_info.md %}
{% endcapture %}
<div class="notice--success">{{ notice_02 | markdownify }}</div>

{% capture notice_01 %}
**NOTE**: This instructions were tested on `Ubuntu 18.04` and `ROS Dashing Diademata`.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

TurtleBot3 supports a development enviroment which can be programed and developed with a virtual robot in the simulation 

There are two development enviroments: **Fake Node** and **Gazebo**. 

**Fake Node**:
- You can use Fake Node and RViz that is 3D visualization tool.
- It is used for testing a model of TurtleBot3 and movement of the robot
- It does not support using sensor data, so that **SLAM** and **Navigation** is not supported.

**Gazebo**:
- Gazebo allows Turtlebot3 to use virtual sensor data in simulator: IMU, LDS, and camera information. 
- Use Gazabo to simulate TurtleBot3 with **SLAM** or **Navigation**.

## [TurtleBot3 Simulation using Fake Node](#turtlebot3-simulation-using-fake-node)

To use a virtual TurtleBot3, execute `turtlebot3_fake_node.launch.py` in a `turtlebot3_fake_node` package that is simple simulation node.
Follow the instructions to bring TurtleBot3 into the virtual world using Fake Node.

1. Execute `turtlebot3_fake_node.launch.py` file
  ``` bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ ros2 launch turtlebot3_fake_node turtlebot3_fake_node.launch.py
  ```

    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

    - You can control the virtual TurtleBot3 by using [Teleoperation](/docs/en/platform/turtlebot3/ros2_basic_operation/#basic_operation/#teleoperation)
      ``` bash
      $ export TURTLEBOT3_MODEL=${TB3_MODEL}
      $ ros2 run turtlebot3_teleop teleop_keyboard
      ```

## [TurtleBot3 Simulation using Gazebo](#turtlebot3-simulation-using-gazebo)

In order to use Gazebo, choose either of two options:

1. Use `turtlebot3_gazebo` package via ROS. 
2. Use `turtlebot3_gazebo_plugin` plugin without running ROS.  

### [ROS packages for Gazebo](#ros-packages-for-gazebo)

Add GAZEBO_MODEL_PATH.

```bash
$ echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/turtlebot3_ws/src/turtlebot3/turtlebot3_simulations/turtlebot3_gazebo/models' >> ~/.bashrc
$ source ~/.bashrc
```
**NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
{: .notice--info}

#### [Simulate in Various World](#simulate-in-various-world)

##### 1) Empty World

Test the virtual TurtleBot3 on the `empty world` of the gazebo default environment.

1. Open a terminal on **Remote PC**
2. Bring Empty World using the following command.
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo empty_world.launch.py
```
  
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

    ![](/assets/images/platform/turtlebot3/simulation/turtlebot3_empty_world.png)

2. Load TurtleBot3 on TurtleBot3 world.

##### 2) TurtleBot3 World

`TurtleBot3 world` is a map consists of simple objects that makes up the shape of TurtleBot3 symbol. TurtleBot3 world is mainly used for testing such as SLAM and Navigation.
 
1. Open a terminal on **Remote PC**
2. Bring Empty World using the following command.
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```
    
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}
    
    ![](/assets/images/platform/turtlebot3/ros2/gazebo_world.png)

##### 3) TurtleBot3 House

`TurtleBot3 House` is a map made with house drawings. It is suitable for testing related to more complex task performance.

1. Open a terminal on **Remote PC**
2. Bring TurtleBot3 House using the following command.
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_house.launch.py
```
    
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}
    
    ![](/assets/images/platform/turtlebot3/simulation/turtlebot3_house.png)

    ![](/assets/images/platform/turtlebot3/simulation/turtlebot3_house1.png)

#### [Drive TurtleBot3](#drive-turtlebot3)

##### 1) Teleoperation on Gazebo

In order to control TurtleBot3 using a keyboard, launch a teleoperation node.

1. Open a terminal on **Remote PC**
2. Run teleoperation node.
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

##### 2) Collision Avoidance

In order to autonomously drive a TurtleBot3 around the **TurtleBot3 world**, open a terminal window and enter below command.

1. Open a terminal on **Remote PC**
2. Bring Empty World.
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

3. Open a new terminal on **Remote PC**
4. Run the command below.
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_gazebo turtlebot3_drive
```
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

#### [Execute RViz2](#execute-rviz2)

RViz visualizes published topics while simulation is running. Launch RViz by using a command below.

1. Open a terminal on **Remote PC**
2. Execute RViz2.
``` bash
$ ros2 launch turtlebot3_bringup rviz2.launch.py
```

#### [Virtual SLAM with TurtleBot3](#virtual-slam-with-turtlebot3)

Use SLAM for a virtual robot in Gazebo. 

- You can select a model of the virtual robot and a desired a map of a virtual world. 

- ROS Packages are needed in order to use [SLAM](slam) for the virtual robot in Gazebo.

##### Virtual SLAM Execution Procedure

The following commands are examples for **TurtleBot3 Waffle Pi** in a turtlebot3_world.

1. Launch Gazebo
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

2. Launch Cartographer SLAM
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_cartographer cartographer.launch.py use_sim_time:=True
```

3. Remotely Control TurtleBot3
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

4. Save the Map
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

1. Execute Gazebo
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

2. Execute Navigation
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=$HOME/map.yaml
```

    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

    - Click `2D Pose Estimate` button in a menu bar, and then point exact pose of turtlebot3 on a map.
    - If TurtleBot3 is close to a costmap or nearby the map, click `Navigation2 Goal` button in a menu bar, and then point goal pose on the map.

    ![](/assets/images/platform/turtlebot3/ros2/gazebo_navigation2.png)

[slam]: /docs/en/platform/turtlebot3/ros2_slam/#slam
[navigation]: /docs/en/platform/turtlebot3/ros2_navigation2/#navigation2
