
<!-- ### [Traffic Lights](#traffic-lights) -->

This section describes how you can pass a traffic light mission. TurtleBot3 recognizes the traffic lights and starts the course.

<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/d2cP8OTMbwI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

##### [Traffic Lights detection process](#the-detection-process)
1. Filter the image to extract the red, yellow, green color mask images.
2. Locate the circle in the region of interest(RoI) for each masked image.
3. Find the red, yellow, and green traffic lights in that order.

##### [Traffic Lights Detection](#traffic-lights-detection)

1. Open a new terminal and launch Autorace Gazebo simulation.
```bash
ros2 launch turtlebot3_gazebo turtlebot3_autorace_2020.launch.py
```

2. Open a new terminal and launch the intrinsic calibration node.
```bash
ros2 launch turtlebot3_autorace_camera intrinsic_camera_calibration.launch.py
```

3. Open a new terminal and launch the extrinsic calibration node.
```bash
ros2 launch turtlebot3_autorace_camera extrinsic_camera_calibration.launch.py
```

4. Open a new terminal and launch the traffic light detection node with a calibration option.
```bash
ros2 launch turtlebot3_autorace_detect detect_traffic_light.launch.py calibration_mode:=True
```

5. Execute rqt on `Remote PC`.
```bash
rqt
```

6. Navigate **Plugins** > **Visualization** > **Image view**. Create two image view windows.

7. In one window, select the `/detect/image_traffic_light/compressed` topic. In another window, select one of the four topics to view the masked images:   
   `/detect/image_red_light`, `/detect/image_yellow_light`, `/detect/image_green_light`, `/detect/image_traffic_light`.

    <img src="/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_traffic_light_green.png" width="800">
    > Detecting the Yellow light. The image on the right displays `/detect/image_yellow_light` topic.

    <img src="/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_traffic_light_yellow.png" width="800">
    > Detecting the Yellow light. The image on the right displays `/detect/image_yellow_light` topic.

    <img src="/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_traffic_light_red.png" width="800">
    > Detecting the Red light. The image on the right displays `/detect/image_red_light` topic.

8.  Navigate **Plugins** > **Configuration** > **Dynamic Reconfigure**.
9.  Adjust parameters in `/detect/traffic_light`. It affects each masked image topic.

    <img src="/assets/images/platform/turtlebot3/autonomous_driving/noetic_traffic_light_reconfigure.png" width="900">
    > Traffic light reconfigure

##### [Saving Calibration Data](#saving-calibration-data)

1. Open the `traffic_light.yaml` file located at ***turtlebot3_autorace_detect/param/traffic_light/***.
```bash
gedit ~/turtlebot3_ws/src/turtlebot3_autorace_2020/turtlebot3_autorace_detect/param/traffic_light/traffic_light.yaml
```

      ![](/assets/images/platform/turtlebot3/autonomous_driving/humble_traffic_light_yaml.png)
      > turtlebot3_autorace_detect/param/traffic_light/'traffic_light.yaml'

1. Write modified values and save the file.

##### [Testing Traffic Light Detection](#testing-traffic-light-detection)

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

5. Open a new terminal and launch the traffic light detection node.
```bash
ros2 launch turtlebot3_autorace_detect detect_traffic_light.launch.py
```

6. Open a new terminal and execute the rqt_image_view.
```bash
rqt
```

7. Check each topics: `/detect/image_red_light`, `/detect/image_yellow_light`, `/detect/image_green_light`.
