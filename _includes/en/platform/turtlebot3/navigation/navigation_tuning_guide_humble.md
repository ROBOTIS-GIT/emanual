The Navigation2 stack has many parameters to change performances for different robots. Although it's similar to ROS1 Navigation, please refer to the [Configuration Guide of Navigation2](https://navigation.ros.org/configuration/index.html) or [ROS Navigation Tuning Guide by Kaiyu Zheng](http://kaiyuzheng.me/documents/navguide.pdf) for more details.

### Costmap Parameters
  
#### inflation_layer.inflation_radius
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- This parameter defines an inflation area of inaccesability around detected obstacles. Generated paths will be planned not to cross this area. It is safe to set this value to be slightly bigger than robot radius. For more information, please refer to [costmap_2d wiki](http://wiki.ros.org/costmap_2d#Inflation).

![](/assets/images/platform/turtlebot3/navigation/tuning_inflation_radius.png)

#### inflation_layer.cost_scaling_factor 
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- This is an inverse proportional factor that is multiplied by the value of the costmap. If this parameter is increased, the value of the costmap is decreased. 

![](/assets/images/platform/turtlebot3/navigation/tuning_cost_scaling_factor.png)

  The optimal path for the robot to pass through obstacles is to take a median path between them. Setting a smaller value for this parameter will create a farther path from the obstacles.

### dwb_controller 
  
#### max_vel_x 
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- This factor sets the maximum value for translational velocity. 

#### min_vel_x 
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- This factor sets the minimum value for translational velocity. If set this negative, the robot can move backwards.

#### max_vel_y
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The maximum y velocity for the robot in m/s.

#### min_vel_y
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- The minimum y velocity for the robot in m/s.  
  
#### max_vel_theta  
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- Value setting the maximum rotational velocity. The robot can not spin faster than this.

#### min_speed_theta
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- Value setting the minimum rotational velocity. The robot can not spin slower than this.

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
- The allowance for latency for tf messages.
  
#### sim_time
- Defined in `turtlebot3_navigation2/param/${TB3_MODEL}.yaml`
- This factor sets forward simulation time in seconds. Setting this too small makes it difficult for the robot to pass through narrow spaces while large values limit dynamic turns. You can observe the differences in length of the yellow line in the below image that representing the simulation path.

![](/assets/images/platform/turtlebot3/navigation/tuning_sim_time.png)  
    
[Basic Navigation Tuning Guide (ROS Wiki)]: http://wiki.ros.org/navigation/Tutorials/Navigation%20Tuning%20Guide
[nav2]: https://navigation.ros.org/
