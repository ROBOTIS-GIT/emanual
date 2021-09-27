
<!-- #### [Level Crossing](#level-crossing) -->

Level Crossing is the fifth mission of TurtleBot3 AutoRace 2020. TurtleBot3 must detect the stop sign and wait until the crossing gate is lifted.

<iframe width="560" height="315" src="https://www.youtube.com/embed/PMOYhx9kiDk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

##### [Level Crossing Detection](#level-crossing-detection)

1. Close all terminals or terminate them with `Ctrl` + `C`

2. Open a new terminal and launch Autorace Gazebo simulation. The `roscore` will be automatically launched with the **roslaunch** command.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Open a new terminal and launch the intrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch
```

4. Open a new terminal and launch the extrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera extrinsic_camera_calibration.launch
```

5. Open a new terminal and launch the level crossing detection node with a calibration option.
```bash
$ roslaunch turtlebot3_autorace_detect detect_level_crossing.launch mode:=calibration
```

6. Open a new terminal and execute rqt.
```bash
$ rqt
```

7. Select two topics: `/detect/image_level_color_filtered/compressed`, `/detect/image_level/compressed`.
    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_level.png)

8. Excute rqt_reconfigure.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

9. Adjust parameters in the `detect_level_crossing` in the left column to enhance the detection of crossing gate.
![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_level_reconfigure.png)

10. Open `level.yaml` file located at ***turtlebot3_autorace_detect/param/level/***.

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_level_yaml.png)

11. Write modified values to the file and save.

##### Testing Level Crossing Detection

1. Close all terminals or terminate them with `Ctrl` + `C`

2. Open a new terminal and launch Autorace Gazebo simulation. The `roscore` will be automatically launched with the **roslaunch** command.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Open a new terminal and launch the intrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch
```

4. Open a new terminal and launch the extrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera extrinsic_camera_calibration.launch
```

5. Open a new terminal and launch the level crossing detection node.
```bash
$ roslaunch turtlebot3_autorace_detect detect_level_crossing.launch
```

6. Open a new terminal and execute the rqt_image_view.
```bash
$ rqt_image_view
```

7. Check the image topic: `/detect/image_level/compressed`.

##### [How to Run Level Crossing Mission](#how-to-run-level-crossing-mission)

1. Close all terminals or terminate them with `Ctrl` + `C`

2. Open a new terminal and launch Autorace Gazebo simulation. The `roscore` will be automatically launched with the **roslaunch** command.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Open a new terminal and launch the intrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch
```

4. Open a new terminal and launch the keyboard teleoperation node.  
Drive the TurtleBot3 along the lane and stop before the stop traffic sign.
```bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

5. Open a new terminal and launch the autorace core node with a specific mission name.
```bash
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch mission:=level_crossing
```

6. Open a new terminal and launch the Gazebo mission node.
```bash
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_mission.launch
```

7. Open a new terminal and enter the command below. This will prepare to run the level crossing mission by setting the `decided_mode` to `2`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```
