
{% capture notice_05 %}
**NOTE**:

- The `turtlebot3_automatic_parking_vision` uses the RaspberryPi camera, the default platform used for this demo is TurtleBot3 Waffle Pi. Since it parks according to an AR marker on a visible wall, a printed AR marker should be prepared.
- The `turtlebot3_automatic_parking_vision` uses a rectified image based on `image_proc` nodes. To get a rectified image, the robot should use optical calibration data for the RaspberryPi camera. (Every downloaded turtlebot3 package should have the camera calibration data for RaspberryPi camera v2 by default.)
- The `turtlebot3_automatic_parking_vision` package requires `ar_track_alvar` package.
{% endcapture %}
<div class="notice--info">{{ notice_05 | markdownify }}</div>

1. **[Remote PC]** Run roscore.
```bash
$ roscore
```

2. **[TurtleBot]** Bring up basic packages to start TurtleBot3 applications.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_robot.launch
```

3. **[TurtleBot]** Start the RaspberryPi camera nodes.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
```

4. **[Remote PC]** The RaspberryPi package will publish compressed images for fast communication. However, what will be needed in image rectification in the `image_proc` node is raw image data. The compressed image should be transformed to a raw image.
```bash
$ rosrun image_transport republish compressed in:=raspicam_node/image raw out:=raspicam_node/image
```

5. **[Remote PC]** Then, the image rectification should be carried out.
```bash
$ ROS_NAMESPACE=raspicam_node rosrun image_proc image_proc image_raw:=image _approximate_s=true _queue_size:=20
```

6. **[Remote PC]** Now the AR marker detection can start. Before running related launch file, the model of what will be used by this example code should be exported. After running the launch file, RViz will be automatically run under preset environments.
```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ roslaunch turtlebot3_automatic_parking_vision turtlebot3_automatic_parking_vision.launch
```

    <iframe width="560" height="315" src="https://www.youtube.com/embed/dvpWdrD3bVs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    > TurtleBot3 Automatic Parking Vision
