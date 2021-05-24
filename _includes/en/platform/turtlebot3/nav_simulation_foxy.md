
Just like the SLAM in Gazebo simulator, you can select or create various environments and robot models in virtual Navigation world. However, proper map has to be prepared before running the Navigation2. Other than preparing simulation environment instead of bringing up the robot, Navigation Simulation is pretty similar to that of [Navigation][navigation].  

### Launch Simulation World

Terminate all applications with `Ctrl` + `C` that were launced in the previous sections.
{: .notice--warning}

In the previous [SLAM][slam] section, TurtleBot3 World is used to creat a map. The same Gazebo environment will be used for Navigation.

Please use the proper keyword among `burger`, `waffle`, `waffle_pi` for the `TURTLEBOT3_MODEL` parameter.  

```bash
$ export TURTLEBOT3_MODEL=burger
$ ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py
```

<details>
<summary>
![](/assets/images/icon_unfold.png) Read more about **How to load TurtleBot3 House**
</summary>
```bash
$ export TURTLEBOT3_MODEL=burger
$ ros2 launch turtlebot3_gazebo turtlebot3_house.launch.py
```
</details>

### Run Navigation Node 
Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and run the Navigation2 node. 

```bash
$ export TURTLEBOT3_MODEL=burger
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py use_sim_time:=True map:=$HOME/map.yaml
```

### [Estimate Initial Pose](#estimate-initial-pose)

**Initial Pose Estimation** must be performed before running the Navigation as this process initializes the AMCL parameters that are critical in Navigation. TurtleBot3 has to be correctly located on the map with the LDS sensor data that neatly overlaps the displayed map.

1. Click the `2D Pose Estimate` button in the RViz2 menu.
2. Click on the map where the actual robot is located and drag the large green arrow toward the direction where the robot is facing.
3. Repeat step 1 and 2 until the LDS sensor data is overlayed on the saved map. 
  ![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_01.png)
4. Launch keyboard teleoperation node to precisely locate the robot on the map.
  ```bash
$ ros2 run turtlebot3_teleop teleop_keyboard
  ```
5. Move the robot back and forth a bit to collect the surrounding environment information and narrow down the estimated location of the TurtleBot3 on the map which is displayed with tiny green arrows.  
![](/assets/images/platform/turtlebot3/navigation/tb3_amcl_particle_01.png)
![](/assets/images/platform/turtlebot3/navigation/tb3_amcl_particle_02.png)
6. Terminate the keyboard teleoperation node by entering `Ctrl` + `C` to the teleop node terminal in order to prevent different **cmd_vel** values are published from multiple nodes during Navigation.


### [Set Navigation Goal](#set-navigation-goal)

1. Click the `Navigation2 Goal` button in the RViz2 menu.
2. Click on the map to set the destination of the robot and drag the green arrow toward the direction where the robot will be facing. 
  - This green arrow is a marker that can specify the destination of the robot. 
  - The root of the arrow is `x`, `y` coordinate of the destination, and the angle `θ` is determined by the orientation of the arrow.
  - As soon as x, y, &theta; are set, TurtleBot3 will start moving to the destination immediately.
  ![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_02.png)

<iframe width="560" height="315" src="https://www.youtube.com/embed/VtyqUuuZAFA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<details>
<summary>
![](/assets/images/icon_unfold.png) Read more about **Navigation2**
</summary>
- The robot will create a path to reach to the Navigation2 Goal based on the global path planner. Then, the robot moves along the path. If an obstacle is placed in the path, the Navigation2 will use local path planner to avoid the obstacle.

- Setting a Navigation2 Goal might fail if the path to the Navigation2 Goal cannot be created. If you wish to stop the robot before it reaches to the goal position, set the current position of TurtleBot3 as a Navigation2 Goal.

- [Official ROS2 Navigation2 Wiki][nav2]
</details>

[slam]: /docs/en/platform/turtlebot3/slam/#slam
[navigation]: /docs/en/platform/turtlebot3/navigation/#navigation

[nav2]: https://navigation.ros.org/
