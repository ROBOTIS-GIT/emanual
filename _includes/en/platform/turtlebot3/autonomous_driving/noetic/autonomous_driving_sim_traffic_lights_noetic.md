
<!-- #### [Traffic Lights](#traffic-lights) -->

Traffic Light is the first mission of AutoRace. TurtleBot3 recognizes the traffic lights and starts the course.

<iframe width="560" height="315" src="https://www.youtube.com/embed/d2cP8OTMbwI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

##### [Traffic Lights Detection](#traffic-lights-detection)

**NOTE**: In order to fix the traffic ligth to a specific color in Gazebo, you may modify the controlMission method in the `core_node_mission` file in the ***turtlebot3_autorace_2020/turtlebot3_autorace_core/nodes/*** directory.
{: .notice}

1. Open a new terminal and launch Autorace Gazebo simulation. The `roscore` will be automatically launched with the **roslaunch** command.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

2. Open a new terminal and launch the intrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch
```

3. Open a new terminal and launch the extrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera extrinsic_camera_calibration.launch
```

4. Open a new terminal and launch the traffic light detection node with a calibration option.
```bash
$ roslaunch turtlebot3_autorace_detect detect_traffic_light.launch mode:=calibration
```

5. Open a new terminal to execute the rqt. Open four `rqt_image_view` plugins.
```bash
$ rqt
```

6. Select four topics: `/detect/image_red_light`, `/detect/image_yellow_light`, `/detect/image_green_light`, `/detect/image_traffic_light`.

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_traffic_light_green.png)  
    > Detecting the Green light. The image on the right displays `/detect/image_green_light` topic.

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_traffic_light_yellow.png)  
    > Detecting the Yellow light. The image on the right displays `/detect/image_yellow_light` topic.

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_traffic_light_red.png)  
    > Detecting the Red light. The image on the right displays `/detect/image_red_light` topic.

7. Open a new terminal and excute rqt_reconfigure.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

8. Select `detect_traffic_light` on the left column and adjust parameters properly so that the colors of the traffic light can be well detected.

    ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_traffic_light_reconfigure.png)  
    > Traffic light reconfigure

9. Open the `traffic_light.yaml` file located at ***turtlebot3_autorace_detect/param/traffic_light/***.

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_traffic_light_yaml.png)

10. Write modified values and save the file.

##### [Testing Traffic Light Detection](#testing-traffic-light-detection)

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

5. Open a new terminal and launch the traffic light detection node.
```bash
$ roslaunch turtlebot3_autorace_detect detect_traffic_light.launch
```

6. Open a new terminal and execute the rqt_image_view.
```bash
$ rqt_image_view
```

7. Check each topics: `/detect/image_red_light`, `/detect/image_yellow_light`, `/detect/image_green_light`.

##### [How to Run Traffic Light Mission](#how-to-run-traffic-light-mission)

**WARNING**: Please calibrate the color as described in the [Traffic Lights Detecion](#traffic-lights-detection) section before running the traffic light mission.  
{: .notice--warning}

1. Close all terminals or terminate them with `Ctrl` + `C`

2. Open a new terminal and launch Autorace Gazebo simulation. The `roscore` will be automatically launched with the **roslaunch** command.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Open a new terminal and launch the intrinsic calibration node.
```bash
$ roslaunch turtlebot3_autorace_camera intrinsic_camera_calibration.launch
```

4. Open a new terminal and launch the autorace core node with a specific mission name.
```bash
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch mission:=traffic_light
```

5. Open a new terminal and enter the command below. This will prepare to run the traffic light mission by setting the `decided_mode` to `3`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 3"
```

6. Launch the Gazebo mission node.
```bash
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_mission.launch
```
