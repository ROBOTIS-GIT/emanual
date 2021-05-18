
## Getting Started

{% capture notice_01 %}
**NOTE**
 - This instructions were tested on `Ubuntu 20.04` and `ROS1 Noetic Ninjemys`.
 - Noetic version has been tested with gazebo simulation. 
 - 6.Simulation 과정까지 에러없이 성공적으로 구동되는 pc 환경에서 진행하는것으로 가정합니다.
{% endcapture %}

<div class="notice">{{ notice_01 | markdownify }}</div>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning}

The following instruction describes how to build the autonomous driving TurtleBot3 on ROS by using AutoRace packages.

### [What you need for Autonomous Driving](#what-you-need-for-autonomous-driving)

`Remote PC`

- Laptop, desktop, or other devices with ROS 1.
- 가제보 시뮬레이션 실행 및 autorace packages를 실행합니다.

### [Install Autorace Packages](#install-autorace-packages)

The following instructions describes how to install packages and to calibrate camera.

1. Install AutoRace package on `Remote PC`.
```bash
$ cd ~/catkin_ws/src/
$ git clone -b noetic-devel https://github.com/ROBOTIS-GIT/turtlebot3_autorace_2020.git
$ cd ~/catkin_ws && catkin_make
```

2. Install additional dependent packages on `Remote PC`.
```bash
$ sudo apt install ros-noetic-image-transport ros-noetic-cv-bridge ros-noetic-vision-opencv python3-opencv libopencv-dev ros-noetic-image-proc
```

## [Camera Calibration](#camera-calibration)

Calibrating the camera is very important for autonomous driving. The following describes how to simply calibrate the camera step by step.

### [Camera Imaging Calibration](#camera-imaging-calibration)

 - 카메라 이미지 calibration은 GAZEBO / Actual Robot 둘다 지원하지 않습니다.

### [Intrinsic Camera Calibration](#intrinsic-camera-calibration)

 - Intrinsic Camera Calibration 은 Actual Robot에서만 지원합니다.

### [Extrinsic Camera Calibration](#extrinsic-camera-calibration)

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Launch GAZEBO on `Remote PC`.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera.launch
```

4. Run the extrinsic camera calibration launch file on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=calibration
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera.launch
```

5. Execute rqt on `Remote PC`.
```
$ rqt
```

6. Click **plugins** > **visualization** > **Image view**; Multiple windows will be present.

7. Select `/camera/image_extrinsic_calib/compressed` and `/camera/image_projected_compensated` topics on each monitors.
   - One of two screens will show an image with a red rectangle box. The other one shows the ground projected view (Bird's eye view).

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_extrinsic_calibration.png){: width="1024"}
      > `/camera/image_extrinsic_calib/compressed` and `/camera/image_projected_compensated`


8. Excute rqt_reconfigure on `Remote PC`.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

9. Adjust parameters in `/camera/image_projection` and `/camera/image_compensation_projection`.
   - Change `/camera/image_projection` parameter value. It affects `/camera/image_extrinsic_calib/compressed` topic.
   - Intrinsic camera calibration will transform the image surrounded by the red rectangle, and will show the image that looks from over the lane.

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_extrinsic_calibration_reconfigure.png){: width="1024"}
      > rqt_reconfigure

10. After that, overwrite each values on to the yaml files in turtlebot3_autorace_camera/calibration/extrinsic_calibration/. This will make the camera set its parameters as you set here from next launching.
    
      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_compensation_yaml.png){: width="512" height="216"}
      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_projection_yaml.png){: width="512" height="216"}
      > `compensation.yaml` and `projection.yaml`


### [Settings for Recognition](#settings-for-recognition)

When you complete all the camera calibration, be sure that the calibration is successfully applied to the camera.  
The following instruction describes settings for recognition.

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Launch GAZEBO on `Remote PC`.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Open terminal and use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera_calibration.launch
```

    From now, the following descriptions will mainly adjust `feature detector / color filter` for object recognition. Every adjustment after here is independent to each other's process. However, if you want to adjust each parameters in series, complete every adjustment perfectly, then continue to next.

## [Lane Detection](#lane-detection)

Lane detection package allows Turtlebot3 to drive between two lanes without external influence.

The following instructions describe how to use the lane detection feature and to calibrate camera via rqt.

1. Place TurtleBot3 between yellow and white lanes.

   **NOTE**: Be sure that yellow lane is placed left side of the robot and White lane is placed right side of the robot.
   {: .notice}

2. Launch roscore on `Remote PC`.
```bash
$ roscore
```

3. Launch GAZEBO on `Remote PC`.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

4. Run a intrinsic camera calibration launch file on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera.launch
```

