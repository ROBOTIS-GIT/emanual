
{% capture notice_01 %}
**NOTE**
- Please run the SLAM on **Remote PC**.
- Make sure to launch the [Bringup](/docs/en/platform/turtlebot3/bringup) from TurtleBot3 before executing any operation.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

The **SLAM (Simultaneous Localization and Mapping)** is a technique to draw a map by estimating current location in an arbitrary space. The SLAM is a well-known feature of TurtleBot from its predecessors. The video here shows you how accurately TurtleBot3 can draw a map with its compact and affordable platform.

<iframe width="640" height="360" src="https://www.youtube.com/embed/lkW4-dG2BCY" frameborder="0" allowfullscreen></iframe>

## [Run SLAM Node](#run-slam-node)

1. Run roscore from Remote PC.
  ```bash
> roscore
  ```

2. If the `Bringup` is not running on the TurtleBot3 SBC, launch the Bringup. **Skip this step if you have launched bringup previously**.  
  ```bash
> roslaunch turtlebot3_bringup turtlebot3_robot.launch
  ```

3. Open a new terminal from Remote PC and launch the SLAM node. The Gmapping is used as a default SLAM method.
  ```bash
> set TURTLEBOT3_MODEL=${TB3_MODEL}
> roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
  ```

<details>
<summary id="summary_for_foreins" style="outline: inherit;">
![](/assets/click_here.png) Read more about **other SLAM methods**
{: .notice--success}
</summary>
- **Cartographer** ([ROS WIKI](http://wiki.ros.org/cartographer), [Github](https://github.com/googlecartographer/cartographer))
  1. Install dependent packages on PC using choco.  
  ```bash
  > choco upgrade ros-melodic-cartographer_ros -y
  ```
  2. Launch the Cartographer SLAM node.
  ```bash
  > c:\ws\turtlebot3\devel\setup.bat
  > set TURTLEBOT3_MODEL=${TB3_MODEL}
  > roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=cartographer
  ```
</details>

## [Run Teleoperation Node](#run-teleoperation-node)

Once SLAM node is successfully up and running, TurtleBot3 will be exploring unknown area of the map using teleoperation. It is important to avoid vigorous movements such as changing the linear and angular speed too quickly. When building a map using the TurtleBot3, it is a good practice to scan every corner of the map.

1. Open a new terminal and run the teleoperation node from the Remote PC.
  ```bash
> set TURTLEBOT3_MODEL=${TB3_MODEL}
> roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch

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

## [Save Map](#save-map)

The map is drawn based on the robot's [odometry](https://en.wikipedia.org/wiki/Odometry), [tf](http://wiki.ros.org/tf) and scan information. 
These map data is drawn in the RViz window as the TurtleBot3 was traveling. 
After creating a complete map of desired area, save the map data to the local drive for the later use.

1. Launch the **map_saver** node in the map_server package to create map files.  
  The map file is saved in the directory where the map_saver node is launched at.  
  Unless a specific file name is provided, `map` will be used as a default file name and create `map.pgm` and `map.yaml`.
```bash
> rosrun map_server map_saver -f %USERPROFILE%\map
```

The `-f` option specifies a folder location and a file name where files to be saved.  
With the above command, `map.pgm` and `map.yaml` will be saved in the user directory. The user directory is stored in an environment variable `%USERPROFILE%`


## [Map](#map)

The map uses two-dimensional **Occupancy Grid Map (OGM)**, which is commonly used in ROS. 
The saved map will look like the figure below, where **white** area is collision free area while **black** area is occupied and inaccessible area, and **gray** area represents the unknown area. 
This map is used for the [Navigation][navigation].

![](/assets/images/platform/turtlebot3/slam/map.png)

The figure below shows the result of creating a large map using TurtleBot3. It took about an hour to create a map with a travel distance of about 350 meters.

![](/assets/images/platform/turtlebot3/slam/large_map.png)

[navigation]: /docs/en/platform/turtlebot3/navigation/#navigation
[teleoperation]: /docs/en/platform/turtlebot3/teleoperation/#teleoperation
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
