<!-- ### [Traffic Lights](#traffic-lights) -->

Traffic Light is the first mission of AutoRace. TurtleBot3 recognizes the traffic lights and starts the course.

<iframe width="560" height="315" src="https://www.youtube.com/embed/JNj_STs3OSg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### [Traffic Lights Detection](#traffic-lights-detection)

1. Open terminal and use the command on `Remote PC`.
```bash
$ export AUTO_DT_CALIB=calibration
$ roslaunch turtlebot3_autorace_traffic_light_detect turtlebot3_autorace_detect_traffic_light.launch
```

2. Excute rqt on `Remote PC`.
```bash
rqt
```

3. Select four topics: `/detect/image_red_light`, `/detect/image_yellow_light`, `/detect/image_green_light`, `/detect/image_traffic_light`.

4. Excute rqt_reconfigure.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

5. Adjust parameters regarding traffic light topics to enhance the detection of traffic signs. The way of adjusting parameters is similar to step 5 at [Lane Detection](#lane-detection).

6. Open **traffic_light.yaml** file located at **turtlebot3_autorace_traffic_light_detect/param/traffic_light/**.

7. Write modified values to the file and save.

8. Terminate both running rqt and rqt_reconfigure in order to test, from the next step, the calibration whether or not it is successfully applied.

9. Use the command on `Remote PC`.
```bash
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_traffic_light_detect turtlebot3_autorace_detect_traffic_light.launch
```

10. Execute rqt_image_view.
```bash
$ rqt_image_view
```

11. See traffic light calibration is successfully applied.

#### [How to Run Traffic Light Mission](#how-to-run-traffic-light-mission)

**WARNING**: Be sure to read [Camera Calibration for Traffic Lights](#camera-calibration-for-traffic-lights) before running the traffic light node.  
{: .notice--warning}

1. Use the command on `Remote PC`.
```bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

2. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_traffic_light_core turtlebot3_autorace_core.launch
```

3. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 3"
```