5. Run a extrinsic camera calibration launch file on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera.launch
```

6. Run a lane detection launch file on `Remote PC`
```bash
$ export AUTO_DT_CALIB=calibration
$ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_lane.launch
```

7. Execute rqt on `Remote PC`.
```
$ rqt
```

8. Click **plugins** > **visualization** > **Image view**; Multiple windows will be present.

9. Select three topics at each image view: `/detect/image_yellow_lane_marker/compressed`, `/detect/image_lane/compressed`, `/detect/image_white_lane_marker/compressed`

   - Right (Yellow line) screen show a filtered image, Left screen show a lane image.  
     ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_yellow_lane.png){: width="1024"}
     > Image view of `/detect/image_yellow_lane_marker/compressed` and `/detect/image_lane/compressed` topic

   - Right (White line) screen show a filtered image Left screen show a lane image.
     ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_white_lane.png){: width="1024"}
     > Image view of `/detect/image_white_lane_marker/compressed` and `/detect/image_lane/compressed` topic

10. Execute rqt_reconfigure on `Remote PC`.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

11. Click **Detect Lane** then adjust parameters to do line color filtering.

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_lane_reconfigure.png){: width="1024"}

      > List of Detect Lane Parameters

      **TIP**: Calibration process of line color filtering is sometimes difficult due to physical environment, such as the luminance of light in the room and etc. To make everything quickly, put the value of **lane.yaml** file located in **turtlebot3_auatorace_detect/param/lane/** on the reconfiguration parameter, then start calibration. Calibrate hue low - high value at first. (1) Hue value means the color, and every colors, like `yellow`, `white`, have their own region of hue value (refer to hsv map). Then calibrate saturation low - high value. (2) Every colors have also their own field of saturation. Finally, calibrate the lightness low - high value. (3) In the source code, however, have auto-adjustment function, so calibrating lightness low value is meaningless. Just put the lightness high value to 255. Clearly filtered line image will give you clear result of the lane.
      {: .notice--success}

12. Open **lane.yaml** file located in **turtlebot3_autorace_detect/param/lane/**. You need to write modified values to the file. This will make the camera set its parameters as you set here from next launching.

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_lane_yaml.png)

      > Modified lane.yaml file

13. Close both **rqt_rconfigure** and **turtlebot3_autorace_detect_lane**.

14. Open terminal and use the command on `Remote PC`.
```bash
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_lane.launch
```

15. Check if the results come out correctly.

      - Open terminal and use the command on `Remote PC`.

      ```bash
      $ roslaunch turtlebot3_autorace_driving turtlebot3_autorace_control_lane.launch
      ```

16. After using the commands, TurtleBot3 will start to run.

## [Traffic Sign Detection](#traffic-sign-detection)

TurtleBot3 can detect traffic signs using a node with `SIFT algorithm`, and perform programmed tasks while it drives on a built track. Follow the provided instructions to use Traffic sign detection.

**NOTE**: More edges in the traffic sign increase recognition results from SIFT.
{: .notice}

1. Take pictures of traffic signs by using TurtleBot3's camera and `rqt_image_view` node.
2. Edit the pictures using a photo editor that can be used in Linux OS.
3. Put TurtleBot3 on the lane. Traffic signes should be placed where TurtleBot3 can see them easily.

   **NOTE**: Do not have TurtleBot3 run on the lane yet.
   {: .notice}

4. Launch roscore on `Remote PC`.
```bash
$ roscore
```

5. Execute rqt_image_view on `Remote PC`.
```bash
$ rqt_image_view
```

6. Select `/camera/image_compensated` topic in the select box. A screen will show the view from TurtleBot3.

7. Capture the picture from `Remote PC`，and edit it with a photo editor.

8. Place the edited picture to turtlebot3_autorace package you've placed **/turtlebot3_autorace/turtlebot3_autorace_detect/file/detect_sign/** and rename it as you want. (Although, you should change the file name written in the source **detect_sign.py** file, if you want to change the default file names.)

9. Open terminal and use the command on `Remote PC`.
   ```bash
   $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera.launch
   ```
   <br/>
   ```bash
   $ export AUTO_EX_CALIB=action
   $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera.launch
   ```
   <br/>
   ```bash
   $ export AUTO_DT_CALIB=calibration
   $ export MISSION_MODE={intersection, construction, parking, level_crossing, tunnel}
   $ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_sign.launch
   ```
   <br/>
   **NOTE**: Mission 을 선택해야합니다(표지판 인식이 없는 traffic light mission은 제외)
   {: .notice}

10. Open terminal and use the command on `Remote PC`.
```bash
$ rqt
```

11. Select `/detect/image_traffic_sign/compressed` topic in the select box. A screen will show the result of traffic sign detection.
   
      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_intersection.png){: width="512"}

      > Detect Intersection sign

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_left.png){: width="512"}

      > Detect Left sign

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_right.png){: width="512"}

      > Detect Right sign

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_construction.png){: width="512"}

      > Detect Construction sign 

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_parking.png){: width="512"}

      > Detect Parking sign 

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_level_crossing.png){: width="512"}

      > Detect Level Crossing sign 

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_tunnel.png){: width="512"}

      > Detect Tunnel sign 


## [TurtleBot3 AutoRace 2020](#turtlebot3-autorace-2020)

![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_rbiz_challenge_2017_robots_1.png)

The AutoRace is a competition for autonomous driving robot platforms.  
To provide various conditions for a robot application development, the game provide structural regulation as less as possible. Provided open sources are based on ROS, and can be applied to this competition. The contents can be continually updated. Join the competition and show your skill.

**WARNING**: Be sure to read [Autonomous Driving](#autonomous-driving) in order to start missions.
{: .notice--warning}

### [Mission 1: Traffic Lights](#mission-1-traffic-lights)

Traffic Light is the first mission of AutoRace. TurtleBot3 recognizes the traffic lights and starts the course.

![](/assets/images/platform/turtlebot3/autonomous_driving/1.traffic_light.gif){: width="960"}

#### [Camera Calibration for Traffic Lights](#camera-calibration-for-traffic-lights)

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Open terminal and use the command on `Remote PC`.

   ```bash
   $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera.launch
   ```
   
   Open new terminal and use the command on `Remote PC`.

   ```bash
   $ export AUTO_EX_CALIB=action
   $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera.launch
   ```

   Open new terminal and use the command on `Remote PC`.

   ```bash
   $ export AUTO_DT_CALIB=calibration
   $ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_traffic_light.launch
   ```

3. Execute rqt on Remote PC
```bash
$ rqt
```

4. Select four topics: `/detect/image_red_light`, `/detect/image_yellow_light`, `/detect/image_green_light`, `/detect/image_traffic_light`.

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_traffic_light_green.png){: width="1024"}
      > Detect Green Light

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_traffic_light_yellow.png){: width="1024"}
      > Detect Yellow Light

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_traffic_light_red.png){: width="1024"}
      > Detect Red Light


5. Excute rqt_reconfigure.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

6. Adjust parameters regarding traffic light topics to enhance the detection of traffic signs. The way of adjusting parameters is similar to step 5 at [Lane Detection](#lane-detection).

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_traffic_light_reconfigure.png){: width="1024"}
      > Traffic light reconfigure

7. Open **traffic_light.yaml** file located at **turtlebot3_autorace_detect/param/traffic_light/**.

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_traffic_light_yaml.png)
      > Traffic light yaml

8. Write modified values to the file and save.

9. Terminate both running rqt and rqt_reconfigure in order to test, from the next step, the calibration whether or not it is successfully applied.

10. Use the command on `Remote PC`.
```bash
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_traffic_light_detect turtlebot3_autorace_detect_traffic_light.launch
```

11. Execute rqt_image_view.
```bash
$ rqt_image_view
```

12. See traffic light calibration is successfully applied.

#### [Run Traffic Light Mission](#run-traffic-light-mission)

**WARNING**: Be sure to read [Camera Calibration for Traffic Lights](#camera-calibration-for-traffic-lights) before running the traffic light node.  
{: .notice--warning}

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Launch GAZEBO on `Remote PC`.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ export MISSION_MODEL=traffic_light
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch
```

5. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 3"
```

6. Launch GAZEBO mission on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_mission.launch
```

### [Mission 2: Intersection](#mission-2-intersection)

Intersection is the second mission of AutoRace. TurtleBot3 detects a specific traffic sign (such as a curve sign) at the intersection course, and go to the given direction.

![](/assets/images/platform/turtlebot3/autonomous_driving/2.intersection.gif){: width="960"}

#### [How to Run Intersection Mission](#how-to-run-intersection-mission)

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Launch GAZEBO on `Remote PC`.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ export MISSION_MODEL=intersection
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch
```

5. Launch GAZEBO mission on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_mission.launch
```

6. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```


### [Mission 3: Construction](#mission-3-construction)

Construction is the third mission of AutoRace. TurtleBot3 avoids constructions on the track while it is driving.

![](/assets/images/platform/turtlebot3/autonomous_driving/3.construction.gif){: width="960"}

#### [How to Run Construction Mission](#how-to-run-construction-mission)

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Launch GAZEBO on `Remote PC`.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ export MISSION_MODEL=construction
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch
```

5. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

6. Launch GAZEBO mission on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

### [Mission 4: Parking](#mission-4-parking)

Parking is the fourth mission of AutoRace. TurtleBot3 detects the parking sign, and park itself at a parking lot.

