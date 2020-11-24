
**WARNING**: In this instruction, TurtleBot3 may move and rotate. Please place the robot on a safe ground.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**
- Please run the Navigation on Remote PC.
- Make sure to launch the [Bringup](/docs/en/platform/turtlebot3/bringup/) from TurtleBot3 before executing any operation.
- The Navigation uses a map created by the [SLAM](/docs/en/platform/turtlebot3/slam/). Please prepare a map before running the Navigation.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**Navigation** is to move the robot from one location to the specified destination in a given environment. For this purpose, a map that contains geometry information of furniture, objects, and walls of the given environment is required. As described in the previous [SLAM][slam] section, the map was created with the distance information obtained by the sensor and the pose information of the robot itself.

The navigation enables a robot to move from the current pose to the designated goal pose on the map by using the map, robot's encoder, IMU sensor, and distance sensor. The procedure for performing this task is as follows.

## [Run Navigation Nodes](#run-navigation-nodes)

1. If `roscore` is not running on the Remote PC, run roscore. **Skip this step if roscore is already running**.
  ```bash
$ roscore
  ```

2. If the `Bringup` is not running on the TurtleBot3 SBC, launch the Bringup. **Skip this step if you have launched bringup previously**.  
  - Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and connect to Raspberry Pi with its IP address.
The default password is **turtlebot**.  
  ```bash
$ ssh pi@{IP_ADDRESS_OF_RASPBERRY_PI}
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

3. Launch the Navigation. Depending on the platform, replace **${TB3_MODEL}** in the below command with `burger`, `waffle` or `waffle_pi`.
  ```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/map.yaml
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

Initial Pose Estimation is critical when running Navigation as this process initialize the AMCL parameters that are critical in Navigation. The TurtleBot3 has to be correctly located on the saved map with the LDS sensor data that neatly overlaps the map.

1. Press the `2D Pose Estimate` button in the RViz menu.
2. Click on the map where the actual robot is located and drag the large green arrow toward the direction where the robot is facing.
3. Repeat step 1 and 2 until the LDS sensor data is overlayed on the saved map. 
4. Launch keyboard teleoperation node to precisely locate the robot on the map.
  ```bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
  ```
5. Move the robot back and forth a bit to collect the surrounding environment information and narrow down the estimated location of the TurtleBot3 on the map which is displayed with tiny green arrows.



When this process is completed, the robot estimates its actual position and orientation by using the position and orientation specified by the green arrow as the initial pose. Every green arrow stands for an expected position of TurtleBot3. The laser scanner will draw approximate figures of wall on the map. If the drawing doesn't show the figures incorrectly, repeat localizing the TurtleBot3 from clicking `2D Pose Estimate` button above.

![](/assets/images/platform/turtlebot3/navigation/2d_pose_estimate.png)

**TIP**: The `turtlebot3_teleop_keyboard` node used for `Estimate Initial Pose` should be terminated after use. If it does not, the robot will behave strangely because the topic overlaps with the `/cmd_vel` topic from the navigation node of the next step.
{: .notice--success}

## [Send Navigation Goal](#send-navigation-goal)

**[Remote PC]** When everything is ready, let's try the move command from the navigation GUI. If you press `2D Nav Goal` in the menu of RViz, a very large green arrow appears. This green arrow is a marker that can specify the destination of the robot. The root of the arrow is the `x` and `y` position of the robot, and the orientation pointed by the arrow is the `theta` direction of the robot. Click this arrow at the position where the robot will move, and drag it to set the orientation like the instruction below.

- Click the `2D Nav Goal` button.
- Click on a specific point in the map to set a goal position and drag the cursor to the direction where TurtleBot should be facing at the end.

The robot will create a path to avoid obstacles to its destination based on the map. Then, the robot moves along the path. At this time, even if an obstacle is suddenly detected, the robot moves to the target point avoiding the obstacle.

![](/assets/images/platform/turtlebot3/navigation/2d_nav_goal.png)

<iframe width="640" height="360" src="https://www.youtube.com/embed/VYlMywwYALU" frameborder="0" allowfullscreen></iframe>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}

