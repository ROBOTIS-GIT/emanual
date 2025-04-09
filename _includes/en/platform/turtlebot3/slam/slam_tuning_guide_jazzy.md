
The SLAM in ROS2 uses Cartographer ROS which provides configuration options via `Lua` file.

Below options are defined in `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua` file.
For more details about each options, please refer to [the Cartographer ROS official documentation](https://google-cartographer-ros.readthedocs.io/en/latest/algo_walkthrough.html).


### MAP_BUILDER.use_trajectory_builder_2d 
This option sets the type of SLAM.
  
### TRAJECTORY_BUILDER_2D.min_range 
This option sets the minimum usable range of the lidar sensor.
  
### TRAJECTORY_BUILDER_2D.max_range 
This option sets the maximum usable range of the lidar sensor.
  
### TRAJECTORY_BUILDER_2D.missing_data_ray_length 
In 2D, Cartographer replaces ranges further than max_range with _**TRAJECTORY_BUILDER_2D.missing_data_ray_length**_.
  
### TRAJECTORY_BUILDER_2D.use_imu_data 
If you use 2D SLAM, range data can be handled in real-time without an additional source of information so you can choose whether you’d like Cartographer to use an IMU or not.
  
### TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching 
**Local SLAM** : The _**RealTimeCorrelativeScanMatcher**_ can be toggled depending on the reliability of the sensor.
  
### TRAJECTORY_BUILDER_2D.motion_filter.max_angle_radians 
**Local SLAM** : To avoid inserting too many scans per submaps, A scan is dropped if the motion does not exceed a certain angle.
  
### POSE_GRAPH.optimize_every_n_nodes 
**Global SLAM** : Setting POSE_GRAPH.optimize_every_n_nodes to 0 is a handy way to disable global SLAM and concentrate on the behavior of local SLAM.  
  
### POSE_GRAPH.constraint_builder.min_score 
**Global SLAM** : Threshold for the scan match score below which a match is not considered. Low scores indicate that the scan and map do not look similar.
  
### POSE_GRAPH.constraint_builder.global_localization_min_score 
**Global SLAM** : Threshold below which global localizations are not trusted.
  
**NOTE**: Constraints can be visualized in RViz, it is very handy to tune global SLAM. One can also toggle POSE_GRAPH.constraint_builder.log_matches to get regular reports of the constraints builder formatted as histograms.  
{: .notice}  
