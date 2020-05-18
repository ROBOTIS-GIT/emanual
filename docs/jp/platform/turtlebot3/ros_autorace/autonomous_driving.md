---
layout: archive
lang: en
ref: autonomous_driving
read_time: true
share: true
author_profile: false
permalink: /docs/en/platform/turtlebot3/autonomous_driving/
sidebar:
  title: TurtleBot3
  nav: "turtlebot3"
product_group: turtlebot3
page_number: 24
---

<div style="counter-reset: h1 12"></div>

# [[ROS 1] Autonomous Driving](#ros-1-autonomous-driving)

{% capture notice_01 %}
**NOTE**: This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{% endcapture %}
<div class="notice">{{ notice_01 | markdownify }}</div>

The contents in e-Manual can be updated without a previous notice. Therefore, some video may differ from the contents in e-Manual.
{: .notice--warning} 

The following instruction describes how to build the autonomous driving TurtleBot3 on ROS by using AutoRace packages. 

## [What you need for Autonomous Driving](#what-you-need-for-autonomous-driving)

`TurtleBot3 Burger`  
- It is the basic model to use AutoRace packages for the autonomous driving on ROS. 
- Provided source codes, AutoRace Packages, are made based on TurtleBot3 Burger.

`Remote PC`  
- It communicates with an single board computer (SBC) on Turtlebot3.
- Laptop, desktop, or other devices with ROS 1.

