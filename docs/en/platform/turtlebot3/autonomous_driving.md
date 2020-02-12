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

# [Autonomous Driving](#autonomous-driving)

{% capture notice_01 %}
**NOTE**: This instructions were tested on `Ubuntu 16.04` and `ROS Kinetic Kame`.
{% endcapture %}
<div class="notice--info">{{ notice_01 | markdownify }}</div>

The contents in e-Manual may differ from contents of a provided video in e-Manaul as e-Manual is updated on a regular basis.
{: .notice--warning} 

We are currently doing several projects related with the keywords: Autonomous Driving and TurtleBot3s.

## [TurtleBot3 AutoRace](#turtlebot3-autorace)

![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_rbiz_challenge_2017_robots_1.png)

The AutoRace is a competition for autonomous driving robot platforms. To provide various conditions for robot application development, the game gives as less structural regulation as possible. Entire contents are opened in [software](https://github.com/ROBOTIS-GIT/autorace_referee) (source codes for referee system) wise and [hardware](https://github.com/ROBOTIS-GIT/autorace_track) (stp / dwg files of game map) wise.

Whole robots and even the referee system in the field is run by ROS, so it would support to make many kinds of contents further. Get opened source of what is participated in each competitions!

## [TurtleBot3 AutoRace Tutorials](#turtlebot3-autorace-tutorials)

- Source code for the AutoRace tutorial: [turtlebot3_autorace packages][turtlebot3_autorace]

- Tutorial 1: Traffic Light

  <iframe width="560" height="315" src="https://www.youtube.com/embed/yp7MVZCiaWs" frameborder="0" allowfullscreen></iframe>

- Tutorial 2: Lane Tracking

  <iframe width="560" height="315" src="https://www.youtube.com/embed/1RBOfPWdpsc" frameborder="0" allowfullscreen></iframe>

- Tutorial 3: Parking

  <iframe width="560" height="315" src="https://www.youtube.com/embed/ValFotgBfC0" frameborder="0" allowfullscreen></iframe>

- Tutorial 4: Node Optimization

  <iframe width="560" height="315" src="https://www.youtube.com/embed/YpjHOzx432M" frameborder="0" allowfullscreen></iframe>

- Tutorial 5: Level Crossing

  <iframe width="560" height="315" src="https://www.youtube.com/embed/MBDMBq6IDd4" frameborder="0" allowfullscreen></iframe>

- Tutorial 6: Tunnel

  <iframe width="560" height="315" src="https://www.youtube.com/embed/ezkwAs1kVkM" frameborder="0" allowfullscreen></iframe>


### [Tutorials: 1. Requirements](#tutorials-1-requirements)

- `TurtleBot3 Burger`
  - ROS and dependent ROS packages needs to be installed in the robot
  - All functions of TurtleBot3 Burger which is described in [TurtleBot3 E-Manual](http://emanual.robotis.com/docs/en/platform/turtlebot3/overview/) needs to be tested before running TurtleBot3 Auto source code

- `Remote PC (Laptop, Desktop, etc.)`
  - ROS and dependent ROS packages needs to be installed in the computer
  - All functions of TurtleBot3 Burger which is described in [TurtleBot3 E-Manual](http://emanual.robotis.com/docs/en/platform/turtlebot3/overview/) needs to be tested before running TurtleBot3 Auto source code

- `Add-ons on TurtleBot3 Burger`
  - Raspberry Pi Camera Type G (Fisheye Lens) : Available [Here](https://www.waveshare.com/rpi-camera-g.htm)
    - See `Features of 4 screw holes` in the page very carefully before mounting on the frame of any conductive materials
  - Raspberry Pi Camera Mount

<!--
![Picture of mounted Pi Camera]
-->

- `Track structure and Accessories`, such as Traffic Signs, Traffic Lights, and other objects.
  - Get Sources of AutoRace Referee system from [autorace_referee](https://github.com/ROBOTIS-GIT/autorace_referee)
  - Get 3D CAD model data of the race track from [autorace_track](https://github.com/ROBOTIS-GIT/autorace_track)

### [Tutorials: 2. Install AutoRace package](#tutorials-2-install-autorace-package)

`Remote PC & TurtleBot SBC` Open terminal, then install AutoRace package.

``` bash
$ cd ~/catkin_ws/src/
$ git clone https://github.com/ROBOTIS-GIT/turtlebot3_autorace.git
$ cd ~/catkin_ws && catkin_make
```

### [Tutorials: 3. Install Additional Dependent Packages](#tutorials-3-install-additional-dependent-packages)

`Remote PC & TurtleBot SBC` Open new terminal, then enter

``` bash
$ sudo apt-get install ros-kinetic-image-transport ros-kinetic-cv-bridge ros-kinetic-vision-opencv python-opencv libopencv-dev ros-kinetic-image-proc
```

### [Tutorials: 4. Calibration](#tutorials-4-calibration)

#### [Tutorials: 4.1. Camera Imaging Calibration](#tutorials-41-camera-imaging-calibration)

1. `Remote PC` Open new terminal, then enter

    ``` bash
    $ roscore
    ```

2. `TurtleBot SBC` Open new terminal, then enter

    ``` bash
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_camera_pi.launch
    ```

3. `Remote PC` Open new terminal, then enter

    ``` bash
    $ rqt_image_view
    ```

    then, click `/camera/image/compressed` or `/camera/image/` topic in the select box. If everything works fine, the screen should show you the view from the robot.

4. `Remote PC` Open new terminal, then enter

    ``` bash
    $ rosrun rqt_reconfigure rqt_reconfigure
    ```

    then, click `camera`, adjust the parameter value that makes the camera show clean, enough bright image to you. After that, overwrite each values on to the `turtlebot3_autorace_camera/calibration/camera_calibration/camera.yaml`. This will make the camera set its parameters as you set here from next launching.

#### [Tutorials: 4.2. Intrinsic Camera Calibration](#tutorials-42-intrinsic-camera-calibration)

1. `Remote PC` Open new terminal, then enter

    ``` bash
    $ roscore
    ```

2. `TurtleBot SBC` Open new terminal, then enter

    ``` bash
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_camera_pi.launch
    ```

3. `Remote PC` Print checkerboard for camera calibration on A4 size paper. The checkerboard is in `turtlebot3_autorace_camera/data/checkerboard_for_calibration.pdf`. See [Calibration manual](http://wiki.ros.org/camera_calibration) and modify the parameter value written in `turtlebot3_autorace_camera/launch/turtlebot3_autorace_intrinsic_camera_calibration.launch`.

4. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_IN_CALIB=calibration
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
    ```

5. `Remote PC` After finishing the calibration, intrinsic camera calibration file will be saved in `turtlebot3_autorace_camera/calibration/intrinsic_calibration/camerav2_320x240_30fps.yaml`.

#### [Tutorials: 4.3. Extrinsic Camera Calibration](#tutorials-43-extrinsic-camera-calibration)

1. `Remote PC` Open new terminal, then enter

    ``` bash
    $ roscore
    ```

2. `TurtleBot SBC` Open new terminal, then enter

    ``` bash
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_camera_pi.launch
    ```

3. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_IN_CALIB=action
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
    ```

4. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_EX_CALIB=calibration
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera_calibration.launch
    ```

5. `Remote PC` Open new terminal, then enter

    ```
    $ rqt
    ```

    clicking `plugins` -> `visualization` -> `Image view` on the top of the screen will make extra monnitor for camera view. Make 2 extra monitor in the rqt plate by following it. Then, choose `/camera/image_extrinsic_calib/compressed` and `/camera/image_projected_compensated` topics on each of extra monitors. If everything works fine, one of the screen will show the image with red rectangle, and other one will show the ground projected view (bird's eye view) which is based on the one another.

6. `Remote PC` Open new terminal, then enter

    ``` bash
    $ rosrun rqt_reconfigure rqt_reconfigure
    ```

    then, adjust the parameter value in `/camera/image_projection` and `/camera/image_compensation_projection` that carries out visual modifications on the image. The parameter `image_projection` will change the shape of the red rectangle of `/camera/image_extrinsic_calib/compressed` image. Intrinsic camera calibration will transform the image surrounded by the red rectangle, and will show the image that looks from over the lane. After that, overwrite each values on to the `yaml` files in  `turtlebot3_autorace_camera/calibration/extrinsic_calibration/`. This will make the camera set its parameters as you set here from next launching.

#### [Tutorials: 4.4. Settings for Recognition](#tutorials-44-settings-for-recognition)

Until now, all the preprocess of image must have been tested.

1. `Remote PC` Open new terminal, then enter

    ``` bash
    $ roscore
    ```

2. `TurtleBot SBC` Open new terminal, then enter

    ``` bash
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_camera_pi.launch
    ```

3. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_IN_CALIB=action
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
    ```

4. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_EX_CALIB=action
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_extrinsic_camera_calibration.launch
    ```

    From now, the following descriptions will mainly adjust `feature detector / color filter` for object recognition. Every adjustment after here is independent to each other's process. However, to make sure, if you want to adjust each parameters in series, finish every adjustment perfectly, then continue to next.

### [Tutorials: 5. Missions](#tutorials-5-missions)

#### [Tutorials: 5.1 Lane Detection](#tutorials-51-lane-detection)

1. Put the robot on the lane. If you placed the robot correctly, `yellow line` should be placed on the left side of the robot, and of course, `white line` should be placed on the right side of the robot. Make sure that `turtlebot3_robot` node of `turtlebot3_bringup` package is not yet launched. If it is on running, the robot will suddenly runs on the track.


2. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_DT_CALIB=calibration
    $ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_lane.launch
    ```

3. `Remote PC` Open new terminal, then enter

    ```
    $ rqt
    ```

    clicking `plugins` -> `visualization` -> `Image view` on the top of the screen will make extra monnitor for camera view. Make 3 extra monitor in the rqt plate by following it. Then, choose `/detect/image_yellow_lane_marker/compressed`, `/detect/image_lane/compressed` and `/detect/image_white_lane_marker/compressed` topics on each of extra monitors. If everything works fine, left and right screen will show the filtered image of the yellow line and the white line, and the center screen will show the lane of where the robot should go. In the calibration mode, left and right screen will show white, and the center screen may show abnormal result. From here, you should adjust the filter parameters to show up correct lines and the direction.

4. `Remote PC` Open new terminal, then enter

    ``` bash
    $ rosrun rqt_reconfigure rqt_reconfigure
    ```

    then, adjust the parameter value in `/camera/image_projection` and `/camera/image_compensation_projection` that carries out visual modifications on the image. The parameter `image_projection` will change the shape of the red rectangle of `/camera/image_extrinsic_calib/compressed` image. Intrinsic camera calibration will transform the image surrounded by the red rectangle, and will show the image that looks from over the lane. After that, overwrite value on to the `lane.yaml` file in  `turtlebot3_autorace_detect/param/lane/`. This will make the camera set its parameters as you set here from next launching.

    **TIP**: Calibration process of line color filtering is sometimes so-so difficult because of your physical environment which includes the luminance of light in the room, etc. Hence, you should have patience to carry out this procedure. To make everything quickly, put the value of `turtlebot3_autorace_detect/param/lane/lane.yaml` on the reconfiguration parameter, then start calibration. Calibrate hue low - high value at first. (1) Hue value means the color, and every colors, like `yellow`, `white`, have their own region of hue value (refer to hsv map). Then calibrate saturation low - high value. (2) Every colors have also their own field of saturation. Finally, calibrate the lightness low - high value. (3) In the source code, however, have auto-adjustment function, so calibrating lightness low value is meaningless. Just put the lightness high value to 255. Clearly filtered line image will give you clear result of the lane.
    {: .notice--success}

5. `Remote PC` After overwriting the calibration file, close `rqt_rconfigure` and `turtlebot3_autorace_detect_lane`, then enter

    ``` bash
    $ export AUTO_DT_CALIB=action
    $ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_lane.launch
    ```

6. Check if the results come out well by entering

    `Remote PC`

    ``` bash
    $ roslaunch turtlebot3_autorace_control turtlebot3_autorace_control_lane.launch
    ```

    `TurtleBot SBC`

    ``` bash
    $ roslaunch turtlebot3_bringup turtlebot3_robot.launch
    ```

    After entering these commands, the robot will kick-off to run.

#### [Tutorials: 5.2. Traffic Sign](#tutorials-52-traffic-sign)

1. Traffic sign detection needs some pictures of the traffic sign. Take their pictures by using `rqt_image_view` node and edit their size, shape by any of `photo editor` available in linux. The node finds the traffic sign with `SIFT algorithm`, so if you want to use your customized traffic signs ( which is not introduced in the `autorace_track`), just be aware of `More edges in the traffic sign gives better recognition results from SIFT`.

2. Put the robot on the lane. At this time, the traffic sign should be placed to where the robot can see it easily. Make sure that `turtlebot3_robot` node of `turtlebot3_bringup` package is not yet launched. If it is on run, the robot may suddenly run on the track.

3. `Remote PC` Open new terminal, then enter

    ```
    $ rqt_image_view
    ```

    then, click `/camera/image_compensated` topic in the select box. If everything works fine, the screen should show you the view from the robot.

4. `Remote PC` Take the picture by `alt` + `print screen`, edit the captured with your preferred photo editor. After that, place the picture to where the turtlebot3_autorace package you've placed `/turtlebot3_autorace/turtlebot3_autorace_detect/file/detect_sign/` and rename it as you want. (Although, you should change the file name written in the source `detect_sign.py`, if you want to change the default file names.)

5. `Remote PC` Open new terminal, then enter

    ``` bash
    $ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_sign.launch
    ```

6. `Remote PC` Open new terminal, then enter

    ```
    $ rqt_image_view
    ```

    then, click `/detect/image_traffic_sign/compressed` topic in the select box. If everything works fine, the screen will show the result of traffic sign detection, if it succeeds to recognize it.

#### [Tutorials: 5.3. Traffic Light](#tutorials-53-traffic-light)

1. Put the robot on the lane. If you placed the robot correctly, `yellow line` should be placed on the left side of the robot, and of course, `white line` should be placed on the right side of the robot. Make sure that `turtlebot3_robot` node of `turtlebot3_bringup` package is not yet launched. If it is on running, the robot will suddenly runs on the track.

2. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_DT_CALIB=calibration
    $ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_traffic_light.launch
    ```

3. `Remote PC` Open new terminal, then enter

    ```
    $ rqt
    ```

    clicking `plugins` -> `visualization` -> `Image view` on the top of the screen will make extra monnitor for camera view. Make 3 extra monitor in the rqt plate by following it. Then, choose `/detect/image_red_light`, `/detect/image_yellow_light`, `/detect/image_green_light` and `/detect/image_traffic_light` topics on each of extra monitors. If everything works fine, three screen will show the filtered image of the red / yellow / green light, and the other one will show the recognized color with short string. In the calibration mode, three screen will show white, and the other screen may show plain result. From here, you should adjust the filter parameters to show up correct lines and the direction.

4. `Remote PC` Open new terminal, then enter

    ``` bash
    $ rosrun rqt_reconfigure rqt_reconfigure
    ```

    then, adjust the parameter value in `/detect_traffic_light`. Changing the value of color filter will show the change of filtered view on each color's screen. After that, overwrite value on to the `traffic_light.yaml` file in  `turtlebot3_autorace_detect/param/traffic_light/`. This will set its parameters as you set here from next launching.

    `Tip`: same as [5.1 Lane Detection][lane_detection]

5. `Remote PC` After overwriting the calibration file, close `rqt_rconfigure` and `turtlebot3_autorace_detect_traffic_light`, then enter

    ``` bash
    $ export AUTO_DT_CALIB=action
    $ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_traffic_light.launch
    ```

6. Use `rqt_image_view` node, and check if the results come out well

#### [Tutorials: 5.4. Parking Lot](#tutorials-54-parking-lot)

1. `Parking` needs only one preparation, traffic sign recognition.

2. Place the dummy robot on either of parking lot.

3. Place the robot on the lane appropriately.

#### [Tutorials: 5.5. Level Crossing](#tutorials-55-level-crossing)

1. Level Crossing finds 3 red rectangles on the level, and calculates whether the level is opened or closed, and how much near the robot is come.

2. Put the robot on the lane correctly. Then, bring the robot in front of closed level.

3. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_DT_CALIB=calibration
    $ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_level.launch
    ```

4. `Remote PC` Open new terminal, then enter

    ```
    $ rqt
    ```

    clicking `plugins` -> `visualization` -> `Image view` on the top of the screen will make extra monnitor for camera view. Make 3 extra monitor in the rqt plate by following it. Then, choose `/detect/image_level_color_filtered` and `/detect/image_level` topics on each of extra monitors. If everything works fine, three screen will show the filtered image of the red rectangles, and another one will draw a line which connects the rectangles. In the calibration mode, a screen will show white, and the other screen may show plain result. From here, you should adjust the filter parameters to show up correct lines and the direction.

5. `Remote PC` Open new terminal, then enter

    ``` bash
    $ rosrun rqt_reconfigure rqt_reconfigure
    ```

    then, adjust the parameter value in `/detect_level`. Changing the value of color filter will show the change of filtered view on each color's screen. After that, overwrite value on to the `level.yaml` file in  `turtlebot3_autorace_detect/param/level/`. This will set its parameters as you set here from next launching.

    `Tip`: same as [5.1 Lane Detection][lane_detection]

6. `Remote PC` After overwriting the calibration file, close `rqt_rconfigure` and `turtlebot3_autorace_detect_level`, then enter

    ``` bash
    $ export AUTO_DT_CALIB=action
    $ roslaunch turtlebot3_autorace_detect turtlebot3_autorace_detect_level.launch
    ```

7. Use `rqt_image_view` node, and check if the results come out well

#### [Tutorials: 5.6. Tunnel](#tutorials-56-tunnel)

1. Tunnel node will bring you from the entrance to the exit by using turtlebot3 navigation package. What you should calibrate is mapping the tunnel (or if you are using the autorace track as it is, you don't need to modify it by yourself) and check the `pose` of how the robot should be posed right before it comes out from tunnel (this is also unnecessary when you are using the default map).  

2. `Remote PC` Check the `pose` of `exit` on RViz, while the `SLAM` or `Navigation` package is running. After that, overwrite value on to the `detect_tunnel.py` file `line 144`

### [Tutorials: 6. Run Autonomous Driving](#tutorials-6-run-autonomous-driving)

1. From now, all the related nodes will be run in `action mode`. Close all `ROS-related programs` and `terminals` on `Remote PC` and `TurtleBot SBC`, if some were not closed yet. Then, put the robot on the lane correctly.

2. `Remote PC` Open new terminal, then enter

    ``` bash
    $ roscore
    ```

3. `TurtleBot SBC` Open new terminal, then enter

    ``` bash
    $ roslaunch turtlebot3_bringup turtlebot3_robot.launch
    ```

4. `TurtleBot SBC` Open new terminal, then enter

    ``` bash
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_camera_pi.launch
    ```

5. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_IN_CALIB=action
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
    ```

6. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_EX_CALIB=action
    $ export AUTO_DT_CALIB=action
    $ export TURTLEBOT3_MODEL=burger
    $ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch
    ```

7. `Remote PC` Open new terminal, then enter

    ``` bash
    $ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
    ```

    turtlebot3_autorace_core will control all system in the package (open and close the launch, nodes in the package.)


## [TurtleBot3 AutoRace Online Competition](#turtlebot3-autorace-online-competition)

![](/assets/images/platform/turtlebot3/challenges/competition_autorace.png)

- [TurtleBot3 AutoRace](http://emanual.robotis.com/docs/en/platform/turtlebot3/challenges/#online-competition-on-rds)

## [AutoRace RBIZ Challenge 2017](#autorace-rbiz-challenge-2017)

![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_rbiz_challenge_2017_robots_2.png)

- Official release of TurtleBot3 AutoRace

  - [AutoRace Source Code](http://wiki.ros.org/turtlebot3_autorace)
  - [AutoRace Track](https://github.com/ROBOTIS-GIT/autorace_track)
  - [AutoRace Referee System](https://github.com/ROBOTIS-GIT/autorace_referee)

- Participants sources

  | Place | Team              | Source link                                                        |
  |:------|:------------------|:-------------------------------------------------------------------|
  | 1     | RealRiceThief     | [Github](https://github.com/KoG-8/Turtlebot_RealRiceThief)         |
  | 2     | IronHeart         | [Github](https://github.com/kijongGil/Ironheart)                   |
  | 3     | Robit             | [Github](https://github.com/ROBIT-GIT/turtlebot3_autoRace_2017)    |
  | 4     | Loading           | [Github](https://github.com/AuTURBO/autorace2017-team-loading)     |
  | 5     | RunHoney          | [Github](https://github.com/AuTURBO/autorace2017-team-honey)       |
  | 6     | Sherlotics        | [Github](https://github.com/minbaekkim/turtlebot_autorace)         |
  | 7     | FastAndFurious    | [Github](https://github.com/kts006/deu_racer)                      |
  | 8     | BonoBono          | [Github](https://github.com/Gaeul/BonobonoTurtlebot)               |
  | 9     | BeginAgain        | [Github](https://github.com/yh-na/beginagain)                      |
  | 10    | Hanzo             | [Github](https://github.com/DeokYun/autorace)                      |
  | 11    | Codis             | will be released soon                                              |
  | 12    | Zero              | [Github](https://github.com/dongwan123/zero_turtlebot_competition) |
  | 13    | CanDynamix        | [Github](https://github.com/candynamix/can_dynamix)                |
  | 14    | Cena              | retire                                                             |
  | 15    | TogetherChaChaCha | retire                                                             |

### [TurtleBot3 AutoRace 2017 Teaser](#turtlebot3-autorace-2017-teaser)

- Official Teaser #1

  <iframe width="560" height="315" src="https://www.youtube.com/embed/9Wnu8If1eS4" frameborder="0" allowfullscreen></iframe>

- Official Teaser #2

  <iframe width="560" height="315" src="https://www.youtube.com/embed/47YnSBAssOM" frameborder="0" allowfullscreen></iframe>

- Official Final Video

  <iframe width="560" height="315" src="https://www.youtube.com/embed/DWDBAHHQi_k" frameborder="0" allowfullscreen></iframe>

### [TurtleBot3 AutoRace 2017 Challengers](#turtlebot3-autorace-2017-challengers)

- Video - Team RealRiceThief (1st Place)

  <iframe width="560" height="315" src="https://www.youtube.com/embed/szhllE1T_cg" frameborder="0" allowfullscreen></iframe>

- Video - Team Sherlotics (Introduction video)

  <iframe width="560" height="315" src="https://www.youtube.com/embed/dzjsLFj62HE" frameborder="0" allowfullscreen></iframe>

- TurtleBot3 was tested its driving autonomy under the open source from MIT DuckieTown engineering.

  <iframe width="640" height="360" src="https://www.youtube.com/embed/1V33iEu4ylw" frameborder="0" allowfullscreen></iframe>


## [AutoRace RBIZ Challenge 2018](#autorace-rbiz-challenge-2018)

<iframe width="560" height="315" src="https://www.youtube.com/embed/6t6cyFiGLvs?start=100" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

| Place | Team             | Source link                                                               |
|:------|:-----------------|:--------------------------------------------------------------------------|
| 1     | ROBIT            | [Github](https://github.com/developer0hye/2018-Turtlebot3-Autorace-ROBIT) |
| 2     | Au-Di            | [Github](https://github.com/taening/AuDi-GIT-turtlebot3_autorace)         |
| 3     | ROBIT2           | will be released soon                                                     |
| 4     | Wang Bam Ppang   | [Github](https://github.com/Seunghooon/Turtlebot3_autorace_2018)          |
| 5     | Four Leaf Clover | will be released soon                                                     |
| 6     | AuTURBO          | [Github](https://github.com/YeongJunKim/2018-turtlebot3-autorace)         |
| 7     | MATLABurger      | will be released soon                                                     |
| 8     | Eung Chang Ho    | [Github](https://github.com/engcang/Turtlebot3Autorace_Eungchangho_Team)  |
| 9     | ZETIN            | will be released soon                                                     |
| 10    | ROSMASTER        | will be released soon                                                     |

[lane_detection]: #tutorials-41-lane-detection
[turtlebot3_autorace]: https://github.com/ROBOTIS-GIT/turtlebot3_autorace


## [AutoRace with Gazebo](#autorace-with-gazebo)
The AutoRace is provided by Gazebo. We created a environment TurtleBot3 AutoRace 2017 in R-BIZ Challenge.

- Recommended specification

| CPU     | Intel Core i5 / 2 GHz Dual Core Processor      |
| RAM     | 4GB                                            |
| Storage | 20Gb of free hard drive space                  |
| GPU     | NVIDIA GeForce GTX 9 series                    |

**WARNING**: Do not confuse your real camera calibration configure files and Gazebo calibration configure files.
{: .notice--warning}

**NOTE**: The `turtlebot3_autorace` package requires `turtlebot3_simulations` package as a prerequisite. If you did not install it in the [Installation TurtleBot3 Simulations](#simulation), install it first.
{: .notice--info}

1. `Remote PC` Run AutoRace Gazebo. You can see the AutoRace 2017 map in Gazebo.

    ``` bash
    $ roslaunch turtlebot3_gazebo turtlebot3_autorace.launch
    ```

    ![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_map.png)

2. `Remote PC` Run Mission launch. You can see `Traffic Light`, `Parked TurtleBot3` and `Toll Gate` in Gazebo. When TurtleBot3 approaches the mission area, they operate automatically.

    ``` bash
    $ roslaunch turtlebot3_gazebo turtlebot3_autorace_mission.launch
    ```

    ![](/assets/images/platform/turtlebot3/autonomous_driving/autorace_map_mission.png)

3. `Remote PC` Run AutoRace launch. If you want to run AutoRace in real, you have to calibrate your camera.

    ``` bash
    $ export GAZEBO_MODE=true
    $ export AUTO_IN_CALIB=action
    $ roslaunch turtlebot3_autorace_camera turtlebot3_autorace_intrinsic_camera_calibration.launch
    ```

4. `Remote PC` Open new terminal, then enter

    ``` bash
    $ export AUTO_EX_CALIB=action
    $ export AUTO_DT_CALIB=action
    $ export TURTLEBOT3_MODEL=burger
    $ roslaunch turtlebot3_autorace_core turtlebot3_autorace_core.launch
    ```

5. `Remote PC` Open new terminal, then enter

    ``` bash
    $ rostopic pub -1 /core/decided_mode std_msgs/UInt8 "data: 2"
    ```


- Video : AutoRace with Gazebo

  <iframe width="640" height="360" src="https://www.youtube.com/embed/5fZmuPxMZz0" frameborder="0" allowfullscreen></iframe>
