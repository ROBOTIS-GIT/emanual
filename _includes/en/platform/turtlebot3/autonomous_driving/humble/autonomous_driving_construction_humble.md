
<!-- #### [Construction](#construction) -->

This section describes how you can pass a construction mission. If Turtlebot encounters an object while following lane, it will swerve into the opposite lane to avoid the object and move back to follow the lane.

<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/pO9SXz7ad7M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

##### [Construction avoidance process](#the-avoidance-process)

1. When the turtlebot recognizes and follows only one lane, it determines that there may be an obstacle in its path.

2. If an obstacle is detected within the danger zone, Turtlebot swerves to the opposite lane.

3. It recognizes the lane again and follows it.

##### [How to Run Construction Mission](#how-to-run-construction-mission)

1. Close all terminals or terminate them with `Ctrl` + `C`

2. Open a new terminal and launch Autorace Gazebo simulation.
```bash
$ ros2 launch turtlebot3_gazebo turtlebot3_autorace_2020.launch.py
```

3. Open a new terminal and launch the intrinsic calibration node.
```bash
$ ros2 launch turtlebot3_autorace_camera intrinsic_camera_calibration.launch.py
```

4. Open a new terminal and launch the extrinsic calibration node.
```bash
$ ros2 launch turtlebot3_autorace_camera extrinsic_camera_calibration.launch.py
```

5. Open a new terminal and launch the construction mission node.
```bash
$ ros2 launch turtlebot3_autorace_construction mission_construction.launch.py
```

6. On the image window, you can watch the LiDAR visualization. The detected lidar points, and danger zone are displayed.

<img src='/assets/images/platform/turtlebot3/autonomous_driving/humble_construction_image_window.png' width='500'>
