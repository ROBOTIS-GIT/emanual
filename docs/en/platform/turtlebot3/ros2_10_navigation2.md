---
layout: archive
lang: en
ref: ros2_navigation2
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2_navigation2/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 30
---

<div style="counter-reset: h1 18"></div>

# [Navigation2](#navigation2)

**WARNING**: Be careful when running the robot on the table as the robot might fall.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 18.04` and `ROS2 Dashing Diademata`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **Remote PC**.
- The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
- Make sure to run the [ROS2 Bringup](/docs/en/platform/turtlebot3/ros2_bringup/#bringup) instructions before running the instructions below.
- The navigation uses the a data created in [ROS2 SLAM](/docs/en/platform/turtlebot3/ros2_slam/#slam). Please make sure to have a map data.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

**Navigation** is to move the robot from one location to the specified destination in a given environment. For this purpose, a map that contains geometry information of furniture, objects, and walls of the given environment is required. As described in the previous [ROS2 SLAM] section, the map was created with the distance information obtained by the sensor and the pose information of the robot itself.

**Navigation** enables a robot to move from the current pose to the designated goal pose on the map by using the map, robot’s encoder, IMU sensor, and distance sensor. The procedure for performing this task is as follows.


## [Run Navigation2 Nodes](#run-navigation2-nodes)

**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.
  
**NOTE**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice}  
    
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_bringup robot.launch.py
```

**[Remote PC]** Launch the navigation file.

**TIP**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice--success}
  
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py map:=$HOME/map.yaml
```

**TIP**: When you run the above command, the visualization tool RViz2 is also executed. If you want to run RViz2 separately, use the following command.
{: .notice--success}

``` bash
$ rviz2 □□□□□□□□□□□□□□□□□□□□
```

## [Estimate Initial Pose](#estimate-initial-pose)

**[Remote PC]** First, the initial pose estimation of the robot should be performed. When you press `2D Pose Estimate` in the menu of RViz2, a very large green arrow appears. Move it to the pose where the actual robot is located in the given map, and while holding down the left mouse button, drag the green arrow to the direction where the robot's front is facing, follow the instruction below.

- Click the `2D Pose Estimate` button.
- Click on the approxtimate point in the map where the TurtleBot3 is located and drag the cursor to indicate the direction where TurtleBot3 faces.

Then move the robot back and forth with tools like the `turtlebot3_teleop_keyboard` node to collect the surrounding environment information and find out where the robot is currently located on the map. 

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

When this process is completed, the robot estimates its actual position and orientation by using the position and orientation specified by the green arrow as the initial pose. Every green arrow stands for an expected position of TurtleBot3. The laser scanner will draw approximate figures of wall on the map. If the drawing doesn't show the figures incorrectly, repeat localizing the TurtleBot3 from clicking `2D Pose Estimate` button above.

![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_1.png)
![](/assets/images/platform/temp.png)  
> 2D Pose Estimate

**TIP**: The `turtlebot3_teleop_keyboard` node used for `Estimate Initial Pose` should be terminated after use. If it does not, the robot will behave strangely because the topic overlaps with the `◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁  /cmd_vel  ▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷` topic from the navigation node of the next step.
{: .notice--success}

  
## [Send Navigation Goal](#send-navigation-goal)

**[Remote PC]** When everything is ready, let's try the move command from the navigation GUI. If you press `Navigation2 Goal` in the menu of RViz, a very large green arrow appears. This green arrow is a marker that can specify the destination of the robot. The root of the arrow is the `x` and `y` position of the robot, and the orientation pointed by the arrow is the `theta` direction of the robot. Click this arrow at the position where the robot will move, and drag it to set the orientation like the instruction below.

- Click the `Navigation2 Goal` button.
- Click on a specific point in the map to set a goal position and drag the cursor to the direction where TurtleBot should be facing at the end.

The robot will create a path to avoid obstacles to its destination based on the map. Then, the robot moves along the path. At this time, even if an obstacle is suddenly detected, the robot moves to the target point avoiding the obstacle.

![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_2.png)
![](/assets/images/platform/temp.png)  
> Navigation2 Goal
  
<iframe width="560" height="315" src="https://www.youtube.com/embed/VtyqUuuZAFA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁    
Setting a goal position might fail if the path to the goal position cannot be created. If you wish to stop the robot before it reaches to the goal position, set the current position of TurtleBot3 as a goal position.  
▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷    
     
## [Tuning Guide](#tuning-guide)  
◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁◁    
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
▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷▷    
  
## [References](#references)
- [Naviagation2]
- [ROS Navigation Tuning Guide by Kaiyu Zheng]



[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
[ROS2 Bringup]: /docs/en/platform/turtlebot3/ros2_bringup/#bringup
[ROS2 SLAM]: /docs/en/platform/turtlebot3/ros2_slam/#slam

[Basic Navigation Tuning Guide (ROS Wiki)]: http://wiki.ros.org/navigation/Tutorials/Navigation%20Tuning%20Guide
[ROS Navigation Tuning Guide by Kaiyu Zheng]: http://kaiyuzheng.me/documents/navguide.pdf
[Naviagation2]: https://github.com/ros-planning/navigation2/blob/master/README.md