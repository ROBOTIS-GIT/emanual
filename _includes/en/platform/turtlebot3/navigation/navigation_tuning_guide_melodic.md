
Navigation stack has many parameters to change performances for different robots.  

You can get more information about Navigation tuning from [Basic Navigation Tuning Guide](http://wiki.ros.org/navigation/Tutorials/Navigation%20Tuning%20Guide), [ROS Navigation Tuning Guide by Kaiyu Zheng](http://kaiyuzheng.me/documents/navguide.pdf), and the chapter 11 of [ROS Robot Programming](https://community.robotsource.org/t/download-the-ros-robot-programming-book-for-free/51) book.

### inflation_radius

- Defined in `turtlebot3_navigation/param/costmap_common_param_${TB3_MODEL}.yaml`
- This parameter makes inflation area from the obstacle. Path would be planned in order that it don't across this area. It is safe that to set this to be bigger than robot radius. For more information, please refer to the [costmap_2d wiki](http://wiki.ros.org/costmap_2d#Inflation).

![](/assets/images/platform/turtlebot3/navigation/tuning_inflation_radius.png)

### cost_scaling_factor

- Defined in `turtlebot3_navigation/param/costmap_common_param_${TB3_MODEL}.yaml`
- This factor is multiplied by cost value. Because it is an reciprocal propotion, this parameter is increased, the cost is decreased.

![](/assets/images/platform/turtlebot3/navigation/tuning_cost_scaling_factor.png)

The best path is for the robot to pass through a center of between obstacles. Set this factor to be smaller in order to far from obstacles.

### max_vel_x

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- This factor is set the maximum value of translational velocity.

### min_vel_x

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- This factor is set the minimum value of translational velocity. If set this negative, the robot can move backwards.

### max_trans_vel

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Actual value of the maximum translational velocity. The robot can not be faster than this.

### min_trans_vel

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Actual value of the minimum translational velocity. The robot can not be slower than this.

### max_rot_vel

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Actual value of the maximum rotational velocity. The robot can not be faster than this.

### min_rot_vel

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Actual value of the minimum rotational velocity. The robot can not be slower than this.

### acc_lim_x

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Actual value of the translational acceleration limit.

### acc_lim_theta

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Actual value of the rotational acceleration limit.

### xy_goal_tolerance

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- The x,y distance allowed when the robot reaches its goal pose.

### yaw_goal_tolerance

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- The yaw angle allowed when the robot reaches its goal pose.

### sim_time

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- This factor is set forward simulation in seconds. Too low value is in sufficient time to pass narrow area and too high value is not allowed rapidly rotates. You can watch defferences of length of the yellow line in below image.

![](/assets/images/platform/turtlebot3/navigation/tuning_sim_time.png)
