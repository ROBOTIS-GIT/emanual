
{% capture notice_01 %}
**NOTE**
- The Simulation should be run from the **Remote PC**.
- Launching the Simulation for the first time on the Remote PC may take some time to setup the environment.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

<details>
<summary>
![](/assets/images/icon_unfold.png) Read more about **TurtleBot3 Simulation**
</summary>
TurtleBot3 supports simulation development environments that can allow for development with a virtual robot. There are two development environments to do this, one using **fake node with 3D visualization in RViz**, and the other is the **3D robot simulator Gazebo**.

- **fake node** simulation is suitable for testing the robot model and movement, but it does not support sensors.
-  If you need to perform SLAM or Navigation, **Gazebo** would be the preferred solution as it supports sensors such as IMU, LDS, and camera.

- **Gazebo Tutorials** : [http://gazebosim.org/tutorials](http://gazebosim.org/tutorials)
</details>

## [Gazebo Simulation](#gazebo-simulation)

<iframe width="560" height="315" src="https://www.youtube.com/embed/UzOoJ6a_mOg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

The content in the e-Manual may be updated without prior notice and video content may be outdated.
{: .notice--warning}

This Gazebo Simulation uses the **ROS Gazebo package**, Gazebo version ROS 2 Humble has to be installed before running these instructions.


### [Install Simulation Package](#install-simulation-package)
The **TurtleBot3 Simulation Package** requires `turtlebot3` and `turtlebot3_msgs` packages. Without these prerequisite packages, the Simulation cannot be launched.  
Please follow the [PC Setup](/docs/en/platform/turtlebot3/quick-start/) instructions if you did not install required packages and dependent packages.

```bash
$ cd ~/turtlebot3_ws/src/
$ git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
$ cd ~/turtlebot3_ws && colcon build --symlink-install
```

### [Launch Simulation World](#launch-simulation-world)

Three simulation environments are prepared for TurtleBot3. Please select one of these environments to launch Gazebo.  

**Please make sure to completely terminate any other Simulation world before launching a new world.**
{: .notice--warning}

1. Empty World  
![](/assets/images/platform/turtlebot3/simulation/turtlebot3_empty_world.png)
```bash
$ export TURTLEBOT3_MODEL=burger
$ ros2 launch turtlebot3_gazebo empty_world.launch.py
```

2. TurtleBot3 World  
![](/assets/images/platform/turtlebot3/simulation/gazebo_world.png)
```bash
$ export TURTLEBOT3_MODEL=waffle
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

3. TurtleBot3 House  
![](/assets/images/platform/turtlebot3/simulation/turtlebot3_house.png)
```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ ros2 launch turtlebot3_gazebo turtlebot3_house.launch.py
```

**NOTE**: If TurtleBot3 House is launched for the first time, downloading the map may take more than a few minutes depending on network status.
{: .notice}


### [Operate TurtleBot3](#operate-turtlebot3)

In order to teleoperate the TurtleBot3 with a keyboard, launch the teleoperation node with the command below in a new terminal window.

```bash
$ ros2 run turtlebot3_teleop teleop_keyboard
```

<details>
<summary>
![](/assets/images/icon_unfold.png) Read more about **How to run Autonomous Collision Avoidance**
</summary>
A simple collision avoidance node which keeps a safe distance from obstacles and makes turns to avoid collisions is provided with the TurtleBot3 simulation packages.  
In order to autonomously drive a TurtleBot3 in the **TurtleBot3 world**, please follow the instructions below.

1. Terminate the turtlebot3_teleop_key node by entering `Ctrl` + `C` in the terminal running the teleop node.

2. Enter the command below in the terminal.
```bash
$ ros2 run turtlebot3_gazebo turtlebot3_drive
```
</details>

<details>
<summary>
![](/assets/images/icon_unfold.png) Read more about **How to visualize Simulation data(RViz2)**
</summary>
RViz2 visualizes published topics while simulation is running. You can launch RViz2 in a new terminal window with the following command.

```bash
$ ros2 launch turtlebot3_bringup rviz2.launch.py
```

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_gazebo_rviz.png)
</details>