![](/assets/images/platform/turtlebot3/autonomous_driving/4.parking.gif){: width="960"}

#### [How to Run Parking Mission](#how-to-run-parking-mission)

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Launch GAZEBO on `Remote PC`.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ export MISSION_MODEL=parking
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch
```

5. Use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_mission.launch
```

6. Launch GAZEBO mission on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```


### [Mission 5: Level Crossing](#mission-5-level-crossing)

Level Crossing is the fifth mission of AutoRace. When TurtleBot3 encounters the level crossing, it stops driving, and wait until the level crossing opens.

![](/assets/images/platform/turtlebot3/autonomous_driving/5.level_crossing.gif){: width="960"}

#### [Camera Calibration for Level Crossing](#camera-calibration-for-level-crossing)

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Open terminal and use the command on `Remote PC`.

      ```bash
      $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera.launch
      ```
      
      Open new terminal and use the command on `Remote PC`.

      ```bash
      $ export AUTO_EX_CALIB=action
      $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera.launch
      ```

      Open new terminal and use the command on `Remote PC`.

      ```bash
      $ export AUTO_DT_CALIB=calibration
      $ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_level_crossing.launch
      ```

3. Execute rqt on Remote PC
```bash
$ rqt
```

4.  Select two topics: `/detect/image_level_color_filtered/compressed`, `/detect/image_level/compressed`.

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_detect_level.png){: width="1024"}
      > Detect Level crossing


5. Excute rqt_reconfigure.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

6. Adjust parameters regarding traffic light topics to enhance the detection of traffic signs. The way of adjusting parameters is similar to step 5 at [Lane Detection](#lane-detection).

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_level_reconfigure.png){: width="1024"}
      > Level crossing reconfigure

7. Open **level.yaml** file located at **turtlebot3_autorace_detect/param/level/**.

      ![](/assets/images/platform/turtlebot3/autonomous_driving/noetic_level_yaml.png)
      > Level crossing yaml

8. Write modified values to the file and save.

9. Terminate both running rqt and rqt_reconfigure in order to test, from the next step, the calibration whether or not it is successfully applied.

10.  Use the command on `Remote PC`.
```bash
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_traffic_light_detect turtlebot3_autorace_detect_level.launch
```

11. Execute rqt_image_view.
```bash
$ rqt_image_view
```


#### [How to Run Level Crossing Mission](#how-to-run-level-crossing-mission)

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Launch GAZEBO on `Remote PC`.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ export MISSION_MODEL=level_crossing
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch
```

5. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

6. Launch GAZEBO mission on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_mission.launch
```

### [Mission 6: Tunnel](#mission-6-tunnel)

Tunnel is the sixth mission of AutoRace. TurtleBot3 passes the tunnel successfully.

![](/assets/images/platform/turtlebot3/autonomous_driving/6.tunnel.gif){: width="960"}

#### [How to Run Tunnel Mission](#how-to-run-tunnel-mission)

1. Launch roscore on `Remote PC`.
```bash
$ roscore
```

2. Launch GAZEBO on `Remote PC`.
```bash
$ roslaunch turtlebot3_gazebo turtlebot3_autorace_2020.launch
```

3. Use the command on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ export MISSION_MODEL=tunnel
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch
```

5. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

6. Launch GAZEBO mission on `Remote PC`.
```bash
$ roslaunch turtlebot3_autorace_core turtlebot3_autorace_mission.launch
