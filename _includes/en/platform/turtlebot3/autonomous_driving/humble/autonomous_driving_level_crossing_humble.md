
<!-- #### [Level Crossing](#level-crossing) -->

This section describes how you can detect a traffic bar. TurtleBot should detect the stop sign and wait for the crossing gate to open.

<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/PMOYhx9kiDk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

##### [Level Crossing detection process](#the-detection-process)

1. Filter the image to extract the red color mask image.
2. Find the rectangle in the masked image.
3. Connect the three squares to make a straight line.
4. Determine whether a line is open or closed by measuring the slope of the line.

##### [Level Crossing Detection](#level-crossing-detection)

1. Close all terminals or terminate them with `Ctrl` + `C`

2. Open a new terminal and launch Autorace Gazebo simulation.
```bash
ros2 launch turtlebot3_gazebo turtlebot3_autorace_2020.launch.py
```

3. Open a new terminal and launch the intrinsic calibration node.
```bash
ros2 launch turtlebot3_autorace_camera intrinsic_camera_calibration.launch.py
```

4. Open a new terminal and launch the extrinsic calibration node.
```bash
ros2 launch turtlebot3_autorace_camera extrinsic_camera_calibration.launch.py
```

5. Open a new terminal and launch the level crossing detection node with a calibration option.
```bash
ros2 launch turtlebot3_autorace_detect detect_level_crossing.launch.py calibration_mode:=True
```

6. Open a new terminal and execute rqt.
```bash
rqt
```

7. Select two topics on Image View Plugin: `/detect/image_level_color_filtered/compressed`, `/detect/image_level/compressed`.
    <img src="/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_level.png" width="1000">

8. Adjust parameters in the `detect_level_crossing` on Dynamic Reconfigure Plugin
    <img src="/assets/images/platform/turtlebot3/autonomous_driving/noetic_level_reconfigure.png" width="1000">

9.   Open `level.yaml` file located at ***turtlebot3_autorace_detect/param/level/***.
```bash
gedit ~/turtlebot3_ws/src/turtlebot3_autorace_2020/turtlebot3_autorace_detect/param/level/level.yaml
```
        ![](/assets/images/platform/turtlebot3/autonomous_driving/humble_level_yaml.png)

1.    Write modified values to the file and save.

##### Testing Level Crossing Detection

1. Close all terminals or terminate them with `Ctrl` + `C`

2. Open a new terminal and launch Autorace Gazebo simulation.
```bash
ros2 launch turtlebot3_gazebo turtlebot3_autorace_2020.launch.py
```

3. Open a new terminal and launch the intrinsic calibration node.
```bash
ros2 launch turtlebot3_autorace_camera intrinsic_camera_calibration.launch.py
```

4. Open a new terminal and launch the extrinsic calibration node.
```bash
ros2 launch turtlebot3_autorace_camera extrinsic_camera_calibration.launch.py
```

5. Open a new terminal and launch the level crossing detection node.
```bash
ros2 launch turtlebot3_autorace_detect detect_level_crossing.launch.py
```

6. Open a new terminal and execute the rqt_image_view.
```bash
rqt
```

7. Check the image topic: `/detect/image_level/compressed` on Image View Plugin.