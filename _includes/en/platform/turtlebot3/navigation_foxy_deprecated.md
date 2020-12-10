
**WARNING**: In this instruction, TurtleBot3 may move and rotate. Please place the robot on a safe ground.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**
- Please run the Navigation on Remote PC.
- Make sure to launch the [Bringup](/docs/en/platform/turtlebot3/bringup/) from TurtleBot3 before executing any operation.
- The Navigation uses a map created by the [SLAM](/docs/en/platform/turtlebot3/slam/). Please prepare a map before running the Navigation.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**[Navigation][navigation]** is to move the robot from one location to the specified destination in a given environment. For this purpose, a map that contains geometry information of furniture, objects, and walls of the given environment is required. As described in the previous [SLAM][slam] section, the map was created with the distance information obtained by the sensor and the pose information of the robot itself.

The [Navigation][navigation] enables a robot to move from the current pose to the designated goal pose on the map by using the map, robot's encoder, IMU sensor, and distance sensor. The procedure for performing this task is as follows.

## [Run Navigation Nodes](#run-navigation-nodes)

1. If the `Bringup` is not running on the TurtleBot3 SBC, launch the Bringup. **Skip this step if you have launched bringup previously**.  
  - Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and connect to Raspberry Pi with its IP address.
The default password is **ubuntu**.  
  ```bash
$ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_bringup robot.launch.py
  ```

2. Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and launch the Navigation node. ROS 2 uses [Navigation2][nav2].
  ```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py map:=$HOME/map.yaml
  ```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read more about **How to predefine the TURTLEBOT3_MODEL**
{: .notice--success}
</summary>
The `export TURTLEBOT3_MODEL=${TB3_MODEL}` command can be omitted if the **TURTLEBOT3_MODEL** parameter is predefined in the `.bashrc` file. The `.bashrc` file is automatically loaded when a terminal window is created.  

- Example of defining TurtlBot3 Burger as a default.  
```bash
$ echo 'export TURTLEBOT3_MODEL=burger' >> ~/.bashrc
$ source ~/.bashrc
```

- Example of defining TurtlBot3 Waffle Pi as a default.  
```bash
$ echo 'export TURTLEBOT3_MODEL=waffle_pi' >> ~/.bashrc
$ source ~/.bashrc
```
</details>

## [Estimate Initial Pose](#estimate-initial-pose)

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


## [Set Navigation Goal](#set-navigation-goal)

1. Click the `Navigation2 Goal` button in the RViz2 menu.
2. Click on the map to set the destination of the robot and drag the green arrow toward the direction where the robot will be facing. 
  - This green arrow is a marker that can specify the destination of the robot. 
  - The root of the arrow is `x`, `y` coordinate of the destination, and the angle `θ` is determined by the orientation of the arrow.
  - As soon as x, y, &theta; are set, TurtleBot3 will start moving to the destination immediately.
  ![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_02.png)

<iframe width="560" height="315" src="https://www.youtube.com/embed/VtyqUuuZAFA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read more about **Navigation2**
{: .notice--success}
</summary>
- The robot will create a path to reach to the Navigation2 Goal based on the global path planner. Then, the robot moves along the path. If an obstacle is placed in the path, the Navigation2 will use local path planner to avoid the obstacle.

- Setting a Navigation2 Goal might fail if the path to the Navigation2 Goal cannot be created. If you wish to stop the robot before it reaches to the goal position, set the current position of TurtleBot3 as a Navigation2 Goal.

- [Official ROS2 Navigation2 Wiki][nav2]
</details>

## [Tuning Guide](#tuning-guide)

Navigation2 stack has many parameters to change performances for different robots. Although it's similar to the ROS1 Navigation, please refer to the [Configuration Guide of Navigation2](https://navigation.ros.org/configuration/index.html) or [ROS Navigation Tuning Guide by Kaiyu Zheng](http://kaiyuzheng.me/documents/navguide.pdf) for more details.

### Costmap Parameters
  
#### inflation_layer.inflation_radius
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- This parameter makes inflation area from the obstacle. Path would be planned in order that it does not across this area. It is safe that to set this to be bigger than robot radius. For more information, please refer to the [costmap_2d wiki](http://wiki.ros.org/costmap_2d#Inflation).

![](/assets/images/platform/turtlebot3/navigation/tuning_inflation_radius.png)

#### inflation_layer.cost_scaling_factor 
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- This is an inverse proportional factor that is multiplied by the value of the costmap. If this parameter is increased, the value of the costmap is decreased. 

![](/assets/images/platform/turtlebot3/navigation/tuning_cost_scaling_factor.png)

  The optimal path for the robot to pass through obstacles is to take a median path between them. Setting a smaller value for this parameter will create a farther path from the obstacles.

### dwb_controller 
  
#### max_vel_x 
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- This factor is set the maximum value of translational velocity. 

#### min_vel_x 
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- This factor is set the minimum value of translational velocity. If set this negative, the robot can move backwards.

#### max_vel_y
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The maximum y velocity for the robot in m/s.

#### min_vel_y
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The minimum y velocity for the robot in m/s.  
  
#### max_vel_theta  
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- Actual value of the maximum rotational velocity. The robot can not be faster than this.

#### min_speed_theta
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- Actual value of the minimum rotational speed. The robot can not be slower than this.

#### max_speed_xy
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The absolute value of the maximum translational velocity for the robot in m/s.

#### min_speed_xy
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The absolute value of the minimum translational velocity for the robot in m/s.  
   
#### acc_lim_x
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The x acceleration limit of the robot in meters/sec^2.

#### acc_lim_y
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The y acceleration limit of the robot in meters/sec^2.

#### acc_lim_theta
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The rotational acceleration limit of the robot in radians/sec^2.

#### decel_lim_x
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The deceleration limit of the robot in the x direction in m/s^2.

#### decel_lim_y
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The deceleration limit of the robot in the y direction in m/s^2.

#### decel_lim_theta
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The deceleration limit of the robot in the theta direction in rad/s^2.

#### xy_goal_tolerance
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The x,y distance allowed when the robot reaches its goal pose.

#### yaw_goal_tolerance
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The yaw angle allowed when the robot reaches its goal pose.

#### transform_tolerance
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- It allows the latency for tf messages.
  
#### sim_time
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- This factor is set forward simulation in seconds. Setting this too small makes robot difficult to pass a narrow space while large value limits dynamic turns. You can observe the defferences of length of the yellow line in below image that represents the simulation path.

![](/assets/images/platform/turtlebot3/navigation/tuning_sim_time.png)  
    
[Basic Navigation Tuning Guide (ROS Wiki)]: http://wiki.ros.org/navigation/Tutorials/Navigation%20Tuning%20Guide
[nav2]: https://navigation.ros.org/
