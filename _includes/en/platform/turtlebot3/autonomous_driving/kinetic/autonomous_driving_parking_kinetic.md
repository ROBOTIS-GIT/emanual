<!-- ### [Parking](#parking) -->

Parking is the fourth mission of AutoRace. TurtleBot3 detects the parking sign, and park itself at a parking lot.

<iframe width="560" height="315" src="https://www.youtube.com/embed/F3ZG8PlagaA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### [How to Run Parking Mission](#how-to-run-parking-mission)

1. Use the command on `Remote PC`.
```bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_parking_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

2. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_parking_core turtlebot3_autorace_core.launch
```

3. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```
