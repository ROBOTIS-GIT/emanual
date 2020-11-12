
<div style="counter-reset: h1 3"></div>

<!--[dummy Header 1]>
  <h1 id="basic-operation"><a href="#basic-operation">Basic Operation</a></h1>
<![end dummy Header 1]-->

# [SLAM](#slam)
  
{% capture notice_01 %}
**NOTE**: 
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **Remote PC**.
- Make sure to run the [Bringup](/docs/en/platform/turtlebot3/ros2_bringup/#bringup) instruction before use of the instruction.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>
      
**CAUTION**: Place the robot on a level surface, and ensure that it can not fall off an table or desk during a test.
{: .notice--warning}

**SLAM (Simultaneous Localization And Mapping)** is a technique of drawing a map by estimating its current location in an arbitrary space: it is a well-known feature of its predecessors of TurtleBot.  

Watch the video and see how accurate TurtleBot3 draws a map.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/pJNSxDodhDk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning} 

## [Run SLAM Nodes](#run-slam-nodes)

**[TurtleBot3]**

1. Open a terminal on **Turtlebot3**. 

2. bring up basic packages to start its applications .    
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_bringup robot.launch.py
```
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}

**[Remote PC]**

3. Open a new terminal on **Remote PC** 

4. Launch the SLAM file.  
```bash
$ ros2 launch turtlebot3_cartographer cartographer.launch.py
```
    ![](/assets/images/platform/turtlebot3/ros2/platform_cartographer.png)

## [Run Teleoperation Node](#run-teleoperation-node)
 
In order to achieve a high level accuracy for A mapping, you need to repeat SLAM several times manually in a given place. Use the following package (Teleoperation Node) for a manual operation.  
Refer to a picture of the mapping process, which shows how the robot draws a map using SLAM.   

**[Remote PC]**

1. Open a terminal on **Remote PC**

2. Run Teleoperation Node.
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```
    **NOTE**: Specify `${TB3_MODEL}`: `burger`, `waffle`, `waffle_pi` before excuting the command. Set the permanent export setting by following [Export TURTLEBOT3_MODEL](/docs/en/platform/turtlebot3/export_turtlebot3_model){: .popup} instruction.
    {: .notice--info}
  
3. Use the controller.  

    ``` bash
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

    ![](/assets/images/platform/turtlebot3/slam/slam_running_for_mapping.png)

## [Tuning Guide](#tuning-guide)  
> Reference : Cartographer ROS
  - [Algorithm walkthrough for tuning]
  - [Tuning methodology]
  
**TIP**: In Cartographer configuration files, every distance is defined in meters.
{: .notice--success}
  
_**options**_  
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- [Lua configuration reference documentation](https://google-cartographer-ros.readthedocs.io/en/latest/configuration.html)

_**MAP_BUILDER.use_trajectory_builder_2d**_ 
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- This param is set the type of SLAM.
  
_**TRAJECTORY_BUILDER_2D.min_range**_ 
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- **Input** : This param is set the minimum usable range of the lidar sensor.
  
_**TRAJECTORY_BUILDER_2D.max_range**_ 
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- **Input** : This param is set the maximum usable range of the lidar sensor.
  
_**TRAJECTORY_BUILDER_2D.missing_data_ray_length**_ 
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- **Input** : In 2D, Cartographer replaces ranges further than max_range by `TRAJECTORY_BUILDER_2D.missing_data_ray_length`.
  
_**TRAJECTORY_BUILDER_2D.use_imu_data**_ 
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- **Input** : If you use 2D SLAM, range data can be handled in real-time without an additional source of information so you can choose whether you’d like Cartographer to use an IMU or not.
  
_**TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching**_ 
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- **Local SLAM** : The `RealTimeCorrelativeScanMatcher` can be toggled depending on the trust you have in your sensors.
  
_**TRAJECTORY_BUILDER_2D.motion_filter.max_angle_radians**_ 
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- **Local SLAM** : To avoid inserting too many scans per submaps, A scan is dropped if its motion is not above a certain angle.
  
_**POSE_GRAPH.optimize_every_n_nodes**_ 
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- **Global SLAM** : Setting POSE_GRAPH.optimize_every_n_nodes to 0 is a handy way to disable global SLAM and concentrate on the behavior of local SLAM.  
  
_**POSE_GRAPH.constraint_builder.min_score**_ 
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- **Global SLAM** : Threshold for the scan match score below which a match is not considered. Low scores indicate that the scan and map do not look similar.
  
_**POSE_GRAPH.constraint_builder.global_localization_min_score**_ 
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- **Global SLAM** : Threshold below which global localizations are not trusted.
  
**NOTE**: Constraints can be visualized in RViz, it is very handy to tune global SLAM. One can also toggle POSE_GRAPH.constraint_builder.log_matches to get regular reports of the constraints builder formatted as histograms.  
{: .notice}  

## [Save the Map](#save-the-map)

Use **map_saver** node to save a drawn map by SLAM.  
The map is drawn by collected data of the robot: odometry, tf and scan information of sensors, which you can monitor using RViz.  
The name of the map files is `map.pgm` and `map.yaml` as a default, which are saved in a directory where **map_saver** is running.

**Related Document:**
- [tf](http://wiki.ros.org/tf)
- [odometry](https://en.wikipedia.org/wiki/Odometry)

**[Remote PC]**

1. Open a new terminal on **Remote PC** 

2. Run map_saver node

```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```
-  The `-f` option refers to a folder and to a file name where the map file is saved. If `~/map` is used as an option, `map.pgm` and `map.yaml` will be saved in the map folder located at `~/` ($ HOME directory : `/home/<username>`).

## [Map](#map)

**Occupancy Grid Map (OGM)** is a two-dimensional space, commonly used in ROS community. The space is composed of data of a saved map file, [Save the Map](#save-the-map).  
The White cells represent **free space**, black celss represents **ocupied space**, and gray represents **unknown space**.

![](/assets/images/platform/turtlebot3/slam/map.png)

> Occupancy Grid Map (OGM)

The figure shows the result of creating a large map using TurtleBot3. 

The time for creating a map requires 55 minutes: the estimation of a travel distance is 351 m.


![](/assets/images/platform/turtlebot3/slam/large_map.png)
  
  
## [Reference](#reference)
  
- [Cartographer]
- [Cartographer_ros]
    
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model

[Bringup]: /docs/en/platform/turtlebot3/ros2_bringup/#bringup

[Teleoperation]: /docs/en/platform/turtlebot3/ros2_basic_operation/#teleoperation
[navigation2]: /docs/en/platform/turtlebot3/ros2_navigation2/#navigation2
[Cartographer]: https://google-cartographer.readthedocs.io/en/latest/
[Cartographer_ros]: https://google-cartographer-ros.readthedocs.io/en/latest/
[Algorithm walkthrough for tuning]: https://google-cartographer-ros.readthedocs.io/en/latest/algo_walkthrough.html
[Tuning methodology]: https://google-cartographer-ros.readthedocs.io/en/latest/tuning.html
