
<!-- #### [Level Crossing](#level-crossing) -->

Level Crossing is the fifth mission of TurtleBot3 AutoRace 2020. TurtleBot3 must detect the stop sign and wait until the crossing gate is lifted.

<iframe width="560" height="315" src="https://www.youtube.com/embed/PMOYhx9kiDk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

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
    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_level.png)

8. Adjust parameters in the `detect_level_crossing` on Dynamic Reconfigure Plugin
    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_level_reconfigure.png)

9.   Open `level.yaml` file located at ***turtlebot3_autorace_detect/param/level/***.
```bash
gedit ~/turtlebot3_ws/src/turtlebot3_autorace_2020/turtlebot3_autorace_detect/param/level/level.yaml
```
        ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_level_yaml.png)

10.   Write modified values to the file and save.

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