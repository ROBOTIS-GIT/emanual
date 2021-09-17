
<!-- ### [Intersection](#intersection) -->

Intersection is the second mission of AutoRace. TurtleBot3 detects a specific traffic sign (such as a curve sign) at the intersection course, and go to the given direction.

<iframe width="560" height="315" src="https://www.youtube.com/embed/8K4GMbfXFXI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### [How to Run Intersection Mission](#how-to-run-intersection-mission)

1. Use the command on `Remote PC`.
```bash
$ export AUTO_IN_CALIB=action
$ roslaunch turtlebot3_autorace_intersection_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

2. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_intersection_core turtlebot3_autorace_core.launch
```

3. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```
