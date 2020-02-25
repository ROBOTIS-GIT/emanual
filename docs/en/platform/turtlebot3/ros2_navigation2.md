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
page_number: 31
---

<div style="counter-reset: h1 19"></div>

# [[ROS 2] Navigation2](#ros-2-navigation2)

**WARNING**: Be careful when running the robot on the table as the robot might fall.
{: .notice--warning}

{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 18.04` and `ROS Dashing Diademata`.
- Make sure to run the [Bringup](/docs/en/platform/turtlebot3/ros2_bringup/#bringup) instructions before running this instructions.
- The navigation uses the a data created in [SLAM](/docs/en/platform/turtlebot3/ros2_slam/#slam). Please make sure to have a map data.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

Use **Navigation2** to send your robot to a designated destination in a given environment. 
- TurtleBot3 utilizes robot’s encoder, IMU sensor, and distance sensor on the way to the destination using its node.
- To use its node, you need to build a saved map which contains information of a field: furniture, objects, and walls. The more information on the saved map is available at [ROS2 SLAM](/docs/en/platform/turtlebot3/ros2_slam/#slam).

## [Run Navigation2 Nodes](#run-navigation2-nodes)

1. Open a terminal on **TurtleBot3**.

2. Bring up basic packages to start TurtleBot3 applications
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_bringup robot.launch.py
```
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}
3. Open a terminal on **Remote PC**
4. Launch the navigation file.
```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_navigation2 navigation2.launch.py map:=$HOME/map.yaml
```
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

    Running the command above, RViz2 is executed together. In order to run RViz2 separately, use the following command.
    ``` bash
    $ rviz2 -d `ros2 pkg prefix turtlebot3_navigation2`/share/turtlebot3_navigation2/rviz/tb3_navigation2.rviz
    ```

## [Estimate Initial Pose](#estimate-initial-pose)

**CAUTION**: Do not apply this instruction to SBC. Use **Remote PC**. 
{: .notice--warning}

First, the initial pose estimation of the robot should be performed. When you press `2D Pose Estimate` in the menu of RViz2, a very large green arrow appears. Move it to the pose where the actual robot is located in the given map, and while holding down the left mouse button, drag the green arrow to the direction where the robot's front is facing, follow the instruction below.

1. Click on `2D Pose Estimate`.
2. Click on a approximate point on the screen and drag a cursur to indicate a direction where TurtleBot3 heads to.
3. Run [Teleoperation](http://emanual.robotis.com/docs/en/platform/turtlebot3/ros2_basic_operation/#basic_operation) to recognize where TurtleBot3 is currently located on the map. 
  ``` bash
  $ export TURTLEBOT3_MODEL=${TB3_MODEL}
  $ ros2 run turtlebot3_teleop teleop_keyboard
  ```
  > Executing turtlebot3_teleop_keyboard node of Teleoperation
  
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}
    
4. Move TurtleBot3 back and forth. 

After then, TurtleBot3 estimates its acutal position and orientation, which is specified by the green arrow. If the drawing is specified worng, repeat localizing by clicking on `2D Pose Estimate`
- The green arrows indicates an expected position of TurtleBot3. 
- A laser scanner draws approximate figures of wall on the map. 

![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_01.png)
> 2D Pose Estimate

## [Send Navigation Goal](#send-navigation-goal)

**CAUTION**: Do not apply this instruction to SBC. Use **Remote PC**. 
{: .notice--warning}

Use `Navigation2 Goal` to send TurtleBot3 to a designated destination. Pressing this button, large green arrow will appears, which is a marker indicating the destination of the robot. The roots of the arrow are `x` and `y` parameters. An orientation pointed by the arrow is `theta` direction of the robot.

Follow the instruction below.

1. Click on `Navigation2 Goal`.
2. Click on a specific point in the map to set a goal position.
3. While holding it down, drag the cursor to the direction where TurtleBot should be facing at the end.
4. A path to the designated destination will be created based on information of the map. 
- TurtleBot3 follows the path and arrive at the destination.
- If unexpected obstacles blocks the path, the robot can detect them to avoid.  

![](/assets/images/platform/turtlebot3/ros2/tb3_navigation2_rviz_02.png)
> Navigation2 Goal
  
<iframe width="560" height="315" src="https://www.youtube.com/embed/VtyqUuuZAFA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

The contents in e-Manual may differ from contents of a provided video in e-Manaul as e-Manual is updated on a regular basis.
{: .notice--warning} 

{% capture warning_01 %}
**WARNING**:  
- Goal position may not be set when a path is failed to be created. 
- If you want to stop moving the robot before reaching to the goal position, set a current position of TurtleBot3 as a goal position.
{% endcapture %}
<div class="notice--warning">{{ warning_01 | markdownify }}</div>

