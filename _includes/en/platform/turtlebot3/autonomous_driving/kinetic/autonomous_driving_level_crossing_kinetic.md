<!-- ### [Level Crossing](#level-crossing) -->

Level Crossing is the fifth mission of AutoRace. When TurtleBot3 encounters the level crossing, it stops driving, and wait until the level crossing opens.

<iframe width="560" height="315" src="https://www.youtube.com/embed/xyBaLeg4Ifk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### [Level Crossing Detection](#level-crossing-detection)

1. Use the command on `Remote PC`.
```bash
$ export AUTO_DT_CALIB=calibration
$ roslaunch turtlebot3_autorace_level_crossing_detect turtlebot3_autorace_detect_level.launch
```

2. Execute rqt
```bash
$ rqt
```

3. Select two topics: `/detect/image_level_color_filtered`, `/detect/image_level`

4. Execute rqt_reconfigure.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

4. Select `/detect_level` and adjust parameters regarding Level Crossing topics to enhance the detection of the level crossing object. The way of adjusting parameters is similar to step 5 at [Lane Detection](#lane-detection).

5. Open **level.yaml** located at **turtlebot3_autorace_stop_bar_detect/param/level/**.

6. Write modified values to the file and save.

7. Run a detect level lanuch file.
```bash
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_level.launch
```
#### [How to Run Level Crossing Mission](#how-to-run-level-crossing-mission)

1. Use the command on `Remote PC`.
```bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_level_crossing_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

2. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_level_crossing_core turtlebot3_autorace_core.launch
```

3. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```
