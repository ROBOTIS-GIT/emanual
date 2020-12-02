
Gmapping has many parameters to change performances for different environments. You can get an information about whole parameters in [ROS WiKi](http://wiki.ros.org/gmapping) or refer to the Chapter 11 of [ROS Robot Programming](https://community.robotsource.org/t/download-the-ros-robot-programming-book-for-free/51).
This tuning guide provides tips when configuring gmapping parameters. If you want to optimize SLAM performances for your environments, this section might be helpful.

Below parameters are defined in `turtlebot3_slam/config/gmapping_params.yaml` file.

### maxUrange
This parameter is set the maximum usable range of the lidar sensor.

### map_update_interval
This parameter defines time between updating the map.  
The smaller the value, the more frequent the map is updated.  
However, setting this too small will be require more processing power for the map calculation. 
Set this parameter depending on the map environment.

![](/assets/images/platform/turtlebot3/slam/tuning_map_update_interval.png)

### minimumScore

This parameter sets the minimum score value that determines the success or failure of the sensor’s scan data matching test. 
This can reduce errors in the expected position of the robot in a large area. 
If the parameter is set properly, you will see information similar to one shown below.
```bash
Average Scan Matching Score=278.965
neff= 100
Registering Scans:Done
update frame 6
update ld=2.95935e-05 ad=0.000302522
Laser Pose= -0.0320253 -5.36882e-06 -3.14142
```

If set too high, you might see below warnings.
```bash
Scan Matching Failed, using odometry. Likelihood=0
lp:-0.0306155 5.75314e-06 -3.14151
op:-0.0306156 5.90277e-06 -3.14151
```

### linearUpdate
When the robot translates longer distance than this value, it will run the scan process.

### angularUpdate
When the robot rotates more than this value, it will run the scan process. It is recommended to
set this value less than linearUpdate.
