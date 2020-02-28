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

The following instruction describes how to build autonomous driving TurtleBot3 on ROS using AutoRace packages. 

## [What you need for Autonomous Driving](#what-you-need-for-autonomous-driving)

`TurtleBot3 Burger`  
- It is the basic model to use Autonomous Driving feature. 
- Provided source codes, AutoRace Packages, are made based on TurtleBot3 Burger.

`Remote PC`  
- It communicates with an single board computer (SBC) on Turtlebot3.
- Laptop, desktop, or other devices which run ROS 1, can be used.  

`Raspberry Pi camera module with a camera mount`  
- You can use a different module if it can be used on ROS.
- Source codes provided to calibrate the camera are made based on ([Fisheye Lens](https://www.waveshare.com/rpi-camera-g.htm)) module.   

`AutoRace tracks and objects`  
- Download 3D CAD files for AutoRace tracks, Traffic signs, traffic lights and other objects at [ROBOTIS_GIT/autorace](https://github.com/ROBOTIS-GIT/autorace_track).
- Download a refree system at [ROBOTIS-GIT/autorace_referee](https://github.com/ROBOTIS-GIT/autorace_referee)

## [Getting Started](#getting-started)

### [Install Autorace Packages](#install-autorace-packages)

The following instructions describes how to install packages and to calibrate camera.

1. Install AutoRace package on both `Remote PC` and `SBC`. 
``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_autorace.git
$ cd ~/catkin_ws && catkin_make
```

2. Install additional dependent packages on both `Remote PC` and `SBC`.  
``` bash
$ sudo apt-get install ros-kinetic-image-transport ros-kinetic-cv-bridge ros-kinetic-vision-opencv python-opencv libopencv-dev ros-kinetic-image-proc
```

3. Calibrate Camera.
    - See [How to Calibrate Camera](#how-to-calibrate-camera) step by step.

### [How to Calibrate Camera](#how-to-calibrate-camera)

#### [Camera Imaging Calibration](#camera-imaging-calibration)

1. Lanuch roscore on `Remote PC`.
``` bash
$ roscore
```

2. Trigger the camera on `SBC`
``` bash
$ roslaunch turtlebot3_autorace_${Autorace_Misson}_camera turtlebot3_autorace_camera_pi.launch
```

    **WARNING**: Be sure to specify `${Autorace_Misson}` (i.e, **roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_camera_pi.launch**)
    {: .notice--warning}

3. Execute rqt_image_view on `Remote PC`.
``` bash
$ rqt_image_view
```

4. Click **/camera/image/compressed** (or **/camera/image/**) topic on the check box.

    ![](/assets/images/platform/turtlebot3/autonomous_driving/tb3_click_compressed.png)

5. Excute rqt_reconfigure on `Remote PC`.
``` bash
$ rosrun rqt_reconfigure rqt_reconfigure
```

6. Click **camera**, and modify parameter value in order to see clear images from the camera. 

    ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_reconfigure_camera_yaml_edit.png)

7. Open **camera.yaml** file located in **turtlebot3_autorace_[Autorace_Misson]_camera/calibration/camera_calibration** folder, and write modified values to the file.

    ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_reconfigure_camera_yaml_edit_02.png)

#### [Intrinsic Camera Calibration](#tutorials-42-intrinsic-camera-calibration)

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

3. Execute the calibration window on `Remote PC` .
``` bash
$ export AUTO_IN_CALIB=calibration
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Use the checkerboard to calibrate the camera, and click **CALIBRATE**.   

    ![](/assets/images/platform/turtlebot3/autonomous_driving/intrinsic_camera_calibration_test.png)

5. Save the data.  

    ![](/assets/images/platform/turtlebot3/autonomous_driving/intrinsic_camera_calibration_capture.png)

6. The data will be written to **camerav2_320x240_30fps.yaml** at **turtlebot3_autorace_camera/calibration/intrinsic_calibration**    
    ![](/assets/images/platform/turtlebot3/autonomous_driving/camerav2_320_240_30fps.png)

#### [Extrinsic Camera Calibration](#tutorials-43-extrinsic-camera-calibration)

1. Launch roscore on `Remote PC`.
``` bash
$ roscore
```

2. Trigger the camera on `SBC`.
``` bash
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_camera_pi.launch
```

3. Open terminal and use the command on `Remote PC`.
``` bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Open terminal and use the command on `Remote PC`.
``` bash
$ export AUTO_EX_CALIB=calibration
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera_calibration.launch
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
  
#### [Settings for Recognition](#settings-for-recognition)

**NOTE**: Be sure to proceed to this instruction after all calibration steps are successfully complete.
{: .notice}

1. Launch roscore on `Remote PC`.
``` bash
$ roscore
```

2. Trigger the camera on `SBC`.
``` bash
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_camera_pi.launch
```

3. Open terminal and use the command on `Remote PC`.
``` bash
$ export AUTO_IN_CALIB=action
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Open terminal and use the command on `Remote PC`.
``` bash
$ export AUTO_EX_CALIB=action
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera_calibration.launch
```
    From now, the following descriptions will mainly adjust `feature detector / color filter` for object recognition. Every adjustment after here is independent to each other's process. However, if you want to adjust each parameters in series, complete every adjustment perfectly, then continue to next.

### [Lane Detection](#lane-detection)

Lane detection package allows Turtlebot3 to drive between two lanes without external influence.  

The followings instructions describe how to use the lane detection feature and to calibrate camera via rqt.

1. Place TurtleBot3 between yellow and white lanes.
    
    **NOTE**: Be sure that yellow lane is placed left side of the robot and White lane is placed right side of the robot. 
    {: .notice}

2. Launch roscore on `Remote PC`.
``` bash
$ roscore
```

3. Trigger the camera on `SBC`.
``` bash
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_camera_pi.launch
```

3. Open terminal and use the command on `Remote PC`.
``` bash
$ export AUTO_IN_CALIB=action
$ export GAZEBO_MODE=false
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
```

4. Open terminal and use the command on `Remote PC`.
``` bash
$ export AUTO_EX_CALIB=action
$ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera_calibration.launch
```

5. Use the command on `Remote PC`.
``` bash
$ export AUTO_DT_CALIB=calibration
$ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_lane.launch
```

3. Execute rqt on `Remote PC`.
```
$ rqt
```

4. Click **plugins** > **visualization** > **Image view**; Multiple windows will be present.
  
5. Select three topics: `/detect/image_yellow_lane_marker/compressed`, `/detect/image_lane/compressed`, and `/detect/image_white_lane_marker/compressed`
    - Left (Yellow line) and Right (White line) screen show a filtered image.      
    ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_yellow_lane_detection.png)  
    > `/detect/image_yellow_lane_marker/compressed` topic    
    
    ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_white_lane_detection.png)
    > `/detect/image_white_lane_marker/compressed` topic
    
    - Center screen is a view of the camera from TurtleBot3.      
    ![](/assets/images/platform/turtlebot3/autonomous_driving/rqt_image_lane.png)
    > `/detect/image_lane/compressed` topic

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
$ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_lane.launch
```

8. Check if the results come out correctly.
    
    - Open terminal and use the command on `Remote PC`.
    ``` bash
    $ roslaunch turtlebot3_autorace_control turtlebot3_autorace_control_lane.launch
    ```

    - Open terminal and use the command on `Remote PC`. 
    ``` bash
    $ roslaunch turtlebot3_bringup turtlebot3_robot.launch
    ```
    
9. After using the commands, TurtleBot3 will start to run.

### [Traffic Sign Detection](#traffic-sign-detection)

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

4. Click `/camera/image_compensated` topic in the select box. A screen will show the view from TurtleBot3.
5. Capture the picture from `Remote PC`，and edit it with a photo editor. 
6. Place the edited picture to turtlebot3_autorace package you've placed **/turtlebot3_autorace/turtlebot3_autorace_detect/file/detect_sign/** and rename it as you want. (Although, you should change the file name written in the source **detect_sign.py** file, if you want to change the default file names.)

7. Open terminal and use the command on `Remote PC`.
``` bash
$ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_sign.launch
```

8. Open terminal and use the command on `Remote PC`.
```bash
$ rqt_image_view
```

9. Click `/detect/image_traffic_sign/compressed` topic in the select box. A screen will show the result of traffic sign detection.

## [TurtleBot3 AutoRace 2020](#turtlebot3-autorace-2020)

![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_rbiz_challenge_2017_robots_1.png)

The AutoRace is a competition for autonomous driving robot platforms.  
To provide various conditions for a robot application development, the game provide structural regulation as less as possible. Provided open sources are based on ROS, and can be applied to this competition. The contents can be continually updated. Join the competition and show your skill.

### [AutoRace Missons](#autorace-missions)

**NOTE**: Be sure to read [Autonomous Driving](#autonomous-driving) in order to start missions.
{: .notice}

#### [Mission 1: Traffic Light](#mission-1-traffic-light)

Traffic Light is the first mission of AutoRace. TurtleBot3 should see the sign of traffic lights, perfectly compute the given situation, and then start to drive (or wait until the proper traffic sign)

1. Open terminal and use the command on `Remote PC`.
``` bash
$ export AUTO_IN_CALIB=action
```

2. Open terminal and use the command on `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_traffic_light_camera turtlebot3_autorace_intrinsic_camera_calibration.launch 
```

3. Open terminal and use the command on `Remote PC`
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
```

4. Open terminal and use the command on `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_traffic_light_core turtlebot3_autorace_core.launch 
```

5. Open terminal and use the command on `Remote PC`
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 3"
```

#### [Mission 2: Intersection](#mission-2-intersection)

Intersection is the second mission of AutoRace. TurtleBot3 should detect the specific sign (such as a curve sign) and go to the right direction at the intersection course.

1. Open terminal and use the command on `Remote PC`
```bash
$ export AUTO_IN_CALIB=action
```

2. Open terminal and use the command on `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_intersection_camera turtlebot3_autorace_intrinsic_camera_calibration.launch 
```

3. Open terminal and use the command on `Remote PC`
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
```

4. Open terminal and use the command on `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_intersection_core turtlebot3_autorace_core.launch 
```

5. Open terminal and use the command on `Remote PC`
```bash
rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

#### [Mission 3: Construction](#mission-3-construction)

Construction is the third mission of AutoRace. TurtleBot3 should avoid constructions on the road. 

1. Open terminal and use the command on `Remote PC` 
```bash
$ export AUTO_IN_CALIB=action
```

2. Open terminal and use the command on `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_construction_camera turtlebot3_autorace_intrinsic_camera_calibration.launch 
```

3. Open terminal and use the command on `Remote PC`
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
```

4. Open terminal and use the command on `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_construction_core turtlebot3_autorace_core.launch 
```

5. Open terminal and use the command on `Remote PC`
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

#### [Mission 4: Parking](#mission-4-parking)

Parking is the fourth misson of AutoRace. TurtleBot3 should detect the parking sign, and properly park by oneself at a parking lot on the track.

1. Open terminal and use the command on `Remote PC`
```bash
$ export AUTO_IN_CALIB=action
```

2. Open terminal and use the command on `Remote PC`
```
$ roslaunch turtlebot3_autorace_parking_camera turtlebot3_autorace_intrinsic_camera_calibration.launch 
```

3. Open terminal and use the command on `Remote PC`
```
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
```

4. Open terminal and use the command on `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_parking_core turtlebot3_autorace_core.launch 
```

5. Open terminal and use the command on `Remote PC`
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

#### [Mission 5: Stop Bar](#mission-5-stop-bar)

Stop Bar is the fifth mission of AutoRace. TurtleBot3 should detect a level crossing on the track while driving, and stop moving until it opens.

1. Open terminal and use the command on `Remote PC`
```bash
$ export AUTO_IN_CALIB=action
```

2. Open terminal and use the command on `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_stop_bar_camera turtlebot3_autorace_intrinsic_camera_calibration.launch 
```

3. Open terminal and use the command on `Remote PC`
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
```

4. Open terminal and use the command on `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_stop_bar_core turtlebot3_autorace_core.launch 
```

5. Open terminal and use the command on `Remote PC`
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

#### [Mission 6: Tunnel](#mission-6-tunnel)

Tunnel is the sixth mission of AutoRace. TurtleBot3 should go in the tunnel at the track, then go through the tunnel successfully.  

1. Open terminal and use the command on `Remote PC`
```bash
$ export AUTO_IN_CALIB=action
```

2. Open terminal and use the command on `Remote PC`
```bash
$ roslaunch turtlebot3_autorace_tunnel_camera turtlebot3_autorace_intrinsic_camera_calibration.launch 
```

3. Open terminal and use the command on `Remote PC`
```bash
$ export AUTO_EX_CALIB=action
$ export AUTO_DT_CALIB=action
$ export TURTLEBOT3_MODEL=burger
```

4. Open terminal and use the command on `Remote PC`
``` bash
$ roslaunch turtlebot3_autorace_tunnel_core turtlebot3_autorace_core.launch 
```

5. Open terminal and use the command on `Remote PC`
```bash
$ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
```

#### [Run Autonomous Driving](#run-autonomous-driving)

1. From now, all the related nodes will be run in `action mode`. Close all `ROS-related programs` and `terminals` on `Remote PC` and `TurtleBot SBC`, if some were not closed yet. Then, put the robot on the lane correctly.

2. Open new terminal then enter on `Remote PC`. 

    ``` bash
    $ roscore
    ```

3. Open new terminal, then enter the command on `TurtleBot SBC`

    ``` bash
    $ roslaunch turtlebot3_bringup turtlebot3_robot.launch
    ```

4. Open new terminal, then enter the command on `TurtleBot SBC` 

    ``` bash
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_camera_pi.launch
    ```

5. Open new terminal, then enter the command on `Remote PC`

    ``` bash
    $ export AUTO_IN_CALIB=action
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
    ```

6. Open new terminal, then enter the command on`Remote PC`

    ``` bash
    $ export AUTO_EX_CALIB=action
    $ export AUTO_DT_CALIB=action
    $ export TURTLEBOT3_MODEL=burger
    $ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch
    ```

7. Open new terminal, then enter the command on `Remote PC` 

    ``` bash
    $ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
    ```

    turtlebot3_autorace_core will control all system in the package (open and close the launch, nodes in the package.)
