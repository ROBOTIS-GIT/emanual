  
{% capture notice_01 %}
**NOTE**
- Please run the SLAM on **Remote PC**.
- Make sure to launch the [Bringup](/docs/en/platform/turtlebot3/bringup) from TurtleBot3 before executing any operation.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

The **SLAM (Simultaneous Localization and Mapping)** is a technique to draw a map by estimating current location in an arbitrary space. The SLAM is a well-known feature of TurtleBot from its predecessors. The video here shows you how accurately TurtleBot3 can draw a map with its compact and affordable platform.

<iframe width="640" height="360" src="https://www.youtube.com/embed/pJNSxDodhDk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [Run SLAM Node](#run-slam-node)

1. If the `Bringup` is not running on the TurtleBot3 SBC, launch the Bringup. **Skip this step if you have launched bringup previously**.  
  - Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and connect to Raspberry Pi with its IP address.
The default password is **ubuntu**.  
  ```bash
$ ssh ubuntu@{IP_ADDRESS_OF_RASPBERRY_PI}
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_bringup robot.launch.py
  ```

2. bring up basic packages to start its applications .    
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_bringup robot.launch.py
```

3. Open a new terminal from Remote PC with `Ctrl` + `Alt` + `T` and launch the SLAM node. The Cartographer is used as a default SLAM method.
  ```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_cartographer cartographer.launch.py
  ```  
  ![](/assets/images/platform/turtlebot3/ros2/platform_cartographer.png)

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

## [Run Teleoperation Node](#run-teleoperation-node)
 
Once SLAM node is successfully up and running, TurtleBot3 will be exploring unknown area of the map using teleoperation. It is important to avoid vigorous movements such as changing the linear and angular speed too quickly. When building a map using the TurtleBot3, it is a good practice to scan every corner of the map.

1. Open a new terminal and run the teleoperation node from the Remote PC.
  ```bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard

    Control Your TurtleBot3!
    ---------------------------
    Moving around:
           w
      a    s    d
           x

    w/x : increase/decrease linear velocity
    a/d : increase/decrease angular velocity
    space key, s : force stop

    CTRL-C to quit
  ```

2. Start exploring and drawing the map. 
  ![](/assets/images/platform/turtlebot3/slam/slam_running_for_mapping.png)

## [Tuning Guide](#tuning-guide)  

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

## [Save Map](#save-map)

The map is drawn based on the robot's [odometry](https://en.wikipedia.org/wiki/Odometry), [tf](http://wiki.ros.org/tf) and scan information. 
These map data is drawn in the RViz window as the TurtleBot3 was traveling. 
After creating a complete map of desired area, save the map data to the local drive for the later use.


1. Launch the **map_saver** node in the nav2_map_server package to create map files.  
  The map file is saved in the directory where the map_saver node is launched at.  
  Unless a specific file name is provided, `map` will be used as a default file name and create `map.pgm` and `map.yaml`.
```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```

The `-f` option specifies a folder location and a file name where files to be saved.  
With the above command, `map.pgm` and `map.yaml` will be saved in the home folder `~/`(/home/${username}).

## [Map](#map)

The map uses two-dimensional **Occupancy Grid Map (OGM)**, which is commonly used in ROS. 
The saved map will look like the figure below, where **white** area is collision free area while **black** area is occupied and inaccessible area, and **gray** area represents the unknown area. 
This map is used for the [Navigation](/docs/en/platform/turtlebot3/navigation).

![](/assets/images/platform/turtlebot3/slam/map.png)

The figure below shows the result of creating a large map using TurtleBot3. It took about an hour to create a map with a travel distance of about 350 meters.

![](/assets/images/platform/turtlebot3/slam/large_map.png)