## [Tuning Guide](#tuning-guide)

Navigation2 stack has many parameters to change performances for different robots. It's similar with ROS1 navigation. You can get an information about it in [ROS Navigation Wiki](http://wiki.ros.org/navigation) or refer to chapter 11 in [ROS Robot Programming](https://community.robotsource.org/t/download-the-ros-robot-programming-book-for-free/51) book.

This tuning guide gives some tips for you to configue important parameters. If you want to change performances depends on your environments, this tips might be help you and save your time.
  
### local_costmap(global_cost_map)  
  
_**inflation_layer.inflation_radius**_
- `turtlebot3_navigation2/param/$(model).yaml`
- This parameter makes inflation area from the obstacle. Path would be planned in order that it does not across this area. It is safe that to set this to be bigger than robot radius. For more information about it please following [page of costmap_2d wiki](http://wiki.ros.org/costmap_2d#Inflation). 

![](/assets/images/platform/turtlebot3/navigation/tuning_inflation_radius.png)

_**inflation_layer.cost_scaling_factor**_ 
- `turtlebot3_navigation2/param/$(model).yaml`
- This factor is multiplied by cost value. Because it is an reciprocal propotion, this parameter is increased, the cost is decreased. 

![](/assets/images/platform/turtlebot3/navigation/tuning_cost_scaling_factor.png)

  The best path is for the robot to pass through a center of between obstacles. Set this factor to be smaller in order to far from obstacles.

### dwb_controller 
  
_**max_vel_x**_ 
- `turtlebot3_navigation2/param/$(model).yaml`
- This factor is set the maximum value of translational velocity. 

_**min_vel_x**_ 
- `turtlebot3_navigation2/param/$(model).yaml`
- This factor is set the minimum value of translational velocity. If set this negative, the robot can move backwards.

_**max_vel_y**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The maximum y velocity for the robot in m/s.

_**min_vel_y**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The minimum y velocity for the robot in m/s.  
  
_**max_vel_theta**_  
- `turtlebot3_navigation2/param/$(model).yaml`
- Actual value of the maximum rotational velocity. The robot can not be faster than this.

_**min_speed_theta**_
- `turtlebot3_navigation2/param/$(model).yaml`
- Actual value of the minimum rotational speed. The robot can not be slower than this.

_**max_speed_xy**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The absolute value of the maximum translational velocity for the robot in m/s.

_**min_speed_xy**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The absolute value of the minimum translational velocity for the robot in m/s.  
   
_**acc_lim_x**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The x acceleration limit of the robot in meters/sec^2.

_**acc_lim_y**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The y acceleration limit of the robot in meters/sec^2.

_**acc_lim_theta**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The rotational acceleration limit of the robot in radians/sec^2.

_**decel_lim_x**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The deceleration limit of the robot in the x direction in m/s^2.

_**decel_lim_y**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The deceleration limit of the robot in the y direction in m/s^2.

_**decel_lim_theta**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The deceleration limit of the robot in the theta direction in rad/s^2.

_**xy_goal_tolerance**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The x,y distance allowed when the robot reaches its goal pose.

_**yaw_goal_tolerance**_
- `turtlebot3_navigation2/param/$(model).yaml`
- The yaw angle allowed when the robot reaches its goal pose.

_**transform_tolerance**_
- `turtlebot3_navigation2/param/$(model).yaml`
- It allows the latency for tf messages.
  
_**sim_time**_
- `turtlebot3_navigation2/param/$(model).yaml`
- This factor is set forward simulation in seconds. Too low value is in sufficient time to pass narrow area and too high value is not allowed rapidly rotates. You can watch defferences of length of the yellow line in below image.

![](/assets/images/platform/turtlebot3/navigation/tuning_sim_time.png)  
    
## [References](#references)
- [Navigation2]
- [ROS Navigation Tuning Guide by Kaiyu Zheng]
- [Navigation]

[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
[Bringup]: /docs/en/platform/turtlebot3/ros2_bringup/#bringup
[SLAM]: /docs/en/platform/turtlebot3/ros2_slam/#slam

[Basic Navigation Tuning Guide (ROS Wiki)]: http://wiki.ros.org/navigation/Tutorials/Navigation%20Tuning%20Guide
[ROS Navigation Tuning Guide by Kaiyu Zheng]: http://kaiyuzheng.me/documents/navguide.pdf
[Navigation2]: https://ros-planning.github.io/navigation2/
[Navigation]: http://wiki.ros.org/navigation