`Raspberry Pi camera module with a camera mount`  
- You can use a different module if ROS supports it.
- Source codes provided to calibrate the camera are created based on ([Fisheye Lens](https://www.waveshare.com/rpi-camera-g.htm)) module.   

`AutoRace tracks and objects`  
- Download 3D CAD files for AutoRace tracks, Traffic signs, traffic lights and other objects at [ROBOTIS_GIT/autorace](https://github.com/ROBOTIS-GIT/autorace_track).
- Download a refree system at [ROBOTIS-GIT/autorace_referee](https://github.com/ROBOTIS-GIT/autorace_referee)

## [Install Autorace Packages](#install-autorace-packages)

The following instructions describes how to install packages and to calibrate camera.

1. Install AutoRace package on both `Remote PC` and `SBC`. 
``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_autorace_2020.git
$ cd ~/catkin_ws && catkin_make
```

2. Install additional dependent packages on both `Remote PC` and `SBC`.  
``` bash
$ sudo apt-get install ros-kinetic-image-transport ros-kinetic-cv-bridge ros-kinetic-vision-opencv python-opencv libopencv-dev ros-kinetic-image-proc
```

3. You need to [Calibrate a Camera on SBC](#calibrate-a-camera-on-sbc).

## [Calibrate a Camera on SBC](#calibrate-a-camera-on-sbc)

Calibrating the camera is very important for autonomous driving. The following describes how to simply calibrate the camera step by step. 

### [Camera Imaging Calibration](#camera-imaging-calibration)

1. Launch roscore on `Remote PC`.
``` bash
$ roscore
```

2. Trigger the camera on `SBC`.
``` bash
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_camera_pi.launch
```

    **WARNING**: Be sure to specify `${Autorace_Misson}` (i.e, **roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_camera_pi.launch**)
    {: .notice--warning}

3. Execute rqt_image_view on `Remote PC`.
``` bash
$ rqt_image_view
```

4. Select **/camera/image/compressed** (or **/camera/image/**) topic on the check box.

    ![](/assets/images/platform/turtlebot3/autonomous_driving/tb3_click_compressed.png)

5. Excute rqt_reconfigure on `Remote PC`.
``` bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

6. Click **camera**, and modify parameter value in order to see clear images from the camera. 

    ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_reconfigure_camera_yaml_edit_01.png)

7. Open **camera.yaml** file located in **turtlebot3_autorace_[Autorace Misson]_camera/calibration/camera_calibration** folder.

8. Write modified values to the file.

    ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_reconfigure_camera_yaml_edit_02.png)

### [Intrinsic Camera Calibration](#intrinsic-camera-calibration)

Print a checkerboard on A4 size paper. The checkerboard is used for Intrinsic Camera Calibration.
- The checkerboard is stored at **turtlebot3_autorace_camera/data/checkerboard_for_calibration.pdf**
- Modify value of parameters in **turtlebot3_autorace_camera/launch/turtlebot3_autorace_intrinsic_camera_calibration.launch**
- For detailed information on the camera calibration, see [Camera Calibration manual](http://wiki.ros.org/camera_calibration) from ROS Wiki.

  ![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_checkerboard.png)
  > Checkerboard

1. Launch roscore on `Remote PC`.
``` bash
$ roscore
```

2. Trigger the camera on `SBC`.
``` bash
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_camera_pi.launch
```

    **WARNING**: Be sure to specify `${Autorace_Misson}` (i.e, **roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_camera_pi.launch**)
    {: .notice--warning}

3. Run a intrinsic camera calibration launch file on `Remote PC`.
``` bash
$ export AUTO_IN_CALIB=calibration
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Use the checkerboard to calibrate the camera, and click **CALIBRATE**.   

    ![](/assets/images/platform/turtlebot3/autonomous_driving/intrinsic_camera_calibration_test.png)

5. Click **Save** to save the intrinsic calibration data.  

    ![](/assets/images/platform/turtlebot3/autonomous_driving/intrinsic_camera_calibration_capture.png)

6. **calibrationdata.tar.gz** folder will be created at **/tmp** folder.   

    ![](/assets/images/platform/turtlebot3/autonomous_driving/camera_320_240_saved_path_01.png)

7. Extract **calibrationdata.tar.gz** folder, and open **ost.yaml**. 
    
    ![](/assets/images/platform/turtlebot3/autonomous_driving/open_ost_yaml.png)  
    > ost.yaml  
    
    ![](/assets/images/platform/turtlebot3/autonomous_driving/ost_yaml.png)  
    > Intrinsic Calibration Data in ost.yaml

8. Copy and paste the data from **ost.yaml** to **camerav2_320x240_30fps.yaml**.
    
    ![](/assets/images/platform/turtlebot3/autonomous_driving/open_320_240_30fps.png)  
    > camerav2_320x240_30fps.yaml
    
    ![](/assets/images/platform/turtlebot3/autonomous_driving/camerav2_320_240_30fps.png)
    > Intrinsic Calibration Data in camerav2_320x240_30fps.yaml

### [Extrinsic Camera Calibration](#extrinsic-camera-calibration)

1. Launch roscore on `Remote PC`.
``` bash
$ roscore
```

2. Trigger the camera on `SBC`.
``` bash
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_camera_pi.launch
```

    **WARNING**: Be sure to specify `${Autorace_Misson}` (i.e, **roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_camera_pi.launch**)
    {: .notice--warning}

3. Use the command on `Remote PC`.
``` bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Run the extrinsic camera calibration launch file on `Remote PC`.
``` bash
$ export AUTO_EX_CALIB=calibration
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_extrinsic_camera_calibration.launch
```

5. Execute rqt on `Remote PC`.
```
$ rqt
```
    
6. Click **plugins** > **visualization** > **Image view**; Multiple windows will be present.

7. Select `/camera/image_extrinsic_calib/compressed` and `/camera/image_projected_compensated` topics on each monitors. 
  - One of two screens will show an image with a red rectangle box. The other one shows the ground projected view (Bird's eye view). 
  
    ![](/assets/images/platform/turtlebot3/autonomous_driving/camera_image_extrinsic_calib_compressed.png)
    > `/camera/image_extrinsic_calib/compressed` topic
    
    ![](/assets/images/platform/turtlebot3/autonomous_driving/camera_image_projected_compensated.png)
    > `/camera/image_projected_compensated` topic

6. Excute rqt_reconfigure on `Remote PC`.
``` bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

7. Adjust parameters in `/camera/image_projection` and `/camera/image_compensation_projection`.
  - Change `/camera/image_projection` parameter value. It affects `/camera/image_extrinsic_calib/compressed` topic.  
  - Intrinsic camera calibration will transform the image surrounded by the red rectangle, and will show the image that looks from over the lane.
    
    ![](/assets/images/platform/turtlebot3/autonomous_driving/camera_image_projection_compensation_projection.png)
    > rqt_reconfigure
  
    ![](/assets/images/platform/turtlebot3/autonomous_driving/modify_image_projection_image_extrinsic_calib.png)
    > Result from parameter modification.   
  
### [Settings for Recognition](#settings-for-recognition)

When you complete all the camera calibration (Camera Imaging Calibration, Intrinsic Calibration, Extrinsic Calibration), be sure that the calibration is successfully applied to the camera.  
The following instruction describes settings for recognition. 

1. Launch roscore on `Remote PC`.
``` bash
$ roscore
```

2. Trigger the camera on `SBC`.
``` bash
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_camera_pi.launch
```

    **WARNING**: Be sure to specify `${Autorace_Misson}` (i.e, **roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_camera_pi.launch**)
    {: .notice--warning}

3. Run a intrinsic camera calibration launch file on `Remote PC`.
``` bash
$ export AUTO_IN_CALIB=action
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Open terminal and use the command on `Remote PC`.
``` bash
$ export AUTO_EX_CALIB=action
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_extrinsic_camera_calibration.launch
```
    From now, the following descriptions will mainly adjust `feature detector / color filter` for object recognition. Every adjustment after here is independent to each other's process. However, if you want to adjust each parameters in series, complete every adjustment perfectly, then continue to next.

## [Lane Detection](#lane-detection)

Lane detection package allows Turtlebot3 to drive between two lanes without external influence.  

The following instructions describe how to use the lane detection feature and to calibrate camera via rqt.

1. Place TurtleBot3 between yellow and white lanes.
    
    **NOTE**: Be sure that yellow lane is placed left side of the robot and White lane is placed right side of the robot. 
    {: .notice}

2. Launch roscore on `Remote PC`.
``` bash
$ roscore
```

3. Trigger the camera on `SBC`.
``` bash
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_camera_pi.launch
```

    **WARNING**: Be sure to specify `${Autorace_Misson}` (i.e, **roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_camera_pi.launch**)
    {: .notice--warning}

3. Run a intrinsic camera calibration launch file on `Remote PC`.
``` bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Run a extrinsic camera calibration launch file on `Remote PC`.
``` bash
$ export AUTO_EX_CALIB=action
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_extrinsic_camera_calibration.launch
```

5. Run a lane detection launch file on `Remote PC`
``` bash
$ export AUTO_DT_CALIB=calibration
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_detect turtlebot3_autorace_detect_lane.launch
```

3. Execute rqt on `Remote PC`.
```
$ rqt
```

4. Click **plugins** > **visualization** > **Image view**; Multiple windows will be present.
  
5. Select three topics at each image view: `/detect/image_yellow_lane_marker/compressed`, `/detect/image_lane/compressed`, `/detect/image_white_lane_marker/compressed`
    - Left (Yellow line) and Right (White line) screen show a filtered image.      
    ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_yellow_lane_detection.png)  
    > Image view of `/detect/image_yellow_lane_marker/compressed` topic    
    
    ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_white_lane_detection.png)
    > Image view of `/detect/image_white_lane_marker/compressed` topic
    
    - Center screen is the view of the camera from TurtleBot3.      
    ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_image_lane.png)
    > Image view of `/detect/image_lane/compressed` topic

4. Execute rqt_reconfigure on `Remote PC`.
``` bash
$ rosrun rqt_reconfigure rqt_reconfigure
```
      
6. Click **Detect Lane** then adjust parameters to do line color filtering.

      ![](/assets/images/platform/turtlebot3/autonomous_driving/result_of_ybw_configuration_01.png)  
      > List of Detect Lane Parameters
      
      ![](/assets/images/platform/turtlebot3/autonomous_driving/result_of_ybw_configuration_02.png)
      > Filtered Image resulted from adjusting parameters at rqt_reconfigure
    
    **TIP**: Calibration process of line color filtering is sometimes difficult due to physical environment, such as the luminance of light in the room and etc. To make everything quickly, put the value of **lane.yaml** file located in **turtlebot3_autorace_[Autorace_Misson]_detect/param/lane/** on the reconfiguration parameter, then start calibration. Calibrate hue low - high value at first. (1) Hue value means the color, and every colors, like `yellow`, `white`, have their own region of hue value (refer to hsv map). Then calibrate saturation low - high value. (2) Every colors have also their own field of saturation. Finally, calibrate the lightness low - high value. (3) In the source code, however, have auto-adjustment function, so calibrating lightness low value is meaningless. Just put the lightness high value to 255. Clearly filtered line image will give you clear result of the lane.
    {: .notice--success}

7. Open **lane.yaml** file located in **turtlebot3_autorace_[Autorace_Misson]_detect/param/lane/**. You need to write modified values to the file. This will make the camera set its parameters as you set here from next launching. 

    ![](/assets/images/platform/turtlebot3/autonomous_driving/write_lane_yaml.png)
    
6. Close both **rqt_rconfigure** and **turtlebot3_autorace_detect_lane**.

7. Open terminal and use the command on `Remote PC`.  
``` bash
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_detect turtlebot3_autorace_detect_lane.launch
```

8. Check if the results come out correctly.
    
    - Open terminal and use the command on `Remote PC`.
    ``` bash
    $ roslaunch turtlebot3_autorace_${Autorace_Misson}_control turtlebot3_autorace_control_lane.launch
    ```

    - Open terminal and use the command on `Remote PC`. 
    ``` bash
    $ roslaunch turtlebot3_bringup turtlebot3_robot.launch
    ```
    
9. After using the commands, TurtleBot3 will start to run.

## [Traffic Sign Detection](#traffic-sign-detection)

TurtleBot3 can detect traffic signs using a node with `SIFT algorithm`, and perform programmed tasks while it drives on a built track. Follow the provided instructions to use Traffic sign detection. 

**NOTE**: More edges in the traffic sign increase recognition results from SIFT.
{: .notice} 

1. Take pictures of traffic signs by using TurtleBot3's camera and `rqt_image_view` node.
2. Edit the pictures using a photo editor that can be used in Linux OS.
3. Put TurtleBot3 on the lane. Traffic signes should be placed where TurtleBot3 can see them easily.

    **NOTE**: Do not have TurtleBot3 run on the lane yet. 
    {: .notice}

4. Execute rqt_image_view on `Remote PC`.
```
$ rqt_image_view
```

4. Select `/camera/image_compensated` topic in the select box. A screen will show the view from TurtleBot3.
5. Capture the picture from `Remote PC`，and edit it with a photo editor. 
6. Place the edited picture to turtlebot3_autorace package you've placed **/turtlebot3_autorace/turtlebot3_autorace_detect/file/detect_sign/** and rename it as you want. (Although, you should change the file name written in the source **detect_sign.py** file, if you want to change the default file names.)

7. Open terminal and use the command on `Remote PC`.
``` bash
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_detect turtlebot3_autorace_detect_sign.launch
```

8. Open terminal and use the command on `Remote PC`.
```bash
$ rqt_image_view
```

9. Select `/detect/image_traffic_sign/compressed` topic in the select box. A screen will show the result of traffic sign detection.

## [TurtleBot3 AutoRace 2020](#turtlebot3-autorace-2020)

![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_rbiz_challenge_2017_robots_1.png)

The AutoRace is a competition for autonomous driving robot platforms.  
To provide various conditions for a robot application development, the game provide structural regulation as less as possible. Provided open sources are based on ROS, and can be applied to this competition. The contents can be continually updated. Join the competition and show your skill.

**WARNING**: Be sure to read [Autonomous Driving](#autonomous-driving) in order to start missions.
{: .notice--warning}

### [Mission 1: Traffic Light](#mission-1-traffic-light)

Traffic Light is the first mission of AutoRace. TurtleBot3 recognizes the traffic lights and starts the course.

<iframe width="560" height="315" src="https://www.youtube.com/embed/JNj_STs3OSg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### [Camera Calibration for Traffic Lights](#camera-calibration-for-traffic-lights)

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

8. Use the command on `Remote PC`.
```bash
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_traffic_light_detect turtlebot3_autorace_detect_traffic_light.launch
```

10. Execute rqt_image_view.
```bash
$ rqt_image_view
```

11. See traffic light calibration is successfully applied. 

#### [Run Traffic Light Mission](#run-traffic-light-mission)

**WARNING**: Be sure to read [Camera Calibration for Traffic Lights](#camera-calibration-for-traffic-lights) before running the traffic light node.   
{: .notice--warning}

1. Use the command on `Remote PC`.
``` bash
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

### [Mission 2: Intersection](#mission-2-intersection)

Intersection is the second mission of AutoRace. TurtleBot3 detects a specific traffic sign (such as a curve sign) at the intersection course, and go to the given direction. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/8K4GMbfXFXI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### [How to Run Intersection Mission](#how-to-run-intersection-mission)

1. Use the command on `Remote PC`.
```bash
$ export AUTO_IN_CALIB=action
$ roslaunch turtlebot3_autorace_intersection_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

2. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_intersection_core turtlebot3_autorace_core.launch
```

3. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

### [Mission 3: Construction](#mission-3-construction)

Construction is the third mission of AutoRace. TurtleBot3 avoids constructions on the track while it is driving.

<iframe width="560" height="315" src="https://www.youtube.com/embed/88nXiX8UUtw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### [How to Run Construction Mission](#how-to-run-construction-mission)

1. Use the command on `Remote PC`. 
```bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_construction_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

2. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_construction_core turtlebot3_autorace_core.launch
```

3. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

### [Mission 4: Parking](#mission-4-parking)

Parking is the fourth mission of AutoRace. TurtleBot3 detects the parking sign, and park itself at a parking lot.

<iframe width="560" height="315" src="https://www.youtube.com/embed/F3ZG8PlagaA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### [How to Run Parking Mission](#how-to-run-parking-mission)

1. Use the command on `Remote PC`.
```bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_parking_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

2. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_parking_core turtlebot3_autorace_core.launch
```

3. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

### [Mission 5: Level Crossing](#mission-5-level-crossing)

Level Crossing is the fifth mission of AutoRace. When TurtleBot3 encounters the level crossing, it stops driving, and wait until the level crossing opens. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/xyBaLeg4Ifk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### [Camera Calibration for Level Crossing](#camera-calibration-for-level-crossing)

1. Use the command on `Remote PC`.
```bash
$ export AUTO_DT_CALIB=calibration
$ roslaunch turtlebot3_autorace_level_crossing_detect turtlebot3_autorace_detect_level.launch
```

2. Execute rqt
```bash
$ rqt
```

3. Select two topics: `/detect/image_level_color_filtered`, `/detect/image_level`

3. Execute rqt_reconfigure.
```bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

4. Select `/detect_level` and adjust parameters regarding Level Crossing topics to enhance the detection of the level crossing object. The way of adjusting parameters is similar to step 5 at [Lane Detection](#lane-detection). 

5. Open **level.yaml** located at **turtlebot3_autorace_stop_bar_detect/param/level/**.

6. Write modified values to the file and save. 

5. Run a detect level lanuch file.
```bash
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_level.launch
```

#### [How to Run Level Crossing Mission](#how-to-run-level-crossing-mission)

1. Use the command on `Remote PC`.
```bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_level_crossing_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

2. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ roslaunch turtlebot3_autorace_level_crossing_core turtlebot3_autorace_core.launch
```

3. Use the command on `Remote PC`.
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

### [Mission 6: Tunnel](#mission-6-tunnel)

Tunnel is the sixth mission of AutoRace. TurtleBot3 passes the tunnel successfully. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/QtBx_MKLsPs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### [How to Run Tunnel Mission](#how-to-run-tunnel-mission)

1. Use the command on `Remote PC`.
```bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_tunnel_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

3. Use the command on `Remote PC`.
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ export TURTLEBOT3_MODEL=burger
$ roslaunch turtlebot3_autorace_tunnel_core turtlebot3_autorace_core.launch
```

4. Use the command on `Remote PC`.
``` bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```
