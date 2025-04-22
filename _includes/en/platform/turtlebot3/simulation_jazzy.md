
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

- **Gazebo Tutorials** : [https://gazebosim.org/docs/harmonic/tutorials/](https://gazebosim.org/docs/harmonic/tutorials/)
</details>

## [Gazebo Simulation](#gazebo-simulation)

<iframe width="560" height="315" src="https://www.youtube.com/embed/oqT6umwqLk8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

This Gazebo Simulation uses the **ros-gz package**, Gazebo version ROS 2 Humble has to be installed before running these instructions.


### [Install Simulation Package](#install-simulation-package)
The **TurtleBot3 Simulation Package** requires `turtlebot3` and `turtlebot3_msgs` packages. Without these prerequisite packages, the Simulation cannot be launched.  
Please follow the [PC Setup](/docs/en/platform/turtlebot3/quick-start/) instructions if you did not install required packages and dependent packages.

```bash
$ cd ~/turtlebot3_ws/src/
$ git clone -b jazzy https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
$ cd ~/turtlebot3_ws && colcon build --symlink-install
```

### [Launch Simulation World](#launch-simulation-world)

Three simulation environments are prepared for TurtleBot3. Please select one of these environments to launch Gazebo.  

**Please make sure to completely terminate any other Simulation world before launching a new world.**
{: .notice--warning}

1. Empty World  
```bash
$ export TURTLEBOT3_MODEL=burger
$ ros2 launch turtlebot3_gazebo empty_world.launch.py
```
![](/assets/images/platform/turtlebot3/simulation/turtlebot3_empty_world_sim.png)

2. TurtleBot3 World  
```bash
$ export TURTLEBOT3_MODEL=waffle
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```
![](/assets/images/platform/turtlebot3/simulation/turtlebot3_world_sim.png)

3. TurtleBot3 House  
```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ ros2 launch turtlebot3_gazebo turtlebot3_house.launch.py
```
![](/assets/images/platform/turtlebot3/simulation/turtlebot3_house_sim.png)

**NOTE**: If TurtleBot3 House is launched for the first time, downloading the map may take more than a few minutes depending on network status.
{: .notice}


### [Operate TurtleBot3](#operate-turtlebot3)

In order to teleoperate the TurtleBot3 with a keyboard, launch the teleoperation node with the command below in a new terminal window.

```bash
$ ros2 run turtlebot3_teleop teleop_keyboard
```

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
