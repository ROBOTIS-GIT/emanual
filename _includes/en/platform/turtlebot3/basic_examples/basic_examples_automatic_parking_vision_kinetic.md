
{% capture notice_05 %}
**NOTE**:

- The `turtlebot3_automatic_parking_vision` uses raspberry pi camera and so the robot which is a default platform used for this demo is TurtleBot3 Waffle Pi. Since it parks from finding out AR marker on some wall, printed AR marker should be prepared. Whole process uses the image get from the camera, so if the process is not well being done, configure the parameters, such as brightness, contrast, etc.
- The `turtlebot3_automatic_parking_vision` uses rectified image based on `image_proc` nodes. To get rectified image, the robot should get optic calibration data for raspberry pi camera. (Every downloaded turtlebot3 packages already have the camera calibration data as raspberry pi camera v2 default.)
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

3. **[TurtleBot]** Start the raspberry pi camera nodes.
```bash
$ roslaunch turtlebot3_bringup turtlebot3_rpicamera.launch
```

4. **[Remote PC]** Raspberry pi package will publish compressed type image for fast communication. However, what will be needed in image rectification in `image_proc` node is raw type image. Hence, compressed image should be transform to raw image.
```bash
$ rosrun image_transport republish compressed in:=raspicam_node/image raw out:=raspicam_node/image
```

5. **[Remote PC]** Then, the image rectification should be carried out.
```bash
$ ROS_NAMESPACE=raspicam_node rosrun image_proc image_proc image_raw:=image _approximate_s=true _queue_size:=20
```

6. **[Remote PC]** Now should start the AR marker detection. Before running related launch file, the model of what will be used by this example code should be exported. After running the launch file, RViz will be automatically run under preset environments.
```bash
$ export TURTLEBOT3_MODEL=waffle_pi
$ roslaunch turtlebot3_automatic_parking_vision turtlebot3_automatic_parking_vision.launch
```

    <iframe width="560" height="315" src="https://www.youtube.com/embed/dvpWdrD3bVs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    > TurtleBot3 Automatic Parking Vision
