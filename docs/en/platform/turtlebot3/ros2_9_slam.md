---
layout: archive
lang: en
ref: ros2_slam
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/ros2_slam/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 29
---

<div style="counter-reset: h1 17"></div>

# [SLAM](#slam)
  
**WARNING**: Be careful when running the robot on the table as the robot might fall.
{: .notice--warning}
  
{% capture notice_01 %}
**NOTE**: 
- This instructions were tested on `Ubuntu 18.04` and `ROS2 Dashing Diademata`.
- This instructions are supposed to be running on the remote PC. Please run the instructions below on your **Remote PC**.
- The terminal application can be found with the Ubuntu search icon on the top left corner of the screen. The shortcut key for running the terminal is `Ctrl`-`Alt`-`T`.
- Make sure to run the [ROS2 Bringup](/docs/en/platform/turtlebot3/ros2_bringup/#bringup) instructions before running the instructions below.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>
  
  
**TIP**: It is recommended to use a joystick pad instead of the keyboard for easier control. For more information on remote control, Please refer to [Teleoperation] page.
{: .notice--success}
  
## [Cartographer](#cartographer)
  

**WARNING** : Do not proceed to this instruction on SBC in TurtleBot3. Please follow steps with **Remote PC**.
{: .notice--warning}

**SLAM (Simultaneous Localization And Mapping)** is a technique to draw a map by estimating current location in an arbitrary space. The SLAM is a well-known feature of TurtleBot from its predecessors. The video here shows you how accurately TurtleBot3 can draw a map with its compact and affordable platform.

<iframe width="560" height="315" src="https://www.youtube.com/embed/pJNSxDodhDk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## [Run SLAM Nodes](#run-slam-nodes)
  
**[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.  
  
**NOTE**: Before executing this command, you have to specify the model name of TurtleBot3. The `${TB3_MODEL}` is the name of the model you are using in `burger`, `waffle`, `waffle_pi`. If you want to permanently set the export settings, please refer to [Export TURTLEBOT3_MODEL][export_turtlebot3_model]{: .popup} page.
{: .notice}  
    
``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 launch turtlebot3_bringup robot.launch.py
```  
    
**[Remote PC]** Open a new terminal and launch the SLAM file.  
```bash
$ ros2 launch turtlebot3_cartographer cartographer.launch.py
```
    
![](/assets/images/platform/turtlebot3/ros2/platform_cartographer.png)

## [Run Teleoperation Node](#run-teleoperation-node)

**[Remote PC]** Open a new terminal and run the teleoperation node. The following command allows the user to control the robot to perform SLAM operation manually. It is important to avoid vigorous movements such as changing the speed too quickly or rotating too fast. When building a map using the robot, the robot should scan every corner of the environment to be measured. It requires some experiences to build a clean map, so let’s practice SLAM multiple times to build up know how. The mapping process is shown in figure below.

``` bash
$ export TURTLEBOT3_MODEL=${TB3_MODEL}
$ ros2 run turtlebot3_teleop teleop_keyboard
```

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
- **Global SLAM** : Criteria for judging whether to fed into a Ceres Scan Matcher to refine the pose.
  
_**POSE_GRAPH.constraint_builder.global_localization_min_score**_ 
- `turtlebot3_cartographer/config/turtlebot3_lds_2d.lua`
- **Global SLAM** :  
  
**NOTE**: Constraints can be visualized in RViz, it is very handy to tune global SLAM. One can also toggle POSE_GRAPH.constraint_builder.log_matches to get regular reports of the constraints builder formatted as histograms.  
{: .notice}  

## [Save the Map](#save-the-map)

**[Remote PC]** Now that you have all the work done, let's run the `map_saver` node to create a map file. The map is drawn based on the robot's odometry, tf information, and scan information of the sensor when the robot moves. These data can be seen in the RViz from the previous example video. The created map is saved in the directory in which `map_saver` is runnig. Unless you specify the file name, it is stored as `map.pgm` and `map.yaml` file which contains map information.
  
```bash
$ ros2 run nav2_map_server map_saver -f ~/map
```  
 
The `-f` option refers to the folder and file name where the map file is saved. If `~/map` is used as an option, `map.pgm` and `map.yaml` will be saved in the map folder of user’s home folder `~/` ($HOME directory : `/home/<username>`).
## [Map](#map)

We will use the two-dimensional `Occupancy Grid Map (OGM)`, which is commonly used in the ROS community. The map obtained from the previous [Save the Map](#save-the-map) section as shown in figure below, **white** is the free area in which the robot can move, **black** is the occupied area in which the robot can not move, and **gray** is the unknown area. This map is used in [ROS2 Navigation][navigation2].

![](/assets/images/platform/turtlebot3/slam/map.png)

The figure below shows the result of creating a large map using TurtleBot3. It took about an hour to create a map with a travel distance of about 350 meters.

![](/assets/images/platform/turtlebot3/slam/large_map.png)
  
  
## [Reference](#reference)
  
- [Cartographer]
- [Cartographer_ros]
    
[export_turtlebot3_model]: /docs/en/platform/turtlebot3/export_turtlebot3_model
[ROS2 Bringup]: /docs/en/platform/turtlebot3/ros2_bringup/#bringup
[ROS2 SLAM]: /docs/en/platform/turtlebot3/ros2_slam/#slam
[Teleoperation]: /docs/en/platform/turtlebot3/ros2_basic_operation/#teleoperation
[navigation2]: /docs/en/platform/turtlebot3/ros2_navigation2/#navigation2
[Cartographer]: https://google-cartographer.readthedocs.io/en/latest/
[Cartographer_ros]: https://google-cartographer-ros.readthedocs.io/en/latest/
[Algorithm walkthrough for tuning]: https://google-cartographer-ros.readthedocs.io/en/latest/algo_walkthrough.html
[Tuning methodology]: https://google-cartographer-ros.readthedocs.io/en/latest/tuning.html