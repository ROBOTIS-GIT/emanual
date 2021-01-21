
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

This Gazebo Simulation uses **ROS Gazebo package**, therefore, proper Gazebo version must to be installed before running this instruction.

### [Launch Simulation](#launch-simulation)

If you are running ROS1 Noetic, please replace `melodic` with `noetic` in the command below.  

1. To start the simulation, open one elevated command prompt.  
  ```
> c:\opt\ros\melodic\x64\setup.bat
> c:\ws\turtlebot3\devel\setup.bat
> set TURTLEBOT3_MODEL=waffle
> roslaunch turtlebot3_fake turtlebot3_fake.launch
  ```

2. Then, open another elevated command prompt.
  ```
c:\opt\ros\melodic\x64\setup.bat
c:\ws\turtlebot3\devel\setup.bat
set TURTLEBOT3_MODEL=waffle
roslaunch turtlebot3_gazebo turtlebot3_simulation.launch
  ```
