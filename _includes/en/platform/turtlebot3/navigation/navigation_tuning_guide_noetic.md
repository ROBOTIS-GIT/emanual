Navigation stack has many parameters to change performance for different robots.  

You can get more information about Navigation tuning from [Basic Navigation Tuning Guide](http://wiki.ros.org/navigation/Tutorials/Navigation%20Tuning%20Guide), [ROS Navigation Tuning Guide by Kaiyu Zheng](http://kaiyuzheng.me/documents/navguide.pdf), and chapter 11 of [ROS Robot Programming](https://community.robotsource.org/t/download-the-ros-robot-programming-book-for-free/51) book.

### inflation_radius

- Defined in `turtlebot3_navigation/param/costmap_common_param_${TB3_MODEL}.yaml`
- This parameter makes inflation area from the obstacle. Path would be planned in order that it don't across this area. It is safe that to set this to be bigger than robot radius. For more information, please refer to the [costmap_2d wiki](http://wiki.ros.org/costmap_2d#Inflation).

![](/assets/images/platform/turtlebot3/navigation/tuning_inflation_radius.png)

### cost_scaling_factor

- Defined in `turtlebot3_navigation/param/costmap_common_param_${TB3_MODEL}.yaml`
- This factor is a reciprical proportional parameter used to multiply the cost values. When this parameter is increased, the cost generated decreases.

![](/assets/images/platform/turtlebot3/navigation/tuning_cost_scaling_factor.png)

The best path is for the robot to pass through a central point between obstacles. Set this factor to be smaller in order to pass farther from obstacles.

### max_vel_x

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- This factor sets the maximum value for translational velocity.

### min_vel_x

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- This factor sets the minimum value for translational velocity. If set to a negative value, the robot can move backwards.

### max_trans_vel

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Value of the maximum allowable translational velocity. The robot can not move faster than this.

### min_trans_vel

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Value of the minimum allowable translational velocity. The robot can not move slower than this.

### max_rot_vel

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Value of the maximum allowable rotational velocity. The robot can not rotate faster than this.

### min_rot_vel

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Value of the minimum allowable rotational velocity. The robot can not rotate slower than this.

### acc_lim_x

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Value of the translational acceleration limit.

### acc_lim_theta

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- Value of the rotational acceleration limit.

### xy_goal_tolerance

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- The x,y tolerance allowed when the robot reaches its goal pose.

### yaw_goal_tolerance

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- The yaw angle allowed when the robot reaches its goal pose.

### sim_time

- Defined in `turtlebot3_navigation/param/dwa_local_planner_params_${TB3_MODEL}.yaml`
- This factor sets forward simulation time in seconds. Setting this too small makes it difficult for the robot to pass through narrow spaces while large values limit dynamic turns. You can observe the differences in length of the yellow line in the below image that representing the simulation path.

![](/assets/images/platform/turtlebot3/navigation/tuning_sim_time.png)