Setting a goal position might fail if the path to the goal position cannot be created. If you wish to stop the robot before it reaches to the goal position, set the current position of TurtleBot3 as a goal position.

## [Tuning Guide](#tuning-guide)

Navigation stack has many parameters to change performances for different robots. You can get an information about it in [ROS Wiki](http://wiki.ros.org/navigation) or refer chapter 11 in [ROS Robot Programming](https://community.robotsource.org/t/download-the-ros-robot-programming-book-for-free/51) book.

This tuning guide give some tips for you to configue important parameters. If you want to change performances depends on your environments, this tips might be help you and save your time.

_**inflation_radius**_

- `turtlebot3_navigation/param/costmap_common_param_$(model).yaml`
- This parameter makes inflation area from the obstacle. Path would be planned in order that it don't across this area. It is safe that to set this to be bigger than robot radius. For more information about it please following [page of costmap_2d wiki](http://wiki.ros.org/costmap_2d#Inflation).

![](/assets/images/platform/turtlebot3/navigation/tuning_inflation_radius.png)

_**cost_scaling_factor**_

- `turtlebot3_navigation/param/costmap_common_param_$(model).yaml`
- This factor is multiplied by cost value. Because it is an reciprocal propotion, this parameter is increased, the cost is decreased.

![](/assets/images/platform/turtlebot3/navigation/tuning_cost_scaling_factor.png)

The best path is for the robot to pass through a center of between obstacles. Set this factor to be smaller in order to far from obstacles.

_**max_vel_x**_

- `turtlebot3_navigation/param/dwa_local_planner_params_$(model).yaml`
- This factor is set the maximum value of translational velocity.

_**min_vel_x**_

- `turtlebot3_navigation/param/dwa_local_planner_params_$(model).yaml`
- This factor is set the minimum value of translational velocity. If set this negative, the robot can move backwards.

_**max_trans_vel**_

- `turtlebot3_navigation/param/dwa_local_planner_params_$(model).yaml`
- Actual value of the maximum translational velocity. The robot can not be faster than this.

_**min_trans_vel**_

- `turtlebot3_navigation/param/dwa_local_planner_params_$(model).yaml`
- Actual value of the minimum translational velocity. The robot can not be slower than this.

_**max_rot_vel**_

- `turtlebot3_navigation/param/dwa_local_planner_params_$(model).yaml`
- Actual value of the maximum rotational velocity. The robot can not be faster than this.

_**min_rot_vel**_

- `turtlebot3_navigation/param/dwa_local_planner_params_$(model).yaml`
- Actual value of the minimum rotational velocity. The robot can not be slower than this.

_**acc_lim_x**_

- `turtlebot3_navigation/param/dwa_local_planner_params_$(model).yaml`
- Actual value of the translational acceleration limit.

_**acc_lim_theta**_

- `turtlebot3_navigation/param/dwa_local_planner_params_$(model).yaml`
- Actual value of the rotational acceleration limit.

_**xy_goal_tolerance**_

- `turtlebot3_navigation/param/dwa_local_planner_params_$(model).yaml`
- The x,y distance allowed when the robot reaches its goal pose.

_**yaw_goal_tolerance**_

- `turtlebot3_navigation/param/dwa_local_planner_params_$(model).yaml`
- The yaw angle allowed when the robot reaches its goal pose.

_**sim_time**_

- `turtlebot3_navigation/param/dwa_local_planner_params_$(model).yaml`
- This factor is set forward simulation in seconds. Too low value is in sufficient time to pass narrow area and too high value is not allowed rapidly rotates. You can watch defferences of length of the yellow line in below image.

![](/assets/images/platform/turtlebot3/navigation/tuning_sim_time.png)

**References**

- [Basic Navigation Tuning Guide (ROS Wiki)](http://wiki.ros.org/navigation/Tutorials/Navigation%20Tuning%20Guide)
- [ROS Navigation Tuning Guide by Kaiyu Zheng](http://kaiyuzheng.me/documents/navguide.pdf)


## [References](#references)

- Navigation
  - [ROS WIKI](http://wiki.ros.org/navigation), [Github](https://github.com/ros-planning/navigation)

[slam]: /docs/en/platform/turtlebot3/slam/