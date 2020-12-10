
{% capture notice_01 %}
**NOTE**
- Please run the Simulation on **Remote PC**.
- Launching the Simulation for the first time on the Remote PC may take a while to setup the environment.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read more about **TurtleBot3 Simulation**
{: .notice--success}
</summary>
TurtleBot3 supports simulation development environment that can be programmed and developed with a virtual robot in the simulation. There are two development environments to do this, one is using a **fake node with 3D visualization tool RViz**, and the other is using the **3D robot simulator Gazebo**.

- The **fake node** is suitable for testing with the robot model and movement, but it does not support sensors.
-  If you need to perform SLAM or Navigation, **Gazebo** would be a feasible solution as it supports sensors such as IMU, LDS, and camera.

In this instruction, Gazebo will be mainly introduced which is most widely used among ROS developers.

- **Gazebo Tutorials** : [http://gazebosim.org/tutorials](http://gazebosim.org/tutorials)
</details>

## [Gazebo Simulation](#gazebo-simulation)

<iframe width="560" height="315" src="https://www.youtube.com/embed/UzOoJ6a_mOg" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

The contents in e-Manual can be updated without a prior notice and video contents could be outdated.
{: .notice--warning}

This Gazebo Simulation uses **ROS Gazebo package**, therefore, proper Gazebo version for ROS1 Kinetic has to be installed before running this instruction.


### [Install Simulation Package](#install-simulation-package)
The **TurtleBot3 Simulation Package** requires `turtlebot3` and `turtlebot3_msgs` packages as prerequisite. Without these prerequisite packages, the Simulation cannot be launched.  
Please follow the [PC Setup](/docs/en/platform/turtlebot3/quick-start/) instructions if you did not install required packages and dependent packages.

```bash
$ cd ~/catkin_ws/src/
$ git clone -b kinetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
$ cd ~/catkin_ws && catkin_make
```

### [Launch Simulation World](#launch-simulation-world)

Three simulation environments are prepared for TurtleBot3. Please select one of these environments to launch Gazebo.  

**Please make sure to completely terminate other Simulation world before launching a new world.**
{: .notice--warning}

1. Empty World  
![](/assets/images/platform/turtlebot3/simulation/turtlebot3_empty_world.png)
```bash
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch
```

2. TurtleBot3 World  
![](/assets/images/platform/turtlebot3/simulation/turtlebot3_world_bugger.png)
```bash
$ export TURTLEBOT3_MODEL=waffle
$ roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

3. TurtleBot3 House  
![](/assets/images/platform/turtlebot3/simulation/turtlebot3_house.png)
```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ roslaunch turtlebot3_gazebo turtlebot3_house.launch
```

**NOTE**: If TurtleBot3 House is launched for the first time, downloading the map may take more than a few minutes depending the network status.
{: .notice}


### [Operate TurtleBot3](#operate-turtlebot3)

In order to teleoperate the TurtleBot3 with the keyboard, launch the teleoperation node with below command in a new terminal window.

```bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read more about **How to run Autonomous Collision Avoidance**
{: .notice--success}
</summary>
A simple collision avoidance node is prepared which keeps certain distance from obstacles and make turns to avoid collision.  
In order to autonomously drive a TurtleBot3 in the **TurtleBot3 world**, please follow the instruction below.

1. Terminate the turtlebot3_teleop_key node by entering `Ctrl` + `C` to the terminal that runs the teleop node.

2. Enter the below command to the terminal.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_simulation.launch
```
</details>

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read more about **How to visualize Simulation data(RViz)**
{: .notice--success}
</summary>
RViz visualizes published topics while simulation is running. You can launch RViz in a new terminal window by entering below command.

```bash
$ roslaunch turtlebot3_gazebo turtlebot3_gazebo_rviz.launch
```

![](/assets/images/platform/turtlebot3/simulation/turtlebot3_gazebo_rviz.png)
</details>
