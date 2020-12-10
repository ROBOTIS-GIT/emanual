
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
