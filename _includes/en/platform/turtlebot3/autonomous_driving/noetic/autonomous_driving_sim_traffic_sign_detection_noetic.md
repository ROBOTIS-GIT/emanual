
<!-- ### [Traffic Sign Detection](#traffic-sign-detection) -->

TurtleBot3 can detect various signs with the `SIFT` algorithm which compares the source image and the camera image, and perform programmed tasks while it drives.  
Follow the instructions below to test the traffic sign detection.

**NOTE**: More edges in the traffic sign increase recognition results from the SIFT algorithm.  
Please refer to the link below for related information.  
[https://docs.opencv.org/master/da/df5/tutorial_py_sift_intro.html](https://docs.opencv.org/master/da/df5/tutorial_py_sift_intro.html)
{: .notice}

1. Open a new terminal and launch Autorace Gazebo simulation. The `roscore` will be automatically launched with the **roslaunch** command.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

2. Open a new terminal and launch the teleoperation node. Drive the TurtleBot3 along the lane and stop where traffic signes can be clearly seen by the camera.
```bash
$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch
```

3. Open a new terminal and launch the rqt_image_view.
```bash
$ rqt_image_view
```

4. Select the `/camera/image_compensated` topic to display the camera image.

5. Capture each traffic sign from the `rqt_image_view` and crop unnecessary part of image. For the best performance, it is recommended to use original traffic sign images used in the track.

6. Save the images in the turtlebot3_autorace_detect package **/turtlebot3_autorace_2020/turtlebot3_autorace_detect/image/**. The file name should match with the name used in the source code.
- `construction.png`, `intersection.png`, `left.png`, `right.png`, `parking.png`, `stop.png`, `tunnel.png` file names are used by default.

7. Open a new terminal and launch the intrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch
```

8. Open a new terminal and launch the extrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera extrinsic_camera_calibration.launch
```

9. Open a new terminal and launch the traffic sign detection node.  
A specific mission for the ***mission*** argument must be selected among below.
- `intersection`, `construction`, `parking`, `level_crossing`, `tunnel`
```bash
$ roslaunch turtlebot3_autorace_detect detect_sign.launch mission:=SELECT_MISSION
```

    **NOTE**: Replace the `SELECT_MISSION` keyword with one of available options in the above.
    {: .notice}

8. Open a new terminal and launch the rqt image view plugin.
```bash
$ rqt_image_view
```

9. Select `/detect/image_traffic_sign/compressed` topic from the drop down list. A screen will display the result of traffic sign detection.
   
    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_intersection.png)

    > Detecting the Intersection sign when `mission:=intersection`

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_left.png)

    > Detecting the Left sign when `mission:=intersection`

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_right.png)

    > Detecting the Right sign when `mission:=intersection`

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_construction.png)

    > Detecting the Construction sign when `mission:=construction`

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_parking.png)

    > Detecting the Parking sign when `mission:=parking`

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_level_crossing.png)

    > Detecting the Level Crossing sign when `mission:=level_crossing`

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_tunnel.png)

    > Detecting the Tunnel sign when `mission:=tunnel`
